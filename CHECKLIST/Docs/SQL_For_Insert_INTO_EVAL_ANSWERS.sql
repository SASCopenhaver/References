--truncate table eval_answers
--*******************************
insert into eval_answers

select distinct
 (select ppo.ppo_person_id from usia.project_program_officer ppo where ppo.ppo_project_id = (select p.prj_project_id from usia.project p where p.prj_project_number = c3.project_number) and ppo.ppo_primary = 'Y') as PersonID
,(select p.prj_project_id from usia.project p where p.prj_project_number = c3.project_number) as PrjID
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 1  and c.project_number = c3.project_number) as Q_101
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 2  and c.project_number = c3.project_number) as Q_102
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 3  and c.project_number = c3.project_number) as Q_103
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 4  and c.project_number = c3.project_number) as Q_104
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 5  and c.project_number = c3.project_number) as Q_105
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 6  and c.project_number = c3.project_number) as Q_106
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 7  and c.project_number = c3.project_number) as Q_107
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 8  and c.project_number = c3.project_number) as Q_108
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 9  and c.project_number = c3.project_number) as Q_109
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 10 and c.project_number = c3.project_number) as Q_110
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 11 and c.project_number = c3.project_number) as Q_111
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 12 and c.project_number = c3.project_number) as Q_112
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 13 and c.project_number = c3.project_number) as Q_113
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 14 and c.project_number = c3.project_number) as Q_114
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 15 and c.project_number = c3.project_number) as Q_115
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 16 and c.project_number = c3.project_number) as Q_116
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 17 and c.project_number = c3.project_number) as Q_117
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 18 and c.project_number = c3.project_number) as Q_118
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 19 and c.project_number = c3.project_number) as Q_119
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 20 and c.project_number = c3.project_number) as Q_120
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 21 and c.project_number = c3.project_number) as Q_121
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 22 and c.project_number = c3.project_number) as Q_122
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 23 and c.project_number = c3.project_number) as Q_123
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 24 and c.project_number = c3.project_number) as Q_124
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 25 and c.project_number = c3.project_number) as Q_125
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 26 and c.project_number = c3.project_number) as Q_126
,(select DECODE(c.score, 'N', 6, 'U', 7, 0, -1, c.score) from checklist_3 c where c.eval_item_id = 27 and c.project_number = c3.project_number) as Q_127
,'X'
from checklist_3 c3
where c3.project_number IN --= 'E/VGF-2003-0098'
(
select --ppo.ppo_project_id                         as PrjID
      --,
       p.prj_project_number                       as PrjNum
       from  usia.project_program_officer ppo
            ,usia.project                 p
            ---
            ,usia.project_program_agency  ppa
            ,usia.organization            o
            ,usia.person                  per
            ,usia.person                  per2
            ,usia.person_email            pem
            ---
            ,npa.project                  npa_p
            ---
            ,usia.project_goal            pg
            ,usia.strategic_goal          sg
            ---
            ,eval_comments                ec
            ---
            ,eval_answers                 ea
       where     ppo.ppo_primary = 'Y'
             and ppo.ppo_project_id = p.prj_project_id
             and (
                  p.prj_fiscal_year = PACK_EVAL.f_CurrentFiscalYear(sysdate)
                  or
                  p.prj_fiscal_year = PACK_EVAL.f_CurrentFiscalYear(sysdate) - 1 
                  )
             ---
             and p.prj_current_status in ('ACT', 'CLO', 'COM')
             ---
             and ppa.ppa_project_id = p.prj_project_id(+)
             and ppa.ppa_program_agency = o.org_organization_id
             ---
             and per.per_person_id(+) = ppa.ppa_prog_agency_po 
             ---
             and p.prj_project_id = npa_p.prj_project_id(+)
             ---
             and (
                  pg.pgoal_project_id(+) = p.prj_project_id
                  and
                  (pg.pgoal_primary = 'Y' or pg.pgoal_primary is NULL)-- 'Y' if record exists, NULL if record does not exist
                 )
             and pg.pgoal_strat_goal_id = sg.strategic_goal_id(+)
             ---
             and ec.eval_prjid(+) = p.prj_project_id
             ---
             and ea.eval_prjid(+) = p.prj_project_id
             ---
             and ppo.ppo_person_id = per2.per_person_id
             --
             and per2.per_person_id = pem.pem_person_id
             and pem.pem_preferred = 'Y'
             --
             and ppo.ppo_person_id in
                                     (--=========================================================================================
                                      SELECT /*distinct*/ "USIA"."PERSON"."PER_PERSON_ID"
					                             FROM "USIA"."PERSON", 
                                            "USIA"."USIA_ORGANIZATION",
                                            "USIA"."PERSON_ORGANIZATION", 
                                            "USIA"."PER_ORG_ROLE", 
                                            "USIA"."SECURITY_USER" 
                                       WHERE ( "USIA"."PERSON"."PER_PERSON_ID" = "USIA"."PER_ORG_ROLE"."POR_PERSON_ID" ) 
                                             AND 
                                             ( "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" = "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID" ) 
                                             AND
                                             ( "USIA"."PERSON_ORGANIZATION"."PO_PERSON_ID" = "USIA"."PERSON"."PER_PERSON_ID" ) 
                                             AND
                                             ( "USIA"."SECURITY_USER"."SU_PERSON_ID"(+) = "USIA"."PERSON"."PER_PERSON_ID" ) 
                                             AND
                                             ( "USIA"."PERSON_ORGANIZATION"."PO_STATUS" = 'A' ) 
                                             AND
                                             ( 
                                                ( "USIA"."PER_ORG_ROLE"."POR_ROLE" = 'PO' ) 
                                                AND 
                                                --	( "USIA"."USIA_ORGANIZATION"."UO_OFFICE_SYMBOL" = 'E/V') AND 
                                                ( "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID" IN 
                                                                                              (select t.uo_office_id 
                                                                                                from usia.usia_organization t 
                                                                                                where length(t.uo_office_symbol)>4 
                                                                                                      and 
                                                                                                      t.uo_office_symbol like 'E/V'||'%')
                                                 )
                                                 AND
                                                 ( "USIA"."SECURITY_USER"."SU_STATUS" = 'A' 
                                                   OR 
                                                   "USIA"."SECURITY_USER"."SU_PERSON_ID" IS NULL 
                                                 ) 
                                                 AND
                                                 ( "USIA"."SECURITY_USER"."SU_OFFICE_ID" = "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" 
                                                   OR 
                                                   "USIA"."SECURITY_USER"."SU_OFFICE_ID" IS NULL
                                                 ) 
                                             ) 
                                     )--=========================================================================================     

)