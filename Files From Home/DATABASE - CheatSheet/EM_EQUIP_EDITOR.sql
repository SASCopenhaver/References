CREATE OR REPLACE PACKAGE EMAPP.EM_EQUIP_EDITOR
  IS
v_ERROR_POS VARCHAR2(100)   default 'NOT DEFINED';
v_sqlerrm   VARCHAR2(1000);
v_sqlcode   VARCHAR2(1000);
--==============================================================================
PROCEDURE sp_getNADS( p_NADS_Type IN VARCHAR2 DEFAULT NULL
                     ,p_ID        IN VARCHAR2 DEFAULT NULL);
--==============================================================================
PROCEDURE sp_getEqupmentGroup( p_SiteID IN NUMBER );
--==============================================================================
PROCEDURE sp_getAcronymList( p_SiteID     IN NUMBER
                            ,p_EquipGroup IN VARCHAR2 );
--==============================================================================
PROCEDURE sp_getChangeAcronym( p_EquipCatPtr IN NUMBER);
--==============================================================================
PROCEDURE sp_getClassCodeForEdit (p_EquipCatPtr IN NUMBER);
--==============================================================================
PROCEDURE sp_getAcronymForEdit(p_EquipCatPtr IN NUMBER);
--==============================================================================
PROCEDURE sp_getEquipmentForEdit( p_SiteID  IN NUMBER
                              ,p_EquipGroup IN VARCHAR2
                              ,p_EquipCatPtr IN NUMBER );
--==============================================================================
PROCEDURE sp_updateEquipment( p_SiteID      IN NUMBER
                             ,p_currentUser IN NUMBER
                             ,p_SelectedEquip_Cat_Ptr IN NUMBER
                             ,p_ValuesForEdit IN VARCHAR2);
--==============================================================================
PROCEDURE sp_updateEquipNumber( p_SiteID       IN NUMBER
                               ,p_currentUser  IN NUMBER
                               ,p_SelectedEquip_Cat_Ptr IN NUMBER
                               ,p_EquipPtr     IN VARCHAR2
                               ,p_CurrentValue IN VARCHAR2
                               ,p_NewValue     IN VARCHAR2
                               --,p_CallNum IN NUMBER
                               );
--==============================================================================
PROCEDURE sp_updateClassCode( p_SiteID IN NUMBER
                             ,p_Present_Equip_Cat_Ptr IN NUMBER
                             ,p_Str_Class_CD IN VARCHAR2);
--==============================================================================
END EM_EQUIP_EDITOR;


/*

SELECT e.equipment_ptr,
       e.equip_cat_ptr,
       a.acronym,
       a.class_code,
       e.subsite_id,
       e.equip_no,
       e.equip_status_code,
       e.serial_no,
       e.model,
       e.condition_code,
       (select c.condition_desc
          from EM_CONDITION_CODE_T c
         where c.condition_code = e.condition_code) AS condition_desc
  FROM emdba.em_equipment_t e, emdba.em_acronym_t a, emdba.em_site_t s
 WHERE e.site_id = 490
   AND e.equip_cat_ptr = a.equip_cat_ptr
   AND e.site_id = s.site_id
   AND a.group_code = 'A'
   AND equip_status_code = 'A'
 ORDER BY e.equip_status_code, a.acronym, a.class_code, e.subsite_id, e.equip_no
;

*/
/
CREATE OR REPLACE PACKAGE BODY EMAPP.EM_EQUIP_EDITOR
IS
--
-- Purpose: Briefly explain the functionality of the package body
--
--==============================================================================
PROCEDURE sp_getNADS( p_NADS_Type IN VARCHAR2 DEFAULT NULL
                     ,p_ID        IN VARCHAR2 DEFAULT NULL)
IS
-- 1. "AREA":
    CURSOR c_AREA IS
           SELECT 'NTNL' AS option_value,
                  'NATIONAL' AS option_text,
                  1 AS order_by
             FROM dual
           UNION
           SELECT a.area_code AS option_value,
                  Initcap(a.area_name) AS option_text,
                  2 AS order_by
             FROM emdba.em_area_t a
            WHERE a.area_code LIKE ('1%')
              AND a.area_status_code = 'A'
              AND a.area_code != '1M'
           ORDER BY 3, 2
           ;
-- 2. "DIST":
   CURSOR c_DIST IS
       SELECT DISTINCT
              s.district_code as option_value
             ,Initcap(d.district_name) as option_text
       FROM emdba.em_site_t s,
            emdba.em_area_t a,
            emdba.em_district_code_t d,
            emdba.em_subsite_t sb
      WHERE s.site_id BETWEEN 1 AND 550
        AND s.site_id <> 303
        AND s.site_status_code ='A'
        AND s.area=a.area_code
        ---
        AND s.district_code=d.district_code
        ---
        AND a.area_code LIKE '1%'
        AND a.area_status_code = 'A'
        ---
        AND s.site_id = sb.site_id
        AND s.site_status_code != 'I'
        AND s.site_id > 0 -- this line excludes "ADMINISTRATION"
        AND sb.default_flag = 'Y'
        AND sb.subsite_id = '00'
        ---
        AND a.area_code = p_ID
      ORDER BY 2
      ;
-- 3. "SITE":
   CURSOR c_SITE IS
      SELECT  TO_CHAR(s.site_id) as option_value
             ,s.site_name as option_text
       FROM emdba.em_site_t s,
            emdba.em_area_t a,
            emdba.em_district_code_t d,
            emdba.em_subsite_t sb
      WHERE s.site_id BETWEEN 1 AND 550
        AND s.site_id <> 303
        AND s.site_status_code ='A'
        AND s.area=a.area_code
        ---
        AND s.district_code=d.district_code
        ---
        AND a.area_code LIKE '1%'
        and a.area_status_code = 'A'
        ---
        AND s.site_id = sb.site_id
        AND s.site_status_code != 'I'
        AND s.site_id > 0 -- this line excludes "ADMINISTRATION"
        AND sb.default_flag = 'Y'
        AND sb.subsite_id = '00'
        ---
        AND d.district_code = p_ID
      ORDER BY 2
      ;

BEGIN
   htp.p('<?xml version="1.0"?><ROWSET>');
   -----------------------------------------------------------------------------
   -- 1. Area:
   IF p_NADS_Type = 'AREA' THEN
      FOR r_Record IN c_AREA
          LOOP
              htp.p('<ROW>
                           <option_value>'||r_Record.option_value||'</option_value>
                           <option_text>' ||r_Record.option_text ||'</option_text>
                    </ROW>');
          END LOOP;

   -----------------------------------------------------------------------------
   -- 2. District:
   ELSIF p_NADS_Type = 'DIST' THEN
      FOR r_Record IN c_DIST
          LOOP
              htp.p('<ROW>
                           <option_value>'||r_Record.option_value||'</option_value>
                           <option_text>' ||r_Record.option_text ||'</option_text>
                    </ROW>');
          END LOOP;

   ------------------------------------------------------------------------------
   -- 2. Site:
   ELSIF p_NADS_Type = 'SITE' THEN
      FOR r_Record IN c_SITE
          LOOP
              htp.p('<ROW>
                           <option_value>'||r_Record.option_value||'</option_value>
                           <option_text>' ||r_Record.option_text ||'</option_text>
                    </ROW>');
          END LOOP;
   -----------------------------------------------------------------------------
   END IF;
   htp.p('</ROWSET>');
END sp_getNADS;
--==============================================================================
PROCEDURE sp_getEqupmentGroup ( p_SiteID IN NUMBER )
IS
    CURSOR c_EqupmentGroup IS
      SELECT DISTINCT
             g.group_code AS option_value,
             g.group_desc AS option_text
        FROM  EMDBA.em_group_code_t g
             ,EMDBA.em_acronym_t a
       WHERE g.group_code = a.group_code
         AND g.group_code NOT IN ('X','K')
         AND a.active_flag = 'A'
         AND a.site_id = p_SiteID
       ORDER BY g.group_code
      ;
BEGIN
    ----------------------------------------------------------------------------
      htp.p('<?xml version="1.0"?><ROWSET>');
      FOR r_Record IN c_EqupmentGroup
          LOOP
              htp.p('<ROW>
                           <option_value>'||r_Record.option_value||'</option_value>
                           <option_text>' ||r_Record.option_text ||'</option_text>
                    </ROW>');
          END LOOP;
      htp.p('</ROWSET>');
    ----------------------------------------------------------------------------
END sp_getEqupmentGroup;
--==============================================================================
PROCEDURE sp_getAcronymList( p_SiteID IN NUMBER
                            ,p_EquipGroup IN VARCHAR2 )
IS
    CURSOR c_Acronym IS
           SELECT DISTINCT a.equip_cat_ptr AS option_value
                          ,RPad(a.acronym,15,'.')||a.class_code AS option_text
                          ,DECODE(a.acronym,/*if*/'DIOSS',/*then*/'YES',
                                            /*if*/'CIOSS',/*then*/'YES',
                                            /*if*/'DBCS', /*then*/'YES',
                                            /*else*/'NO') AS change_acronym
             FROM EMDBA.em_acronym_t a
                 ,EMDBA.em_equipment_t e
            WHERE a.site_id    = p_SiteID
              AND a.group_code = p_EquipGroup
              AND a.active_flag = 'A'
              AND a.equip_cat_ptr = e.equip_cat_ptr
              AND e.equip_status_code = 'A'
            ORDER BY 2
            ;
BEGIN
    ----------------------------------------------------------------------------
      htp.p('<?xml version="1.0"?><ROWSET>');
      FOR r_Record IN c_Acronym
          LOOP
              htp.p('<ROW>
                           <option_value>'   ||r_Record.option_value   ||'</option_value>
                           <option_text>'    ||r_Record.option_text    ||'</option_text>
                           <change_acronym>' ||r_Record.change_acronym ||'</change_acronym>
                    </ROW>');
          END LOOP;
      htp.p('</ROWSET>');
    ----------------------------------------------------------------------------
END sp_getAcronymList;
--==============================================================================
PROCEDURE sp_getChangeAcronym( p_EquipCatPtr IN NUMBER)
IS
    v number;
BEGIN
        select p_EquipCatPtr into v from dual;
END sp_getChangeAcronym;
--==============================================================================
PROCEDURE sp_getClassCodeForEdit (p_EquipCatPtr IN NUMBER)
IS
CURSOR c_ClassCode IS
        SELECT DISTINCT a.class_code
          FROM EMDBA.em_acronym_t a,
               EMDBA.em_group_code_t g
              WHERE a.group_code = g.group_code
                AND a.active_flag = 'A'
                AND a.acronym = (select a1.acronym
                                from emdba.em_acronym_t a1
                                where a1.equip_cat_ptr = p_EquipCatPtr)
              ORDER BY a.class_code;
BEGIN

      htp.p('<?xml version="1.0"?><ROWSET>');
      FOR r_Record IN c_ClassCode
          LOOP
              htp.p('<ROW>
                      <class_code>'||r_Record.class_code||'</class_code>
                    </ROW>');
          END LOOP;
      htp.p('</ROWSET>');

END sp_getClassCodeForEdit;
--==============================================================================
PROCEDURE sp_getAcronymForEdit(p_EquipCatPtr IN NUMBER)
IS
v_Acronym EMDBA.Em_Acronym_t.ACRONYM%TYPE; --VARCHAR2(12)

CURSOR c_Acronym_ForEdit IS
        SELECT a.acronym, a.acronym_desc, a.class_code, 'selected' AS IS_SELECTED
          FROM emdba.em_acronym_t a
         WHERE a.equip_cat_ptr = p_EquipCatPtr
        UNION
        SELECT am.acronym, am.acronym_desc, am.class_code, '' AS IS_SELECTED
          FROM emdba.em_acronym_master_t am
         WHERE am.acronym||am.class_code IN ('DBCS'||'BA','DBCS'||'CJ')
        ORDER BY 1,3;

BEGIN
         SELECT a.acronym
           INTO v_Acronym
           FROM EMDBA.em_acronym_t a
          WHERE a.equip_cat_ptr = p_EquipCatPtr;

      htp.p('<?xml version="1.0"?><ROWSET>');
               FOR r_Record IN c_Acronym_ForEdit
                  LOOP
                      htp.p('<ROW>
                                   <acronym_for_edit>'||r_Record.acronym     ||'</acronym_for_edit>
                                   <acronym_desc>'    ||r_Record.acronym_desc||'</acronym_desc>
                                   <class_code>'      ||r_Record.class_code  ||'</class_code>
                                   <is_selected>'     ||r_Record.Is_Selected ||'</is_selected>
                            </ROW>');
                  END LOOP;
      htp.p('</ROWSET>');

END sp_getAcronymForEdit;
--==============================================================================
PROCEDURE sp_getEquipmentForEdit( p_SiteID      IN NUMBER
                                 ,p_EquipGroup  IN VARCHAR2
                                 ,p_EquipCatPtr IN NUMBER )
IS

     CURSOR c_EquipmentList IS
        SELECT e.equipment_ptr,
               e.subsite_id,
               a.acronym,
               a.acronym_desc,
               a.class_code,
               e.equip_no,
               e.serial_no
          FROM emdba.em_equipment_t e,
               emdba.em_acronym_t a,
               emdba.em_site_t s
         WHERE e.site_id = p_SiteID
           AND e.equip_cat_ptr = a.equip_cat_ptr
           AND e.equip_cat_ptr = p_EquipCatPtr
           AND e.site_id = s.site_id
           AND a.group_code = p_EquipGroup
           AND e.equip_status_code = 'A'
           AND a.active_flag = 'A'
         ORDER BY a.acronym, a.class_code, e.subsite_id, e.equip_no
         ;
BEGIN
      htp.p('<?xml version="1.0"?><ROWSET>');
      FOR r_Record IN c_EquipmentList
          LOOP
              htp.p('<ROW>
                           <equipment_ptr>' ||r_Record.equipment_ptr ||'</equipment_ptr>
                           <subsite_id>'    ||r_Record.subsite_id    ||'</subsite_id>
                           <acronym>'       ||r_Record.acronym       ||'</acronym>
                           <acronym_desc>'  ||r_Record.acronym_desc  ||'</acronym_desc>
                           <class_code>'    ||r_Record.class_code    ||'</class_code>
                           <equip_no>'      ||r_Record.equip_no      ||'</equip_no>
                           <serial_no>'     ||r_Record.serial_no     ||'</serial_no>
                    </ROW>');
          END LOOP;
      htp.p('</ROWSET>');


/*
     CURSOR c_EquipmentList IS
        SELECT e.equipment_ptr,
               e.equip_cat_ptr,
               a.acronym,
               a.acronym_desc,
               a.class_code,
               e.subsite_id,
               e.equip_no,
               --e.equip_status_code,
               e.serial_no,
               e.model,
               e.condition_code,
               (select c.condition_desc
                  from EM_CONDITION_CODE_T c
                 where c.condition_code = e.condition_code) AS condition_desc
          FROM emdba.em_equipment_t e,
               emdba.em_acronym_t a,
               emdba.em_site_t s
         WHERE e.site_id = p_SiteID
           AND e.equip_cat_ptr = a.equip_cat_ptr
           AND e.equip_cat_ptr = p_EquipCatPtr
           AND e.site_id = s.site_id
           AND a.group_code = p_EquipGroup
           AND e.equip_status_code = 'A'
           AND a.active_flag = 'A'
         ORDER BY a.acronym, a.class_code, e.subsite_id, e.equip_no
         ;
BEGIN
      htp.p('<?xml version="1.0"?><ROWSET>');
      FOR r_Record IN c_EquipmentList
          LOOP
              htp.p('<ROW>
                           <equipment_ptr>' ||r_Record.equipment_ptr ||'</equipment_ptr>
                           <equip_cat_ptr>' ||r_Record.equip_cat_ptr ||'</equip_cat_ptr>
                           <acronym>'       ||r_Record.acronym       ||'</acronym>
                           <acronym_desc>'  ||r_Record.acronym_desc  ||'</acronym_desc>
                           <class_code>'    ||r_Record.class_code    ||'</class_code>
                           <subsite_id>'    ||r_Record.subsite_id    ||'</subsite_id>
                           <equip_no>'      ||r_Record.equip_no      ||'</equip_no>
                           <serial_no>'     ||r_Record.serial_no     ||'</serial_no>
                           <condition_code>'||r_Record.condition_code||'</condition_code>
                           <condition_desc>'||r_Record.condition_desc||'</condition_desc>
                    </ROW>');
          END LOOP;
      htp.p('</ROWSET>');
*/
END sp_getEquipmentForEdit;
--==============================================================================
PROCEDURE sp_updateEquipment( p_SiteID IN NUMBER
                             ,p_currentUser IN NUMBER
                             ,p_SelectedEquip_Cat_Ptr IN NUMBER
                             ,p_ValuesForEdit IN VARCHAR2)
IS
---
v_RtnMsg          VARCHAR2(100);
v_Pos             NUMBER DEFAULT 0;
v_ValuesForEdit   VARCHAR2(1000) DEFAULT p_ValuesForEdit;
v_IterationString VARCHAR2(1000);
---
v_UpdateWhat   VARCHAR2(20);
---
v_EquipPtr     VARCHAR2(50);
v_CurrentValue VARCHAR2(50);
v_NewValue     VARCHAR2(50);
v_Iteration    NUMBER DEFAULT 1;
---
BEGIN
-- I. PREAPARATION STEP:
        -- I.1. Determine what has to be updated: .....................................
                -- I.1.1
                -- Ex: v_ValuesForEdit = 'EQUIP_NUM|239635:1/10;291361:2/20;239633:8/80;'
                SELECT INSTR(v_ValuesForEdit, '|') 
                  INTO v_Pos -- Ex: 10
                  FROM dual;

                -- I.1.2
                SELECT SUBSTR(v_ValuesForEdit, 1, v_Pos-1),
                       SUBSTR(v_ValuesForEdit, v_Pos+1)
                  INTO v_UpdateWhat     -- Ex: 'EQUIP_NUM'
                      ,v_ValuesForEdit  -- Ex: '239635:1/10;291361:2/20;239633:8/80;'
                  FROM dual;

        -- I.2. Get ready for the first iteration in the loop:
                SELECT INSTR(v_ValuesForEdit,';')
                  INTO v_Pos -- Ex: 12
                  FROM dual;

        -- I.3. 
           WHILE v_Pos > 0 LOOP
                   -- I.3.1 
                   SELECT SUBSTR(v_ValuesForEdit,1,v_Pos)
                     INTO v_IterationString -- Ex: First iteration '239635:1/10;'
                     FROM dual;
                   -- I.3.2 
                   SELECT SUBSTR(v_IterationString, 1, INSTR(v_IterationString, ':')-1) 
                         ,SUBSTR(v_IterationString, instr(v_IterationString,':')+1 
                                                  ,(instr(v_IterationString,'/')-instr(v_IterationString,':')-1))
                         ,SUBSTR(v_IterationString, instr(v_IterationString,'/')+1, 
                                            (instr(v_IterationString,';')-instr(v_IterationString,'/')-1))                         
                     INTO v_EquipPtr      -- Ex: (first iteration) 239635
                         ,v_CurrentValue  -- Ex: (first iteration) 1
                         ,v_NewValue      -- Ex: (first iteration) 10
                     FROM dual;
                   -- I.3.3
                   IF v_UpdateWhat = 'EQUIP_NUM' THEN
                           sp_updateEquipNumber( p_SiteID
                                                ,p_currentUser
                                                ,p_SelectedEquip_Cat_Ptr
                                                ,v_EquipPtr     -- p_EquipPtr
                                                ,v_CurrentValue -- p_CurrentValue
                                                ,v_EquipPtr     -- p_NewValue
                                                -- To prevent Unique Key (EMDBA.em_equipment_t.em_equipment_t_uk) 
                                                -- violation - update tables with the value in v_EquipPtr 
                                                -- instead of v_NewValue.
                                                --,1
                                                ); 
                   END IF;     
                   -- I.3.4 Remove "processed" values:
                   SELECT SUBSTR(v_ValuesForEdit, v_Pos+1)
                     INTO v_ValuesForEdit -- Ex: 291361:2/20;239633:8/80;
                     FROM dual;
                   -- I.3.5 Preparation for the sequential iteration: 
                   SELECT INSTR(v_ValuesForEdit,';')
                     INTO v_Pos -- Ex: 12
                     FROM dual;

                     -- I.3.6 This is not a necessary step, just a precaution to prevent an infinite loop 
                     --    in case of some unexpected mistake occurred. 
                     --    It is highly unlikely that there will be a request to renumber 100 pieces of 
                     --    equipment simultaneously, that¿s why there is a limit on this loop not to exceed 100 iterations.
                       v_Iteration := v_Iteration+1;
                       if v_Iteration = 101 then
                           v_Pos := 0;
                       end if;

           END LOOP;

-- II. ASSIGN NEW VALUES:

   SELECT p_ValuesForEdit
     INTO v_ValuesForEdit
     FROM dual;
     
-- II.1. Determine what has to be updated: .....................................
        -- I.1. Determine what has to be updated: .....................................
                -- II.1.1
                -- Ex: v_ValuesForEdit = 'EQUIP_NUM|239635:1/10;291361:2/20;239633:8/80;'
                SELECT INSTR(v_ValuesForEdit, '|') 
                  INTO v_Pos -- Ex: 10
                  FROM dual;

                -- II.1.2
                SELECT SUBSTR(v_ValuesForEdit, 1, v_Pos-1),
                       SUBSTR(v_ValuesForEdit, v_Pos+1)
                  INTO v_UpdateWhat     -- Ex: 'EQUIP_NUM'
                      ,v_ValuesForEdit  -- Ex: '239635:1/10;291361:2/20;239633:8/80;'
                  FROM dual;

        -- II.2. Get ready for the loop:
                SELECT INSTR(v_ValuesForEdit,';')
                  INTO v_Pos -- Ex: 12
                  FROM dual;
        -- II.3. 
           WHILE v_Pos > 0 LOOP
                   -- II.3.1 
                   SELECT SUBSTR(v_ValuesForEdit,1,v_Pos)
                     INTO v_IterationString -- Ex: First iteration '239635:1/10;'
                     FROM dual;
                   -- II.3.2 
                   SELECT SUBSTR(v_IterationString, 1, INSTR(v_IterationString, ':')-1) 
                         ,SUBSTR(v_IterationString, instr(v_IterationString,':')+1 
                                                  ,(instr(v_IterationString,'/')-instr(v_IterationString,':')-1))
                         ,SUBSTR(v_IterationString, instr(v_IterationString,'/')+1, 
                                            (instr(v_IterationString,';')-instr(v_IterationString,'/')-1))                         
                     INTO v_EquipPtr      -- Ex: (first iteration) 239635
                         ,v_CurrentValue  -- Ex: (first iteration) 1
                         ,v_NewValue      -- Ex: (first iteration) 10
                     FROM dual;
                   -- II.3.3
                   IF v_UpdateWhat = 'EQUIP_NUM' THEN
                           sp_updateEquipNumber( p_SiteID
                                                ,p_currentUser
                                                ,p_SelectedEquip_Cat_Ptr
                                                ,v_EquipPtr
                                                ,v_EquipPtr --v_CurrentValue
                                                ,v_NewValue
                                                --,2
                                                ); 
                   END IF;     
                   -- II.3.4 Remove "processed" values:
                   SELECT SUBSTR(v_ValuesForEdit, v_Pos+1)
                     INTO v_ValuesForEdit -- Ex: 291361:2/20;239633:8/80;
                     FROM dual;
                   -- II.3.5 Preparation for the sequential iteration: 
                   SELECT INSTR(v_ValuesForEdit,';')
                     INTO v_Pos -- Ex: 12
                     FROM dual;

                     -- II.3.6 This is not a necessary step, just a precaution to prevent an infinite loop 
                     --    in case of some unexpected mistake occurred. 
                     --    It is highly unlikely that there will be a request to renumber 100 pieces of 
                     --    equipment simultaneously, that¿s why there is a limit on this loop not to exceed 100 iterations.
                       v_Iteration := v_Iteration+1;
                       if v_Iteration = 101 then
                           v_Pos := 0;
                       end if;

           END LOOP;
           
v_sqlcode := SQLCODE;
IF v_sqlcode = 0 THEN
   v_RtnMsg := 'System updated equipment number(s).';
ELSE
   v_RtnMsg := 'ERROR.\nPlease call Help Desk.\Error code could be found in the table ''ms47.ms47_sp_error_log'''; -- site_id='||v_SiteID_Temp;
END IF;


htp.p('<?xml version="1.0"?><ROWSET>');
            htp.p('<ROW>'||
                       '<WHAT>EQUIP_NUM</WHAT>'||
                       '<MSG>'||v_RtnMsg||'</MSG>'
                  ||'</ROW>');
htp.p('</ROWSET>');


-------------------------------------------------------------------------------
            -- Table: select * from ms47.ms47_sp_error_log order by
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_EQUIP_EDITOR.sp_updateEquipment'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );
-------------------------------------------------------------------------------
END sp_updateEquipment;
--==============================================================================
PROCEDURE sp_updateEquipNumber( p_SiteID       IN NUMBER
                               ,p_currentUser  IN NUMBER
                               ,p_SelectedEquip_Cat_Ptr IN NUMBER
                               ,p_EquipPtr     IN VARCHAR2
                               ,p_CurrentValue IN VARCHAR2
                               ,p_NewValue     IN VARCHAR2
                               --,p_CallNum      IN NUMBER
                              )
IS
--v_EquipPtr NUMBER DEFAULT TO_NUMBER(p_EquipPtr);
BEGIN
/*
EM_EQUIPMENT_T
EM_WO_T
EM_ROUTE_T
EM_ROUTE_HISTORY_T
EM_WO_PM_QTY_COMP_T
*/
    UPDATE EMDBA.Em_Equipment_t e
       SET e.equip_no = p_NewValue
          ,e.mod_date = SYSDATE
          ,e.mod_user = p_currentUser
     WHERE e.site_id = p_SiteID
       AND e.equipment_ptr = p_EquipPtr
       AND e.equip_no = p_CurrentValue
       AND e.equip_cat_ptr = p_SelectedEquip_Cat_Ptr;
    
    UPDATE EMDBA.EM_WO_T w
       SET w.equip_no = p_NewValue
          ,w.mod_date = SYSDATE
          ,w.mod_user = p_currentUser
     WHERE w.site_id = p_SiteID
       AND w.equipment_ptr = p_EquipPtr
       AND w.equip_no = p_CurrentValue
       AND w.equip_cat_ptr = p_SelectedEquip_Cat_Ptr;
       
     UPDATE EMDBA.em_route_t r
        SET r.equip_no = p_NewValue
           ,r.mod_date = SYSDATE
           ,r.mod_user = p_currentUser
      WHERE r.site_id = p_SiteID
        AND r.equipment_ptr = p_EquipPtr
        AND r.equip_no = p_CurrentValue
        AND r.equip_cat_ptr = p_SelectedEquip_Cat_Ptr;
      
      UPDATE EMDBA.Em_Route_History_t h
         SET h.equip_no = p_NewValue
            ,h.mod_date = SYSDATE
            ,h.mod_user = p_currentUser
       WHERE h.site_id = p_SiteID
         AND h.equipment_ptr = p_EquipPtr
         AND h.equip_no = p_CurrentValue
         AND h.equip_cat_ptr = p_SelectedEquip_Cat_Ptr;
        
        
     UPDATE EMDBA.EM_WO_PM_QTY_COMP_T q
        SET q.equip_no = p_NewValue
           ,q.mod_date = SYSDATE
           ,q.mod_user = p_currentUser
      WHERE q.site_id = p_SiteID
        AND q.acronym = (
                            select distinct a.acronym
                              from emdba.em_wo_t w,
                                   emdba.em_acronym_t a
                              where w.site_id = a.site_id
                                and w.site_id = p_SiteID
                                and w.equip_cat_ptr = a.equip_cat_ptr
                                and w.equip_cat_ptr = p_SelectedEquip_Cat_Ptr
                                and w.equip_no = p_CurrentValue
                                and w.equipment_ptr = p_EquipPtr       
                        )
        AND q.equip_no = p_CurrentValue;
      
      
      COMMIT;
 

END sp_updateEquipNumber;
--==============================================================================
PROCEDURE sp_updateClassCode( p_SiteID IN NUMBER
                             ,p_Present_Equip_Cat_Ptr NUMBER
                             ,p_Str_Class_CD VARCHAR2)
IS

--..............................................................................
-- p_Str_Class_CD may have the following value: "CLASS_CD|23456_AA_AB;98745_AA_AE;"
-- CLASS_CD - what has to be changed
-- | - delimeter
-- 23456 - equipment pointer
-- AA - present class code.  In a way this value duplicates what could be obtained in stored procedure based on "equip_cat_ptr"
-- AE - new "Class Code".
                                 -- v_site       number        := 252;   --enter site_id
v_PresentAcronym   VARCHAR2(12); -- v_acro       varchar2(12)  := 'HSIU';-- enter the present acronym
v_PresentClassCode VARCHAR2(2);  -- v_class      varchar2(2)   := 'AA';  -- enter the present class code
v_PresentEquipPtr  NUMBER;
v_PresentEquipNum  NUMBER;
v_PresentSubSite   VARCHAR2(10); -- v_subsite   varchar2(10)  := '00';   -- enter the present subsite number

v_NewAcronym       VARCHAR2(12); -- v_newacro   varchar2(12)  := 'PBCS'; -- enter the new acronym
v_NewClassCode     VARCHAR2(2);  -- v_newclass  varchar2(2)   := 'AA';   -- enter the new class code
v_NewEquipCatPtr NUMBER;       -- v_newcat    number        := 0;      -- place holder for the new equip_cat_ptr
                                 -- v_equipno varchar2(10)  := null;     --place holder for equipment number


v_Pos           NUMBER DEFAULT 0;
v_StrFindWithin VARCHAR2(1000) DEFAULT p_Str_Class_CD;
v_Substr_EquipPtr_ClassCodes VARCHAR2(100)  DEFAULT '';
--v_ListEquipPtr  VARCHAR2(1000) DEFAULT '';

--.............................................................................
BEGIN
--    select 1 into v_NewEquipCatPtr from dual;
-- 1.
select a.acronym, a.class_code, a.acronym
  into v_PresentAcronym,
       v_PresentClassCode,
       v_NewAcronym       -- <--- For manual process, New Acronym goes here!!!!
  from EMDBA.Em_Acronym_t a
 where a.equip_cat_ptr = p_Present_Equip_Cat_Ptr
   and a.site_id = p_SiteID;

-- 2.
-- 2.1  Initial string: 'CLASS_CD|23456_AA_AB;98745_AA_AE;'
select INSTR(v_StrFindWithin,'|')
  into v_Pos -- ex: 9
  from dual;

-- 2.2
select substr(v_StrFindWithin, v_Pos+1)
  into v_StrFindWithin -- ex: '23456_AA_AB;98745_AA_AE;'
  from dual;

-- 2.3
select instr(v_StrFindWithin,';')
  into v_Pos -- ex: first iteration 12
  from dual;
        ----------------------------------------------------------
        WHILE v_Pos > 0 LOOP
            -- 2.3.1
            select substr(v_StrFindWithin, 1, v_Pos)
              into v_Substr_EquipPtr_ClassCodes -- ex: 23456_AA_AB;
              from dual;

            -- 2.3.2
            select TO_NUMBER(substr( v_Substr_EquipPtr_ClassCodes, 1, instr(v_Substr_EquipPtr_ClassCodes,'_')-1 ))
              into v_PresentEquipPtr
              from dual;

            -- 2.3.3
            select e.subsite_id, e.equip_no
              into v_PresentSubSite, v_PresentEquipNum
              from emdba.em_equipment_t e
             where e.equipment_ptr = v_PresentEquipPtr;

            -- 2.3.4
            select substr(v_Substr_EquipPtr_ClassCodes, v_Pos-2, 2)
              into v_NewClassCode -- ex: AB
              from dual;

            -- 2.3.5
            select substr(v_StrFindWithin, v_Pos+1)
              into v_StrFindWithin -- ex: '98745_AA_AE;'
              from dual;

            -- 2.3.6 -----------------------------------------------------
                      select b.equip_cat_ptr
                        into v_NewEquipCatPtr --v_newcat
                        from emdba.em_acronym_t b
                       where b.site_id = p_SiteID
                         and b.acronym = v_NewAcronym --v_newacro
                         and b.class_code = v_NewClassCode; --v_newclass;
            -- 2.3.7
                      update emdba.em_equipment_t
                         set equip_cat_ptr = v_NewEquipCatPtr, --v_newcat,
                             mod_date      = sysdate,
                             mod_user      = -16713
                       where site_id = p_SiteID --v_site
                         and equipment_ptr = v_PresentEquipPtr;-- c_cat.equipment_ptr;
            -- 2.3.8
                      update emdba.em_wo_t
                         set equip_cat_ptr = v_NewEquipCatPtr,
                             mod_date      = sysdate,
                             mod_user      = -16713
                       where site_id = p_SiteID
                         and equipment_ptr = v_PresentEquipPtr;
            -- 2.3.9
                      update emdba.em_route_t
                      set equip_cat_ptr = v_NewEquipCatPtr, --v_newcat,
                          mod_date = sysdate,
                          mod_user = -16713
                      where site_id = p_SiteID
                      and equipment_ptr = v_PresentEquipPtr;
            -- 2.3.10
                      if v_PresentAcronym != v_NewAcronym then
                              update emdba.em_wo_pm_qty_comp_t
                                 set acronym  = v_NewAcronym,
                                     mod_date = sysdate,
                                     mod_user = -16713
                               where site_id = p_SiteID
                                 and acronym = v_PresentAcronym --v_acro
                                 and equip_no = v_PresentEquipNum --c_cat.equip_no
                                 and subsite_id = v_PresentSubSite; --v_subsite;
                      end if;
            -------------------------------------------------------------
            -- 2.3.11
            select instr(v_StrFindWithin,';')
              into v_Pos -- ex: sequential iteration 12
              from dual;

        END LOOP;
        COMMIT;
        ----------------------------------------------------------
-- 3.
      htp.p('<?xml version="1.0"?><ROWSET>');
              htp.p('<ROW>
                           <equip_cat_ptr>' ||v_NewEquipCatPtr ||'</equip_cat_ptr>
                    </ROW>');
      htp.p('</ROWSET>');


END sp_updateClassCode;
--==============================================================================
--==============================================================================
END EM_EQUIP_EDITOR;
/
