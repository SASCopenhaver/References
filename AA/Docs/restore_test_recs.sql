--==========================RESTORE RECORDS============================== 
update almn set show_almn_ind = 'Y' where almn_id in  (95,366473)  ;
  
truncate table error_msg;
   
truncate table test;
  
truncate table job_merged;

truncate table place_visit_merged;

truncate table pgm_merged;

truncate table almn_merged;
  
truncate table job1;

truncate table place_visit1;
  
truncate table pgm1;
   
truncate table almn1;

insert into almn1
 (select a.* from almn a
  where almn_id in (95,366473)) ;
  
insert into job1
  (job_almn_id, job_num, job_pgm_id, job_title_txt, job_crnt_ind, job_instn_nm, job_crtd_dt, job_crtd_id, job_updt_dt, job_updt_id, original_almn_id, pgm_src_nm)
  select job_almn_id, job_num, job_pgm_id, job_title_txt, job_crnt_ind, job_instn_nm, job_crtd_dt, job_crtd_id, job_updt_dt, job_updt_id, original_almn_id, pgm_src_nm from job
  where job_almn_id in (95,366473);   
  
insert into pgm1
 (select p.* from pgm p
  where pgm_almn_id in (95,366473) and pgm_id in (95,317490));
  
insert into place_visit1
 (select pv.* from place_visit pv
  where place_visit_almn_id in (95,366473) and place_visit_pgm_id in (95,317490));
  
  
commit;


--==================END RESTORE RECORDS================================ 

--=================UPDATE ALMN to reflect merge changes saved in ALMN1 ========================
update almn set show_almn_ind = 'Y' where almn_id in (  select almn_id from almn1 where  almn_id in (95,366473) and show_almn_ind = 'Y' ) ;
 
select almn_id, show_almn_ind from almn where  almn_id in (95,366473) ;
  
   