CREATE OR REPLACE VIEW VIEW_COUNTACTIVEPRJS AS
SELECT DISTINCT 1 AS RowNums
      ,'ALL' AS OrgID
      ,'=== View/Edit All Projects ===' AS PrjStatus
FROM REASERCH_DATES
WHERE ANYBODY_ANSWERED = 'A'      
--      AND
--      (SELECT Count(*) FROM REASERCH_DATES) > 0
;

