-- Hi,
-- Thank you for meeting with me on Friday.  
-- There was a question I could not answer at the time - 
-- how to convert names in records into one comma delimited list of values.  
-- I was thinking about the use of pseudo-columns, but could not find an answer immediately. 
-- I am pretty sure that there are some other resolutions (Oracle is really big…).
-- Please take a look at my solution:

SELECT SUBSTR(SYS_CONNECT_BY_PATH(ename,','),2) AS name_list
  FROM (-- 2:
        Select rownum as empno,ename,rownum+1 as mgr
          From (-- 1:
                 select ename 
                  from emp 
                  order by 1 desc
               )
       )
WHERE empno = (select MIN(rownum) from emp)
START WITH mgr = (select max(rownum)+1 from emp) --15
CONNECT BY PRIOR empno = mgr;




