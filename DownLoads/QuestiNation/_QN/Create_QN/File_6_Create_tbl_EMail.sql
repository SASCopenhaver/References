-- Create table
create table EMAIL
(
  IDS      NUMBER not null,
  PRJID    NUMBER not null,
  MSG      VARCHAR2(1000) not null,
  URL_ADDR VARCHAR2(50) not null,
  ADMINID  NUMBER not null
);
-- Add comments to the columns 
comment on column EMAIL.PRJID
  is 'If PrjID=0, means Initial Msg';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EMAIL
  add constraint PK_EMAIL primary key (IDS)
  using index 
 ;
