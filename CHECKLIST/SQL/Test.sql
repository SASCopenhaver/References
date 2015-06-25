truncate table eval_answers

 select * from eval_answers t
 ----------------------------------------
 
 truncate table eval_answers_temp
 
 select user_id, prj_id, q_id, a_val from eval_answers_temp