DROP table "Q42ADMIN"."REASERCH_DATES";

CREATE TABLE "Q42ADMIN"."REASERCH_DATES" (
"IDS" NUMBER(10) NOT NULL, 
"DESCRIPTIONS" VARCHAR2(255) NOT NULL,
"START_DATE" DATE NOT NULL, 
"END_DATE" DATE NOT NULL, 
PRIMARY KEY("IDS")
) TABLESPACE "USERS" ;

--1
--INSERT INTO "Q42ADMIN"."REASERCH_DATES" ("IDS", "DESCRIPTIONS", "START_DATE", "END_DATE") VALUES (ReaserchDates_IDs.NextVal, 'Project 1', '1-Jul-2002', '30-Jul-2002');
--2
--INSERT INTO "Q42ADMIN"."REASERCH_DATES" ("IDS", "DESCRIPTIONS", "START_DATE", "END_DATE") VALUES (ReaserchDates_IDs.NextVal, 'Project 2', '1-Aug-2002', '30-Aug-2002');
--3
--INSERT INTO "Q42ADMIN"."REASERCH_DATES" ("IDS", "DESCRIPTIONS", "START_DATE", "END_DATE") VALUES (ReaserchDates_IDs.NextVal, 'Project 3', '1-Sep-2002', '15-Sep-2002');
--4
--INSERT INTO "Q42ADMIN"."REASERCH_DATES" ("IDS", "DESCRIPTIONS", "START_DATE", "END_DATE") VALUES (ReaserchDates_IDs.NextVal, 'Project 4', '1-Oct-2002', '30-Oct-2002');
--
--COMMIT;
