create or replace package body PACK_CheckList is


  -- Function and procedure implementations
------------------------------------------------------------------------------------------------------------

procedure sp_getBranchProfile ( argUserID IN VARCHAR2
                               ,rc_getBranchProfile OUT refc_PackCheckList
                               ,rc_getBranchPOStat  OUT refc_PackCheckList
                              )
is
Begin
     -----------------------------
     OPEN rc_getBranchProfile FOR
     select f_getBranchInfo('NumOfPO',   argUserID)        as NumOfPO
           ,f_getBranchInfo('NumOfPrjInBranch', argUserID) as NumOfPrj
           ,f_getBranchInfo('NumOfEval', argUserID)        as NumOfE           -- Evaluated
           ,f_getBranchInfo('NumOfPartEval', argUserID)    as NumOfPE          -- Partually Evaluated
           ,f_getBranchInfo('NumOfNotEval',  argUserID)    as NumOfNE          -- Not Evaluated
      from dual;
      
      ----------------------------
     
      OPEN rc_getBranchPOStat FOR
       select  su1.su_userid||'@pd.state.gov'       as PO_EMail
              --,su1.su_person_id
              ,f_getName(su1.su_person_id)          as PO_Name
              ,f_getBranchInfo('E',  su1.su_userid) as PO_E -- Evaluated
              ,f_getBranchInfo('PE', su1.su_userid) as PO_PE -- Partially Evaluated
              ,f_getBranchInfo('NE', su1.su_userid) as PO_NE -- Not Evaluated
        from usia.security_user su1
        where su1.su_status = 'A'
              and
              su_office_id = ( select su2.su_office_id
                                from usia.security_user su2
                                where su2.su_userid = argUserID )
       --and 
       --su1.su_userid <> 'tblatt'
       ORDER BY PO_Name;
      
      
      
      
      
      

End sp_getBranchProfile;
-------------------------------------------------------------------------------------------------------------

 procedure sp_getUserProfile ( argUserID IN VARCHAR2
                              ,argUserRole IN VARCHAR2 
                              ,rc_getUserProfile OUT refc_PackCheckList
                              )
is
  vs_UserID VARCHAR2(20);
  vi_PrjID  NUMBER;
  --vi_QID    NUMBER;
  --vi_AVal   NUMBER;
  vs_EvalStatus VARCHAR2(2);
  vi_EvalStatus NUMBER;
  --i BINARY_INTEGER;
  --vs_SQL    VARCHAR2(4000);
  
  
  vq_101 NUMBER; vq_102 NUMBER; vq_103 NUMBER; vq_104 NUMBER; 
  vq_105 NUMBER; vq_106 NUMBER; vq_107 NUMBER; vq_108 NUMBER; 
  vq_109 NUMBER; vq_110 NUMBER; vq_111 NUMBER; vq_112 NUMBER; 
  vq_113 NUMBER; vq_114 NUMBER; vq_115 NUMBER; vq_116 NUMBER; 
  vq_117 NUMBER; vq_118 NUMBER; vq_119 NUMBER; vq_120 NUMBER; 
  vq_121 NUMBER; vq_122 NUMBER; vq_123 NUMBER; vq_124 NUMBER; 
  vq_125 NUMBER; vq_126 NUMBER; vq_127 NUMBER;
  
  CURSOR c_EvalStatus IS
       select eval_userid, eval_prjid, 
              q_101, q_102, q_103, q_104, q_105, q_106, q_107, q_108, q_109, 
              q_110, q_111, q_112, q_113, q_114, q_115, q_116, q_117, q_118, 
              q_119, q_120, q_121, q_122, q_123, q_124, q_125, q_126, q_127
        from eval_answers  
        where eval_userid = argUserID;
  
Begin
     --- 1 -------------------------------------------------------------------------------------
     insert into eval_answers
      ( eval_userid, eval_prjid )
     select argUserID, p.prj_project_id
      from usia.project p
      where (
             p.prj_fiscal_year = f_CurrentFiscalYear(sysdate)
             or
             p.prj_fiscal_year = f_CurrentFiscalYear(sysdate) - 1 
             )
            and
            p.prj_createdby = argUserID
            and
            p.prj_current_status in ('ACT', 'CLO', 'COM')
            and 
            argUserID NOT IN ( select eval_userid from eval_answers  where eval_prjid = p.prj_project_id)
            ;
      commit;
      
     ---- 2 -----------------------------------------------------------------------------------
     vs_EvalStatus := 'X';
     
     OPEN c_EvalStatus;
     LOOP
         FETCH c_EvalStatus INTO vs_UserID, vi_PrjID,
                                 vq_101, vq_102, vq_103, vq_104, vq_105, vq_106, vq_107, vq_108, vq_109, 
                                 vq_110, vq_111, vq_112, vq_113, vq_114, vq_115, vq_116, vq_117, vq_118, 
                                 vq_119, vq_120, vq_121, vq_122, vq_123, vq_124, vq_125, vq_126, vq_127;
          -------------------
          
          vi_EvalStatus := (vq_101 + vq_102 + vq_103 + vq_104 + vq_105 + vq_106 + vq_107 + vq_108 + vq_109 + 
                            vq_110 + vq_111 + vq_112 + vq_113 + vq_114 + vq_115 + vq_116 + vq_117 + vq_118 + 
                            vq_119 + vq_120 + vq_121 + vq_122 + vq_123 + vq_124 + vq_125 + vq_126 + vq_127);
          
          select DECODE( vi_EvalStatus, /*if*/-27, /*then*/'NE') into vs_EvalStatus
           from dual;
          /* 
          -- Test:
          insert into eval_answers_temp
            ( user_id, prj_id, q_id, a_val )
          values
            ( vs_EvalStatus, vi_PrjID, vq_101, vi_EvalStatus );
          -- Test end
          */ 
          -------------------
                     
          if vs_EvalStatus = 'NE' then
             update eval_answers
              set eval_status = 'NE'
              where eval_userid = vs_UserID
                    and
                    eval_prjid = vi_PrjID;
          
          else
             -- 101 --
             select DECODE(vq_101,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
               from dual;
             update eval_answers
                set eval_status = vs_EvalStatus
              where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             
             -- 102 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_102,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 103 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_103,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 104 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_104,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 105 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_105,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 106 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_106,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 107--
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_107,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 108--
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_108,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 109--
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_109,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 110 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_110,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 111--
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_111,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 112--
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_112,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 113--
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_113,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 114 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_114,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 115 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_105,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 116 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_116,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 117 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_117,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 118 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_118,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 119 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_119,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 120 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_120,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 121 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_121,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 122 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_122,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 123 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_123,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 124 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_124,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 125 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_125,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                 --from eval_answers;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 126 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_126,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
             -- 127 --
             if vs_EvalStatus <> 'PE' then
                select DECODE(vq_127,/*if*/-1, /*then*/'PE', /*else*/'E') into vs_EvalStatus
                 from dual;
                update eval_answers
                 set eval_status = vs_EvalStatus
                 where eval_userid = vs_UserID and eval_prjid = vi_PrjID;
             end if;
          
          end if;

          -------------------     
         EXIT when c_EvalStatus%NOTFOUND /*or vs_EvalStatus = 'E' or vs_EvalStatus = 'PE' or vs_EvalStatus = 'NE'*/;
         
     END LOOP;
     CLOSE c_EvalStatus;
     
     commit; 
      
     --- 3 -------------------------------------------------------------------------------------
     OPEN rc_getUserProfile FOR
      select su.su_person_id                                        as PersonID
            ,f_getUserRole(su.su_person_id)                         as UserRole
            ,f_getName (su.su_person_id)                            as UserFullName
            ,TO_NUMBER(f_getOffice('ID_Office', su.su_person_id))   as UserOfficeID
            ,f_getOffice('NAME_Office', su.su_person_id)            as UserOfficeName
            ,TO_NUMBER(f_getOffice('ID_Division', su.su_person_id)) as UserDivisionID
            ,f_getOffice('NAME_Division', su.su_person_id)          as UserDivisionName
            ,f_getUserPrjCounter(argUserID)                         as UserPrjCounter
            ,f_getPrjStatistic('E',  argUserID)                     as UserPrjCounter_E /*Evaluated*/
            ,f_getPrjStatistic('PE', argUserID)                     as UserPrjCounter_PE /*Partially Evaluated*/
            ,f_getPrjStatistic('NE', argUserID)                     as UserPrjCounter_NE /*Not Evaluated*/
      
      from usia.security_user su
      where su.su_userid = argUserID
            and
            su.su_status = 'A'
            ;
            
End sp_getUserProfile;
------------------------------------------------------------------------------------------------------------
procedure sp_getUserProjects ( argUserID   IN VARCHAR2
                              ,rc_getUserProjects OUT refc_PackCheckList   --1--
                              ,rc_StrategicGoals  OUT refc_PackCheckList   --2--
                              ,rc_Questions       OUT refc_PackCheckList   --3--
                              ,rc_PrjPrgrAgents   OUT refc_PackCheckList   --4--
                              ,rc_getAnswers      OUT refc_PackCheckList   --5--
                             )
is                           
Begin
     -- 1 ------------------------------------------------------------------------------------------------------------
       OPEN rc_getUserProjects FOR
       select p.prj_project_id                                                     as PrjID
             ,p.prj_project_number                                                 as PrjNum
             ,p.prj_title                                                          as PrjTitle
             ,p.prj_fiscal_year                                                    as PrjFiscYear
             ------------------------------------------------------------------------------------
             ,NVL(f_Org_Abbr_Title('T', p.prj_project_id), 'No Data Found')        as PrgrAgency   -- NPAOfficeName
             ,TO_NUMBER(NVL(f_Org_Abbr_Title('ID', p.prj_project_id), 0))          as PrgrAgencyID --,NPAOfficeID
             ------------------------------------------------------------------------------------
             ,NVL(ppa.ppa_prog_agency_po, 0)                                       as NPAOfficerID
             ,DECODE( ppa.ppa_prog_agency_po, /*if*/NULL, /*then*/'No Data Found', /*else*/f_PersonName ('NPAOfficer', ppa.ppa_prog_agency_po) ) as NPAOfficerName
             ------------------------------------------------------------------------------------
             ,NVL(f_EVDB_Presence(p.prj_project_id), 'NO')                         as EVDB_Presence
             ,NVL( pg.pgoal_strat_goal_id, 0)                                      as StrGoalID
             ,NVL( sg.strategic_goal_nm, 'No Data Found')                          as StrGoalName
             ,f_PrjStatus(argUserID ,p.prj_project_id)                             as PrjStatus
             ,NVL(f_Comments(argUserID, p.prj_project_id), 'Please provide your comments ...') 
                                                                                   as PrjComments
      from usia.project p, usia.project_goal pg, usia.strategic_goal sg, usia.project_program_agency ppa
      where (
             p.prj_fiscal_year = f_CurrentFiscalYear(sysdate)
             or
             p.prj_fiscal_year = f_CurrentFiscalYear(sysdate) - 1 
             )
            and
            p.prj_createdby = argUserID
            and
            p.prj_current_status in ('ACT', 'CLO', 'COM')
            and 
            pg.pgoal_project_id(+) =  p.prj_project_id
            and
            sg.strategic_goal_id (+) = pg.pgoal_strat_goal_id
            and
            (pg.pgoal_primary = 'Y' or pg.pgoal_project_id is NULL)
            and
            ppa.ppa_project_id = p.prj_project_id
      order by p.prj_project_number 
            ;
      -- 2 ------------------------------------------------------------------------------------------------------------
       OPEN rc_StrategicGoals FOR
       select strategic_goal_id, strategic_goal_nm 
        from usia.strategic_goal
        order by 2
       ;
       
       -- 3 ------------------------------------------------------------------------------------------------------------
       OPEN rc_Questions FOR
        select ids, descr, superid 
         from groups_questions_lk
         order by ids
        ;
        
        -- 4 ------------------------------------------------------------------------------------------------------------
        OPEN rc_PrjPrgrAgents  FOR
        select  po.po_person_id as PersonID
               ,--p.per_sort_name 
               InitCap(NVL(p.per_last_name||', ', '')) 
               ||' '||
               InitCap(NVL(p.per_first_name, ''))
               ||
               DECODE(p.per_middle_name, NULL, '', ' ')
               ||
               InitCap(NVL(p.per_middle_name, ''))     as PersonFullName
               ,po.po_organization_id as PersonOrgID
         from usia.person_organization po, usia.person p
         where (po.po_status = 'A' and po.po_primary = 'Y')
               and
               po.po_person_id = p.per_person_id
               and 
               po.po_organization_id 
               in
               -------------------
               (
                   select ppa.ppa_program_agency/*, ppa.ppa_prog_agency_po, o.org_alpha_title*/
                    from usia.project_program_agency ppa/*, usia.organization o*/
                    where ppa.ppa_project_id 
                          in 
                          (
                            select p.prj_project_id  
                             from usia.project p
                             where (
                                   p.prj_fiscal_year = pack_checklist.f_CurrentFiscalYear(sysdate)
                                   or
                                   p.prj_fiscal_year = pack_checklist.f_CurrentFiscalYear(sysdate) - 1 
                                   )
                                   and
                                   p.prj_createdby = argUserID
                                   and
                                   p.prj_current_status in ('ACT', 'CLO', 'COM')
                            )
                            and 
                            ppa.ppa_prog_agency_po is null
                                   --and o.org_organization_id = ppa.ppa_program_agency
               )
         order by 2;
        
        -- 5 ------------------------------------------------------------------------------------------------------------
        OPEN rc_getAnswers FOR
        select *
         from eval_answers ea
         where ea.eval_userid = argUserID;
         
       
        
End sp_getUserProjects;
---------------------------------------------------------------------------------------------------------------  
  procedure sp_InsUpdUserPrjEval ( argPPA_OfficerID IN NUMBER
                                  ,argStratGoalID   IN NUMBER    
                                  ,argUserID        IN VARCHAR2  
                                  ,argPrjID         IN NUMBER    
                                  ,argAnswers       IN VARCHAR2  
                                  ,argStatus        IN VARCHAR2  
                                  ,argComments      IN VARCHAR2  
                                 )
 is
   v_Counter NUMBER;
   vi_AnswerVal NUMBER;
   vs_Answers VARCHAR2(2000);
   vs_SQL VARCHAR2(2000);
 Begin
      -- 1 -- NPA Officer
      if argPPA_OfficerID <> 0 then
         update usia.project_program_agency
            set ppa_prog_agency_po = argPPA_OfficerID
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
      
      for v_Counter in 101..127 LOOP
      
          select TO_NUMBER(substr( vs_Answers, 1,  Instr(vs_Answers, ',', 1, 1)-1)) into vi_AnswerVal
           from dual;
          
          ----------------------------------
          --dbms_output.put_line(vi_AnswerVal);
          ----------------------------------
          
          vs_SQL := 'update eval_answers '||
                     'set Q_'||v_Counter||' = '||vi_AnswerVal||' '||
                     'where eval_userid = '''||argUserID||''' '||
                     'and eval_prjid = '||argPrjID;
           ----------------------------------
          dbms_output.put_line(vs_SQL);
          ----------------------------------
           
           
          execute immediate vs_SQL;
          
          vs_SQL := '';
          
          select substr( vs_Answers, Instr(vs_Answers, ',', 1, 1)+1 ) into vs_Answers
           from dual;
         
      ----------------------------------
      --dbms_output.put_line(vs_Answers);
      ----------------------------------
      end loop;
      commit;
      
      -- 4 -- Status
      update eval_answers
         set eval_status = argStatus
       where eval_prjid = argPrjID
             and
             eval_userid = argUserID;
      commit;
      
      -- 5 -- Comments
       if argComments = '' then
          delete eval_comments
           where eval_userid = argUserID
                 and
                 eval_prjid = argPrjID;
         commit;
       else
           select Count(*) into v_Counter
            from eval_comments
            where eval_userid = argUserID
                  and
                  eval_prjid = argPrjID;
                  
           if v_Counter = 0 then
              insert into eval_comments
                ( eval_userid, eval_prjid, eval_comments )
              values
                ( argUserID, argPrjID, argComments );
              
              commit;
           else
               update eval_comments
                  set eval_comments = argComments
                where eval_userid = argUserID
                      and
                      eval_prjid = argPrjID;
                      
               commit;
           end if;
           
       end if;
          
      
      
 End sp_InsUpdUserPrjEval;


--====================================================================================================
--====================================================================================================

function f_getBranchInfo( argInfoType IN VARCHAR2, argUserID IN VARCHAR2 ) return NUMBER
is
  vi_RtnVal NUMBER;
Begin
     
     if argInfoType = 'NumOfPO' then
        select Count(*) into vi_RtnVal
         from usia.security_user su1
         where su1.su_status = 'A'
               and
               su_office_id = ( select su2.su_office_id
                                 from usia.security_user su2
                                 where su2.su_userid = argUserID )
               and 
               su1.su_userid <> argUserID
               ;
     ------------------------------------------------------------------------
     elsif argInfoType = 'NumOfPrjInBranch' then
       select Count(*) into vi_RtnVal
        from usia.project p, usia.project_goal pg, usia.strategic_goal sg, usia.project_program_agency ppa
        where (
                 p.prj_fiscal_year = f_CurrentFiscalYear(sysdate)
                 or
                 p.prj_fiscal_year = f_CurrentFiscalYear(sysdate) - 1 
              )
              and
              p.prj_current_status in ('ACT', 'CLO', 'COM')
              and 
              pg.pgoal_project_id(+) =  p.prj_project_id
              and
              sg.strategic_goal_id (+) = pg.pgoal_strat_goal_id
              and
              (pg.pgoal_primary = 'Y' or pg.pgoal_project_id is NULL)
              and
              ppa.ppa_project_id = p.prj_project_id
              and
              p.prj_createdby in (
                               -------------------------------------------------
                                   select su.su_userid
                                    from usia.security_user su
                                    where su.su_status = 'A'
                                          and
                                          su.su_office_id = ( select su2.su_office_id
                                                               from usia.security_user su2
                                                               where su2.su_userid = argUserID
                                                            )
                               --------------------------------------------------
                                )
           
       order by p.prj_project_number;
     
     ------------------------------------------------------------------------
     elsif argInfoType = 'NumOfEval' then
        select Count(*) into vi_RtnVal
         from eval_answers ea
         where ea.eval_status = 'E'
               and
               ea.eval_userid in ( select su.su_userid
                                    from usia.security_user su
                                    where su.su_status = 'A'
                                          and
                                          su.su_office_id = ( select su2.su_office_id
                                                               from usia.security_user su2
                                                               where su2.su_userid = argUserID
                                                            )
                                 )
        ;
     ------------------------------------------------------------------------
     elsif argInfoType = 'NumOfPartEval' then
        select Count(*) into vi_RtnVal
         from eval_answers ea
         where ea.eval_status = 'PE'
               and
               ea.eval_userid in ( select su.su_userid
                                    from usia.security_user su
                                    where su.su_status = 'A'
                                          and
                                          su.su_office_id = ( select su2.su_office_id
                                                               from usia.security_user su2
                                                               where su2.su_userid = argUserID
                                                            )
                                 )
        ;
     ------------------------------------------------------------------------
     elsif argInfoType = 'NumOfNotEval' then
        select Count(*) into vi_RtnVal
         from eval_answers ea
         where ea.eval_status = 'NE'
               and
               ea.eval_userid in ( select su.su_userid
                                    from usia.security_user su
                                    where su.su_status = 'A'
                                          and
                                          su.su_office_id = ( select su2.su_office_id
                                                               from usia.security_user su2
                                                               where su2.su_userid = argUserID
                                                            )
                                 )
        ;
     ---------------------------------------------------------------------------
     else
         select Count(*) into vi_RtnVal
          from eval_answers ea
          where ea.eval_userid = argUserID and ea.eval_status = argInfoType; 
     
     end if;
     
     
     return vi_RtnVal;
     
End f_getBranchInfo;
------------------------------------------------------------------------------------------------------
function f_Comments(argUserID IN VARCHAR2, argPrjID IN NUMBER)    return varchar2
is
  vs_RtnVal VARCHAR2(4000);
Begin
     select ec.eval_comments into vs_RtnVal
      from eval_comments ec
      where ec.eval_userid = argUserID
            and
            ec.eval_prjid = argPrjID;
            
     return vs_RtnVal;

End f_Comments;
------------------------------------------------------------------------------------------------------

function f_PrjStatus  ( argUserID IN VARCHAR2, argPrjID IN NUMBER ) return varchar2
is
  vs_RtnVal VARCHAR2(2);
Begin
     select ea.eval_status into vs_RtnVal
      from eval_answers ea
      where ea.eval_userid = argUserID
            and
            ea.eval_prjid = argPrjID;
            
    return (vs_RtnVal);

End f_PrjStatus;

-----------------------------------------------------------------------------------------------------
function f_getUserRole( argPersonID IN NUMBER) return VARCHAR2
is
  vs_RtnVal VARCHAR2(100);
Begin
     select su_role into vs_RtnVal
     from usia.security_user su
     where su.su_person_id = argPersonID
           and
           su.su_status = 'A'
           ;
     
     /*VERIFY VERIFY  VERIFY VERIFY VERIFY  VERIFY VERIFY VERIFY  VERIFY VERIFY VERIFY  VERIFY
     
     select ppr.ppr_role||' - '||pr.pr_description into vs_RtnVal
      from usia.person_person_role ppr, usia.person_role pr
      where ppr.ppr_role = pr.pr_role_code
            and
            ppr.ppr_person_id = argPersonID;
      */     
     return (vs_RtnVal);

End f_getUserRole;

------------------------------------------------------------------------------------------------------
function f_getPrjStatistic(argEvalStatus IN VARCHAR2, argUserID IN VARCHAR2) return NUMBER
is 
   vi_RtnVal NUMBER;
   
Begin
     select Count(*) into vi_RtnVal
      from eval_answers ea
      where ea.eval_userid = argUserID
            and 
            ea.eval_status = argEvalStatus;
     
     return (vi_RtnVal);

End f_getPrjStatistic;

----------------------------------------------------------------------------------------------------

function f_getUserPrjCounter(argUserID IN VARCHAR2) return NUMBER
is
  vi_RtnVal NUMBER;
Begin
     select Count(*) into vi_RtnVal
      from usia.project p
      where (
             p.prj_fiscal_year = f_CurrentFiscalYear(sysdate)
             or
             p.prj_fiscal_year = f_CurrentFiscalYear(sysdate) - 1 
             )
            and
            p.prj_createdby = argUserID
            and
            p.prj_current_status in ('ACT', 'CLO', 'COM')
            ;
       
    return (vi_RtnVal);
End f_getUserPrjCounter;

------------------------------------------------------------------------------------------------------
function f_getName ( /*argRole IN VARCHAR2,*/ argPersonID IN NUMBER) return VARCHAR2
is
  vs_RtnVal VARCHAR2(200);
Begin
     -- Program Officer --
     --if argRole = 'PO' then
        select InitCap(NVL(p.per_last_name||', ', '')) 
               ||' '||
               InitCap(NVL(p.per_first_name, ''))
               ||
               DECODE(p.per_middle_name, NULL, '', ' ')
               ||
               InitCap(NVL(p.per_middle_name, '')) into vs_RtnVal
        from usia.person p
        where p.per_person_id = argPersonID
        ;
     --end if;
     return (vs_RtnVal);


End f_getName;

--------------------------------------------------------------------------------------------------------
function f_getOffice( argIDorName IN VARCHAR2,  argPersonID IN NUMBER) return VARCHAR2
is
  vs_RtnVal VARCHAR2(100);
Begin
     -- 1 --
     if argIDorName = 'ID_Office' then
        select su.su_office_id into vs_RtnVal
         from usia.security_user su
         where su.su_person_id = argPersonID;
        return (vs_RtnVal);
        
     -- 2 --
     elsif argIDorName = 'NAME_Office' then
        select o.org_abbreviation into vs_RtnVal
         from usia.security_user su, usia.organization o
         where su.su_office_id = o.org_organization_id
               and
               su.su_person_id = argPersonID;
        return (vs_RtnVal);
 
     -- 3 --
     elsif argIDorName = 'ID_Division' then
        select su.su_division_id into vs_RtnVal
         from usia.security_user su
         where su.su_person_id = argPersonID;
        return (vs_RtnVal);
        
     -- 4 --
     elsif argIDorName = 'NAME_Division' then
        select o.org_abbreviation into vs_RtnVal
         from usia.security_user su, usia.organization o
         where su.su_division_id= o.org_organization_id
               and
               su.su_person_id = argPersonID;
        return (vs_RtnVal);
 
     end if;
End f_getOffice;

--------------------------------------------------------------------------------------------------------



-- Old Functions:

  
----------------------------------------------------------------------------------------------------
  function f_EVDB_Presence(argPrjID IN NUMBER) return VARCHAR2
  is
   vs_RtnVal VARCHAR2(200);
  Begin
       
       select DECODE (p.prj_project_id,
                     /*if*/NULL, /*then*/'NO',
                     /*else*/'YES') into vs_RtnVal
        from npa.project p
        where p.prj_project_id = argPrjID;
        
       Return (vs_RtnVal);
       
  End f_EVDB_Presence;                                                                                                 

------------------------------------------------------------------------------------------------------
  function f_PersonName (argUserType IN VARCHAR2
                        ,arg_2 IN VARCHAR2) return VARCHAR2
  is

  vs_RtnVal VARCHAR2(200);
  vi_UserID NUMBER;

  Begin
       ---*******************************************************************************************
       if argUserType = 'PrgrOfficer' then
          -- arg_2 in this case is UserName i.e. 'breed'
          select su_person_id into vi_UserID
           from usia.security_user
           where su_userid = arg_2;
       ---*******************************************************************************************
       
       ---*******************************************************************************************
       elsif argUserType = 'NPAOfficer' then
          -- arg_2 in this case is Project ID
          select arg_2 into vi_UserID from dual;
          /*
         select ppa.ppa_prog_agency_po into vi_UserID
          from usia.project_program_agency ppa
          where ppa.ppa_project_id = TO_NUMBER(arg_2);
          */
          /*
         SELECT  DISTINCT	USIA.PERSON.PER_PERSON_ID,   
                          USIA.PERSON.PER_SORT_NAME,   
                          USIA.PERSON_ORGANIZATION.PO_STATUS
  
          FROM USIA.PER_ORG_ROLE,   
               USIA.PERSON,   
               USIA.PERSON_ORGANIZATION,
			         USIA.SECURITY_USER
               --,usia.person
          
          WHERE ( USIA.PER_ORG_ROLE.POR_PERSON_ID = USIA.PERSON.PER_PERSON_ID ) 
                AND  
                ( USIA.PER_ORG_ROLE.POR_PERSON_ID = USIA.PERSON_ORGANIZATION.PO_PERSON_ID ) 
                AND  
                ( USIA.PER_ORG_ROLE.POR_ORGANIZATION_ID = USIA.PERSON_ORGANIZATION.PO_ORGANIZATION_ID ) 
                AND  
                ( USIA.PER_ORG_ROLE.POR_ROLE = 'PO' ) 
                AND  
                (USIA.PER_ORG_ROLE.POR_ORGANIZATION_ID = :OrganizationID) 
                AND  
                (USIA.PERSON_ORGANIZATION.PO_STATUS = 'A') 
                AND
			          ( USIA.SECURITY_USER.SU_PERSON_ID(+) = USIA.PERSON.PER_PERSON_ID ) 
                AND
			          ( USIA.SECURITY_USER.SU_STATUS = 'A' OR USIA.SECURITY_USER.SU_PERSON_ID IS NULL ) 
                AND
			          ( USIA.SECURITY_USER.SU_OFFICE_ID = USIA.PER_ORG_ROLE.POR_ORGANIZATION_ID 
                  OR USIA.SECURITY_USER.SU_OFFICE_ID IS NULL) 
*/
          
          
       ---*******************************************************************************************
       end if;
       
      if vi_UserID IS NULL then
         vs_RtnVal := 'No Data Found';
      else
          select InitCap(p.per_first_name)
              ||' '||
              InitCap(p.per_last_name) into vs_RtnVal
           from usia.person p
           where p.per_person_id = vi_UserID;
      end if;
      
      return(vs_RtnVal);
      
  End f_PersonName;                                                                                            

------------------------------------------------------------------------------------------------------
function f_Org_Abbr_Title(varAbbrOrTitle IN VARCHAR2
                             ,varPrjID IN NUMBER) return VARCHAR2
is
   vRtnVal VARCHAR2(100);
begin
     --if varAbbrOrTitle = 'A' then -- 'A' - Abbriviation

      --  select NVL(o.org_abbreviation, '') into vRtnVal
      --   from usia.project p, usia.organization o
      --   where p.prj_program_office = o.org_organization_id
       --        and
       --        p.prj_project_id = varPrjID;

     --else --'T' - Title
     
     if varAbbrOrTitle = 'T' then
        select o.org_title  into vRtnVal
         from usia.organization o, usia.project_program_agency ppa
         where ppa.ppa_program_agency = o.org_organization_id
               and
               ppa.ppa_project_id = varPrjID;
               
     elsif varAbbrOrTitle = 'ID' then
        select ppa.ppa_program_agency into vRtnVal
         from  usia.project_program_agency ppa
         where ppa.ppa_project_id = varPrjID;
     
     end if;

     Return vRtnVal;

end f_Org_Abbr_Title;
------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
  function f_CurrentFiscalYear(sysdate IN date) return NUMBER is
    vi_RtnVal NUMBER;
    vd_CurrFiscYear  DATE;
    vi_CurrFiscYear  NUMBER;
    
  begin
    
    select '1-OCT-'||TO_CHAR(sysdate, 'YYYY') into vd_CurrFiscYear
     from dual;
     
    select LEAST(sysdate, vd_CurrFiscYear) into vd_CurrFiscYear
     from dual;
    
    select TO_NUMBER( TO_CHAR(vd_CurrFiscYear, 'YYYY') ) into vi_CurrFiscYear
     from dual;
    
    select TO_NUMBER( TO_CHAR( sysdate, 'YYYY') ) into vi_RtnVal
     from dual;
    
    if vi_RtnVal > vi_CurrFiscYear then
        vi_RtnVal := vi_RtnVal + 1;
     end if;
     
    return(vi_RtnVal);
    
end f_CurrentFiscalYear;
------------------------------------------------------------------------------------------------------

function f_ProgramOffice(argPrgrOfficeID IN NUMBER) return VARCHAR2 is

vs_RtnVal VARCHAR2(200);
         
Begin
     select NVL(o.org_abbreviation, 'No Data Available') into vs_RtnVal
      from usia.organization o
      where o.org_organization_id = argPrgrOfficeID;
     
     return vs_RtnVal;

End f_ProgramOffice;

--====================================================================================================

end PACK_CheckList;

