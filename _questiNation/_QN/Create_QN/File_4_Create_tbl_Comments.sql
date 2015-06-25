-- Create table
create table COMMENTS
(
  PRJ_ID   NUMBER not null,
  USER_ID  NUMBER not null,
  Q_NUM    NUMBER not null,
  COMMENTS VARCHAR2(4000)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table COMMENTS
  add constraint PK_COMMENTS primary key (PRJ_ID,USER_ID,Q_NUM)
  using index 
;
