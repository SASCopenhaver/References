-- Create table
create table USERS
(
  IDS       NUMBER not null,
  FNAME     VARCHAR2(20) not null,
  LNAME     VARCHAR2(20) not null,
  PASS      VARCHAR2(10) not null,
  EMAIL     VARCHAR2(100),
  ACT_INACT CHAR(1) default 'A' not null,
  ORG_ID    NUMBER not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table USERS
  add constraint PK_USERS primary key (IDS)
  using index 
  ;
