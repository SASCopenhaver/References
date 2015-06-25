CREATE OR REPLACE PACKAGE "PACK_INSUPD"  AS TYPE rc_GetAll IS REF CURSOR;
--------------------------------------------------------------------
PROCEDURE sp_InsUpdEMail (varProcess IN VARCHAR2
                         ,varMsgID IN NUMBER
                         ,varPrjID IN REASERCH_DATES.IDS%TYPE
                         ,varMsg   IN VARCHAR2
                         ,varURL_Address IN VARCHAR2
                         ,varAdminID IN NUMBER);

--------------------------------------------------------------------
PROCEDURE sp_InsUpdUser(   varID       IN USERS.IDS%TYPE
                          ,varFName    IN USERS.FNAME%TYPE
                          ,varLName    IN USERS.LNAME%TYPE
                          ,varPass     IN USERS.PASS%TYPE
                          ,varEmail    IN USERS.EMAIL%TYPE
                          ,varActInact IN USERS.ACT_INACT%TYPE
                          ,varOrgID    IN USERS.ORG_ID%TYPE
                          ,rc_InsUpdUser OUT rc_GetAll
                          );
--------------------------------------------------------------------
PROCEDURE sp_InsUpdOrg( varOrgID       IN ORGANIZATIONS.IDS%TYPE
                       ,varOrgAbbr     IN ORGANIZATIONS.ABBREVIATION%TYPE
                       ,varOrgFullName IN ORGANIZATIONS.FULL_NAME%TYPE
                       ,rc_InsUpdOrg   OUT rc_GetAll
                       );
--------------------------------------------------------------------
PROCEDURE sp_InsUpdPrj( varPrjID          IN REASERCH_DATES.IDS%TYPE
                       ,varPrjDescr       IN REASERCH_DATES.DESCRIPTIONS%TYPE
                       ,varStartDate      IN REASERCH_DATES.START_DATE%TYPE
                       ,varResearchLength IN NUMBER
                       ,varPrjSuperID     IN NUMBER
                       ,rc_InsUpdPrj      OUT rc_GetAll
                       );
--------------------------------------------------------------------
PROCEDURE sp_InsUpdAssignedParts( varPrjID IN REASERCH_DATES.IDS%TYPE
                                 ,varUsersInTarget VARCHAR2
                                 ,varMngrsInTarget VARCHAR2
                                 );
--------------------------------------------------------------------
PROCEDURE sp_InsUpdUserComments(varPrjID  IN COMMENTS.PRJ_ID%TYPE
                               ,varUserID IN COMMENTS.USER_ID%TYPE
                               ,varQNum   IN COMMENTS.Q_NUM%TYPE
                               ,varQValue IN NUMBER
                               ,varComm   IN COMMENTS.COMMENTS%TYPE);
--------------------------------------------------------------------
PROCEDURE Sp_InsUpdUserAnswers (varSQL_Update    IN VARCHAR2
                               ,varSQL_Delete    IN VARCHAR2
                               ,varParticipantID IN NUMBER
                               ,varReaserchID    IN NUMBER);
--------------------------------------------------------------------
PROCEDURE sp_DeletePrj( varPrjID IN REASERCH_DATES.IDS%TYPE );
--------------------------------------------------------------------
PROCEDURE sp_InsUpdArchivePrj(varPrjID IN REASERCH_DATES.IDS%TYPE );
--------------------------------------------------------------------
END PACK_INSUPD;
/
CREATE OR REPLACE PACKAGE BODY "PACK_INSUPD"  IS
--===================================================================================================

PROCEDURE sp_InsUpdEMail (varProcess IN VARCHAR2
                         ,varMsgID IN NUMBER
                         ,varPrjID IN REASERCH_DATES.IDS%TYPE
                         ,varMsg   IN VARCHAR2
                         ,varURL_Address IN VARCHAR2
                         ,varAdminID IN NUMBER)
-- varProcess could be:
-- "S" save
-- "D" delete

IS BEGIN 

if varProcess = 'S' then
   if varPrjID = 0 then     -- Pre-defined messages
      if varMsgID = 0 then  -- new Pre-defined message
         insert into email
                (ids, prjid, msg, url_addr, adminid)
          values
                (seq_email.NextVal
                ,0
                ,varMsg
                ,varURL_Address
                ,varAdminID);
         
      else                   -- existing Pre-defined message
         update email
          set msg = varMsg
             ,url_addr = varURL_Address
             ,adminid = varAdminID
         where ids = varMsgID;
      end if;
      commit;
   
   else -- varPrjID <> 0 -- Message to Project participants which will fall in category "Already sent"
      insert into email
                (ids, prjid, msg, url_addr, adminid)
          values
                (seq_email.NextVal
                ,varPrjID
                ,varMsg
                ,varURL_Address
                ,varAdminID);

      commit;

   end if;
else -- varProcess = 'D'
     delete email
      where ids = varMsgID;
     commit;
     
   
end if;                
END sp_InsUpdEMail;
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
IS
v_Counter NUMBER;

-- For Users
v_PID NUMBER; -- To hold substringed value of Participant ID from varUsersInTarget;
v_Len NUMBER; -- To hold length of the string after determination of the
              -- position of the separator '_';
v_UsersInTarget VARCHAR2(4000); -- To hold the rest of target text.
-- For Managers
v_MID NUMBER; -- To hold substringed value of Manager ID from varMngrsInTarget;
v_MLen NUMBER;-- To hold length of the string after determination of the
              -- position of the separator '_'.
v_MngrsInTarget VARCHAR2(4000); -- To hold the rest of target text.

BEGIN --sp_InsUpdAssignedParts
  ------------------------------------------------------------------------------------------------------
  INSERT INTO answers_temp 
   SELECT * 
    FROM answers a
    WHERE a.reaserch_id = varPrjID;
  
  DELETE FROM ANSWERS WHERE REASERCH_ID = varPrjID;
  
  COMMIT;
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
    
    select Count(*) into v_Counter
    from answers_temp an
    where an.reaserch_id = varPrjID
          and
          an.participant_id = v_PID;
    
    if v_Counter = 0 then
       INSERT INTO ANSWERS (PARTICIPANT_ID, REASERCH_ID) VALUES (v_PID, varPrjID);
    else -- v_Counter > 0
       INSERT INTO answers a
        SELECT * 
         FROM answers_temp 
         WHERE reaserch_id = varPrjID
               and
               participant_id = v_PID;
               
       DELETE answers_temp a
        WHERE reaserch_id = varPrjID
               and
               participant_id = v_PID;
    end if;
    
    COMMIT;
    
    EXIT WHEN v_Len = 0;
  END LOOP;
  
  DELETE comments c
   where c.prj_id = varPrjID
         and
         c.user_id IN (select a.participant_id 
                        from answers_temp a 
                        where a.reaserch_id = varPrjID
                      );
  
  delete answers_temp
   where reaserch_id = varPrjID;
  
  COMMIT;
  
  
  ------------------------------------------------------------------------------------------------------
  -- For Managers:
  ----------------
  DELETE FROM PROJECT_MANAGERS WHERE PRJ_ID = varPrjID;
  COMMIT;
  
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
                       ,varPrjSuperID     IN NUMBER
                       ,rc_InsUpdPrj      OUT rc_GetAll
                       )
IS BEGIN
-- If Project does not exist:
IF varPrjID = 0 THEN
  INSERT INTO Q42ADMIN.REASERCH_DATES (IDS, DESCRIPTIONS,START_DATE, END_DATE, PRJ_SUPER_ID)
  VALUES  (ReaserchDates_IDs.NextVal, varPrjDescr, varStartDate, (varStartDate + varResearchLength), varPrjSuperID);
  COMMIT;

  OPEN rc_InsUpdPrj FOR
  SELECT 'NA' AS OrgID, IDS, DESCRIPTIONS, START_DATE, END_DATE, PRJ_SUPER_ID
  FROM REASERCH_DATES
  WHERE ROWID = (SELECT Max(ROWID) FROM REASERCH_DATES);
  
-- If Project exists:
ELSE
  UPDATE REASERCH_DATES SET
         DESCRIPTIONS = varPrjDescr
        ,START_DATE = varStartDate
        ,END_DATE = varStartDate + varResearchLength
        ,PRJ_SUPER_ID = varPrjSuperID
  WHERE IDS = varPrjID;
  COMMIT;

  OPEN rc_InsUpdPrj FOR
  SELECT DECODE(Q42ADMIN.PACK_FUNC.f_getOrgID (varPrjID), 0, 'NA',
                Q42ADMIN.PACK_FUNC.f_getOrgID (varPrjID) ) AS OrgID,
         rd.IDS, rd.DESCRIPTIONS, rd.START_DATE, rd.END_DATE, rd.prj_super_id
  FROM Q42ADMIN.REASERCH_DATES rd
  WHERE rd.IDS = varPrjID 
        AND
        rd.anybody_answered = 'A'
  ;
END IF;
END sp_InsUpdPrj;
--===================================================================================================

PROCEDURE Sp_InsUpdUserAnswers (varSQL_Update    IN VARCHAR2
                               ,varSQL_Delete    IN VARCHAR2
                               ,varParticipantID IN NUMBER
                               ,varReaserchID    IN NUMBER)            
IS 
varCompleteSQL_Update VARCHAR2(4000); 
varCompleteSQL_Delete VARCHAR2(4000);

BEGIN    

  varCompleteSQL_Update := varSQL_Update||
                  ' WHERE REASERCH_ID = '||varReaserchID||
                  ' AND PARTICIPANT_ID = '||varParticipantID;

  execute immediate varCompleteSQL_Update;
  
  if varSQL_Delete <> '' Then
     varCompleteSQL_Delete := 'DELETE COMMENTS'||
                  ' WHERE PRJ_ID = '||varReaserchID||
                  ' AND USER_ID = '||varParticipantID||
                  ' AND ('||varSQL_Delete||')';
    
    execute immediate varCompleteSQL_Delete;
  end if; 
   
   commit;

END sp_InsUpdUserAnswers;
--===================================================================================================            
PROCEDURE sp_DeletePrj( varPrjID IN REASERCH_DATES.IDS%TYPE )
IS BEGIN
   --
   delete REASERCH_DATES rd
    where rd.IDS = varPrjID;
   --
   delete ANSWERS a
    where a.reaserch_id = varPrjID;
   --
   delete COMMENTS c
    where c.prj_id = varPrjID;
   --
   delete PROJECT_MANAGERS pm
    where pm.prj_id = varPrjID;
  --
  commit;
   
END sp_DeletePrj;
--===================================================================================================            

PROCEDURE sp_InsUpdArchivePrj(varPrjID IN REASERCH_DATES.IDS%TYPE )
IS
varActInact CHAR(1);

BEGIN
   select rd.anybody_answered into varActInact
   from reaserch_dates rd
   where rd.ids = varPrjID;
   
   if varActInact = 'A' then
      update reaserch_dates rd
         set rd.anybody_answered = 'I'
       where rd.ids = varPrjID;
   else
       update reaserch_dates rd
         set rd.anybody_answered = 'A'
       where rd.ids = varPrjID;
   end if;
   
   commit;

END sp_InsUpdArchivePrj;
--===================================================================================================            
END PACK_INSUPD;
/
