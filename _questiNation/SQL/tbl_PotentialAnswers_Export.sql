prompt PL/SQL Developer import file
prompt Created on Wednesday, October 16, 2002 by SquaredCircle
set feedback off
set define off
prompt Creating POTENTIAL_ANSWERS...
create table POTENTIAL_ANSWERS
(
  ANSWER_TYPE    CHAR(2) not null,
  ANSWER_LITERAL CHAR(1) not null,
  ANSWER_NUMERIC NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
alter table POTENTIAL_ANSWERS
  add primary key (ANSWER_TYPE,ANSWER_LITERAL,ANSWER_NUMERIC)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );

prompt Disabling triggers for POTENTIAL_ANSWERS...
alter table POTENTIAL_ANSWERS disable all triggers;
prompt Truncating POTENTIAL_ANSWERS...
truncate table POTENTIAL_ANSWERS;
prompt Loading POTENTIAL_ANSWERS...
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
prompt 10 records loaded
prompt Enabling triggers for POTENTIAL_ANSWERS...
alter table POTENTIAL_ANSWERS enable all triggers;
set feedback on
set define on
prompt Done.
