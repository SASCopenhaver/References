CREATE OR REPLACE VIEW VIEW_COUNTPRJS AS
SELECT 1 AS RowNums
      ,'ALL' AS OrgID
      ,'=== View/Edit All Projects ===' AS PrjStatus
FROM REASERCH_DATES
WHERE (SELECT Count(*) FROM REASERCH_DATES) > 0;