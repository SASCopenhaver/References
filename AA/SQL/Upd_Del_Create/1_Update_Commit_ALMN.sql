-- 1. ALMN update
update almn
   set almn_pfx_dsc = Trim(almn_pfx_dsc);
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, '.', '');
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, '.', '');
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, '.', '');
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, '/', '');
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, '(','');
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, ')','');
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, '`','');
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, '<','');
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, ',','');
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, ':','');
--
update almn
   set almn_pfx_dsc = Replace(almn_pfx_dsc, '',null);
-------
commit;
-------