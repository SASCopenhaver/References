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