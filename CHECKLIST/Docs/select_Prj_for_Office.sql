select ppo.ppo_person_id                          as DoSPrgramOffiserID
             ,per2.per_sort_name                         as DoSProgramOfficerName
             ,pem.pem_email                              as DosProgramOfficerEMail
             ,ppo.ppo_project_id                         as PrjID
             ,p.prj_project_number                       as PrjNum
             ,REPLACE(p.prj_title,
                      /*if*/'''',
                      /*then*/'')                        as PrjTitle
             ,p.prj_fiscal_year                          as PrjFiscalYear
             --,p.prj_program_office
             ---
             ,NVL(o.org_alpha_title, 'No Data Found')    as PrgrAgency   -- <-- NPA Office Name
             ,NVL(ppa.ppa_program_agency, 0)             as PrgrAgencyID -- <-- NPA Office ID
             ---
             ,NVL(ppa.ppa_prog_agency_po, 0)             as NPAOfficerID -- <-- NPA Officer ID
             ,DECODE(ppa.ppa_prog_agency_po, 
                    /*if*/NULL, 
                    /*then*/'No Data Found', 
                    /*else*/per.per_sort_name)           as NPAOfficerName -- <-- NPA Officer Name
             ---
             ,DECODE(npa_p.prj_project_id,
                    /*if*/NULL,
                    /*then*/'NO',
                    /*else*/'YES')                       as EVDB_Presence
             ---
             ,NVL(pg.pgoal_strat_goal_id, 0)             as StrGoalID
             ,NVL(sg.strategic_goal_nm, 'No Data Found') as StrGoalName
             ---
             ,NVL(ec.eval_comments, 'Please provide your comments ...')
                                                         as PrjComments
             ---
             ,NVL(ea.eval_status, 'NE')                  as EvalStatus
             ---
             ,p.prj_current_status                       as PrjCurrentStatus
       
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
             (
              SELECT --"USIA"."PERSON"."PER_SORT_NAME", 
					/*distinct*/ "USIA"."PERSON"."PER_PERSON_ID"--, 
					--"USIA"."PERSON"."PER_FIRST_NAME", 
					--"USIA"."PERSON"."PER_LAST_NAME", 
					--"USIA"."SECURITY_USER"."SU_STATUS" ,
				--	"USIA"."USIA_ORGANIZATION"."UO_OFFICE_SYMBOL",
				--	"USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID"
	           FROM "USIA"."PERSON", 
                  "USIA"."USIA_ORGANIZATION", 
			            "USIA"."PERSON_ORGANIZATION", 
			            "USIA"."PER_ORG_ROLE", 
			            "USIA"."SECURITY_USER" 

            WHERE ( "USIA"."PERSON"."PER_PERSON_ID" = "USIA"."PER_ORG_ROLE"."POR_PERSON_ID" ) AND 
		              ( "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" = "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID" ) AND 
		              ( "USIA"."PERSON_ORGANIZATION"."PO_PERSON_ID" = "USIA"."PERSON"."PER_PERSON_ID" ) AND
		              ( "USIA"."SECURITY_USER"."SU_PERSON_ID"(+) = "USIA"."PERSON"."PER_PERSON_ID" ) AND
		              ( "USIA"."PERSON_ORGANIZATION"."PO_STATUS" = 'A' ) AND
		              ( 
                    ( "USIA"."PER_ORG_ROLE"."POR_ROLE" = 'PO' ) AND 
	                --	( "USIA"."USIA_ORGANIZATION"."UO_OFFICE_SYMBOL" = 'E/V') AND 
                    ( "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID" IN (1033,1029,  1041,1047,1039,1037,1035,  1027,  478667,707885) ) AND
		                ( "USIA"."SECURITY_USER"."SU_STATUS" = 'A' 
                      OR 
                      "USIA"."SECURITY_USER"."SU_PERSON_ID" IS NULL ) AND
		                ( "USIA"."SECURITY_USER"."SU_OFFICE_ID" = "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" 
                      OR 
                      "USIA"."SECURITY_USER"."SU_OFFICE_ID" IS NULL) 
                  ) 
           );      