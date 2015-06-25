CREATE OR REPLACE PROCEDURE sp_GetOrgs (varPrjID IN REASERCH_DATES.IDS%TYPE)
Is Begin
  select distinct u.ORG_ID
  from USERS u, ANSWERS a
  where u.IDS = a.PARTICIPANT_ID
  --Addition to the script:
  and a.REASERCH_ID = varPrjID;
End sp_GetOrgs;
/
