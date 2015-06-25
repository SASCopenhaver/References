prompt PL/SQL Developer import file
prompt Created on Thursday, April 06, 2006 by ssurikov
set feedback off
set define off
prompt Creating FS...
create table FS
(
  ITEM      VARCHAR2(500),
  ITEM_ID   INTEGER,
  PARENT_ID INTEGER
)
tablespace ALUMNI
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 504K
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );

prompt Disabling triggers for FS...
alter table FS disable all triggers;
prompt Truncating FS...
truncate table FS;
prompt Loading FS...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Peace & Security', 1, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Peace Corps', 10550, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Defense Policy', 3, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Conflict Resolution', 4, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arms Control', 5, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Defense Conversion', 6, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Military & Democracy', 7, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Terrorism', 8, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('NATO', 96, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Other Security Alliances', 97, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Homeland Defense', 15200, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('British Defense Policy', 10705, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Military Policy', 11711, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Foreign Policy', 2, 1);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Foreign Relations', 11056, 2);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Foreign Service', 11480, 2);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Freedom & Democracy', 9, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Human & Civil Rights', 10, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Rule of Law', 11, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Federalism/U.S. Government', 12, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('State & Local Government', 13, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Politics & Parties', 16, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Elections', 17, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Judicial System', 18, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Professional Ethics', 71, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Grassroots Democracy', 72, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Women''s Rights', 89, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Children''s Rights', 90, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Feminism', 11798, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Women''s Activities', 10539, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Women''s Affairs', 10760, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Women''s Role', 11904, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Administration of Justice', 143, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Civil Society', 15080, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diplomatic Training', 15090, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Transparency', 15110, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('NGO Development', 1200, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Administration', 73, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Public Administration', 16122, 73);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Administration, International', 16196, 73);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Policy Analysis', 16187, 73);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Personnel Systems', 16198, 73);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Affairs', 15100, 73);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theory Of Public Admin', 16226, 73);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Democracy & Human Rights', 9030, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Democratic Institutions', 1610, 9030);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Building Democratic Institutions', 9031, 9030);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pluralism', 1620, 9030);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Advancing Human Rights', 9032, 9030);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Human Rights', 11502, 9030);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Promoting Civic Education', 9033, 9030);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Civil Liberties', 10678, 9030);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('USSV&P', 9040, 9);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. Political System/Elections', 9041, 9040);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diversity & Common Ground', 9042, 9040);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. Approach to Civics & Law', 9043, 9040);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. Education & Culture', 9044, 9040);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arts, Literature, & Language', 9045, 9040);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Government/Public Policy', 10006, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Government', 10105, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('European and Colonial Government', 11562, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Local Government', 10771, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('British Government', 11532, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Local Government', 1500, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Government', 10878, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('City Government', 10924, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Government', 11399, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Government Int''l Relations', 11241, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Government and Politics of Italy', 11404, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Government and Political Science', 10687, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Civic Affairs', 10546, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Adhoc', 10016, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Child care', 11543, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Finance', 11452, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Information', 11530, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cadastral Information System', 16029, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Welfare', 11617, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Welfare', 11674, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Child Welfare', 11580, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Specialized Services - Governmental', 11281, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Administration', 11282, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Police Administration', 10940, 11282);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Prison Administration', 11039, 11282);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Youth', 8000, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Youth Activities', 10373, 8000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Youth leadership', 10464, 8000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Safety', 86, 10006);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Emergency & Disaster Management', 87, 86);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociology & Social Work', 135, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociology & Social Work, Business Administration', 16208, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociology & Social Work, Public Administration', 16209, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Rural Settlement Patterns', 11367, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Human Development', 11105, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Human Ecology', 10585, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Workers'' Education', 10805, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ethnography', 16068, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Folklore', 11092, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ethnomusicology', 16069, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Gerontology', 16090, 135);
commit;
prompt 100 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Interdisciplinary Developments', 16261, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociology', 1800, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociology of Religion', 11749, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociological Sciences', 11569, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Sciences', 1000, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Industrial Sociology', 11201, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cultural Sociology', 22001, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociological Research', 11890, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociological Jurisprudence', 11309, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociolinguistics', 11820, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Socialized Medicine', 10975, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Rural Sociology', 11123, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Change', 10089, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Welfare', 10280, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Theory', 11900, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Studies', 10626, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Service', 11450, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Research', 11294, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Relations', 11220, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Problems', 11561, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Planning', 11456, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Philosophy', 11538, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Organization', 11604, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social History', 11516, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social and Intellectual History', 11193, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social & Economic History', 11783, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Family System, U.s.', 16278, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Women''s Studies', 16371, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Methodology (sociology)', 16279, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Science Statistics', 16326, 1800);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Work', 10153, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Psychological Social Work', 16195, 10153);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Psychiatric Social Work', 11035, 10153);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Group Work', 11521, 10153);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Case Work', 16303, 10153);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Clinical Social Work', 16304, 10153);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Recreation', 10498, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Big Game Research', 11047, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Game Management', 11287, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Soccer', 10405, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sports & Recreation', 10896, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sports', 10738, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Girl Scout Activities', 11465, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Boy Scouts World Jamboree', 11040, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mutual Understanding', 61, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. Society', 15190, 61);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Issues', 42, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Systems', 43, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Volunteerism', 45, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Immigration/Assimilation', 46, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diversity & Pluralism', 47, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Disability Issues', 50, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Youth & Family Issues', 51, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Gender & Women''s Issues', 52, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Religion', 53, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('NGO Management/Development', 85, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Role of NGOs', 15230, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Domestic Violence', 91, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Services', 4600, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aging Issues', 15220, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Minorities', 11718, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor', 48, 42);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor & Industrial Relations', 11036, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor Education', 11585, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor Movements', 11419, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor Organization', 11616, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor Project', 10757, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor Relations', 10377, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor-Management Relations', 10520, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor Unions', 10311, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Collective Bargaining', 16213, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Employment & Unemployment', 16214, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Manpower', 16215, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Us Labor', 16216, 48);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Law', 123, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environmental Law', 11873, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Criminal Law', 11715, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Law', 10090, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Forestry Law', 11780, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Canon Law', 10866, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Civil Law', 10956, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Law', 11131, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Government and Public Law', 11454, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business Law', 16028, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Constitutional Law', 16036, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Roman Law', 11329, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Law & Government', 11214, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Law & Diplomacy', 16377, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arbitration', 11037, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Jurisprudence', 10213, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Judiciary Systems', 16125, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Court Administration', 11627, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Courts & Civil Procedure', 11177, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Law - Advisory Opinion', 11178, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Legal Institutions', 11167, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tort Law', 16103, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('US Legal System', 16107, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Business Law', 16120, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Islamic Law', 16124, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Malpractice Law', 16135, 123);
commit;
prompt 200 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Observation Us Courts, Court Admin', 16322, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Criminology', 114, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Prison Reform', 16236, 114);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business & Labor Law', 11961, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor Law', 10455, 11961);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Corporate Law', 10987, 11961);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Commercial Law', 10558, 11961);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Administrative and Internaitonal Law', 11391, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Administrative Law', 11524, 11391);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Law', 10114, 11391);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Law', 11512, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Trade Law', 11651, 11391);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East German Law', 11166, 11391);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Law', 10590, 11391);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Civil Law', 11108, 11391);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('African Law', 10103, 11391);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public International Law', 10338, 11391);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Law Enforcement', 19, 123);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Study of Law Enforcement', 10069, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Money Laundering', 74, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Trafficking in People', 88, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Drug Trafficing', 16045, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anti-Corruption', 92, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Interdiction', 98, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Customs Enforcement', 99, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Border Control', 100, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Community Policing', 15140, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Immigration Enforcement', 15150, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Law Enforcement Administration', 15160, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Narcotics Trafficking', 15170, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Police Studies', 16186, 19);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economics', 1400, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic Theory', 10077, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Microeconomic Theory', 16141, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Macroeconomic Theory', 11947, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic Planning', 16048, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic Systems', 11912, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematical Economics', 10491, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic Statistics', 11790, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Advanced Economic Statistics', 11192, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fiscal Theory', 16074, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic Development', 10067, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic Development and Trade', 10078, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Labor Economics', 10075, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Job Market Assessment', 1600, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Asian Economics', 10772, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('European Economics', 11668, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Current Political Economy', 11747, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Energy Economics', 11971, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Home Economics', 10717, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Land Economics', 11941, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Management Economics', 11542, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political & Economic Studies', 11251, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Economics', 10895, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Lego-Economics', 10381, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Transportation Economics', 16104, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Monetary Theory', 16143, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marketing (economics)', 16269, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Money And Banking', 16270, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Observation Of Us Economic Inst', 16271, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic Security & Trade', 9020, 1400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Domestic Economic Policy', 9021, 9020);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Trade & Investment', 9022, 9020);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Promoting Economic Reform', 9023, 9020);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. Foreign Assistance', 9025, 9020);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economics & Industry', 21, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic & Business Development', 29, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Community Development', 14, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Intellectual Property Rights', 23, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. Economy', 20, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Trade', 22, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Financial Markets', 24, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Finance', 25, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Actuarial Science', 16001, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Monetary Policy', 26, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Privatization', 27, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Competitiveness', 28, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aviation', 31, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Transportation Systems', 41, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Management Issues', 83, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Industrial Management', 10348, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Industrial Psychology', 11723, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Employment Issues', 93, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Involuntary Unemployment', 10963, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Recreation & Tourism', 1425, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Entrepreneurship', 3600, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Globalization', 15000, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Industrial Relations', 10865, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Metalsmithing', 11213, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Transportation', 138, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Maritime Affairs', 16263, 138);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pipelines And Tankers', 16264, 138);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Rapid Transit', 16265, 138);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Us Roads And Highways', 16266, 138);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Planning', 15, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Planning & Development', 10012, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Development & Planning', 11680, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Architecture & Urban Planning', 104, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban & Regional Planning', 16111, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Historic Preservation', 16092, 15);
commit;
prompt 300 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('City Planning', 10117, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Housing and City Planning', 10842, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('City and Regional Planning', 11163, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Policy', 6700, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Transportation', 11736, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Sociology', 11725, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Planning & Housing', 11622, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Geography', 11660, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Development', 11656, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Design', 11623, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Architecture', 11765, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban and Environment', 11706, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Affairs', 10658, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Park/Resource Planning', 11734, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urban Studies, General', 16211, 15);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agriculture', 30, 21);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Economics', 10029, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biology & Agriculture', 10949, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dairy Science', 10134, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Land Reform', 10165, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('4-H Activities', 10360, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Botany', 11536, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Industry', 11973, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Business', 11930, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Chemistry', 11541, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Development', 11905, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Engineering', 11072, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Geography', 11510, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Farm Management', 11997, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Farming', 16071, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Field Crops', 16072, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Food Science', 10027, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Poultry Science', 10972, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tropical Agriculture', 11545, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Land Use', 11750, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Planning', 11552, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Sciences', 10861, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Resources', 16005, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Technology', 16006, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agronomy', 10393, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Crop Management', 16307, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ecology Agronomy', 11684, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agrarian Reform', 10181, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Soil Science', 10890, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Soil Microbiology', 11021, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Soil Mechanics', 11113, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Soil Analysis', 11906, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Land Use Planning', 11002, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Weed Science', 11634, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Extension Services', 16070, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Food & Nutrition', 16076, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Food Processing', 16077, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Food Science Technology', 16078, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Veterinary Medicine', 16098, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('US Agriculture', 16106, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Post-Harvest Water Resources', 16191, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Range Management', 16202, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dairy Production', 16212, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Farm Machinery', 16327, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fertilizer Use', 16328, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Irrigation', 16329, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marketing (farming)', 16330, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Wild Life', 16331, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Protection and Integrated Pest Management', 19378, 30);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Communications & Information', 32, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Global Information Infrastructure', 9053, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Free Flow of Information', 9051, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Information Technology', 9052, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Telecommunications', 77, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Communications & Journalism', 111, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electronic Communications Technology', 16062, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Communications', 4200, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Communications Policy', 33, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mass Communications', 10196, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Speech', 10021, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Publishing', 36, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electronic Publications', 75, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Relations', 76, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Film Technology', 11677, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Audiovisual and Film Production', 10737, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Motion Picture Production', 10676, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Journalism', 4220, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Journalism Research', 10770, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Print Journalism', 34, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Broadcast Journalism', 35, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Technical Journalism', 11272, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Television Journalism', 11889, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('News Agencies', 16152, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('TV Journalism', 16176, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Photojournalism', 16183, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radio Journalism', 16201, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Press And Newspapers', 16280, 4220);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Library & Information Science', 69, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Book Cataloguing', 11038, 69);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cataloging Systems', 11859, 69);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Document Restoration', 10855, 69);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Library Admin', 16225, 69);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Media', 4210, 32);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Television Production & Direction', 11063, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Broadcasting', 16026, 4210);
commit;
prompt 400 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Television', 10750, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radio & Television', 10387, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Films as Media', 11612, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Media & Communications', 10009, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Independent & Responsible Media', 9054, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Radio & Television', 10240, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Broadcasting', 10460, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Programming Development', 11882, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('TV Medical Films', 11115, 4210);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Science & Technology', 37, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Technology', 10888, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research & Development', 40, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biotechnology', 94, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Metallurgy', 10495, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fluid Mechanics', 11226, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Mechanics', 10452, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aerodynamics & Applied Math', 12007, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aeronautics', 10500, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Gas Dynamics', 11157, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electronics', 11955, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Applied Mechanics', 11613, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Printmaking', 10453, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pulp and Paper Technology', 11663, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Food Technology', 11650, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Food Preparation', 11938, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Wool Technology', 11459, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chemical Pulping of Wood', 11268, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Textile Technology', 10467, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Clothing', 10885, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Consumer Textiles', 11018, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Energy', 39, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mining And Quarrying', 16332, 39);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Petroleum/coal/gas/energy', 16333, 39);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Solar And Wind Energy', 16334, 39);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Solar Energy', 11482, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Computer Science/Technology', 112, 37);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cybernetics', 16039, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Computer Technologies', 78, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Data Processing', 16040, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Computer Operator Technology', 16034, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Logic of Computers and Theory', 11084, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electronic Data Storage', 16063, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Information Retrieval', 16116, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Information Sciences & Systems', 11862, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Systems Analysis/Operations Research', 16173, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Systems Management', 16174, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Computer Maintenance Technologies', 16234, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Input Prep Tech (Keypunch)', 16235, 112);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Engineering', 10003, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Technical Production and Design', 11170, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Engineering Technology', 16064, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Engineering Science', 10899, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Civil Engineering', 10562, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electronic Engineering', 11896, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Communications Engineering', 16033, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bioengineering', 11698, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Construction Engineering', 11318, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biochemical Engineering', 11275, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chemical Engineering', 10031, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Engineering Mechanics', 11059, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mechanical Engineering', 10727, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Architecture & Structural Engineering', 10532, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Automotive Engineering', 11211, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Atomic Engineering', 11597, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electrical Engineering', 10126, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Industrial Engineering', 10189, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Computer Engineering', 11926, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aerospace Engineering', 10960, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biomedical Engineering', 11699, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mechanical Drawing', 10711, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Metallurgical Engineering', 11607, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nuclear Engineering', 11098, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aeronautical Engineering', 10265, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aircraft Aerodynamics', 11130, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Wood Engineering', 10375, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Wood Construction', 10376, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Highway and Railway Engineering', 11024, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hydraulic & Sanitary Engineering', 11215, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Industrial Furniture Design', 10945, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Instrumentation Engineering', 11112, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Materials Engineering', 11940, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mining Engineering', 11048, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Petroleum/Coal/Gas Engineering', 11964, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Petroleum Refining', 16165, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sanitary Engineering', 11073, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Structural Engineering', 11229, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Textile Engineering', 11762, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Traffic Engineering', 10768, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geological Engineering', 11948, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geophysical Engineering', 16088, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Transportation Engineering', 16105, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Surveying', 16114, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Optics', 16157, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Systems/Control Engineering', 16175, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Remote Sensing', 16206, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aerodynamical Engineering', 16291, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Architectural Engineering', 16292, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Combustion Engineering', 16293, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marine Engineering', 16294, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Naval Engineering', 16295, 10003);
commit;
prompt 500 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Petroleum/coal/gas Engineering', 16296, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Drafting and Design Technology/Technician, General', 16375, 10003);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environment', 38, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Waste Management', 95, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Park Management', 15040, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Wildlife Management', 10351, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Wildland Management', 11075, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Water Resources', 15070, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Natural Resources', 11069, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Water Pollution', 11917, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Air Pollution', 16007, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Watershed Management', 10762, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Limnology', 10525, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environmental Cleanup', 15030, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environmental Protection', 15060, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environmental Science', 11805, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environmental Sciences, Policy', 16066, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environmental Chemistry', 16065, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environmental Sociology', 11919, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environmental Engineering', 11911, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sanitation', 11639, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hydroelectric Energy', 16097, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Water', 16100, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('National Parks', 16149, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('National Resource Economics', 16150, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environmental Studies', 16365, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Preservation/Conservation', 15050, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Conservation', 11744, 15050);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environment/Conservation', 10005, 15050);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Forestry & Land Conservation', 11260, 15050);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Soil Conservation', 11918, 15050);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Energy Conservation', 11724, 15050);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Conservation Education', 11645, 15050);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Desalinization Of Water', 16314, 15050);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Farms& Recreation Management', 16315, 15050);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ecology', 10765, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Ecology', 10257, 10765);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marine Invertebrate Ecology', 11257, 10765);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ecology of Trout', 10763, 10765);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Vertebrate Ecology', 10636, 10765);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Forestry', 10288, 38);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Silviculture', 11094, 10288);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Forest Biology', 11960, 10288);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Forest Soils', 10382, 10288);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Artic Forestry', 10994, 10288);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Forest Service', 10321, 10288);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arts & Culture', 54, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Writing & Literature', 80, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Visual Arts', 56, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arts Management', 57, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Historic & Cultural Preservation', 60, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Folklore & Folksong', 11198, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art & Architectural History', 11596, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Artist', 10797, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Designer', 11608, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arts & Sciences', 11996, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Restoration Techniques', 11401, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research in Sculpture', 11375, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Commercial Art', 10444, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art Planning', 11988, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art Exhibit', 10138, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Conservation of Art', 10201, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Metalwork', 10271, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Culture', 11688, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cross Cultural Analysis', 11796, 11688);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cross Cultural Relations', 10630, 11688);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cross-Cultural Relations', 10749, 11688);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Culture and Civilization', 11412, 11688);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Museum Administration', 81, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Museums', 10826, 81);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Museum Work', 11361, 81);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Museum Studies', 11620, 81);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Museum Service', 10734, 81);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Museum Operational Methods', 10406, 81);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Museology', 11582, 81);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Museography', 11573, 81);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Goldsmithing', 11847, 81);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Glass Art', 11673, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Glassblowing', 10695, 11673);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Glass Works', 11834, 11673);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Glass Technology', 11437, 11673);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arts', 106, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chilean Art', 11293, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese Arts', 10252, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Decorative Arts', 11661, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Graphic Design', 10603, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Illustrating', 10985, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Industrial and Graphic Art', 10538, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Jewelry', 11068, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Product Design', 10914, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Graphic and Industrial Art', 11383, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mural Painting', 11574, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Photography', 10544, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tapestry Design', 10555, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Installation Art', 16117, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Printing & Publishing', 16192, 106);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Performing Arts', 55, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Singing and Dance', 11413, 55);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bel Canto', 11397, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mezzo-Soprano', 10433, 54);
commit;
prompt 600 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Movie Acting', 10795, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Opera Production', 11088, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Opera Staging', 10545, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Architecture', 58, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Architecture', 11550, 58);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Gothic Art & Architecture', 11326, 58);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Gothic', 11778, 58);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Italian Architecture and design', 11511, 58);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Architectural Philosophy', 11549, 58);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Landscape Architecture', 10570, 58);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Naval Architecture', 10621, 58);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Film', 59, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Films Photography', 11595, 59);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Animated Film', 11853, 59);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cinematography', 10366, 59);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Cinema', 10653, 59);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art History', 107, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Far Eastern Art History', 10655, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dutch Baroque Art History', 10623, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dance History', 11843, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cambodian Art History', 11484, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Medieval Art', 11359, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art Quattrocento', 11776, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Christian Art & Archaeology', 11382, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art & Architectural History', 10401, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art & Art History', 12013, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Architectural History', 10493, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Music History', 10323, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art/Archaeology', 10015, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Art', 11133, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Art History', 11791, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('15th Century of Italian Sculpture', 10639, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('14th Century French Music', 11010, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ancient Church Music', 11328, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('16th Century Italian Art', 11508, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research on Lorenzo de Medici', 11389, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century German Opera', 11802, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century Italian Art', 11509, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian 16th Century Painting', 11387, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Renaissance Art', 11501, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Painting and Art History', 10752, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Renaissance Art History', 11788, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Renaissance Painting', 10537, 107);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fine Arts', 10147, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fine Art Conservation', 10691, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fine Art & Architecture', 11979, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fine and Communicative Arts', 10648, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Franciscan Legend in Italian Painting', 11392, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Drawing', 11195, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese Landscape Painting', 10656, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Graphic Arts', 10106, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Graphics', 10832, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sculpture', 10101, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Painting', 16163, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Painting and Graphics', 10324, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Baroque Art', 11505, 10147);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Music', 127, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Composition', 11553, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Conducting', 16035, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Music Composition', 16144, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Music Theory', 16145, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Music, American', 16146, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Musical Instrument Training', 16147, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Musicology', 16148, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Carillon', 10625, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ethno-Musicology', 11726, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Piano Music', 11265, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Music Festival', 10192, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Church Music and Composition', 11434, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chanson', 11182, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Improvisation Chant', 11158, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('General Music', 11721, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Opera', 10457, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Voice', 16099, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Orchestral Conducting', 10526, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Psychology of Music', 11409, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Welsh Music', 11844, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Music', 11169, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Kantele', 11874, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marimba', 11923, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Wind Instruments', 16101, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('String Instruments', 16112, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Organ/Harpsicord', 16158, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Piano', 16185, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Musical Performers', 16247, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Music', 16368, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Obsv Of Us Music & Institutions', 16323, 127);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theater & Dance', 137, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Acting', 16000, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dance', 10568, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Choreography', 10173, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Directing', 16042, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Drama', 16044, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theater & Stage', 16262, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theater Arts', 10446, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Children''s Theater', 11589, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Theater', 10233, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Language Theater', 10756, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('17th Century French Theater', 10054, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Renaissance Theatre', 10362, 137);
commit;
prompt 700 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theatre History', 10364, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pantomine', 10367, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Film Studies', 16073, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('US Theatre & Institutions', 16109, 137);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Folk Art', 10217, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Folk Music', 11202, 10217);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Folk Architecture', 11823, 10217);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Folk Dance', 10420, 10217);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fashion', 10951, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fabric Design', 10694, 10951);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ceramics', 10065, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ceramic design & Manufacture', 11042, 10065);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ceramics & Printed textiles', 11575, 10065);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Design and Crafts', 10159, 54);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arts & Crafts', 10349, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Crafts', 16037, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Decorative Arts', 11185, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Design', 10833, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Interior Design', 10140, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Weaving', 10290, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Textiles', 10631, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Textile Design', 10905, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Typographical Design', 10595, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Weaving Design', 11821, 10159);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education', 62, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Education', 11638, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Student Studies', 10306, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bilingual Education', 16020, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language Teaching', 16134, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Reading Comprehension', 16203, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Foreign Student Advising Education', 10779, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Foreign Student Advisor', 12004, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Childhood Education', 10909, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Kindergarten and Elementary Education', 10508, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Elementary Education', 10507, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Elementary and Secondary Education', 10304, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, American History', 16049, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, American Literature', 16050, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, Geography', 16051, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, History, non-US', 16052, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, Mathematics', 16053, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, Medical Sciences', 16054, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, Political Science', 22004, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, Music', 16055, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, Physical Education', 16056, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, Physics & Astronomy', 16057, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, Science', 16058, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education, Sociology', 16059, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Counseling', 16060, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Statistics & Research', 16061, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('High School Science', 11058, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Primary Education', 15020, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Secondary Education', 63, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Post-secondary Education', 64, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Higher Education', 10035, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Continuing Education', 67, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Adult Education', 10028, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Adult and Workers Education', 11528, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Special Education', 10718, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching of the Blind', 10777, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education of the Deaf', 10700, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Deaf Education', 10418, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education of Deaf Children', 11544, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Handicapped Education', 10887, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education of Emotionally Disturbed', 11968, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education of Mentally Retarded Children', 11082, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Sociology', 11864, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sociology of Education', 10279, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Technology', 11635, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Theory', 11937, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Psychology', 10145, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching', 10285, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching Assistant', 10591, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching Fellow', 10202, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pedagogy', 10356, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching & Concertizing', 10950, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Counseling', 10383, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Counseling and Guidance, Education', 11954, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Coaching', 10187, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Supervising Teacher', 10819, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Student Counseling', 10466, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Student Activities', 10522, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Civics Education', 68, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Curriculum Development', 70, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Vocational Education', 84, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Distance Education', 142, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Family Life Education', 10533, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Education', 10332, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Child Development', 10976, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Childhood Development', 16046, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education of Exceptional Children', 10222, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Computer/Technical', 15010, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Education', 10296, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Education & Recreation', 10933, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Science Education', 11615, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Teaching', 65, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Teaching Assistant', 10299, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Government Teaching Assistant', 10848, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching English as a Foreign Language', 12014, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Program Learning', 10163, 62);
commit;
prompt 800 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Audio-visual Education', 10733, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Graduate Legal Studies', 11833, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Guidance', 11522, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Assistant Lycee Thiers', 11546, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Liberal Arts', 11283, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Movement Education', 10964, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Provost', 11041, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Workshops & Seminars', 11014, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Religious Education', 11856, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education Of Culturally Disadvantaged', 16221, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Developments', 16222, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Observation Us Adult Ed Facilities', 16223, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Observation Us Educat Institutions', 16224, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Interdisciplinary Studies In Policy', 16352, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Programmed Learning', 16353, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching, Agricultural School', 16354, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching, Law School', 16355, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching, Medical School', 16356, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching, Primary Level', 16357, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching, Secondary Level', 16358, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching, Univ Level Education', 16359, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching, Univ Sci/math/eng/tech', 16360, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching, Univ Soc Sci/lit/lib Arts', 16361, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teaching, Vocat/technical School', 16362, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tests & Measurements', 16363, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.s.educational System', 16364, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('High School/secondary Studies', 16350, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Institute Planning And Devel', 16351, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Training', 18000, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Industrial Training', 16115, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marine & Oceanographic Training', 11944, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electronics Training', 11925, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Printing & Lithographic Training', 11671, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Textile Technology Training', 11884, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Transportation & Pub Utility Trng', 18024, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Welding', 18025, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Work Camp Projects', 18026, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aeronautical And Aviation Training', 18001, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Training', 18002, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Automotive Training (incl Mechanic)', 18003, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Banking & Financial Training', 18004, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business And Commercial Training', 18005, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Communications & Broadcasting Trng', 18006, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Construction & Building Codes', 18007, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Construction Machine Operation Trng', 18008, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electromechanical Training', 18009, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Forestry & Wildlife Training', 18010, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Laboratory Technology Training', 18011, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Library Assistant Training', 18012, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mechanical Training', 18013, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Obsv Of Trng Progs & Facilities', 18014, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Peace Corps/comm Development Trng', 18015, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Photographic Training', 18016, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pilot Training', 18017, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Police, Law Enforcemt & Corrections', 18018, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Printing & Lithographic Trng', 18019, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Repair & Maintenance Tech Training', 18020, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sanitation & Pub Health Inspection', 18021, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Secretarial Training', 18022, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Special Training; Other', 18023, 18000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teacher Training', 10017, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Teacher Education', 11004, 10017);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematics Teacher Training', 11927, 10017);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Science Teacher Training', 16207, 10017);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('College Teacher Training', 16298, 10017);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Childhood & Elem Teacher Trng', 16299, 10017);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Practice Teaching', 16300, 10017);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Secondary Teacher Training', 16301, 10017);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Science Teacher Training', 16302, 10017);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art and Music Education', 11611, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Art Education', 10412, 11611);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Music Education', 10151, 11611);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Rural Education', 11630, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Education, Primary', 16003, 11630);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Agricultural Education, Professional', 16004, 11630);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Farm Cooperatives', 16320, 11630);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Secondary Educ, Rural', 16321, 11630);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Educational Administration', 1650, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Education Administration', 10523, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('School Administration', 10993, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Secondary Administration', 15240, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('University Administration', 82, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('College And University Admin', 16272, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Community College Admin', 16273, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Personnel (educational)', 16274, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Primary School Administration', 16275, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Registrar Services', 16276, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Vocat/technical School Admin', 16277, 1650);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Studies', 66, 62);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American History', 101, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Literature', 102, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Civilization', 10641, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Cultural History', 11732, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Diplomacy', 11109, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Language & Literature', 10490, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Literature & Civilization', 10959, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary American Civilization', 11239, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Folklore', 10932, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Poetry', 10774, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Criticism', 11189, 66);
commit;
prompt 900 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Texas History', 11240, 66);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anthropology & Archaeology', 103, 103);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anthropology', 1100, 103);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anthropology', 11817, 135);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Artic Anthropology', 10273, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cultural Anthropology', 10073, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Anthropology', 10082, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aboriginal Anthropology', 11753, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Anthropology', 10188, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Anthropology', 10262, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History & Anthropology', 11184, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Linguistic Anthropology', 11494, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ethno-musicology', 16267, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Minorities & Min Relations', 16268, 1100);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Archaeology', 10746, 103);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Archaeology', 10434, 10746);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Archaeological Methods', 16015, 10746);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern Archaeology', 10672, 10746);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pollen Analysis & Archaeology', 11146, 10746);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Roman Archaeology', 11250, 10746);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Greek Archaeology & History', 11365, 10746);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Prehistoric Archaeology', 11742, 10746);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History', 121, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Studies', 10651, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classics', 10022, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical History', 10728, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pre-History', 10879, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Historiography', 11818, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Archives', 10856, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Civilization', 11267, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative History', 11276, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Civil-Military History', 10182, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Civics History', 10408, 10182);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Military History', 11837, 10182);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Naval History', 10681, 10182);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic History', 10051, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic History of Greece & Turkey', 11364, 10051);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Economic Thought', 11920, 10051);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Economic History', 22002, 10051);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diplomatic History', 10640, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of International Relations', 11089, 10640);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Diplomatic History', 11216, 10640);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diplomatic History of Modern Europe', 11458, 10640);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('European Diplomatic History', 10802, 10640);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cultural & Political History', 11984, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cultural History', 10504, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cultural & Intellectual History', 11712, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Intellectual and Political History', 10248, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Intellectual History', 10566, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Intellectural History', 10953, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Renaissance Intellectual History', 11152, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cultural History & Theater', 11763, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Theatre Arts', 10854, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literary History', 10709, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History & Theory of Architecture', 11841, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political History', 10214, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Political History', 11159, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Commonwealth History', 10679, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Reformation History', 11151, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Economics', 11913, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Education', 11828, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Journalism', 11807, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Social Science', 11264, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History and Humanities', 11444, 11984);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Fine Arts', 11337, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Modern Art', 10511, 11337);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Oriental Art', 11341, 11337);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Painting', 11355, 11337);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Modern', 11755, 11337);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of 17th Century Painting', 11380, 11337);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Music', 10836, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Historical Musicology', 11009, 10836);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History & Music', 11989, 10836);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Piano', 11356, 10836);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Science', 10487, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Natural History', 11246, 10487);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Chemistry', 11471, 10487);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Philosophy', 11519, 10487);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Historical Demography', 11628, 10487);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Historical Geography', 11274, 10487);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cance Theory & History', 11764, 10487);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Religion', 10274, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Historical Theology', 11999, 10274);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Modern Church History', 11826, 10274);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Church History', 10807, 10274);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Biblical Studies', 10620, 10274);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Buddhism', 11514, 10274);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Jewish History', 10684, 10274);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ancient, Medieval & World History', 11117, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ancient and World History', 10747, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Ancient Medieval Medicine', 10494, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Byzantine History', 11298, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Byzantine History', 11300, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Athenian History', 11225, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Assyriology', 10436, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Egyptology', 10342, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Roman History', 10707, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mediaeval History', 10120, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mediaeval History', 10606, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mediaeval Studies', 11794, 11117);
commit;
prompt 1000 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ottoman History', 11678, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Late Medieval & Early Modern History', 11815, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval & Renaissance History', 11708, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Renaissance History', 10129, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ancient Greek History', 10723, 11117);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('World History', 10130, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('15th & 16th Century History', 11835, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sixteenth Century History', 10301, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('16th & 17th Century History', 10703, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century History', 10714, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century Civilization', 10572, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century History', 10216, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('World or Modern European History', 10371, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern World History', 10518, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern History', 10042, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History, non-US, General', 16094, 10130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('European History', 10425, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century European History', 10607, 10425);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Modern European History', 10619, 10425);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern European History', 10048, 10425);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Central European History', 10977, 10425);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Danish History', 11531, 10425);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Finnish History', 11619, 10425);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Norwegian History', 10758, 10425);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Greek History', 11493, 10425);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Portuguese History', 10893, 10425);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('British History', 10125, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('British Business History', 10680, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('British Political History', 11840, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tudor History', 11625, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century British History', 11457, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern British History', 10816, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English History', 10206, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Medieval History', 10982, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('17th Century English History', 10706, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Church History', 11529, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century English History', 10803, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Renaissance History', 11078, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern English History', 10209, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scottish History', 10876, 10125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French History', 10058, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Political History', 11127, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval French History', 11344, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('16th Century French History', 10576, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('17th Century French History', 10327, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Historiography of the 19th Century', 11353, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Art - 19th Century French Arch.', 11181, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Voltaire and 19th Century Historians', 11074, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of French Music', 11489, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of French Socialism', 11175, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Colonial Policy', 11358, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern French History', 10315, 10058);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German History', 10488, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary German History', 10432, 10488);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century German History', 10485, 10488);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cultural History of the Weimar', 11784, 10488);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Middle High German and Mythology', 10423, 10488);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Wilhelmian Germany', 10443, 10488);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern German History', 10440, 10488);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian History', 10409, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Naples', 11371, 10409);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Italian Renaissance Architecture', 11368, 10409);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Neo-Fascism in Post-War Italy', 11372, 10409);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Organized Socialism in Italy', 11378, 10409);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Italian Intellectual History', 11393, 10409);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Austrian History', 11761, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Austrian History', 10877, 11761);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Austria', 11125, 11761);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Austrian Naval History', 10246, 11761);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Belgian History', 10927, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Belgian Colonialism', 11470, 10927);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish History', 10454, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History Spain of Tropical Africa', 11829, 10454);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish-Latin History', 11052, 10454);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East European History', 10838, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century Polish History', 11819, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Polish History', 10637, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Eastern Euopean & USSR History', 11705, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Balkan History', 11646, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Russian History', 10018, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Russo-Finnish History', 10293, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Russian History and Civilization', 10414, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Russian History', 11435, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic & East European History', 11605, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Serbian History', 11626, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic History', 10929, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Slavic History', 10801, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Rumanian History', 10646, 10838);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Eastern History', 10948, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Far Estern History', 11606, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asian History', 10569, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern History', 10124, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History, Near & Middle Eastern', 16093, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('South Asian History', 11709, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Southeast Asian History', 11710, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Middle Eastern History', 10937, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of the Modern Middle East', 11685, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese History', 10380, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Chinese History', 11119, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese History & Language', 11515, 10948);
commit;
prompt 1100 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese History', 10463, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Korean History', 11658, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of India', 10884, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian History', 10347, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hindu Civilization', 11411, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arabic History', 11491, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Contemporary Turkey', 11327, 10948);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History & Language of North America', 11174, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Canadian History', 11702, 11174);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American History & Civilization', 11090, 11174);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Development of Western Territories', 11124, 11174);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Anglo-American Labor History', 11846, 11174);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of the Atlantic Community', 10579, 11174);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. History', 16311, 11174);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American & Caribbean History', 11700, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American History', 10096, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Argentine History', 10212, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century Argentine History', 11554, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Colonial Andean History', 11692, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bolivian History', 10883, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian History', 10411, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Peruvian History', 10903, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mexican History', 11570, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mexican History and Literature', 11571, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Caribbean History', 11689, 11700);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('African History', 10696, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East African Precolonial History', 10689, 10696);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asian/Pacific/Australian History', 11868, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asian/Pacific/Australian History', 11858, 121);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asia/Pacific/Australia History', 11915, 11868);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Australian History', 11051, 11868);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philippine History', 10930, 11868);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Literature', 122, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literature & Language', 10841, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Languages & Literature', 11965, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Language & Literature', 11290, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Literature & Language', 11578, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Language & Literature', 11338, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Languages & Medieval Languages & Literature', 10875, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anglo-Norman Language and Literature', 10415, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Breton Language & Literature', 11205, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Celtic Languages and Literature', 10690, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Literature, English, and Latin', 11453, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Language & Literature', 10268, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Victorian Science & Literature', 11842, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Irish Language & Literature', 10556, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Romance Languages & Literature', 10107, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Romance Language and Literature', 10404, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Romance Language & Literature', 11339, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Germanic Langs & Lit', 16242, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Language & Literature', 10060, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Language and Literature', 10059, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Language, Literature & Culture', 10403, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Provencial Language & Literature', 10973, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Language & Literature', 10531, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Language & Literature', 10076, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Language & Literature', 10062, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scandinavian Language & Literature', 11676, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old Norse Language & Literature', 11767, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Icelandic Language & Literature', 11769, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Danish Language & Literature', 11559, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hispanic Language & Literature', 10554, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Language and Literature', 22005, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English and American Language and Literature', 10776, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Portuguese Language & Literature', 10850, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East European Language & Literature', 10839, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Eastern European Language & Literature', 11716, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Russian Language & Literature', 10869, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Polish Language & Literature', 10870, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic & Eastern Europe Language & Literature', 11603, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic Language & Literature', 10882, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Yugoslav Language & Literature', 11850, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Macedonian Language & Literature', 11852, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian Language & Literature', 11054, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Asian Language & Literature', 11727, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern Language & Literature', 11863, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Persian Language & Literature', 11564, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asian Language & Literature', 11703, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('South Asian Languages & Literature', 16369, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese Language & Literature', 10390, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese Language & Literature', 10889, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Korean Language & Literature', 10913, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hindi Language & Literature', 10394, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marathi Language & Literature', 10902, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bengali Literature & Language', 11086, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Middle East Language & Literature', 11610, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Far Eastern Language & Literature', 11190, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Oriental Languages and Literature', 11323, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('African Language & Literature', 11719, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Literature, Afro-American', 16126, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Literature, Arabic', 16127, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Literature, East Asian/Australian', 16128, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Literature, Islamic', 16129, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Literature, Latin American/Caribbean', 16130, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Literature, Western European', 16131, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Literature, non-US, General', 16132, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language History', 16133, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Languages', 10183, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language', 10528, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Language', 12009, 10183);
commit;
prompt 1200 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dialectology', 10384, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Interpreting/Translating', 11746, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Other Language', 16161, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Braille Translation', 11655, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language Theory', 11857, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language Arts', 10719, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Languages', 10300, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Culture', 11043, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Language & Area Study', 10983, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English and Latin', 10720, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Latin', 10808, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin', 10704, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin & Greek', 10710, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Languages', 10725, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ancient Greek', 11363, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Romance Language', 10180, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Germanic Languages', 11579, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Germanics', 10503, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin Language', 10506, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Languages', 11315, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('European Languages', 10971, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Foreign Language', 10769, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English as a Foreign Language', 10004, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Textbooks for Foreign Language', 10184, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Language', 10025, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English', 10052, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American English', 16305, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English & Latin', 10720, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English & Social Studies', 10395, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English & History', 10926, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English - Speech', 11011, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Modern English', 11150, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Urban Dialects', 10697, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old Irish', 11258, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Irish', 10527, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French', 11357, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Language', 10053, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Language and Culture', 10312, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Language & Culture', 10817, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Language & Civilization', 10365, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Phonetics', 10302, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Language and Humanities', 10318, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French as a Second Language', 11990, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Dialectology', 10303, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Language', 10068, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern German', 11803, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Austrian Dialects', 11679, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Language', 10142, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Language & Culture', 11136, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish, Hispano-Arabic Language', 10661, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish', 10085, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Language', 10050, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Language & Culture', 11145, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Language & History', 11572, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Spanish', 10669, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Portuguese Language', 10236, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scadinavian Language', 11279, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Russian Language', 10292, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Russian & Other Slavic Languages', 10730, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Romance and Slavic Languages', 10521, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic & Finno-Ugric Languages', 11091, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic Languages', 10617, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Czech and Hungarian Language', 10732, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Greek', 11351, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Greek Language', 11551, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Language', 10923, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Language', 11252, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Quechua Indian Language & Culture', 10208, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Language', 10254, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Indian Languages', 16306, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('FarEastern Languages', 10478, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Oriental Languages', 11408, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese Language', 10379, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese Language', 10654, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Turkish Language', 10786, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Iranian', 10437, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arabic Language', 10514, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Turkic Language', 10378, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern Language', 10634, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Middle Eastern Languages & History', 11433, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Semitic Languages', 11314, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hebrew Language', 11483, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indics', 11974, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pashto Language', 10561, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hindi Language', 11462, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sinhalese Dialect', 10788, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sanskrit', 10628, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese Sanskrit and Chinese', 10778, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sumerian Language', 11786, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sesuto Dialect', 10792, 10183);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Linguistics', 124, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('TEFL/Applied Linguistics', 136, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Linguistics/TEFL', 12010, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Linguistics', 10575, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Discourse Analysis', 16043, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Letters', 11567, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy and Letters', 11568, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Linguistic Analysis', 11295, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Linguistics', 10553, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old French and Linguistics', 11352, 124);
commit;
prompt 1300 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Linguistics', 10448, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Italian Linguistics', 11500, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Linguistics', 11394, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Linguistics', 10152, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese Linguistics', 10860, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Burmese Linguistics', 10726, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian linguistics', 11292, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Balkan Linguistics', 10647, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indo-European Linguistics', 10574, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Russian Linguistics', 11360, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic Linguistics', 10638, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Serbo-Croatian Linguistics', 10729, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Romance Linguistics', 10928, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Finno-Ugric Linguistics and Folklore', 11432, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philology', 10849, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Philology', 11321, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Philology', 11362, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Humanistic Philology', 10551, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Philology', 11523, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic Philology', 11525, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavonic Philology', 10269, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin Philology', 10234, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Greek Philology', 10445, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Romance Philology', 10435, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Philology', 10465, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish-Hispanic Philology', 10662, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Rumanian Philology', 11227, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Turkish & Comparative Altaic Philology', 11256, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Phonetics', 10602, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Phonology', 11534, 124);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literature', 10039, 122);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Folk Literature', 11583, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Song Literature', 10474, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dramatic Literature', 10422, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Poetry', 11297, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Literature', 10104, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Children''s Books', 11134, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Mythology', 10605, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Classical Literature', 10759, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Literature', 10482, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Literature', 10549, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Baroque Literature', 11468, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Provincial Literature', 10947, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Religious Literature', 16205, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literature & Civilization', 10592, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Creative Writing', 113, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Writing', 10984, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literary Writing', 11587, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Playwriting', 10688, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literary Composition', 11867, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Composition', 10564, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Poetry', 10298, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Prosody', 11581, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Epigraphic Studies', 11492, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Humanistic Literature', 11774, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literature & Culture', 10385, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fiction & Criticism', 10701, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literary Criticism', 10954, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fiction & Poetry', 10791, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Forms of Drama', 11369, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Drama', 11895, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Renaissance Literature', 10644, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century Literature', 10127, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early 18th Century Satire', 10693, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century Novel', 11822, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('20th Century Literature', 11808, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('New Testament & Literature', 11209, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern American Literature', 11809, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('European Literature', 10413, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin Literature', 10952, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin Classics', 11513, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Latin Poetry', 11331, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Roman Classics', 11137, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern French Literature', 10989, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Literature', 10045, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old French Literature', 10581, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Poetry', 10938, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary French Poetry', 11487, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern French Poetry', 10967, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Symbolism', 11022, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Drama', 10326, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Medieval Drama', 11490, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Satire', 10862, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Novel', 10922, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern French Novel', 11336, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Literary Criticism', 11548, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Vocal Literature', 11343, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French & Comparative Literature', 11061, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Literature and Civilization', 11340, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Classical Drama', 11547, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern French Drama', 10851, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval French Literature', 10317, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Classicism', 10586, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('The Classicism of Andre Gide', 11349, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary French Drama', 10402, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary French Literature', 10330, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern French History & Literature', 10587, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French History & Literature', 10735, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Surrrealistic Novel', 11120, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('20th Century French Literature', 10359, 10039);
commit;
prompt 1400 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('20th Century French Poetry', 10573, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century- Early 20th Century French Lit.', 10991, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century French Literature', 10205, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century French Poetry & Criticism', 11325, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th & 20th Century French Literature', 10577, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theology & French Literature', 10370, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('17th Century French Literature', 11350, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century French Literature', 10354, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('16th Century French Literature', 10583, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hugo & French Romanticism', 11049, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century German Literature', 10813, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Literature', 10249, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval German Literature', 10369, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern German Literature', 10431, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Drama', 10450, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Classics', 11103, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Structures of German Classics', 11785, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary German Literature', 10211, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Romantic Literature', 10593, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German-English Literary Relations', 11461, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Post War German Poetry', 11787, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Literary Criticism', 11793, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Women Writers', 11800, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Austrian Literature', 10198, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('British Literature', 10907, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval English Literature', 10582, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anglo Saxon Literature', 10358, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Welsh Literature', 10852, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English/American Literature', 11730, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th & 20th Century English', 11278, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century English Literature', 10698, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('18th Century English Literature', 11139, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('17th Century English Literature', 11212, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old English Literature', 10207, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Victorian Literature', 11255, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Drama', 11590, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Renaissance Drama', 11537, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Poetry', 10116, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research on Byron in Italy', 11376, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Shakespeare', 11317, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literature - French Influence on Chaucer', 11221, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Literature', 10020, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Literature & History', 11129, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Middle English Literature', 11013, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Elizabethan Drama', 10560, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern British and American Literature', 10071, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English and American Literature', 10295, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Criticism on G. B. Shaw', 11782, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dickens', 11093, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Literature - John Henry Newman', 11003, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Greek Tragedy in the works of T.S. Eliot', 11001, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('British Fiction and Drama', 10686, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Irish  Folklore', 10633, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Irish and Middle English Literature', 11448, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Irish Literature', 10461, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('George Moor''s "Irish Period" (1900-10)', 11000, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old Icelandic Literature', 10524, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dutch Folk Literature', 11305, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dutch Literature', 11414, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Norse Literature', 10868, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old Norse Literature', 10597, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Icelandic Folklore & Literature', 11768, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Norwegian Literature', 10814, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Swedish Drama', 11664, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Danish Literature & Bibliography', 10277, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Danish Literature', 10276, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scandinavian Literature', 10289, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Literature', 10193, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Italian Literature', 10616, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Renaissance Drama', 10543, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Quattrocento Dialogues', 11773, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Italian Poetry', 10410, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research in Literature of Dante', 11373, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research on Dante', 11381, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary English and German Writers', 11463, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century German Drama', 10481, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('19th Century German Literature', 10599, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Italian Literature', 11384, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Literature Culture', 11506, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anglo-Italian Literature', 11390, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Literature & Philosophy', 11114, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Drama', 10645, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Literature', 10063, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Spanish Literature', 11168, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Spanish Literature', 11637, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Drama of the 18th Century', 11176, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Baroque Drama', 10667, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('20th Century Spanish Literature', 10649, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('17th Century Spanish Literature', 10660, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Poetry', 10428, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Epithalamium in the Spanish Golden Age', 11831, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Unamuno', 11138, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Portuguese Literature', 10479, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Greek Literature', 10102, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Greek Literature', 10113, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Literature', 10143, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Romance Literature', 10399, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Russian Literature', 10567, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Polish Literature', 10880, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic Literature', 12011, 10039);
commit;
prompt 1500 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Romanian Literature', 11825, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Romanian Poetry', 11654, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Spanish American Literature', 11693, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hispanic Literature', 10986, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mexican Literature', 10044, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Argentine Legends', 11739, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Argentine Literature', 10064, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese Literature', 10072, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('African Languages', 10708, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Literature', 10086, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin-American Literature', 10229, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anglo-American Literature', 22003, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Literature and Culture', 10087, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('South American Literature', 10156, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish American Literature & Culture', 10175, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish-American Literature', 10218, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish American Literature', 11558, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mexican Drama', 10509, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian Literature', 10091, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian Literature & Culture', 11556, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Brazilian Literature', 11141, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Guatemalan Literature', 10176, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Peruvian Literature', 10219, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Far Eastern Literature', 10372, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern Literature', 10357, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Persian Literature', 11670, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Politics and Literature', 10751, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Literature', 10931, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Indian Literature', 11410, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sanskrit Poetry', 11770, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sanskrit Drama', 11771, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Turkish Literature', 10673, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese Literature', 10981, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Australian Literature', 10203, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('New Zealand Literature', 11417, 10039);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy', 128, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ethics', 11244, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Esthetics', 10513, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aesthetics', 10943, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophical Psychology', 11077, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scholastic Philosophy', 11319, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophical Logic', 11902, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Logic and Analytic Philosophy', 11472, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('English Philosophy', 11439, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Philosophy', 10447, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diderot', 11107, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Far Eastern Philosophy', 10251, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Philosophy', 11007, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Renaissance Philosophy', 10942, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Philosophy', 11263, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Philosophy', 10713, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy of History', 10215, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medieval Philosophy of Science', 10263, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy of Religion', 10328, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophical Theology', 11235, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy of Mind', 11539, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy of Art', 11347, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, American History', 16168, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, American Literature', 16169, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, Biological Sciences', 16170, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, Education', 16171, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, Language & Literature', 16172, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, Language & literature', 16177, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, Law', 16178, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, Media', 16179, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, Music', 16180, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, Political Science', 16181, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy, Public Administration', 16182, 128);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Religious Studies', 134, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theology', 16102, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Systematic Theology', 11232, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Protestant Theology', 11335, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theology and Physics', 10497, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('World Religions', 11722, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Folk Religion', 11813, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Religion', 11609, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Church History', 10322, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Christian Ethics', 10407, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Christian Mission Work', 11430, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Patristics', 11507, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Papal History', 10936, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scottish Church History', 11838, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Jewish Literature and History', 10275, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hinduism', 10629, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biblical History', 12002, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old Testament', 11801, 12002);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old Testament Iconography', 11385, 12002);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Old Testament Studies', 11481, 12002);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('New Testament', 10441, 12002);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Buddhism', 10392, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Buddhist History', 11669, 10392);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theravadin', 10391, 10392);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Islamics', 11475, 134);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Islamic', 11079, 11475);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Islamic Art', 10873, 11475);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Islamic Architecture', 16376, 11475);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Islamic History', 11495, 11475);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Islamic Studies', 10804, 11475);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Relations/Area Studies', 7400, 7400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Development', 16121, 7400);
commit;
prompt 1600 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Alliances', 16283, 7400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Organizations', 16284, 7400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Public Service', 16285, 7400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Science', 130, 7400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Politics', 10172, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Area Politics', 11931, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Sociology', 10226, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Politics', 10228, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Regional Study', 11690, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Regional Studies', 11957, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Regional Planning', 10874, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Regional Geography', 11081, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Philosophy', 10910, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Rhetoric', 11624, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Politics', 10925, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative European Politics', 10510, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Western Europe & Canada Politics', 11892, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Eastern European & USSR Politics', 11707, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Soviet Politics', 10970, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asian/Pacific/Australian Politics', 11875, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asia/Pacific/Australia Politics', 11907, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('African Politics', 11881, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Politics', 10115, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern Politics', 11910, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Southeast Asian Politics', 11921, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Italian Government and Politics', 11377, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Middle East Politics', 11156, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Science, Near & Middle Eastern', 16188, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Science, South Asian', 16189, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Science, US', 16190, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin America & Caribbean Politics', 16255, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Municipal Government', 16256, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Observation Of Us Government', 16257, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Parties', 16258, 130);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ethnic Studies', 139, 7400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ethnology of French Colonial Areas', 11354, 139);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ethnology in the Risayan Islands', 11424, 139);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Ethnography', 11644, 139);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diplomacy', 10664, 7400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diplomatic & Economic Relations', 11236, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Franco-American Relations', 11333, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French & German relations', 10799, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anglo-Spanish Diplomatic Relations', 10990, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish and Inter-American Relations', 10179, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Lat American & Carib-us Relations', 16286, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East-West Relations', 11854, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Eastern European & USSR - US Relations', 11952, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('West Europe & Canada-us Relations', 16310, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('West Europe & Canada Relations', 16370, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Western European Relations', 16379, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asia/Pacific/Australia-US Relations', 11916, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indo-Sinic Relations', 10968, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italo-American Cultural Relations', 11504, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese-American Cultural Relations', 10476, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Africa-us Relations', 16308, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('South Asian-us Relations', 16309, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('South East Asian - U.S. Relations', 11969, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Intercultural Relations', 11247, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Affairs', 10588, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Economics', 10853, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Education', 10919, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Educational Exchange', 11097, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Health', 11720, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Labor Relations', 10935, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Music Centre Congress', 10261, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Organization', 10744, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Political Affairs', 11436, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Trade', 11460, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public and Foreign Affairs', 11320, 10664);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Area Studies', 105, 7400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Inter-American Studies', 11070, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('European Community', 10333, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('European Integration', 10944, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('European Studies', 10846, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French American Literary Relations', 11348, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Trade Unionism', 11560, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Culture', 11342, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Civilization', 10584, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Political Parties', 11485, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Culture and Education', 10310, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary French Life & Thought', 11110, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Economics & Government', 11301, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Government Assistant', 11302, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Government Lectureship', 11303, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Industrial Relations', 11777, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Labor Movements', 11334, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French Seminar', 11995, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German & French History', 11183, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German and Mathematics', 10427, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Church History', 11795, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Civilization', 10917, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Culture', 11469, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Film', 11959, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Governent', 10468, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Intellectual History', 10456, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Economic & Political History', 11304, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Lieder', 11756, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Literature & History', 10492, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Musical Scores', 11657, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Philosophy', 10915, 105);
commit;
prompt 1700 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Social Movements', 11797, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Sociology', 11806, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German Studies', 11210, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Germanic Studies', 10783, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Personality of Germany', 10998, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('German-Turkish Diplomatic History', 11273, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Greek Philosophy', 11366, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Contemporary Italian Art and Culture', 11503, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Danish Culture', 11087, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scandinavian Studies', 10232, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Icelandic Relations', 11149, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Icelandic Studies', 10421, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Norwegian Drama and Theatre', 11431, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Norwegian Folk Music', 11427, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nowegian Church and Organ Music', 11425, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Israeli Culture', 11199, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Culture', 11388, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Film', 10955, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Opera', 11179, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italian Philosophy', 11566, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Italic Topography', 11249, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese Diplomatic History', 11812, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese Studies', 11733, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Culture', 10164, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Economic History', 11675, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Western Europe & Canada History', 11757, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Western Europe & Canada Studies', 11871, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Western Europe Since 1870', 11316, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Western European Economy', 11128, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Western European History', 11118, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Eastern European & USSR Studies', 11956, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Eastern European Studies ', 10345, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Slavic Studies', 11296, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Russian Studies', 10731, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Asian Studies', 10336, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asia/Pacific/Australia Studies ', 11909, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('African Brazilian Studies', 11695, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('African Colonial Studies', 11345, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('African Studies', 10740, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Afro-American Area & Regional Studies', 16016, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Afro-Asian Studies', 11687, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('American Indian Area & Regional Studies', 16017, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Far Eastern Studies', 10036, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Central Asian Studies', 11332, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese Civilization', 10286, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese Culture', 12005, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chinese Studies', 10098, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Civilization', 10255, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Studies', 10148, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('India Seminar', 11983, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Art', 10754, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Culture', 10471, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Music', 10612, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Music Theory', 10965, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Philosophy', 10753, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Indian Seminar', 11993, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arab Affairs', 10677, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Iranian Studies', 11980, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Persian Education', 11565, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arabic Culture & Economics', 11322, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arabic Language & History', 11324, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Area Studies', 10227, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Studies', 10066, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American & Caribbean Studies', 11855, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Affairs', 10980, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Colonial History', 11740, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Culture', 10995, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American Geography', 11271, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish American Political Institutions', 11164, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish Empire-Latin American', 10668, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Argentine Civil-Military Relations', 10969, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian American Studies', 11743, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian Economics', 11557, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian Government', 10946, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian History & Civilization', 11122, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Brazilian Law', 10939, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Luso-Brazilian Studies', 10168, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hispanic American Studies', 10224, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hispanic-American Studies', 10230, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hispanic Studies', 10864, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hawaiian Culture', 10442, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern - U.S. Relations', 11962, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern Art', 10790, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern Geography', 11949, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Near Eastern Studies', 10368, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nepalese Studies', 11488, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Area & Regional Studies, Near & Middle Eastern', 16018, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Netherlands Domestic and Political History', 11407, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('New Religious Sects in Korea', 11814, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('New Zealand Foreign Policy', 11418, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('New Zealand History', 10871, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Moari Art', 11576, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Maori Art', 11577, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('North East Studies', 11731, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Peruvian Agrarian Reform', 11745, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Peruvian Culture & Commerce', 11307, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('South Asian Area Studies', 11641, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('South Glamorgn I Higher Education', 10806, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Southeast Asian Studies', 11942, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tibetan', 10472, 105);
commit;
prompt 1800 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tibetan Studies', 11173, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Japanese Tech. On Papermaking', 11810, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mexican State & Northern Agriculture', 11752, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Latin American', 10540, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Middle Eastern Studies', 10489, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Islamic Culture', 11474, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Italian History', 10535, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Italian Relations with the Balkans', 11386, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Oriental History and Philosophy', 10743, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Oriental Philosophy', 11026, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Oriental Studies', 10614, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Polish Studies', 10916, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political History of Central Europe', 11055, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Role of French Students', 11270, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Rural Community Study of Luzon', 11423, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. French Relations', 10578, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. Philippine Relations', 11421, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Venetian History', 11053, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Danish Youth/Labor Seminar', 10287, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Eastern European Area and Language Study', 11451, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sinology', 11154, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Turcology', 11836, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research - Importance of America to Italy', 11379, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research in Ifugao', 10773, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research in Italian Library Science', 11370, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research Spanish Elderly', 11827, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scandinavian Immigration to the U.S.', 11426, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anglo-american Studies', 16227, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Black Colleges', 16228, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Canadian-american Studies', 16229, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mexican-american Cultural Studies', 16230, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Observation Afro-am Activ & Organ', 16231, 105);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Political Security', 9010, 9010);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Alliance Security/Regional Stability', 9011, 9010);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arms Control/Non-Proliferation', 9012, 9010);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Peacekeeping Operations', 9014, 9010);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('U.S. Defense Policy', 9015, 9010);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Global Issues', 9060, 9060);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Crime & Terrorism', 9061, 9060);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Narcotics Control', 9062, 9060);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Environment & Sustainable Development', 9063, 9060);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Immigration, Refugees, Population', 9064, 9060);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('AIDS & Infectious Diseases', 9065, 9060);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business', 10001, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business Development', 1300, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business Policy', 11928, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business Subjects', 11012, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Trade and Finance', 11447, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Trade Unionism', 11446, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Commercial Science', 11403, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Statistics', 10825, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Commercial Studies', 10857, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Advertising', 16002, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Banking', 11933, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bookshops', 10167, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cooperatives', 10389, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Metal Shop', 11186, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Building And Construction', 16287, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cost And Financial Administration', 16288, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Personnel', 16289, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Production And Manufacturing', 16290, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Investments And Securities', 16317, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Management Training', 16318, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marketing', 11633, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marketing-Retailing', 10652, 11633);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Marketing', 11666, 11633);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marketing Research', 16312, 11633);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Multinational Corporations', 16313, 11633);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business Administration', 109, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Administration of Small Business', 11135, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business Administration, Political Science', 16027, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Business/Management', 3500, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Management', 16136, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Management Information Systems', 16137, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hotel/Restaurant Management', 1875, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hotel & Resort Administration', 11966, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Human Resources Management', 16096, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('US Taxes', 16108, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Commerce', 16032, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Supply Chain Management', 16113, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Insurance', 16118, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Organizational Behavior', 16159, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Production & Manufacturing', 16194, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Finance & Tax Policy', 16197, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Real Estate', 16204, 109);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Business', 11735, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Business Administration', 11869, 11735);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('International Taxes', 16123, 11735);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Foreign Trade', 11291, 11735);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Accounting', 11893, 10001);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Accounting & Auditing', 11207, 11893);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Taxation', 11067, 11893);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medicine & Public Health', 10008, 10008);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Health', 49, 10008);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Drug Issues', 44, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Drug Abuse', 16297, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Infectious Diseases', 141, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('HIV/AIDS', 144, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Drug Education, Prevention, & Treatment', 145, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Public Health', 1250, 49);
commit;
prompt 1900 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chemical/Biological Agents', 15120, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nutrition', 10055, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Occupational Therapy', 10030, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Health Care Administration', 15130, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physiology of Exercise', 10674, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mental Health', 10891, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Health Administration Sociology', 11804, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Health Education', 10941, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nutrition Research', 12001, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Community Health Probs & Medicine', 16217, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Family Planning', 16218, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hospital Administration', 16219, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Observation Of Us Health Facilities', 16220, 49);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medicine', 4400, 10008);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anatomy', 10166, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Audiology', 11992, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Endocrinology', 11631, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cardiology', 10782, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pediatric Cardiology', 10784, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Pathology', 11478, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Comparative Physiology', 10132, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Clinical Pathology', 10988, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cardiovascular and Thoracic Surgery', 10796, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cardiovascular Diseases', 10793, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cardiovascular Surgery', 10789, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Prosthetics', 10962, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ear Pathology', 10512, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dentistry', 10221, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Oral Diagnosis', 10160, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Orthodontics', 10748, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Orthotics', 11034, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Oral Surgery', 10920, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Opthamology', 10966, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Orthopedic Surgeon', 10282, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Periodontology', 10283, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Prosthodontics', 10901, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pipe Organ Construction', 10622, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Gastroenterology', 11188, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Histology', 10835, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radiology', 10675, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('X-Ray Technician', 11683, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radiation Therapy', 10858, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radiotherapy', 11591, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Rehabilitation', 10921, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Behavior & Brain Physiology', 10346, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physiology', 10459, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diseases', 10319, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pathology', 10775, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pediatrics', 10794, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('General and Thoracic Surgery', 10259, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Gynecology', 11142, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Neurology', 10135, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Neurophysiology', 10417, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Neuropathology', 11903, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Neurochemistry', 11667, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Neurosurgery', 16151, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Preventive Medicine', 11861, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Therapy', 10419, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radiation Therapy in Treatment of Cancer', 10074, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Surgery', 10239, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Psychiatry', 10162, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mental Retardation', 10685, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pharmacology', 10462, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Clinical Pharmacology', 16210, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dermatology', 16041, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Internal Medicine', 16119, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Child Psychiatry', 10516, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Psychiatric Nursing', 11586, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dutch Mental Institutions', 11306, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Speech Therapy', 11985, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Speech Pathology', 11592, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plastic Surgery', 11464, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Medicine', 11922, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nursing Education', 11497, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nursing', 11535, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nuclear Medicine', 11479, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Sciences', 126, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Forensic Medicine', 16079, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Alternative Medicine', 16009, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chiropractic/Osteopathy', 16031, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Allied Fields', 16139, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Obstetrics', 16155, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ophthalmology', 16156, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Orthopedics', 16160, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pharmaceutical Science', 16167, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Otolaryngology (Ear/Nose/Throat)', 16162, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nutritional Sciences', 16154, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bacteriology', 10830, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Virology', 11030, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Epidemology', 16067, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Toxicology', 11860, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Immunology', 11935, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hematology', 10559, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Clinical Science', 10185, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Operations Research', 10291, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Technology', 11958, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Sociology', 11153, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Social Work', 10635, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Science Dentistry', 11713, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Research', 11520, 4400);
commit;
prompt 2000 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Physics', 11526, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Philosophy', 11243, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Mycology', 11422, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Microbiology', 11083, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Care Administration', 11584, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Health Services Administration', 16091, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Anesthesiology', 16281, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Family Practice', 16282, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aerospace Medicine', 16335, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Colon And Rectal Surgery', 16336, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Dental Technology', 16337, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Diagnostic Radiology', 16338, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Emergency Medicine', 16339, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('General Practice', 16340, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Internship', 16341, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Records', 16342, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Obsv Of Us Medical Institutions', 16343, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Occupational Medicine', 16344, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Optometry', 16345, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pediatric Allergy', 16346, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pharmacy', 16347, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Therapy & Other Healing', 16348, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Urology', 16349, 4400);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography', 119, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic & Political Geography', 11238, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Economic Geography', 10084, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography and Social Studies', 10097, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('World Geography', 10886, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('African Geography', 11914, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Peruvian Geography', 10908, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('East Asia/Pacific/Australia Geography', 11951, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Spanish American Geography', 10131, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, Antarctica', 16081, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, Canadian', 16082, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, East European', 16083, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, South Asian', 16084, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, Southeast Asian', 16085, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, United States', 16086, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, West European', 16087, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cartography', 11222, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geomorphology', 11416, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Oceanography', 10339, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hydrology', 10601, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Seismology', 11880, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sedimentology', 11839, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Polar Research', 11254, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Polar Meteorology', 11428, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Polar Exploration', 10827, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Photogrammetry', 11517, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marine Sciences', 11071, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marine Resources Management', 11665, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hydrology', 10601, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hydrological Survey', 11262, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aerial Photogrammetry', 10934, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geographic Information Systems', 16080, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, Latin America & Carib', 16239, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, Near Eastern', 16240, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geography, West Europe & Canada', 16241, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Demography', 115, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Population Studies', 11932, 115);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Population Control', 11970, 115);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fertility', 16237, 115);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Us Census Techniques', 16238, 115);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geology', 120, 119);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mining Geology', 10225, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Petroleum Geology', 11104, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Science', 16184, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mineralogy', 11499, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Crystallography', 11415, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hydrogeology', 11016, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geothermal Energy', 11876, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geological Sciences', 11008, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geophysics & Seismology', 16089, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geochemistry of Coal', 11405, 120);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Sciences & Mathematics', 10011, 10011);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Science', 10032, 10011);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('General Science', 10426, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Science subjects', 10079, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Early Sciences', 10867, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Life Science', 10014, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy of Science', 10341, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Science and Religion', 10458, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Materials Science', 10657, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scientific-Technical Documentation', 11005, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Scientific Research', 11963, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research Techniques', 11652, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Methodology', 11080, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Science History', 10736, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Space Sciences', 11289, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Military Science, General', 16142, 10032);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Interdisciplinary Studies', 140, 10011);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Interdisciplinary Development', 11897, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematics and Philosophy', 10501, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physics & Mathematics', 10594, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chemistry & Science', 10722, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chemical Physics', 11161, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physics & Chemistry', 10682, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Macromolecular Chemistry & Physics', 11200, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Chemistry', 10430, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biophysics', 10632, 140);
commit;
prompt 2100 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geochemistry', 11031, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geophysics', 10557, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biochemistry', 10170, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biomathematics and Bioinformatics', 16374, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematical Physics', 10906, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radiobiology', 11929, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bioengineering/Biomedical Engineering', 16022, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biomedical Sciences', 16024, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biomedical Technology', 16025, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pyschobiology', 16199, 140);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematics', 125, 10011);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematical Analysis', 11894, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematical Logic', 11140, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematical Statistics', 11248, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Philosophy of Mathematics', 11406, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('History of Math', 11816, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematical Probability', 11967, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Algebra', 16008, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Modern Algebra', 11095, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geometry', 10716, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Applied Mathematics', 16013, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mathematical Models', 16138, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Number Theory', 16153, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Probability', 16193, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Functional Analysis', 16243, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Numerical Elements', 16244, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Topology', 16245, 125);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chemistry', 110, 10011);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Analytical Chemistry', 11160, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Applied Chemistry', 16011, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Chemical Research', 11312, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Inorganic Chemistry', 10451, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Organic Chemistry', 10123, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theoretical Organic Chemistry', 11311, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theoretical & Physical Organic Chemistry', 11218, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Wood Chemistry', 11681, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Polymer Science', 11629, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plastics', 10911, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electrochemistry', 11060, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nuclear Chemistry', 10671, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Surface Colloidal Chemistry', 11563, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Saline Water Conversion', 11020, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Chemistry of Proteins', 11441, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical-Organic Chemistry', 11455, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Medical Biochemistry', 16140, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pharmaceutical Chemistry', 16166, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Petrochemicals (incl Fertilizer)', 16232, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radiochemistry', 16233, 110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biological Sciences', 108, 10011);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biology - Seed Science & Technology', 11223, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biolinguistics', 11555, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bio-Statistics', 16021, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biological Research', 16023, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Elementary Biology', 10178, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bacteriology of Fish', 11429, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Botany', 10194, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Horticulture & Forestry', 12000, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Horticulture', 11111, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Virology', 11640, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Geography', 11288, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Chemistry', 11299, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Breeding', 11096, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Biochemistry', 11632, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Anatomy', 11147, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Crop Breeding, Hybrids & Seed Analysis', 16038, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Phytopathology', 11599, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marine Botany', 10331, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Paleontology', 10812, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Paleobotany', 10484, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Micropaleontology', 10515, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Physiology', 10611, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Floriculture', 10659, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Marine Biology', 10438, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Science', 10335, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plant Pathology', 10281, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Parasitology', 10536, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cytology', 11148, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cell Biology', 11672, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tumor Biology', 11614, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cellular & Molecular Biology', 11621, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cellular Biology', 11866, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Molecular Biology', 10615, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Microbiology', 10670, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Solid Microbiology', 11662, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Palynolgy', 11851, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Enzymology', 10517, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Veterinary Science', 11998, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Veterinary Bacteriology', 11442, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Zoology', 10023, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mammalogy', 11019, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ornithology', 11085, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Ichthyology', 10997, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fisheries Biology', 11518, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fisheries, Fresh Water', 16075, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aquaculture', 16373, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Fish - Salt Water', 11883, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Organization of a Burmese Community', 11473, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Animal Science', 10388, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Animal Husbandry', 16010, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Migration', 11648, 108);
commit;
prompt 2200 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Entomology', 10099, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Developmental Biology', 11845, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Embryology', 10195, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Genetics', 10034, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Biology - Siphonaptery', 11224, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Autoradiographic Technique', 11527, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Pest Control', 16164, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Zoology, Invertebrate/vertebrate', 16319, 108);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physics & Astronomy', 129, 10011);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Sciences', 2000, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Research in Physics', 11758, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Atmospheric Sciences', 10683, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Atmospheric & Earth Sciences', 16019, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Atmospheric Dynamics', 11934, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Structural Dynamics', 11101, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Thermodynamics', 10764, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hydrodynamics', 11191, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Hypersonics & Rarified Gas Dynamics', 11017, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physics', 10061, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theoretical Physics', 11029, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theoretical Nuclear Physics', 11027, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Experimental Solid State Physics', 10133, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theoretical and Solid State Physics', 10137, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Solid State Physics', 10666, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Solid Mechanics', 11642, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plastic Deformation of Metals', 11445, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Solar Physics', 11155, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theoretical High Energy Physics', 10256, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('High Energy Nuclear Physics', 10610, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Low Temperature Physics', 10613, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Atmospheric Physics', 10398, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Atomic & Molecular Physics', 11936, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nuclear Physics', 10122, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Plasma Physics', 10475, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electron Physics', 10957, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Reactor Core Physics', 10361, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('High Energy Physics', 10486, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physics & Electronics', 10715, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mechanics', 10800, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Mechanics and Heat', 11602, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Kinematics', 10552, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radiophysics', 10563, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radio-Isotope', 11032, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nuclear Science', 10892, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nuclear Physics and Cosmic Rays', 11310, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Radio Astronomy', 11050, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Astronomy', 10241, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Astrophysics', 10712, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electron Microscopy', 10699, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physics - Atmospheric', 11197, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Meteorology', 10900, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physical Metallurgy', 11449, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Atomic Energy', 11234, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Microwave Physics', 11132, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Quantum Theory', 16200, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Acoustics', 16248, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Climatology', 16366, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Cryogenics', 16249, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Electro-magnetism', 16250, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Elementary Particles', 16367, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Geodesy', 16251, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Solid-earth Geophysics', 16252, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Space Program', 16253, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Thermal Physics', 16254, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Aerospace Science', 16324, 129);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Psychology', 131, 10011);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Developmental Psychology', 11728, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Experimental Psychology', 11165, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Applied Psychology', 16014, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Existential Psychology', 11045, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Physiological Psychology', 11440, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Clincial Psychology', 11636, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Child Psychology', 16030, 16030);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Social Psychology', 10859, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Human Relations', 11496, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Human Behavior', 16095, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Guidance & Counseling', 11649, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Psychometrics', 16259, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tests And Measures', 16260, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Abnormal Psychology', 16325, 131);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Home Economics, General', 17000, 17000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Home Decoration & Equipment', 17004, 17000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Instit & Food Prep & Catering', 17005, 17000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Institutional & Cafeteria Managemt', 17006, 17000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Clothing And Textiles', 17001, 17000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Family Relations & Child', 17002, 17000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Consumer Econ & Home Management', 17003, 17000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Humanities', 0, 0);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Arts & Humanities', 10000, 0);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Humanities and Social Sciences', 10191, 0);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Liberal Arts Curriculum', 16316, 0);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('General', 9999, 9999);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('General Subjects', 11015, 9999);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('General Studies', 11976, 9999);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Orientation', 19003, 9999);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Women, Activites & Organizations', 19004, 9999);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Conference Attendance', 19001, 9999);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Consultation', 19002, 9999);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Private Independent Studies', 16372, 9999);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('<Unspecified>', 10013, 10013);
commit;
prompt 2300 records committed...
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('China Inst.', 11981, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Europaische-Trilogie', 11754, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Field Work', 10308, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Nematology', 10958, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Primary Subjects', 10818, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Resist Techniques', 11832, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Resource Development', 11975, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Faculty Research', 10309, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Theoretical', 10978, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('French litere', 10260, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('medieval Cultural', 10343, 10013);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Unknown', 16110, 16110);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Operation Of Ed & Cul Exchanges', 20000, 20000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Tourism And Travel', 20000, 20000);
insert into FS (ITEM, ITEM_ID, PARENT_ID)
values ('Bicentennial Projects, General', 22000, 22000);
commit;
prompt 2314 records loaded
prompt Enabling triggers for FS...
alter table FS enable all triggers;
set feedback on
set define on
prompt Done.
