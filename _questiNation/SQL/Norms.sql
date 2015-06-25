  -- Organizational/Personal Pride
  --FUNCTION f_OPP(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Performance/Excelence
  --FUNCTION f_PE(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Teamwork/Communication
  --FUNCTION f_TC(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Leadership/Supervision
  --FUNCTION f_LS(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Profitability/Cost Effectiveness
  --FUNCTION f_PCE(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Colleague/Associate Relations
  --FUNCTION f_CAR(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Customer/Client Relations
  --FUNCTION f_CCR(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Innovativeness/Creativity
  --FUNCTION f_IC(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Training/Development
  --FUNCTION f_TD(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Candor/Openness
  --FUNCTION f_CO(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------



  --pragma RESTRICT_REFERENCES(f_OPP,WNDS,WNPS,RNPS);
  --pragma RESTRICT_REFERENCES(f_PE,WNDS,WNPS,RNPS);
  --pragma RESTRICT_REFERENCES(f_TC,WNDS,WNPS,RNPS);
  --pragma RESTRICT_REFERENCES(f_LS,WNDS,WNPS,RNPS);
  --pragma RESTRICT_REFERENCES(f_PCE,WNDS,WNPS,RNPS);
  --pragma RESTRICT_REFERENCES(f_CAR,WNDS,WNPS,RNPS);
  --pragma RESTRICT_REFERENCES(f_CCR,WNDS,WNPS,RNPS);
  --pragma RESTRICT_REFERENCES(f_IC,WNDS,WNPS,RNPS);
  --pragma RESTRICT_REFERENCES(f_TD,WNDS,WNPS,RNPS);
  --pragma RESTRICT_REFERENCES(f_CO,WNDS,WNPS,RNPS);
  
  
  
  -----------------------------------------------------------------------------
/*
  -- Organizational/Personal Pride
FUNCTION f_OPP(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER
IS
RtnVal NUMBER;
Begin  
  -- Project Managers:
  if varMngrOrPart = 'M' then 
     select ( ( (SUM(Q4)+SUM(Q14)+SUM(Q24)+SUM(Q34)+SUM(Q42)) / 10 ) * 100 ) into RtnVal
      from answers a
      where a.answer_status = 'C'
            and
            a.participant_id IN ( select pm.user_id 
                                   from project_managers pm 
                                   where pm.prj_id = varPrjID )
            and a.reaserch_id = varPrjID
            ;
  -- Project Participants:
  else --varMngrOrPart = 'P'
     select ( ( ( SUM(Q4)+SUM(Q14)+SUM(Q24)+SUM(Q34)+SUM(Q42) ) / 10 ) * 100 ) into RtnVal
      from answers a
      where a.answer_status = 'C'
            and
            a.participant_id NOT IN ( select pm.user_id 
                                       from project_managers pm 
                                       where pm.prj_id = varPrjID )
            and a.reaserch_id = varPrjID
            ;
  end if;
  
  
  Return RtnVal;
  
End f_OPP;
-----------------------------------------------------------------------------
  -- Performance/Excelence
FUNCTION f_PE(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER
IS
RtnVal NUMBER;
Begin  
  -- Project Managers:
  if varMngrOrPart = 'M' then 
     select ( ( (SUM(Q2)+SUM(Q12)+SUM(Q22)+SUM(Q32)+SUM(Q40)) / 10 ) * 100 ) into RtnVal
      from answers a
      where a.answer_status = 'C'
            and
            a.participant_id IN ( select pm.user_id 
                                   from project_managers pm 
                                   where pm.prj_id = varPrjID )
            and a.reaserch_id = varPrjID
            ;
  -- Project Participants:
  else --varMngrOrPart = 'P'
     select ( ( ( SUM(Q2)+SUM(Q12)+SUM(Q22)+SUM(Q32)+SUM(Q40) ) / 10 ) * 100 ) into RtnVal
      from answers a
      where a.answer_status = 'C'
            and
            a.participant_id NOT IN ( select pm.user_id 
                                       from project_managers pm 
                                       where pm.prj_id = varPrjID )
            and a.reaserch_id = varPrjID
            ;
  end if;
  
  
  Return RtnVal;
  
End f_PE;
*/
-----------------------------------------------------------------------------
  -- Teamwork/Communication
  --FUNCTION f_TC(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Leadership/Supervision
  --FUNCTION f_LS(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Profitability/Cost Effectiveness
  --FUNCTION f_PCE(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Colleague/Associate Relations
  --FUNCTION f_CAR(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Customer/Client Relations
  --FUNCTION f_CCR(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Innovativeness/Creativity
  --FUNCTION f_IC(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Training/Development
  --FUNCTION f_TD(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------
  -- Candor/Openness
  --FUNCTION f_CO(varPrjID IN REASERCH_DATES.IDS%TYPE, varMngrOrPart IN CHAR) return NUMBER;
-----------------------------------------------------------------------------



