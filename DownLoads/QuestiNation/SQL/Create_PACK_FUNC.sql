CREATE OR REPLACE PACKAGE PACK_FUNC AS

  FUNCTION f_getOrgID (varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER;
  
  pragma RESTRICT_REFERENCES(f_getOrgID,WNDS,WNPS,RNPS);
  
END PACK_FUNC;
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY "PACK_FUNC"  AS

--=======================================================================================
/*
FUNCTION f_CountPrjs ( varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER
IS
ReturnVal NUMBER;
BEGIN
		 select Count(*) INTO ReturnVal
         from ANSWERS a
         where a.REASERCH_ID = varPrjID;
		 return ReturnVal;

		 EXCEPTION
		 When NO_DATA_FOUND then
		    ReturnVal := 0;
         return ReturnVal;
    END f_CountPrjs;
*/
--=======================================================================================
function f_getOrgID ( varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER
is

RtnVal NUMBER;
Begin
     select u.ORG_ID INTO RtnVal
     from q42admin.users u, q42admin.answers a
     where u.IDS = a.PARTICIPANT_ID
           and 
           a.REASERCH_ID = varPrjID
           and
           rownum = 1;
     Return RtnVal;
     
     
     EXCEPTION
		 When NO_DATA_FOUND then
		      RtnVal := 0;
         Return RtnVal;


End f_getOrgID;

--=======================================================================================
END PACK_FUNC;
