--Connect q42admin/q42admin@EVDBTEST
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
DROP TABLE POTENTIAL_ANSWERS;
COMMIT;
-- Create table
create table POTENTIAL_ANSWERS
(
  ANSWER_TYPE    CHAR(2) not null,
  ANSWER_LITERAL CHAR(1) not null,
  ANSWER_NUMERIC NUMBER(10) not null
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table POTENTIAL_ANSWERS
  add primary key (ANSWER_TYPE,ANSWER_LITERAL,ANSWER_NUMERIC)
  using index 
;

insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T1', 'A', 2);
insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T1', 'B', 1);
insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T1', 'C', 0);
insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T1', 'D', -1);
insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T1', 'E', -2);
insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T2', 'A', -2);
insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T2', 'B', -1);
insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T2', 'C', 0);
insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T2', 'D', 1);
insert into POTENTIAL_ANSWERS (ANSWER_TYPE, ANSWER_LITERAL, ANSWER_NUMERIC)
values ('T2', 'E', 2);
commit;

