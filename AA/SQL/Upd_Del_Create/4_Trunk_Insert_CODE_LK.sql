prompt PL/SQL Developer import file
prompt Created on Thursday, April 06, 2006 by ssurikov
set feedback off
set define off
prompt Disabling triggers for CODE_LK...
alter table CODE_LK disable all triggers;
prompt Truncating CODE_LK...
truncate table CODE_LK;
prompt Loading CODE_LK...
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
values ('PHONE', 'H', 'Home phone');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PHONE', 'B', 'Business phone');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PHONE', 'C', 'Cell phone');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PHONE', 'F', 'Fax');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('ADDRESS', 'H', 'Personal Address');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('ADDRESS', 'B', 'Business Address');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('EMAIL', 'PR', 'E-Mail1');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('EMAIL', 'OR', 'E-Mail2');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'LI', 'Log In page');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('TOPIC_TYPE', 'AD', 'Advertisement ');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('TOPIC_TYPE', 'FT', 'Feature');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('TOPIC_TYPE', 'ST', 'Story');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('TOPIC_TYPE', 'CS', 'Capsule Story');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PREFIX', 'Mr.', 'Mister');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PREFIX', 'Mrs.', 'Misses');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PREFIX', 'Ms.', 'Miss');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('PHONE', 'O', 'Other');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SAVEDSEARCH', 'CONT', 'Contact List');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'SG', 'Sub-Global Menu (ID=201-299)');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('USRSTAT', 'A', 'Active');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('USRSTAT', 'I', 'Inactive');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('USRSTAT', 'N', 'Newly Registered');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('USRSTAT', 'H', 'On Hold');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SAVEDSEARCH', 'UPD', 'Search is used on screen Update Alumni Info');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SAVEDSEARCH', 'MAIL', 'Mail Label Report. Search is used in Reports ');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('TOPIC_TYPE', 'HT', 'Help Topic');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('TOPIC_TYPE', 'NW', 'News');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SECR_QUEST', 'Q1', 'What is your favorite color?');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('NAVIGATION', 'GL', 'Global Menu (ID = 101-999)');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SAVEDSEARCH', 'STAT', 'Statistical Reports');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'AF/C', 'AF/C');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'AF/E', 'AF/E');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'AF/EPS', 'AF/EPS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'AF/EX', 'AF/EX');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'AF/PDPA', 'AF/PDPA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'AF/RSA', 'AF/RSA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'AF/S', 'AF/S');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'AF/SPG', 'AF/SPG');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'AF/W', 'AF/W');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'CA/P', 'CA/P');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'CBA', 'CBA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'CINCPAC Honolulu', 'CINCPAC Honolulu');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'DRL/CRA', 'DRL/CRA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'DRL/IL', 'DRL/IL');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'DRL/MLA', 'DRL/MLA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'DRL/PHD', 'DRL/PHD');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'DRL/SEA', 'DRL/SEA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'DS/T/ATA', 'DS/T/ATA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/ANP', 'EAP/ANP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/BCLTV', 'EAP/BCLTV');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/CM', 'EAP/CM');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/IET', 'EAP/IET');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/J', 'EAP/J');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/K', 'EAP/K');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/P', 'EAP/P');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/PD', 'EAP/PD');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/PMBS', 'EAP/PMBS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EAP/RSP', 'EAP/RSP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/EPPD', 'EB/EPPD');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/ESC/ESP', 'EB/ESC/ESP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/ESC/IEC', 'EB/ESC/IEC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/IFD/ODF', 'EB/IFD/ODF');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/IFD/OIA', 'EB/IFD/OIA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/IFD/OMA', 'EB/IFD/OMA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/TPP/ABT', 'EB/TPP/ABT');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/TPP/BTA', 'EB/TPP/BTA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/TPP/MTA', 'EB/TPP/MTA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/TRA/AN', 'EB/TRA/AN');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EB/TRA/OTP', 'EB/TRA/OTP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/A/E', 'ECA/A/E');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/A/L', 'ECA/A/L');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/A/S', 'ECA/A/S');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/EC', 'ECA/EC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/FFSB', 'ECA/FFSB');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/IIP/EX', 'ECA/IIP/EX');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/P', 'ECA/P');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/P/V', 'ECA/P/V');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/PE/C', 'ECA/PE/C');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'ECA/PE/V', 'ECA/PE/V');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/ACE', 'EUR/ACE');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/AGS', 'EUR/AGS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/ERA', 'EUR/ERA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/EUR/CACEN', 'EUR/EUR/CACEN');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/NB', 'EUR/NB');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/NCE', 'EUR/NCE');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/PG', 'EUR/PG');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/PPD', 'EUR/PPD');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/PRA', 'EUR/PRA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/RPM', 'EUR/RPM');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/RUS', 'EUR/RUS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/SCE', 'EUR/SCE');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/SE', 'EUR/SE');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/UBI', 'EUR/UBI');
commit;
prompt 100 records committed...
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/UMB', 'EUR/UMB');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'EUR/WE', 'EUR/WE');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'FODAG USAID', 'FODAG USAID');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP-ECA/IT', 'IIP-ECA/IT');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP-ECA/IT/NUS', 'IIP-ECA/IT/NUS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP/G/AF', 'IIP/G/AF');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP/G/CP', 'IIP/G/CP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP/G/EAP', 'IIP/G/EAP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP/G/EUR', 'IIP/G/EUR');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP/G/IR', 'IIP/G/IR');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP/G/NEA-SA', 'IIP/G/NEA-SA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP/G/WHA', 'IIP/G/WHA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP/SC', 'IIP/SC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IIP/T/ES', 'IIP/T/ES');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INC/C/CP', 'INC/C/CP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INL/AAE', 'INL/AAE');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INL/LP', 'INL/LP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INL/PC', 'INL/PC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/AA', 'INR/AA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/EAP', 'INR/EAP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/EC', 'INR/EC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/EU', 'INR/EU');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/GGI', 'INR/GGI');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/I', 'INR/I');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/IAA', 'INR/IAA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/IRE', 'INR/IRE');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/NESA', 'INR/NESA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/R', 'INR/R');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/REA', 'INR/REA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'INR/SPM', 'INR/SPM');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IO', 'IO');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IO/EDA', 'IO/EDA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IO/OIC/P', 'IO/OIC/P');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IO/PHO', 'IO/PHO');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IO/PPC', 'IO/PPC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IO/S', 'IO/S');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IO/SHA', 'IO/SHA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IO/T', 'IO/T');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'IO/UNP', 'IO/UNP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/ARPI', 'NEA/ARPI');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/ELA', 'NEA/ELA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/ENA', 'NEA/ENA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/I', 'NEA/I');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/IPA', 'NEA/IPA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/IR', 'NEA/IR');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/MEPI', 'NEA/MEPI');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/PPD', 'NEA/PPD');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/RA', 'NEA/RA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NEA/SA/EX', 'NEA/SA/EX');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NP-AC-PM-VC/EX', 'NP-AC-PM-VC/EX');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'NR/TNC', 'NR/TNC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/E', 'OES/E');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/ENV', 'OES/ENV');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/ETC', 'OES/ETC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/GC', 'OES/GC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/IHA', 'OES/IHA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/OA', 'OES/OA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/OMC', 'OES/OMC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/PCI', 'OES/PCI');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/SAT', 'OES/SAT');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'OES/STC', 'OES/STC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PA/EI', 'PA/EI');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PA/OBS', 'PA/OBS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PA/PL', 'PA/PL');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PA/PR/FPCW', 'PA/PR/FPCW');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PA/PRS', 'PA/PRS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PA/RMO', 'PA/RMO');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PA/SCP', 'PA/SCP');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PM/ISO', 'PM/ISO');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PM/PPA', 'PM/PPA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PM/RSAT', 'PM/RSAT');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PM/SNA', 'PM/SNA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'PM/WRA', 'PM/WRA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'SA/AC', 'SA/AC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'SA/AR', 'SA/AR');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'SA/INS', 'SA/INS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'SA/PB', 'SA/PB');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'SA/PD', 'SA/PD');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'SA/RA', 'SA/RA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'USUN/W', 'USUN/W');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'USUNNY', 'USUNNY');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'VO/P', 'VO/P');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/AND', 'WHA/AND');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/BSC', 'WHA/BSC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/CAN', 'WHA/CAN');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/CAR', 'WHA/CAR');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/CCA', 'WHA/CCA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/CEN', 'WHA/CEN');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/EPSC', 'WHA/EPSC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/MEX', 'WHA/MEX');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/OAS', 'WHA/OAS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/PDA', 'WHA/PDA');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/PPC', 'WHA/PPC');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'WHA/USOAS', 'WHA/USOAS');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('USRSTAT', 'W', 'Newly Registered On Hold');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SAVEDSEARCH', 'DIST', 'Distribution List');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('OFFICE_CD', 'M/FSI', 'M/FSI');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SECR_QUEST', 'Q2', 'What is your father''s middle name?');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SECR_QUEST', 'Q3', 'Who was your childhood hero?');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SECR_QUEST', 'Q4', 'Where did you first meet your spouse?');
commit;
prompt 200 records committed...
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('SECR_QUEST', 'Q5', 'What make was your first car or bike?');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('FILTER_CRITERIA', 'CNTRY', 'Country');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('FILTER_CRITERIA', 'POST', 'Post');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('FILTER_CRITERIA', 'OFFICE_CD', 'Office Code');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('FILTER_CRITERIA', 'ROLE', 'Role');
insert into CODE_LK (ITEM, ITEM_CD, ITEM_DESC)
values ('FILTER_CRITERIA', 'ALL', 'All Users');
commit;
prompt 205 records loaded
prompt Enabling triggers for CODE_LK...
alter table CODE_LK enable all triggers;
set feedback on
set define on
prompt Done.
