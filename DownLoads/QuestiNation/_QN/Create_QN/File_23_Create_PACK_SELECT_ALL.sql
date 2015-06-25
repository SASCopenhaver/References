CREATE OR REPLACE PACKAGE "PACK_SELECT_ALL" AS TYPE rc_GetAll IS REF CURSOR;

-------------------------------------------------------------------------
PROCEDURE sp_EMailMsg (varPrjID IN REASERCH_DATES.IDS%TYPE
                      ,rc_EMailMsg  OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_getComments(varUUID IN VARCHAR2
                        ,varPrjIDs IN VARCHAR2
                        ,rc_getComments OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_AllOrgs  (rc_AllOrgs   OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_AllUsers (rc_AllUsers  OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_AllUsersForEMail (rc_AllUsersForEMail  OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_Menu     (varOrgID     IN USERS.ORG_ID%TYPE
                      ,rc_Menu      OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_AllActivePrjs  (rc_AllPrjs   OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_PrjsStat (rc_PrjsStat  OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_selectUsersInTblAnswers (rc_UsersInAnswers  OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_UserMenu (varUserID IN USERS.IDS%TYPE
                      ,rc_UserPrjs OUT rc_GetAll
                      ,rc_UserMenu OUT rc_GetAll);

PROCEDURE sp_selectQandA (rc_Quest OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_UserAnswers (  varUserID IN USERS.IDS%TYPE
                           ,varPrjID  IN REASERCH_DATES.IDS%TYPE
                           ,rc_UserAnswers OUT rc_GetAll);

PROCEDURE sp_PrjMngrs (rc_PrjMngrs OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_UserComments ( varPrjID  IN REASERCH_DATES.IDS%TYPE
                           ,varUserID IN USERS.IDS%TYPE
                           ,varQNum   IN NUMBER
                           ,rc_UserComments OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_IfUserHasComments ( varPrjID  IN REASERCH_DATES.IDS%TYPE
                                ,varUserID IN USERS.IDS%TYPE
                                ,rc_IfUserHasComments OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_PrjsForOverview (rc_ActPrjsForOverview OUT rc_GetAll
                             ,rc_InactPrjsForOverview OUT rc_GetAll );
-------------------------------------------------------------------------
PROCEDURE sp_AllPrjsForReport (rc_AllPrjsForReport  OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_Report_Mngrs_VS_Parts (varUUID IN VARCHAR2
                    ,varPrjIDs IN VARCHAR2
                    --,varWithWithoutCommnts IN VARCHAR2
                    ,rc_Report_Mngrs_VS_Parts OUT rc_GetAll
                    );                    
-------------------------------------------------------------------------
PROCEDURE sp_Report_Average (varUUID IN VARCHAR2
                    ,varPrjIDs IN VARCHAR2
                    --,varWithWithoutCommnts IN VARCHAR2
                    ,rc_Report_Average OUT rc_GetAll
                    );                    
-------------------------------------------------------------------------
PROCEDURE sp_AllPrjsForEMail (rc_AllPrjsForEMail  OUT rc_GetAll);
-------------------------------------------------------------------------
PROCEDURE sp_selectPartsStatForEMail (rc_PartsStatForEMail  OUT rc_GetAll);
-------------------------------------------------------------------------

END PACK_SELECT_ALL;
/
CREATE OR REPLACE PACKAGE BODY "PACK_SELECT_ALL"   AS
--==================================================================================================

--==================================================================================================

PROCEDURE sp_EMailMsg (varPrjID IN REASERCH_DATES.IDS%TYPE
                      ,rc_EMailMsg  OUT rc_GetAll)
IS BEGIN 
OPEN rc_EmailMsg FOR
     select  ids      AS MsgID
            ,prjid    AS PrjID
            ,msg      AS Msg
            ,url_addr AS URL_Addr
            ,adminid  AS AdminID
      from email e
      where e.prjid = varPrjID;
                      
END sp_EmailMsg;
--==================================================================================================

PROCEDURE sp_getComments(varUUID IN VARCHAR2
                        ,varPrjIDs IN VARCHAR2
                        ,rc_getComments OUT rc_GetAll)
IS 
v_PrjID NUMBER;
v_PrjIDs VARCHAR2(2000); 
v_CommaPos NUMBER;
v_PrjName VARCHAR2(255);
/*
'OPP'- Organizational/Personal Pride
'PE' - Performance/Excelence
'TC' - Teamwork/Communication
'LS' - Leadership/Supervision
'PCE'- Profitability/Cost Effectiveness
'CAR'- Colleague/Associate Relations
'CCR'- Customer/Client Relations
'IC' - Innovativeness/Creativity
'TD' - Training/Development
'CO' - Candor/Openness
*/
BEGIN

v_PrjIDs := varPrjIDs;

   Loop
    -- Determine the first Coma Pos in string v_PrjIDs:
    v_CommaPos := INSTR(v_PrjIDs, ',', 1);
    
    if v_CommaPos <> 0 then
    -- Extruct PrjID from the comma delimited list of Project IDs 
       v_PrjID := TO_NUMBER(SUBSTR(v_PrjIDs, 1, (v_CommaPos-1)));
    -- Make comma delimited list of Project IDs shorter on just about to be used PrjID
       v_PrjIDs := SUBSTR(v_PrjIDs, (v_CommaPos+1));
    else
       v_PrjID := TO_NUMBER(v_PrjIDs);
    end if;
   
    select rd.descriptions into v_PrjName
     from reaserch_dates rd
     where rd.ids = v_PrjID;
        
    INSERT INTO Comments_Temp
    -- Organizational/Personal Pride
    select varUUID AS UUID
          ,v_PrjID AS PrjID
          ,'1'     AS Seq
          ,''   AS NormAbbr
          ,'<font color="#008080">'||v_PrjName||':</font>  OPP - Organizational/Personal Pride' AS NormDescr
      from dual
     --
     union
     --
     select varUUID AS UUID
           ,v_PrjID AS PrjID
           ,'11'    AS Seq
           ,'OPP'   AS NormAbbr
           ,c.comments AS NormDescr
       from comments c
       where (c.q_num = 1 or c.q_num = 11 or c.q_num = 21 or c.q_num = 31)
             and
             c.prj_id = v_PrjID
     --
     union
     -- Performance/Excelence
     select varUUID AS UUID
           ,v_PrjID AS PrjID
           ,'2'     AS Seq
           ,''    AS NormAbbr
           ,'<font color="#008080">'||v_PrjName||':</font>  PE - Performance/Excelence' AS NormDescr
      from dual
      --
      union
      --
      select varUUID AS UUID
            ,v_PrjID AS PrjID
            ,'22'    AS Seq
            ,'PE'    AS NormAbbr
            ,c.comments AS NormDescr
       from comments c
       where (c.q_num = 2 or c.q_num = 12 or c.q_num = 22 or c.q_num = 32 or c.q_num = 40)
             and
             c.prj_id = v_PrjID
        --
        union
        -- Teamwork/Communication
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'3'     AS Seq
              ,''    AS NormAbbr
              ,'<font color="#008080">'||v_PrjName||':</font>  TC - Teamwork/Communication' AS NormDescr
         from dual
        --
        union
        --
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'33'    AS Seq
              ,'TC'    AS NormAbbr
              ,c.comments AS NormDescr
         from comments c
         where (c.q_num = 3 or c.q_num = 13 or c.q_num = 23 or c.q_num = 33 or c.q_num = 41)
               and
               c.prj_id = v_PrjID
        --
        union
        -- Leadership/Supervision
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'4' AS Seq
              ,'' AS NormAbbr
              ,'<font color="#008080">'||v_PrjName||':</font>  LS - Leadership/Supervision' AS NormDescr
         from dual
        --
        union
        --
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'44'    AS Seq
              ,'LS'    AS NormAbbr
              ,c.comments AS NormDescr
         from comments c
         where (c.q_num = 4 or c.q_num = 14 or c.q_num = 24 or c.q_num = 34 or c.q_num = 42)
               and
               c.prj_id = v_PrjID
        --
        union
        -- Profitability/Cost Effectiveness
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'5' AS Seq
              ,'' AS NormAbbr
              ,'<font color="#008080">'||v_PrjName||':</font>  PCE - Profitability/Cost Effectiveness' AS NormDescr
         from dual
        --
        union
        --
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'55'    AS Seq
              ,'PCE'    AS NormAbbr
              ,c.comments AS NormDescr
         from comments c
         where (c.q_num = 5 or c.q_num = 15 or c.q_num = 25 or c.q_num = 35)
               and
               c.prj_id = v_PrjID
        --
        union
        -- Colleague/Associate Relations
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'6' AS Seq
              ,'' AS NormAbbr
              ,'<font color="#008080">'||v_PrjName||'</font>:  CAR - Colleague/Associate Relations' AS NormDescr
         from dual
        --
        union
        --
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'66'    AS Seq
              ,'CAR'    AS NormAbbr
              ,c.comments AS NormDescr
         from comments c
         where (c.q_num = 6 or c.q_num = 16 or c.q_num = 26)
               and
               c.prj_id = v_PrjID
        --
        union
        -- Customer/Client Relations
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'7' AS Seq
              ,'' AS NormAbbr
              ,'<font color="#008080">'||v_PrjName||':</font>  CCR - Customer/Client Relations' AS NormDescr
         from dual
        --
        union
        --
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'77'    AS Seq
              ,'CCR'    AS NormAbbr
              ,c.comments AS NormDescr
         from comments c
         where (c.q_num = 7 or c.q_num = 17 or c.q_num = 27 or c.q_num = 36)
               and
               c.prj_id = v_PrjID
        --
        union
        -- Innovativeness/Creativity
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'8' AS Seq
              ,'' AS NormAbbr
              ,'<font color="#008080">'||v_PrjName||':</font>  IC - Innovativeness/Creativity' AS NormDescr
         from dual
        --
        union
        --
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'88'    AS Seq
              ,'IC'    AS NormAbbr
              ,c.comments AS NormDescr
         from comments c
         where (c.q_num = 8 or c.q_num = 18 or c.q_num = 28 or c.q_num = 37)
               and
               c.prj_id = v_PrjID
        --
        union
        -- Training/Development
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'9' AS Seq
              ,'' AS NormAbbr
              ,'<font color="#008080">'||v_PrjName||':</font>  TD - Training/Development' AS NormDescr
         from dual
        --
        union
        --
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'99'    AS Seq
              ,'TD'    AS NormAbbr
              ,c.comments AS NormDescr
         from comments c
         where (c.q_num = 9 or c.q_num = 19 or c.q_num = 29 or c.q_num = 38)
               and
               c.prj_id = v_PrjID
        --
        union
        -- Candor/Openness
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'999' AS Seq
              ,'' AS NormAbbr
              ,'<font color="#008080">'||v_PrjName||':</font>  CO - Candor/Openness' AS NormDescr
         from dual
        --
        union
        --
        select varUUID AS UUID
              ,v_PrjID AS PrjID
              ,'9999'    AS Seq
              ,'CO'    AS NormAbbr
              ,c.comments AS NormDescr
         from comments c
         where (c.q_num = 10 or c.q_num = 20 or c.q_num = 30 or c.q_num = 39)
               and
               c.prj_id = v_PrjID
         ;
         
     commit;
     
     Exit When v_CommaPos=0;
     End Loop;
     
     OPEN rc_getComments FOR
     select ct.prjid AS PrjID
           ,DECODE(normabbr,
                   /*if*/'', /*then*/'<strong>'||NormDescr||'</strong>',
                   /*else*/NormDescr
                   ) AS NormDescr
      from comments_temp ct
      order by ct.seq;
     
     delete comments_temp ct
      where ct.uuid = varUUID;
     
     commit;

END sp_getComments;
--==================================================================================================
PROCEDURE sp_Report_Mngrs_VS_Parts (varUUID IN VARCHAR2
                    ,varPrjIDs IN VARCHAR2
                    ,rc_Report_Mngrs_VS_Parts OUT rc_GetAll
                    )
IS 
v_PrjID NUMBER;
v_PrjIDs VARCHAR2(2000); 
v_CommaPos NUMBER;
/*
'OPP'- Organizational/Personal Pride
'PE' - Performance/Excelence
'TC' - Teamwork/Communication
'LS' - Leadership/Supervision
'PCE'- Profitability/Cost Effectiveness
'CAR'- Colleague/Associate Relations
'CCR'- Customer/Client Relations
'IC' - Innovativeness/Creativity
'TD' - Training/Development
'CO' - Candor/Openness
*/
BEGIN
v_PrjIDs := varPrjIDs;

   Loop
    -- Determine the first Coma Pos in string v_PrjIDs:
    v_CommaPos := INSTR(v_PrjIDs, ',', 1);
    
    if v_CommaPos <> 0 then
    -- Extruct PrjID from the comma delimited list of Project IDs 
       v_PrjID := TO_NUMBER(SUBSTR(v_PrjIDs, 1, (v_CommaPos-1)));
    -- Make comma delimited list of Project IDs shorter on just about to be used PrjID
       v_PrjIDs := SUBSTR(v_PrjIDs, (v_CommaPos+1));
    else
       v_PrjID := TO_NUMBER(v_PrjIDs);
    end if;
   
        
    insert into ReportInfo_Temp
    values(
           -------------------------------------------------------
            varUUID
           ,v_PrjID
           -- Manager Info ------------------------------------
           ,PACK_FUNC.f_CalcNorms('OPP', v_PrjID, 'IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('PE',  v_PrjID, 'IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('TC',  v_PrjID, 'IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('LS',  v_PrjID, 'IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('PCE', v_PrjID, 'IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('CAR', v_PrjID, 'IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('CCR', v_PrjID, 'IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('IC',  v_PrjID, 'IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('TD',  v_PrjID, 'IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('CO',  v_PrjID, 'IN', 'MngrsVSParts')
          -- Participants Info ---------------------------------
           ,PACK_FUNC.f_CalcNorms('OPP', v_PrjID, 'NOT IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('PE',  v_PrjID, 'NOT IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('TC',  v_PrjID, 'NOT IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('LS',  v_PrjID, 'NOT IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('PCE', v_PrjID, 'NOT IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('CAR', v_PrjID, 'NOT IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('CCR', v_PrjID, 'NOT IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('IC',  v_PrjID, 'NOT IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('TD',  v_PrjID, 'NOT IN', 'MngrsVSParts')
           ,PACK_FUNC.f_CalcNorms('CO',  v_PrjID, 'NOT IN', 'MngrsVSParts')
          -------------------------------------------------------
           ,PACK_FUNC.f_getPrjName(v_PrjID)
         );
         commit;
     
     Exit When v_CommaPos=0;
     End Loop;
     
     OPEN rc_Report_Mngrs_VS_Parts FOR
     select uuid, prjid, 
     -------------------------------------------------------------
     mngropp, DECODE(Sign(mngropp),-1,'Blue','Blue') AS MngrOPP_Color,
     mngrpe,  DECODE(Sign(mngrpe), -1,'Maroon','Maroon') AS MngrPE_Color,
     mngrtc,  DECODE(Sign(mngrtc), -1,'Green','Green') AS MngrTC_Color,
     mngrls,  DECODE(Sign(mngrls), -1,'Navy','Navy') AS MngrLS_Color,
     mngrpce, DECODE(Sign(mngrpce),-1,'Fuchsia','Fuchsia') AS MngrPCE_Color,
     mngrcar, DECODE(Sign(mngrcar),-1,'Lime','Lime') AS MngrCAR_Color,
     mngrccr, DECODE(Sign(mngrccr),-1,'Teal','Teal') AS MngrCCR_Color,
     mngric,  DECODE(Sign(mngric), -1,'Olive','Olive') AS MngrIC_Color,
     mngrtd,  DECODE(Sign(mngrtd), -1,'Silver','Silver') AS MngrTD_Color,
     mngrco,  DECODE(Sign(mngrco), -1,'Purple','Purple') AS MngrCO_Color,
     -------------------------------------------------------------
     partopp, DECODE(Sign(partopp),-1,'Blue','Blue') AS PartOPP_Color,
     partpe,  DECODE(Sign(partpe), -1,'Maroon','Maroon') AS PartPE_Color,
     parttc,  DECODE(Sign(parttc), -1,'Green','Green') AS PartTC_Color,
     partls,  DECODE(Sign(partls), -1,'Navy','Navy') AS PartLS_Color,
     partpce, DECODE(Sign(partpce),-1,'Fuchsia','Fuchsia') AS PartPCE_Color,
     partcar, DECODE(Sign(partcar),-1,'Lime','Lime') AS PartCAR_Color,
     partccr, DECODE(Sign(partccr),-1,'Teal','Teal') AS PartCCR_Color,
     partic,  DECODE(Sign(partic), -1,'Olive','Olive') AS PartIC_Color,
     parttd,  DECODE(Sign(parttd), -1,'Silver','Silver') AS PartTD_Color,
     partco,  DECODE(Sign(partco), -1,'Purple','Purple') AS PartCO_Color,
     -------------------------------------------------------------
     prjname 
      from reportinfo_temp ri
      where ri.uuid = varUUID
      order by ri.prjid;
     
     delete reportinfo_temp ri
      where ri.uuid = varUUID;
     
     commit;
     
END sp_Report_Mngrs_VS_Parts;
--==================================================================================================

PROCEDURE sp_Report_Average (varUUID IN VARCHAR2
                    ,varPrjIDs IN VARCHAR2
                    ,rc_Report_Average OUT rc_GetAll)
    
IS 
v_PrjID NUMBER;
v_PrjIDs VARCHAR2(2000); 
v_CommaPos NUMBER;
/*
'OPP'- Organizational/Personal Pride
'PE' - Performance/Excelence
'TC' - Teamwork/Communication
'LS' - Leadership/Supervision
'PCE'- Profitability/Cost Effectiveness
'CAR'- Colleague/Associate Relations
'CCR'- Customer/Client Relations
'IC' - Innovativeness/Creativity
'TD' - Training/Development
'CO' - Candor/Openness
*/
BEGIN
v_PrjIDs := varPrjIDs;

--if varWithWithoutCommnts = 'withoutComments' then
   Loop
    -- Determine the first Coma Pos in string v_PrjIDs:
    v_CommaPos := INSTR(v_PrjIDs, ',', 1);
    
    if v_CommaPos <> 0 then
    -- Extruct PrjID from the comma delimited list of Project IDs 
       v_PrjID := TO_NUMBER(SUBSTR(v_PrjIDs, 1, (v_CommaPos-1)));
    -- Make comma delimited list of Project IDs shorter on just about to be used PrjID
       v_PrjIDs := SUBSTR(v_PrjIDs, (v_CommaPos+1));
    else
       v_PrjID := TO_NUMBER(v_PrjIDs);
    end if;
   
        
    insert into ReportInfo_Temp
    values(
           -------------------------------------------------------
            varUUID
           ,v_PrjID
           -- Manager Columns: ------------------------------------
           ,PACK_FUNC.f_CalcNorms('OPP', v_PrjID, '', 'Average')
           ,PACK_FUNC.f_CalcNorms('PE',  v_PrjID, '', 'Average')
           ,PACK_FUNC.f_CalcNorms('TC',  v_PrjID, '', 'Average')
           ,PACK_FUNC.f_CalcNorms('LS',  v_PrjID, '', 'Average')
           ,PACK_FUNC.f_CalcNorms('PCE', v_PrjID, '', 'Average')
           ,PACK_FUNC.f_CalcNorms('CAR', v_PrjID, '', 'Average')
           ,PACK_FUNC.f_CalcNorms('CCR', v_PrjID, '', 'Average')
           ,PACK_FUNC.f_CalcNorms('IC',  v_PrjID, '', 'Average')
           ,PACK_FUNC.f_CalcNorms('TD',  v_PrjID, '', 'Average')
           ,PACK_FUNC.f_CalcNorms('CO',  v_PrjID, '', 'Average')
          -- Participants Columns: ---------------------------------
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
           ,1
          -------------------------------------------------------
           ,PACK_FUNC.f_getPrjName(v_PrjID)
         );
         commit;
     
     Exit When v_CommaPos=0;
     End Loop;
     
     OPEN rc_Report_Average FOR
     select ri.uuid, ri.prjid, 
             mngropp AS AvrgOPP
            ,DECODE(Sign(mngropp),-1,'Blue','Blue') AS AvrgOPP_Color
            ,mngrpe AS AvrgPE
            ,DECODE(Sign(mngrpe), -1,'Maroon','Maroon') AS AvrgPE_Color
            ,mngrtc AS AvrgTC
            ,DECODE(Sign(mngrtc), -1,'Green','Green') AS AvrgTC_Color
            ,mngrls AS AvrgLS
            ,DECODE(Sign(mngrls), -1,'Navy','Navy') AS AvrgLS_Color
            ,mngrpce AS AvrgPCE
            ,DECODE(Sign(mngrpce),-1,'Fuchsia','Fuchsia') AS AvrgPCE_Color
            ,mngrcar AS AvrgCAR
            ,DECODE(Sign(mngrcar),-1,'Lime','Lime') AS AvrgCAR_Color
            ,mngrccr AS AvrgCCR
            ,DECODE(Sign(mngrccr),-1,'Teal','Teal') AS AvrgCCR_Color
            ,mngric AS AvrgIC
            ,DECODE(Sign(mngric), -1,'Olive','Olive') AS AvrgIC_Color
            ,mngrtd AS AvrgTD
            ,DECODE(Sign(mngrtd), -1,'Silver','Silver') AS AvrgTD_Color
            ,mngrco AS AvrgCO
            ,DECODE(Sign(mngrco), -1,'Purple','Purple') AS AvrgCO_Color,
            ri.prjname
      from reportinfo_temp ri
      where ri.uuid = varUUID
      order by ri.prjid;
     
     delete reportinfo_temp ri
      where ri.uuid = varUUID;
     
     commit;

END sp_Report_Average;
--==================================================================================================

PROCEDURE sp_AllPrjsForReport (rc_AllPrjsForReport  OUT rc_GetAll)
IS BEGIN
   OPEN rc_AllPrjsForReport FOR
   
   SELECT rd.ids               AS PrjID
         ,rd.descriptions      AS PrjName
         ,DECODE(rd.anybody_answered, 
         /*if*/'A', /*then*/'(Current)'||PACK_FUNC.f_EligibleForReport(rd.ids), 
         /*else*/'(Archived)'||PACK_FUNC.f_EligibleForReport(rd.ids)) 
                               AS ActInact
    FROM reaserch_dates rd
    WHERE Length(PACK_FUNC.f_EligibleForReport(rd.ids))> 0-- = 'YES'
    ORDER BY rd.anybody_answered, rd.descriptions
    ;

END sp_AllPrjsForReport;
--==================================================================================================

PROCEDURE sp_AllPrjsForEMail (rc_AllPrjsForEMail  OUT rc_GetAll)
-- SP retrievs all ASSIGNED CURRENT ACTIVE projects
IS BEGIN
   OPEN rc_AllPrjsForEMail FOR
   select rd.ids                       AS PrjID
         ,rd.descriptions              AS PrjName
         ,PACK_FUNC.f_getOrgID(rd.ids) AS OrgID
   from reaserch_dates rd
   where rd.anybody_answered = 'A'                 -- Project is ACTIVE
         and
         (SYSDATE between start_date AND end_date) -- Project is CURRENT
         and
         rd.ids IN (select distinct a.reaserch_id  -- Project is ASSIGNED
                     from answers a
                     where a.reaserch_id = rd.ids)
   ;

END sp_AllPrjsForEMail;
--==================================================================================================

PROCEDURE sp_AllActivePrjs  (rc_AllPrjs   OUT rc_GetAll)
IS BEGIN
OPEN rc_AllPrjs FOR
  SELECT * FROM view_For_sp_AllActivePrjs;

END sp_AllActivePrjs;
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
--
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
        END_DATE > SYSDATE AND
        rd.anybody_answered = 'A';
--
OPEN rc_UserMenu FOR
  SELECT m.MENU_ITEM, m.MENU_DESCRIPTION, m.PAGE_TO_BE_CALLED, m.IMG
  FROM MENUS m
  WHERE m.SUPER_MENU = 0 AND
        m.MENU_OWNERSHIP = 'PARTICIPANT';
--
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

PROCEDURE sp_AllUsersForEMail (rc_AllUsersForEMail  OUT rc_GetAll)
IS BEGIN
OPEN rc_AllUsersForEMail FOR
  SELECT u.IDS              AS UserID
        ,INITCAP(u.FNAME)   AS UserFName
        ,UPPER(u.LNAME)    AS UserLName
        ,u.Email           AS UserEmail
        ,u.Org_ID         AS UserOrgID
  FROM USERS u
  WHERE u.act_inact = 'A'
  ORDER BY  u.Org_ID;

END sp_AllUsersForEMail;
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

PROCEDURE sp_PrjsStat (rc_PrjsStat  OUT rc_GetAll)
IS BEGIN
OPEN rc_PrjsStat FOR 
---
SELECT   0 AS RowNums
        ,TO_CHAR(0) AS OrgID
        ,'*** Create New Project ***' AS PrjStatus
FROM DUAL
--
UNION
--
SELECT * FROM view_CountActivePrjs
--
UNION
--
SELECT DISTINCT 
      2 AS RowNums
     ,'NA' AS OrgID
      ,'=== View/Edit NOT Assigned Project(s) ===' AS PrjStatus
FROM REASERCH_DATES rd
WHERE rd.anybody_answered = 'A'
      AND
      rd.IDS NOT IN (SELECT DISTINCT a.REASERCH_ID 
                     FROM ANSWERS a
                     WHERE rd.IDS = a.REASERCH_ID)
--
UNION
--
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
--
UNION
--
SELECT DISTINCT (o.IDS + 4) AS RowNums
      ,TO_CHAR((-1)*(o.IDS)) AS OrgID
      ,'=== View/Edit Completed Project(s) Assigned To '|| UPPER(o.ABBREVIATION)||' ===' AS PrjStatus
FROM ORGANIZATIONS o, REASERCH_DATES rd
WHERE rd.anybody_answered = 'A'
      AND
      o.ABBREVIATION = (SELECT o.ABBREVIATION
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
  SELECT * FROM view_FOR_sp_selectUsersAnswers;
END sp_selectUsersInTblAnswers;
--==================================================================================================

PROCEDURE sp_PrjMngrs (rc_PrjMngrs OUT rc_GetAll)
IS BEGIN
OPEN rc_PrjMngrs FOR
  SELECT PRJ_ID, USER_ID
  FROM PROJECT_MANAGERS; 
END sp_PrjMngrs;
--===================================================================================================

PROCEDURE sp_IfUserHasComments ( varPrjID  IN REASERCH_DATES.IDS%TYPE
                                ,varUserID IN USERS.IDS%TYPE
                                ,rc_IfUserHasComments OUT rc_GetAll)
IS BEGIN
OPEN rc_IfUserHasComments FOR
     SELECT PRJ_ID  As PrjID,
            USER_ID As UserID,
            Q_NUM   AS QNum,
            'YES'   AS IfUserHasComment
     FROM comments
     WHERE PRJ_ID = varPrjID
           AND
           USER_ID = varUserID;

END sp_IfUserHasComments;
--===================================================================================================

PROCEDURE sp_PrjsForOverview (rc_ActPrjsForOverview OUT rc_GetAll
                             ,rc_InactPrjsForOverview OUT rc_GetAll )

IS BEGIN
--
OPEN rc_ActPrjsForOverview FOR
     SELECT * FROM view_ActPrjsForOverview;

--   
OPEN rc_InactPrjsForOverview FOR
     SELECT * FROM view_InactPrjsForOverview;
--     
END sp_PrjsForOverview;
--===================================================================================================
PROCEDURE sp_selectPartsStatForEMail (rc_PartsStatForEMail  OUT rc_GetAll)
IS BEGIN 
OPEN rc_PartsStatForEMail FOR
     select participant_id AS PartID
           ,reaserch_id    AS PrjID
           ,DECODE(LTrim(RTrim(answer_status)),
                   /*if*/'C',/*then*/'**Completed**',
                   /*if*/'P',/*then*/'**Partially**',
                   /*else, 'N'*/'**Not Answered**') 
                           AS AnswrStat
      from answers a
      where a.reaserch_id IN (
                              select rd.ids 
                               from reaserch_dates rd
                               where rd.anybody_answered = 'A'                 -- Project is ACTIVE
                                     and
                                     (SYSDATE between start_date AND end_date) -- Project is CURRENT
                                     and
                                     rd.ids IN (select distinct a.reaserch_id  -- Project is ASSIGNED
                                                 from answers a
                                                 where a.reaserch_id = rd.ids)
                            )
       order by 2;

END sp_selectPartsStatForEMail;
--===================================================================================================
END PACK_SELECT_ALL;
/
