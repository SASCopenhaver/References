CREATE OR REPLACE VIEW VIEW_INACTPRJSFOROVERVIEW AS
SELECT rd.ids          AS PrjID
      ,rd.descriptions AS PrjName
      ,PACK_FUNC.f_getOrgID(rd.ids) AS OrgID
      ,DECODE (PACK_FUNC.f_getOrgID(rd.ids),
      /*if*/0, /*then*/'Project is not assigned to any Organization',
      /*else*/   (PACK_FUNC.f_getOrgName(rd.ids)
                  --select o.abbreviation||' - '||o.full_name
                  --from organizations o
                  --where o.ids = PACK_FUNC.f_getOrgID(rd.ids)
                 )
               )       AS OrgName
      ,To_Char(rd.start_date, 'MM/DD/YYYY') AS PrjSDate
      ,To_Char(rd.end_date, 'MM/DD/YYYY')   AS PrjEDate
      ,To_Char(rd.end_date - rd.start_date)        AS PrjDuration
      ,(PACK_FUNC.f_getPrjCreatorName (rd.prj_super_id)
        --select Upper(u.lname)||', '||InitCap(u.fname)
        --from users u 
        --where u.ids = rd.prj_super_id
        )                              AS PrjCreator
      ,NVL(PACK_FUNC.f_getPrjMngr(rd.ids),'No project manager assigned') AS PrjMngr
      ,TO_CHAR(PACK_FUNC.f_getAllParts(rd.ids)) AS PrjNumPart
      ,TO_CHAR(PACK_FUNC.f_getNA(rd.ids))       AS PrjNA  --Not answered
      ,TO_CHAR(PACK_FUNC.f_getNAP(rd.ids))||'%' AS PrjNAP --Not answered percent
      ,TO_CHAR(PACK_FUNC.f_getPA(rd.ids))       AS PrjPA  --Partially Answered
      ,TO_CHAR(PACK_FUNC.f_getPAP(rd.ids))||'%' AS PrjPAP --Partially Answered Percent
      ,TO_CHAR(PACK_FUNC.f_getCA(rd.ids))       AS PrjCA  --Completed Answers
      ,TO_CHAR(PACK_FUNC.f_getCAP(rd.ids))||'%' AS PrjCAP --Completed Answers Percent
FROM reaserch_dates rd
WHERE rd.anybody_answered = 'I';