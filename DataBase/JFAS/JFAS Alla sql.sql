select * 
from SYS.all_views
where owner = 'SYS'
 and  view_name like 'USER%'
 order by 2
 
select * 
from SYS.all_views
where owner = 'SYS'
 and  view_name like 'USER_%CONS%'
 order by 2

select * from USER_CATALOG;
select * from SYS.USER_TAB_COMMENTS;
select * from USER_COL_COMMENTS;

select * from USER_CONSTRAINTS;
select * from USER_CONS_COLUMNS;
select * from USER_TAB_COLUMNS;

select 'TABLE',user_tab_columns.table_name, user_tab_columns.column_name,user_tab_columns.data_type||' '|| user_tab_columns.data_length "Data Type" ,
user_cons_columns.constraint_name,USER_CONSTRAINTS.constraint_type,NULLABLE, user_col_comments.comments
from USER_TAB_COLUMNS,USER_CONS_COLUMNS,USER_COL_COMMENTS, USER_CONSTRAINTS
where user_tab_columns.column_name = user_cons_columns.column_name and 
user_tab_columns.table_name  = user_cons_columns.table_name and 
user_tab_columns.column_name = USER_COL_COMMENTS.column_name and 
user_tab_columns.table_name  = USER_COL_COMMENTS.table_name  and
USER_TAB_COLUMNS.table_name = USER_CONSTRAINTS.table_name and 
USER_CONSTRAINTS.constraint_name  = user_cons_columns.constraint_name 
union
select 'TABLE',user_tab_columns.table_name, user_tab_columns.column_name,  '','','',NULLABLE, user_col_comments.comments
from USER_TAB_COLUMNS,USER_COL_COMMENTS
where user_tab_columns.column_name = USER_COL_COMMENTS.column_name(+) and 
user_tab_columns.table_name  = USER_COL_COMMENTS.table_name(+)  and
user_tab_columns.column_name not in (select user_cons_columns.column_name from USER_CONS_COLUMNS )
union
select user_catalog.table_type,table_name , '','','','' ,'',''
from USER_CATALOG
where table_type != 'TABLE'
order by 1,2,3 ;