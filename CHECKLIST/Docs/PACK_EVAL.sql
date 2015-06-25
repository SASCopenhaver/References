create or replace package PACK_EVAL is

  -- Author  : SERGEY SURIKOV
  -- Created : 10/27/2003 11:01:16 AM
  -- Purpose : Belongs to the application CheckList.
  
  -- Public type declarations
  type refc_PackCheckList is REF CURSOR;
  
 
  -- Public PROCEDURE declarations =====================================================
  procedure sp_getUserProfile( argUserID IN VARCHAR2
                              ,rc_getUserProfile OUT refc_PackCheckList
                              );

  procedure sp_getGenericInfo (rc_StrategicGoals OUT refc_PackCheckList
                              ,rc_Questions      OUT refc_PackCheckList
                              ,rc_NPA_PrgrOfficers OUT refc_PackCheckList
                              ,rc_FiscalYears OUT refc_PackCheckList
                              );
  
  procedure sp_getPersonalProjects ( argPersonID IN NUMBER
                                    ,rc_getPersonalProjects OUT refc_PackCheckList
                                    ,rc_getAnswers          OUT refc_PackCheckList
                                   );
  
  procedure sp_InsUpdUserPrjEval (argNPA_OfficerID IN NUMBER
                                 ,argStratGoalID   IN NUMBER 
                                 ,argPersonID      IN NUMBER
                                 ,argPrjID         IN NUMBER
                                 ,argAnswers       IN VARCHAR2
                                 ,argEvalStatus IN VARCHAR2
                                 ,argComments      IN VARCHAR2
                                 );
  
  procedure sp_getBranchProfile (argPersonID IN NUMBER
                                ,rc_getBranchProfile OUT refc_PackCheckList
                                ,rc_FiscalYears OUT refc_PackCheckList
                                ,rc_DistinctListOfPOsInDoS OUT refc_PackCheckList
                                );
 
  procedure sp_getListOfBranches (argDivisionID IN NUMBER
                                  ,rc_getListOfBranches OUT refc_PackCheckList
                                  ,rc_getPrjsInDivision OUT refc_PackCheckList
                                  ,rc_FiscalYears OUT refc_PackCheckList
                                  );
                                  
  procedure sp_getListOfDivisions (argOfficeID IN NUMBER
                                  ,rc_getListOfDivisions OUT refc_PackCheckList
                                  ,rc_getPrjsInOffice OUT refc_PackCheckList
                                  ,rc_FiscalYears OUT refc_PackCheckList
                                  );
 
 
  -- Public FUNCTION declarations ======================================================
  function f_CurrentFiscalYear(sysdate IN date) return NUMBER;


  --====================================================================================
  pragma RESTRICT_REFERENCES(f_CurrentFiscalYear,WNDS,WNPS,RNPS);
  
end PACK_EVAL;
/
create or replace package body PACK_EVAL is
  
  
  -- Procedure implementations ========================================================
 -------------------------------------------------------------------------------------
 ---
 -------------------------------------------------------------------------------------
  procedure sp_getUserProfile( argUserID IN VARCHAR2
                              ,rc_getUserProfile OUT refc_PackCheckList
                              )
/*
  Per agreement with Shelly Ritornato and Niki Deanda (on the meeting 10-24-2003), 
  table USIA.SECURITY_USER in the column SU_ROLE will have the following values: 
  SA - office level, 
  DC - division level, 
  BC - branch level,
  PO - program officer level.
  Exceptions: user with SECURITY_USER.su_userid = 'econnoll' should be 'SA'
*/
  
                              
  is
  Begin
       OPEN rc_getUserProfile FOR 
       select --- User Name Info:
             su_userid          as UserID
            ,su_person_id       as PersonID
            ,p.per_sort_name    as PerSortName
            --- User Place of Work Info:
            ,su_office_id       as OfficeID
            ,o.org_abbreviation as OrgAbbr
            --- Access to Reports Info:
            ,su.su_role         as SecurityUserRole
            --,DECODE ( argUserID, /*if*/'econnoll', /*then*/'SA', /*else*/su.su_role)           as SecurityUserRole
      from usia.security_user su,
           usia.organization o,
           usia.person p--,

      where su.su_userid = argUserID
            ---
            and su.su_office_id = o.org_organization_id
            ---
            and p.per_person_id = su.su_person_id
      ;
  
  End sp_getUserProfile;
 --------------------------------------------------------------------------------------
 ---
 -------------------------------------------------------------------------------------
 procedure sp_getGenericInfo (rc_StrategicGoals OUT refc_PackCheckList
                             ,rc_Questions      OUT refc_PackCheckList
                             ,rc_NPA_PrgrOfficers OUT refc_PackCheckList
                             ,rc_FiscalYears OUT refc_PackCheckList
                             )
 is 
 
 Begin
      ---
      OPEN rc_StrategicGoals FOR
       select strategic_goal_id, strategic_goal_nm 
        from usia.strategic_goal
        order by 2
       ;
       
       ---
       OPEN rc_Questions FOR
        select ids, descr, superid 
         from phonebook.eval_questions
         order by ids
        ;
        
        ---
        /*Verivied by Jayant on Nov 3, 2003*/
        OPEN rc_NPA_PrgrOfficers FOR
        SELECT  DISTINCT	
        "USIA"."PERSON"."PER_PERSON_ID" as PersonID,   
        "USIA"."PERSON"."PER_SORT_NAME" as PersonFullName,   
        --"USIA"."PERSON_ORGANIZATION"."PO_STATUS" ,
			  "USIA"."PERSON_ORGANIZATION"."PO_ORGANIZATION_ID" as PersonOrgID
  
    FROM "USIA"."PER_ORG_ROLE",   
         "USIA"."PERSON",   
         "USIA"."PERSON_ORGANIZATION",
			   "USIA"."SECURITY_USER"
    WHERE ( "USIA"."PER_ORG_ROLE"."POR_PERSON_ID" = "USIA"."PERSON"."PER_PERSON_ID" ) AND  
          ( "USIA"."PER_ORG_ROLE"."POR_PERSON_ID" = "USIA"."PERSON_ORGANIZATION"."PO_PERSON_ID" ) AND  
          ( "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" = "USIA"."PERSON_ORGANIZATION"."PO_ORGANIZATION_ID" ) AND  
          ( "USIA"."PER_ORG_ROLE"."POR_ROLE" = 'PO' ) AND  
       --//  ("USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" = :OrganizationID) AND  
          ("USIA"."PERSON_ORGANIZATION"."PO_STATUS" = 'A') AND
			    ( "USIA"."SECURITY_USER"."SU_PERSON_ID"(+) = "USIA"."PERSON"."PER_PERSON_ID" ) AND
			    ( "USIA"."SECURITY_USER"."SU_STATUS" = 'A' OR "USIA"."SECURITY_USER"."SU_PERSON_ID" IS NULL ) AND
			    ( "USIA"."SECURITY_USER"."SU_OFFICE_ID" =
 			     "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" OR "USIA"."SECURITY_USER"."SU_OFFICE_ID" IS NULL) ;
       /* 
        select  por_person_id       as PersonID
               ,per_sort_name       as PersonFullName
               ,org_organization_id as PersonOrgID
         from usia.organization, 
              usia.org_org_role, 
              usia.per_org_role, 
              usia.person, 
              usia.person_organization po
         where     org_organization_id = oor_organization_id
               and oor_role = 'PA'
               and por_organization_id = org_organization_id
               and por_role = 'PO' 
               and per_person_id = por_person_id 
               and po.po_status = 'A'
               --and po.po_primary = 'Y'
               and po_person_id = por_person_id
               and po_organization_id = org_organization_id;

        
        
        OLD Statement - replaced by the one above.
        select  po.po_person_id        as PersonID
               ,per.per_sort_name      as PersonFullName
               -- use per_org_role table instead organization and usia.person_organization
               ,o1.org_organization_id as PersonOrgID
         from usia.person_organization po
             ,usia.organization o1
             ,usia.person per
 
         where     per.per_person_id = po.po_person_id
               and per.per_sort_name is not null
               --and po.po_status = 'A'
               --and po.po_primary = 'Y'
               and o1.org_organization_id = po.po_organization_id
               and po.po_organization_id in (
                                             select distinct 
                                                    ppa.ppa_program_agency--, o.org_title
                                              from usia.project_program_agency ppa,
                                                   usia.organization o
                                              where     o.org_organization_id = ppa.ppa_program_agency
                                                    and o.org_title NOT LIKE ('ECA%')
                                            );
        */
        
        ---
        OPEN rc_FiscalYears FOR
        select ( PACK_EVAL.f_CurrentFiscalYear(sysdate) - 1 ) as PrevFiscalYear
              ,( PACK_EVAL.f_CurrentFiscalYear(sysdate) ) as CurrFiscalYear
         from dual;
        
 End sp_getGenericInfo;
 --------------------------------------------------------------------------------------
 ---
 -------------------------------------------------------------------------------------
 procedure sp_getPersonalProjects (argPersonID IN NUMBER
                                  ,rc_getPersonalProjects OUT refc_PackCheckList
                                  ,rc_getAnswers          OUT refc_PackCheckList
                                  )
 is
 
 
 Begin
      
      OPEN rc_getPersonalProjects FOR
      select  ppo.ppo_project_id                         as PrjID
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
            ,usia.project p
            ---
            ,usia.project_program_agency ppa
            ,usia.organization o
            ,usia.person per
            ---
            ,npa.project npa_p
            ---
            ,usia.project_goal pg
            ,usia.strategic_goal sg
            ---
            ,eval_comments ec
            ---
            ,eval_answers ea

       where     ppo.ppo_person_id = argPersonID
             and ppo.ppo_primary = 'Y'
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
             ;
 
      ---
      OPEN rc_getAnswers FOR
      select *
         from phonebook.eval_answers ea
         where ea.eval_personid = argPersonID;
        
     
     
     
 End sp_getPersonalProjects;
 -------------------------------------------------------------------------------------
 ---
 -------------------------------------------------------------------------------------
 procedure sp_InsUpdUserPrjEval ( argNPA_OfficerID IN NUMBER
                                 ,argStratGoalID   IN NUMBER 
                                 ,argPersonID      IN NUMBER
                                 ,argPrjID         IN NUMBER
                                 ,argAnswers       IN VARCHAR2
                                 ,argEvalStatus IN VARCHAR2
                                 ,argComments      IN VARCHAR2
                                 )
 is
   v_PrjCount NUMBER;
   v_Counter NUMBER;
   vi_AnswerVal NUMBER;
   vs_Answers VARCHAR2(2000);
   vs_SQL VARCHAR2(2000);
 Begin
      -- 1 -- NPA Officer
      if argNPA_OfficerID <> 0 then
         update usia.project_program_agency
            set ppa_prog_agency_po = argNPA_OfficerID
          where ppa_project_id = argPrjID;
         commit;
      end if;
      
      -- 2 -- Strategic Goal
      if argStratGoalID <> 0 then
         insert into usia.project_goal
                (pgoal_project_id, pgoal_strat_goal_id, pgoal_primary)
          values
                (argPrjID, argStratGoalID, 'Y');
          commit;
      end if;
 
      -- 3 -- Answers
      vs_Answers := argAnswers||',';
      -- 3.1 Determine if record exists
      select Count(*) into v_PrjCount
       from eval_answers ea
       where     ea.eval_prjid = argPrjID
             and ea.eval_personid = argPersonID;
      -- 3.2 If record does not exist (v_PrjCount = 0), 
      -- create it. Default values for answers and evaluation status are specified in table properties
      if v_PrjCount = 0 then
         insert into eval_answers
          (eval_personid, eval_prjid)
         values
          (argPersonID, argPrjID);
         commit;
      end if;
      
      -- 3.3 Updating existing record with values in vs_Answers
      for v_Counter in 101..127 LOOP
          select TO_NUMBER(substr( vs_Answers, 1,  Instr(vs_Answers, ',', 1, 1)-1)) into vi_AnswerVal
           from dual;
          ----------------------------------
          dbms_output.put_line(vi_AnswerVal);
          ----------------------------------
          vs_SQL := 'update eval_answers'||
                     ' set Q_'||v_Counter||' = '||vi_AnswerVal||
                     ' where eval_personid = '||argPersonID||
                     ' and eval_prjid = '||argPrjID;
                     
          ----------------------------------
          dbms_output.put_line(vs_SQL);
          ----------------------------------
          execute immediate vs_SQL;
          vs_SQL := '';
          
          select substr( vs_Answers, Instr(vs_Answers, ',', 1, 1)+1 ) into vs_Answers from dual;
          ----------------------------------
          --dbms_output.put_line(vs_Answers);
          ----------------------------------
      end loop;
      
      -- 3.4 Updating Evaluation Status
       update eval_answers
         set eval_status = argEvalStatus
       where     eval_prjid = argPrjID
             and eval_personid = argPersonID;
      commit;
 
      -- 4 -- Comments
       if argComments = '' then
          delete phonebook.eval_comments
           where eval_prjid = argPrjID;
         commit;
       else
           select Count(*) into v_Counter
            from phonebook.eval_comments
            where eval_prjid = argPrjID;
                  
           if v_Counter = 0 then
              insert into phonebook.eval_comments
                ( eval_prjid, eval_comments )
               values
                ( argPrjID, argComments );
              commit;
           
           else
               update phonebook.eval_comments
                  set eval_comments = argComments
                where eval_prjid = argPrjID;
               commit;
           
           end if;
           
       end if;
       ---   
 End sp_InsUpdUserPrjEval;
 -------------------------------------------------------------------------------------
 ---
 -------------------------------------------------------------------------------------
   procedure sp_getBranchProfile (argPersonID IN NUMBER
                                ,rc_getBranchProfile OUT refc_PackCheckList
                                ,rc_FiscalYears OUT refc_PackCheckList
                                ,rc_DistinctListOfPOsInDoS OUT refc_PackCheckList
                                )
   is
   vBranchID NUMBER;
   Begin
        -- 1. Determine BranchID where Branch Chief ('BC') works:
        select su.su_office_id into vBranchID
         from usia.security_user su
         where su.su_person_id = argPersonID;
        
        -- 2. Getting a list of all DoS POs with projects 
        OPEN rc_getBranchProfile FOR 
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
                    ( "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID" = vBranchID ) AND
		                ( "USIA"."SECURITY_USER"."SU_STATUS" = 'A' 
                      OR 
                      "USIA"."SECURITY_USER"."SU_PERSON_ID" IS NULL ) AND
		                ( "USIA"."SECURITY_USER"."SU_OFFICE_ID" = "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" 
                      OR 
                      "USIA"."SECURITY_USER"."SU_OFFICE_ID" IS NULL) 
                  ) 
           );        
           
           ---
           OPEN rc_FiscalYears FOR
            select ( PACK_EVAL.f_CurrentFiscalYear(sysdate) - 1 ) as PrevFiscalYear
                  ,( PACK_EVAL.f_CurrentFiscalYear(sysdate) ) as CurrFiscalYear
            from dual;
           
           ---
           OPEN rc_DistinctListOfPOsInDoS FOR
                select distinct ppo.ppo_person_id                  as DoSPrgramOffiserID
                       ,per2.per_sort_name                         as DoSProgramOfficerName
                       ,pem.pem_email                              as DosProgramOfficerEMail
             
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
                         ---
                         and per2.per_person_id = pem.pem_person_id
                         and UPPER(SUBSTR(pem.pem_email, -3,3)) = 'GOV'
                         ---
                         and ppo.ppo_person_id in
                                               (
                                               SELECT --"USIA"."PERSON"."PER_SORT_NAME", 
					                                     /*distinct*/ "USIA"."PERSON"."PER_PERSON_ID"--, 
					                                     --"USIA"."PERSON"."PER_FIRST_NAME", 
					                                     --"USIA"."PERSON"."PER_LAST_NAME", 
					                                     --"USIA"."SECURITY_USER"."SU_STATUS" ,
				                                       --"USIA"."USIA_ORGANIZATION"."UO_OFFICE_SYMBOL",
				                                       --"USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID"
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
                                                        ( "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID" = vBranchID ) 
                                                        AND
		                                                    ( "USIA"."SECURITY_USER"."SU_STATUS" = 'A' 
                                                          OR 
                                                          "USIA"."SECURITY_USER"."SU_PERSON_ID" IS NULL ) 
                                                        AND
		                                                    ( "USIA"."SECURITY_USER"."SU_OFFICE_ID" = "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" 
                                                          OR 
                                                          "USIA"."SECURITY_USER"."SU_OFFICE_ID" IS NULL) 
                                                       ) 
                                                     );        
            
            
            
      
   End sp_getBranchProfile;
-------------------------------------------------------------------------------------
---
------------------------------------------------------------------------------------- 
   procedure sp_getListOfBranches (argDivisionID IN NUMBER
                                  ,rc_getListOfBranches OUT refc_PackCheckList
                                  ,rc_getPrjsInDivision OUT refc_PackCheckList
                                  ,rc_FiscalYears OUT refc_PackCheckList
                                  )
 is
 v_OfficeSymbol VARCHAR2(10);
 Begin
      -- 1. Get Office symbol ("E/VF", "E/VG", "E/VP", "E/VC")
      select uo.uo_office_symbol into v_OfficeSymbol
       from usia.usia_organization uo
       where uo.uo_office_id = argDivisionID;
      -- 2. 
      OPEN rc_getListOfBranches FOR
      select uo_office_id, 
             uo_office_symbol, 
             uo_org_abbreviation 
       from usia.usia_organization uo
       where length(uo.uo_office_symbol)>4
             and
             uo.uo_office_symbol like v_OfficeSymbol||'%';
      
       -- 3.
       OPEN rc_getPrjsInDivision FOR
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
              SELECT 
					/*distinct*/ "USIA"."PERSON"."PER_PERSON_ID"
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
                    ( "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID" IN (select t.uo_office_id from usia.usia_organization t where length(t.uo_office_symbol)>4 and t.uo_office_symbol like v_OfficeSymbol||'%') )
                     AND
		                ( "USIA"."SECURITY_USER"."SU_STATUS" = 'A' 
                      OR 
                      "USIA"."SECURITY_USER"."SU_PERSON_ID" IS NULL ) AND
		                ( "USIA"."SECURITY_USER"."SU_OFFICE_ID" = "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" 
                      OR 
                      "USIA"."SECURITY_USER"."SU_OFFICE_ID" IS NULL) 
                  ) 
           );      
       
       -- 4.
       OPEN rc_FiscalYears FOR
       select ( PACK_EVAL.f_CurrentFiscalYear(sysdate) - 1 ) as PrevFiscalYear
             ,( PACK_EVAL.f_CurrentFiscalYear(sysdate) ) as CurrFiscalYear
        from dual;
      
 
 End sp_getListOfBranches;
 -------------------------------------------------------------------------------------
---
------------------------------------------------------------------------------------- 
  procedure sp_getListOfDivisions (argOfficeID IN NUMBER
                                  ,rc_getListOfDivisions OUT refc_PackCheckList
                                  ,rc_getPrjsInOffice OUT refc_PackCheckList
                                  ,rc_FiscalYears OUT refc_PackCheckList
                                  )
  is
 v_OfficeSymbol VARCHAR2(10);
 Begin
      -- 1. Get Office symbol ("E/VF", "E/VG", "E/VP", "E/VC")
      select uo.uo_office_symbol into v_OfficeSymbol
       from usia.usia_organization uo
       where uo.uo_office_id = argOfficeID;
      -- 2. 
      OPEN rc_getListOfDivisions FOR
      select uo_office_id, 
             uo_office_symbol, 
             uo_org_abbreviation 
       from usia.usia_organization uo
       where length(uo.uo_office_symbol)= 4
             and
             uo.uo_office_symbol like v_OfficeSymbol||'%';
      
       -- 3.
       OPEN rc_getPrjsInOffice FOR
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
              SELECT 
					/*distinct*/ "USIA"."PERSON"."PER_PERSON_ID"
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
                    ( "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID" IN (select t.uo_office_id from usia.usia_organization t where length(t.uo_office_symbol)>4 and t.uo_office_symbol like v_OfficeSymbol||'%') )
                     AND
		                ( "USIA"."SECURITY_USER"."SU_STATUS" = 'A' 
                      OR 
                      "USIA"."SECURITY_USER"."SU_PERSON_ID" IS NULL ) AND
		                ( "USIA"."SECURITY_USER"."SU_OFFICE_ID" = "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" 
                      OR 
                      "USIA"."SECURITY_USER"."SU_OFFICE_ID" IS NULL) 
                  ) 
           );      
       
       -- 4.
       OPEN rc_FiscalYears FOR
       select ( PACK_EVAL.f_CurrentFiscalYear(sysdate) - 1 ) as PrevFiscalYear
             ,( PACK_EVAL.f_CurrentFiscalYear(sysdate) ) as CurrFiscalYear
        from dual;
   
 
  End sp_getListOfDivisions;
 
  --===================================================================================
  -- Function implementations =========================================================
  function f_CurrentFiscalYear(sysdate IN date) return NUMBER is
    vi_RtnVal NUMBER;
    vd_CurrFiscYear  DATE;
    vi_CurrFiscYear  NUMBER;
    
  Begin
    
    select TO_DATE('1-OCT-'||TO_CHAR(sysdate, 'YYYY')) into vd_CurrFiscYear
     from dual;
    ---
    if  sysdate > vd_CurrFiscYear then
        vi_RtnVal := TO_NUMBER(TO_CHAR(sysdate, 'YYYY'))+1;
    else
        vi_RtnVal := TO_NUMBER(TO_CHAR(sysdate, 'YYYY'));
    end if;
    ---
    return(vi_RtnVal);
    
 End f_CurrentFiscalYear;
 -------------------------------------------------------------------------------------
 ---
 -------------------------------------------------------------------------------------
 --=====================================================================================
end PACK_EVAL;
/
