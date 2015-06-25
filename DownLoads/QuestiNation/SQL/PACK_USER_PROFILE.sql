CREATE OR REPLACE  PACKAGE "Q42ADMIN"."PACK_USER_PROFILE"  AS 
    TYPE refc_UserProfile IS REF CURSOR;

PROCEDURE sp_getUserProfile(
                           varPartID   IN PARTICIPANTS.IDS%TYPE
                          ,v_CursorVar OUT refc_UserProfile
                          );

PROCEDURE sp_getPartsInOrg (
                             varPartID          IN PARTICIPANTS.IDS%TYPE
                            ,v_CursorOrgName    OUT refc_UserProfile
                            ,v_CursorPartsInOrg OUT refc_UserProfile
                            );

END PACK_USER_PROFILE;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE  PACKAGE BODY "Q42ADMIN"."PACK_USER_PROFILE"  
    AS
--===========================================================================
PROCEDURE sp_getUserProfile(
                           varPartID   IN PARTICIPANTS.IDS%TYPE
                          ,v_CursorVar OUT refc_UserProfile
                          )

IS
BEGIN --sp_getUserProfile
-----------------------------------------------------------------------------
/*1*/
If varPartID = 0 Then 
    OPEN v_CursorVar FOR
      SELECT p.IDS             AS UserID
            ,INITCAP(p.FName)  AS UserFName
            ,UPPER(p.LName)    AS UserLName
            ,p.Org_ID          AS UserOrgID
            ,p.Act_Inact       AS UserActInact
            ,p.Supervisor_ID   AS UserSuperID
            ,p.Passwords       AS UserPass
            ,UPPER(p.LName)||', '||INITCAP(p.FName) 
                               AS UserFullName
            ,DECODE(p.Org_ID,0, 'APPADMIN',
                    DECODE(p.Supervisor_ID, 0, 'SUPERORG','PARTICIPANT')
                    )          AS UserRole
            ,p.EMAIL           AS UserEmail
      FROM Q42ADMIN.PARTICIPANTS p
      WHERE rowid = (SELECT Max(rowid) FROM Q42ADMIN.PARTICIPANTS pp);
 -----------------------------------------------------------------------------
/*2*/
Else
    OPEN v_CursorVar FOR      
      SELECT IDS             AS UserID
            ,INITCAP(FName)  AS UserFName
            ,UPPER(LName)    AS UserLName
            ,Org_ID          AS UserOrgID
            ,Act_Inact       AS UserActInact
            ,Supervisor_ID   AS UserSuperID
            ,Passwords       AS UserPass
            ,UPPER(LName)||', '||INITCAP(FName) AS UserFullName
            ,DECODE(Org_ID,0, 'APPADMIN',
                    DECODE(Supervisor_ID, 0, 'SUPERORG','PARTICIPANT')
                    )        AS UserRole
            ,EMAIL           AS UserEmail
      FROM Q42ADMIN.PARTICIPANTS
      WHERE IDS = varPartID;
  End If;
  
-----------------------------------------------------------------------------
END sp_getUserProfile;
--===========================================================================
PROCEDURE sp_getPartsInOrg (
                             varPartID          IN PARTICIPANTS.IDS%TYPE
                            ,v_CursorOrgName    OUT refc_UserProfile
                            ,v_CursorPartsInOrg OUT refc_UserProfile
                            )
IS
vOrgID PARTICIPANTS.Org_ID%TYPE;

BEGIN --sp_getPartsInOrg
  
  OPEN v_CursorOrgName FOR
  SELECT 0  AS OrgID
        ,'' AS OrgAbbr
        ,'==Select Organization==' AS OrgFullName
  FROM DUAL
  UNION
  SELECT IDS AS OrgID
        ,ABBREVIATION AS OrgAbbr
        ,FULL_NAME AS OrgFullName
  FROM Q42ADMIN.ORGANIZATIONS
  ORDER BY OrgID;


 -- SELECT Org_ID INTO vOrgID FROM PARTICIPANTS WHERE IDS = varPartID;
  
  
 -- IF vOrgID = 0 THEN -- It applies to 'SUPERADMIN' and 'APPADMIN'
    OPEN v_CursorPartsInOrg FOR
    SELECT 0 AS UserID
        ,''  AS UserFName
        ,'A' AS UserLName
        ,0   AS UserOrgID
        ,'A' AS UserActInact
        ,0   AS UserSuperID
        ,'password'  AS UserPass
        ,'==Create New User==' AS UserFullName
        ,''  AS UserRole
        ,''  AS UserEmail
    FROM DUAL
    UNION
    SELECT IDS           AS UserID
        ,INITCAP(FName)  AS UserFName
        ,UPPER(LName)    AS UserLName
        ,Org_ID          AS UserOrgID
        ,Act_Inact       AS UserActInact
        ,Supervisor_ID   AS UserSuperID
        ,Passwords       AS UserPass
        ,UPPER(LName)||', '||INITCAP(FName)||DECODE(Act_Inact,'I','        (inactive)','')  AS UserFullName
        ,DECODE(Org_ID,0,
                DECODE(Supervisor_ID, 100000, 'SUPERADMIN','APPADMIN'),
                DECODE(Supervisor_ID, 0, 'SUPERORG','PARTICIPANT')
                )        AS UserRole
        ,EMAIL AS UserEmail
    FROM Q42ADMIN.PARTICIPANTS
    WHERE Org_ID <> 0
    ORDER BY 3;

END sp_getPartsInOrg;
--===========================================================================
END PACK_USER_PROFILE;