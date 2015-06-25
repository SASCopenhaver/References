          /* 
          -- Test:
          insert into eval_answers_temp
            ( user_id, prj_id, q_id, a_val )
          values
            ( vs_EvalStatus, vi_PrjID, vq_101, vi_EvalStatus );
          -- Test end
          */ 
          -------------------
          /*           
          if vs_EvalStatus = 'NE' then
             update eval_answers
              set eval_status = 'NE'
              where eval_userid = vs_UserID
                    and
                    eval_prjid = vi_PrjID;
          
          else
          */
          if vs_EvalStatus <> 'NE' then
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