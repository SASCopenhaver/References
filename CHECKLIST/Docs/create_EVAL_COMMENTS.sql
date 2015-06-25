-- Create table
create table EVAL_COMMENTS
(
  EVAL_PRJID    NUMBER not null,
  EVAL_COMMENTS VARCHAR2(4000) default 'Please provide your comments ...' not null
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
alter table EVAL_COMMENTS
  add constraint PK_EVAL_COMMENTS primary key (EVAL_PRJID)
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
