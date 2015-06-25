/*
desc SYS.USER_TABLES --SYS.ALL_TABLES;
desc SYS.user_tab_comments;

desc SYS.user_tab_columns;
desc SYS.user_col_comments;

desc SYS.all_cons_columns;
desc SYS.all_constraints;


select * from all_constraints
where owner = 'JFAS'
   and table_name = 'AAPP'
;

desc SYS.all_cons_columns;
desc SYS.all_constraints;

select * from SYS.all_cons_columns;
select * from SYS.all_constraints where owner = 'JFAS' and table_name = 'AAPP' ;

desc SYS.user_cons_columns;
desc SYS.user_constraints;

select * from SYS.USER_TABLES;

select * from SYS.user_cons_columns where table_name = 'AAPP';
--constraint_name = 'SYS_C0056409';
select * from SYS.USER_TAB_COLUMNS;

select * from SYS.user_constraints where table_name = 'AAPP';
select * from SYS.user_constraints where table_name like ('AAPP%') and (--constraint_name = 'SYS_C0056409'
                                                                  --or 
                                                                  r_constraint_name = 'SYS_C0056409');
                                                                  
*/


--SELECT PARENT_ID, RECORD_ID
-- TABLE_NAME, COLUMN_NAME, DATA_TYPE, COMMENTS, CONSTRAINT_NAME, CONSTRAINT_TYPE, R_TABLE_NAME, T_COLUMN_NAME

--------------------------------------------------------------------------------
SELECT LEVEL,
       --PARENT_ID, RECORD_ID,
       --TABLE_NAME, COLUMN_NAME, DATA_TYPE, COMMENTS, CONSTRAINT_NAME, CONSTRAINT_TYPE, R_TABLE_NAME, T_COLUMN_NAME
       LPAD(' ',10*(LEVEL-1))||
       --DECODE(LEVEL,1,'Table:'||TABLE_NAME, '')
       TABLE_NAME
       ||' '||
       COLUMN_NAME
       --||' '||
       ,DATA_TYPE
       --||' '||
       ,COMMENTS
       ,CONSTRAINT_NAME
       ,CONSTRAINT_TYPE--||R_TABLE_NAME||T_COLUMN_NAME
FROM (
          -- TABLE INFO:
          SELECT  NULL           AS PARENT_ID
                 ,ut.table_name  AS RECORD_ID
                 ,ut.table_name  AS TABLE_NAME
                 ,NULL           AS COLUMN_NAME
                 ,NULL           AS DATA_TYPE
                 ,(select utc.comments
                     from SYS.user_tab_comments utc
                    where ut.table_name = utc.table_name
                   )            AS COMMENTS
                  ,NULL         AS CONSTRAINT_NAME
                  ,NULL         AS CONSTRAINT_TYPE
                  ,NULL         AS R_TABLE_NAME
                  ,NULL         AS T_COLUMN_NAME
            FROM SYS.USER_TABLES ut
           --ORDER BY 2
          UNION  -------------------------------------------------------------------------
          -- COLUMN INFO:
          SELECT utc.table_name  AS PARENT_ID
                ,utc.column_name AS RECORD_ID
                ,NULL            AS TABLE_NAME --,utc.table_name  AS TABLE_NAME
                ,utc.column_name AS COLUMN_NAME
                ,utc.data_type||'('||utc.data_length||')'   AS DATA_TYPE
                ,(select ucc.comments
                    from SYS.user_col_comments ucc
                   where ucc.table_name  = utc.table_name
                     and ucc.column_name = utc.column_name
                 )               AS COMMENTS
                ,NULL            AS CONSTRAINT_NAME
                ,NULL            AS CONSTRAINT_TYPE
                ,NULL            AS R_TABLE_NAME
                ,NULL            AS T_COLUMN_NAME
            FROM SYS.USER_TABLES ut
            JOIN SYS.USER_TAB_COLUMNS utc ON ut.table_name = utc.table_name
          --/*
          UNION --------------------------------------------------------------------------
          -- CONSTRAINT INFO:
          SELECT ucc.column_name     AS PARENT_ID
                ,ucc.constraint_name AS RECORD_ID
                ,NULL                AS TABLE_NAME  --,ucc.table_name      AS TABLE_NAME
                ,NULL                AS COLUMN_NAME --,ucc.column_name     AS COLUMN_NAME
                ,NULL                AS DATA_TYPE
                ,NULL                AS COMMENTS
                ,ucc.constraint_name AS CONSTRAINT_NAME
                ,DECODE( (select uc.constraint_type
                            from SYS.user_constraints uc
                           where ucc.table_name = uc.table_name
                             and ucc.constraint_name = uc.constraint_name
                           --group by uc.constraint_type
                           ),
                              'P', 'P - Primary key',
                              'C', 'C - Check constraint on a table',
                              'U', 'U - Unique key',
                              'R', 'R - Referential integrity',
                              'V', 'V - Check option, on a view',
                              'O', 'O - Read only on a view' ) AS CONSTRAINT_TYPE
                ,--(select 
                   -- from 
                --) 
                NULL AS R_TABLE_NAME
                ,NULL AS T_COLUMN_NAME
            FROM SYS.USER_TABLES ut
            JOIN SYS.USER_TAB_COLUMNS utc ON ut.table_name = utc.table_name
            JOIN SYS.USER_CONS_COLUMNS ucc ON (utc.table_name = ucc.table_name
                                               AND
                                               utc.column_name = ucc.column_name)
        --*/
     )
START WITH PARENT_ID IS NULL
CONNECT BY PRIOR RECORD_ID = PARENT_ID--WHERE TABLE_NAME = 'AAPP'
--ORDER BY 

 ;
-- SYS_C0056409

/*
CONSTRAINT_TYPE (from 11gR2 docs)
C - Check constraint on a table
P - Primary key
U - Unique key
R - Referential integrity (Foreign Key)
V - With check option, on a view
O - With read only, on a view
*/