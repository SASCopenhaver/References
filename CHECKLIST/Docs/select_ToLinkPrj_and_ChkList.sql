select ppo.ppo_project_id, ppo.ppo_person_id--, c.project_number
 from usia.project_program_officer ppo,
      usia.project p--,
      --chklist.checklist c
 
 where ppo.ppo_project_id = p.prj_project_id
       and
       p.prj_fiscal_year in (2003, 2004)
       and
       ppo.ppo_person_id = 1843
       --and 
       --c.project_number = ppo.ppo_project_id