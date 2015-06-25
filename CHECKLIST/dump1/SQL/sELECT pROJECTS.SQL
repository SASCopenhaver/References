select p.prj_project_id                                                     as PrjID
             ,p.prj_project_number                                                 as PrjNum
             ,p.prj_title                                                          as PrjTitle
             ,p.prj_fiscal_year                                                    as PrjFiscYear
             /*,f_ProgramOffice(p.prj_program_office)                                as PrgrOffice*/
             /*,f_PersonName ('PrgrOfficer', argUserID)                            as PrgrOfficer*/
             ,NVL(pack_checklist.f_Org_Abbr_Title('T', p.prj_project_id), 'No Data Found')        as PrgrAgency
             ,pack_checklist.f_PersonName ('NPAOfficer', p.prj_project_id)  as NPAOfficer
             ,NVL(pack_checklist.f_EVDB_Presence(p.prj_project_id), 'NO')                         as EVDB_Presence
             ,NVL(TO_NUMBER( pack_checklist.f_StrategicGoal('ID', p.prj_project_id)), 0)          as StrGoalID
             ,NVL(pack_checklist.f_StrategicGoal('Name', p.prj_project_id), 'No Data Found')      as StrGoalName
             ,pack_checklist.f_PrjStatus('breed' ,p.prj_project_id)                             as PrjStatus
      from usia.project p
      where (
             p.prj_fiscal_year = pack_checklist.f_CurrentFiscalYear(sysdate)
             or
             p.prj_fiscal_year = pack_checklist.f_CurrentFiscalYear(sysdate) - 1 
             )
            and
            p.prj_createdby = 'breed'
            and
            p.prj_current_status in ('ACT', 'CLO', 'COM')