CREATE OR REPLACE PACKAGE EM_REACTIVATE_NSN_PKG
  IS
--
-- To modify this template, edit file PKGSPEC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
   -- Enter package declarations as shown below

--   variable_name   datatype;
--==============================================================================
PROCEDURE em_getReactNSN
     ( pSiteID IN NUMBER,
       pNSN    IN VARCHAR2);
--==============================================================================
PROCEDURE em_getSites;
--==============================================================================
PROCEDURE em_getSourceCode;
--==============================================================================
PROCEDURE em_reactivateNSN(pSiteID     IN NUMBER
                          ,pNSN        IN VARCHAR2
                          ,pPointer    IN NUMBER
                          ,pUserID     IN NUMBER
                          ,pStatusFlag IN CHAR
                          ,pSourceCode IN CHAR
                          ,pNomenclatureLocal IN VARCHAR2
                          );
--==============================================================================
--   FUNCTION function_name
--     ( param1 IN datatype DEFAULT default_value,
--       param2 IN OUT datatype)
--     RETURN  datatype;
--==============================================================================
END; -- Package spec
--==============================================================================
--PROCEDURE em_getRepairCode;
--==============================================================================
--PROCEDURE em_getSourceCodeOfSupply;
/
CREATE OR REPLACE PACKAGE BODY EM_REACTIVATE_NSN_PKG
IS
--
-- To modify this template, edit file PKGBODY.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package body
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
   -- Enter procedure, function bodies as shown below

--==============================================================================
--==============================================================================
PROCEDURE em_getSites
IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( site_id        emdba.em_site_t.site_id%TYPE   -- NUMBER
                             ,site_name_show emdba.em_site_t.site_name%TYPE -- VARCHAR2(50)
                            );

v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;

v_SiteName_MaxLen NUMBER;
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------
SELECT MAX(LENGTH( replace(site_name, '&',' and ') ))
  INTO v_SiteName_MaxLen
  FROM emdba.em_site_t
 WHERE site_status_code = 'A';

 v_SQL := 'SELECT a.site_id,
                  ''(''||LPAD(to_char(a.site_id), 3)||'')''||
                  LPAD(replace(a.site_name, ''&'','' and ''),'||v_SiteName_MaxLen||')||'' - ''||a.state as site_name_show
             FROM emdba.em_site_t a
            WHERE a.site_status_code = ''A''
         ORDER BY a.site_name, a.state';
--------------------------------------------------------------------------------
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            htp.p('<ROW>'||
                       '<SITE_ID>' ||r_Record.site_id  ||'</SITE_ID>
                       <SITE_NAME>'||r_Record.site_name_show||'</SITE_NAME>'
                  ||'</ROW>');

        END LOOP;
    CLOSE c_AvailableRecords;
htp.p('</ROWSET>');
--------------------------------------------------------------------------------
   EXCEPTION
      WHEN OTHERS
      THEN
         emapp.em_error_pkg.em_errorinsert_prc;
         RAISE;
--------------------------------------------------------------------------------
END em_getSites;
--==============================================================================
--==============================================================================
PROCEDURE em_getSourceCode
IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( source_code      emdba.em_source_code_t.source_code%TYPE   -- NUMBER
                             ,source_code_desc emdba.em_source_code_t.source_code_desc %TYPE -- VARCHAR2(50)
                            );

v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;

v_String_MaxLen NUMBER;
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
SELECT MAX(LENGTH( replace(source_code_desc, '&',' and ') ))
  INTO v_String_MaxLen
  FROM emdba.em_source_code_t;

 v_SQL := 'SELECT a.source_code,
                  ''(''||a.source_code||'')''||
                  LPAD(replace(a.source_code_desc, ''&'','' and ''),'||v_String_MaxLen||') as source_code_desc
             FROM emdba.em_source_code_t a
         ORDER BY a.source_code_desc';
--------------------------------------------------------------------------------
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            htp.p('<ROW>'||
                       '<source_code>'    ||r_Record.source_code  ||'</source_code>
                       <source_code_desc>'||r_Record.source_code_desc||'</source_code_desc>'
                  ||'</ROW>');

        END LOOP;
    CLOSE c_AvailableRecords;
htp.p('</ROWSET>');
--------------------------------------------------------------------------------
   EXCEPTION
      WHEN OTHERS
      THEN
         emapp.em_error_pkg.em_errorinsert_prc;
         RAISE;
--------------------------------------------------------------------------------
END em_getSourceCode;

--==============================================================================
--==============================================================================
PROCEDURE em_getReactNSN ( pSiteID IN NUMBER,
                           pNSN    IN VARCHAR2)
IS
--------------------------------------------------------------------------------
v_ERROR_POS VARCHAR2(100)   default 'NOT DEFINED';
v_sqlerrm   VARCHAR2(1000);
v_sqlcode   VARCHAR2(1000);
--
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( nsn emdba.em_catalog_t.nsn%TYPE                -- VARCHAR2(16)
                             ,nomen_mdims emdba.em_mdims_catalog_t.nomenclature%TYPE -- VARCHAR2(75)
                             ,nomen_local emdba.em_catalog_t.local_nomen%TYPE        -- VARCHAR2(75)
                             ,part_ptr emdba.em_catalog_t.part_ptr%TYPE  -- NUMBER
                             ,room_id  emdba.em_catalog_t.room_id%TYPE   -- VARCHAR2(1)
                             ,status_flag_mdims emdba.em_mdims_catalog_t.status_flag%TYPE  -- VARCHAR2(1)
                             ,status_flag_local emdba.em_catalog_t.status_flag%TYPE        -- VARCHAR2(1)
                             ----- if repair_code is "C", then set source_code "T": -------------------
                             ,repair_code_mdims emdba.em_mdims_catalog_t.repair_code%TYPE -- VARCHAR2(1)
                             ,source_code_local emdba.em_catalog_t.source_code%TYPE       -- VARCHAR2(1)
                             ,source_code_of_supply emdba.em_mdims_catalog_t.source_code_of_supply%TYPE -- VARCHAR(1)
                             ,unit_cost_mdims emdba.em_mdims_catalog_t.unit_cost%TYPE -- NUMBER
                             ,unit_cost_local emdba.em_catalog_t.unit_cost%TYPE       -- NUMBER
                             ,boh emdba.em_catalog_t.boh%TYPE       -- NUMBER
                             ,deactiv_date VARCHAR2(20) --emdba.em_catalog_t.mod_date%TYPE  -- DATE
                             );



v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;
--------------------------------------------------------------------------------
BEGIN -- Data Is Not Available
v_SQL := 'SELECT c.nsn
                ,NVL(Replace(mc.nomenclature,''&'',''AND''),''Z'') as nomen_mdims
                ,Replace(c.local_nomen, ''&'',''AND'') as nomen_local
                ,c.part_ptr
                ,c.room_id
                ,NVL(mc.status_flag,''Z'') as status_flag_mdims
                ,c.status_flag  as status_flag_local
                ,NVL(mc.repair_code,''Z'') as repair_code_mdims
                ,c.source_code as source_code_local
                ,NVL(mc.source_code_of_supply,''Z'') as source_code_of_supply
                ,NVL(TO_CHAR(mc.unit_cost),''969696'') as unit_cost_mdims
                ,c.unit_cost  as unit_cost_local
                ,c.boh as boh
                ,TO_CHAR(TRUNC(c.mod_date),''MM/DD/YYYY'') as deactiv_date
           from emdba.em_catalog_t c,
                emdba.em_mdims_catalog_t mc
          where c.nsn = mc.nsn(+)
           and c.site_id = '||pSiteID||
         ' and c.nsn = '''||pNSN||'''';

htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            htp.p('<ROW>'||
                            '<nsn>'||r_Record.nsn||'</nsn>'||
                            '<nomen_mdims>'||r_Record.nomen_mdims||'</nomen_mdims>'||
                            '<nomen_local>'||r_Record.nomen_local||'</nomen_local>'||
                            '<part_ptr>'||r_Record.part_ptr||'</part_ptr>'||
                            '<room_id>' ||r_Record.room_id ||'</room_id>'||
                            '<status_flag_mdims>'||r_Record.status_flag_mdims||'</status_flag_mdims>'||
                            '<status_flag_local>'||r_Record.status_flag_local||'</status_flag_local>'||
                            '<repair_code_mdims>'||r_Record.repair_code_mdims||'</repair_code_mdims>'||
                            '<source_code_local>'||r_Record.source_code_local||'</source_code_local>'||
                            '<source_code_of_supply>'||r_Record.source_code_of_supply||'</source_code_of_supply>'||
                            '<unit_cost_mdmis>'||r_Record.unit_cost_mdims||'</unit_cost_mdmis>'||
                            '<unit_cost_local>'||r_Record.unit_cost_local||'</unit_cost_local>'||
                            '<boh>'||r_Record.boh||'</boh>'||
                            '<deactiv_date>'||r_Record.deactiv_date||'</deactiv_date>'||
                  '</ROW>');

        END LOOP;
    CLOSE c_AvailableRecords;
htp.p('</ROWSET>');
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
/*
            EXCEPTION                          -- Table: ms47.ms47_sp_error_log
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_REACTIVATE_NSN_PKG.em_getReactNSN'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );
*/
--------------------------------------------------------------------------------
  EXCEPTION
      WHEN OTHERS
      THEN
         emapp.em_error_pkg.em_errorinsert_prc;
         RAISE;
--------------------------------------------------------------------------------
END em_getReactNSN;
--==============================================================================
--==============================================================================
PROCEDURE em_reactivateNSN(pSiteID     IN NUMBER
                          ,pNSN        IN VARCHAR2
                          ,pPointer    IN NUMBER
                          ,pUserID     IN NUMBER
                          ,pStatusFlag IN CHAR
                          ,pSourceCode IN CHAR
                          ,pNomenclatureLocal IN VARCHAR2
                          )
IS

BEGIN
--- 1. -------------------------------------------------------------------------
UPDATE emdba.em_catalog_t a
  SET  mod_date        = sysdate,
       mod_user        = pUserID,
       replacement_nsn = NULL,
       reord_flag      = 'Y',
       status_flag     = pStatusFlag,
       source_code     = pSourceCode,
       local_nomen     = pNomenclatureLocal
 WHERE site_id  = pSiteID
   AND part_ptr = pPointer;
COMMIT;
--------------------------------------------------------------------------------
  EXCEPTION
      WHEN OTHERS
      THEN
         emapp.em_error_pkg.em_errorinsert_prc;
         RAISE;
--------------------------------------------------------------------------------
END em_reactivateNSN;
--==============================================================================
--==============================================================================
END;
/
