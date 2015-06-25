update almn a 
   set a.show_almn_ind = 'Y'
 where a.almn_id in (select am.almn_id from almn_merged am);

truncate table almn_merged;
 /*
 delete almn_merged
where almn_id in (95,366473,294,1031,200923,374512,374536);
*/
commit;

---------------------------------------------------
--select * from almn_merged;
truncate table almn_merged;
--------------------------------------------------

--select * from job1;
truncate table job1;
---------------------------------------------------
truncate table job_merged;

--------------------------------------------------

--select * from converter
truncate table converter;