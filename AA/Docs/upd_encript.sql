update almn
       set almn_resdnc_adrs_txt  = 
       f_encript(almn_resdnc_adrs_txt)where almn_resdnc_adrs_txt is not null ;

update almn
       set almn_bsns_adrs_txt  = 
       f_encript(almn_bsns_adrs_txt)where almn_bsns_adrs_txt is not null ;
       
       update almn
       set almn_resdnc_city_nm  = 
       f_encript(almn_resdnc_city_nm)where almn_resdnc_city_nm is not null ;
       
       update almn
       set almn_bsns_city_nm  = 
       f_encript(almn_bsns_city_nm)where almn_bsns_city_nm is not null ;
       
       update almn
       set almn_bsns_nm  = 
       f_encript(almn_bsns_nm)where almn_bsns_nm is not null ;
       
              update almn
       set almn_email1_txt  = 
       f_encript(almn_email1_txt)where almn_email1_txt is not null ;
       
        update almn
       set almn_email2_txt  = 
       f_encript(almn_email2_txt)where almn_email2_txt is not null ;
       
           update almn
       set almn_resdnc_phone_num  = 
       f_encript(almn_resdnc_phone_num)where almn_resdnc_phone_num is not null ;
       
           update almn
       set almn_bsns_phone_num  = 
       f_encript(almn_bsns_phone_num)where almn_bsns_phone_num is not null ;
       
        update almn
       set almn_cell_num  = 
       f_encript(almn_cell_num)where almn_cell_num is not null ;
       
            update almn
       set almn_othr_phone_num  = 
       f_encript(almn_othr_phone_num)where almn_othr_phone_num is not null ;
       
                   update almn
       set almn_bsns_postl_cd  = 
       f_encript(almn_bsns_postl_cd)where almn_bsns_postl_cd is not null ;
       
           update almn
       set almn_resdnc_postl_cd  = 
       f_encript(almn_resdnc_postl_cd)where almn_resdnc_postl_cd is not null ;
       
       commit;