prompt PL/SQL Developer import file
prompt Created on Thursday, April 06, 2006 by ssurikov
set feedback off
set define off
prompt Disabling triggers for SECURITY_TREE...
alter table SECURITY_TREE disable all triggers;
prompt Truncating SECURITY_TREE...
truncate table SECURITY_TREE;
prompt Loading SECURITY_TREE...
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (101, 'HOME', 'GL', 0, 'A', 10, 'Home.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (102, 'UPDATE ALUMNI INFO', 'GL', 0, 'A', 20, 'Search_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (1001, 'Log In', 'LI', 0, 'A', 10, 'LogIn.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (1001, 'Log Out', 'UT', 0, 'A', 90, 'LogIn.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (209, 'Create Mailing Labels', 'SG', 106, 'A', 10, 'MailingLables_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (1002, 'New User Registration', 'LI', 0, 'A', 10, 'NewUserRegistration_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (210, 'Create Contact List', 'SG', 106, 'A', 20, 'CreateContactList_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (201, 'Edit Roles', 'SG', 104, 'A', 20, 'EditROLE_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (1003, 'Forgot Password?', 'LI', 0, 'A', 10, 'ForgotPass.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (104, 'ADMIN', 'GL', 0, 'A', 40, 'Admin_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (202, 'Verify and Change Users', 'SG', 104, 'A', 10, 'AdministerUSERS_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (401, 'Approve Access', 'SL', 202, 'A', 10, 'ListUsr_ReqAccs_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (402, 'Approve Changes', 'SL', 202, 'A', 20, 'ListUsr_ReqChng_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (403, 'See Your Active Users', 'SL', 202, 'A', 30, 'ListUsr_Active_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (404, 'Pre-Registered Users', 'SL', 202, 'A', 40, 'ListUsr_PreReg_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (405, 'Quick search', 'SL', 202, 'I', 50, 'QuickSearch_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (211, 'Create Custom Reports', 'SG', 106, 'A', 30, 'CreateCustomReports_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (212, 'Chart Report', 'SG', 106, 'I', 40, 'ChartReport_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (213, 'Create E-mail Distribution List', 'SG', 106, 'A', 11, 'CreateDistributionList_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (206, 'Search Results', 'SG', 102, 'I', 40, 'SearchResults_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (207, 'Text Editor', 'SG', 104, 'A', 30, 'EditText_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (208, 'Self Data', 'SG', 104, 'A', 40, 'SelfData_p1.cfm');
insert into SECURITY_TREE (ST_ID, ST_NM, ST_LOC, ST_PARENT_ID, ST_IS_ACT, ST_SEQ, ST_CALL_FILE)
values (106, 'CREATE & PRINT', 'GL', 0, 'A', 39, 'CreateAndPrint_p1.cfm');
commit;
prompt 23 records loaded
prompt Enabling triggers for SECURITY_TREE...
alter table SECURITY_TREE enable all triggers;
set feedback on
set define on
prompt Done.
