CREATE OR REPLACE  PACKAGE "Q42ADMIN"."PACK_GET_ALL" AS TYPE 
    rc_GetAll IS REF CURSOR;
PROCEDURE sp_getAllUsers (rc_getAllUsers  OUT rc_GetAll);
PROCEDURE sp_getAllOrgs  (rc_getAllOrgs   OUT rc_GetAll);
PROCEDURE sp_getPrjAccess(rc_getPrjAccess OUT rc_GetAll);
PROCEDURE sp_getAllPrjs  (rc_getAllPrjs   OUT rc_GetAll);
END PACK_GET_ALL;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE  PACKAGE BODY "Q42ADMIN"."PACK_GET_ALL"   AS
--================================================================================================
--================================================================================================
PROCEDURE sp_getAllUsers (rc_getAllUsers OUT rc_GetAll)
IS
BEGIN
OPEN rc_getAllUsers FOR
  SELECT IDS       AS UserID
        ,FNAME     AS UserFName
        ,LNAME     AS UserLName
        ,ACT_INACT AS UserActInact
        ,Org_ID    AS UserOrgID
        ,Supervisor_ID AS UserSuperID
        ,Passwords AS UserPass
        ,Email     AS UserEmail
  FROM Q42ADMIN.PARTICIPANTS
  ORDER BY  LName;
END sp_getAllUsers;
--================================================================================================
--================================================================================================

PROCEDURE sp_getAllOrgs (rc_getAllOrgs OUT rc_GetAll)
IS
BEGIN
OPEN rc_getAllOrgs FOR
  SELECT IDS          AS OrgID
        ,ABBREVIATION AS OrgAbbr
        ,INITCAP(FULL_NAME)  AS OrgFullName 
  FROM Q42ADMIN.ORGANIZATIONS
  ORDER BY 2;
END sp_getAllOrgs;
--================================================================================================
--================================================================================================

PROCEDURE sp_getPrjAccess (rc_getPrjAccess OUT rc_GetAll)
IS
BEGIN
OPEN rc_getPrjAccess FOR
------------------------------------------------------------------------------
SELECT -3 AS PrjAccessID, '=== Create New Project ===' AS PrjAccessDescr
FROM DUAL
------------------------------------------------------------------------------
UNION
------------------------------------------------------------------------------
SELECT -2 AS PrjAccessID, '=== View/Edit All Projects ===' AS PrjAccessDescr
FROM REASERCH_DATES
WHERE (SELECT Count(*) FROM REASERCH_DATES) > 0
------------------------------------------------------------------------------
UNION
------------------------------------------------------------------------------
SELECT DISTINCT -1 AS PrjAccessID
      ,'=== View/Edit NOT Assigned Projects ===' AS PrjAccessDescr
FROM REASERCH_DATES rd
WHERE rd.IDS NOT IN (SELECT DISTINCT a.REASERCH_ID 
                     FROM ANSWERS a
                     WHERE rd.IDS = a.REASERCH_ID)
------------------------------------------------------------------------------
UNION
------------------------------------------------------------------------------
SELECT o.IDS AS PrjAccessID
      ,'=== View/Edit Project Assigned To '|| UPPER(o.ABBREVIATION)||' ===' AS PrjAccessDescr
FROM ORGANIZATIONS o, REASERCH_DATES rd
WHERE o.ABBREVIATION =
(SELECT o.ABBREVIATION
  FROM ORGANIZATIONS o
  WHERE o.IDS = (SELECT p.ORG_ID
                 FROM PARTICIPANTS p
                 WHERE p.IDS = (SELECT a.PARTICIPANT_ID
                                FROM ANSWERS a
                                WHERE ROWNUM = 1 AND rd.IDS = a.REASERCH_ID)))
;
------------------------------------------------------------------------------
END sp_getPrjAccess;
--================================================================================================
--================================================================================================

PROCEDURE sp_getAllPrjs  (rc_getAllPrjs   OUT rc_GetAll)
IS
BEGIN
OPEN rc_getAllPrjs FOR
  SELECT IDS AS PrjID
        ,'from  '||
         TO_CHAR(START_DATE,'MM/DD/YYYY')||
         '  to  '||TO_CHAR(END_DATE,'MM/DD/YYYY')||
         '   '||SUBSTR(DESCRIPTIONS, 0, 10)||
         DECODE(ANYBODY_ANSWERED, 'N', '  (not assigned)',
                '  (assigned to '||
                (SELECT o.ABBREVIATION
                 FROM ORGANIZATIONS o
                 WHERE o.IDS = (SELECT p.ORG_ID
                                FROM PARTICIPANTS p
                                WHERE p.IDS = (SELECT a.PARTICIPANT_ID
                                               FROM ANSWERS a
                                               WHERE ROWNUM = 1 AND rd.IDS = a.REASERCH_ID)))||
         ')'   ) AS PrjDateDescr
        ,INITCAP(DESCRIPTIONS) AS PrjDescr
        ,TO_CHAR(START_DATE,'MM/DD/YYYY') AS PrjStartDate
        ,TO_CHAR(END_DATE,'MM/DD/YYYY')   AS PrjEndDate
        ,ANYBODY_ANSWERED AS PrjAnswered
        ,DECODE((SELECT COUNT(*) FROM ANSWERS a WHERE rd.IDS=a.REASERCH_ID), 0, -1, -- -1 means NO Org is assigned to Reaserch Date
                (SELECT o.IDS
                 FROM ORGANIZATIONS o
                 WHERE o.IDS = (SELECT p.ORG_ID
                                FROM PARTICIPANTS p
                                WHERE p.IDS = (SELECT a.PARTICIPANT_ID
                                               FROM ANSWERS a
                                               WHERE ROWNUM = 1 AND rd.IDS = a.REASERCH_ID)))
              ) AS OrgID
  FROM Q42ADMIN.REASERCH_DATES rd
  ORDER BY START_DATE;
END sp_getAllPrjs;
--================================================================================================
--================================================================================================
END PACK_GET_ALL;