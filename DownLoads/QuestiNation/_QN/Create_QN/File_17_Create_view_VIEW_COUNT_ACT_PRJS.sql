CREATE OR REPLACE VIEW VIEW_COUNT_ACT_PRJS AS
SELECT 1 AS RowNums
      ,'ALL' AS OrgID
      ,'=== View/Edit All Projects ===' AS PrjStatus
FROM REASERCH_DATES
WHERE anybody_answered = 'A'
      AND
      (SELECT Count(*) FROM REASERCH_DATES) > 0

