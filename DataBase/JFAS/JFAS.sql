select * 
--from user_col_comments

from user_tab_comments
--from ALL_TAB_COLUMNS 
----from all_tables
WHERE 
--OWNER = 'JFAS'
--and 
table_name = 'AAPP'
and column_name = 'AAPP_NUM'
order by table_name
;


SELECT t.table_name, utc.comments, ucc.column_name, ucc.comments
  FROM SYS.ALL_TABLES t
  JOIN SYS.user_tab_comments utc ON t.table_name = utc.table_name
  JOIN SYS.user_col_comments ucc ON t.table_name = ucc.table_name
 WHERE t.owner = 'JFAS'
   AND t.table_name = 'AAPP'
ORDER BY t.table_name, ucc.column_name
;
   
   
   
   
   
   
   
   