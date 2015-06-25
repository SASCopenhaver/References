---------------------------------------------------------------
---  WARNING !!!!!
---  It takes a very long time to run this file!!!
---  You could run it just before going home!!!
---------------------------------------------------------------

update almn a
   set almn_sex_ind = 'M'
where a.almn_pfx_dsc = 'MR';
---
update almn a
   set almn_sex_ind = 'F'
where a.almn_pfx_dsc = 'MS';
---
update almn a
   set almn_sex_ind = null
where a.almn_pfx_dsc in ('O','U');
---
update almn a
   set 
	a.almn_resdnc_adrs_txt = TRIM(a.almn_resdnc_adrs_txt),
   	a.almn_resdnc_city_nm = TRIM(a.almn_resdnc_city_nm),
   	a.almn_resdnc_state_prvnc_nm = TRIM(a.almn_resdnc_state_prvnc_nm),
   	a.almn_bsns_adrs_txt = TRIM(a.almn_bsns_adrs_txt),
   	a.almn_bsns_city_nm = TRIM(a.almn_bsns_city_nm),
   	a.almn_bsns_state_prvnc_nm = TRIM(a.almn_bsns_state_prvnc_nm),
   	a.almn_resdnc_phone_num = TRIM(a.almn_resdnc_phone_num),
   	a.almn_bsns_phone_num = TRIM(a.almn_bsns_phone_num),
   	a.almn_cell_num = TRIM(a.almn_cell_num),
   	a.almn_othr_phone_num = TRIM(a.almn_othr_phone_num),
   	a.almn_fax_num= TRIM(a.almn_fax_num)

;  

---
commit;