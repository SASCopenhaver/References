
alter table MENUS disable all triggers;

delete from MENUS;
commit;

insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (84, 'Questionnaire', 0, 'Questionnaire', 'Questionnaire.cfm', 'Img/Q.jpg', 1, 'NobodyNow');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (85, 'Personal Profile', 0, 'Create/Edit Personal Profile', 'EditorPersonalProfile.cfm', 'Img/EditUser.jpg', 2, 'PARTICIPANT');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (86, 'Questionnaire', 0, 'Questionnaire', 'Questionnaire.cfm', 'Img/Q.jpg', 1, 'SUPERORG');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (87, 'Participant Profiles', 0, 'Create/Edit Profile(s)', 'EditorUsersByAPPADMIN.cfm', 'Img/EditUser.jpg', 2, 'SUPERORG');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (88, 'Create Reports', 0, 'Generate Custom Reports', 'EditorReports.cfm', 'Img/Reports.jpg', 1, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (89, 'Project Editor', 0, 'Create/Edit Projects (Not archived)', 'EditorProjects.cfm', 'Img/EditorProjects.jpg', 4, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (90, 'Assign Participants', 0, 'Assign Participants to the Project(s)', 'AssignParticipants.cfm', 'Img/AssignParticipants.jpg', 5, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (91, 'Admin All Participants', 0, 'Create/Edit All Participants', 'EditorUsersByAPPADMIN.cfm', 'Img/EditUser.jpg', 6, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (92, 'Organization Editor', 0, 'Create/Edit Organizations', 'EditorOrgs.cfm', 'Img/EditorOrgs.jpg', 7, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (93, 'Project Overview', 0, 'Project Overview (Active and Archived)', 'EditorProjectOverview.cfm', 'Img/ProjectOverview.jpg', 2, 'APPADMIN');
insert into MENUS (IDS, MENU_ITEM, SUPER_MENU, MENU_DESCRIPTION, PAGE_TO_BE_CALLED, IMG, ORDER_TO_BE_PRESENTED, MENU_OWNERSHIP)
values (94, 'E-Mail', 0, 'E-Mail to Survey Participants', 'EditorEMail.cfm', 'Img/EMail.jpg', 3, 'APPADMIN');
commit;

alter table MENUS enable all triggers;
