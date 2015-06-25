CREATE OR REPLACE PACKAGE EM_EQUIP_TRANSFER_S1
  IS
--==============================================================================
/*
Brief DESCRIPTION of Equipment Transfer (ET):

The following objects/files involve in ET process:
-   Screen name:        EM_EQUIP_TRANSFER_S1
-   JavaScript file:    EM_EQUIP_TRANSFER_S1.js
-   Stored Procedure:   EMAPP.EM_EQUIP_TRANSFER_S1

Prior to Transferring Equipment, user has to open "Equipment" module
and change Condition Code to "D-IDENTIFIED FOR RELOCATION" for the
equipment that has to be transferred.
The screen "Equipment Transfer" is available in System Administrator's Menu.
The screen is divided in two parts: on the left - SOURCE, and on the right - DESTINATION.
Process is sequential and identified by Steps: 1 through 9.
Controls on the front-end interact based on parent-child dependencies.

"Step 4" provides a list of Class Code linked to Equipment Number
for the equipment which Condition Code is "D-IDENTIFIED FOR RELOCATION".

SP "EMAPP.EM_EQUIP_TRANSFER_S1" prepares data for the screen and "transfers" equipment.
This process is governed by the following rules:
1.  Acronym of the DESTINATION site must be the same as an acronym of the SOURCE site.
    It is achieved through the structure of the tables, specifically EMDBA.EM_ACRONYM_T.
    This table links columns SITE_ID and ACRONYM creating identical number of
    records for every active site.
2.  Details of relations between tables EMBDA.EM_ACRONYM_T and EMDBA.EM_EQUIPMENT_T
    are specified in WHERE clause of the select statements.
3.  Work orders related to the equipment to be transferred are also transferred
    from the SOURCE site to the DESTINATION.  There is a specific record set in
    this process as well.  Table EMDBA.EM_REGISTER_T links SITE_ID and REG_NO
    creating identical number of combination of those columns; Fiscal Year (FY)
    may differ, but not SITE_ID and REG_NO.
*/

--==============================================================================
  -- Author  : SERGEY SURIKOV
  -- Created : 5/31/2012
  -- Purpose : Data Equipment Transfer. Step1
  -- Public variable declarations
v_ERROR_POS VARCHAR2(100)   default 'NOT DEFINED';
v_sqlerrm   VARCHAR2(1000);
v_sqlcode   VARCHAR2(1000);

--==============================================================================
PROCEDURE em_getAllSites;
--==============================================================================
PROCEDURE sp_getSubsites(p_SiteID IN EMDBA.em_site_t.site_id%TYPE);
--==============================================================================
PROCEDURE sp_getFacilities( p_SiteID    IN EMDBA.em_site_t.site_id%TYPE
                           ,p_SubSiteID IN EMDBA.em_subsite_facility_t.subsite_id%TYPE);
--==============================================================================
PROCEDURE sp_getAcronyms( p_SiteID    IN EMDBA.em_site_t.site_id%TYPE
                         ,p_SubSiteID IN EMDBA.em_subsite_facility_t.subsite_id%TYPE
                         ,p_SourceOrDestination IN VARCHAR2
                         ,p_SourceAcronym IN EMDBA.em_acronym_t.ACRONYM%TYPE);
--==============================================================================
PROCEDURE sp_getSourceEquipment( p_SiteID    IN EMDBA.em_site_t.site_id%TYPE
                                ,p_SubSiteID IN EMDBA.em_subsite_facility_t.subsite_id%TYPE
                                ,p_Acronym   IN EMDBA.em_acronym_t.acronym%TYPE);
--==============================================================================
PROCEDURE sp_getDestinationEquipment( p_SiteID    IN EMDBA.em_site_t.site_id%TYPE
                                     ,p_SubSiteID IN EMDBA.em_subsite_facility_t.subsite_id%TYPE
                                     ,p_Acronym   IN EMDBA.em_acronym_t.acronym%TYPE);
--==============================================================================
PROCEDURE sp_transferEquipment_2(p_currentUser         IN EMDBA.em_user_t.user_id%TYPE  -- NUMBER
                                ,p_SourceSites         IN EMDBA.em_site_t.site_id%TYPE                 -- NUMBER
                                ,p_SourceEquipment     IN EMDBA.Em_Prop_Tran_Request.SOURCE_EQUIPMENT_PTR%TYPE -- NUMBER
                                ,p_DestinationSites    IN EMDBA.em_site_t.site_id%TYPE                 -- NUMBER
                                ,p_DestinationSubsites IN EMDBA.em_subsite_facility_t.subsite_id%TYPE  -- VARCHAR2(2)
                                ,p_WhepFacilityID      IN EMDBA.em_subsite_facility_t.whep_fac_id%TYPE -- NUMBER
                                ,p_DestinationAcronyms IN EMDBA.em_acronym_t.acronym%TYPE              -- VARCHAR2(12)
                                ,p_RenameEquipment     IN EMDBA.em_equipment_t.equip_no%TYPE           -- VARCHAR2(10)
                              );
--==============================================================================
PROCEDURE sp_createEquipRelocRecord_2(p_Site_ID          IN NUMBER
                                     ,p_CurrentUser      IN NUMBER
                                     ,p_EquipmentPtr     IN NUMBER
                                     ,p_EquipCatPtr      IN NUMBER
                                     ,p_EquipmentAcronym IN VARCHAR2
                                     ,p_ConditionCode_Changed IN VARCHAR2);
--==============================================================================
PROCEDURE sp_updEquipRelocRecord(p_Site_ID         IN NUMBER
                                   ,p_CurrentUser     IN NUMBER
                                   ,p_DestEquipPtr    IN NUMBER
                                   ,p_DestEquipCatPtr IN NUMBER
                                   ,p_ConditionCode_Changed IN VARCHAR2);
--==============================================================================
PROCEDURE sp_validateDuplicates(p_Source_Equip_Ptr NUMBER);
--==============================================================================
PROCEDURE sp_getEquipIdentForReloc( p_Site_ID IN EMDBA.em_site_t.site_id%TYPE);  -- NUMBER
-- "EquipIdentForReloc" = Equipment Identified for Relocation
--==============================================================================
END EM_EQUIP_TRANSFER_S1;
--==============================================================================
/
CREATE OR REPLACE PACKAGE BODY EM_EQUIP_TRANSFER_S1
IS
--==============================================================================
PROCEDURE em_getAllSites
IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( site_id        emdba.em_site_t.site_id%TYPE   -- NUMBER
                             ,site_name_show emdba.em_site_t.site_name%TYPE -- VARCHAR2(50)
                             ,site_status_code emdba.em_site_t.site_status_code%TYPE -- VARCHAR2(1)
                            );

v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;

v_SiteName_MaxLen NUMBER DEFAULT 25;
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------

SELECT MAX(LENGTH( REGEXP_REPLACE(site_name, '[^][A-Z]', ' ') ))
  INTO v_SiteName_MaxLen
  FROM emdba.em_site_t
 --WHERE site_status_code = 'A'
 ;
 v_SQL := 'SELECT a.site_id,
                  ''(''||LPAD(to_char(a.site_id), 3)||'')''||
                  LPAD(REGEXP_REPLACE(site_name, ''[^][A-Z]'', '' ''),'||v_SiteName_MaxLen||')||'' - ''||a.state as site_name_show,
                  a.site_status_code
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
                       <SITE_NAME>'||r_Record.site_name_show||'</SITE_NAME>
                       <SITE_STATUS_CODE>'||r_Record.site_status_code||'</SITE_STATUS_CODE>'
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
PROCEDURE sp_getSubsites(p_SiteID IN EMDBA.em_site_t.site_id%TYPE)
IS
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( subsite_id emdba.em_subsite_facility_t.subsite_id%TYPE -- VARCHAR2(2)
                            );
v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;

BEGIN
    v_SQL :=
    'SELECT DISTINCT s.subsite_id
       FROM EM_SUBSITE_FACILITY_T s
      WHERE s.site_id = '||p_SiteID||' '||
     'ORDER BY s.subsite_id';
--------------------------------------------------------------------------------
-- 2:
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            htp.p('<ROW>'||
                       '<SUBSITE>' ||r_Record.subsite_id||'</SUBSITE>'
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

END sp_getSubsites;

--==============================================================================
PROCEDURE sp_getFacilities( p_SiteID    IN EMDBA.em_site_t.site_id%TYPE
                           ,p_SubSiteID IN EMDBA.em_subsite_facility_t.subsite_id%TYPE)
IS
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( whep_fac_id   emdba.em_subsite_facility_t.whep_fac_id%TYPE   -- NUMBER
                             ,facility_name emdba.em_subsite_facility_t.facility_name%TYPE --VARCHAR(64)
                            );
v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;

BEGIN
    v_SQL :=
    'SELECT sf.whep_fac_id, sf.facility_name
       FROM EMDBA.Em_Subsite_Facility_t sf
      WHERE sf.site_id = '||p_SiteID||' '||
       'AND sf.subsite_id = '''||p_SubSiteID||''' '||
     'ORDER BY sf.facility_name';
--------------------------------------------------------------------------------
-- 2:
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            htp.p('<ROW>'||
                       '<WHEP_FAC_ID>'  ||r_Record.whep_fac_id  ||'</WHEP_FAC_ID>
                        <FACILITY_NAME>'||r_Record.facility_name||'</FACILITY_NAME>'
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

END sp_getFacilities;

--==============================================================================
PROCEDURE sp_getAcronyms( p_SiteID    IN EMDBA.em_site_t.site_id%TYPE
                         ,p_SubSiteID IN EMDBA.em_subsite_facility_t.subsite_id%TYPE
                         ,p_SourceOrDestination IN VARCHAR2
                         ,p_SourceAcronym IN EMDBA.em_acronym_t.ACRONYM%TYPE) -- VARCHAR2(10)
IS
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( acronym emdba.em_acronym_t.acronym%TYPE -- VARCHAR2(12)
                            );
v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;

BEGIN
-- 1:
   IF p_SourceOrDestination = 'SOURCE' THEN
        v_SQL :=
       'SELECT DISTINCT a.acronym
          FROM emdba.em_acronym_t a
              ,emdba.em_equipment_t e
         WHERE a.site_id = '||p_SiteID||
         ' AND a.site_id = e.site_id
           AND a.equip_cat_ptr = e.equip_cat_ptr
           AND e.subsite_id = '''||p_SubSiteID||''''||
         ' AND e.condition_code = ''D''
           AND a.active_flag = ''A''
         ORDER BY a.acronym';

   ELSIF p_SourceOrDestination = 'DESTINATION' THEN
        v_SQL :=
       'SELECT distinct a.acronym
          FROM EMDBA.Em_Acronym_t a
         WHERE a.site_id = '||p_SiteID||
          'AND a.acronym = '''||p_SourceAcronym||'''';

   END IF;
--------------------------------------------------------------------------------
-- 2:
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            htp.p('<ROW>'||
                       '<ACRONYM>' ||r_Record.acronym||'</ACRONYM>'
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
END sp_getAcronyms;
--==============================================================================
PROCEDURE sp_getSourceEquipment( p_SiteID    IN EMDBA.em_site_t.site_id%TYPE
                                ,p_SubSiteID IN EMDBA.em_subsite_facility_t.subsite_id%TYPE
                                ,p_Acronym   IN EMDBA.em_acronym_t.acronym%TYPE)
IS
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( equipment_ptr emdba.em_equipment_t.equipment_ptr%TYPE -- NUMBER
                             ,equip_no   emdba.em_equipment_t.equip_no%TYPE -- VARCHAR2(10)
                             ,class_code emdba.em_acronym_t.class_code%TYPE -- VARCHAR2(2)
                            );
v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;
BEGIN
-- 1:
    v_SQL :=
   'SELECT DISTINCT e.equipment_ptr, e.equip_no, a.class_code
      FROM emdba.em_acronym_t a
          ,emdba.em_equipment_t e
     WHERE a.site_id = '||p_SiteID||
     ' AND a.site_id = e.site_id
       AND a.equip_cat_ptr = e.equip_cat_ptr
       AND e.subsite_id = '''||p_SubSiteID||''''||
     ' AND e.condition_code = ''D''
       AND a.acronym = '''||p_Acronym||''''||
   ' ORDER BY a.class_code, e.equip_no'
    ; --'AND e.equip_status_code = ''A''
--------------------------------------------------------------------------------
-- 2:
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            htp.p('<ROW>'||
                       '<EQUIP_PTR>' ||r_Record.equipment_ptr||'</EQUIP_PTR>'||
                       '<EQUIP_NO>'  ||r_Record.equip_no||'</EQUIP_NO>'||
                       '<CLASS_CODE>'||r_Record.class_code||'</CLASS_CODE>'||
                  '</ROW>');
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

END sp_getSourceEquipment;
--==============================================================================
PROCEDURE sp_getDestinationEquipment( p_SiteID    IN EMDBA.em_site_t.site_id%TYPE
                                     ,p_SubSiteID IN EMDBA.em_subsite_facility_t.subsite_id%TYPE
                                     ,p_Acronym   IN EMDBA.em_acronym_t.acronym%TYPE)
IS
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( equipment_ptr emdba.em_equipment_t.equipment_ptr%TYPE -- NUMBER
                             ,equip_no emdba.em_equipment_t.equip_no%TYPE -- VARCHAR2(10)
                             ,class_code emdba.em_acronym_t.class_code%TYPE -- VARCHAR2(2)
                            );
v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;
BEGIN
-- 1:
    v_SQL :=
   'SELECT DISTINCT e.equipment_ptr, e.equip_no, a.class_code
      FROM emdba.em_acronym_t a
          ,emdba.em_equipment_t e
     WHERE a.site_id = '||p_SiteID||
     ' AND a.site_id = e.site_id
       AND a.equip_cat_ptr = e.equip_cat_ptr
       AND e.subsite_id = '''||p_SubSiteID||''''||
     ' AND e.condition_code IN (''A'', ''B'') '||
    -- ' AND e.equip_status_code = ''A'' '||
     ' AND a.acronym = '''||p_Acronym||''''||
   ' ORDER BY a.class_code, e.equip_no '
    ;
--------------------------------------------------------------------------------
-- 2:
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            htp.p('<ROW>'||
                       '<EQUIP_PTR>' ||r_Record.equipment_ptr||'</EQUIP_PTR>'||
                       '<EQUIP_NO>'  ||r_Record.equip_no||'</EQUIP_NO>'||
                       '<CLASS_CODE>'||r_Record.class_code||'</CLASS_CODE>'||
                  '</ROW>');
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

END sp_getDestinationEquipment;
--==============================================================================

PROCEDURE sp_transferEquipment_2(p_currentUser         IN EMDBA.em_user_t.user_id%TYPE                 -- NUMBER
                                ,p_SourceSites         IN EMDBA.em_site_t.site_id%TYPE                 -- NUMBER
                                ,p_SourceEquipment     IN EMDBA.Em_Prop_Tran_Request.SOURCE_EQUIPMENT_PTR%TYPE -- NUMBER
                                ,p_DestinationSites    IN EMDBA.em_site_t.site_id%TYPE                 -- NUMBER
                                ,p_DestinationSubsites IN EMDBA.em_subsite_facility_t.subsite_id%TYPE  -- VARCHAR2(2)
                                ,p_WhepFacilityID      IN EMDBA.em_subsite_facility_t.whep_fac_id%TYPE -- NUMBER
                                ,p_DestinationAcronyms IN EMDBA.em_acronym_t.acronym%TYPE              -- VARCHAR2(12)
                                ,p_RenameEquipment     IN EMDBA.em_equipment_t.equip_no%TYPE           -- VARCHAR2(10)
                              )
IS

v_Dest_EquipmentPtr   EMDBA.Em_Equipment_t.EQUIPMENT_PTR%TYPE; -- NUMBER
v_Dest_EquipCatPtr    EMDBA.Em_Equipment_t.EQUIP_CAT_PTR%TYPE; -- NUMBER
v_Dest_Is_ECBM_Active VARCHAR2(1) DEFAULT 'N';
v_Dest_CrewID         VARCHAR2(3) DEFAULT '001';
v_Dest_Tour           NUMBER      DEFAULT 1;


v_SourceClassCode         EMDBA.em_acronym_t.CLASS_CODE%TYPE;      -- VARCHAR2(2)
v_SourceAcronyms          EMDBA.em_acronym_t.ACRONYM%TYPE;         -- VARCHAR2(12)
v_Source_Equipment_Ptr    EMDBA.em_equipment_t.equipment_ptr%TYPE DEFAULT p_SourceEquipment; -- NUMBER
v_Source_Equip_Cat_Ptr    EMDBA.em_equipment_t.equip_cat_ptr%TYPE; -- NUMBER
v_Source_Site_ID          NUMBER DEFAULT p_SourceSites;
v_Source_SubSite_ID       VARCHAR2(2) DEFAULT '00';
v_Source_New_Equip_No     EMDBA.em_equipment_t.equip_no%TYPE;      -- VARCHAR2(10);

v_RtnVal_CountEquipment   NUMBER;
v_RtnVal_CountWorkOrders  NUMBER;

BEGIN
-- I. EQUIPMENT TRANSFER:-------------------------------------------------------
-- 1.1 Obtain value of the Destination equipment pointer:
        SELECT EMDBA.em_equipment_ptr_seq.nextval
          INTO v_Dest_EquipmentPtr
          FROM dual
          ;
v_ERROR_POS:='1.1';
-- 1.2 Obtain value of the Source Acronym, Class Code:
        SELECT e.subsite_id, a.acronym, a.class_code
          INTO v_Source_SubSite_ID, v_SourceAcronyms, v_SourceClassCode
          FROM EMDBA.em_acronym_t a
              ,EMDBA.em_equipment_t e
         WHERE e.site_id       = v_Source_Site_ID
           AND e.equipment_ptr = v_Source_Equipment_Ptr
           AND e.equip_cat_ptr = a.equip_cat_ptr
         ;
v_ERROR_POS:='1.2';
-- 1.3 Obtain value of the Destination equipment category pointer:
          SELECT a.equip_cat_ptr
            INTO v_Dest_EquipCatPtr
            FROM EMDBA.em_acronym_t a
           WHERE a.site_id    = p_DestinationSites
             AND a.acronym    = p_DestinationAcronyms
             AND a.class_code = v_SourceClassCode
             ;
v_ERROR_POS:='1.3';
-- 2:  Insert a record related to a Destination site based on the data in the Source site

-- To prevent Unique Key vailation (EM_EQUIPMENT_T_UK: SITE_ID, SUBSITE_ID, EQUIP_CAT_PTR, EQUIP_NO, EQUIP_STATUS_CODE)
-- update the record if it exists by assigning prefix 'OLD_' to the Equipment Number:

        UPDATE emdba.em_equipment_t e
           SET e.equip_no = substr('OLD_'||e.equip_no,1,10)
         WHERE e.site_id           = p_DestinationSites
           AND e.subsite_id        = p_DestinationSubsites
           AND e.equip_cat_ptr     = v_Dest_EquipCatPtr
           AND e.equip_no          = UPPER(p_RenameEquipment)
           AND e.equip_status_code = 'I'
           ;
        COMMIT;
        
        INSERT INTO EMDBA.em_equipment_t e_to
          (site_id, equipment_ptr, equip_cat_ptr, subsite_id, equip_no, equip_status_code, subloc, serial_no,
           manufacturer, op_code, model, equip_comments, condition_date, service_life, condition_code, equip_size,
           equip_cost, war_exp_date, overhaul_by, insp_due_date, insp_hours, insp_freq_code, clean_lube_hours,
           route_hours, contract_no, cm_hours, aa_hours, capital_id, breakdown_freq, last_insp_date,
           hours_operated, create_date, create_user, mod_date, mod_user
           ,whep_fac_id --,refrig_type,phase
           )
        SELECT p_DestinationSites,           --1  site_id,
               v_Dest_EquipmentPtr,    --2  equipment_ptr,
               v_Dest_EquipCatPtr,     --3  equip_cat_ptr
               p_DestinationSubsites,        --4  subsite_id
               UPPER(p_RenameEquipment),     --5  equip_no
               'I',                          --6  equip_status_code
               e_from.subloc,                --7  subloc
               e_from.serial_no,             --8  serial_no
               e_from.manufacturer,          --9  manufacturer
               e_from.op_code,               --10 op_code
               e_from.model,                 --11 model
               e_from.equip_comments,        --12 equip_comments
               SYSDATE,                      --13 condition_date
               e_from.service_life,          --14 service_life
               'A',                          --15 condition_code;   means "Approved for Installation"
               e_from.equip_size,            --16 equip_size
               e_from.equip_cost,            --17 equip_cost
               e_from.war_exp_date,          --18 war_exp_date
               e_from.overhaul_by,           --19 overhaul_by
               e_from.insp_due_date,         --20 insp_due_date
               e_from.insp_hours,            --21 insp_hours
               e_from.insp_freq_code,        --22 insp_freq_code
               e_from.clean_lube_hours,      --23 clean_lube_hours
               e_from.route_hours,           --24 route_hours
               e_from.contract_no,           --25 contract_no
               e_from.cm_hours,              --26 cm_hours
               e_from.aa_hours,              --27 aa_hours
               e_from.capital_id,            --28 capital_id
               e_from.breakdown_freq,        --29 breakdown_freq
               e_from.last_insp_date,        --30 last_insp_date
               e_from.hours_operated,        --31 hours_operated
               SYSDATE,                      --32 create_date
               p_currentUser,                --33 create_user
               SYSDATE,                      --34 mod_date
               p_currentUser,                --35 mod_user
               p_WhepFacilityID              --36 whep_fac_id
               --e_from.refrig_type          --37 refrig_type
               --e_from.phase                --38 phase
         FROM emdba.em_equipment_t e_from
             --,emdba.em_acronym_t   a_from
        WHERE   e_from.site_id       = v_Source_Site_ID
            AND e_from.equipment_ptr = v_Source_Equipment_Ptr
          --AND e_from.subsite_id    = p_SourceSubsites
          --AND e_from.site_id       = a_from.site_id
          --AND e_from.equip_cat_ptr = a_from.equip_cat_ptr
          --AND e_from.condition_code= 'D' -- means 'Identified for relocation'
          --AND a_from.acronym       = v_SourceAcronyms
          --AND a_from.class_code    = v_SourceClassCode
          ;
v_ERROR_POS:='2';
-- 3: Update a record in the Source site to prevent appearence of this equipment as active.
-- 3.1 Create a new Equipment Number by adding preffiix "T-".

-- DECODE is needed since the length of some Equipment Names is 10 char. long, and in order to add "T-",
-- the length of the name should be shortened.
    SELECT DECODE(Length(e.equip_no),/*if*/   10,/*then*/'T-'||SUBSTR(e.equip_no,1,8)
                                    ,/*if*/   9,/*then*/ 'T-'||SUBSTR(e.equip_no,1,8)
                                    ,/*else*/'T-'||e.equip_no)
          ,e.equip_cat_ptr
      INTO v_Source_New_Equip_No
          ,v_Source_Equip_Cat_Ptr
      FROM EMDBA.em_equipment_t e
     WHERE e.site_id = v_Source_Site_ID
       AND e.equipment_ptr = v_Source_Equipment_Ptr;
       
v_ERROR_POS:='3.1';     

-- 3.2
    UPDATE EMDBA.em_equipment_t e_from
       SET equip_no = v_Source_New_Equip_No,
           condition_date = SYSDATE,
           condition_code = 'T', -- ("T" - Transfered. Used to be E-"Equipment removed")
           mod_date = SYSDATE,
           mod_user = p_currentUser
     WHERE e_from.site_id       = v_Source_Site_ID
       AND e_from.equipment_ptr = v_Source_Equipment_Ptr;
v_ERROR_POS:='3.2'; 
-- 3.3
    UPDATE EMDBA.Em_Route_t r
       SET r.equip_no = v_Source_New_Equip_No
        ,r.mod_date = sysdate
        ,r.mod_user = p_currentUser
     WHERE r.site_id       = v_Source_Site_ID
       AND r.equip_cat_ptr = v_Source_Equip_Cat_Ptr
       AND r.equipment_ptr = v_Source_Equipment_Ptr;
v_ERROR_POS:='3.3'; 
-- 3.4
    UPDATE EMDBA.Em_Route_History_t r
       SET r.equip_no = v_Source_New_Equip_No
          ,r.mod_date = sysdate
          ,r.mod_user = p_currentUser
     WHERE r.site_id = v_Source_Site_ID
       AND r.equip_cat_ptr = v_Source_Equip_Cat_Ptr
       AND r.equipment_ptr = v_Source_Equipment_Ptr;   
v_ERROR_POS:='3.4';  
-- 3.5
    UPDATE EMDBA.Em_Wo_t w
       SET w.equip_no = v_Source_New_Equip_No
          ,w.mod_date = sysdate
          ,w.mod_user = p_currentUser
     WHERE w.site_id       = v_Source_Site_ID
       AND w.equip_cat_ptr = v_Source_Equip_Cat_Ptr
       AND w.equipment_ptr = v_Source_Equipment_Ptr;
v_ERROR_POS:='3.5';       
-- 3.6
    UPDATE EMDBA.EM_WO_PM_QTY_COMP_T ew
       SET ew.equip_no = v_Source_New_Equip_No
          ,ew.mod_date = sysdate
          ,ew.mod_user = p_currentUser
     WHERE ew.site_id = v_Source_Site_ID
       AND ew.acronym = (select a.acronym
                           from EMDBA.Em_Acronym_t a
                          where a.site_id = ew.site_id
                            and a.site_id = v_Source_Site_ID
                            and a.equip_cat_ptr = v_Source_Equip_Cat_Ptr)
       AND ew.subsite_id = (select e.subsite_id
                              from EMDBA.Em_Equipment_t e
                             where e.site_id = ew.site_id
                               and e.site_id = v_Source_Site_ID
                               and e.equipment_ptr = v_Source_Equipment_Ptr);                         

v_ERROR_POS:='3.6'; 
-- 4:
COMMIT;
-----------------------------------------------------------------------------------------
-- Verifying number of records created in EMDBA.em_equipment_t:
SELECT Count(*)
  INTO v_RtnVal_CountEquipment
  FROM emdba.em_equipment_t e_to
 WHERE e_to.equipment_ptr = v_Dest_EquipmentPtr
 ;
v_ERROR_POS:='3.7'; 
-------------------------------------------------------------------------------------------
-- II. WORK ORDER TRANSFER: =============================================================
INSERT INTO EMDBA.em_wo_t
  (site_id, wo_ptr, reg_no, wo_no, modification_no, route_ptr, equip_cat_ptr, 
   equip_no, wo_type_code, wo_status, subsite_id, route_no, combine_id, 
   combine_comment, work_code, equipment_ptr, wo_desc, wo_comment, standing_flag,
   est_hours, priority_code, date_issued, hours_to_date, dept_code, date_due,
   react_id, date_closed, verb_code, noun_code,cause_code, material_cost, 
   labor_cost, last_checklist_item, checklist_date, pm_freq_code, labor_group, 
   hours_down_maint,hours_down_part, hours_down_other, show_schedule_yn, 
   period_ptr, route_reason, crew_id, checklist_no, requesting_person,project_id, 
   scheduled_date, create_date, create_user, mod_date, mod_user, combine_wono, 
   sched_day, whep_fac_id,ecbm_checklist_no, fssp_call_num, fssp_problem_num, 
   fssp_zip, tour, est_hours_due, fss_ma_id, past_due_reason_code)
SELECT  p_DestinationSites,          --1 site_id
        EMDBA.em_wo_ptr_seq.nextval, --2, wo_ptr
        reg_no,                      --3
        wo_no,                       --4
        modification_no,             --5
        route_ptr,                   --6
        v_Dest_EquipCatPtr,    --7 equip_cat_ptr
        p_RenameEquipment,           --8 equip_no
        wo_type_code,                --9
        wo_status,                   --10
        p_DestinationSubsites,       --11 subsite_id
        route_no,                    --12
        combine_id,                  --13
        combine_comment,             --14
        work_code,                   --15
        v_Dest_EquipmentPtr,   --16 equipment_ptr
        wo_desc,                     --17
        wo_comment,                  --18
        standing_flag,               --19
        est_hours,                   --20
        priority_code,               --21
        date_issued,                 --22
        hours_to_date,               --23
        dept_code,                   --24
        date_due,                    --25
        react_id,                    --26
        date_closed,                 --27
        verb_code,                   --28
        noun_code,                   --29
        cause_code,                  --30
        material_cost,               --31
        labor_cost,                  --32
        last_checklist_item,         --33
        checklist_date,              --34
        pm_freq_code,                --35
        labor_group,                 --36
        hours_down_maint,            --37
        hours_down_part,             --38
        hours_down_other,            --39
        show_schedule_yn,            --40
        period_ptr,                  --41
        route_reason,                --42
        '001', --crew_id,            --43
        checklist_no,                --44
        requesting_person,           --45
        project_id,                  --46
        scheduled_date,              --47
        w_from.create_date,          --48
        w_from.create_user,          --49
        w_from.mod_date,             --50
        w_from.mod_user,             --51
        combine_wono,                --52
        sched_day,                   --53
        p_WhepFacilityID,            --54
        ecbm_checklist_no,           --55
        fssp_call_num,               --56
        fssp_problem_num,            --57
        fssp_zip,                    --58
        tour,                        --59
        est_hours_due,               --60
        fss_ma_id,                   --61
        past_due_reason_code         --62
 FROM EMDBA.em_wo_t w_from
WHERE w_from.site_id = v_Source_Site_ID
  AND w_from.subsite_id = v_Source_SubSite_ID
  ---
  AND (SUBSTR(w_from.reg_no, 2,2) between '73' and '76' -- MWO,MSB,SMO,MMO for subsite 20
       OR 
       SUBSTR(w_from.reg_no, 2,2) between '83' and '86' -- MWO,MSB,SMO,MMO for subsite 50
       OR 
       SUBSTR(w_from.reg_no, 2,2) between '93' and '96' -- MWO,MSB,SMO,MMO for subsite 00
      )
  ---
  AND w_from.equipment_ptr = v_Source_Equipment_Ptr
  ---
   AND w_from.create_date between sysdate-180 and sysdate
   AND w_from.date_closed < w_from.mod_date
  ---
  --AND w_from.standing_flag = 'N' 
  ---
  AND ( w_from.hours_to_date is not NULL AND w_from.hours_to_date > 0 )
  ;
v_ERROR_POS:='3.8'; 
  COMMIT;

-----------------------------------------------------------------------------------------
-- verify number of records created in EMDBA.em_wo_t
SELECT Count(*)
  INTO v_RtnVal_CountWorkOrders
  FROM EMDBA.em_wo_t w_to
 WHERE w_to.site_id = p_DestinationSites
   AND w_to.subsite_id = p_DestinationSubsites
  ---
  AND (SUBSTR(w_to.reg_no, 2,2) between '73' and '76' -- MWO,MSB,SMO,MMO for subsite 20
       OR 
       SUBSTR(w_to.reg_no, 2,2) between '83' and '86' -- MWO,MSB,SMO,MMO for subsite 50
       OR 
       SUBSTR(w_to.reg_no, 2,2) between '93' and '96' -- MWO,MSB,SMO,MMO for subsite 00
      ) 
  ---
   AND w_to.equipment_ptr = v_Dest_EquipmentPtr
  ;
v_ERROR_POS:='9'; 
-----------------------------------------------------------------------------------------
-- III. PROPERTY TRANSFER REQUEST:
--/*
UPDATE emdba.em_prop_tran_request
   SET --prop_transf_req_ptr = v_prop_transf_req_ptr,
       --source_site_id = v_source_site_id,
       --source_subsite_id = v_source_subsite_id,
       --source_whep_fac_id = v_source_whep_fac_id,
       --source_equip_cat_ptr = v_source_equip_cat_ptr,
       --source_equipment_ptr = v_source_equipment_ptr,
       --source_capital_id = v_source_capital_id,
       --source_acronym = v_source_acronym,
       --source_class_code = v_source_class_code,
       --source_equipment_no = v_source_equipment_no,
       --source_finance_no = v_source_finance_no,
       --source_maint_mgr_person_id = v_source_maint_mgr_person_id,
       --source_transfer_dt = v_source_transfer_dt,
       dest_site_id       = p_DestinationSites,
       dest_subsite_id    = p_DestinationSubsites,
       dest_whep_fac_id   = (select ss.whep_fac_id
                               from emdba.em_subsite_facility_t ss
                              where ss.site_id = p_DestinationSites
                                and ss.subsite_default_yn = 'Y' ),
       dest_equip_cat_ptr = v_Dest_EquipCatPtr,
       dest_equipment_ptr = v_Dest_EquipmentPtr,
       dest_capital_id    = (select e.capital_id
                               from emdba.em_equipment_t e
                              where e.equipment_ptr = v_Dest_EquipmentPtr),
       dest_acronym       = p_DestinationAcronyms,
       dest_class_code    = v_SourceClassCode,
       dest_equipment_no  = p_RenameEquipment,
       dest_finance_no    = (select sf.finance_no
                               from emdba.em_subsite_facility_t sf
                              where sf.site_id = p_DestinationSites
                                and sf.subsite_default_yn = 'Y'),
       dest_maint_mgr_person_id = (select s.maint_mgr_person_id
                                     from emdba.em_site_t s
                                    where s.site_id = p_DestinationSites),

       --dest_received_dt = SYSDATE,
       --accountability_chang = v_accountability_chang,
       condition_code = (select e.condition_code
                           from emdba.em_equipment_t e
                          where e.equipment_ptr = v_Dest_EquipmentPtr),
       /*
       approve_transf_mgr_id  = (select s.maint_mgr_person_id
                                   from emdba.em_site_t s
                                  where s.site_id = p_DestinationSites),
       */
       /*
       approve_receive_mgr_id = (select s.maint_mgr_person_id
                                   from emdba.em_site_t s
                                  where s.site_id = p_DestinationSites),
       */
       approve_inv_ctrl_speclst = p_currentUser,
       --equip_activated_date = SYSDATE,
       transferred_equip_count = v_RtnVal_CountEquipment,
       transferred_wo_count = v_RtnVal_CountWorkOrders,
       ------------
       --tran_from_person_to_contact,
       tran_to_person_to_contact = (select s.maint_mgr
                                      from emdba.em_site_t s
                                     where s.site_id = p_DestinationSites),
       --approval_transf_officer,
       approval_receiving_officer = (select s.maint_mgr
                                      from emdba.em_site_t s
                                     where s.site_id = p_DestinationSites),
       ------------
       --create_date = v_create_date,
       --create_user = v_create_user,
       mod_date = SYSDATE,
       mod_user = p_currentUser
 WHERE prop_transf_req_ptr = (select t.prop_transf_req_ptr
                                from emdba.em_prop_tran_request t
                               where t.source_site_id = v_Source_Site_ID
                                 and t.source_equipment_ptr = v_Source_Equipment_Ptr);
v_ERROR_POS:='10'; 
COMMIT;
--------------------------------------------------------------------------------
-- IV. CREATE PM routes if ACRONYM+ClassCode are ECBM_active
-- IV.1:
       SELECT a.ecbm_active
         INTO v_Dest_Is_ECBM_Active  
         FROM EMDBA.Em_Acronym_t a
             ,EMDBA.Em_Equipment_t e
        WHERE a.site_id       = e.site_id
          AND a.equip_cat_ptr = e.equip_cat_ptr
          AND a.site_id       = p_DestinationSites 
          AND a.equip_cat_ptr = v_Dest_EquipCatPtr
          AND e.equipment_ptr = v_Dest_EquipmentPtr;
v_ERROR_POS:='11'; 
-- IV.2:
       IF v_Dest_Is_ECBM_Active = 'Y' THEN
           SELECT c.crew_id, c.tour
             INTO v_Dest_CrewID, v_Dest_Tour -- Values should be '001' and 2
             FROM EMDBA.Em_Crew_t c
            WHERE c.site_id = p_DestinationSites
              AND rownum = 1
            ORDER BY c.crew_id;
           
           INSERT INTO EMDBA.em_route_t
                    (route_ptr,
                     subsite_id,
                     work_code,
                     site_id,
                     pm_freq_code,
                     route_no,
                     labor_group_code,
                     route_status_code,
                     sched_ap,
                     sched_wk,
                     sched_day,
                     tour,
                     crew_id,
                     est_hours,
                     rsr_code,
                     checklist_type_code,
                     checklist_no,
                     labor_class_code,
                     equip_cat_ptr,
                     equip_no,
                     equipment_ptr,
                     pm_comments,
                     emp_level_code,
                     create_date,
                     create_user,
                     mod_date,
                     mod_user,
                     effective_status,
                     ecbm_active)
           VALUES          
                    (em_route_ptr_seq.nextval, --route_ptr
                     p_DestinationSubsites,    --subsite_id
                     '03',                     --work_code
                     p_DestinationSites,       --site_id
                     'D',                      --pm_freq_code
                     '1',                      --route_no
                     'A',                      --labor_group_code
                     'I',                      --route_status_code
                     '1111111111111',          --sched_ap
                     '1111',                   --sched_wk
                     '1111111',                --sched_day
                     v_Dest_Tour,              --tour
                     v_Dest_CrewID,            --crew_id
                     '0',                      --est_hours
                     'A',                      --rsr_code
                     'M',                      --checklist_type_code
                     '001',                    --checklist_no
                     'B',                      --labor_class_code
                     v_Dest_EquipCatPtr,       --equip_cat_ptr
                     UPPER(p_RenameEquipment), --equip_no
                     v_Dest_EquipmentPtr,      --equipment_ptr
                     'eMARS-created eCBM-active route', --pm_comments
                     '04',                     -- emp_level_code
                     sysdate,                  --create_date
                     p_currentUser,            --create_user
                     sysdate,                  --mod_date
                     p_currentUser,            --mod_user
                     'A',                      --effective_status
                     'Y');                     --ecbm_active
v_ERROR_POS:='12'; 
           COMMIT;
       -- ELSE No records have to be created.
       END IF;

--------------------------------------------------------------------------------
-- V. Return values to the front-end (EM_EQUIP_TRANSFER_S1.js):
htp.p('<?xml version="1.0"?><ROWSET>');
            htp.p('<ROW>'||
                    '<DEST_EQUIP_PTR>'||v_Dest_EquipmentPtr||'</DEST_EQUIP_PTR>'||
                    '<EQUIPMENT>'     ||v_RtnVal_CountEquipment||'</EQUIPMENT>'||
                    '<WORKORDER>'     ||v_RtnVal_CountWorkOrders||'</WORKORDER>'||
                  '</ROW>');
htp.p('</ROWSET>');
--------------------------------------------------------------------------------
-- Table: SELECT * FROM ms47.ms47_sp_error_log ORDER BY 1;
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_EQUIP_TRANSFER_S1.sp_transferEquipment_2'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );
--------------------------------------------------------------------------------
END sp_transferEquipment_2;
--==============================================================================
--==============================================================================
PROCEDURE sp_createEquipRelocRecord_2(p_Site_ID        IN NUMBER
                                   ,p_CurrentUser      IN NUMBER
                                   ,p_EquipmentPtr     IN NUMBER
                                   ,p_EquipCatPtr      IN NUMBER
                                   ,p_EquipmentAcronym IN VARCHAR2
                                   ,p_ConditionCode_Changed IN VARCHAR2)
--
-- This procedure is called from the screen "EQUIPMENT" in "EM_EQUIP_INV_001.js"
-- within function "doSave()" if user changed
-- 'Condition Code' to 'D - Identified for Relocation'.
-- Record is created in the table 'EMDBA.em_prop_transfer_request_t'.
-- At this moment only source information is available.
-- The rest of the values in any record will be available on the screen "Equipment Transfer".
IS
---------------------------------------------------------------------------------
v_Prop_Transf_Req_Ptr NUMBER DEFAULT NULL; -- Represent a new Equipment Property Transfer Request pointer for the
                                           -- equipment that marked D - IDENTIFIED FOR RELOCATION
v_Source_Subsite_ID   VARCHAR2(2) DEFAULT '00';
v_Source_Whep_Fac_ID  NUMBER      DEFAULT NULL;
v_Source_Capital_ID   EMDBA.em_equipment_t.CAPITAL_ID%TYPE DEFAULT 'NA'; -- VARCHAR2(20)
v_Source_Class_Code   EMDBA.Em_Acronym_t.CLASS_CODE%TYPE   DEFAULT 'NA'; -- VARCHAR2(2)
v_Source_Equip_No     EMDBA.em_equipment_t.EQUIP_NO%TYPE   DEFAULT 'NA'; -- VARCHAR2(10)
v_Source_Finance_No   VARCHAR2(7)  DEFAULT 'NA';
--v_Source_Maint_Mgr_ID NUMBER DEFAULT 0;

v_RecordCounter       NUMBER DEFAULT 0;
---------------------------------------------------------------------------------
BEGIN
-- 1.
SELECT DECODE(Max(p.prop_transf_req_ptr), NULL, 0, Max(p.prop_transf_req_ptr)) + 1
  INTO v_Prop_Transf_Req_Ptr
  FROM EMDBA.em_prop_tran_request p
  ;

-- 2.
SELECT NVL(e.capital_id, v_Source_Capital_ID) AS capital_id,
       NVL(a.class_code, v_Source_Class_Code) AS class_code,
       NVL(e.equip_no,   v_Source_Equip_No)   AS equip_no
  INTO v_Source_Capital_ID,
       v_Source_Class_Code,
       v_Source_Equip_No
  FROM EMDBA.em_equipment_t e,
       EMDBA.em_acronym_t   a
 WHERE e.site_id       = p_Site_ID
   AND e.equipment_ptr = p_EquipmentPtr
   AND e.site_id       = a.site_id
   AND e.equip_cat_ptr = a.equip_cat_ptr
 ;

-- 3.
SELECT NVL(s.finance_no,v_Source_Finance_No)--,
       --NVL(s.maint_mgr_person_id, v_Source_Maint_Mgr_ID)
  INTO v_Source_Finance_No--,
       --v_Source_Maint_Mgr_ID
  FROM EMDBA.em_site_t s
 WHERE s.site_id = p_Site_ID
 ;

-- 4.
-- To avoid duplicates determine presence of the record with identical Equipment pointer.
SELECT Count(*)
  INTO v_RecordCounter
  FROM EMDBA.em_prop_tran_request t
 WHERE t.source_equipment_ptr = p_EquipmentPtr
 ;

IF v_RecordCounter = 0 THEN
          INSERT INTO EMDBA.em_prop_tran_request
            (prop_transf_req_ptr, source_site_id, source_subsite_id, source_whep_fac_id, source_equip_cat_ptr,
             source_equipment_ptr, source_capital_id, source_acronym, source_class_code, source_equipment_no,
             source_finance_no, source_maint_mgr_person_id, source_transfer_dt, dest_site_id, dest_subsite_id,
             dest_whep_fac_id, dest_equip_cat_ptr, dest_equipment_ptr, dest_capital_id, dest_acronym,
             dest_class_code, dest_equipment_no, dest_finance_no, dest_maint_mgr_person_id, dest_received_dt,
             accountability_chang, condition_code, approve_transf_mgr_id, approve_receive_mgr_id,
             approve_inv_ctrl_speclst, equip_activated_date, transferred_equip_count, transferred_wo_count,
             ------------
             tran_from_person_to_contact, tran_to_person_to_contact,
             approval_transf_officer, approval_receiving_officer,
             ------------
             create_date, create_user, mod_date, mod_user)
          VALUES
            ( v_Prop_Transf_Req_Ptr --prop_transf_req_ptr
             ,p_Site_ID             --source_site_id,
             ,v_Source_Subsite_ID   --source_subsite_id
             ,v_Source_Whep_Fac_ID  --source_whep_fac_id
             ,p_EquipCatPtr         --source_equip_cat_ptr,
             ,p_EquipmentPtr        --source_equipment_ptr,
             ,v_Source_Capital_ID   --source_capital_id,
             ,p_EquipmentAcronym    --source_acronym,
             ,v_Source_Class_Code   --source_class_code,
             ,v_Source_Equip_No     --source_equipment_no,
             ,v_Source_Finance_No   --source_finance_no,
             ,NULL                  --v_Source_Maint_Mgr_ID --source_maint_mgr_person_id,
             ,SYSDATE               --source_transfer_dt,
             ,NULL                  --dest_site_id,
             ,NULL                  --dest_subsite_id,
             ,NULL                  --dest_whep_fac_id,
             ,NULL                  --dest_equip_cat_ptr,
             ,NULL                  --dest_equipment_ptr,
             ,NULL                  --dest_capital_id,
             ,NULL                  --dest_acronym,
             ,NULL                  --dest_class_code,
             ,NULL                  --dest_equipment_no,
             ,NULL                  --dest_finance_no,
             ,NULL                  --dest_maint_mgr_person_id,
             ,NULL                  --dest_received_dt,
             ,'Y'                   --accountability_chang,
             ,p_ConditionCode_Changed--condition_code,
             ,NULL                  --approve_transf_mgr_id, CURRENTLY is NOT used, see "approval_transf_officer"
             ,NULL                  --approve_receive_mgr_id, CURRENTLY is NOT used, see "approval_receiving_officer"
             ,NULL                  --approve_inv_ctrl_speclst
             ,NULL                  --equip_activated_date,
             ,NULL                  --transferred_equip_count,
             ,NULL                  --transferred_wo_count,
             ------------
             ,(select s.maint_mgr
                 from emdba.em_site_t s
                where s.site_id = p_Site_ID ) --tran_from_person_to_contact
             ,NULL                            --tran_to_person_to_contact
             ,(select s.maint_mgr
                 from emdba.em_site_t s
                where s.site_id = p_Site_ID ) --approval_transf_officer
             ,NULL                            --approval_receiving_officer
             ------------
             ,SYSDATE               --create_date,
             ,p_CurrentUser         --create_user,
             ,SYSDATE               --mod_date,
             ,p_CurrentUser         --mod_user
             );
END IF;
--------------------------------------------------------------------------------
COMMIT;
--------------------------------------------------------------------------------
END sp_createEquipRelocRecord_2;
--==============================================================================
PROCEDURE sp_updEquipRelocRecord(p_Site_ID         IN NUMBER
                                   ,p_CurrentUser     IN NUMBER
                                   ,p_DestEquipPtr    IN NUMBER
                                   ,p_DestEquipCatPtr IN NUMBER
                                   ,p_ConditionCode_Changed IN VARCHAR2)

IS
BEGIN

v_ERROR_POS := 'Before update';

  UPDATE emdba.em_prop_tran_request t
     SET t.dest_received_dt = SYSDATE,
         t.condition_code = p_ConditionCode_Changed,
         t.approve_inv_ctrl_speclst = p_CurrentUser,
         t.equip_activated_date = SYSDATE,
         t.mod_date = SYSDATE,
         t.mod_user = p_CurrentUser
   WHERE t.dest_equipment_ptr = p_DestEquipPtr
     AND t.dest_equip_cat_ptr = p_DestEquipCatPtr
   ;

  COMMIT;
--------------------------------------------------------------------------------
--     htp.p('</ROWSET>');
 -- Table: SELECT * FROM ms47.ms47_sp_error_log ORDER BY 1;
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_EQUIP_TRANSFER_S1.sp_updateEquipRelocRecord_2'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );
--------------------------------------------------------------------------------


END sp_updEquipRelocRecord;
--==============================================================================
PROCEDURE sp_validateDuplicates(p_Source_Equip_Ptr NUMBER) IS

v_RecordCount NUMBER;

BEGIN
     SELECT Count(*)
       INTO v_RecordCount
       FROM EMDBA.em_prop_tran_request t
      WHERE t.source_equipment_ptr = p_Source_Equip_Ptr;

htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
         htp.p('<ROW>');
                 htp.p('<REC_COUNT>'||v_RecordCount||'</REC_COUNT>');
         htp.p('</ROW>');
     htp.p('</ROWSET>');
END sp_validateDuplicates;
--===============================================================================
PROCEDURE sp_getEquipIdentForReloc ( p_Site_ID IN EMDBA.em_site_t.site_id%TYPE) IS
----
v_SiteName_Length   NUMBER DEFAULT 20;
v_CapitalID_Length  NUMBER;
v_Acronym_Length    NUMBER;
v_Class_Code_Length NUMBER;
v_Equip_No_Length   NUMBER;

v_Tbl_Header        VARCHAR2(500);
v_Tbl_Header_Length NUMBER;
----
    CURSOR c_getEquipIdentForReloc IS

    SELECT t.source_site_id
          ,(select s.site_name
              from emdba.em_site_t s
             where s.site_id = t.source_site_id) AS source_site_name
          ,t.dest_site_id
          ,(select s.site_name
              from emdba.em_site_t s
             where s.site_id = t.dest_site_id) AS dest_site_name
          ,t.prop_transf_req_ptr
          ,t.source_capital_id
          ,t.source_acronym
          ,t.source_class_code
          ---------------------
          ,(CASE p_Site_ID
                 WHEN t.source_site_id THEN t.source_equipment_no
                 WHEN t.dest_site_id   THEN t.dest_equipment_no
            END) AS source_equipment_no
          --,t.source_equipment_no
          ---------------------
          ,t.condition_code||' - '||(select c.condition_desc
                                      from emdba.em_condition_code_t c
                                     where c.condition_code = t.condition_code) as record_status_show
     FROM EMDBA.em_prop_tran_request t
    WHERE t.source_site_id = p_Site_ID
       OR t.dest_site_id   = p_Site_ID
    ORDER BY t.prop_transf_req_ptr
    ;
-------------------------------------------------------------------------------
BEGIN
-------------------------------------------------------------------------------
SELECT Max(Length(t.source_capital_id))
      ,Max(Length(t.source_acronym))
      ,Max(Length(t.source_class_code))
      ,Max(Length(t.source_equipment_no))
  INTO v_CapitalID_Length,
       v_Acronym_Length,
       v_Class_Code_Length,
       v_Equip_No_Length
  FROM EMDBA.em_prop_tran_request t
 WHERE t.source_site_id = p_Site_ID
    OR t.dest_site_id   = p_Site_ID
 ;
------------------------------------------------------------------------------
-- 20 charachters is long enough to provide a site name
SELECT Max(Length(s.site_name))
  INTO v_SiteName_Length
  FROM emdba.em_site_t s,
       emdba.em_prop_tran_request t
 WHERE s.site_id = t.source_site_id
    OR s.site_id = t.dest_site_id
   AND s.site_id = p_Site_ID
;
IF v_SiteName_Length > 20 THEN
   v_SiteName_Length := 20;
END IF;
-------------------------------------------------------------------------------
-- Build header:
-- 'Captl ID'       - 8 characters
-- 'Acronym'        - 7 characters
-- 'Class CD'       - 8 characters
-- 'Equip.Num'      - 9 characters
-- 'Condition Code' - 14 characters

IF v_CapitalID_Length  < 8 THEN v_CapitalID_Length  := 8; END IF;
IF v_Acronym_Length    < 7 THEN v_Acronym_Length    := 7; END IF;
IF v_Class_Code_Length < 8 THEN v_Class_Code_Length := 8; END IF;
IF v_Equip_No_Length   < 9 THEN v_Equip_No_Length   := 9; END IF;
-------------------------------------------------------------------------------
-- The First row in control "sel_Equipment":
v_Tbl_Header := RPad('Source Site',v_SiteName_Length,' ')     ||' | '||
                RPad('Destination Site',v_SiteName_Length,' ')||' | '||
                'Captl ID'                                    ||' | '||
                'Acronym'                                     ||' | '||
                'Class CD'                                    ||' | '||
                'Equip.Num'                                   ||' | '||
                'Condition Code'                              ||'   '
                ;
---------------------
SELECT Length(v_Tbl_Header)
  INTO v_Tbl_Header_Length
  FROM dual
  ;
htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
---------------------
         htp.p('<ROW>');
             htp.p('<VALUE>-1</VALUE>');
             htp.p('<TEXT>');
                       htp.p( v_Tbl_Header  );
             htp.p('</TEXT>');
         htp.p('</ROW>');
---------------------
-- The Second row in control "sel_Equipment":
v_Tbl_Header := '-';
FOR i IN 1..v_Tbl_Header_Length LOOP
    v_Tbl_Header := v_Tbl_Header||'-';
END LOOP;

         htp.p('<ROW>');
             htp.p('<VALUE>-2</VALUE>');
             htp.p('<TEXT>');
                       htp.p(v_Tbl_Header);
             htp.p('</TEXT>');
         htp.p('</ROW>');
--------------------------------------------------------------------------------
         FOR r_Record IN c_getEquipIdentForReloc LOOP
             htp.p('<ROW>');
                 htp.p('<VALUE>'||r_Record.prop_transf_req_ptr||'</VALUE>');
                 htp.p('<TEXT>' ||RPad('('||LPad(r_Record.Source_Site_Id,3,' ')||')'||' '||r_Record.source_site_name, v_SiteName_Length, ' ')
                                ||'   '
                                ||RPad('('||LPad(r_Record.Dest_Site_Id,3,' ')||')'||' '||r_Record.Dest_site_name, v_SiteName_Length, ' ')
                                ||'   '
                                ||RPad(r_Record.source_capital_id,v_CapitalID_Length,' ')
                                ||'   '
                                ||RPad(r_Record.source_Acronym,v_Acronym_Length,' ')
                                ||'   '
                                ||RPad(r_Record.source_class_code,v_Class_Code_Length,' ')
                                ||'   '
                                ||RPad(r_Record.source_Equipment_No,v_Equip_No_Length,' ')
                                ||'   '
                                ||r_Record.record_status_show||
                       '</TEXT>');
             htp.p('</ROW>');
         END LOOP;
--------------------------------------------------------------------------------
     htp.p('</ROWSET>');
 -- Table: SELECT * FROM ms47.ms47_sp_error_log ORDER BY 1;
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_EQUIP_TRANSFER_S1.sp_getEquipIdentForReloc'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );
--------------------------------------------------------------------------------


END sp_getEquipIdentForReloc;
--==============================================================================
END EM_EQUIP_TRANSFER_S1;
/
