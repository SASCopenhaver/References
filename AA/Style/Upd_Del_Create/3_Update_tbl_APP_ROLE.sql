
update app_role ar
   set app_role_nm = 'Locally Engaged Staff(LES)',
       app_role_desc = 'Locally Engaged Staff(LES)'
 where ar.app_role_id = 245;
-------
commit;
-------