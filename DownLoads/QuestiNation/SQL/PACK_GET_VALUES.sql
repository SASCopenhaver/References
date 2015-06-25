CREATE OR REPLACE  PACKAGE "Q42ADMIN"."PACK_GET_VALUES" AS TYPE 
    refc_PackGetValues IS REF CURSOR;
PROCEDURE sp_getOrganizations (v_CursorVar OUT refc_PackGetValues);
PROCEDURE sp_getAppUsers (v_CursorVar OUT refc_PackGetValues);
PROCEDURE sp_getReaserchDates(v_CursorVar OUT refc_PackGetValues);
END PACK_GET_VALUES;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE  PACKAGE BODY "Q42ADMIN"."PACK_GET_VALUES"  AS
-- Start Organizations
PROCEDURE sp_getOrganizations (v_CursorVar OUT refc_PackGetValues) 
IS
BEGIN
OPEN v_CursorVar FOR
  SELECT 0  AS OrgID
        ,'' AS OrgAbbr
        ,'==Select Your Organization==' AS OrgFullName
  FROM DUAL
  UNION
  SELECT IDS AS OrgID
        ,ABBREVIATION AS OrgAbbr
        ,INITCAP(FULL_NAME) AS OrgFullName
  FROM Q42ADMIN.ORGANIZATIONS
  ORDER BY OrgID, OrgAbbr
  ;
END sp_getOrganizations;
--End Organizations

-- Start Users
PROCEDURE sp_getAppUsers (v_CursorVar OUT refc_PackGetValues)
IS
BEGIN
OPEN v_CursorVar FOR
  SELECT 0  AS UserID
        ,'' AS UserFName
        --,'' AS UserMI
        ,'A' AS UserLName
        --,'' AS UserSuffix
        ,0  AS UserOrgID
        ,0  AS UserSuperID
        ,'' AS UserPass
        ,'==Select Your Name==' AS UserFullName
        ,'' AS UserRole
        ,'' AS UserEmail
  FROM Q42ADMIN.PARTICIPANTS
  WHERE ROWNUM = 1
  UNION
  SELECT IDS             AS UserID
        ,INITCAP(FName)  AS UserFName
        --,INITCAP(MI)     AS UserMI
        ,UPPER(LName)    AS UserLName
        --,INITCAP(Suffix) AS UserSuffix
        ,Org_ID          AS UserOrgID
        ,Supervisor_ID   AS UserSuperID
        ,Passwords       AS UserPass
        ,UPPER(LName)||', '||INITCAP(FName) AS UserFullName
        ,DECODE(Org_ID,0, 'APPADMIN', DECODE(Supervisor_ID, 0, 'SUPERORG','PARTICIPANT')
                )        AS UserRole
        ,EMAIL AS UserEmail
  FROM Q42ADMIN.PARTICIPANTS
  WHERE ACT_INACT = 'A'
  ORDER BY 3
  ;
END sp_getAppUsers;
-- End Users

--Begin Reaserch Dates
PROCEDURE sp_getReaserchDates (v_CursorVar OUT refc_PackGetValues)
IS
rowsCount NUMBER;

BEGIN
SELECT Count(*) INTO rowsCount 
FROM Q42ADMIN.REASERCH_DATES 
WHERE TO_CHAR(SYSDATE,'MM/DD/YYYY') 
      BETWEEN (TO_CHAR(START_DATE,'MM/DD/YYYY')) AND 
      (TO_CHAR(END_DATE,'MM/DD/YYYY'));

--OPEN v_CursorVar FOR
IF rowsCount = 0 THEN
  OPEN v_CursorVar FOR
  SELECT 0 AS DatesID
        ,'' AS DateMsg
  FROM DUAL;
ELSE
  OPEN v_CursorVar FOR
  SELECT 0 AS DatesID
      ,'<em>Current Project(s):<br>
From&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
To&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Project Name</em>' 
           AS DateMsg
  FROM DUAL
  UNION 
  SELECT IDS AS DatesID
        ,TO_CHAR(START_DATE,'MM/DD/YYYY')||'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'||
         TO_CHAR(END_DATE,'MM/DD/YYYY')  ||'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'||
         DESCRIPTIONS AS DateMsg
  FROM Q42ADMIN.REASERCH_DATES
  WHERE TO_CHAR(SYSDATE,'MM/DD/YYYY') BETWEEN (TO_CHAR(START_DATE,'MM/DD/YYYY')) AND (TO_CHAR(END_DATE,'MM/DD/YYYY'))
  ORDER BY DatesID;
END IF;

END sp_getReaserchDates;
--End Reaserch Dates

END PACK_GET_VALUES;