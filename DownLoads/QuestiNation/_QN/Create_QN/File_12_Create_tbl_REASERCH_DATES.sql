-- Create table
create table REASERCH_DATES
(
  IDS              NUMBER(10) not null,
  DESCRIPTIONS     VARCHAR2(255) not null,
  START_DATE       DATE not null,
  END_DATE         DATE not null,
  ANYBODY_ANSWERED CHAR(1) default 'A',
  PRJ_SUPER_ID     NUMBER not null
);
-- Add comments to the columns 
comment on column REASERCH_DATES.ANYBODY_ANSWERED
  is 'Column should called ''ACT_INACT''.  Status ''I'' - inactive will be assigned to Archived projects and default ''A'' to active (NOT ARCHAIVED) projects';
-- Create/Recreate primary, unique and foreign key constraints 
alter table REASERCH_DATES
  add primary key (IDS)
  using index 
  ;
