CREATE OR REPLACE  PACKAGE "Q42ADMIN"."PACK_GET_DATES"  AS TYPE 
    refc_PackGetDates IS REF CURSOR;-- RETURN dual%rowType;
PROCEDURE sp_getDates (v_CursorVar OUT refc_PackGetDates);
PROCEDURE sp_InsUpdProjects(
                            varReportID   IN NUMBER,
                            varProjDescr  IN VARCHAR2,
                            varStartDate  IN DATE,
                            varReportLength IN NUMBER--,
                            --v_CursorVar OUT refc_PackGetDates
                            );
END PACK_GET_DATES;
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
CREATE OR REPLACE  PACKAGE BODY "Q42ADMIN"."PACK_GET_DATES"  AS  
----------------------------------------------------------------------------------------------
PROCEDURE sp_getDates (v_CursorVar OUT refc_PackGetDates)
IS
BEGIN
OPEN v_CursorVar FOR
  SELECT  0 AS DatesID
         ,'==Create New Reaserch Period==' AS DateMsg
         ,''  AS ProjDescr
         ,TO_CHAR(SYSDATE,'MM/DD/YYYY') AS StartDate
         ,TO_CHAR(SYSDATE,'MM/DD/YYYY') AS EndDate
   FROM DUAL
  --WHERE rownum = 1
  UNION
  SELECT IDS AS DatesID
        ,'from  '||TO_CHAR(START_DATE,'MM/DD/YYYY')||'  to  '||TO_CHAR(END_DATE,'MM/DD/YYYY')||'   '||SUBSTR(DESCRIPTIONS, 0, 10) AS DateMsg
        ,DESCRIPTIONS AS ProjDescr
        ,TO_CHAR(START_DATE,'MM/DD/YYYY')        AS StartDate
        ,TO_CHAR(END_DATE,'MM/DD/YYYY')          AS EndDate
  FROM Q42ADMIN.REASERCH_DATES
  WHERE IDS NOT IN (SELECT REASERCH_ID FROM Q42ADMIN.ANSWERS)
        AND SYSDATE < START_DATE
  ORDER BY 1
  ;
END sp_getDates;
-------------------------------------------------------------------------------------------------
PROCEDURE sp_InsUpdProjects(
                            varReportID   IN NUMBER,
                            varProjDescr  IN VARCHAR2,
                            varStartDate  IN DATE,
                            varReportLength IN NUMBER--,
                            --v_CursorVar OUT refc_PackGetDates
                            )
IS 
BEGIN
--OPEN v_CursorVar FOR
--SELECT  0 from dual; 

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

  --OPEN v_CursorVar FOR
  --SELECT  0 from dual; 
  
  
END sp_InsUpdProjects;
----------------------------------------------------------------------------------------------
END PACK_GET_DATES;