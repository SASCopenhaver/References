prompt PL/SQL Developer import file
prompt Created on Thursday, April 06, 2006 by ssurikov
set feedback off
set define off
prompt Disabling triggers for SECURITY_TREE_ROLES...
alter table SECURITY_TREE_ROLES disable all triggers;
prompt Truncating SECURITY_TREE_ROLES...
truncate table SECURITY_TREE_ROLES;
prompt Loading SECURITY_TREE_ROLES...
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1002, 0);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 0);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (207, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 21);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 2);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1003, 0);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 21);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 21);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (202, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (201, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (202, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (402, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (401, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (403, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (404, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (202, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (1001, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 302);
commit;
prompt 100 records committed...
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (206, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (106, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (209, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (210, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (211, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (104, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (202, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (208, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (212, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (401, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (102, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (101, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (402, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (403, 304);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (401, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (401, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (402, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (402, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (403, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (403, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 1);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 242);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 245);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 306);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 241);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 300);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 301);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 302);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 303);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 307);
insert into SECURITY_TREE_ROLES (STR_ST_ID, STR_R_ID)
values (213, 304);
commit;
prompt 157 records loaded
prompt Enabling triggers for SECURITY_TREE_ROLES...
alter table SECURITY_TREE_ROLES enable all triggers;
set feedback on
set define on
prompt Done.
