prompt PL/SQL Developer import file
prompt Created on Wednesday, October 16, 2002 by SquaredCircle
set feedback off
set define off
prompt Creating MENUS...
create table MENUS
(
  IDS                   NUMBER(10) not null,
  MENU_ITEM             VARCHAR2(100) not null,
  SUPER_MENU            NUMBER not null,
  MENU_DESCRIPTION      VARCHAR2(200) not null,
  PAGE_TO_BE_CALLED     VARCHAR2(50) not null,
  IMG                   VARCHAR2(50),
  ORDER_TO_BE_PRESENTED NUMBER not null,
  MENU_OWNERSHIP        VARCHAR2(15)
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
alter table MENUS
  add constraint PK_MENUS primary key (IDS)
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

prompt Disabling triggers for MENUS...
alter table MENUS disable all triggers;
prompt Truncating MENUS...
truncate table MENUS;
prompt Loading MENUS...
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (MENU_ID.NextVal, 'Questionnaire', 0, 'Questionnaire', 'Questionnaire.cfm', 'Img/Q.jpg', 1, 'NobodyNow');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (MENU_ID.NextVal, 'Personal Profile', 0, 'Create/Edit Personal Profile', 'EditorPersonalProfile.cfm', 'Img/EditUser.jpg', 2, 'PARTICIPANT');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (MENU_ID.NextVal, 'Questionnaire', 0, 'Questionnaire', 'Questionnaire.cfm', 'Img/Q.jpg', 1, 'SUPERORG');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (MENU_ID.NextVal, 'Participant Profiles', 0, 'Create/Edit Profile(s)', 'EditorUsersByAPPADMIN.cfm', 'Img/EditUser.jpg', 2, 'SUPERORG');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (MENU_ID.NextVal, 'Reports', 0, 'Generate Custom Reports', 'Reports.cfm', 'Img/Reports.jpg', 1, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (MENU_ID.NextVal, 'Project Editor', 0, 'Create/Edit Projects', 'EditorProjects.cfm', 'Img/EditorProjects.jpg', 2, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (MENU_ID.NextVal, 'Assign Participants', 0, 'Assign Participants to the Project(s)', 'AssignParticipants.cfm', 'Img/AssignParticipants.jpg', 3, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (MENU_ID.NextVal, 'Admin All Participants', 0, 'Create/Edit All Participants', 'EditorUsersByAPPADMIN.cfm', 'Img/EditUser.jpg', 4, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (MENU_ID.NextVal, 'Organization Editor', 0, 'Create/Edit Organizations', 'EditorOrgs.cfm', 'Img/EditorOrgs.jpg', 5, 'APPADMIN');
commit;
prompt 9 records loaded
prompt Enabling triggers for MENUS...
alter table MENUS enable all triggers;
set feedback on
set define on
prompt Done.
