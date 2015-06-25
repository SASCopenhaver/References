-- Create table
create table EVAL_COMMENTS
(
  EVAL_PRJID    NUMBER not null,
  EVAL_COMMENTS VARCHAR2(4000) default 'Please provide your comments ...' not null
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table EVAL_COMMENTS
  add constraint PK_EVAL_COMMENTS primary key (EVAL_PRJID)
  using index 
  ;
