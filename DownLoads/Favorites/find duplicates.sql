SELECT t.almn_id,t.almn_last_nm, t.almn_frst_nm
  FROM alumni.almn t
 WHERE t.rowid >
   (SELECT MIN(t1.rowid)
      FROM alumni.almn  t1
     WHERE t.almn_last_nm=t1.almn_last_nm
       AND t.almn_frst_nm=t1.almn_frst_nm
    )  ;

    SELECT count(t.almn_id)
  FROM alumni.almn t
 WHERE t.rowid >
   (SELECT MIN(t1.rowid)
      FROM alumni.almn  t1
     WHERE t.almn_last_nm=t1.almn_last_nm
       AND t.almn_frst_nm=t1.almn_frst_nm AND t.almn_midl_nm = t1.almn_midl_nm
    )  ;


--07/13/2005:

SQL>   SELECT count(t.almn_id)
  2    FROM alumni.almn t
  3   WHERE t.rowid >
  4     (SELECT MIN(t1.rowid)
  5        FROM alumni.almn  t1
  6       WHERE t.almn_last_nm=t1.almn_last_nm
  7         AND t.almn_frst_nm=t1.almn_frst_nm AND t.almn_midl_nm = t1.almn_midl_nm
  8      )  ;

COUNT(T.ALMN_ID)
----------------
           40756


SELECT t.almn_id,t.almn_last_nm ||', '|| t.almn_frst_nm ||' '|| t.almn_midl_nm 
  FROM alumni.almn t
 WHERE t.rowid >
   (SELECT MIN(t1.rowid)
      FROM alumni.almn  t1
     WHERE t.almn_last_nm=t1.almn_last_nm
       AND t.almn_frst_nm=t1.almn_frst_nm AND t.almn_midl_nm = t1.almn_midl_nm
    )  ;


--===================================================================================
--all duplicate alumni (by names only)

select t2.almn_last_nm , t2.almn_frst_nm ,t2.almn_midl_nm , t2.almn_dob_dt, 
t2.almn_ctznsp_cntry_cd, t2.almn_resdnc_cntry_cd,
p.pgm_type_cd, p.pgm_fy_dt, p.pgm_yr_dt,p.pgm_from_cntry_cd, p.pgm_to_cntry_cd
from alumni.almn t2, alumni.pgm p
where t2.almn_id = p.pgm_almn_id
AND nvl(t2.almn_last_nm,'')||', '|| nvl(t2.almn_frst_nm,'') ||' '|| nvl(t2.almn_midl_nm,'')  in 
(
SELECT  distinct nvl(t.almn_last_nm,'')||', '|| nvl(t.almn_frst_nm,'') ||' '|| nvl(t.almn_midl_nm,'')
  FROM alumni.almn t
 WHERE t.rowid >
   (
   SELECT MIN(t1.rowid)
      FROM alumni.almn  t1
     WHERE t.almn_last_nm=t1.almn_last_nm
       AND nvl(t.almn_frst_nm,'')=nvl(t1.almn_frst_nm,'') 
       AND nvl(t.almn_midl_nm,'') = nvl(t1.almn_midl_nm,'')    
   ) 
) 
order by t2.almn_last_nm, t2.almn_frst_nm, p.pgm_yr_dt, p.pgm_fy_dt;
