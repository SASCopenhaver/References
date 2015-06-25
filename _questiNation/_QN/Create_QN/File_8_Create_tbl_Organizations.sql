-- Create table
create table ORGANIZATIONS
(
  IDS          NUMBER(10) not null,
  ABBREVIATION VARCHAR2(10) not null,
  FULL_NAME    VARCHAR2(100) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ORGANIZATIONS
  add constraint PK_ORGANIZATION_ID primary key (IDS)
  using index 
  ;
alter table ORGANIZATIONS
  add unique (ABBREVIATION)
  using index 
  ;
alter table ORGANIZATIONS
  add unique (FULL_NAME)
  using index 
  ;
