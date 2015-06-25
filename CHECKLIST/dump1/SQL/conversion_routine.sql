CREATE OR REPLACE Procedure                 conversion_routine
as
Begin
 DECLARE
ll_project_number VARCHAR2(15);
ll_project_id   Number(9,0);
ll_question number(9,0);
ll_person_id Number(9,0);
ll_checklist_3_count Number(9,0) ;
ll_value Number(9,0);
ll_loop Number(9,0) ;
var_sql varchar2(1000);
ll_exists_eval_answers Number(9,0) ;
ll_que Number(9,0);
ls_status Varchar2(2);
    CURSOR C1 IS
	select distinct
 	ppo.ppo_person_id  ,
	prj_project_number ,
	prj_project_id
	from usia.project, usia.project_program_officer ppo
	where ppo.ppo_project_id = prj_project_id
	and ppo_primary = 'Y'
	and prj_fiscal_year in (2003,2004) ;
	Begin
	   Open C1;
       		Loop
           	Fetch C1 Into Ll_person_id ,Ll_Project_number , ll_project_id ;
             	Exit When C1%NOTFOUND;
		  	   Select nvl(count(*),0)
			   into   ll_checklist_3_count
			   from   chklist.checklist_3
			   Where  project_number = Ll_Project_number ;
			   If ll_checklist_3_count > 0 Then
			   	 Begin
					ll_loop := 1;
					ls_status := 'E' ;
					For ll_loop in 1..27 loop
						Begin
				     		 var_sql := 'select DECODE(c.score, ''N'', 6, ''U'', 7, 0, -1, c.score) ' ||
							 		 	' from chklist.checklist_3 c where c.eval_item_id = :1 ' ||
		 								' and c.project_number = :2 ';
					 	Execute Immediate var_sql Into ll_question Using ll_loop, Ll_Project_number ;

					 	If ll_question = -1 Then
						   ls_status := 'PE' ;
						End If ;

					 	Select nvl(count(*),0)
						 into   ll_exists_eval_answers
						 from   chklist.eval_answers
						 Where  eval_prjid = ll_project_id;

					 	If ll_exists_eval_answers = 0 Then
						   var_sql := ' Insert Into chklist.eval_answers(  eval_personid, eval_prjid, q_101, eval_status ) '||
							          ' values (:1,:2,:3,:4) ' ;
						   Execute Immediate var_sql Using Ll_person_id , Ll_Project_id , ll_question, ls_status ;
						   commit ;
					    End If;

					ll_que := 100 + ll_loop ;
					 If ll_exists_eval_answers > 0 Then
					 	var_sql := ' Update chklist.eval_answers set q_' || to_char(ll_que) || ' = :1 , eval_status = :2 '||
						' where eval_prjid = :3 ' ;
						Execute Immediate var_sql Using ll_question , ls_status, ll_project_id ;
						commit ;
					 End If;
					End ;
					End Loop;
				End ;
				End If;
				End Loop;
				If C1%IsOpen  Then
		  			Close C1;
		 		End If;
		End ;
End ;
/

