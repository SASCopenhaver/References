-- Create table
create table POTENTIAL_ANSWERS
(
  ANSWER_TYPE    CHAR(2) not null,
  ANSWER_LITERAL CHAR(1) not null,
  ANSWER_NUMERIC NUMBER(10) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table POTENTIAL_ANSWERS
  add primary key (ANSWER_TYPE,ANSWER_LITERAL,ANSWER_NUMERIC)
  using index 
  ;
