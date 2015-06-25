CREATE OR REPLACE PACKAGE BODY "PACK_SELECT_ALL"  AS
--==================================================================================================
PROCEDURE sp_UserComments ( varPrjID  IN REASERCH_DATES.IDS%TYPE
                           ,varUserID IN USERS.IDS%TYPE
                           ,varQNum   IN NUMBER
                           ,rc_UserComments OUT rc_GetAll)
IS BEGIN
OPEN rc_UserComments FOR
  SELECT PRJ_ID   AS PrjID
        ,USER_ID  AS UserID
        ,Q_NUM    AS QNum
        ,COMMENTS AS Comments
  FROM COMMENTS
  WHERE PRJ_ID = varPrjID AND USER_ID = varUserID AND Q_NUM = varQNum
  ORDER BY 3;

END sp_UserComments;
--==================================================================================================
PROCEDURE  sp_UserAnswers ( varUserID IN USERS.IDS%TYPE
                           ,varPrjID  IN REASERCH_DATES.IDS%TYPE
                           ,rc_UserAnswers OUT rc_GetAll)
IS BEGIN
OPEN rc_UserAnswers FOR
  SELECT *
  FROM ANSWERS
  WHERE PARTICIPANT_ID = varUserID and
        REASERCH_ID = varPrjID;
END sp_UserAnswers;
--==================================================================================================
PROCEDURE sp_selectQandA (rc_Quest OUT rc_GetAll)
IS BEGIN
OPEN rc_Quest FOR
  SELECT IDS AS qID
        ,Q_TEXT AS qText
        ,ANSWER_TYPE AS aType
  FROM QUESTIONS_LK;

END sp_selectQandA;
--==================================================================================================
PROCEDURE sp_UserMenu (varUserID IN USERS.IDS%TYPE
                      ,rc_UserPrjs OUT rc_GetAll
                      ,rc_UserMenu OUT rc_GetAll)

IS BEGIN
------------------------------------------------
OPEN rc_UserPrjs FOR
  SELECT rd.IDS AS PrjID
        ,'from '||
         TO_CHAR(rd.START_DATE,'MM/DD/YYYY')||
         '  to  '||
         TO_CHAR(rd.END_DATE,'MM/DD/YYYY')||
         '   '||
         (SUBSTR(rd.DESCRIPTIONS, 0, 20))  AS PrjDescr
  FROM REASERCH_DATES rd, ANSWERS a
  WHERE a.REASERCH_ID = rd.IDS AND
        a.PARTICIPANT_ID = varUserID AND
        END_DATE > SYSDATE;
------------------------------------------------
OPEN rc_UserMenu FOR
  SELECT m.MENU_ITEM, m.MENU_DESCRIPTION, m.PAGE_TO_BE_CALLED, m.IMG
  FROM MENUS m
  WHERE m.SUPER_MENU = 0 AND
        m.MENU_OWNERSHIP = 'PARTICIPANT';
--  ORDER BY ORDER_TO_BE_PRESENTED;
------------------------------------------------
END sp_UserMenu;
--==================================================================================================
PROCEDURE sp_AllOrgs  (rc_AllOrgs   OUT rc_GetAll)
IS BEGIN
OPEN rc_AllOrgs FOR
  SELECT IDS          AS OrgID
        ,ABBREVIATION AS OrgAbbr
        ,INITCAP(FULL_NAME)  AS OrgFullName
  FROM Q42ADMIN.ORGANIZATIONS
  ORDER BY 2;
END sp_AllOrgs;
--==================================================================================================
PROCEDURE sp_AllUsers (rc_AllUsers  OUT rc_GetAll)
IS BEGIN
OPEN rc_AllUsers FOR
  SELECT IDS       AS UserID
        ,INITCAP(FNAME) AS UserFName
        ,UPPER(LNAME)     AS UserLName
        ,Pass      AS UserPass
        ,Email     AS UserEmail
        ,ACT_INACT AS UserActInact
        ,Org_ID    AS UserOrgID
  FROM Q42ADMIN.USERS
  ORDER BY  LName;

END sp_AllUsers;
--==================================================================================================
PROCEDURE sp_Menu (varOrgID IN USERS.ORG_ID%TYPE, rc_Menu OUT rc_GetAll)
IS BEGIN
OPEN rc_Menu FOR
  SELECT m.MENU_ITEM, m.MENU_DESCRIPTION, m.PAGE_TO_BE_CALLED, m.IMG
  FROM MENUS m
  WHERE m.SUPER_MENU = 0 AND
        m.MENU_OWNERSHIP = DECODE(varOrgID, 0, 'APPADMIN', 'PARTICIPANT')
  ORDER BY ORDER_TO_BE_PRESENTED;

END sp_Menu;
--==================================================================================================
PROCEDURE sp_AllPrjs  (rc_AllPrjs   OUT rc_GetAll)
IS BEGIN
OPEN rc_AllPrjs FOR
  SELECT IDS,
  DESCRIPTIONS,
  TO_CHAR(START_DATE,'MM/DD/YYYY') AS START_DATE,
  TO_CHAR(END_DATE,'MM/DD/YYYY') AS END_DATE,
  ANYBODY_ANSWERED,
  -------------------------------
  'from '||
  TO_CHAR(START_DATE,'MM/DD/YYYY')||
  '  to  '||
  TO_CHAR(END_DATE,'MM/DD/YYYY')||
  '   '||
  (SUBSTR(DESCRIPTIONS, 0, 10))  AS PrjBrfDescr,
  -------------------------------
  DECODE((SELECT COUNT(*) FROM ANSWERS a WHERE rd.IDS=a.REASERCH_ID), 0, 'NA',
                (SELECT TO_CHAR(o.IDS)
                 FROM ORGANIZATIONS o
                 WHERE o.IDS = (SELECT p.ORG_ID
                                FROM USERS p
                                WHERE p.IDS = (SELECT a.PARTICIPANT_ID
                                               FROM ANSWERS a
                                               WHERE ROWNUM = 1 AND rd.IDS = a.REASERCH_ID
                                               )
                                )
                )
        ) AS OrgID,
  -------------------------------
  DECODE((SELECT COUNT(*) FROM ANSWERS a WHERE rd.IDS=a.REASERCH_ID), 0, '(not assigned)',
                'assigned to '||
                (SELECT o.ABBREVIATION
                 FROM ORGANIZATIONS o
                 WHERE o.IDS = (SELECT p.ORG_ID
                                FROM USERS p
                                WHERE p.IDS = (SELECT a.PARTICIPANT_ID
                                               FROM ANSWERS a
                                               WHERE ROWNUM = 1 AND rd.IDS = a.REASERCH_ID
                                               )
                                )
                )
        ) AS AssignedToOrg
  -------------------------------
  FROM REASERCH_DATES rd
  ORDER BY  TO_DATE(START_DATE, 'MM/DD/YYYY');
END sp_AllPrjs;
--==================================================================================================
--==================================================================================================
PROCEDURE sp_PrjsStat (rc_PrjsStat  OUT rc_GetAll)
IS BEGIN
OPEN rc_PrjsStat FOR
--------------------------------------------------------
SELECT   0 AS RowNums
        ,TO_CHAR(0) AS OrgID
        ,'*** Create New Project ***' AS PrjStatus
FROM DUAL
------------------------------------------------------------------------------
UNION
------------------------------------------------------------------------------
SELECT 1 AS RowNums
      ,'ALL' AS OrgID
      ,'=== View/Edit All Projects ===' AS PrjStatus
FROM REASERCH_DATES
WHERE (SELECT Count(*) FROM REASERCH_DATES) > 0
------------------------------------------------------------------------------
UNION
------------------------------------------------------------------------------
SELECT DISTINCT
      2 AS RowNums
     ,'NA' AS OrgID
      ,'=== View/Edit NOT Assigned Project(s) ===' AS PrjStatus
FROM REASERCH_DATES rd
WHERE rd.IDS NOT IN (SELECT DISTINCT a.REASERCH_ID
                     FROM ANSWERS a
                     WHERE rd.IDS = a.REASERCH_ID)
------------------------------------------------------------------------------
UNION
------------------------------------------------------------------------------
SELECT DISTINCT (o.IDS + 2) AS RowNums
      ,TO_CHAR(o.IDS) AS OrgID
      ,'=== View/Edit Current Project(s) Assigned To '|| UPPER(o.ABBREVIATION)||' ===' AS PrjStatus
FROM ORGANIZATIONS o, REASERCH_DATES rd
WHERE o.ABBREVIATION = (SELECT o.ABBREVIATION
                        FROM ORGANIZATIONS o
                        WHERE o.IDS = (SELECT u.ORG_ID
                                       FROM USERS u
                                       WHERE u.IDS = (SELECT a.PARTICIPANT_ID
                                       FROM ANSWERS a
                                       WHERE ROWNUM = 1 AND rd.IDS = a.REASERCH_ID)))
      AND rd.END_DATE >= SYSDATE
------------------------------------------------------------------------------
UNION
------------------------------------------------------------------------------
SELECT DISTINCT (o.IDS + 4) AS RowNums
      ,TO_CHAR((-1)*(o.IDS)) AS OrgID
      ,'=== View/Edit Completed Project(s) Assigned To '|| UPPER(o.ABBREVIATION)||' ===' AS PrjStatus
FROM ORGANIZATIONS o, REASERCH_DATES rd
WHERE o.ABBREVIATION = (SELECT o.ABBREVIATION
                        FROM ORGANIZATIONS o
                        WHERE o.IDS = (SELECT u.ORG_ID
                                       FROM USERS u
                                       WHERE u.IDS = (SELECT a.PARTICIPANT_ID
                                       FROM ANSWERS a
                                       WHERE ROWNUM = 1 AND rd.IDS = a.REASERCH_ID)))
      AND rd.END_DATE < SYSDATE

ORDER BY 1;
END sp_PrjsStat;
--==================================================================================================
PROCEDURE sp_selectUsersInTblAnswers (rc_UsersInAnswers  OUT rc_GetAll)
IS BEGIN
OPEN rc_UsersInAnswers FOR
  SELECT a.PARTICIPANT_ID AS UserID
        ,a.REASERCH_ID AS PrjID
        ,(select Count(*) from ANSWERS aa WHERE a.REASERCH_ID = aa.REASERCH_ID) AS LoopCounter
  FROM ANSWERS a
  ORDER BY 2;
END sp_selectUsersInTblAnswers;
--==================================================================================================
PROCEDURE sp_PrjMngrs (rc_PrjMngrs OUT rc_GetAll)
IS BEGIN
OPEN rc_PrjMngrs FOR
  SELECT PRJ_ID, USER_ID
  FROM PROJECT_MANAGERS;

END sp_PrjMngrs;
--==================================================================================================
END PACK_SELECT_ALL;
/
