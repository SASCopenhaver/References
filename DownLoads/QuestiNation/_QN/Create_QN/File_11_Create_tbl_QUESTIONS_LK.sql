-- Create table
create table QUESTIONS_LK
(
  IDS         NUMBER(10) not null,
  Q_TEXT      VARCHAR2(200) not null,
  ANSWER_TYPE CHAR(2) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table QUESTIONS_LK
  add primary key (IDS)
  using index 
  ;
alter table QUESTIONS_LK
  add unique (IDS);
alter table QUESTIONS_LK
  add unique (Q_TEXT)
  using index 
  ;
