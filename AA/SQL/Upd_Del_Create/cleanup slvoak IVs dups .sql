--set show_almn_ind to 'N'

update alumni.almn set show_almn_ind = 'N' where almn_id =	251016	 and pgm_src_nm = 'MERIDIAN II IV';


commit;

--55 records updated

--set show_pgm_ind to 'N'

update alumni.pgm set show_pgm_ind = 'N' where pgm_almn_id =	251016	 and pgm_src_nm = 'MERIDIAN II IV';

commit;

select pgm_almn_id, pgm_id from alumni.pgm where pgm_almn_id in (251016		);

/*
PGM_ALMN_ID	PGM_ID	

251016		251016	
*/

--update to almn_ids sorted by duplicate almn_ids(same order as above)

ALMN_ID		DUPL_ALMN_ID

304727		251016

--======================

--update alumni type records in rec_map table


update alumni.rec_map set rec_id = 	304727	where type = 'A' and rec_id =	251016	 and src_nm = 'MERIDIAN II IV';

--=============================
--update pgm type records in rec_map table

update alumni.rec_map set rec_id = (select min(pgm_id) from alumni.pgm where pgm_src_nm = 'USIA' and pgm_almn_id = 	304727	) where type = 'P' and rec_id =	251016	 and src_nm = 'MERIDIAN II IV';


--=================================
--delete dups from job table (identical to USIA data)

delete alumni.job where job_almn_id = 	227413	and job_num = 	1	;
delete alumni.job where job_almn_id = 	227496	and job_num = 	1	;
delete alumni.job where job_almn_id = 	227497	and job_num = 	2	;
delete alumni.job where job_almn_id = 	227498	and job_num = 	1	;
delete alumni.job where job_almn_id = 	227502	and job_num = 	1	;
delete alumni.job where job_almn_id = 	227503	and job_num = 	2	;
delete alumni.job where job_almn_id = 	227628	and job_num = 	1	;
delete alumni.job where job_almn_id = 	228022	and job_num = 	1	;


--update job records(to set USIA almn_id and pgm_id)

update alumni.job set job_almn_id = 	281437	, job_pgm_id = 	272334	, job_num = 	2	where job_almn_id  = 	227413	and job_pgm_id = 	227413	and pgm_src_nm = 	'PHELPSSTOKES IV'	;
update alumni.job set job_almn_id = 	309832	, job_pgm_id = 	280126	, job_num = 	2	where job_almn_id  = 	227496	and job_pgm_id = 	227496	and pgm_src_nm = 	'PHELPSSTOKES IV'	;
update alumni.job set job_almn_id = 	309760	, job_pgm_id = 	280126	, job_num = 	2	where job_almn_id  = 	227497	and job_pgm_id = 	227497	and pgm_src_nm = 	'PHELPSSTOKES IV'	;
update alumni.job set job_almn_id = 	309833	, job_pgm_id = 	280126	, job_num = 	2	where job_almn_id  = 	227498	and job_pgm_id = 	227498	and pgm_src_nm = 	'PHELPSSTOKES IV'	;
update alumni.job set job_almn_id = 	309982	, job_pgm_id = 	280163	, job_num = 	2	where job_almn_id  = 	227502	and job_pgm_id = 	227502	and pgm_src_nm = 	'PHELPSSTOKES IV'	;
update alumni.job set job_almn_id = 	309979	, job_pgm_id = 	280163	, job_num = 	2	where job_almn_id  = 	227503	and job_pgm_id = 	227503	and pgm_src_nm = 	'PHELPSSTOKES IV'	;
update alumni.job set job_almn_id = 	294400	, job_pgm_id = 	275604	, job_num = 	2	where job_almn_id  = 	227628	and job_pgm_id = 	227628	and pgm_src_nm = 	'PHELPSSTOKES IV'	;
update alumni.job set job_almn_id = 	285647	, job_pgm_id = 	273313	, job_num = 	2	where job_almn_id  = 	228022	and job_pgm_id = 	228022	and pgm_src_nm = 	'PHELPSSTOKES IV'	;


--========================================================

--delete dups from place_visit (identical to USIA data)

delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	226939	 and PLACE_VISIT_ALMN_ID = 	226939	and PLACE_VISIT_NUM = 	1	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	226939	 and PLACE_VISIT_ALMN_ID = 	226939	and PLACE_VISIT_NUM = 	2	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227413	 and PLACE_VISIT_ALMN_ID = 	227413	and PLACE_VISIT_NUM = 	1	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227413	 and PLACE_VISIT_ALMN_ID = 	227413	and PLACE_VISIT_NUM = 	2	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227413	 and PLACE_VISIT_ALMN_ID = 	227413	and PLACE_VISIT_NUM = 	3	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227413	 and PLACE_VISIT_ALMN_ID = 	227413	and PLACE_VISIT_NUM = 	4	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227496	 and PLACE_VISIT_ALMN_ID = 	227496	and PLACE_VISIT_NUM = 	5	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227497	 and PLACE_VISIT_ALMN_ID = 	227497	and PLACE_VISIT_NUM = 	1	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227498	 and PLACE_VISIT_ALMN_ID = 	227498	and PLACE_VISIT_NUM = 	5	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227502	 and PLACE_VISIT_ALMN_ID = 	227502	and PLACE_VISIT_NUM = 	1	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227503	 and PLACE_VISIT_ALMN_ID = 	227503	and PLACE_VISIT_NUM = 	1	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	227628	 and PLACE_VISIT_ALMN_ID = 	227628	and PLACE_VISIT_NUM = 	3	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	228022	 and PLACE_VISIT_ALMN_ID = 	228022	and PLACE_VISIT_NUM = 	1	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	228022	 and PLACE_VISIT_ALMN_ID = 	228022	and PLACE_VISIT_NUM = 	2	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
delete alumni.place_visit where  PLACE_VISIT_PGM_ID = 	228022	 and PLACE_VISIT_ALMN_ID = 	228022	and PLACE_VISIT_NUM = 	3	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;

--=======================================================

--update place_visit to set USIA almn_id and pgm_id 

update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	272334	, PLACE_VISIT_ALMN_ID =	281437	,PLACE_VISIT_NUM = 	11	where  PLACE_VISIT_PGM_ID =	227413	 and PLACE_VISIT_ALMN_ID = 	227413	and PLACE_VISIT_NUM = 	5	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309832	,PLACE_VISIT_NUM = 	2	where  PLACE_VISIT_PGM_ID =	227496	 and PLACE_VISIT_ALMN_ID = 	227496	and PLACE_VISIT_NUM = 	1	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309832	,PLACE_VISIT_NUM = 	3	where  PLACE_VISIT_PGM_ID =	227496	 and PLACE_VISIT_ALMN_ID = 	227496	and PLACE_VISIT_NUM = 	2	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309832	,PLACE_VISIT_NUM = 	4	where  PLACE_VISIT_PGM_ID =	227496	 and PLACE_VISIT_ALMN_ID = 	227496	and PLACE_VISIT_NUM = 	3	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309832	,PLACE_VISIT_NUM = 	5	where  PLACE_VISIT_PGM_ID =	227496	 and PLACE_VISIT_ALMN_ID = 	227496	and PLACE_VISIT_NUM = 	4	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309760	,PLACE_VISIT_NUM = 	2	where  PLACE_VISIT_PGM_ID =	227497	 and PLACE_VISIT_ALMN_ID = 	227497	and PLACE_VISIT_NUM = 	2	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309760	,PLACE_VISIT_NUM = 	3	where  PLACE_VISIT_PGM_ID =	227497	 and PLACE_VISIT_ALMN_ID = 	227497	and PLACE_VISIT_NUM = 	3	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309760	,PLACE_VISIT_NUM = 	4	where  PLACE_VISIT_PGM_ID =	227497	 and PLACE_VISIT_ALMN_ID = 	227497	and PLACE_VISIT_NUM = 	4	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309760	,PLACE_VISIT_NUM = 	5	where  PLACE_VISIT_PGM_ID =	227497	 and PLACE_VISIT_ALMN_ID = 	227497	and PLACE_VISIT_NUM = 	5	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309833	,PLACE_VISIT_NUM = 	2	where  PLACE_VISIT_PGM_ID =	227498	 and PLACE_VISIT_ALMN_ID = 	227498	and PLACE_VISIT_NUM = 	1	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309833	,PLACE_VISIT_NUM = 	3	where  PLACE_VISIT_PGM_ID =	227498	 and PLACE_VISIT_ALMN_ID = 	227498	and PLACE_VISIT_NUM = 	2	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309833	,PLACE_VISIT_NUM = 	4	where  PLACE_VISIT_PGM_ID =	227498	 and PLACE_VISIT_ALMN_ID = 	227498	and PLACE_VISIT_NUM = 	3	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	280126	, PLACE_VISIT_ALMN_ID =	309833	,PLACE_VISIT_NUM = 	5	where  PLACE_VISIT_PGM_ID =	227498	 and PLACE_VISIT_ALMN_ID = 	227498	and PLACE_VISIT_NUM = 	4	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	275604	, PLACE_VISIT_ALMN_ID =	294400	,PLACE_VISIT_NUM = 	2	where  PLACE_VISIT_PGM_ID =	227628	 and PLACE_VISIT_ALMN_ID = 	227628	and PLACE_VISIT_NUM = 	1	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	275604	, PLACE_VISIT_ALMN_ID =	294400	,PLACE_VISIT_NUM = 	3	where  PLACE_VISIT_PGM_ID =	227628	 and PLACE_VISIT_ALMN_ID = 	227628	and PLACE_VISIT_NUM = 	2	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	275604	, PLACE_VISIT_ALMN_ID =	294400	,PLACE_VISIT_NUM = 	4	where  PLACE_VISIT_PGM_ID =	227628	 and PLACE_VISIT_ALMN_ID = 	227628	and PLACE_VISIT_NUM = 	4	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;
update alumni.place_visit set  PLACE_VISIT_PGM_ID = 	273313	, PLACE_VISIT_ALMN_ID =	285647	,PLACE_VISIT_NUM = 	5	where  PLACE_VISIT_PGM_ID =	228022	 and PLACE_VISIT_ALMN_ID = 	228022	and PLACE_VISIT_NUM = 	4	and  PGM_SRC_NM = 	'PHELPSSTOKES IV'	;

--========================================

--delete pgm records of dups;


delete alumni.pgm where PGM_ALMN_ID = 	251016	and  PGM_ID = 	251016	;

-- delete almnn records of dups;


delete alumni.almn where ALMN_ID = 	251016	;


--===========================================================
--cleanup double duplicate records

--set show_almn_ind to 'N'

update alumni.almn set show_almn_ind = 'N' where almn_id = 242994	 and pgm_src_nm = 'MERIDIAN IV';



--set show_pgm_ind to 'N'

update alumni.pgm set show_pgm_ind = 'N' where pgm_almn_id =	242994	 and pgm_src_nm = 'MERIDIAN IV';


--update alumni type records in rec_map table

update alumni.rec_map set rec_id = 	281513	where type = 'A' and rec_id =	242994	 and src_nm = 'MERIDIAN IV';


--update pgm type records in rec_map table

update alumni.rec_map set rec_id = 272733 where type = 'P' and rec_id =	242994	 and src_nm = 'MERIDIAN IV';


--=================================
--no records in job table


--========================================================

--no records in  place_visit 
--=======================================================

--delete pgm records of dups;

delete alumni.pgm where PGM_ALMN_ID = 	242994	and  PGM_ID = 	242994	;


-- delete almnn records of dups;

delete alumni.almn where ALMN_ID = 	242994	;


--=========================================================

--set show_almn_ind to 'N'
update alumni.almn set show_almn_ind = 'N' where almn_id = 244737	 and pgm_src_nm = 'MERIDIAN IV';

--set show_pgm_ind to 'N'

update alumni.pgm set show_pgm_ind = 'N' where pgm_almn_id =	244737	 and pgm_src_nm = 'MERIDIAN IV';

select * from alumni.pgm where pgm_almn_id = 311580
--update alumni type records in rec_map table

update alumni.rec_map set rec_id = 	311580	where type = 'A' and rec_id =	244737	 and src_nm = 'MERIDIAN IV';


--update pgm type records in rec_map table

update alumni.rec_map set rec_id = 280762  where type = 'P' and rec_id =	244737	 and src_nm = 'MERIDIAN IV';


--=================================
--no records in job table


--========================================================

--no records in  place_visit 
--=======================================================

--delete pgm records of dups;

delete alumni.pgm where PGM_ALMN_ID = 	244737	and  PGM_ID = 	244737	;


-- delete almnn records of dups;

delete alumni.almn where ALMN_ID = 	244737	;

==============================================================================

--cleanup dups from the confirmed file


--set show_almn_ind to 'N'

update alumni.almn set show_almn_ind = 'N' where almn_id = 241037	 and pgm_src_nm = 'MERIDIAN IV';
update alumni.almn set show_almn_ind = 'N' where almn_id = 250250	 and pgm_src_nm = 'MERIDIAN II IV';
update alumni.almn set show_almn_ind = 'N' where almn_id = 227500	 and pgm_src_nm = 'PHELPSSTOKES IV';
update alumni.almn set show_almn_ind = 'N' where almn_id = 227499	 and pgm_src_nm = 'PHELPSSTOKES IV';

--set show_pgm_ind to 'N'

update alumni.pgm set show_pgm_ind = 'N' where pgm_almn_id =	241037	 and pgm_src_nm = 'MERIDIAN IV';
update alumni.pgm set show_pgm_ind = 'N' where pgm_almn_id =	250250	 and pgm_src_nm = 'MERIDIAN II IV';
update alumni.pgm set show_pgm_ind = 'N' where pgm_almn_id =	227500	 and pgm_src_nm = 'PHELPSSTOKES IV';
update alumni.pgm set show_pgm_ind = 'N' where pgm_almn_id =	227499	 and pgm_src_nm = 'PHELPSSTOKES IV';


--update alumni type records in rec_map table

update alumni.rec_map set rec_id = 	301258	where type = 'A' and rec_id =	250250	 and src_nm = 'MERIDIAN II IV';

update alumni.rec_map set rec_id = 	309484  where type = 'A' and rec_id =	241037	 and src_nm = 'MERIDIAN IV';
update alumni.rec_map set rec_id = 	309835  where type = 'A' and rec_id =	227500	 and src_nm = 'PHELPSSTOKES IV';
update alumni.rec_map set rec_id = 	309834  where type = 'A' and rec_id =	227499	 and src_nm = 'PHELPSSTOKES IV';

select pgm_id, pgm_almn_id  from  alumni.pgm where pgm_almn_id in (301258,309484,309835,309834)

--update pgm type records in rec_map table

update alumni.rec_map set rec_id = 	277704	where type = 'P' and rec_id =	250250	 and src_nm = 'MERIDIAN II IV';

update alumni.rec_map set rec_id = 	279985  where type = 'P' and rec_id =	241037	 and src_nm = 'MERIDIAN IV';
update alumni.rec_map set rec_id = 	280126  where type = 'P' and rec_id =	227500	 and src_nm = 'PHELPSSTOKES IV';
update alumni.rec_map set rec_id = 	280126  where type = 'P' and rec_id =	227499	 and src_nm = 'PHELPSSTOKES IV';

--=================================
--delete dups from  job table

delete alumni.job where job_almn_id  = 250250 and pgm_src_nm = 'MERIDIAN II IV'

delete alumni.job where job_almn_id  = 227499 and pgm_src_nm = 'PHELPSSTOKES IV' and job_num = 2

update alumni.job set job_almn_id  = 309834, job_pgm_id  = 280126, job_num = 2 where job_almn_id  = 227499 and pgm_src_nm = 'PHELPSSTOKES IV' and job_num = 1

delete alumni.job where job_almn_id  = 309835 and job_pgm_id  = 280126 and pgm_src_nm = 'USIA2' 

update alumni.job set job_almn_id  = 309835, job_pgm_id  = 280126 where job_almn_id  = 227500 and pgm_src_nm = 'PHELPSSTOKES IV' 

update alumni.job set job_crnt_ind = 'N' where job_almn_id  = 309835 and pgm_src_nm = 'PHELPSSTOKES IV' 

--========================================================

---delete dup records in  place_visit 

select * from  alumni.place_visit where place_visit_almn_id in (301258,250250) order by 4  --no dups

select * from  alumni.place_visit where place_visit_almn_id in (309484,241037) order by 4 --no dups

select * from  alumni.place_visit where place_visit_almn_id in (309835,227500) order by 4

delete alumni.place_visit where place_visit_almn_id = 309835 and place_visit_pgm_id = 280126;

update alumni.place_visit set place_visit_almn_id = 309835,place_visit_pgm_id = 280126 
where place_visit_almn_id = 227500 and place_visit_pgm_id = 227500

select * from  alumni.place_visit where place_visit_almn_id in (309834,227499) order by 4

delete alumni.place_visit where place_visit_almn_id = 309834 and place_visit_pgm_id = 280126;

update alumni.place_visit set place_visit_almn_id = 309834,place_visit_pgm_id = 280126 
where place_visit_almn_id = 227499 and place_visit_pgm_id = 227499

--=======================================================

--delete pgm records of dups;

delete alumni.pgm where PGM_ALMN_ID = 	250250 and  PGM_ID = 	250250	;
delete alumni.pgm where PGM_ALMN_ID = 	241037 and  PGM_ID = 	241037	;
delete alumni.pgm where PGM_ALMN_ID = 	227499 and  PGM_ID = 	227499	;
delete alumni.pgm where PGM_ALMN_ID = 	227500 and  PGM_ID = 	227500	;

-- delete almnn records of dups;

delete alumni.almn where ALMN_ID = 	250250	;

delete alumni.almn where ALMN_ID = 	241037	;
delete alumni.almn where ALMN_ID = 	227499	;
delete alumni.almn where ALMN_ID = 	227500	
