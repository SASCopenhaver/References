-- Create table
create table EVAL_QUESTIONS
(
  IDS     NUMBER not null,
  DESCR   VARCHAR2(200) not null,
  SUPERID NUMBER not null
)
tablespace PHONEBOOK
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 304K
    next 304K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table EVAL_QUESTIONS
  add constraint PK_QUESTIONS primary key (IDS)
  using index 
  tablespace PHONEBOOK
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 304K
    next 304K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
