-- Create table
create table EVAL_QUESTIONS
(
  IDS     NUMBER not null,
  DESCR   VARCHAR2(200) not null,
  SUPERID NUMBER not null
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table EVAL_QUESTIONS
  add constraint PK_QUESTIONS primary key (IDS)
  using index 
  ;
