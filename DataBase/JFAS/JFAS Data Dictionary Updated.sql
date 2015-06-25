
PARENT_ID, -- NULL / TABLE_NAME / COLUMN_NAME / CONSTRAINT_NAME
RECORD_ID, --        TABLE_NAME / COLUMN_NAME / CONSTRAINT_NAME
VAL_TO_SHOW
DATA_TYPE||DATA_LENGTH  --
COMMENTS
CONSTRAINT_NAME
CONSTRAINT_TYPE
R_TABLE_NAME
R_COLUMN_NAME
--==============================================================================

desc SYS.USER_TABLES;        select * from SYS.USER_TABLES; 
desc SYS.USER_TAB_COMMENTS;  select * from SYS.USER_TAB_COMMENTS;

desc SYS.USER_VIEWS;         select * from SYS.USER_VIEWS;

desc SYS.USER_TAB_COLUMNS;   select * from SYS.USER_TAB_COLUMNS;
desc SYS.USER_COL_COMMENTS;  select * from SYS.USER_COL_COMMENTS;

desc SYS.USER_CONS_COLUMNS;  select * from SYS.USER_CONS_COLUMNS;
desc SYS.USER_CONSTRAINTS;    select * from SYS.USER_CONSTRAINTS;

--==============================================================================

SELECT  LEVEL
       --,PARENT_ID
       --,RECORD_ID
       ,LPAD(' ',10*(LEVEL-1))||VAL_TO_SHOW
       ,DATA_TYPE_LENGTH
       ,COMMENTS
  FROM (
            -- TABLE INFO:------------------------------------------------------
            SELECT 'JFAS'        AS PARENT_ID
                  ,ut.table_name AS RECORD_ID 
                  ,'('||utc.table_type||') '||ut.table_name AS VAL_TO_SHOW
                  ,NULL          AS DATA_TYPE_LENGTH
                  ,utc.comments  AS COMMENTS
              FROM SYS.USER_TABLES ut
              JOIN SYS.USER_TAB_COMMENTS utc ON utc.table_name = ut.table_name
            --------------------------------------------------------------------
            UNION 
            -- VIEWS INFO:------------------------------------------------------
            SELECT DISTINCT 'JFAS' AS PARENT_ID
                  ,uv.view_name    AS RECORD_ID
                  ,'('||utc.table_type||' ) '||uv.view_name AS VAL_TO_SHOW
                  ,NULL            AS DATA_TYPE_LENGTH
                  ,utc.comments    AS COMMENTS
              FROM SYS.USER_VIEWS uv
              JOIN SYS.USER_TAB_COMMENTS utc ON (utc.table_name = uv.view_name
                                                 AND
                                                 utc.table_type = 'VIEW')
            --------------------------------------------------------------------
            UNION
            -- COLUMNS INFO:----------------------------------------------------
            SELECT utc.table_name  AS PARENT_ID
                  ,utc.column_name AS RECORD_ID
                  ,utc.column_name AS VAL_TO_SHOW
                  ,utc.data_type||' ('||utc.data_length||')' AS DATA_TYPE_LENGTH
                  ,ucc.comments
              FROM SYS.USER_TAB_COLUMNS utc
              JOIN SYS.USER_COL_COMMENTS ucc ON (ucc.table_name = utc.table_name
                                                 AND 
                                                 ucc.column_name = utc.column_name)
            --------------------------------------------------------------------
            UNION
            -- 
            SELECT ucc.column_name     AS PARENT_ID
                  ,ucc.constraint_name AS RECORD_ID
                  /*
                  ,ucc.constraint_name||' '||DECODE(uc.constraint_type,
                                                    'P', 'P - Primary key',
                                                    'C', 'C - Check constraint on a table',
                                                    'U', 'U - Unique key',
                                                    'R', 'R - Referential integrity',
                                                    'V', 'V - Check option, on a view',
                                                    'O', 'O - Read only on a view',
                                                    '') AS VAL_TO_SHOW
                  ,NULL AS DATA_TYPE_LENGTH
                  */
                  ,ucc.constraint_name AS VAL_TO_SHOW
                  ,DECODE(uc.constraint_type,
                                             'P', 'P - Primary key',
                                             'C', 'C - Check constraint on a table',
                                             'U', 'U - Unique key',
                                             'R', 'R - Referential integrity',
                                             'V', 'V - Check option, on a view',
                                             'O', 'O - Read only on a view',
                                             '')  AS DATA_TYPE_LENGTH
                  ,NULL AS COMMENTS
              FROM SYS.USER_CONS_COLUMNS ucc
              JOIN SYS.USER_CONSTRAINTS uc ON (uc.table_name = ucc.table_name
                                               AND
                                               uc.constraint_name = ucc.constraint_name)
       )
START WITH PARENT_ID = 'JFAS'
CONNECT BY PRIOR RECORD_ID = PARENT_ID
;
  