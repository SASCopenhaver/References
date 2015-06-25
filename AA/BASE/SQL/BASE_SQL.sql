prompt PL/SQL Developer import file
prompt Created on Tuesday, January 04, 2005 by Sergey Surikov
set feedback off
set define off
prompt Creating CODE_LK...
create table CODE_LK
(
  ITEM      VARCHAR2(20) not null,
  ITEM_CD   VARCHAR2(20) not null,
  ITEM_DESC VARCHAR2(200) not null
)
tablespace BASE
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 40K
    next 40K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt Creating ROLES...
create table ROLES
(
  R_ID   NUMBER,
  R_NM   VARCHAR2(10),
  R_DESC VARCHAR2(200)
)
tablespace BASE
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 40K
    next 40K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt Creating SECURITY_TREE...
create table SECURITY_TREE
(
  ST_ID        NUMBER,
  ST_NM        VARCHAR2(50),
  ST_LOC       VARCHAR2(2),
  ST_PARENT_ID NUMBER,
  ST_IS_ACT    VARCHAR2(1) default 'A',
  ST_SEQ       NUMBER,
  ST_CALL_FILE VARCHAR2(100)
)
tablespace BASE
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 40K
    next 40K
    minextents 1
    maxextents 505
    pctincrease 50
  );
comment on column SECURITY_TREE.ST_NM
  is 'Name';
comment on column SECURITY_TREE.ST_LOC
  is 'Access to the page through the NAVIGATION located at... navigation symbol see in CODE_LK';
comment on column SECURITY_TREE.ST_PARENT_ID
  is 'If "0", then Global menu.';
comment on column SECURITY_TREE.ST_IS_ACT
  is 'Is this Item active? A - active, I - inactive';
comment on column SECURITY_TREE.ST_SEQ
  is 'Sequence in which Navigation link should appear on the screen.';

prompt Creating SECURITY_TREE_ROLES...
create table SECURITY_TREE_ROLES
(
  STR_ST_ID NUMBER,
  STR_R_ID  NUMBER
)
tablespace BASE
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 40K
    next 40K
    minextents 1
    maxextents 505
    pctincrease 50
  );

prompt Creating USR...
create table USR
(
  USR_ID     NUMBER,
  USR_PRX    VARCHAR2(10),
  USR_FNAME  VARCHAR2(50),
  USR_MI     VARCHAR2(50),
  USR_LNAME  VARCHAR2(50),
  USR_SFX    VARCHAR2(10),
  USR_IS_ACT VARCHAR2(1) default 'A',
  USR_UNAME  VARCHAR2(10),
  USR_PASS   VARCHAR2(10),
  USR_ROLE   NUMBER
)
tablespace BASE
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 40K
    next 40K
    minextents 1
    maxextents 505
    pctincrease 50
  );
comment on column USR.USR_IS_ACT
  is '"A" for Active User, "I" fro Inactive User';

prompt Loading CODE_LK...
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'GL', 'Global Menu (ID = 101-999)');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'SG', 'Sub-Global Menu (ID=201-299)');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'UT', 'Utility Menu (ID=301-399)');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'SL', 'Section Links (ID=401-499)');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'RL', 'Related Links (ID=501-599)');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'BC', 'Breadcrumb (ID=601-699)');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'SI', 'Site Information (in Footer ID=701-799)');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'AD', 'Advertisement Section (ID=801-899 )');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PHONE', 'HM', 'Home phone');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PHONE', 'WK', 'Work phone');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PHONE', 'CL', 'Cell phone');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PHONE', 'FX', 'Fax');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('ADDRESS', 'PR', 'Address belongs to the Person');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('ADDRESS', 'OR', 'Address belongs to the Organization');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('EMAIL', 'PR', 'E-Mail belongs to the person');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('EMAIL', 'OR', 'E-Mail belongs to the organization');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'LI', 'Log In page');
commit;
prompt 17 records loaded
prompt Loading ROLES...
insert into ROLES (R_ID, R_NM, R_DESC)
values (0, 'ANONYM', 'Anonymous user');
insert into ROLES (R_ID, R_NM, R_DESC)
values (1, 'ADMIN_DEV', 'Developer');
commit;
prompt 2 records loaded
prompt Loading SECURITY_TREE...
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (101, 'HOME', 'GL', 0, 'A', 10, 'Home.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (201, 'About Us', 'SG', 101, 'A', 10, 'AboutUs.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (1001, 'Log In', 'LI', 0, 'A', 10, 'LogIn.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (301, 'Log Out', 'UT', 0, 'A', 30, 'LogIn.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (302, 'Edit Roles', 'UT', 0, 'A', 10, 'EditROLE.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (303, 'Edit User', 'UT', 0, 'A', 20, 'EditUSER.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (202, 'Test', 'SG', 101, 'A', 1, 'AboutUs.cfm');
commit;
prompt 7 records loaded
prompt Loading SECURITY_TREE_ROLES...
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 0);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (201, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (201, 0);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 0);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (301, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (302, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (303, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (202, 1);
commit;
prompt 9 records loaded
prompt Loading USR...
insert into USR (USR_ID, USR_PRX, USR_FNAME, USR_MI, USR_LNAME, USR_SFX, USR_IS_ACT, USR_UNAME, USR_PASS, USR_ROLE)
values (1, 'Mr.', 'SERGEY', 'A', 'SURIKOV', null, 'A', 'sasurikov', 'sas', 1);
commit;
prompt 1 records loaded
set feedback on
set define on
prompt Done.
