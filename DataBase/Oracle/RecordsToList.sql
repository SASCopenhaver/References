Morning Justin,
Finally I went through the face-to-face interview.  It is hard for me to be objective, but I think it went fairly well.  One thing I can say that everybody were very nice and professional.  
During the conversation I received a few non-traditional questions that puzzled me a bit.  One of them was asked by a gentleman, whose name skipped from my memory (it starts with “P”).  We had a small chat about the solution.  I came home and ran a few scripts trying to find an answer.  So, could you please be so kind and forward him the file I attached to this email?
Kind regards,
Sergey



-- Hi,
-- Thank you for meeting with me on Friday.  
-- There was a question I could not answer at the time - 
-- how to convert names in records into one comma delimited list of values.  
-- At the meeting, I was thinking about the use of pseudo-columns, 
-- but could not find an answer immediately.
-- I am pretty sure that there are some other resolutions (Oracle is really big…).
-- Please take a look at mine:

SELECT SUBSTR(SYS_CONNECT_BY_PATH(ename,','),2) AS name_list
  FROM (-- 2:
        Select rownum as record_id, 
               ename,
               rownum+1 as parent_id
          From (-- 1:
                 select ename 
                   from emp 
                  order by 1 desc
               )
       )
WHERE record_id = (select MIN(rownum) from emp)
START WITH parent_id = (select max(rownum)+1 from emp) --15
CONNECT BY PRIOR record_id = parent_id;




