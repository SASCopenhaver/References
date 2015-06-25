CREATE OR REPLACE  PACKAGE "Q42ADMIN"."PACK_INSUPD"  AS TYPE 
    rc_GetAll IS REF CURSOR;

PROCEDURE sp_InsUpdUser(   varID       IN USERS.IDS%TYPE
                          ,varFName    IN USERS.FNAME%TYPE
                          ,varLName    IN USERS.LNAME%TYPE
                          ,varPass     IN USERS.PASS%TYPE
                          ,varEmail    IN USERS.EMAIL%TYPE
                          ,varActInact IN USERS.ACT_INACT%TYPE
                          ,varOrgID    IN USERS.ORG_ID%TYPE
                          ,rc_InsUpdUser OUT rc_GetAll
                          );

PROCEDURE sp_InsUpdOrg( varOrgID       IN ORGANIZATIONS.IDS%TYPE
                       ,varOrgAbbr     IN ORGANIZATIONS.ABBREVIATION%TYPE
                       ,varOrgFullName IN ORGANIZATIONS.FULL_NAME%TYPE
                       ,rc_InsUpdOrg   OUT rc_GetAll
                       );

PROCEDURE sp_InsUpdPrj( varPrjID          IN REASERCH_DATES.IDS%TYPE
                       ,varPrjDescr       IN REASERCH_DATES.DESCRIPTIONS%TYPE
                       ,varStartDate      IN REASERCH_DATES.START_DATE%TYPE
                       ,varResearchLength IN NUMBER
                       ,rc_InsUpdPrj      OUT rc_GetAll
                       );
PROCEDURE sp_InsUpdAssignedParts( varPrjID IN REASERCH_DATES.IDS%TYPE
                                 ,varUsersInTarget VARCHAR2
                                 ,varMngrsInTarget VARCHAR2
                                 );

PROCEDURE sp_InsUpdUserComments(varPrjID  IN COMMENTS.PRJ_ID%TYPE
                               ,varUserID IN COMMENTS.USER_ID%TYPE
                               ,varQNum   IN COMMENTS.Q_NUM%TYPE
                               ,varQValue IN NUMBER
                               ,varComm   IN COMMENTS.COMMENTS%TYPE);
END PACK_INSUPD;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE  PACKAGE BODY "Q42ADMIN"."PACK_INSUPD"   IS
--===================================================================================================
PROCEDURE sp_InsUpdUserComments(varPrjID  IN COMMENTS.PRJ_ID%TYPE
                               ,varUserID IN COMMENTS.USER_ID%TYPE
                               ,varQNum   IN COMMENTS.Q_NUM%TYPE
                               ,varQValue IN NUMBER
                               ,varComm   IN COMMENTS.COMMENTS%TYPE)
IS BEGIN

  DELETE FROM COMMENTS WHERE PRJ_ID = varPrjID AND USER_ID = varUserID AND Q_NUM = varQNum;
  --If LTrim(RTrim(varComm)) <> '' Then
    INSERT INTO COMMENTS ( PRJ_ID, USER_ID, Q_NUM, COMMENTS ) VALUES ( varPrjID, varUserID, varQNum, LTrim(RTrim(varComm)) );
  --End If;  

END sp_InsUpdUserComments;
--===================================================================================================
PROCEDURE sp_InsUpdAssignedParts( varPrjID IN REASERCH_DATES.IDS%TYPE
                                 ,varUsersInTarget VARCHAR2
                                 ,varMngrsInTarget VARCHAR2
                                 )
/*
PROCEDURE sp_InsUpdAssignedParts( varPrjID IN REASERCH_DATES.IDS%TYPE
                                 ,varSuperID IN REASERCH_DATES.PRJ_SUPER_ID%TYPE
                                 ,varUsersInTarget VARCHAR2
                                 )
*/
IS 
-- For Users
v_PID NUMBER; -- To hold substringed value of Participant ID from varUsersInTarget;
v_Len NUMBER; -- To hold length of the string after determination of the 
              -- position of the separator '_';
v_UsersInTarget VARCHAR2(4000); -- To hold the rest of target text.
-- For Managers
v_MID NUMBER; -- To hold substringed value of Manager ID from varMngrsInTarget;
v_MLen NUMBER;-- -- To hold length of the string after determination of the 
              -- position of the separator '_'.
v_MngrsInTarget VARCHAR2(4000); -- To hold the rest of target text.

BEGIN --sp_InsUpdAssignedParts
  ------------------------------------------------------------------------------------------------------
  DELETE FROM ANSWERS WHERE REASERCH_ID = varPrjID; 
  DELETE FROM PROJECT_MANAGERS WHERE PRJ_ID = varPrjID;
  ------------------------------------------------------------------------------------------------------
  -- For Users:
  -------------
  v_UsersInTarget := varUsersInTarget;
  LOOP
    
    v_Len := TO_NUMBER( INSTR(v_UsersInTarget, '_'));
    If v_Len = 0 Then
      v_PID := TO_NUMBER(v_UsersInTarget);
    Else
      v_PID := TO_NUMBER( SUBSTR(v_UsersInTarget, 1, (v_Len-1)));
      v_UsersInTarget := SUBSTR(v_UsersInTarget, (v_Len + 1), LENGTH(v_UsersInTarget));
    End If;
    
    INSERT INTO ANSWERS (PARTICIPANT_ID, REASERCH_ID) VALUES (v_PID, varPrjID);
    --UPDATE REASERCH_DATES SET PRJ_SUPER_ID = varSuperID WHERE IDS = varPrjID;
    COMMIT;
    EXIT WHEN v_Len = 0;
  END LOOP;
  ------------------------------------------------------------------------------------------------------
  -- For Managers:
  ----------------
  v_MngrsInTarget := varMngrsInTarget;
  
  LOOP
    v_MLen := TO_NUMBER( INSTR(v_MngrsInTarget, '_') );
    If v_MLen = 0 Then
      v_MID := TO_NUMBER( v_MngrsInTarget );
    Else
      v_MID := TO_NUMBER( SUBSTR(v_MngrsInTarget, 1, (v_MLen-1)));
      v_MngrsInTarget := SUBSTR(v_MngrsInTarget, (v_MLen + 1), LENGTH(v_MngrsInTarget));
    End If;
    
    INSERT INTO PROJECT_MANAGERS (PRJ_ID, USER_ID) VALUES (varPrjID,  v_MID);
    COMMIT;
    EXIT WHEN v_MLen = 0;
  END LOOP;
  
  ------------------------------------------------------------------------------------------------------
END sp_InsUpdAssignedParts;
--===================================================================================================
PROCEDURE sp_InsUpdUser(   varID         IN USERS.IDS%TYPE
                          ,varFName      IN USERS.FNAME%TYPE
                          ,varLName      IN USERS.LNAME%TYPE
                          ,varPass       IN USERS.PASS%TYPE
                          ,varEmail      IN USERS.EMAIL%TYPE
                          ,varActInact   IN USERS.ACT_INACT%TYPE
                          ,varOrgID      IN USERS.ORG_ID%TYPE
                          ,rc_InsUpdUser OUT rc_GetAll
                          )
IS
BEGIN
--------------------------------------------------------------------------------
  If varID = 0 Then -- Create new record
    INSERT INTO USERS (IDS, FNAME, LNAME, PASS, EMAIL, ACT_INACT, ORG_ID)
    VALUES (USERS_ID.NextVal, 
            UPPER(varFName), 
            UPPER(varLName), 
            varPass, 
            UPPER(varEmail), 
            UPPER(varActInact), 
            varOrgID);
    COMMIT;
  Else -- Update existing record
    UPDATE USERS SET
           FNAME = UPPER(varFName)
          ,LNAME = UPPER(varLName)
          ,PASS = varPass
          ,EMAIL = UPPER(varEmail)
          ,ACT_INACT = UPPER(varActInact)
          ,ORG_ID = varOrgID
    WHERE IDS = varID;
    COMMIT;
  End If;  
--------------------------------------------------------------------------------
IF varID = 0 THEN
  OPEN rc_InsUpdUser FOR
    SELECT IDS, FNAME, LNAME, PASS, EMAIL, ACT_INACT, ORG_ID
    FROM USERS 
    WHERE ROWID = (SELECT Max(ROWID) FROM USERS);
ELSE
  OPEN rc_InsUpdUser FOR
    SELECT IDS, FNAME, LNAME, PASS, EMAIL, ACT_INACT, ORG_ID
    FROM USERS 
    WHERE IDS = varID;
END IF;
--------------------------------------------------------------------------------
END sp_InsUpdUser;
--===================================================================================================
PROCEDURE sp_InsUpdOrg(
                        varOrgID       IN ORGANIZATIONS.IDS%TYPE
                       ,varOrgAbbr     IN ORGANIZATIONS.ABBREVIATION%TYPE
                       ,varOrgFullName IN ORGANIZATIONS.FULL_NAME%TYPE
                       ,rc_InsUpdOrg   OUT rc_GetAll
                       )
IS
BEGIN
IF varOrgID = 0 THEN
  INSERT INTO ORGANIZATIONS (IDS, ABBREVIATION, FULL_NAME)
  VALUES (Organization_ID.NextVal, varOrgAbbr, varOrgFullName);
  COMMIT;
  
  OPEN rc_InsUpdOrg FOR
  SELECT IDS
  FROM ORGANIZATIONS
  WHERE ROWID = (SELECT Max(ROWID) FROM ORGANIZATIONS);
ELSE
  UPDATE ORGANIZATIONS SET 
         ABBREVIATION = UPPER(varOrgAbbr)
        ,FULL_NAME = UPPER(varOrgFullName)
  WHERE IDS = varOrgID;
  COMMIT;
  
  OPEN rc_InsUpdOrg FOR
  SELECT IDS
  FROM ORGANIZATIONS
  WHERE IDS = varOrgID;
END IF; 

END sp_InsUpdOrg;
--===================================================================================================
PROCEDURE sp_InsUpdPrj (
                        varPrjID          IN REASERCH_DATES.IDS%TYPE
                       ,varPrjDescr       IN REASERCH_DATES.DESCRIPTIONS%TYPE
                       ,varStartDate      IN REASERCH_DATES.START_DATE%TYPE
                       ,varResearchLength IN NUMBER
                       ,rc_InsUpdPrj      OUT rc_GetAll
                       )
IS BEGIN
IF varPrjID = 0 THEN
  INSERT INTO Q42ADMIN.REASERCH_DATES (IDS, DESCRIPTIONS,START_DATE, END_DATE)
  VALUES  (ReaserchDates_IDs.NextVal, varPrjDescr, varStartDate, (varStartDate + varResearchLength));
  COMMIT;
  
  OPEN rc_InsUpdPrj FOR
  SELECT 'NA' AS OrgID, IDS, DESCRIPTIONS, START_DATE, END_DATE
  FROM REASERCH_DATES
  WHERE ROWID = (SELECT Max(ROWID) FROM REASERCH_DATES);
ELSE
  UPDATE REASERCH_DATES SET
         DESCRIPTIONS = varPrjDescr
        ,START_DATE = varStartDate
        ,END_DATE = varStartDate + varResearchLength
  WHERE IDS = varPrjID;
  COMMIT;
  
  OPEN rc_InsUpdPrj FOR
  ------------------------------------------------------------------------------
  SELECT DECODE( (select Count(*) 
                  from ANSWERS a
                  where a.REASERCH_ID = varPrjID), 0, 'NA', (select distinct u.ORG_ID 
                                                             from USERS u, ANSWERS a
                                                             where u.IDS = a.PARTICIPANT_ID)   
                )AS OrgID, 
         rd.IDS, rd.DESCRIPTIONS, rd.START_DATE, rd.END_DATE
  FROM REASERCH_DATES rd
  WHERE rd.IDS = varPrjID;
  ------------------------------------------------------------------------------
END IF;
END sp_InsUpdPrj;
--===================================================================================================
END PACK_INSUPD;