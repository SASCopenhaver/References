-- Create table
create table COMMENTS_TEMP
(
  UUID      VARCHAR2(50) not null,
  PRJID     NUMBER not null,
  SEQ       VARCHAR2(5),
  NORMABBR  VARCHAR2(3),
  NORMDESCR VARCHAR2(4000)
);
-- Add comments to the columns 
comment on column COMMENTS_TEMP.SEQ
  is 'Sequence the data will be retrieved';
