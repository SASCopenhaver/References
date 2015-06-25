CREATE OR REPLACE  PACKAGE "Q42ADMIN"."PACK_INS_UPD" AS
PROCEDURE sp_InsUpdAssignParts
                          (
                           varReaserchID IN NUMBER
                          ,varOrgID      IN NUMBER
                          ,varTargetText IN VARCHAR2
                          ,varIfAssigned IN NUMBER
                          );
PROCEDURE sp_InsUpdNewPart(
                           varPartID   IN PARTICIPANTS.IDS%TYPE
                          ,varIfSuper  IN CHAR
                          ,varFName    IN PARTICIPANTS.FNAME%TYPE
                          ,varLName    IN PARTICIPANTS.LNAME%TYPE
                          ,varActInact IN PARTICIPANTS.ACT_INACT%TYPE
                          ,varOrgID    IN PARTICIPANTS.ORG_ID%TYPE
                          --,varSuperID  IN PARTICIPANTS.SUPERVISOR_ID%TYPE
                          ,varPass     IN PARTICIPANTS.PASSWORDS%TYPE
                          ,varEmail    IN PARTICIPANTS.EMAIL%TYPE
                          );
PROCEDURE sp_InsUpdOrgs(
                        varOrgID       IN ORGANIZATIONS.IDS%TYPE
                       ,varOrgAbbr     IN ORGANIZATIONS.ABBREVIATION%TYPE
                       ,varOrgFullName IN ORGANIZATIONS.FULL_NAME%TYPE
                       );
PROCEDURE sp_InsUpdPrj (
                        varPrjAccess IN NUMBER 
                       ,varPrjID     IN REASERCH_DATES.IDS%TYPE
                       ,varPrjDescr  IN REASERCH_DATES.DESCRIPTIONS%TYPE
                       ,varStartDate IN REASERCH_DATES.START_DATE%TYPE
                       ,varResearchLength IN NUMBER
                       );
END PACK_INS_UPD;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE  PACKAGE BODY "Q42ADMIN"."PACK_INS_UPD"   AS
--===================================================================================================
PROCEDURE sp_InsUpdAssignParts
         (varReaserchID IN NUMBER,   varOrgID IN NUMBER, 
          varTargetText IN VARCHAR2, varIfAssigned IN NUMBER)
-- COMMENTS: ----------------------------------------------------------------------------------------
-- 1) varTargetText delivers a list of all Participants IDs delimited by '_'.
-- 2) varIfAssigned could be -1 or number >0.
--      -1 means Reaserch is not assigned to any Organization;
--      >0 means Reaserch is assigned to the Organization which ID is in varIfAssigned.
------------------------------------------------------------------------------------------------------
IS 
v_PID NUMBER; -- To hold substringed value of Participant ID from varTargetText;
v_Len NUMBER; -- To hold length of the string after determination of the 
              -- position of the separator '_';
v_Text VARCHAR2(4000); -- To hold the rest of target text.

BEGIN --sp_InsUpdAssignParts
  IF varIfAssigned > 0 THEN
    DELETE FROM ANSWERS WHERE REASERCH_ID = varReaserchID;
  END IF;    
 
  v_Text := varTargetText;
  LOOP
    
    v_Len := TO_NUMBER( INSTR(v_Text, '_'));
    If v_Len = 0 Then
      v_PID := TO_NUMBER(v_Text);
    Else
      v_PID := TO_NUMBER( SUBSTR(v_Text, 1, (v_Len-1)));
      v_Text := SUBSTR(v_Text, (v_Len + 1), LENGTH(v_Text));
    End If;
    
    INSERT INTO ANSWERS (PARTICIPANT_ID, REASERCH_ID) VALUES (v_PID, varReaserchID);
    COMMIT;
    
    EXIT WHEN v_Len = 0;
    
  END LOOP;
END sp_InsUpdAssignParts;
--===================================================================================================
PROCEDURE sp_InsUpdNewPart(
                           varPartID   IN PARTICIPANTS.IDS%TYPE
                          ,varIfSuper  IN CHAR 
                          ,varFName    IN PARTICIPANTS.FNAME%TYPE
                          ,varLName    IN PARTICIPANTS.LNAME%TYPE
                          ,varActInact IN PARTICIPANTS.ACT_INACT%TYPE
                          ,varOrgID    IN PARTICIPANTS.ORG_ID%TYPE
                          --,varSuperID  IN PARTICIPANTS.SUPERVISOR_ID%TYPE
                          ,varPass     IN PARTICIPANTS.PASSWORDS%TYPE
                          ,varEmail    IN PARTICIPANTS.EMAIL%TYPE
                          )
IS
vSuperID NUMBER;
BEGIN --sp_InsUpdNewPart
IF varOrgID = 0 THEN
  if varPartID = 0 then
    INSERT INTO PARTICIPANTS (IDS, FNAME, LNAME, ACT_INACT, ORG_ID, SUPERVISOR_ID, PASSWORDS, EMAIL)
      VALUES (Participants_ID.NextVal
             ,UPPER(varFName)
             ,UPPER(varLName)
             ,UPPER(varActInact)
             ,varOrgID
             ,0
             ,varPass
             ,UPPER(varEmail));
      COMMIT;
  else
    UPDATE PARTICIPANTS SET
             FNAME = UPPER(varFName)
            ,LNAME = UPPER(varLName)
            ,ACT_INACT = UPPER(varActInact)
            ,ORG_ID = varOrgID
            ,Supervisor_ID = 0
            ,PASSWORDS = varPass
            ,EMAIL = UPPER(varEmail)
      WHERE IDS = varPartID;
      COMMIT;
  end if;
ELSE
  IF varPartID = 0 THEN
    If varIfSuper = 'Y' Then
 /*1*/INSERT INTO PARTICIPANTS (IDS, FNAME, LNAME, ACT_INACT, ORG_ID, SUPERVISOR_ID, PASSWORDS, EMAIL)
      VALUES (Participants_ID.NextVal
             ,UPPER(varFName)
             ,UPPER(varLName)
             ,UPPER(varActInact)
             ,varOrgID
             ,0
             ,varPass
             ,UPPER(varEmail));
 /*2*/SELECT Max(IDS) INTO vSuperID FROM PARTICIPANTS;
 /*3*/UPDATE PARTICIPANTS SET Supervisor_ID = vSuperID WHERE Org_ID = varOrgID;
 /*4*/UPDATE PARTICIPANTS SET Supervisor_ID = 0 WHERE IDs = vSuperID;
      COMMIT; 
    Else -- If varIfSuper = 'N' Then
      INSERT INTO PARTICIPANTS (IDS, FNAME, LNAME, ACT_INACT, ORG_ID, SUPERVISOR_ID, PASSWORDS, EMAIL)
      VALUES (Participants_ID.NextVal
             ,UPPER(varFName)
             ,UPPER(varLName)
             ,UPPER(varActInact)
             ,varOrgID
             ,(SELECT ps.IDS FROM PARTICIPANTS ps WHERE ps.SUPERVISOR_ID = 0 AND ps.ORG_ID = varOrgID)
             ,varPass
             ,UPPER(varEmail));
      COMMIT;
    End If;
  ELSE --varPartID <> 0
    If varIfSuper = 'Y' Then
/*1*/ UPDATE PARTICIPANTS SET Supervisor_ID = varPartID WHERE Org_ID = varOrgID;
/*2*/ UPDATE PARTICIPANTS SET
             FNAME = UPPER(varFName)
            ,LNAME = UPPER(varLName)
            ,ACT_INACT = UPPER(varActInact)
            ,ORG_ID = varOrgID
            ,Supervisor_ID = 0
            ,PASSWORDS = varPass
            ,EMAIL = UPPER(varEmail)
      WHERE IDS = varPartID;
      COMMIT;
      
    Else
      UPDATE PARTICIPANTS SET
             FNAME = UPPER(varFName)
            ,LNAME = UPPER(varLName)
            ,ACT_INACT = UPPER(varActInact)
            ,ORG_ID = varOrgID
            ,Supervisor_ID = (SELECT ps.IDS FROM PARTICIPANTS ps WHERE ps.SUPERVISOR_ID = 0 AND ps.ORG_ID = varOrgID)
            ,PASSWORDS = varPass
            ,EMAIL = UPPER(varEmail)
      WHERE IDS = varPartID;
      COMMIT;
    End If;
  END IF;
END IF;
END sp_InsUpdNewPart;
--================================================================================================
PROCEDURE sp_InsUpdOrgs(
                        varOrgID       IN ORGANIZATIONS.IDS%TYPE
                       ,varOrgAbbr     IN ORGANIZATIONS.ABBREVIATION%TYPE
                       ,varOrgFullName IN ORGANIZATIONS.FULL_NAME%TYPE
                       )
IS
BEGIN
IF varOrgID = 0 THEN
  INSERT INTO ORGANIZATIONS (IDS, ABBREVIATION, FULL_NAME)
  VALUES (Organization_ID.NextVal, varOrgAbbr, varOrgFullName);
  COMMIT;
ELSE
  UPDATE ORGANIZATIONS SET 
         ABBREVIATION = UPPER(varOrgAbbr)
        ,FULL_NAME = UPPER(varOrgFullName)
  WHERE IDS = varOrgID;
  COMMIT;
END IF; 
END sp_InsUpdOrgs;
--================================================================================================
PROCEDURE sp_InsUpdPrj (
                        varPrjAccess IN NUMBER 
                       ,varPrjID     IN REASERCH_DATES.IDS%TYPE
                       ,varPrjDescr  IN REASERCH_DATES.DESCRIPTIONS%TYPE
                       ,varStartDate IN REASERCH_DATES.START_DATE%TYPE
                       ,varResearchLength IN NUMBER
                       )
IS 
BEGIN
-- varPrjAccess:
--         -3 Create New Project                      
--         -2 View/Edit All Projects                  
--         -1 View/Edit NOT Assigned Projects         
--          2 View/Edit Project Assigned To ECA       
--          3 View/Edit Project Assigned To IIT
IF varPrjAccess = -3 THEN
  INSERT INTO Q42ADMIN.REASERCH_DATES (IDS, DESCRIPTIONS,START_DATE, END_DATE)
  VALUES  (ReaserchDates_IDs.NextVal, varPrjDescr, varStartDate, (varStartDate + varResearchLength));
  COMMIT;
END IF;


END sp_InsUpdPrj;

/*
PROCEDURE sp_InsUpdProjects(
                            varReportID   IN NUMBER,
                            varProjDescr  IN VARCHAR2,
                            varStartDate  IN DATE,
                            varReportLength IN NUMBER--,
                            --v_CursorVar OUT refc_PackGetDates
                            )
IS 
BEGIN
  IF varReportID = 0 THEN
    INSERT INTO Q42ADMIN.REASERCH_DATES (IDS, DESCRIPTIONS,START_DATE, END_DATE)
    VALUES  (ReaserchDates_IDs.NextVal, varProjDescr, varStartDate, (varStartDate + varReportLength));
    COMMIT;
  ELSE
    UPDATE Q42ADMIN.REASERCH_DATES 
    SET DESCRIPTIONS = varProjDescr, START_DATE = varStartDate, END_DATE = varStartDate + varReportLength
    WHERE IDS = varReportID;
    COMMIT;
  END IF;
  
END sp_InsUpdProjects;
*/
--================================================================================================
END PACK_INS_UPD;