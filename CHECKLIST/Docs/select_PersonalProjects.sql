select  ppo.ppo_project_id     as PrjID
       ,p.prj_project_number   as PrjNum
       ,p.prj_title            as PrjTitle
       ,p.prj_fiscal_year      as PrjFiscalYear
       ,p.prj_program_office
       ---
       ,ppa.ppa_program_agency
       
       
from usia.project_program_officer ppo,
     usia.project p,
     ---
     usia.project_program_agency ppa

where     ppo.ppo_person_id = 1092 -- argPersonID
      and ppo.ppo_primary = 'Y'
      and ppo.ppo_project_id = p.prj_project_id
      and (
            p.prj_fiscal_year = PACK_EVAL.f_CurrentFiscalYear(sysdate)
            or
            p.prj_fiscal_year = PACK_EVAL.f_CurrentFiscalYear(sysdate) - 1 
          )
      ---
      and ppa.ppa_project_id = p.prj_project_id
          