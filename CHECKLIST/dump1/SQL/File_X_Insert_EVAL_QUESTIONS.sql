prompt PL/SQL Developer import file
prompt Created on Wednesday, November 12, 2003 by Sergey Surikov
set feedback off
set define off
prompt Creating EVAL_QUESTIONS...
create table EVAL_QUESTIONS
(
  IDS     NUMBER not null,
  DESCR   VARCHAR2(200) not null,
  SUPERID NUMBER not null
)
tablespace PHONEBOOK
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 304K
    next 304K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
alter table EVAL_QUESTIONS
  add constraint PK_QUESTIONS primary key (IDS)
  using index 
  tablespace PHONEBOOK
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 304K
    next 304K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Disabling triggers for EVAL_QUESTIONS...
alter table EVAL_QUESTIONS disable all triggers;
prompt Truncating EVAL_QUESTIONS...
truncate table EVAL_QUESTIONS;
prompt Loading EVAL_QUESTIONS...
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (1, 'COMMUNICATION/WORKING RELATIONSHIPS', 1);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (2, 'PROGRAM CONTENT', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (3, 'TIMELINESS', 3);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (4, 'PRESENTATION', 4);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (5, 'FUNDING/BUDGETING', 5);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (101, 'Quality of initial discussion with DOS PO on project goals/ideas', 1);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (102, 'Consultation with DOS PO in decision-making process', 1);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (103, 'Initiative/competence in carrying out program planning without excessive DOS PO intercession', 1);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (104, 'Responsiveness to changes, crisises and/or complex programmatic/logistical challenges/requirements', 1);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (105, 'Understanding of the program type (Grantee/VOLVIS/Group/YAL, etc.) and its specific parameters', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (106, 'Inclusion of professional appointments that were on-target/relevant to Embassy''s, visitor''s, and ECA/PE/V''s objectives', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (107, 'Inclusion of professional appointments that demonstrated knowledge of resources in the visitor''s field', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (108, 'Inclusion of professional appointments that were creative', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (109, 'Inclusion of professional appointments that were non-repetitive', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (110, 'Inclusion of ideological balance and range of views on project themes', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (111, 'Inclusion of geographic and socio-cultural diversity', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (112, 'Balance of presentations and site visits', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (113, 'Cultural exposure (touristic/artistic/athletic)', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (114, 'Home hospitality and/or other informal contacts with Americans', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (115, 'School visits and/or other formal or informal speaking opportunities', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (116, 'Suitable pacing', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (117, 'Other (team splits, shadowing experiences, media exposure, etc.)', 2);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (118, 'Promptness of project assignment to a program team, given the specific program needs and lead time provided by DOS', 3);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (119, 'Initiation of program planning well enough in advance, given the lead time provided by DOS', 3);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (120, 'Submission of program outlined for review by DOS PO per ECA/PE/V''s established schedule', 3);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (121, 'Submission of final program booklet in accordance with ECA/PE/V''s established schedule', 3);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (122, 'Completeness/accuracy/appropriateness of biographic information prepared by the PA', 4);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (123, 'Conformity of program booklet to ECA/PE/V''s written guidelines', 4);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (124, 'PA''s presentation of program information to the IVs during the opening session', 4);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (125, 'Attention to cost/benefit factors in making programming/logistical decisions', 5);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (126, 'Final accounting of project expenditures that was timely', 5);
insert into EVAL_QUESTIONS (IDS, DESCR, SUPERID)
values (127, 'Final accounting of project expenditures that was accurate', 5);
commit;
prompt 32 records loaded
prompt Enabling triggers for EVAL_QUESTIONS...
alter table EVAL_QUESTIONS enable all triggers;
set feedback on
set define on
prompt Done.
