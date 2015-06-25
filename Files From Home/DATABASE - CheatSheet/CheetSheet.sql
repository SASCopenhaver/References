select * from emp;
select * from dept;

-- MGRs+EMPs
select e1.empno, e1.ename, e1.job, e2.empno, e2.ename, e2.job 
from emp e1
    ,emp e2
where e1.job='MANAGER'
  and e1.empno = e2.mgr
order by e1.ename
;--------------------------------------------------------
-- SUM(e.sal), AVG(e.sal), Min(e.sal), Max(e.sal) by DEPT
select d.deptno, d.dname, 
       SUM(e.sal), AVG(e.sal), Min(e.sal), Max(e.sal)
  from dept d
      ,emp e
where e.deptno = d.deptno
-- having Count(e.deptno) > 5
group by d.deptno, d.dname
;
--24 ---------------------------------------------------
select d.deptno, d.dname, sum(e.sal)
  from dept d
      ,emp e
 where d.deptno = e.deptno
 having sum(e.sal)> (select sum(e1.sal)
                      from emp e1)/3
 group by d.deptno, d.dname
;------------------------------------------------------
--25 --------------------------------------------
select e.empno, e.ename, e.sal
  from emp e
 where e.deptno is not NULL
 and e.sal = (select Max(e2.sal)
                   from emp e2
                   where e2.deptno = e.deptno)
;------------------------------------------------------
select * from emp;
select e.deptno, e.job, avg(sal), sum(sal)
  from emp e
 where e.job != 'VP'
group by rollup (e.deptno, e.job)
;


select area_name, area_width, area_height, screen_id, area_order, area_type, area_alignment, area_style, area_class, tab_name, area_widget_align, frame, default_area 
from sg_area_t a1
where rowid > (select min(rowid) 
                 from sg_area_t a2
                 where a1.area_name = a2.area_name
                   and a1.screen_id = a2.screen_id
              )
;
select * from user_tables;

select* from USER_TAB_COLUMNS u
where u.column_name = UPPER('equipment_ptr');
