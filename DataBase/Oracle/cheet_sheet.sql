select * from emp order by sal desc;
select * from dept;
----------------------------------------------
-- Q15:  All employees, all departments
SELECT e.EMPLOYEE_ID, e.First_name||' '||e.LAST_NAME AS "FULL NAME",
       d.DEPARTMENT_ID, d.DEPARTMENT_NAME
  FROM EMPLOYEES e, DEPARTMENTS d
 WHERE e.DEPARTMENT_ID(+) = d.DEPARTMENT_ID
UNION 
SELECT e.EMPLOYEE_ID, e.First_name||' '||e.LAST_NAME AS "FULL NAME",
       d.DEPARTMENT_ID, d.DEPARTMENT_NAME
  FROM EMPLOYEES e, DEPARTMENTS d
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID(+);
----------------------------------------------
-- MGR with EMPs
SELECT m.EMPLOYEE_ID, m.First_name||' '||m.LAST_NAME AS "FULL NAME",
       e.MANAGER_ID, e.EMPLOYEE_ID, e.First_name||' '||e.LAST_NAME AS "FULL NAME"
  FROM EMPLOYEES m, EMPLOYEES e
 WHERE m.EMPLOYEE_ID = e.MANAGER_ID
 ORDER BY m.LAST_NAME;
----------------------------------------------
-- DEPT + SAL with Count(emp)>5
SELECT e.DEPTNO, d.dname, SUM(e.sal)
  FROM emp e
  JOIN dept d on e.deptno = d.deptno
GROUP BY e.deptno, d.dname
HAVING Count(*) > 5;
---------------------------------------------
--DEPT with total SAL  >  1/3 of company
SELECT e.deptno, SUM(e.sal)
  FROM emp e
GROUP BY e.deptno
HAVING SUM(e.sal) > (select SUM(sal)
                       from emp)/3;
---------------------------------------------
-- EMP with MAX(sal) by DEPTNO
select * from emp order by deptno;
SELECT e.deptno, d.dname, e.ename, e.sal
  FROM emp e
  INNER JOIN dept d ON e.deptno = d.deptno
 WHERE e.sal = ( select Max(e2.sal)
                   from emp e2
                  where e.deptno = e2.deptno
                   group by e2.deptno );
--------------------------------------------
-- CUBE and ROLLUP
SELECT job, to_char(hiredate,'YYYY'), Count(*)
  FROM emp
GROUP BY ROLLUP(job, to_char(hiredate,'YYYY'));

SELECT job, to_char(hiredate,'YYYY'), Count(*)
  FROM emp
GROUP BY CUBE(job, to_char(hiredate,'YYYY'));
-------------------------------------------
DECLARE
v_String VARCHAR2(100) DEFAULT 'H World';
BEGIN
  dbms_output.put_line(v_String);
END;
------------------------------------------
-- 2nd highest salary
SELECT MAX(e1.sal)
  FROM emp e1
 WHERE e1.sal < (select Max(e2.sal) from emp e2 );
------------------------------------------


