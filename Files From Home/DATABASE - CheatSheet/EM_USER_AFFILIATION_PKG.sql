CREATE OR REPLACE PACKAGE EM_USER_AFFILIATION_PKG
  IS
--
-- To modify this template, edit file PKGSPEC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package
--
-- MODIFICATION HISTORY
-- SASurikov   07/19/2011
-- ---------   ------  ------------------------------------------
   -- Enter package declarations as shown below

v_ERROR_POS VARCHAR2(100)   default 'NOT DEFINED';
v_sqlerrm   VARCHAR2(1000);
v_sqlcode   VARCHAR2(1000);
--==============================================================================
-- This SP retrieves ALL sites.
PROCEDURE sp_getSite( p_FindBy        IN VARCHAR2 DEFAULT 'USER_LOGON'
                     ,p_SearchedValue IN VARCHAR2);
--==============================================================================
-- Theis SP retrieves Administration (site_id=0) and all ACTIVE sites
PROCEDURE em_getDestinationSites;
--==============================================================================
PROCEDURE em_getDeletedUsersList(pAppUserID IN NUMBER
                                ,pOrderBy   IN VARCHAR2
                                ,pAscDesc   IN VARCHAR2
                                );
--==============================================================================
PROCEDURE em_getAllSites;
--==============================================================================
PROCEDURE em_getUserList(pAppUserID IN NUMBER
                        ,pSite_ID   IN NUMBER
                        ,pOrderBy   IN VARCHAR2
                        ,pAscDesc   IN VARCHAR2);
----============================================================================
PROCEDURE em_transferUser(p_SourceSiteID VARCHAR2
                         ,p_UserID       NUMBER
                         ,p_DestinationSiteID NUMBER
                         ,p_AppUser      NUMBER);
--==============================================================================
/*   FUNCTION function_name
     ( param1 IN datatype DEFAULT default_value,
       param2 IN OUT datatype)
     RETURN  datatype;
*/
END EM_USER_AFFILIATION_PKG; -- Package spec
/
CREATE OR REPLACE PACKAGE BODY EM_USER_AFFILIATION_PKG
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
-- This SP retrieves ALL sites.
PROCEDURE sp_getSite( p_FindBy        IN VARCHAR2 DEFAULT 'USER_LOGON'
                     ,p_SearchedValue IN VARCHAR2)
IS
--------------------------------------------------------------------------------
vv_SearchedValue VARCHAR2(10);  -- "vv" means variable type is VARCHAR
vn_SearchedValue NUMBER;        -- "vn" means variable type is NUMBER

v_SiteID  NUMBER;
v_UserID  NUMBER;
v_Counter NUMBER DEFAULT 0;
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------
       IF p_FindBy = 'USER_LOGON' THEN
            -- 1.1
            vv_SearchedValue := p_SearchedValue;
            -- 1.2
            select 9999, user_id
              into v_SiteID, v_UserID
              from emdba.em_user_t_deltd ud
             where ud.user_logon = UPPER(vv_SearchedValue)
             UNION
             select site_id, user_id
               from emdba.em_user_t u
              where u.user_logon = UPPER(vv_SearchedValue)
                and u.user_id not in (select ud2.user_id
                                        from emdba.em_user_t_deltd ud2 );
       ELSIF p_FindBy = 'USER_ID' THEN
            -- 2.1
            vn_SearchedValue := TO_NUMBER(p_SearchedValue);
            -- 2.2
             select 9999, user_id
               into v_SiteID, v_UserID
               from emdba.em_user_t_deltd ud
              where ud.user_id = vn_SearchedValue
              UNION
             select site_id, user_id
               from emdba.em_user_t u
              where u.user_id = vn_SearchedValue
                and u.user_id not in (select ud2.user_id
                                        from emdba.em_user_t_deltd ud2 );
       END IF;
       htp.p('<ROW>
                    <SITE_ID>'||v_SiteID||'</SITE_ID>
                    <USER_ID>'||v_UserID||'</USER_ID>
              </ROW>');
--------------------------------------------------------------------------------
END sp_getSite;
--==============================================================================
PROCEDURE em_getDestinationSites
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
               OR a.area = ''0''
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
END em_getDestinationSites;
--==============================================================================
--==============================================================================


PROCEDURE em_getDeletedUsersList(pAppUserID IN NUMBER
                                ,pOrderBy   IN VARCHAR2
                                ,pAscDesc   IN VARCHAR2)
IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD (   user_id         NUMBER,
                                last_name       VARCHAR2(20),
                                first_name      VARCHAR2(20),
                                middle_name     VARCHAR2(10),
                                max_str_length  NUMBER,
                                user_logon      VARCHAR2(20),
                                role_code       CHAR(2),
                                presented_role  VARCHAR2(50),
                                active_flag     CHAR(1),
                                presented_active_flag VARCHAR2(50),
                                area_cd         VARCHAR2(2),
                                district_code   VARCHAR2(3),
                                last_logon_dt   VARCHAR2(30)
                             );

v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;

--v_Counter   NUMBER DEFAULT 0;
v_StrLength NUMBER DEFAULT 0;

v_OrderBy VARCHAR2(20) DEFAULT 'last_name';
v_AscDesc VARCHAR2(4)  DEFAULT 'ASC';

--v_UserRoleID CHAR(2);
--------------------------------------------------------------------------------
BEGIN
--- 1.--------------------------------------------------------------------------
        select Max(Length(
                            NVL(TRIM(u1.first_name),'')||
                            NVL(TRIM(u1.last_name),'')||
                            NVL(TRIM(u1.middle_name),'')
               ))
          into v_StrLength
          from emdba.em_user_t_deltd u1;
--- 2. -------------------------------------------------------------------------
v_OrderBy := pOrderBy;
v_AscDesc := pAscDesc;
--- 3. -------------------------------------------------------------------------
    v_SQL :=
'select u2.user_id                     as user_id, '      ||
       'NVL(Trim(u2.last_name),'''' )  as last_name, '    ||
       'NVL(Trim(u2.first_name),'''')  as first_name, '   ||
       'NVL(Trim(u2.middle_name),'''') as middle_name, '  ||
       v_StrLength||'                  as pad_length, '   ||
       'u2.user_logon                  as user_logon, '   ||
       'u2.role_code                   as role_code, '    ||
       '(select REPLACE(role_desc,''ADMINISTRATOR'',''ADMIN'') from emdba.em_user_role_code_t r where r.role_code = u2.role_code) as presented_role, '||
       'u2.active_flag                 as active_flag , ' ||
       'DECODE(u2.active_flag,''A'',''A'',''I'',''I'',''D'',''D'',null,''I'') as presented_active_flag, '||
       'NVL(u2.area_cd, ''-1'')        as area_cd, '      ||
       'NVL(u2.district_code, ''-1'')  as district_code, '||
       'NVL(to_char(u2.last_logon_dt, ''MON-DD-YYYY HH24:MI''),''Not available'') as last_logon_dt '||
  'from emdba.em_user_t_deltd u2 '||
 'order by '||v_OrderBy||' '||v_AscDesc;

--- 4. -------------------------------------------------------------------------
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;

            htp.p('<ROW>
                     <USER_ID>'              ||r_Record.user_id          ||'</USER_ID>
                     <LAST_NAME>'            ||r_Record.last_name        ||'</LAST_NAME>
                     <FIRST_NAME>'           ||r_Record.first_name       ||'</FIRST_NAME>
                     <MIDDLE_NAME>'          ||r_Record.middle_name      ||'</MIDDLE_NAME>
                     <MAX_STR_LENGTH>'       ||r_Record.max_str_length   ||'</MAX_STR_LENGTH>
                     <USER_LOGON>'           ||r_Record.user_logon       ||'</USER_LOGON>
                     <ROLE_CODE>'            ||r_Record.role_code        ||'</ROLE_CODE>
                     <PRESENTED_ROLE>'       ||r_Record.presented_role   ||'</PRESENTED_ROLE>
                     <ACTIVE_FLAG>'          ||r_Record.active_flag      ||'</ACTIVE_FLAG>
                     <PRESENTED_ACTIVE_FLAG>'||r_Record.presented_active_flag||'</PRESENTED_ACTIVE_FLAG>
                     <AREA_CD>'              ||r_Record.area_cd          ||'</AREA_CD>
                     <DISTRICT_CODE>'        ||r_Record.district_code    ||'</DISTRICT_CODE>
                     <LAST_LOGON_DT>'        ||r_Record.last_logon_dt    ||'</LAST_LOGON_DT>
                   </ROW><br />');

        END LOOP;
    CLOSE c_AvailableRecords;
htp.p('</ROWSET>');
--------------------------------------------------------------------------------
 -- Table: ms47.ms47_sp_error_log
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_USER_AFFILIATION.em_getDeletedUsersList'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );
--------------------------------------------------------------------------------


END em_getDeletedUsersList;

--==============================================================================
--==============================================================================
PROCEDURE em_getAllSites
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
/*
SELECT MAX(LENGTH( REGEXP_REPLACE(site_name, '[^][A-Z]', ' ') ))
  INTO v_SiteName_MaxLen
  FROM emdba.em_site_t
 --WHERE site_status_code = 'A'
 ;
*/
v_SiteName_MaxLen := 25;


 v_SQL := 'SELECT a.site_id,
                  ''(''||LPAD(to_char(a.site_id), 3)||'')''||
                  LPAD(REGEXP_REPLACE(site_name, ''[^][A-Z]'', '' ''),'||v_SiteName_MaxLen||')||'' - ''||a.state as site_name_show
             FROM emdba.em_site_t a
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
END em_getAllSites;
--==============================================================================
----============================================================================

PROCEDURE em_getUserList(pAppUserID IN NUMBER
                        ,pSite_ID   IN NUMBER
                        ,pOrderBy   IN VARCHAR2
                        ,pAscDesc   IN VARCHAR2)
IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD (   user_id         NUMBER,
                                last_name       VARCHAR2(20),
                                first_name      VARCHAR2(20),
                                middle_name     VARCHAR2(10),
                                max_str_length  NUMBER,
                                user_logon      VARCHAR2(20),
                                role_code       CHAR(2),
                                presented_role  VARCHAR2(50),
                                active_flag     CHAR(1),
                                presented_active_flag VARCHAR2(50),
                                area_cd         VARCHAR2(2),
                                district_code   VARCHAR2(3),
                                last_logon_dt   VARCHAR2(30)
                             );

v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;

--v_Counter     NUMBER DEFAULT 0;
v_StrLength NUMBER DEFAULT 0;
--v_StrLength_2 NUMBER DEFAULT 0;

v_OrderBy VARCHAR2(20) DEFAULT 'last_name';
v_AscDesc VARCHAR2(4)  DEFAULT 'ASC';

v_UserRoleID CHAR(2);
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------
    select Max(Length(
                        NVL(TRIM(u1.first_name),'')||
                        NVL(TRIM(u1.last_name),'')||
                        NVL(TRIM(u1.middle_name),'')
           ))
      into v_StrLength
      from emdba.em_user_t u1, emdba.em_user_t_deltd u2
     where u1.site_id = u2.site_id(+)
       and u1.site_id = pSite_ID;

--------------------------------------------------------------------------------
v_OrderBy := pOrderBy;
v_AscDesc := pAscDesc;
--- 1.6 ------------------------------------------------------------------------

    v_SQL :=
'select '||
       'u1.user_id                     as user_id, '      ||
       'NVL(Trim(u1.last_name),'''')   as last_name, '    ||
       'NVL(Trim(u1.first_name),'''')  as first_name, '   ||
       'NVL(Trim(u1.middle_name),'''') as middle_name, '  ||
       v_StrLength||'                  as pad_length, '   ||
       'u1.user_logon                  as user_logon, '   ||
       'u1.role_code                   as role_code, '    ||
       '(select role_desc from emdba.em_user_role_code_t r where r.role_code = u1.role_code) as presented_role, '||
       'u1.active_flag                 as active_flag , ' ||
       'DECODE(u1.active_flag,''A'',''A'',''I'',''I'',''D'',''I'',null,''I'') as presented_active_flag, '||
       'NVL(u1.area_cd, ''-1'')        as area_cd, '      ||
       'NVL(u1.district_code, ''-1'')  as district_code, '||
       'NVL(to_char(u1.last_logon_dt, ''MON-DD-YYYY HH24:MI''),''Not available'') as last_logon_dt '||
  'from emdba.em_user_t u1 '||
'where u1.site_id = '||pSite_ID||' '||
'UNION '||
'select u2.user_id                     as user_id, '    ||
       'NVL(Trim(u2.last_name),'''' )  as last_name, '  ||
       'NVL(Trim(u2.first_name),'''')  as first_name, ' ||
       'NVL(Trim(u2.middle_name),'''') as middle_name, '||
       v_StrLength||'                as pad_length, '   ||
       'u2.user_logon                  as user_logon, ' ||
       'u2.role_code                   as role_code, '  ||
       '(select REPLACE(role_desc,''ADMINISTRATOR'',''ADMIN'') from emdba.em_user_role_code_t r where r.role_code = u2.role_code) as presented_role, '||
       'u2.active_flag                 as active_flag , ' ||
       'DECODE(u2.active_flag,''A'',''A'',''I'',''I'',''D'',''I'',null,''I'') as presented_active_flag, '||
       'NVL(u2.area_cd, ''-1'')        as area_cd, '      ||
       'NVL(u2.district_code, ''-1'')  as district_code, '||
       'NVL(to_char(u2.last_logon_dt, ''MON-DD-YYYY HH24:MI''),''Not available'') as last_logon_dt '||
  'from emdba.em_user_t_deltd u2 '||
 'where u2.site_id = '||pSite_ID||' '||
 'order by '||v_OrderBy||' '||v_AscDesc
 ;

--------------------------------------------------------------------------------
v_ERROR_POS := 'loop starts';
--------------------------------------------------------------------------------
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;

            htp.p('<ROW>
                     <USER_ID>'              ||r_Record.user_id          ||'</USER_ID>
                     <LAST_NAME>'            ||r_Record.last_name        ||'</LAST_NAME>
                     <FIRST_NAME>'           ||r_Record.first_name       ||'</FIRST_NAME>
                     <MIDDLE_NAME>'          ||r_Record.middle_name      ||'</MIDDLE_NAME>
                     <MAX_STR_LENGTH>'       ||r_Record.max_str_length   ||'</MAX_STR_LENGTH>
                     <USER_LOGON>'           ||r_Record.user_logon       ||'</USER_LOGON>
                     <ROLE_CODE>'            ||r_Record.role_code        ||'</ROLE_CODE>
                     <PRESENTED_ROLE>'       ||r_Record.presented_role   ||'</PRESENTED_ROLE>
                     <ACTIVE_FLAG>'          ||r_Record.active_flag      ||'</ACTIVE_FLAG>
                     <PRESENTED_ACTIVE_FLAG>'||r_Record.presented_active_flag||'</PRESENTED_ACTIVE_FLAG>
                     <AREA_CD>'              ||r_Record.area_cd          ||'</AREA_CD>
                     <DISTRICT_CODE>'        ||r_Record.district_code    ||'</DISTRICT_CODE>
                     <LAST_LOGON_DT>'        ||r_Record.last_logon_dt    ||'</LAST_LOGON_DT>
                   </ROW><br />');

        END LOOP;
    CLOSE c_AvailableRecords;
htp.p('</ROWSET>');

--------------------------------------------------------------------------------
 -- Table: ms47.ms47_sp_error_log
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_SECURITY_PKG.em_getUserList'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );
--------------------------------------------------------------------------------

END em_getUserList;


/*
PROCEDURE em_getUserList(pAppUserID IN NUMBER
                        ,pSite_ID   IN NUMBER
                        ,pOrderBy   IN VARCHAR2
                        ,pAscDesc   IN VARCHAR2)
IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD (   user_id         NUMBER,
                                last_name       VARCHAR2(20),
                                first_name      VARCHAR2(20),
                                middle_name     VARCHAR2(10),
                                max_str_length  NUMBER,
                                user_logon      VARCHAR2(20),
                                role_code       CHAR(2),
                                presented_role  VARCHAR2(50),
                                active_flag     CHAR(1),
                                presented_active_flag VARCHAR2(50),
                                area_cd         VARCHAR2(2),
                                district_code   VARCHAR2(3),
                                last_logon_dt   VARCHAR2(30)
                             );

v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;

--v_Counter     NUMBER DEFAULT 0;
v_StrLength NUMBER DEFAULT 0;
--v_StrLength_2 NUMBER DEFAULT 0;

v_OrderBy VARCHAR2(20) DEFAULT 'last_name';
v_AscDesc VARCHAR2(4)  DEFAULT 'ASC';

v_UserRoleID CHAR(2);
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------
    select Max(Length(
                        NVL(TRIM(u1.first_name),'')||
                        NVL(TRIM(u1.last_name),'')||
                        NVL(TRIM(u1.middle_name),'')
           ))
      into v_StrLength
      from emdba.em_user_t u1, emdba.em_user_t_deltd u2
     where u1.site_id = u2.site_id(+)
       and u1.site_id = pSite_ID;

--------------------------------------------------------------------------------
v_OrderBy := pOrderBy;
v_AscDesc := pAscDesc;
--- 1.6 ------------------------------------------------------------------------

    v_SQL :=
'select '||
       'u1.user_id                     as user_id, '      ||
       'NVL(Trim(u1.last_name),'''')   as last_name, '    ||
       'NVL(Trim(u1.first_name),'''')  as first_name, '   ||
       'NVL(Trim(u1.middle_name),'''') as middle_name, '  ||
       v_StrLength||'                  as pad_length, '   ||
       'u1.user_logon                  as user_logon, '   ||
       'u1.role_code                   as role_code, '    ||
       '(select role_desc from emdba.em_user_role_code_t r where r.role_code = u1.role_code) as presented_role, '||
       'u1.active_flag                 as active_flag , ' ||
       'DECODE(u1.active_flag,''A'',''A'',''I'',''I'',''D'',''I'',null,''I'') as presented_active_flag, '||
       'NVL(u1.area_cd, ''-1'')        as area_cd, '      ||
       'NVL(u1.district_code, ''-1'')  as district_code, '||
       'NVL(to_char(u1.last_logon_dt, ''MON-DD-YYYY HH24:MI''),''Not available'') as last_logon_dt '||
  'from emdba.em_user_t u1 '||
'where u1.site_id = '||pSite_ID||' '||
'UNION '||
'select u2.user_id                     as user_id, '    ||
       'NVL(Trim(u2.last_name),'''' )  as last_name, '  ||
       'NVL(Trim(u2.first_name),'''')  as first_name, ' ||
       'NVL(Trim(u2.middle_name),'''') as middle_name, '||
       v_StrLength||'                as pad_length, '   ||
       'u2.user_logon                  as user_logon, ' ||
       'u2.role_code                   as role_code, '  ||
       '(select REPLACE(role_desc,''ADMINISTRATOR'',''ADMIN'') from emdba.em_user_role_code_t r where r.role_code = u2.role_code) as presented_role, '||
       'u2.active_flag                 as active_flag , ' ||
       'DECODE(u2.active_flag,''A'',''A'',''I'',''I'',''D'',''I'',null,''I'') as presented_active_flag, '||
       'NVL(u2.area_cd, ''-1'')        as area_cd, '      ||
       'NVL(u2.district_code, ''-1'')  as district_code, '||
       'NVL(to_char(u2.last_logon_dt, ''MON-DD-YYYY HH24:MI''),''Not available'') as last_logon_dt '||
  'from emdba.em_user_t_deltd u2 '||
 'where u2.site_id = '||pSite_ID||' '||
 'order by '||v_OrderBy||' '||v_AscDesc
 ;

--------------------------------------------------------------------------------
v_ERROR_POS := 'loop starts';
--------------------------------------------------------------------------------
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;

            htp.p('<ROW>
                     <USER_ID>'              ||r_Record.user_id          ||'</USER_ID>
                     <LAST_NAME>'            ||r_Record.last_name        ||'</LAST_NAME>
                     <FIRST_NAME>'           ||r_Record.first_name       ||'</FIRST_NAME>
                     <MIDDLE_NAME>'          ||r_Record.middle_name      ||'</MIDDLE_NAME>
                     <MAX_STR_LENGTH>'       ||r_Record.max_str_length   ||'</MAX_STR_LENGTH>
                     <USER_LOGON>'           ||r_Record.user_logon       ||'</USER_LOGON>
                     <ROLE_CODE>'            ||r_Record.role_code        ||'</ROLE_CODE>
                     <PRESENTED_ROLE>'       ||r_Record.presented_role   ||'</PRESENTED_ROLE>
                     <ACTIVE_FLAG>'          ||r_Record.active_flag      ||'</ACTIVE_FLAG>
                     <PRESENTED_ACTIVE_FLAG>'||r_Record.presented_active_flag||'</PRESENTED_ACTIVE_FLAG>
                     <AREA_CD>'              ||r_Record.area_cd          ||'</AREA_CD>
                     <DISTRICT_CODE>'        ||r_Record.district_code    ||'</DISTRICT_CODE>
                     <LAST_LOGON_DT>'        ||r_Record.last_logon_dt    ||'</LAST_LOGON_DT>
                   </ROW><br />');

        END LOOP;
    CLOSE c_AvailableRecords;
htp.p('</ROWSET>');

--------------------------------------------------------------------------------
 -- Table: ms47.ms47_sp_error_log
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_SECURITY_PKG.em_getUserList'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );
--------------------------------------------------------------------------------

END em_getUserList;
*/
----============================================================================
----============================================================================
PROCEDURE em_transferUser(p_SourceSiteID VARCHAR2
                         ,p_UserID       NUMBER
                         ,p_DestinationSiteID NUMBER
                         ,p_AppUser      NUMBER)
IS

v_SourceSiteID NUMBER;
v_UserRole     VARCHAR2(10);
v_RoleCode     VARCHAR(2);

v_UserLogon VARCHAR2(16);
v_Counter   NUMBER;
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------
-- "9999" means user was selected from the "REPOSITORY OF DELETED USERS"
-- "9999" is NOT a meaningful ID, it created just to populate on screen AllSite select box
IF p_SourceSiteID = '9999' THEN
    delete emdba.em_user_t
    where user_id = p_UserID;

insert into emdba.em_user_t
       (
       site_id,
       user_id,
       role_code,
       network_name,user_password,pass_exp_dt,active_flag,
       user_comment,last_logon_dt,planner,compose,vendors,office,notes,crew,
       workorder,reactive,pm,equipment,inventory,comp_act,schedule,psds,
       manager,issue,receive,catadj,misp,purchase,report,utility,code_tables,
       admin,orders,toolboxes,first_name,middle_name,last_name,email_address,tel_no1,tel_no2,
       user_logon,
       create_date,create_user,mod_date,mod_user,area_cd,note_flag,whep,
       ecbm,ms47,eas_roq,loantools,whep_submitter,whep_approver,
       ms47_submitter,ms47_approver,staffing,district_code
       )
select p_DestinationSiteID, -- <--- site_id could be different from the original in the table "emdba.em_user_t_deltd".
       user_id,
       'MU',-- <--- role_code could be different from the original in the table "emdba.em_user_t_deltd".
       network_name,user_password,pass_exp_dt,active_flag,
       user_comment,last_logon_dt,planner,compose,vendors,office,notes,crew,
       workorder,reactive,pm,equipment,inventory,comp_act,schedule,psds,
       manager,issue,receive,catadj,misp,purchase,report,utility,code_tables,
       admin,orders,toolboxes,first_name,middle_name,last_name,email_address,tel_no1,tel_no2,
       substr(user_logon,1,6), --<--- removing the 7th char in user_logon, that was created to provide different access level to the same person
       create_date,create_user,mod_date,mod_user,area_cd,note_flag,whep,
       ecbm,ms47,eas_roq,loantools,whep_submitter,whep_approver,
       ms47_submitter,ms47_approver,staffing,district_code
  from emdba.em_user_t_deltd ud
 where ud.user_id = p_UserID;

ELSE
    SELECT substr(u.user_logon,1,6)
      INTO v_UserLogon
      FROM emdba.em_user_t u
     WHERE u.user_id = p_UserID;

    update emdba.em_user_t
       set site_id     = p_DestinationSiteID,
           schedule    = 'N',
           comp_act    = 'N',
           report      = 'N',
           workorder   = 'N',
           admin       = 'N',
           staffing    = 'N',
           pm          = 'N',
           reactive    = 'N',
           equipment   = 'N',
           crew        = 'N',
           code_tables = 'N',
           ecbm        = 'N',
           catadj      = 'N',
           orders      = 'N',
           issue       = 'N',
           toolboxes   = 'N',
           vendors     = 'N',
           compose     = 'N',
           purchase    = 'N',
           misp        = 'N',
           receive     = 'N',
           office      = 'N',
           loantools   = 'N',
           inventory   = 'Y',
           user_logon  = v_UserLogon,
           mod_date    = sysdate,
           mod_user    = p_AppUser,
           role_code   = 'MU',
           area_cd     = NULL,
           district_code = NULL,
           active_flag   = 'A'
     where user_id       = p_UserID;

END IF;
--------------------------------------------------------------------------------
    delete emdba.em_user_t_deltd
     where user_id = p_UserID;

    delete emdba.em_security_access_t
     where user_id = p_UserID;
--------------------------------------------------------------------------------
    COMMIT;
--------------------------------------------------------------------------------
    select Count(*)
      into v_Counter
      from emdba.em_user_t
     where user_id = p_UserID;
       htp.p('<ROW>
                    <COUNTER>'||v_Counter||'</COUNTER>
              </ROW>');


--------------------------------------------------------------------------------
END em_transferUser;
--==============================================================================
   -- Enter further code below as specified in the Package spec.
END EM_USER_AFFILIATION_PKG;
/
