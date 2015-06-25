prompt PL/SQL Developer import file
prompt Created on Thursday, April 06, 2006 by ssurikov
set feedback off
set define off
prompt Disabling triggers for USR...
alter table USR disable all triggers;
prompt Truncating USR...
truncate table USR;
prompt Loading USR...
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (1, 'Mr.', 'TIMOTHY', 'J', 'DUNN', '2026479422', null, 'dunntj@state.gov', 'dunntj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (2, 'Mr.', 'PAUL', 'K', 'TRIVELLI', '2026479963', null, 'trivellipa@state.gov', 'trivellipa', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (3, null, 'MARY DEANE', null, 'CONNERS', '2026477456', null, 'ConnersMD@state.gov', 'connersmd', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (4, null, 'OLWYN B', null, 'STAPLES', '2026479057', null, 'StaplesOB@state.gov', 'staplesob', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (5, null, 'ROBERTA', null, 'JACOBSON', '2026479894', null, 'JacobsonRS@state.gov', 'jacobsonrs', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (6, null, 'KRISHNA RAJ', null, 'URS', '2027367530', null, 'UrsKR@state.gov', 'urskr', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (7, null, 'DAVID', null, 'LINDWALL', '2026474992', null, 'LindwallDE@state.gov', 'lindwallde', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (8, null, 'KEVIN M', null, 'WHITAKER', '2026479273', null, 'WhitakerKM@state.gov', 'whitakerkm', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (9, null, 'BRIAN', null, 'NICHOLS', '2026475088', null, 'NicholsBA@state.gov', 'nicholsba', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (10, null, 'TERRY A', null, 'BREESE', '2026472273', null, 'BreeseTA@state.gov', 'breeseta', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (11, null, 'MICHAEL A', null, 'MATERA', '2026472407', null, 'MateraMA@state.gov', 'materama', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (12, null, 'LISA BOBBIE', null, 'SCHREIBER HUGHES', '2026474178', null, 'SchreiberHughesLB@state.gov', 'schreiberhugheslb', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (13, null, 'EDWARD', null, 'RAMOTOWSKI', '2026631160', null, 'RamotowskiEJ@state.gov', 'ramotowskiej', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (14, null, 'JOSEPH', null, 'MERANTE', '2124154076', null, 'MeranteJ@state.gov', 'merantej', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (15, null, 'ANNE W', null, 'PATTERSON', '2124154410', null, 'pattersonaw@state.gov', 'pattersonaw', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (16, null, 'JOHN', null, 'SCHLOSSER', '2027364255', null, 'SchlosserJK@state.gov', 'schlosserjk', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (17, null, 'LARRY', null, 'SCHWARTZ', '2026478605', null, 'SchwartzL@state.gov', 'schwartzl', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (18, null, 'STEPHEN', null, 'ENGELKEN', '2026476711', null, 'EngelkenSC3@state.gov', 'engelkensc3', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (19, null, 'STEPHEN', null, 'BLAKE', '2026471114', null, 'BlakeSJ@state.gov', 'blakesj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (20, null, 'PATRICK S', null, 'MOON', '2026475493', null, 'MoonP@state.gov', 'moonp', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (21, null, 'MAUREEN', null, 'QUINN', '2026475497', null, 'QuinnME@state.gov', 'quinnme', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (22, null, 'RICHARD ', null, 'KIDD', '2026630086', null, 'KiddRG@state.gov', 'kiddrg', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (23, null, 'ROBERT', null, 'LOFTIS', '2026478343', null, 'LoftisRG@state.gov', 'loftisrg', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (24, null, 'ANN', null, 'BREITER', '2026478164', null, 'BreiterAK@state.gov', 'breiterak', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (25, null, 'ELENA', null, 'KIM-MITCHELL', '2026475876', null, 'KimEP@state.gov', 'kimep', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (26, null, 'LAWRENCE', null, 'STUTZRIEM', '2026474059', null, 'StutzriemLA@state.gov', 'stutzriemla', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (27, null, 'CHRISTOPHER', null, 'KEPPLER', '2026479636', null, 'KepplerCL@state.gov', 'kepplercl', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (28, null, 'PRICE', null, 'FLOYD', '2026470873', null, 'FloydPB@state.gov', 'floydpb', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (29, null, 'THOMAS', null, 'CASEY', '2026474444', null, 'CaseyTH@state.gov', 'caseyth', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (30, null, 'DUNCAN', null, 'MACINNES', '2025046325', null, 'MacInnesDH@state.gov', 'macinnesdh', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (31, null, 'TERESA', null, 'DEAN', '2026477926', null, 'DeanTL@state.gov', 'deantl', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (32, null, 'GREG', null, 'FRANKLIN', '2025046403', null, 'FranklinG@state.gov', 'frankling', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (33, null, 'COLLEEN', null, 'HOPE', '7038755085', null, 'HopeCA@state.gov', 'hopeca', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (34, null, 'GEORGE', null, 'DRAGNICH', '2026633217', null, 'DragnichGS@state.gov', 'dragnichgs', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (35, null, 'RALPH', null, 'BRAIBANTI', '2026632390', null, 'BraibantiRL@state.gov', 'braibantirl', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (36, null, 'JONATHAN', null, 'MARGOLIS', '2026471511', null, 'MargolisJA@state.gov', 'margolisja', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (37, null, 'WILLIAM', null, 'GIBBONS-FLY', '2026472337', null, 'Gibbons-FlyWH@state.gov', 'gibbons-flywh', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (38, null, 'MARGARET F ', null, 'HAYES', '2026473013', null, 'HayesMF@state.gov', 'hayesmf', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (39, null, 'ARNOLD  J', null, 'CRODDY', '2026471318', null, 'CroddyAJ@state.gov', 'croddyaj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (40, null, 'DAN', null, 'REIFSNYDER', '2026473935', null, 'ReifsnyderDA@state.gov', 'reifsnyderda', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (41, null, 'STEPHANIE', null, 'CASWELL', '2026473367', null, 'CaswellSX@state.gov', 'caswellsx', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (42, null, 'MICHAEL', null, 'GLOVER', '2026479831', null, 'GloverMP@state.gov', 'glovermp', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (43, null, 'CLAUDIA', null, 'MCMURRAY', '2026472232', null, 'McMurrayCA@state.gov', 'mcmurrayca', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (44, null, 'MARK', null, 'STEINITZ', '2026479035', null, 'SteinitzMS@state.gov', 'steinitzms', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (45, null, 'CATHLEEN', null, 'LAWRENCE', '2026473442', null, 'lawrenca@state.gov', 'lawrenca', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (46, null, 'CHRISTOPHER ', null, 'RICHE', '2026473268', null, 'RicheC@state.gov', 'richec', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (47, null, 'GERALD', null, 'FEIERSTEIN', '2026474589', null, 'FeiersteinGM@state.gov', 'feiersteingm', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (48, null, 'MARTIN', null, 'QUINN', '2027768860', null, 'QuinnMR@state.gov', 'quinnmr', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (49, null, 'ALINA ', null, 'ROMANOWSKI', '2027768570', null, 'RomanowskiAL@state.gov', 'romanowskial', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (50, null, 'ROBERT', null, 'GODEC', '2026476645', null, 'GodecRF@state.gov', 'godecrf', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (51, null, 'DANIEL', null, 'RUBINSTEIN', '2026473672', null, 'RubinsteinDH@state.gov', 'rubinsteindh', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (52, null, 'RICHARD ', null, 'OLSON', '2026479405', null, 'OlsonRG@state.gov', 'olsonrg', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (53, null, 'ALICE', null, 'WELLS', '2026474675', null, 'WellsAG@state.gov', 'wellsag', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (54, null, 'JAMES', null, 'MCVERRY', '2026472670', null, 'McVerryJA@state.gov', 'mcverryja', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (55, null, 'ALAN', null, 'MISENHEIMER', '2026476184', null, 'MisenheimerAG@state.gov', 'misenheimerag', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (56, null, 'JAMES', null, 'WARLICK', '2026472393', null, 'WarlickJ@state.gov', 'warlickj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (57, null, 'DON', null, 'BOOTH', '2026472752', null, 'BoothDE@state.gov', 'boothde', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (58, null, 'WILLIAM ', null, 'LUCAS', '2027367791', null, 'LucasWE@state.gov', 'lucaswe', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (59, '-1', 'GEORGE', null, 'ABRAHAMS', '2026476424', null, 'AbrahamsGM@state.gov', 'abrahamsgm', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (60, null, 'MIRIAM', null, 'HUGHES', '2026477857', null, 'HughesMK@state.gov', 'hughesmk', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (61, null, 'GERALD', null, 'ANDERSON', '2027367733', null, 'AndersonGC@state.gov', 'andersongc', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (62, null, 'PENELOPE', null, 'WILLIAMS', '2026476875', null, 'WilliamsPA@state.gov', 'williamspa', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (63, null, 'RICHARD W', null, 'BEHREND', '2026471269', null, 'BehrendRW@state.gov', 'behrendrw', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (64, null, 'NEIL', null, 'SILVER', '2026478230', null, 'SilverNE@state.gov', 'silverne', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (65, null, 'STEVEN', null, 'COFFEY', '2026475642', null, 'CoffeySJ@state.gov', 'coffeysj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (66, null, 'STEPHEN', null, 'SHAFFER', '2022037932', null, 'ShafferS@state.gov', 'shaffers', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (67, null, 'STEPHEN', null, 'GRUMMON', '2026478661', null, 'GrummonSR@state.gov', 'grummonsr', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (68, null, 'JUDSON', null, 'BARNES', '2026474318', null, 'BarnesJJ@state.gov', 'barnesjj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (69, null, 'JAMES', null, 'BUCHANAN', '2026474063', null, 'BuchananJE@state.gov', 'buchananje', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (70, null, 'JON', null, 'GIBNEY', '2026471153', null, 'GibneyJM@state.gov', 'gibneyjm', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (71, null, 'LEE', null, 'SCHWARTZ', '2026471988', null, 'SchwartzLR@state.gov', 'schwartzlr', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (72, null, 'BOWMAN', null, 'MILLER', '2026478052', null, 'MillerBH@state.gov', 'millerbh', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (73, null, 'BEN', null, 'FAIRFAX', '2026472186', null, 'FairfaxBF@state.gov', 'fairfaxbf', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (74, null, 'JAMES', null, 'GAGNON', '2026474495', null, 'GagnonJM@state.gov', 'gagnonjm', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (75, null, 'FRANCES', null, 'JONES', '2026476130', null, 'JonesFT@state.gov', 'jonesft', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (76, null, 'ERIC', null, 'RUBIN', '2026470396', null, 'RubinES@state.gov', 'rubines', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (77, null, 'THOMAS', null, 'MARTIN', '2026479090', null, 'MartinTh@state.gov', 'martinth', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (78, null, 'PETER', null, 'PRAHAR', '2027768746', null, 'PraharPA@state.gov', 'praharpa', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (79, null, 'STEVEN', null, 'PETERSON', '2027364380', null, 'PetersonSP@state.gov', 'petersonsp', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (80, null, 'SHAWN', null, 'HOPSON', '2022037346', null, 'HopsonSE@state.gov', 'hopsonse', 'password', 306, 'A', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (81, null, 'ANNE MARIE', null, 'SHEPPARD', '2022037535', null, 'SheppardAM@state.gov', 'sheppardam', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (82, null, 'VICTOR', null, 'RICHE', '2022037328', null, 'RicheVE@state.gov', 'richeve', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (83, null, 'JONATHAN', null, 'SCHAFFER', '2024538390', null, 'SchafferJF@state.gov', 'schafferjf', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (84, null, 'LLOYD W', null, 'NEIGHBORS', '2022037494', null, 'NeighborsLW@state.gov', 'neighborslw', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (85, null, 'GERARD', null, 'JORIA', '2024538330', null, 'JoriaGJ@state.gov', 'joriagj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (86, null, 'REBECCA', null, 'WINCHESTER', '2024538260', null, 'WinchesterRX@state.gov', 'winchesterrx', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (87, null, 'CYNTHIA', null, 'BORYS', '2024538071', null, 'BorysC@state.gov', 'borysc', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (88, null, 'JOHN A', null, 'MATEL', '2024538355', null, 'MatelJA@state.gov', 'matelja', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (89, null, 'ROBERT', null, 'HOLDEN', '2024538312', null, 'HoldenRF@state.gov', 'holdenrf', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (90, null, 'AMOR E', null, 'SAFI', '2024538285', null, 'SafiAE@state.gov', 'safiae', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (91, null, 'THOMAS', null, 'DOWLING', '2024538294', null, 'DowlingTJ@state.gov', 'dowlingtj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (92, '-1', 'CARLA', 'A', 'BENINI', '390646743521', null, 'beninica@state.gov', 'beninica', 'beninica', 242, 'A', to_date('12-11-2006', 'dd-mm-yyyy'), 410, 'Q1', 'brown', to_date('01-08-2005 09:18:57', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (93, null, 'KATHLEEN', null, 'ALLEGRONE', '2026473072', null, 'AllegroneKH@state.gov', 'allegronekh', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (94, null, 'KAREN', null, 'STEWART', '2026478671', null, 'StewartKB@state.gov', 'stewartkb', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (95, null, 'ALEXANDER', null, 'KARAGIANNIS', '2026475687', null, 'KaragiannisA@state.gov', 'karagiannisa', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (96, null, 'SCOT', null, 'MARCIEL', '2026476112', null, 'MarcielS@state.gov', 'marciels', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (98, null, 'MARY', null, 'WARLICK', '2026479806', null, 'WarlickMB@state.gov', 'warlickmb', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (99, null, 'DANIEL', null, 'RUSSELL', '2026471626', null, 'RussellDA@state.gov', 'russellda', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (100, null, 'BRUCE', null, 'THOMAS', '2026475992', null, 'ThomasBE@state.gov', 'thomasbe', 'password', 306, 'I', null, 410, null, null, null);
commit;
prompt 100 records committed...
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (101, null, 'MICHAEL', null, 'HURLEY', '2026477308', null, 'HurleyMJ@state.gov', 'hurleymj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (102, null, 'NERISSA', null, 'COOK', '2026475728', null, 'CookNJ@state.gov', 'cooknj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (103, null, 'JANE', null, 'GARVEY', '2026474136', null, 'GarveyJE@state.gov', 'garveyje', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (104, null, 'JUDITH ', null, 'CEFKIN', '2026476556', null, 'CefkinJB@state.gov', 'cefkinjb', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (105, null, 'JOHN', null, 'FOX', '2026476745', null, 'FoxJ@state.gov', 'foxj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (106, null, 'PETER', null, 'CHASE', '2026473932', null, 'ChasePH@state.gov', 'chaseph', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (107, null, 'DANIEL', null, 'WEYGANDT', '2026471484', null, 'WeygandtAD@state.gov', 'weygandtad', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (108, null, 'THOMAS', null, 'ADAMS', '2026475102', null, 'AdamsT@state.gov', 'adamst', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (109, null, 'CHARLES', null, 'MOORE', '2026195217', null, 'MooreCW@state.gov', 'moorecw', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (110, null, 'LEA', null, 'PEREZ', '2026195348', null, 'PerezL@state.gov', 'perezl', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (111, null, 'RICK', null, 'RUTH', '2026195306', null, 'RuthRA@state.gov', 'ruthra', 'password', 304, 'A', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (112, null, 'CATHY', null, 'CHIKES', '2022037470', null, 'ChikesCT@state.gov', 'chikesct', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (113, null, 'PAT K', null, 'SCHAEFER', '2026194290', null, 'SchaeferPK@state.gov', 'schaeferpk', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (114, null, 'STANLEY', null, 'COLVIN', '2022037415', null, 'ColvinSS@state.gov', 'colvinss', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (115, null, 'VAN S', null, 'WUNDER', '2022052128', null, 'WunderVS@state.gov', 'wundervs', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (116, null, 'JOHN', null, 'CONNERLEY', '2026195887', null, 'ConnerleyJ@state.gov', 'connerleyj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (117, null, 'ROSALIN', null, 'SWENSON', '2026195384', null, 'SwensonRL@state.gov', 'swensonrl', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (118, null, 'EDWARD  W', null, 'KLOTH', '2026478687', null, 'KlothEW@state.gov', 'klothew', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (119, null, 'EDWARD T', null, 'SMITH', '2026475865', null, 'SmithE@state.gov', 'smithe', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (120, null, 'WILLIAM', null, 'CRAFT', '2026476324', null, 'CraftWE@state.gov', 'craftwe', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (121, null, 'KEVIN', null, 'HONAN', '2026474017', null, 'HonanKE@state.gov', 'honanke', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (122, null, 'PHILIP', null, 'WALL', '2026473090', null, 'WallPR@state.gov', 'wallpr', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (123, null, 'RUSSEL', null, 'FRISBIE', '2026479497', null, 'FrisbieRL@state.gov', 'frisbierl', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (124, null, 'WESLEY', null, 'SCHOLZ', '2027364762', null, 'ScholzWS@state.gov', 'scholzws', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (125, null, 'JUDITH', null, 'GARBER', '2026479426', null, 'GarberJG2@state.gov', 'garberjg2', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (126, null, 'STEPHEN', null, 'GALLOGLY', '2026473036', null, 'GalloglySJ@state.gov', 'galloglysj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (128, null, 'DANIEL', null, 'CLUNE', '2026471936', null, 'CluneDA@state.gov', 'cluneda', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (129, null, 'PATRICIA  H ', null, 'SCROGGS', '2027367707', null, 'ScroggsPH@state.gov', 'scroggsph', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (130, null, 'SHARI  ', null, 'VILLAROSA', '2026473276', null, 'VillarosaS@state.gov', 'villarosas', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (131, null, 'PETER ', null, 'KOVACH', '2027364524', null, 'KovachPJ@state.gov', 'kovachpj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (132, null, 'KENNETH', null, 'BAILES', '2026472538', null, 'BailesKN@state.gov', 'baileskn', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (133, null, 'JAMES', null, 'FOSTER', '2026478890', null, 'FosterJJ@state.gov', 'fosterjj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (134, null, 'VIRGINIA E ', null, 'PALMER', '2026472001', null, 'PalmerVE@state.gov', 'palmerve', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (135, null, 'W DAVID', null, 'STRAUB', '2026472913', null, 'StraubWD@state.gov', 'straubwd', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (136, null, 'ANGELA', null, 'DICKEY ', '2026472143', null, 'DickeyAR@state.gov', 'dickeyar', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (137, null, ' JOSEPH', null, 'DONOVAN', '2026476803', null, 'DonovanJR@state.gov', 'donovanjr', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (138, null, 'JUDITH', null, 'STROTZ', '2026471339', null, 'StrotzJA@state.gov', 'strotzja', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (139, null, 'HOWARD ', null, 'KRAWITZ', '2027364741', null, 'KrawitzH@state.gov', 'krawitzh', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (140, null, 'JOHN', null, 'RENDEIRO', '7033123000', null, 'RendeiroJG@state.gov', 'rendeirojg', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (141, null, 'GENE E', null, 'BIGLER', '2026471957', null, 'BiglerGE@state.gov', 'biglerge', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (142, null, 'OSCAR G ', null, 'DESOTO', '2026470407', null, 'DeSotoOG@state.gov', 'desotoog', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (143, null, 'MICHAEL ', null, 'BUTLER', '2026474380', null, 'ButlerMA@state.gov', 'butlerma', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (144, null, 'ROBERT', null, 'HAGEN', '2026473663', null, 'HagenRS@state.gov', 'hagenrs', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (145, null, 'NADIA J', null, 'TONGOUR', '2022618024', null, 'TongourNJ@state.gov', 'tongournj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (146, null, 'RAVIC', null, 'HUSO', '8084777602', null, 'ravic.huso@pacom.mil', 'ravic.huso', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (147, null, 'J FRANK', null, 'MERMOUD', '2026471625', null, 'MermoudJF@state.gov', 'mermoudjf', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (148, null, 'DERWOOD', null, 'STAEBEN', '2026471489', null, 'StaebenDK@state.gov', 'staebendk', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (149, null, 'MICHAEL', null, 'ARIETTI', '2026473395', null, 'AriettiMR@state.gov', 'ariettimr', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (150, null, 'ROBERT', null, 'EHRNMAN', '2026474493', null, 'EhrnmanR@state.gov', 'ehrnmanr', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (151, null, 'DAN ', null, 'MOZENA', '2026479834', null, 'MozenaDW@state.gov', 'mozenadw', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (152, null, 'JOHN ', null, 'NAY', '2023129686', null, 'NayJR@state.gov', 'nayjr', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (153, null, 'LINDAMARIE', null, 'KOENGETER', '2026630500', null, 'KoengeteLW@state.gov', 'koengetelw', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (154, null, 'STEPHEN', null, 'NOLAN', '2026471298', null, 'NolanSJ@state.gov', 'nolansj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (155, null, 'MARY JO', null, 'WILLS', '2026474066', null, 'WillsMJ@state.gov', 'willsmj', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (156, null, 'JANE', null, 'GAFFNEY', '2026477316', null, 'GaffneyJC@state.gov', 'gaffneyjc', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (157, null, 'ALAN', null, 'EASTHAM', '2026472080', null, 'EasthamAW@state.gov', 'easthamaw', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (158, null, 'KIM', null, 'DUBOIS', '2442396727', '221', 'DuboisKF@state.gov', 'duboiskf', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (159, null, 'AMELIA', null, 'BRODERICK', '229301477', null, 'BroderickAF@state.gov', 'broderickaf', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (160, null, 'KAREN', null, 'MORRISSEY', '2673957326', null, 'MorrisseyK@state.gov ', 'morrisseyk', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (161, null, 'TODD', null, 'HASKELL', '22650306723', null, 'Haskellt@state.gov', 'haskellt', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (162, null, 'CHRISTOPHER', null, 'LESLIE', '257223454', null, 'lesliecg@state.gov', 'lesliecg', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (163, null, 'ARIC', null, 'SCHWAN', '2372234014', '4266', 'SchwanAR@state.gov', 'schwanar', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (164, null, 'DEBORAH', null, 'PEDROSO', '238615616', null, 'Pedrosody@state.gov', 'pedrosody', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (165, null, 'MARISSA', null, 'MAURER', '235519233', null, 'Maurerm2@state.gov', 'maurerm2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (166, null, 'PHILIP E. ', null, 'WRIGHT', '243812255872', null, 'WrightPE@state.gov', 'wrightpe', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (167, null, 'GEORGE', null, 'INDYKE', '242811482', null, 'indykegw@state.gov', 'indykegw', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (168, null, 'ERGIBE', null, 'BOYD', '22522440597', '4981', 'BoydEA@state.gov', 'boydea', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (169, null, 'TIFFANY', null, 'BARTISH', '253353995', null, 'Bartishtm@state.gov', 'bartishtm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (171, null, 'GEORGE', null, 'COLVIN', '2911120738', null, 'ColvinGW@state.gov', 'colvingw', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (172, null, 'SAM', null, 'WESTGATE', '2511174007', null, 'WestgateSS@state.gov', 'westgatess', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (173, null, 'MOULIK', null, 'BERKANA', '241762003', null, 'Berkanamd@state.gov', 'berkanamd', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (174, null, 'VANGALA W.', null, 'RAM', '2204392856', null, 'RamVS@state.gov', 'ramvs', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (175, null, 'DAVID', null, 'QUEEN', '23321229179', '829', 'Queenda@state.gov', 'queenda', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (176, null, 'LOUISE ', null, 'BEDICHEK', '224461424', null, 'Bedichek@state.gov', 'bedichek', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (177, null, 'CLAUD', null, 'YOUNG', '2218231185', '3100', 'Youngcr@state.gov', 'youngcr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (178, null, 'PETER', null, 'CLAUSSEN', '254203636201', null, 'ClaussenPR@state.gov', 'claussenpr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (180, null, 'JED', null, 'DORNBURG', '26622312666', null, 'dornburgjt@state.gov', 'dornburgjt', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (181, null, 'CHRISTINA', null, 'PORCHE', '231226370', '1392', 'Porcheca@state.gov', 'porcheca', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (182, null, 'WILLIAM ', null, 'COOK', '261202221257', null, 'CookWH2@state.gov', 'cookwh2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (183, null, 'MITCHELL', null, 'MOSS', '2651772222', null, 'Mossmr@state.gov', 'mossmr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (184, null, 'MARY ', null, 'SPEER', '2232225470', null, 'SpeerMF@state.gov', 'speermf', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (185, null, 'DAVID', null, 'BROWN', '2225252660', '4445', 'BrownDE3@state.gov', 'brownde3', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (186, null, 'MARJORIE', null, 'HARRISON', '2302024440', null, 'Harrisonmr@state.gov', 'harrisonmr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (187, null, 'GREG', null, 'GARLAND', '2581491916', null, 'Garlandgl@state.gov', 'garlandgl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (188, null, 'STANLEY', null, 'HARSHA', '26461229801', null, 'HarshaS@state.gov', 'harshas', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (189, null, 'SITA', null, 'CHAKRAWARTI', '227734107', null, 'ChakrawartiSL@state.gov ', 'chakrawartisl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (190, null, 'CLAUDIA', null, 'ANYASO', '23495232018', null, 'AnyasoCE@state.gov', 'anyasoce', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (191, null, 'ATIM', null, 'GEORGE', '23412635753', null, 'GeorgeAE@state.gov', 'georgeae', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (192, null, 'GUY', null, 'MARGALITH', '6753211455', '160', 'MargalithG@state.gov', 'margalithg', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (193, null, 'GRACE', null, 'BRUNTON', '250573206', null, 'BruntonG@state.gov', 'bruntong', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (194, null, 'TIMOTHY W', null, 'HARLEY ', '68521436', null, 'HarleyT@state.gov', 'harleyt', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (197, null, 'KEVIN', null, 'GREEN', '23222226481', null, 'GreenKD2@state.gov', 'greenkd2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (198, null, 'LOUIS', null, 'MAZEL', '27214214280', '2863', 'Mazell@state.gov', 'mazell', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (199, null, 'LIAM', null, 'HUMPHREYS', '27313057600', '211', 'HumphreysLJ@state.gov', 'humphreyslj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (200, null, 'MARY KAY ', null, 'JEFFERS', '27118382231', '101', 'Jeffersmv@state.gov', 'jeffersmv', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (201, null, 'VIRGINIA LOO ', null, 'FARRIS', '27124314210', null, 'Farrisvl@state.gov', 'farrisvl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (202, null, 'ELIZABETH', null, 'COLTON', '249183774700', null, 'ColtonEO@state.gov', 'coltoneo', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (203, null, 'PETER', null, 'PINESS', '2684046441', null, 'PinessP@state.gov', 'pinessp', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (204, null, 'JOHN ', null, 'HAYNES', '255222668001', null, 'HaynesJD@state.gov', 'haynesjd', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (205, null, 'ELLEN', null, 'IRVINE', '2282212166', null, 'IrvineE@state.gov', 'irvinee', 'password', 242, 'I', null, 410, null, null, null);
commit;
prompt 200 records committed...
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (206, null, 'MARK', null, 'SCHLACHTER', '25641341047', null, 'Schlachtmm@state.gov ', 'schlachtmm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (207, null, 'DEHAB', null, 'GHEBREAB', '2601227993', null, 'GhebreabD2@state.gov', 'ghebreabd2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (208, null, 'GERRY', null, 'KEENER', '2634758800', null, 'KeenerGF@state.gov', 'keenergf', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (209, null, 'SUSAN', null, 'CRYSTAL', '61262145873', null, 'crystalsr@state.gov', 'crystalsr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (210, null, 'MARY DRAKE', null, 'SCHOLL', '61293739221', null, 'SchollMD@state.gov', 'schollmd', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (211, null, 'JEFFREY J ', null, 'HAWKINS', '6732229670', null, 'HawkinsJJ2@state.gov', 'hawkinsjj2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (212, null, 'MARY ELLEN', null, 'COUNTRYMAN', '951223106', null, 'countrymanme@state.gov', 'countrymanme', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (213, null, 'HEIDE', null, 'BRONKE', '85523216436', '163', 'bronkehm@state.gov', 'bronkehm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (214, null, 'DONALD', null, 'BISHOP', '861065323831', '7440', 'bishopdm@state.gov', 'bishopdm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (215, null, 'JOHN', null, 'LOUTON', '862885583992', '6874', 'loutonjm@state.gov', 'loutonjm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (216, null, 'WENDY', null, 'LYLE', '862083354269', null, 'lylewp@state.gov', 'lylewp', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (217, null, 'JENNIFER', null, 'GALT', '862162797662', '4673', 'galtjz@state.gov', 'galtjz', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (218, null, 'CYNTHIA', null, 'CAPLES', '2423222976', null, 'caplesc@state.gov', 'caplesc', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (219, null, 'SEAN B', null, 'STEIN', '6703324684', null, 'SteinSB@state.gov', 'steinsb', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (220, null, 'DAVID L', null, 'LYON', '6793314466', null, 'LyonDL@state.gov', 'lyondl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (221, null, 'RICHARD', null, 'STITES', '85228412255', null, 'stitesrw@state.gov', 'stitesrw', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (222, null, 'CHARLES', null, 'SILVER', '622134359502', null, 'silvercn@state.gov', 'silvercn', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (223, null, 'JOHN', null, 'DYSON', '81927336421', null, 'dysonja@state.gov', 'dysonja', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (224, null, 'MICHAEL', null, 'TURNER', '81525818631', null, 'TurnerMR@state.gov', 'turnermr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (225, null, 'FRANK', null, 'STANLEY', '81988764211', '6634', 'StanleyFW@state.gov', 'stanleyfw', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (226, null, 'WILLIAM', null, 'MORGAN', '81332245200', null, 'morganwm@state.gov', 'morganwm', 'password', 242, 'H', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (227, null, 'MARRIE', null, 'SCHAEFER', '81116411115', null, 'SchaeferMY@state.gov', 'schaefermy', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (229, null, 'DON', null, 'WASHINGTON', '8223974706', null, 'washingtondq@state.gov', 'washingtondq', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (230, null, 'JAMES', null, 'WARREN', '86521212581', null, 'warrenja@state.gov', 'warrenja', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (231, null, 'KARL', null, 'STOLTZ', '60321685071', null, 'stoltzke@state.gov', 'stoltzke', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (232, null, 'GRETA N.', null, 'MORRIS', '6922474011', null, 'morrisgn@state.gov', 'morrisgn', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (233, null, 'SUZANNE K', null, 'HALE', null, null, 'Halesk@state.gov', 'halesk', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (234, null, 'SCOTT', null, 'WEINHOLD', '97611329095', null, 'weinholds@state.gov', 'weinholds', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (235, null, 'ROY', null, 'GLOVER', '6444626022', null, 'gloverra@state.gov', 'gloverra', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (236, null, 'DEBORAH L', null, 'KINGSLAND', '6804882920', null, 'KingslandDL@state.gov', 'kingslanddl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (237, null, 'RON', null, 'POST', '6325286300', '2008', 'postrj@state.gov', 'postrj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (238, null, 'DAVID', null, 'ANDRESEN', '6564769509', null, 'andresendr@state.gov', 'andresendr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (239, null, 'DANA S', null, 'SMITH', '886221622315', null, 'SmithDSX@state.gov', 'smithdsx', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (240, null, 'MARK', null, 'LARSEN', '6622054486', null, 'surikovsa@state.gov', 'larsenm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (242, null, 'LOUIS P.', null, 'LANTNER', '8448314580', '111', 'LantnerLP@state.gov', 'lantnerlp', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (243, null, 'ROBERT', null, 'OGBURN', '8488229433', null, 'ogburnrw2@state.gov', 'ogburnrw2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (244, null, 'GREGORY', null, 'KAY', '3554247285', '2905', 'KayGW2@state.gov', 'kaygw2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (245, null, 'KIM', null, 'HARGAN', '3741524661', '4443', 'HarganKG@state.gov', 'hargankg', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (246, null, 'BILL', null, 'WANLUND', '431313392060', null, 'WanlundWH@state.gov', 'wanlundwh', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (247, null, 'IN-MI', null, 'GOSNELL', '431313393422', null, 'GosnellIK@state.gov', 'gosnellik', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (248, null, 'RALPH', null, 'KWONG', '431313395664', null, 'KwongRS@state.gov', 'kwongrs', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (249, null, 'MICHAEL J', null, 'GARUCKIS', '431313394752', null, 'GaruckisMJ@state.gov', 'garuckismj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (250, null, 'THERESA', null, 'MARKIW', '994124980335', '4270', 'MarkiwTM@state.gov', 'markiwtm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (251, null, 'DIAN', null, 'MCDONALD', '375172170481', null, 'McDonaldDJ@state.gov', 'mcdonalddj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (252, null, 'CHRIS', null, 'ROCHESTER', '3225082412', null, 'RochesterC@state.gov', 'rochesterc', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (253, null, 'IAN C', null, 'KELLY', '3227243112', null, 'kellyic@state.gov', 'kellyic', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (254, null, 'ANNE V', null, 'BARBARO', '3225082778', null, 'BarbaroAV@state.gov', 'barbaroav', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (255, null, 'ANTOINETTE R', null, 'BOECKER', '4412951342', '229', 'BoeckerAR2@state.gov', 'boeckerar2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (256, null, 'GERALD', null, 'MCLOUGHLIN', '38733619592', null, 'McLoughlinG@state.gov', 'mcloughling', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (259, null, 'MATTHEW', null, 'LUSSENHOP', '35929375299', null, 'LussenhopMR@state.gov', 'lussenhopmr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (260, null, 'JANET', null, 'EDMONSON', '38516612213', null, 'Edmonsonjl2@state.gov', 'edmonsonjl2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (261, null, 'CRAIG L.', null, 'KUEHL', '35722776400', null, 'KuehlCL@state.gov', 'kuehlcl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (262, null, 'MIKE', null, 'HAHN', '420257535160', '3100', 'HahnMG@state.gov', 'hahnmg', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (263, null, 'CHRIS', null, 'FITZGERALD', '4535553144', '245', 'fitzgeraldcx@state.gov', 'fitzgeraldcx', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (264, null, 'THOMAS', null, 'HODGES', '3726688124', null, 'HodgesTM@state.gov', 'hodgestm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (265, null, 'VICTORIA', null, 'MIDDLETON', '3589175138', null, 'MiddletonV@state.gov', 'middletonv', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (266, null, 'RENEE', null, 'EARLE', '33143124898', null, 'EarleRM@state.gov', 'earlerm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (271, null, 'PHYLLIS D', null, 'MORGAN', '33145247426', null, 'MorganPD@state.gov', 'morganpd', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (272, null, 'RAYMOND F', null, 'TRIPP', '33145247421', null, 'TrippRF@state.gov', 'tripprf', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (276, null, 'ROWENA', null, 'CROSS-NAJAFI', '99532989967', '4118', 'Cross-Najafi@state.gov', 'cross-najafi', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (277, null, 'ANNE', null, 'CHERMAK', '493083052800', '2', 'ChermakAM2@state.gov', 'chermakam2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (278, null, 'CAROLYN', null, 'JOHNSON', '4922120901100', null, 'JohnsonCR@state.gov', 'johnsoncr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (279, null, 'CHARLES', null, 'WALSH', '496997144811', null, 'WalshCH@state.gov', 'walshch', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (280, null, 'MIKE', null, 'STEVENS', '494041171401', null, 'StevensMG@state.gov', 'stevensmg', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (281, null, 'LIZ', null, 'BONKOWSKY', '493412138422', null, 'BonkowskyE@state.gov', 'bonkowskye', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (282, null, 'PAT', null, 'GUY', '49892888621', null, 'GuyPH@state.gov', 'guyph', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (283, null, 'SANDRA', null, 'KAISER', '302107202361', null, 'Kaisersl@state.gov', 'kaisersl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (285, null, 'BRENT D', null, 'HARDT', '390646743428', null, 'HardtDB@state.gov', 'hardtdb', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (286, null, 'CESAR', null, 'BELTRAN', '3614754256', null, 'BeltranC@state.gov', 'beltranc', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (287, null, 'LINDA', null, 'HARTLEY', '3545621020', null, 'HartleyLJ@state.gov', 'hartleylj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (288, null, 'MICHAEL', null, 'MCCLELLAN', '35316687122', '2100', 'McClellanMW@state.gov', 'mcclellanmw', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (289, null, 'DAVID', null, 'BUSTAMANTE', '390229035503', null, 'BustamanteDA@state.gov', 'bustamanteda', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (290, null, 'BEN', null, 'LOWENTHAL', '39081669989', null, 'lowenthalby@state.gov', 'lowenthalby', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (293, null, 'ANN', null, 'WELDEN', '73272504953', null, 'WeldenA@state.gov', 'weldena', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (294, null, 'SUZANNE', null, 'BODOIN', '73172580890', '244', 'BodoinSL@state.gov', 'bodoinsl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (295, null, 'LAWRENCE', null, 'CORWIN', '38138549516', '3732', 'CorwinLN@state.gov', 'corwinln', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (296, null, 'BILL', null, 'JAMES', '996312551241', '4405', 'JamesWA@state.gov', 'jameswa', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (297, null, 'VICTORIA', null, 'SLOAN', '3717509023', null, 'SloanV@state.gov', 'sloanv', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (298, null, 'ANTHONY', null, 'PAHIGIAN', '37052660330', null, 'PahigianAA@state.gov', 'pahigianaa', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (299, null, 'MATTHEW', null, 'LONG', '352460123', '2243', 'LongMW@state.gov', 'longmw', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (300, null, 'MIKE', null, 'ORLANSKY', '38991116180', '2118', 'OrlanskyMD2@state.gov', 'orlanskymd2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (301, null, 'ERIK', null, 'HOLM-OLSEN', '35625614152', null, 'Holm-OlsenE@state.gov', 'holm-olsene', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (302, null, 'ALEISHA', null, 'WOODWARD', '3732408485', null, 'WoodwardA@state.gov', 'woodwarda', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (303, null, 'TJ', null, 'GRUBISHA', '38181225504', null, 'TJGrubisha@usaid.gov', 'tjgrubisha', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (304, null, 'JESS', null, 'BAILY', '31703109440', null, 'BailyJ@state.gov', 'bailyj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (305, null, 'ANDREW', null, 'SCHILLING', '4721308896', null, 'SchillingAJ@state.gov', 'schillingaj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (306, null, 'WILLIAM', null, 'BELLIS', '48124245194', null, 'BellisW@state.gov', 'bellisw', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (307, null, 'ED', null, 'KULAKOWSKI', '48225042380', null, 'KulakowskiEJ@state.gov', 'kulakowskiej', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (308, null, 'JOAO', null, 'ECSODI', '351217702441', null, 'EcsodiJM@state.gov', 'ecsodijm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (310, null, 'MARK', null, 'WENTWORTH', '40212101602', null, 'WentworthM@state.gov', 'wentworthm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (312, null, 'LARRY', null, 'WOHLERS', '70957285067', null, 'WohlersLD@state.gov', 'wohlersld', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (313, null, 'JEFF', null, 'MURRAY', '78123367761', null, 'MurrayJX@state.gov', 'murrayjx', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (314, null, 'TARA', null, 'VERDONK-ROUGLE', '74232267017', null, 'RougleTE@state.gov', 'rouglete', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (315, null, 'BRADLEY', null, 'HURST', '73432564760', null, 'Hurst BA@state.gov', 'hurst ba', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (316, null, 'ALLEN', null, 'DOCAL', '381113619344', null, 'DocalAL@state.gov', 'docalal', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (317, null, 'BARBARA', null, 'ZIGLI', '421259223159', null, 'ZigliBA@state.gov', 'zigliba', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (318, null, 'ROBERT', null, 'POST', '38612005631', null, 'PostJR@state.gov', 'postjr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (319, null, 'JAMES', null, 'NEALON', '34932802227', '205', 'AlsaceJA@state.gov', 'alsaceja', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (321, null, 'GREG', null, 'ELFTMANN', '4687835435', null, 'ElftmannGB@state.gov', 'elftmanngb', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (322, null, 'DAN', null, 'WENDELL', '41313577248', null, 'WendellDR@state.gov', 'wendelldr', 'password', 242, 'I', null, 410, null, null, null);
commit;
prompt 300 records committed...
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (324, null, 'MAGDA S', null, 'SIEKERT', '41227494362', null, 'SiekertMS@state.gov', 'siekertms', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (325, null, 'JENNIFER', null, 'WASHELESKI', '992372210352', null, 'WasheleskiJD@state.gov', 'washeleskijd', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (326, null, 'WALTER', null, 'DOUGLAS', '902123359232', null, 'DouglasWT@state.gov', 'douglaswt', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (327, null, 'JIM', null, 'MOORE', '903124555555', null, 'MooreJR@state.gov', 'moorejr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (329, null, 'ILYA', null, 'LEVIN', '99312350046', '2126', 'LevinID@state.gov', 'levinid', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (330, null, 'JANET', null, 'DEMIRAY', '380444904032', null, 'demirayjc@state.gov', 'demirayjc', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (331, null, 'CATHY HURST', null, 'HURST', '442890386100', '4106', 'HurstCL@state.gov', 'hurstcl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (332, null, 'DANIEL', null, 'SREEBNY', '442078940611', null, 'Sreebnyd@state.gov', 'sreebnyd', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (333, null, 'DAVID MIKE', null, 'REINERT', '998711337096', null, 'ReinertDM@state.gov', 'reinertdm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (334, null, 'LINDA', null, 'COWHER', '901121321691255', '2109', 'CowherLM@state.gov', 'cowherlm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (335, null, 'ALETA', null, 'WENGER', '901197317242700', '2717', 'wengera@state.gov', 'wengera', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (336, null, 'J.HUGH', null, 'GEOGHEGAN', '90112027972620', null, 'GeogheganJH@state.gov', 'geogheganjh', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (337, null, 'JAMES ', null, 'BULLOCK', '90112027973245', null, 'BullockJL@state.gov', 'bullockjl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (338, null, 'RICHARD', null, 'SCHMIERER', null, null, 'SchmiererRJ@state.gov', 'schmiererrj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (339, null, 'CHARLES', null, 'HUNTER', '901197226227219', null, 'huntercf@state.gov', 'huntercf', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (340, null, 'HELENA', null, 'KANE FINN', '901197235103821', null, 'FinnHK@state.gov', 'finnhk', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (341, null, 'HAYNES', null, 'MAHONEY', '901196265906575', null, 'MahoneyHR@state.gov', 'mahoneyhr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (342, null, 'JOHN', null, 'MORAN', '90119655395307', '2207', 'MoranJG@state.gov', 'moranjg', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (343, null, 'JULIET', null, 'WURR', '90119614542600', '291', 'WurrJ@state.gov', 'wurr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (344, null, 'ANNE', null, 'O''LEARY', '1218913738700', null, 'olearyah@yahoo.com', 'olearyah', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (345, null, 'RICK L.', null, 'ROBERTS', null, null, 'RobertsRL@state.gov', 'andersontc', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (347, null, 'CHARLES', null, 'COLE', '9011968693474', null, 'ColeCG@state.gov', 'colecg', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (348, null, 'PATRICIA', null, 'KABRA', '90119744884160', null, 'KabraPK@state.gov', 'kabrapk', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (349, null, 'ERIN', null, 'EDDY', '901196626670080', '4152', 'EddyEL@state.gov', 'ramadanvs', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (350, null, 'CAROL', null, 'KALIN', '901196614883800', '4959', 'KalinCR@state.gov', 'kalincr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (351, null, 'CHRIS', null, 'ECCEL', '9011963113331870', null, 'EccelAC@state.gov', 'eccelac', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (352, null, 'PHILLIP', null, 'BREEDEN', '901121671107487', null, 'BreedenPX@state.gov', 'breedenpx', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (353, null, 'HILARY', null, 'OLSIN-WINDECKER', '901197124142522', null, 'olsin-windeckerh@state.gov', 'olsin-windeckerh', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (354, null, 'PETER', null, 'NEISULER', '901197143116132', null, 'neisulerpg@state.gov', 'neisulerpg', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (355, null, 'JOHN', null, 'BALIAN', '90119671303180', null, 'BalianJO@state.gov', 'bailianjo', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (356, 'Mr.', 'MICHAEL', 'P', 'MACY', '93202300436', null, 'macymp@state.gov', 'macymp', 'password', 242, 'A', to_date('01-01-2006', 'dd-mm-yyyy'), 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (357, null, 'KARL', null, 'FRITZ', '88028855500', null, 'fritzkh@state.gov', 'fritzkh', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (358, null, 'SUSAN', null, 'SCHULTZ', '913322881200', null, 'shultzsm@state.gov', 'shultzsm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (359, null, 'RAVI', null, 'CANDADAI', '914428112000', '2410', 'candadairs@state.gov', 'candadairs', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (360, null, 'LINDA', null, 'CHEATHAM', '912222624590', '2260', 'cheathamlc@state.gov', 'cheathamlc', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (361, null, 'MICHAEL', null, 'ANDERSON', '911124198000', null, 'andersonmh@state.gov', 'andersonmh', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (362, null, 'CONSTANCE', null, 'JONES', '97714415845', '221', 'jonescc@state.gov', 'jonescc', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (363, null, 'ANDREW', null, 'STEINFELD', '92512824051', '200', 'steinfeldaw@state.gov', 'steinfeldaw', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (365, null, 'REX', null, 'MOSER', '92426365530', null, 'moserrx@state.gov', 'moserrx', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (366, null, 'PHILIP', null, 'FRAYNE', '94112448007', null, 'fraynepa@state.gov', 'fraynepa', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (367, null, 'MARK', null, 'KRISCHIK', '541157774533', '440', 'KrischikMB2@state.gov', 'krischikmb2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (368, null, 'MICHAEL', null, 'TAYLOR', '12423221181', '4213', 'TaylorMP@state.gov', 'taylormp', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (369, null, 'JULIE', null, 'O''REAGAN', '2464364950', null, 'O''ReaganJA@state.gov', 'o''reaganja', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (370, null, 'EDGAR', null, 'EMBREY', '5012277161', '216', 'EmbreyEL@state.gov', 'embreyel', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (371, null, 'THOMAS', null, 'GENTON', '59122168000', '8222', 'GentonTR@state.gov', 'gentontr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (372, null, 'PATRICK', null, 'LINEHAN', '55613127380', null, 'LinehanKM@state.gov', 'linehankm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (374, null, 'CATHERINE', null, 'JARVIS', '552138232107', null, 'JarvisCJ@state.gov', 'jarviscj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (375, null, 'MICHAEL', null, 'GREENWALD', '551151867215', null, 'GreenwaldMN@state.gov', 'greenwaldmn', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (376, null, 'ALYSON', null, 'GRUNDER', '5149083656', null, 'GrunderAL@state.gov', 'grunderal', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (377, null, 'JAMES', null, 'WILLIAMS', '6136885319', null, 'WilliamsJHA@state.gov', 'williamsjha', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (378, null, 'NICHOLAS', null, 'GIACOBBE', '4165951700', '216', 'Giacobbenj@state.gov', 'giacobbenj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (379, null, 'IAN', null, 'HILLMAN', '6046425390', null, 'HillmanIT@state.gov', 'hillmanit', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (380, null, 'JUDITH R', null, 'BAROODY', '5623303352', null, 'BaroodyJR@state.gov', 'baroodyjr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (381, null, 'ANNE', null, 'CALLAGHAN', '5713150811', null, 'CallaghanAT2@state.gov', 'callaghanat2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (382, null, 'LAURIE', null, 'WEITZENKORN', '5065192210', null, 'WeitzenkornLB@state.gov', 'weitzenkornlb', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (383, null, 'KELLY', null, 'KEIDERLING', '53783335519', '2480', 'KeiderlingKA@state.gov', 'keiderlingka', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (384, null, 'PATRICIA', null, 'HAWKINS', '8095663131', '4641', 'HawkinsPM@state.gov', 'hawkinspm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (385, null, 'MARTI', null, 'ESTELL', '59322562890', '4231', 'EstellME@state.gov', 'estellme', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (387, null, 'DONNA', null, 'ROGINSKI', '5032784444', '2481', 'RoginskiDJ@state.gov', 'roginskidj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (388, null, 'JEANETTE', null, 'DAVIS', '2027369128', null, 'DavisJE3@state.gov', 'davisje3', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (389, null, 'MARY', null, 'THOMPSON', '50223311541', '4278', 'ThompsonJonesM@state.gov', 'thompsonjonesm', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (390, null, 'ALEXANDER J.', null, 'MCLAREN', '5922254900', '237', 'McLarenAJ@state.gov', 'mclarenaj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (391, null, 'MARA', null, 'TEKACH-BALL', '5092221504', null, 'TekachBallMR@state.gov', 'tekachballmr', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (392, '-1', 'MELISSA', null, 'COOPER', '5042369320', '4510', 'CooperMJ@state.gov', 'coopermj', 'password', 242, 'I', null, 410, 'Q1', 'red', null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (393, null, 'GLENN', null, 'GUIMOND', '8769356053', null, 'guimondg@state.gov', 'guimondg', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (394, null, 'JOANNE', null, 'JORIA', '526566113000', null, 'JoriaJ@state.gov', 'joriaj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (395, null, 'LYNN', null, 'ROCHE', '523332682125', null, 'RocheLW@state.gov', 'rochelw', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (396, null, 'JEFFERSON', null, 'BROWN', '525550802000', null, 'BrownJT2@state.gov', 'brownjt2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (398, null, 'LIZA', null, 'DAVIS', '526646227639', null, 'DavisLiza@state.gov', 'davisliza', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (399, null, 'CHRISTOPHER', null, 'DEGNAN', '59994613066', '244', 'DegnanCJ@state.gov', 'degnancj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (400, null, 'MARCIA', null, 'BOSSHARDT', '5052666010', '4581', 'BosshardtMP@state.gov', 'bosshardtmp', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (401, null, 'EUGENE', null, 'SANTORO', '5072077228', null, 'SantoroEC@state.gov', 'santoroec', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (402, null, 'KAREN', null, 'WILLIAMS', '59521213715', null, 'WilliamsKL2@state.gov', 'williamskl2', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (403, null, 'JOSIE', null, 'SHUMAKE', '5116182559', null, 'ShumakeJS@state.gov', 'shumakejs', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (404, null, 'THOMAS', null, 'WALSH', '597472900', null, 'WalshTJ@state.gov', 'walshtj', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (405, null, 'ROBERT', null, 'SKINNER', '8686225979', '2702', 'SkinnerRL@state.gov', 'skinnerrl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (406, null, 'KATIE', null, 'STANA', '7033027144', null, 'StanaMK@state.gov', 'stanamk', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (407, null, 'SALOME', null, 'HERNANDEZ', '582129078325', null, 'HernandezSL@state.gov', 'hernandezsl', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (410, '-1', 'ALLA', null, 'SURIKOV', '2022602189', null, 'surikovsa@state.gov', 'surikovax', 'surikovax1!!', 1, 'H', null, 111, 'Q1', 'green', null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (411, null, 'TANYA', null, 'ANDERSON', '90112123722221400', '226', 'andersontc@state.gov', 'robertsrl', 'password', 306, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (489, 'Mrs.', 'MERRIE', 'D', 'BLOCKER', '2024538795', null, 'blockermd2@state.gov', 'blockermd2', 'blockermd2', 245, 'A', null, 410, 'Q1', 'brown??', to_date('12-08-2005 11:47:36', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (460, '-1', 'HILARY', null, 'BRANDT', '202-453-8822', null, 'brandthh@state.gov', 'brandthh', '98Galion68!', 307, 'A', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (459, '-1', 'DANIEL', 'M', 'WITMEYER', '2022037367', null, 'witmeyerdm@state.gov', 'witmeyerdm', 'Witmeyer1', 303, 'A', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (462, '-1', 'TEST', null, 'FSN', '898989898', null, 'qwe@state.gov', 'testfsn', 'testfsn1', 245, 'A', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (497, '-1', 'AWAW', null, 'AWAW', '999-666-3333', null, 'awaw@state.gov', 'awaw', 'awawawaw', 245, 'A', null, 356, 'Q1', 'awaw', to_date('24-08-2005 10:38:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (592, '-1', 'SERGEY', null, 'SURIKOV', '789', null, 'surikovsa@state.gov', 'surikovsas', 'Surikov!', 245, 'N', null, 410, 'Q1', 'blue', to_date('03-04-2006 14:18:49', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (491, 'Mrs.', 'RANDA', 'A', 'NOUR', '2022037242', null, 'nourra@state.gov', 'nourra', 'nourranda', 245, 'I', null, 410, 'Q1', 'pink?', to_date('12-08-2005 11:58:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (472, '-1', 'ALLA', null, 'TEST2PAOBENINI', '1234345435', null, 'test2paobenini@state.gov', 'test2paobenini', 'test2PAOBenini', 245, 'I', null, 92, 'Q1', 'green', to_date('02-08-2005 14:42:59', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (473, '-1', 'ALLA', null, 'TESTPAODWYER', '1321321321', null, 'testpaodwyer@state.gov', 'testpaodwyer', 'TestPAODwyer', 245, 'I', null, 410, 'Q1', 'green', to_date('03-08-2005 15:22:49', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (291, null, 'JOHN', null, 'DWYER', '390646742368', null, 'DwyerJP@state.gov', 'dwyerjp', 'password', 242, 'I', null, 410, null, null, null);
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (492, 'Ms.', 'CLARICE', null, 'BOWEN', '202-203-7347', null, 'bowendc@state.gov', 'bowendc', '1moonchild', 303, 'H', null, 564, 'Q1', 'green', to_date('15-08-2005 15:04:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (505, '-1', 'FSN', null, 'PERU', '123', null, 'fsnperu@state.gov', 'fsnperu', 'FsnPeru1!', 245, 'N', null, 410, 'Q1', 'FsnPeru', to_date('23-09-2005 12:36:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (506, '-1', 'FSN', null, 'BOLIVIA', '321', null, 'fsnbolivia@state.gov', 'fsnbolivia', 'fsnBolivia1!', 245, 'N', null, 410, 'Q1', 'fsnbolivia', to_date('23-09-2005 12:41:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (495, '-1', 'EDWARD', 'W', 'BAILER', '999-999-9999', null, 'EBailer@state.gov', 'bailerew1', 'BailerEW1', 242, 'A', to_date('01-01-2011', 'dd-mm-yyyy'), 410, 'Q1', 'paisley', to_date('23-08-2005 12:38:21', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (564, '-1', 'TEST', null, 'VER11', '2022037347', null, 'EBailer@state.gov', 'testver11', 'tESTVER11!', 306, 'A', to_date('05-12-2007', 'dd-mm-yyyy'), 410, 'Q1', 'BLUE', to_date('20-01-2006 14:45:14', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (498, '-1', 'ASD', null, 'ASD', '1231321312', null, 'eqwe@state.gov', 'eqwe', 'asdasdasd', 245, 'A', null, 410, 'Q1', 'ad', to_date('24-08-2005 11:07:28', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (500, '-1', 'FSNBRAZIL', null, 'BRAZIL', '202-203-7347', null, 'fsnbrazil@state.gov', 'fsnbrazil', 'brazil123', 245, 'A', null, 410, 'Q1', 'green', to_date('06-09-2005 15:19:50', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (565, '-1', 'NEWUSER', null, 'VERSION11', '202-203-7279', null, 'EBailer@state.gov', 'bailerew', 'Testver11!', 245, 'A', null, 568, 'Q1', 'Red', to_date('24-02-2006 14:59:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (566, '-1', 'J', null, 'DOE', '202-203-7279', null, 'EBailer@state.gov', 'doejx', 'Passw0rd', 241, 'A', null, 568, 'Q1', 'red', to_date('14-03-2006 16:00:23', 'dd-mm-yyyy hh24:mi:ss'));
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (567, '-1', 'JOHN', 'Q', 'ADAMS', '2022037279', null, 'EBailer@state.gov', 'x', 'Testver11!', 245, 'A', null, 568, 'Q1', 'Red', to_date('16-03-2006 13:44:44', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 400 records committed...
insert into USR (USR_CD, USR_PFX, USR_FNAME, USR_MI, USR_LNAME, USR_PHONE, USR_EXT, USR_EMAIL, USR_UNAME, USR_PASS, USR_ROLE_CD, USR_IS_ACT, USR_EST_DEPART_DT, USR_AUTH_AGENT_ID, USR_SCRTY_QUEST, USR_SCRTY_ANSWR, USR_PASS_CRTD_DT)
values (568, '-1', 'HIERONYMOUS', null, 'BOSCH', '202-203-7279', null, 'bailerew@state.gov', 'bailerew', 'Testver11!', 242, 'A', to_date('15-01-2007', 'dd-mm-yyyy'), 495, 'Q1', 'red', to_date('23-03-2006 10:44:23', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 400 records loaded
prompt Enabling triggers for USR...
alter table USR enable all triggers;
set feedback on
set define on
prompt Done.
