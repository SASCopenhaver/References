function f_getPrjStatistic(argEvalStatusType IN VARCHAR2, argUserID IN VARCHAR2) return NUMBER
is 
   vi_RtnVal NUMBER;
   CURSOR c_SumInRow IS
    select (q_101 + q_102 + q_103 + q_104 + q_105 + q_106 + q_107 + q_108 + q_109 + q_110 + q_111 + 
                q_112 + q_113 + q_114 + q_115 + q_116 + q_117 + q_118 + q_119 + q_120 + q_121 + q_122 + 
                q_123 + q_124 + q_125 + q_126 + q_127) AS SumInRow
      from eval_answers ea
      where ea.eval_userid = argUserID;
Begin
     /*
     select SUM(q_101 + q_102 + q_103 + q_104 + q_105 + q_106 + q_107 + q_108 + q_109 + q_110 + q_111 + 
                q_112 + q_113 + q_114 + q_115 + q_116 + q_117 + q_118 + q_119 + q_120 + q_121 + q_122 + 
                q_123 + q_124 + q_125 + q_126 + q_127)
      from eval_answers
     */
      
     if argEvalStatusType = 'E' then 
        select 1 into vi_RtnVal from dual;
     elsif argEvalStatusType = 'PE' then 
        select 2 into vi_RtnVal from dual;
     
     else -- argEvalStatusType = 'NE' 
        vi_RtnVal := 0;
        FOR v_SumInRow IN c_SumInRow LOOP
            if v_SumInRow.SumInRow = -27 then
             vi_RtnVal := vi_RtnVal + 1;
            end if;
        END LOOP;
        
        --select 3 into vi_RtnVal from dual;
     end if;
         
     return (vi_RtnVal);

End f_getPrjStatistic;