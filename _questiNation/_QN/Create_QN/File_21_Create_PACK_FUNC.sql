CREATE OR REPLACE PACKAGE PACK_FUNC AS

-----------------------------------------------------------------------------
  FUNCTION f_countAnswrs(varPrjID IN NUMBER) return NUMBER;                                                                           
-----------------------------------------------------------------------------
  FUNCTION f_loopCounter (varReaserchID IN NUMBER) return NUMBER;
-----------------------------------------------------------------------------
  FUNCTION f_getPrjCreatorName (varSuperID IN NUMBER) return VARCHAR2;
-----------------------------------------------------------------------------
  FUNCTION f_getOrgName (varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2;
-----------------------------------------------------------------------------
  FUNCTION f_getOrgID (varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER;
-----------------------------------------------------------------------------
  FUNCTION f_getAllParts (varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER;
-----------------------------------------------------------------------------
  --Not Answered:
  FUNCTION f_getNA (varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER;
-----------------------------------------------------------------------------
  --Not Answered Percent:
  FUNCTION f_getNAP (varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER;
-----------------------------------------------------------------------------
  --Partially Answered:
  FUNCTION f_getPA (varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER;
-----------------------------------------------------------------------------
  --Partially Answered Percent:
  FUNCTION f_getPAP (varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER;
-----------------------------------------------------------------------------
  --Completed Answers:
  FUNCTION f_getCA (varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER;
-----------------------------------------------------------------------------
  --Completed Answers Percent:
  FUNCTION f_getCAP (varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER;
-----------------------------------------------------------------------------
  FUNCTION f_getPrjMngr(varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2;
-----------------------------------------------------------------------------
  FUNCTION f_EligibleForReport(varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2;
-----------------------------------------------------------------------------
  FUNCTION f_CalcNorms(varNormCode IN VARCHAR2
                      ,varPrjID IN REASERCH_DATES.IDS%TYPE
                      ,varMngrOrPart IN VARCHAR2
                      ,varCalcType IN VARCHAR2) return NUMBER;
-----------------------------------------------------------------------------
  FUNCTION f_getPrjName (varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2;
-----------------------------------------------------------------------------
  FUNCTION f_EligibleForReport2(varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2;
-----------------------------------------------------------------------------
  
  pragma RESTRICT_REFERENCES(f_getOrgID,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getAllParts,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getNA,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getNAP,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getPA,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getPAP,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getCA,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getCAP,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getPrjMngr,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_EligibleForReport,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_CalcNorms,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getPrjName,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_EligibleForReport2,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_loopCounter,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getPrjCreatorName,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_getOrgName,WNDS,WNPS,RNPS);
  pragma RESTRICT_REFERENCES(f_countAnswrs,WNDS,WNPS,RNPS);
  
  
END PACK_FUNC;
/
CREATE OR REPLACE PACKAGE BODY "PACK_FUNC"  AS

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
function f_countAnswrs(varPrjID IN NUMBER) return NUMBER
is
RtnVal NUMBER;
Begin
     SELECT COUNT(*) into RtnVal 
      FROM ANSWERS a 
      WHERE a.REASERCH_ID = varPrjID;
      Return RtnVal;
End f_countAnswrs;
-----------------------------------------------------------------------------

function f_loopCounter (varReaserchID IN NUMBER) return NUMBER
is
RtnVal NUMBER;
Begin
     select Count(*) into RtnVal
      from ANSWERS aa 
      where aa.REASERCH_ID = varReaserchID; 

      Return RtnVal;
End f_loopCounter;
-----------------------------------------------------------------------------
function f_getPrjCreatorName (varSuperID IN NUMBER) return VARCHAR2
is
RtnVal VARCHAR2(100);
Begin
     select Upper(u.lname)||', '||InitCap(u.fname) into RtnVal
      from users u 
      where u.ids = varSuperID;
      
     Return RtnVal;
End f_getPrjCreatorName;
-----------------------------------------------------------------------------
FUNCTION f_getUserAnswerStatus(varPartID IN NUMBER) return VARCHAR2
IS
RtnVal VARCHAR2(20);
Begin
       select DECODE (a.answer_status,
              /*if*/'C', /*then*/'Completed',
              /*if*/'P', /*then*/'Partially',
              /*else -'N'-*/'Not Answered') into RtnVal
        from answers a
        where a.participant_id = varPartID;

       Return RtnVal;
END f_getUserAnswerStatus; 
-----------------------------------------------------------------------------

FUNCTION f_getPrjName (varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2
Is
RtnVal VARCHAR2(255);
Begin
     select rd.descriptions into RtnVal
      from reaserch_dates rd
      where rd.ids = varPrjID;
      
      Return RtnVal;

End f_getPrjName;
-----------------------------------------------------------------------------
FUNCTION f_CalcNorms(varNormCode IN VARCHAR2
                    ,varPrjID IN REASERCH_DATES.IDS%TYPE
                    ,varMngrOrPart IN VARCHAR2
                    ,varCalcType IN VARCHAR2) return NUMBER
-- varNormCode delivers code for NORM calculation;
-- varPrjID delivers Project ID;
-- varMngrOrPart delivers 'IN' for Managers or 'NOT IN' for Participants

AS
RtnVal NUMBER;
v_CompleteSQL VARCHAR2(3000);
v_NormCode VARCHAR2(3000);
v_NumOfMngrs_AndOr_Parts NUMBER;

Begin
--------------------------------------------------------------------------
    if varCalcType = 'MngrsVSParts' then -- Calculation applies to Managers and Participants
       -------------------------------------------------
       if varMngrOrPart = 'IN' then -- Managers
          select Count(*) into v_NumOfMngrs_AndOr_Parts
           from answers a
           where a.participant_id IN (select pm.user_id 
                                       from project_managers pm
                                       where pm.prj_id = varPrjID)
                 and
                 a.reaserch_id = varPrjID
                 and
                 a.answer_status = 'C';
       -------------------------------------------------
       elsif varMngrOrPart = 'NOT IN' then -- Participants 
           select Count(*) into v_NumOfMngrs_AndOr_Parts
           from answers a
           where a.participant_id NOT IN (select pm.user_id 
                                           from project_managers pm
                                           where pm.prj_id = varPrjID)
                 and
                 a.reaserch_id = varPrjID
                 and
                 a.answer_status = 'C';
       end if;
       --------------------------------------------------
    elsif varCalcType = 'Average' then
         select Count(*) into v_NumOfMngrs_AndOr_Parts
           from answers a
           where a.reaserch_id = varPrjID
                 and
                 a.answer_status = 'C';
       
    end if;
--------------------------------------------------------------------------
     if varNormCode = 'OPP' then
        -- Organizational/Personal Pride
        v_NormCode := '(((sum(Q1)+sum(Q11)+sum(Q21)+sum(Q31))/8)*100) ';
        
     elsif varNormCode = 'PE' then 
        -- Performance/Excelence
        v_NormCode := '(((sum(Q2)+sum(Q12)+sum(Q22)+sum(Q32)+sum(Q40))/10)*100) ';
        
     elsif varNormCode = 'TC' then
        -- Teamwork/Communication
        v_NormCode := '(((sum(Q3)+sum(Q13)+sum(Q23)+sum(Q33)+sum(Q41))/10)*100) ';
        
     elsif varNormCode = 'LS' then
        -- Leadership/Supervision 
        v_NormCode := '(((sum(Q4)+sum(Q14)+sum(Q24)+sum(Q34)+sum(Q42))/10)*100) ';
        
     elsif varNormCode = 'PCE' then
        -- Profitability/Cost Effectiveness
        v_NormCode := '(((sum(Q5)+sum(Q15)+sum(Q25)+sum(Q35))/8)*100) ';
        
     elsif varNormCode = 'CAR' then
        -- Colleague/Associate Relations
        v_NormCode := '(((sum(Q6)+sum(Q16)+sum(Q26))/6)*100) ';
        
     elsif varNormCode = 'CCR' then
        -- Customer/Client Relations
        v_NormCode := '(((sum(Q7)+sum(Q17)+sum(Q27)+sum(Q36))/8)*100) ';
        
     elsif varNormCode = 'IC' then
        -- Innovativeness/Creativity
        v_NormCode := '(((sum(Q8)+sum(Q18)+sum(Q28)+sum(Q37))/8)*100) ';
        
     elsif varNormCode = 'TD' then
        -- Training/Development
        v_NormCode := '(((sum(Q9)+sum(Q19)+sum(Q29)+sum(Q38))/8)*100) ';
        
     elsif varNormCode = 'CO' then
        -- Candor/Openness
        v_NormCode := '(((sum(Q10)+sum(Q20)+sum(Q30)+sum(Q39))/8)*100) ';
        
     end if;   
     
    -------------------------------------------------------------------------------
    
    if varCalcType = 'MngrsVSParts' then
       v_CompleteSQL := 'select Round('||v_NormCode||'/'||v_NumOfMngrs_AndOr_Parts||')'||
                        ' from answers a '||
                        ' where a.answer_status = ''C'''||
                        ' and '||
                        ' a.participant_id '||varMngrOrPart||' ( select pm.user_id '||
                                                               'from project_managers pm '||
                                                              'where pm.prj_id = '||varPrjID||' ) '||
                        'and a.reaserch_id = '||varPrjID;
                        
    elsif varCalcType = 'Average' then
       v_CompleteSQL := 'select Round('||v_NormCode||'/'||v_NumOfMngrs_AndOr_Parts||')'||
                        ' from answers a '||
                        ' where a.answer_status = ''C'''||
                               'and a.reaserch_id = '||varPrjID;
    
    end if;
    ------------------------------------------------------------------------------

    execute immediate v_CompleteSQL into RtnVal;
     

     Return RtnVal;
     
End f_CalcNorms;
--=======================================================================================

function f_getOrgName (varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2
is
RtnVal VARCHAR2(200);
Begin
     select o.abbreviation||' - '||o.full_name into RtnVal
      from organizations o
      where o.ids = PACK_FUNC.f_getOrgID(varPrjID);
      
     Return RtnVal;

End f_getOrgName;
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

function f_getAllParts ( varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER
is

RtnVal NUMBER;
Begin
      select Count(*) into RtnVal
      from answers a
      where a.reaserch_id = varPrjID;

      Return RtnVal;
End f_getAllParts;
--=======================================================================================

function f_getNA ( varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER
is

RtnVal NUMBER;
Begin
      select Count(*) into RtnVal
      from answers a
      where a.reaserch_id = varPrjID
            and a.answer_status = 'N';

      Return RtnVal;
End f_getNA;
--=======================================================================================

function f_getNAP ( varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER
is

RtnVal NUMBER;
vNumOfParts NUMBER;
Begin
     select PACK_FUNC.f_getAllParts(varPrjID) into vNumOfParts
     from dual;
     
     if vNumOfParts > 0 then
        select ROUND(((100*PACK_FUNC.f_getNA(varPrjID))/vNumOfParts),0) into RtnVal
        from dual;
     else
         select 0 into Rtnval
         from dual;
     end if;
     
      Return RtnVal;
End f_getNAP;
--=======================================================================================

function f_getPA ( varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER
is

RtnVal NUMBER;
Begin
      select Count(*) into RtnVal
      from answers a
      where a.reaserch_id = varPrjID
            and a.answer_status = 'P';

      Return RtnVal;
End f_getPA;
--=======================================================================================

function f_getPAP ( varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER
is

RtnVal NUMBER;
vNumOfParts NUMBER;
Begin
     select PACK_FUNC.f_getAllParts(varPrjID) into vNumOfParts
     from dual;
     
     if vNumOfParts > 0 then
        select ROUND(((100*PACK_FUNC.f_getPA(varPrjID))/vNumOfParts),0) into RtnVal
        from dual;
     else
         select 0 into Rtnval
         from dual;
     end if;
     
      Return RtnVal;
End f_getPAP;
--=======================================================================================

function f_getCA ( varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER
is

RtnVal NUMBER;
Begin
      select Count(*) into RtnVal
      from answers a
      where a.reaserch_id = varPrjID
            and a.answer_status = 'C';

      Return RtnVal;
End f_getCA;
--=======================================================================================

function f_getCAP ( varPrjID IN REASERCH_DATES.IDS%TYPE) return NUMBER
is
RtnVal NUMBER;
vNumOfParts NUMBER;
Begin
     select PACK_FUNC.f_getAllParts(varPrjID) into vNumOfParts
     from dual;
     
     if vNumOfParts > 0 then
        select ROUND(((100*PACK_FUNC.f_getCA(varPrjID))/vNumOfParts),0) into RtnVal
        from dual;
     else
         select 0 into Rtnval
         from dual;
     end if;
     
      Return RtnVal;
End f_getCAP;
--=======================================================================================

FUNCTION f_getPrjMngr(varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2
is

v_MngrName VARCHAR2(2000);
RtnVal VARCHAR2(2000);
cursor c_MngrName IS
       SELECT Upper(u.lname)||', '||Initcap(u.fname) AS MngrName
        FROM users u, project_managers pm
        WHERE u.ids = pm.user_id
              AND 
              pm.prj_id = varPrjID;
       
Begin 

      For v_MngrName in c_MngrName loop
          RtnVal := RtnVal||'; '||v_MngrName.MngrName;
      end loop;
      RtnVal := substr(RtnVal,3);
      Return RtnVal;
      
End f_getPrjMngr;
--=======================================================================================

FUNCTION f_EligibleForReport2(varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2
-- Function logic:
-- 1. At least 1 PrjMnjr should provide complete answer;
-- 2. At least 1 Participant should provide a complete answer;
-- 3. A total number of  assigned people who completed questionnaire should be at least 25%; 


-- This function determines % of participants fully answered Questionnaire
-- It should be more then 25%.  

IS
RtnVal VARCHAR2(10);

v_NumOfAnswrdPart NUMBER;
v_NumOfAnsrdMngrs NUMBER;

v_TotalNumOfAnswrd NUMBER;
v_NumOfAnswrd_C NUMBER;
v_Percent NUMBER;

Begin

     select Count(*) into v_TotalNumOfAnswrd
      from answers a
      where a.reaserch_id = varPrjID;
      
     select Count(*) into v_NumOfAnswrd_C
      from answers a
      where a.answer_status = 'C'
            and 
            a.reaserch_id = varPrjID;
     
     select ROUND((v_NumOfAnswrd_C * 100)/v_TotalNumOfAnswrd ) into v_Percent
      from dual
      where ROUND( (v_NumOfAnswrd_C * 100)/v_TotalNumOfAnswrd ) >= 25
            and 
            v_TotalNumOfAnswrd <> 0
            and 
            v_NumOfAnswrd_C <> 0
      ;
     
     RtnVal := ' '||TO_CHAR(v_Percent)||'%';
     
     Return RtnVal;


/* Old function script
--1. Determine if Project Managers FULLY answered Questionnaire:
       select Count(*) into v_NumOfPrjMngrs
        from project_managers pm
        where pm.prj_id = varPrjID;
       
       select Count(*) into v_NumOfPrjMngrWithComplAmswrs
        from answers a, project_managers pm
        where a.participant_id = pm.user_id
              and
              pm.prj_id = a.reaserch_id
              and
              pm.prj_id= varPrjID
              and 
              a.answer_status = 'C';
              
       
       if v_NumOfPrjMngrs = v_NumOfPrjMngrWithComplAmswrs 
          and v_NumOfPrjMngrs <> 0
          and v_NumOfPrjMngrWithComplAmswrs <> 0 then
          RtnVal := 'YES';
       else
          RtnVal := 'NO';
       end if;
       
       Return RtnVal;
*/
End f_EligibleForReport2;
--=======================================================================================


FUNCTION f_EligibleForReport(varPrjID IN REASERCH_DATES.IDS%TYPE) return VARCHAR2
-- Function logic:
-- 1. At least 1 PrjMnjr should provide complete answer;
-- 2. At least 1 Participant should provide a complete answer;
-- 3. A total number of  assigned people who completed questionnaire should be at least 25%; 

IS
RtnVal VARCHAR2(10);

v_NumOfAnswrdMngrs NUMBER;
v_NumOfAnswrdParts NUMBER;

v_TotalNumOfAnswrd NUMBER;
v_NumOfAnswrd_C NUMBER;
v_Percent NUMBER;

Begin
-- 1. Determine number of Prj Mnjrs with completed questionnaire:
select COUNT (*) INTO v_NumOfAnswrdMngrs
 from answers a 
 where a.answer_status = 'C'
       AND 
       a.participant_id IN ( select pm.user_id 
                              from project_managers pm
                              where pm.prj_id = varPrjID)
      and 
      a.reaserch_id = varPrjID;

-- 2. Determine number of Participants with completed questionnaire:
select COUNT (*) INTO v_NumOfAnswrdParts
 from answers a 
 where a.answer_status = 'C'
       AND 
       a.participant_id NOT IN ( select pm.user_id 
                                  from project_managers pm
                                  where pm.prj_id = varPrjID)
       and 
       a.reaserch_id = varPrjID;

-- 3. Determine total number of  assigned people who completed questionnaire should be at least 25%;
      select Count(*) into v_TotalNumOfAnswrd
      from answers a
      where a.reaserch_id = varPrjID;
      
     select Count(*) into v_NumOfAnswrd_C
      from answers a
      where a.answer_status = 'C'
            and 
            a.reaserch_id = varPrjID;
     
     select ROUND((v_NumOfAnswrd_C * 100)/v_TotalNumOfAnswrd ) into v_Percent
      from dual
      where ROUND( (v_NumOfAnswrd_C * 100)/v_TotalNumOfAnswrd ) >= 25
            and 
            v_TotalNumOfAnswrd <> 0
            and 
            v_NumOfAnswrd_C <> 0
            -- the following two lines needed for the rule 1 and 2:
            AND 
            v_NumOfAnswrdMngrs > 0
            AND
            v_NumOfAnswrdParts >0
      ;
     
     RtnVal := ' '||TO_CHAR(v_Percent)||'%';
     
     Return RtnVal;



End f_EligibleForReport;
--=======================================================================================

END PACK_FUNC;
/
