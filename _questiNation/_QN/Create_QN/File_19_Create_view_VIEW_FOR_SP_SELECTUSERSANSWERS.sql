CREATE OR REPLACE VIEW VIEW_FOR_SP_SELECTUSERSANSWERS AS
SELECT a.PARTICIPANT_ID AS UserID
        ,a.REASERCH_ID AS PrjID
        ,(PACK_FUNC.f_loopCounter(a.REASERCH_ID)
          --select Count(*) 
          --from ANSWERS aa 
          --where aa.REASERCH_ID = a.REASERCH_ID 
          ) AS LoopCounter
  FROM ANSWERS a
  ORDER BY 2;