CREATE OR REPLACE PACKAGE EMAPP.EM_BULLTN_EDITOR_01 IS
--=======================================================================================
  -- Author  : SERGEY
  -- Created : 4/12/2012 8:22:49 AM
  -- Purpose : Data entry form and validation of new Bulletins

  -- Public type declarations
  --type <TypeName> is <Datatype>;

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
v_ERROR_POS VARCHAR2(100)   default 'NOT DEFINED';
v_sqlerrm   VARCHAR2(1000);
v_sqlcode   VARCHAR2(1000);
--=======================================================================================
PROCEDURE sp_getFiscalYear;
--=======================================================================================
PROCEDURE sp_getDefaultDates;
--=======================================================================================
PROCEDURE sp_saveBulletin( p_currentUser          IN NUMBER
                          -- LIST OF BULLETINS:
                          ,p_listOfBulletins  IN NUMBER
                          -- BULLETIN DETAILS:
                          ,p_ModOrder_Type    IN VARCHAR2
                          ,p_ModOrder_Num_Seq IN VARCHAR2
                          ,p_ModOrder_Year    IN VARCHAR2
                          --...............
                          ,p_ModOrder_Date_Issued IN VARCHAR2
                          ,p_ModOrder_Date_Due   IN VARCHAR2
                          --..............
                          ,p_ModOrder_SoftVer    IN VARCHAR2
                          ,p_ModOrder_Descr      IN VARCHAR2
                          ,p_ModOrder_Comments   IN VARCHAR2
                          ,p_ModOrder_WorkCodes  IN VARCHAR2
                          ,p_ModOrder_ActionCode IN VARCHAR2
                          ,p_ModOrder_EstHours   IN NUMBER
                          --..............
                          ,p_NSN_1_4             IN VARCHAR2
                          ,p_NSN_2_2             IN VARCHAR2
                          ,p_NSN_3_3             IN VARCHAR2
                          ,p_NSN_4_4             IN VARCHAR2
                          --..............
                          ,p_ModOrder_Acronym    IN VARCHAR2
                          ,p_ModOrder_ClassCode  IN VARCHAR2
                          ,p_ModOrder_WorkOrder  IN NUMBER
                          );
--=======================================================================================
PROCEDURE sp_validateDates(p_ModOrder_Date_Issued IN VARCHAR2
                          ,p_ModOrder_Date_Due    IN VARCHAR2
                          );
--=======================================================================================
PROCEDURE sp_getBulletinList(p_Issue_DateFrom   IN VARCHAR2
                            ,p_Issue_DateTo     IN VARCHAR2
                            ,p_BulletinType     IN VARCHAR2
                            ,p_Bulletin_Num_Seq IN VARCHAR2
                            ,p_Bulletin_Year    IN VARCHAR2
                            ,p_CalcOrData       IN VARCHAR2);
--=======================================================================================
PROCEDURE sp_getBulletinRecordDetails(p_Bulletin_Ptr IN NUMBER);
--=======================================================================================
PROCEDURE sp_getsetWorkCodes;
--=======================================================================================
PROCEDURE sp_validateActionCode(p_ActionCode IN VARCHAR2);
--=======================================================================================
PROCEDURE sp_validateAcronymClassCode(p_Acronym   IN VARCHAR2
                                     ,p_ClassCode IN VARCHAR2);
--=======================================================================================
PROCEDURE sp_validateWorkOrder(p_Bulletin_Ptr IN NUMBER,
                               p_WorkOrder    IN NUMBER,
                               p_FiscalYear   IN VARCHAR2);
--=======================================================================================
PROCEDURE sp_getAppliedSites(p_Bulletin_Ptr IN NUMBER);
--=======================================================================================
PROCEDURE sp_applyBulletin( p_currentUser        IN NUMBER
                           ,p_Bulletin_Ptr       IN NUMBER
                           ,p_Applicable_Site_ID VARCHAR2
                           );
--=======================================================================================
PROCEDURE sp_CreateWO( p_currentUser  IN NUMBER
                      ,p_Bulletin_Ptr IN NUMBER
                      ,p_Site_ID      IN VARCHAR2);
--=======================================================================================
PROCEDURE sp_CloseRemoveWO( p_currentUser  IN NUMBER
                           ,p_Bulletin_Ptr IN NUMBER
                           ,p_Site_ID      IN VARCHAR2);
--=======================================================================================
FUNCTION f_DateDifference (arg_SS_MI_HH IN VARCHAR2,
                           arg_Date1    IN DATE,
                           arg_Date2    IN DATE) return NUMBER;
--=======================================================================================
FUNCTION f_getRegister( arg_SubSiteID    IN VARCHAR2
                       ,arg_BulletinType IN VARCHAR2
                       ) return VARCHAR2;
--=======================================================================================

END EM_BULLTN_EDITOR_01;
/
CREATE OR REPLACE PACKAGE BODY EMAPP.EM_BULLTN_EDITOR_01 IS

  -- Private type declarations
--  type <TypeName> is <Datatype>;

  -- Private constant declarations
--  <ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations

--=======================================================================================
PROCEDURE sp_getFiscalYear
IS
  v_CurrentFiscalYear CHAR(4)      DEFAULT '';

BEGIN
  SELECT c.fy
    INTO v_CurrentFiscalYear
    FROM EMDBA.EM_AP_CALENDAR_T c
   WHERE TRUNC(sysdate) BETWEEN c.start_date AND c.end_date;

htp.p('<?xml version="1.0"?>
          <ROWSET>
             <ROW>'||
                 '<CURRENT_FISCAL_YEAR>'||v_CurrentFiscalYear||'</CURRENT_FISCAL_YEAR>'||
            '</ROW>');
htp.p('</ROWSET>');


END sp_getFiscalYear;
--=======================================================================================
PROCEDURE sp_getDefaultDates
IS
  v_ModOrder_DateFrom VARCHAR2(10);
  v_ModOrder_DateTo   VARCHAR2(10);
--  v_RowCount          NUMBER;
BEGIN
    SELECT TO_CHAR(SYSDATE - 30, 'MM/DD/YYYY'), TO_CHAR(SYSDATE, 'MM/DD/YYYY')
      INTO v_ModOrder_DateFrom, v_ModOrder_DateTo
      FROM dual;

htp.p ('<ROW>
           <ModOrder_DateFrom>'||v_ModOrder_DateFrom||'</ModOrder_DateFrom>
           <ModOrder_DateTo>'  ||v_ModOrder_DateTo  ||'</ModOrder_DateTo>
        </ROW>');

END sp_getDefaultDates;
--=======================================================================================
PROCEDURE sp_saveBulletin( p_currentUser          IN NUMBER
                          -- LIST OF BULLETINS:
                          ,p_listOfBulletins  IN NUMBER
                          -- BULLETIN DETAILS:
                          ,p_ModOrder_Type    IN VARCHAR2
                          ,p_ModOrder_Num_Seq IN VARCHAR2
                          ,p_ModOrder_Year    IN VARCHAR2
                          --...............
                          ,p_ModOrder_Date_Issued IN VARCHAR2
                          ,p_ModOrder_Date_Due    IN VARCHAR2
                          --..............
                          ,p_ModOrder_SoftVer    IN VARCHAR2
                          ,p_ModOrder_Descr      IN VARCHAR2
                          ,p_ModOrder_Comments   IN VARCHAR2
                          ,p_ModOrder_WorkCodes  IN VARCHAR2
                          ,p_ModOrder_ActionCode IN VARCHAR2
                          ,p_ModOrder_EstHours   IN NUMBER
                          --..............
                          ,p_NSN_1_4 IN VARCHAR2
                          ,p_NSN_2_2 IN VARCHAR2
                          ,p_NSN_3_3 IN VARCHAR2
                          ,p_NSN_4_4 IN VARCHAR2
                          --..............
                          ,p_ModOrder_Acronym    IN VARCHAR2
                          ,p_ModOrder_ClassCode  IN VARCHAR2
                          ,p_ModOrder_WorkOrder  IN NUMBER
                          )



IS
-- VARIAVLE DECLARATION -----------------------------------------------------------------
v_Modification_No       VARCHAR2(12)   DEFAULT p_ModOrder_Type||'-'||p_ModOrder_Num_Seq||'-'||p_ModOrder_Year;

v_Date_Issued           DATE           DEFAULT TO_DATE(p_ModOrder_Date_Issued, 'MM/DD/YYYY');
v_Date_Due              DATE           DEFAULT TO_DATE(p_ModOrder_Date_Due,    'MM/DD/YYYY');

v_ModOrder_SoftVer      VARCHAR2(20)   DEFAULT UPPER(Trim(p_ModOrder_SoftVer));

v_WO_Desc               VARCHAR2(50)   DEFAULT /*v_Modification_No||' '||*/Trim(UPPER(p_ModOrder_Descr));
v_ModOrder_Comments     VARCHAR2(4000) DEFAULT UPPER(Trim(p_ModOrder_Comments));

v_Action_Verb_Noun_Code VARCHAR2(3)    DEFAULT UPPER(p_ModOrder_ActionCode);

v_NSN                   VARCHAR2(16)   DEFAULT Trim(p_NSN_1_4||'-'||p_NSN_2_2||'-'||p_NSN_3_3||'-'||p_NSN_4_4);

v_ModOrder_Acronym      VARCHAR2(12)   DEFAULT UPPER(p_ModOrder_Acronym);
v_ModOrder_ClassCode    VARCHAR2(2)    DEFAULT UPPER(p_ModOrder_ClassCode);

v_DateDifference        NUMBER         DEFAULT 24;
v_Priority              CHAR(1)        DEFAULT 'D';

v_NumOfRecds      NUMBER DEFAULT 0;
v_Bulletin_Ptr    NUMBER DEFAULT 0;
v_Bulletin_WO_Ptr NUMBER DEFAULT 0;


v_SQL VARCHAR2(2000);

----- Variables for updating EMDBA.EM_WO_T
v_upd_WO_Num   EMDBA.em_wo_t.wo_no%TYPE;     -- NUMBER;
v_upd_WorkCode EMDBA.em_wo_t.work_code%TYPE; -- VARCHAR2(2);
------------------------------------------
--.......................................................................................
--v_regno00   varchar2(3) := '396';
--v_regno50   varchar2(3) := '386';
--v_regno20   varchar2(3) := '376';
--.......................................................................................
-- VARIAVLE DECLARATION -----------------------------------------------------------------
BEGIN

--1. Assign values to selected variables:
    SELECT DECODE(p_ModOrder_Type,'SMO',v_ModOrder_SoftVer,NULL)
          ,DECODE(v_NSN,'---',NULL,v_NSN)
          ,DECODE(v_ModOrder_Comments,'',NULL,v_ModOrder_Comments)
      INTO v_ModOrder_SoftVer
          ,v_NSN
          ,v_ModOrder_Comments
      FROM dual;
--.......................................................................................
-- Prioriy: A - 1 day (24 hours);
--          B - 7 days (168 hours);
--          C - 30 days (720 hours);
--          D - Indefinite >30 days
-- 2. Determine Priority:
-- 2.1
    select EMAPP.EM_BULLTN_EDITOR_01.f_DateDifference('HH',v_Date_Due,v_Date_Issued)
      into v_DateDifference
    from dual;
-- 2.2
    if v_DateDifference <= 24 then
      v_Priority := 'A';
    elsif v_DateDifference > 24 and v_DateDifference <= 168 then
      v_Priority := 'B';
    elsif v_DateDifference > 168 and v_DateDifference <= 720 then
      v_Priority := 'C';
    else
      v_Priority := 'D';
    end if;
-----------------------------------------------------------------------------------------
-- 3. Evaluate a value in p_listOfBulletins:
    IF p_listOfBulletins < 0 THEN -- It means that a new record must be created
-- 3.1 Create a new Bulletin Pointer:
        SELECT DECODE(Max(br.bulletin_ptr), NULL, 0, Max(br.bulletin_ptr)) + 1
          INTO v_Bulletin_Ptr
          FROM EMDBA.EM_BULLETIN_REPOSITORY_T br
          ;
-- 3.2
       INSERT INTO emdba.em_bulletin_repository_t
         (bulletin_ptr, modification_no, date_issued, date_due, soft_ver, wo_desc,
          wo_comment, work_code, action_verb_noun_code, est_hours_due, nsn, acronym, class_code,
          wo_no, priority, em_wo_t_updated, create_date, create_user, mod_date, mod_user
         )
       VALUES
         ( v_Bulletin_Ptr          -- bulletin_ptr,
          ,v_Modification_No       -- modification_no,
          ,v_Date_Issued           -- date_issued,
          ,v_Date_Due              -- date_due,
          ,v_ModOrder_SoftVer      -- soft_ver,
          ,v_WO_Desc               -- wo_desc,
          ,v_ModOrder_Comments     -- wo_comment,
          ,p_ModOrder_WorkCodes     -- work_code
          ,v_Action_Verb_Noun_Code -- action_verb_noun_code,
          ,p_ModOrder_EstHours     -- est_hours_due,
          ,v_NSN                   -- nsn,
          ,v_ModOrder_Acronym      -- acronym,
          ,v_ModOrder_ClassCode    -- class_code,
          ,p_ModOrder_WorkOrder    -- wo_no,
          ,v_Priority              -- priority,
          ,'N'                     -- em_wo_t_updated,
          ,SYSDATE                 -- create_date,
          ,p_currentUser           -- create_user,
          ,NULL                    -- mod_date,
          ,NULL                    -- mod_user
        );
-- 4
   ELSE -- It means that records should be updated.
-- 4.1
       SELECT p_listOfBulletins
         INTO v_Bulletin_Ptr
         FROM dual
         ;
       SELECT br.wo_no, br.work_code
         INTO v_upd_WO_Num, v_upd_WorkCode
         FROM EMDBA.EM_BULLETIN_REPOSITORY_T br
        WHERE br.bulletin_ptr = v_Bulletin_Ptr;
--4.2
       UPDATE emdba.em_bulletin_repository_t br
          SET --bulletin_ptr = v_bulletin_ptr,
              --modification_no =       v_Modification_No,
              date_issued =           v_Date_Issued,
              date_due =              v_Date_Due,
              soft_ver =              v_ModOrder_SoftVer,
              wo_desc =               v_WO_Desc,
              wo_comment =            v_ModOrder_Comments,
              work_code =             p_ModOrder_WorkCodes,
              action_verb_noun_code = v_Action_Verb_Noun_Code,
              est_hours_due =         p_ModOrder_EstHours,
              nsn =                   v_NSN,
              --acronym =               v_ModOrder_Acronym,
              --class_code =            v_ModOrder_ClassCode,
              wo_no =                 p_ModOrder_WorkOrder,
              priority =              v_Priority,
              --em_wo_t_updated =       'N',
              --create_date = v_create_date,
              --create_user = v_create_user,
              mod_date =              SYSDATE,
              mod_user =              p_currentUser
        WHERE br.bulletin_ptr = v_Bulletin_Ptr
        ;

        UPDATE emdba.em_wo_t w
           SET --w.modification_no = v_Modification_No,
               w.date_issued   = v_Date_Issued,
               w.date_due      = v_Date_Due,
               w.wo_desc       = v_Modification_No||' '||v_WO_Desc,
               w.wo_comment    = v_ModOrder_Comments,
               w.work_code     = p_ModOrder_WorkCodes,
               w.verb_code     = substr(v_Action_Verb_Noun_Code, 1, 1),
               w.noun_code     = substr(v_Action_Verb_Noun_Code, 2, 2),
               w.est_hours     = to_number(p_ModOrder_EstHours),
               w.priority_code = v_Priority,
               w.wo_no         = p_ModOrder_WorkOrder,
               w.mod_date      = sysdate,
               w.mod_user      = p_currentUser
         WHERE w.wo_no = v_upd_WO_Num
           AND w.modification_no = v_Modification_No
           AND w.wo_status = 'O'
           AND w.work_code = v_upd_WorkCode
           ;

    END IF;

    COMMIT;
-- X.
htp.p('<?xml version="1.0"?>
          <ROWSET>
             <ROW>'||
                 '<verb_code>'||v_Bulletin_Ptr||'</verb_code>'||
            '</ROW>');
htp.p('</ROWSET>');

--EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
            -- Table: select * from ms47.ms47_sp_error_log order by
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_BULLETIN_EDITOR_PKG.sp_saveBulletin'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );


--EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
END sp_saveBulletin;

--=======================================================================================
PROCEDURE sp_validateDates(p_ModOrder_Date_Issued IN VARCHAR2
                          ,p_ModOrder_Date_Due    IN VARCHAR2)
IS
v_Date_Issued DATE DEFAULT SYSDATE;
v_Date_Due    DATE DEFAULT SYSDATE;

v_IssueDateBack  NUMBER DEFAULT 30;
v_IssueDueDtDiff NUMBER DEFAULT 0;

BEGIN
-----------------------------------------------------------------------------------------
--1. Assign values to selected variables:
    select TO_DATE(p_ModOrder_Date_Issued, 'MM/DD/YYYY')
      into v_Date_Issued
      from dual;

    select TO_DATE(p_ModOrder_Date_Due, 'MM/DD/YYYY')
      into v_Date_Due
      from dual;
-- 2. Compare Issue Date with SYSDATE
    select EMAPP.EM_BULLTN_EDITOR_01.f_DateDifference('DD',SYSDATE,v_Date_Issued)
      into v_IssueDateBack
    from dual;
-- 3. Compare Due Date and Issue Date
    select EMAPP.EM_BULLTN_EDITOR_01.f_DateDifference('DD',v_Date_Due,v_Date_Issued)
      into v_IssueDueDtDiff
    from dual;
-----------------------------------------------------------------------------------------
htp.p ('<ROW>
           <ISSUE_DATE_BACK>'||v_IssueDateBack||'</ISSUE_DATE_BACK>
           <ISSUE_DUE_DIFF>'||v_IssueDueDtDiff||'</ISSUE_DUE_DIFF>
           <SYSTEM_DATE>'||TO_CHAR(Trunc(sysdate),'MM/DD/YYYY')||'</SYSTEM_DATE>
        </ROW>');
-----------------------------------------------------------------------------------------
END sp_validateDates;
--=======================================================================================
PROCEDURE sp_getBulletinList(p_Issue_DateFrom   IN VARCHAR2
                            ,p_Issue_DateTo     IN VARCHAR2
                            ,p_BulletinType     IN VARCHAR2
                            ,p_Bulletin_Num_Seq IN VARCHAR2
                            ,p_Bulletin_Year    IN VARCHAR2
                            ,p_CalcOrData       IN VARCHAR2)
IS
--......................................................................................
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( bulletin_ptr    NUMBER
                             ,modification_no VARCHAR2(12)
                             ,date_issued     VARCHAR2(10)
                             ,date_due        VARCHAR2(10)
                             ,soft_ver        VARCHAR2(20)
                             ,wo_desc         VARCHAR2(50)
                             ,nsn             VARCHAR2(16)
                             ,acronym         VARCHAR2(12)
                             ,class_code      VARCHAR2(2)
                             ,em_wo_t_updated CHAR(1)
                            );
v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;
--.....................................................................................

TYPE cRef_getData_Count IS REF CURSOR;
TYPE rRef_getData_Count IS RECORD (num_of_records NUMBER);

c_AvailableRecords_Count cRef_getData_Count;
r_Record_Count           rRef_getData_Count;

--...................................................................................
-- These variables will be used to build a dynamic SELECT statement:
v_BulletinType     VARCHAR2(100) DEFAULT '
AND 1=1 ';
v_Bulletin_Num_Seq VARCHAR2(100) DEFAULT '
AND 1=1 ';
v_Bulletin_Year    VARCHAR2(100) DEFAULT '
AND 1=1 ';
--------------------------------------------------------------------------------------
BEGIN
--....................................................................................
-- PREPARE DYNAMIC SELECT STATEMENT:
IF p_BulletinType != '-1' THEN
  v_BulletinType := '
  AND SubStr(modification_no, 1,3) = '''||p_BulletinType||''' ';
END IF;
--....................................................................................
IF (TRIM(p_Bulletin_Num_Seq) != '' OR p_Bulletin_Num_Seq IS NOT NULL) AND Length(p_Bulletin_Num_Seq) < 3 THEN
  v_Bulletin_Num_Seq := '
  AND SubStr(modification_no,5,3) LIKE (''%'||p_Bulletin_Num_Seq||'%'') ';
ELSIF (TRIM(p_Bulletin_Num_Seq) != '' OR p_Bulletin_Num_Seq IS NOT NULL) AND Length(p_Bulletin_Num_Seq) = 3 THEN
    v_Bulletin_Num_Seq := '
  AND SubStr(modification_no,5,3) = '''||p_Bulletin_Num_Seq||''' ';
END IF;
--....................................................................................
IF (TRIM(p_Bulletin_Year) != '' OR p_Bulletin_Year IS NOT NULL) AND Length(p_Bulletin_Year) < 2 THEN
  v_Bulletin_Year := '
  AND SubStr(modification_no,9,2) LIKE (''%'||p_Bulletin_Year||'%'') ';
ELSIF (TRIM(p_Bulletin_Year) != '' OR p_Bulletin_Year IS NOT NULL) AND Length(p_Bulletin_Year) = 2 THEN
    v_Bulletin_Year := '
  AND SubStr(modification_no,9,2) = '''||p_Bulletin_Year||''' ';
END IF;
--....................................................................................

IF p_CalcOrData = 'CALC_RECORDS' THEN

     v_SQL :=
         'SELECT COUNT(*) AS num_of_records
            FROM EMDBA.em_bulletin_repository_t t
           WHERE t.date_issued BETWEEN To_Date('''||p_Issue_DateFrom||''',''MM/DD/YYYY'')-1
                                   AND To_Date('''||p_Issue_DateTo  ||''',''MM/DD/YYYY'')'
              ||v_BulletinType
              ||v_Bulletin_Num_Seq
              ||v_Bulletin_Year
          ;
ELSIF p_CalcOrData = 'GET_DATA' THEN

     v_SQL :=
         'SELECT bulletin_ptr,
                 modification_no,
                 TO_CHAR(date_issued,''MM/DD/YYYY'') as date_issued,
                 TO_CHAR(date_due,   ''MM/DD/YYYY'') as date_due,
                 soft_ver,
                 wo_desc,
                 nsn,
                 acronym,
                 class_code,
                 em_wo_t_updated
            FROM EMDBA.em_bulletin_repository_t t
           WHERE t.date_issued BETWEEN To_Date('''||p_Issue_DateFrom||''',''MM/DD/YYYY'')-1
                                   AND To_Date('''||p_Issue_DateTo  ||''',''MM/DD/YYYY'')'
              ||v_BulletinType
              ||v_Bulletin_Num_Seq
              ||v_Bulletin_Year
              ||'ORDER BY date_issued, modification_no, acronym, class_code'
          ;
END IF;
---------------------------------------------------------------------------
IF p_CalcOrData = 'CALC_RECORDS' THEN

    htp.p('<?xml version="1.0"?><ROWSET>');
        OPEN c_AvailableRecords_Count FOR v_SQL;
            LOOP
                FETCH c_AvailableRecords_Count INTO r_Record_Count;
                EXIT WHEN c_AvailableRecords_Count%NOTFOUND;



                htp.p('<ROW>'||
                           '<bulletin_ptr>'||r_Record_Count.num_of_records||'</bulletin_ptr>'||
                      '</ROW>');
            END LOOP;
        CLOSE c_AvailableRecords_Count;
    htp.p('</ROWSET>');

ELSIF  p_CalcOrData = 'GET_DATA' THEN

    htp.p('<?xml version="1.0"?><ROWSET>');
        OPEN c_AvailableRecords FOR v_SQL;
            LOOP
                FETCH c_AvailableRecords INTO r_Record;

                EXIT WHEN c_AvailableRecords%NOTFOUND;
                htp.p('<ROW>'||
                           '<bulletin_ptr>'   ||r_Record.bulletin_ptr||'</bulletin_ptr>'||
                           '<modification_no>'||r_Record.modification_no||'</modification_no>'||
                           '<date_issued>'    ||r_Record.date_issued||'</date_issued>'||
                           '<date_due>'       ||r_Record.date_due||'</date_due>'||
                           '<soft_ver>'       ||r_Record.soft_ver||'</soft_ver>'||
                           '<wo_desc>'        ||r_Record.wo_desc||'</wo_desc>'||
                           '<nsn>'            ||r_Record.nsn||'</nsn>'||
                           '<acronym>'        ||r_Record.acronym||'</acronym>'||
                           '<class_code>'     ||r_Record.class_code||'</class_code>'||
                           '<em_wo_t_updated>'||r_Record.em_wo_t_updated||'</em_wo_t_updated>'||
                      '</ROW>');
            END LOOP;
        CLOSE c_AvailableRecords;
    htp.p('</ROWSET>');

END IF;
--------------------------------------------------------------------------------
   EXCEPTION
      WHEN OTHERS
      THEN
         emapp.em_error_pkg.em_errorinsert_prc;
         RAISE;
--------------------------------------------------------------------------------
END sp_getBulletinList;
--=======================================================================================
PROCEDURE sp_getBulletinRecordDetails(p_Bulletin_Ptr IN NUMBER)
IS
  CURSOR c_getBulletinRecordDetails IS
       SELECT bulletin_ptr,
              modification_no,
              TO_CHAR(date_issued,'MM/DD/YYYY') AS date_issued,
              TO_CHAR(date_due,'MM/DD/YYYY') AS date_due,
              soft_ver,
              wo_desc,
              NVL(wo_comment,'') as wo_comment,
              work_code,
              action_verb_noun_code,
              est_hours_due,
              NVL(nsn,'') AS nsn,
              acronym,
              class_code,
              wo_no
         FROM emdba.em_bulletin_repository_t b
        WHERE b.bulletin_ptr = p_Bulletin_Ptr;
BEGIN
htp.p('<?xml version="1.0"?>
          <ROWSET>');
     FOR r_Record IN c_getBulletinRecordDetails
       LOOP
htp.p('<ROW>'||
            '<bulletin_ptr>'        ||r_Record.bulletin_ptr||'</bulletin_ptr>'||
            '<ModOrder_Type>'       ||SubStr(r_Record.modification_no,1,3)||'</ModOrder_Type>'||
            '<ModOrder_Num_Seq>'    ||SubStr(r_Record.modification_no,5,3)||'</ModOrder_Num_Seq>'||
            '<ModOrder_Year>'       ||SubStr(r_Record.modification_no,9,2)||'</ModOrder_Year>'||
            '<ModOrder_Date_Issued>'||r_Record.date_issued||'</ModOrder_Date_Issued>'||
            '<ModOrder_Date_Due>'   ||r_Record.date_due||'</ModOrder_Date_Due>'||
            '<ModOrder_SoftVer>'    ||r_Record.soft_ver||'</ModOrder_SoftVer>'||
            '<ModOrder_Descr>'      ||r_Record.wo_desc||'</ModOrder_Descr>'||
            '<ModOrder_Comments>'   ||r_Record.Wo_Comment||'</ModOrder_Comments>'||
            '<ModOrder_Work_Code>'  ||r_Record.Work_Code||'</ModOrder_Work_Code>'||
            '<ModOrder_ActionCode>' ||r_Record.action_verb_noun_code||'</ModOrder_ActionCode>'||
            '<ModOrder_EstHours>'   ||r_Record.Est_Hours_Due||'</ModOrder_EstHours>'||
            '<NSN_1_4>'             ||Substr(r_Record.Nsn,1,4)||'</NSN_1_4>'||
            '<NSN_2_2>'             ||Substr(r_Record.Nsn,6,2)||'</NSN_2_2>'||
            '<NSN_3_3>'             ||Substr(r_Record.Nsn,9,3)||'</NSN_3_3>'||
            '<NSN_4_4>'             ||Substr(r_Record.Nsn,13,4)||'</NSN_4_4>'||
            '<ModOrder_Acronym>'    ||r_Record.acronym||'</ModOrder_Acronym>'||
            '<ModOrder_ClassCode>'  ||r_Record.class_code||'</ModOrder_ClassCode>'||
            '<ModOrder_WorkOrder>'  ||r_Record.Wo_No||'</ModOrder_WorkOrder>'||
        '</ROW>');
       END LOOP;
htp.p('   </ROWSET>');
END sp_getBulletinRecordDetails;
--=======================================================================================
PROCEDURE sp_getsetWorkCodes
IS
--......................................................................................
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( work_code VARCHAR2(2)
                             ,work_code_desc VARCHAR2(50)
                            );
v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;
--.....................................................................................
BEGIN
--.....................................................................................
  v_SQL := 'SELECT wc.work_code AS work_code,
                   REGEXP_REPLACE(wc.work_code_desc,''&'',''AND'') AS work_code_desc
              FROM emdba.em_work_code_t wc
             WHERE wc.work_code IN (''11'',''12'',''13'',''17'',''18'')
          ORDER BY TO_NUMBER(wc.work_code)';

-- SASurikov 02/13/2013
-- Per conversation with Mark Schwabenlander, "WHERE" clause was added to the SELECT statement.
-- It is an attempt to minimize mistakes during bulletin creation.

    htp.p('<?xml version="1.0"?><ROWSET>');
        OPEN c_AvailableRecords FOR v_SQL;
            LOOP
                FETCH c_AvailableRecords INTO r_Record;

                EXIT WHEN c_AvailableRecords%NOTFOUND;
                htp.p('<ROW>'||
                           '<work_code>'     ||r_Record.work_code     ||'</work_code>'||
                           '<work_code_desc>'||r_Record.work_code_desc||'</work_code_desc>'||
                      '</ROW>');
            END LOOP;
        CLOSE c_AvailableRecords;
    htp.p('</ROWSET>');


--.....................................................................................
END sp_getsetWorkCodes;
--========================================================================================

PROCEDURE sp_validateActionCode(p_ActionCode IN VARCHAR2) IS

  v_Verb VARCHAR2(100) DEFAULT '0';
  v_Noun VARCHAR2(100) DEFAULT '0';
-- "0" represent an absence of code.

  v_Counter NUMBER;

BEGIN
-- 1. Handling VERB code:
  SELECT Count(*)
    INTO v_Counter
    FROM EMDBA.Em_Verb_t v
   WHERE UPPER(v.verb_code) = UPPER(SUBSTR(p_ActionCode, 1, 1));

  IF v_Counter != 0 THEN
    select v.verb_code||' - '||v.verb_desc
      into v_Verb
      from EMDBA.Em_Verb_t v
     where UPPER(v.verb_code) = UPPER(SUBSTR(p_ActionCode, 1, 1));
  END IF;

-- 2. Handling NOUN code:
   SELECT Count(*)
     INTO v_Counter
     FROM  EMDBA.Em_Noun_t n
    WHERE UPPER(n.noun_code) = UPPER(SUBSTR(p_ActionCode, 2, 2));

   IF v_Counter != 0 THEN
     select n.noun_code||' - '||n.noun_desc
       into v_Noun
       from EMDBA.Em_Noun_t n
      where UPPER(n.noun_code) = UPPER(SUBSTR(p_ActionCode, 2, 2));
   END IF;

-- 3. Output the results of validation:
htp.p('<?xml version="1.0"?>
          <ROWSET>
             <ROW>'||
                 '<verb_code>'||v_Verb||'</verb_code>'||
                 '<noun_code>'||v_Noun||'</noun_code>'||
            '</ROW>');
htp.p('</ROWSET>');
--------------------------------------------------------------------------------
   EXCEPTION
      WHEN OTHERS
      THEN
         emapp.em_error_pkg.em_errorinsert_prc;
         RAISE;
--------------------------------------------------------------------------------
END sp_validateActionCode;
--=======================================================================================
PROCEDURE sp_validateAcronymClassCode(p_Acronym   IN VARCHAR2
                                     ,p_ClassCode IN VARCHAR2)
IS
v_Counter NUMBER;
BEGIN
  SELECT Count(*)
    INTO v_Counter
    FROM EMDBA.EM_ACRONYM_MASTER_T t
   WHERE UPPER(t.acronym) = UPPER(p_Acronym)
     AND UPPER(t.class_code) = UPPER(p_ClassCode)
  ;
----------------------------------------------------------------------------------------
htp.p('<?xml version="1.0"?>
          <ROWSET>');
htp.p('  <ROW>'||
          '<counter>'||v_Counter||'</counter>'||
        '</ROW>');
htp.p('   </ROWSET>');
----------------------------------------------------------------------------------------
END sp_validateAcronymClassCode;
--=======================================================================================
/*
PROCEDURE em_getActiveSites
IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( site_id        emdba.em_site_t.site_id%TYPE   -- NUMBER
                             ,site_name_show emdba.em_site_t.site_name%TYPE -- VARCHAR2(50)
                             --,site_status_code emdba.em_site_t.site_status_code%TYPE -- VARCHAR2(1)
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
 WHERE site_status_code = 'A'
 ;
 v_SQL := 'SELECT a.site_id
                 ,''(''||LPAD(to_char(a.site_id), 3)||'') ''||
                  LPAD(REGEXP_REPLACE(site_name, ''[^][A-Z]'', '' ''),'||v_SiteName_MaxLen||')||'' - ''||a.state as site_name_show
                  --,a.site_status_code
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
                       --<SITE_STATUS_CODE>'||r_Record.site_status_code||'</SITE_STATUS_CODE>'
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
END em_getActiveSites;
*/
--=======================================================================================
PROCEDURE sp_validateWorkOrder(p_Bulletin_Ptr IN NUMBER,
                               p_WorkOrder    IN NUMBER,
                               p_FiscalYear   IN VARCHAR2)
IS
v_RtnVal VARCHAR2(3) default 'YES';
BEGIN
-- "YES" - Validation is passwed.  It means that provided Work Order number could be used.
-- "NO"  - Validation is not passed.  Provided Work Order Number already had been uses within
--         given Fiscal Year.
    SELECT DECODE(Count(*),0,'YES','NO')
      INTO v_RtnVal
      FROM EMDBA.em_bulletin_repository_t br
     WHERE br.bulletin_ptr != p_Bulletin_Ptr
       AND br.wo_no = p_WorkOrder
       AND SUBSTR(br.modification_no,9) = p_FiscalYear;
----------------------------------------------------------------------------------------
htp.p('<?xml version="1.0"?>
          <ROWSET>');
htp.p('  <ROW>'||
          '<rtnval>'||v_RtnVal||'</rtnval>'||
        '</ROW>');
htp.p('   </ROWSET>');
----------------------------------------------------------------------------------------

END sp_validateWorkOrder;
--=======================================================================================
PROCEDURE sp_getAppliedSites(p_Bulletin_Ptr IN NUMBER)
IS
   v_Applicable_Site_ID EMDBA.Em_Bulletin_Repository_t.APPLICABLE_SITE_ID%TYPE;
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
   SELECT NVL(br.applicable_site_id,'')
     INTO v_Applicable_Site_ID
     FROM EMDBA.em_bulletin_repository_t br
    WHERE br.bulletin_ptr = p_Bulletin_Ptr
    ;
--------------------------------------------------------------------------------
SELECT MAX(LENGTH( REGEXP_REPLACE(site_name, '[^][A-Z]', ' ') ))
  INTO v_SiteName_MaxLen
  FROM emdba.em_site_t
 --WHERE site_status_code = 'A'
 ;
 v_SQL := 'SELECT s.site_id,
                  ''(''||LPAD(to_char(s.site_id), 3)||'')''||
                  LPAD(REGEXP_REPLACE(s.site_name, ''[^][A-Z]'', '' ''),'||v_SiteName_MaxLen||')||'' - ''||s.state as site_name_show,
                  s.site_status_code
             FROM emdba.em_site_t s
            WHERE s.site_id in ( select column_value
                             from table(NMARS.nm_equip_mods.f_convertStringToListOfVals('''||v_Applicable_Site_ID||''')) )
         ORDER BY s.site_name, s.state';
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
/*htp.p('<?xml version="1.0"?><ROWSET>');
            htp.p('<ROW>'||
                     '<SITE_ID>'||v_Applicable_Site_ID||'</SITE_ID>'
                ||'</ROW>');
htp.p('</ROWSET>');*/
--------------------------------------------------------------------------------
   EXCEPTION
      WHEN OTHERS
      THEN
         emapp.em_error_pkg.em_errorinsert_prc;
         RAISE;
--------------------------------------------------------------------------------
END sp_getAppliedSites;
--========================================================================================
PROCEDURE sp_applyBulletin( p_currentUser        IN NUMBER
                           ,p_Bulletin_Ptr       IN NUMBER
                           ,p_Applicable_Site_ID VARCHAR2
                           )
IS
-----------------------------------------------------------------------------------
v_MSG VARCHAR2(100) DEFAULT 'NO ERRORS';
---
v_ListOfSitesInDB VARCHAR2(4000) DEFAULT '';
v_SiteID_List VARCHAR2(4000);
v_Comma           VARCHAR2(1) DEFAULT ',';
---
v_DistinctList varchar2(4000) default '';
v_DistinctValue varchar2(100) default NULL;

v_EquipCounter NUMBER DEFAULT 0; 
-----------------------------------------------------------------------------------
BEGIN
    
    SELECT b.applicable_site_id
      INTO v_ListOfSitesInDB    
      FROM emdba.em_bulletin_repository_t b
     WHERE b.bulletin_ptr = p_Bulletin_Ptr;    

-- I. CREATE or ADD Work Order(s):
    FOR c_CreateWO IN (
                           -- SELECT statement below brings an output of the sites from the screen:
                           select TO_NUMBER(column_value) as column_value
                             from table(NMARS.nm_equip_mods.f_convertStringToListOfVals(''||p_Applicable_Site_ID||''))
                             order by column_value
                        )
    LOOP
    v_ERROR_POS := 'Pos2: p_Bulletin_Ptr='||p_Bulletin_Ptr||'; SiteID='||c_CreateWO.column_value;

       SELECT Count(*)
         INTO v_EquipCounter
         FROM emdba.em_equipment_t e,
              emdba.em_acronym_t   a,
              emdba.em_site_t      s
        WHERE a.site_id = e.site_id
          AND s.site_id = e.site_id
          ---
          AND a.equip_cat_ptr    = e.equip_cat_ptr
          ---
          AND a.acronym    = (select acronym
                                from emdba.em_bulletin_repository_t
                               where bulletin_ptr = p_Bulletin_Ptr)
          AND a.class_code = (select class_code
                                from emdba.em_bulletin_repository_t
                               where bulletin_ptr = p_Bulletin_Ptr)
          --
          AND e.equip_status_code = 'A'
          AND e.subsite_id IN ('00', '20', '50')
          --
          AND s.site_id = c_CreateWO.column_value;
        ------------------------------------------------------------------------
        IF v_EquipCounter > 0 THEN
           sp_CreateWO( p_currentUser, p_Bulletin_Ptr, c_CreateWO.column_value);
           v_DistinctList := v_DistinctList||','||c_CreateWO.column_value;
        END IF;
        ------------------------------------------------------------------------
    END LOOP; -- CREATE or ADD Work Order(s) loop ends
    
    IF SUBSTR(v_DistinctList,1,1) = v_Comma THEN
        select substr(v_DistinctList,2)
          into v_DistinctList
          from dual;
    END IF;   
    
    UPDATE EMDBA.Em_Bulletin_Repository_t b
       SET b.applicable_site_id = v_DistinctList||','
          ,b.em_wo_t_updated = 'Y'
     WHERE b.bulletin_ptr = p_Bulletin_Ptr;
    
    COMMIT;
      
   
-- II. REMOVE Work Order(s):
delete emdba.test_values; commit;
         IF v_ListOfSitesInDB IS NOT NULL THEN
             
         
                FOR c_CloseRemoveWO IN (
                                       -- SELECT statement below brings an output of the sites from the table emdba.em_bulletin_repository_t 
                                       select TO_NUMBER(column_value) as column_value
                                         from table(NMARS.nm_equip_mods.f_convertStringToListOfVals(''||v_ListOfSitesInDB||''))        
                                       ---
                                       MINUS
                                       ---    
                                       -- SELECT statement below brings an output of the sites from the screen:
                                       select TO_NUMBER(column_value) as column_value
                                         from table(NMARS.nm_equip_mods.f_convertStringToListOfVals(''||p_Applicable_Site_ID||''))
                                       ORDER BY column_value ASC
                                    )
               LOOP
                   SELECT Count(*)
                     INTO v_EquipCounter
                     FROM emdba.em_equipment_t e,
                          emdba.em_acronym_t   a,
                          emdba.em_site_t      s
                    WHERE a.site_id = e.site_id
                      AND s.site_id = e.site_id
                      ---
                      AND a.equip_cat_ptr    = e.equip_cat_ptr
                      ---
                      AND a.acronym    = (select acronym
                                            from emdba.em_bulletin_repository_t
                                           where bulletin_ptr = p_Bulletin_Ptr)
                      AND a.class_code = (select class_code
                                            from emdba.em_bulletin_repository_t
                                           where bulletin_ptr = p_Bulletin_Ptr)
                      --
                      AND e.equip_status_code = 'A'
                      AND e.subsite_id IN ('00', '20', '50')
                      --
                      AND s.site_id = c_CloseRemoveWO.column_value;
                   ------------------------------------------------------------------------------------
                   IF v_EquipCounter != 0 THEN
                       sp_CloseRemoveWO(p_currentUser, p_Bulletin_Ptr, c_CloseRemoveWO.column_value);
                   END IF;
                   ------------------------------------------------------------------------------------
               END LOOP;   -- REMOVE Work Order(s):   
         END IF;

v_sqlcode := SQLCODE;

IF v_sqlcode = 0 THEN
   v_MSG := 'WORK_ORDERS_CREATED';
ELSE
   v_MSG := 'ERROR'; -- site_id='||v_SiteID_Temp;
END IF;


htp.p('<?xml version="1.0"?><ROWSET>');
            htp.p('<ROW>'||
                       '<MSG>'||v_MSG||'</MSG>'
                  ||'</ROW>');
htp.p('</ROWSET>');
--------------------------------------------------------------------------------
            -- Table: select * from ms47.ms47_sp_error_log order by 1;
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_BULLETIN_EDITOR_PKG.sp_applyBulletin'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );
---------------------------------------------------------------------------------

END sp_applyBulletin;
--=======================================================================================

PROCEDURE sp_CloseRemoveWO( p_currentUser        IN NUMBER
                           ,p_Bulletin_Ptr       IN NUMBER
                           ,p_Site_ID VARCHAR2)
IS
v_Modification_No VARCHAR2(10);
v_WO_No           NUMBER;
BEGIN
    -- 1:-------------------------------
    SELECT b.modification_no, b.wo_no
      INTO v_Modification_No, v_WO_No
      FROM EMDBA.Em_Bulletin_Repository_t b
     WHERE b.bulletin_ptr = p_Bulletin_Ptr;    
     
    -- 2:-------------------------------
    DELETE emdba.em_wo_t w
     WHERE w.site_id = p_Site_ID
       AND w.wo_no = v_WO_No
       AND w.modification_no = v_Modification_No
       AND w.crew_id IS NULL
       AND w.wo_status = 'O';
       
    -- 3.1:-----------------------------
    DELETE emdba.em_wo_worksheet_t ws
     WHERE ws.site_id = p_Site_ID
       AND ws.ws_status = 'O'
       AND ws.wo_ptr IN (
                           select w.wo_ptr
                             from emdba.em_wo_t w
                            where w.site_id = ws.site_id
                              and w.wo_no = v_WO_No
                              and w.modification_no = v_Modification_No
                              and (w.hours_to_date = 0
                                   or
                                   w.hours_to_date is null)
                              and w.wo_status = ws.ws_status -- 'O'
                         )
    ;
    -- 3.2:
    DELETE emdba.em_wo_t w
     WHERE w.site_id = p_Site_ID
       AND w.wo_no = v_WO_No
       AND w.modification_no = v_Modification_No
       AND (w.hours_to_date = 0
            or
            w.hours_to_date is null)
       AND w.wo_status = 'O'
     ;
     
     -- 4 ------------------------------
     UPDATE emdba.em_wo_t w
        SET wo_status = 'C',
            wo_comment = 'MTSC RESCINDED THIS BULLETIN; THEREFORE, EMARS CLOSED THIS WORK ORDER',
            date_closed = SYSDATE,
            mod_date = SYSDATE,
            mod_user = p_currentUser
      WHERE w.site_id = p_Site_ID
        AND w.wo_status = 'O'
        AND (w.hours_to_date IS NOT NULL 
             or
             w.hours_to_date!= 0)
        AND w.wo_no = v_WO_No
        AND w.modification_no = v_Modification_No
        ;

COMMIT;     
END sp_CloseRemoveWO;

--=======================================================================================
PROCEDURE sp_CreateWO( p_currentUser        IN NUMBER
                      ,p_Bulletin_Ptr       IN NUMBER
                      ,p_Site_ID VARCHAR2)

IS
-----------------------------------------------------------------------------------

v_ModOrder_Type         VARCHAR2(3);
v_Modification_No       VARCHAR2(12);
v_ModOrder_Acronym      VARCHAR2(12);
v_ModOrder_ClassCode    VARCHAR2(2);
v_Action_Verb_Noun_Code VARCHAR2(3);
v_Date_Issued           DATE;
v_Date_Due              DATE;
v_Priority              CHAR(1);
v_ModOrder_EstHours     NUMBER;
v_ModOrder_Comments     VARCHAR2(4000);
v_WO_Desc               VARCHAR2(50);
v_ModOrder_WorkCodes    VARCHAR2(2);
v_ModOrder_WorkOrder    NUMBER;
v_CreateDate            DATE;

v_DateDiff       NUMBER;
v_Date_Due_WO    DATE;
---
v_SiteID_List           VARCHAR2(4000) ;
v_SiteID_ListItem       VARCHAR2(100);
--
v_WO_Counter NUMBER;
v_LastDigitOfFY_minus_2 NUMBER;
v_LastDigitOfFY_minus_1 NUMBER;
v_LastDigitOfFY_current NUMBER;
--.................................................................................
CURSOR c_Equip IS
       SELECT e.site_id,
              a.acronym,
              e.equip_no,
              a.class_code,
              e.equipment_ptr,
              a.equip_cat_ptr,
              e.subsite_id,
              s.zip,
              EMAPP.Em_Bulltn_Editor_01.f_getRegister(e.subsite_id ,v_ModOrder_Type) AS reg_no
         FROM emdba.em_equipment_t e,
              emdba.em_acronym_t   a,
              emdba.em_site_t      s
        WHERE a.site_id = e.site_id
          AND s.site_id = e.site_id
          ---
          AND a.equip_cat_ptr    = e.equip_cat_ptr
          AND s.site_status_code = 'A'
          ---
          AND a.acronym    = v_ModOrder_Acronym
          AND a.class_code = v_ModOrder_ClassCode
          --
          AND e.equip_status_code = 'A'
          AND e.subsite_id IN ('00', '20', '50')
          --
          AND s.site_id = p_Site_ID 
          ;
-----------------------------------------------------------------------------------
BEGIN
----------------------    
    SELECT to_number(SUBSTR(to_char((to_number(c.fy)-2)),4))
          ,to_number(SUBSTR(to_char((to_number(c.fy)-1)),4))
          ,TO_NUMBER(SUBSTR(c.fy,4))
      INTO v_LastDigitOfFY_minus_2
          ,v_LastDigitOfFY_minus_1
          ,v_LastDigitOfFY_current
      FROM EMDBA.EM_AP_CALENDAR_T c
     WHERE trunc(sysdate) BETWEEN c.start_date AND c.end_date;
     
v_ERROR_POS := 'Pos1';
----------------------
-- 1:
   SELECT substr(b.modification_no, 1, 3)
         ,b.modification_no
         ,b.acronym
         ,b.class_code
         ,b.action_verb_noun_code
         ,b.date_issued
         ,b.date_due
         ,b.priority
         ,b.est_hours_due
         ,b.wo_comment
         ,b.wo_desc
         ,b.work_code
         ,b.wo_no
         ,b.create_date
     INTO v_ModOrder_Type
         ,v_Modification_No
         ,v_ModOrder_Acronym
         ,v_ModOrder_ClassCode
         ,v_Action_Verb_Noun_Code
         ,v_Date_Issued
         ,v_Date_Due
         ,v_Priority
         ,v_ModOrder_EstHours
         ,v_ModOrder_Comments
         ,v_WO_Desc
         ,v_ModOrder_WorkCodes
         ,v_ModOrder_WorkOrder
         ,v_CreateDate
     FROM EMDBA.Em_Bulletin_Repository_t b
    WHERE b.bulletin_ptr = p_Bulletin_Ptr
     ;
     
v_ERROR_POS := 'Pos2';

-- 2:     
    FOR r_Equip IN c_Equip LOOP   
       
---------------------
       SELECT ABS(f_DateDifference('DD',TRUNC(v_Date_Issued), TRUNC(SYSDATE)))
         INTO v_DateDiff
         FROM dual;
     
       IF v_DateDiff != 0 THEN
           v_Date_Due_WO := TRUNC(v_Date_Due)+v_DateDiff;
       ELSE
           v_Date_Due_WO := TRUNC(v_Date_Due);
       END IF;
---------------------
v_ERROR_POS := 'Pos3 '||'SiteID='||r_Equip.site_id;


    SELECT Count(*)
      INTO v_WO_Counter
      FROM emdba.em_wo_t w,
           emdba.em_acronym_t a
     WHERE w.site_id       = r_Equip.site_id
       AND a.site_id       = w.site_id
       AND a.equip_cat_ptr = w.equip_cat_ptr
       AND a.acronym       = r_Equip.acronym
       AND (   w.reg_no between to_char(v_LastDigitOfFY_minus_2)||'73' and v_LastDigitOfFY_current||'76'
            OR w.reg_no between to_char(v_LastDigitOfFY_minus_2)||'83' and v_LastDigitOfFY_current||'86'
            OR w.reg_no between to_char(v_LastDigitOfFY_minus_2)||'93' and v_LastDigitOfFY_current||'96'
               OR
               w.reg_no between to_char(v_LastDigitOfFY_minus_1)||'73' and v_LastDigitOfFY_current||'76'
            OR w.reg_no between to_char(v_LastDigitOfFY_minus_1)||'83' and v_LastDigitOfFY_current||'86'
            OR w.reg_no between to_char(v_LastDigitOfFY_minus_1)||'93' and v_LastDigitOfFY_current||'96'
               OR
               w.reg_no between to_char(v_LastDigitOfFY_current)||'73' and v_LastDigitOfFY_current||'76'
            OR w.reg_no between to_char(v_LastDigitOfFY_current)||'83' and v_LastDigitOfFY_current||'86'
            OR w.reg_no between to_char(v_LastDigitOfFY_current)||'93' and v_LastDigitOfFY_current||'96'
            )
       AND w.modification_no = v_Modification_No --1
       AND a.class_code      = v_ModOrder_ClassCode -- 2
       AND w.subsite_id      = r_Equip.subsite_id -- 3
       AND w.equipment_ptr   = r_Equip.equipment_ptr -- 4
       ;
    
v_ERROR_POS := 'Pos4'||' SiteID='||r_Equip.site_id;
---------------------
       IF v_WO_Counter = 0 THEN

                INSERT INTO emdba.em_wo_t
                  (site_id, wo_ptr, reg_no, wo_no, modification_no, route_ptr, equip_cat_ptr, equip_no, ---
                   wo_type_code, wo_status, subsite_id, route_no, combine_id, combine_wono, combine_comment,---
                   work_code, equipment_ptr, wo_desc, wo_comment, standing_flag, est_hours, ---
                   priority_code, date_issued, hours_to_date, dept_code, date_due, ---
                   react_id, date_closed, verb_code, noun_code, cause_code, ---
                   material_cost, labor_cost, last_checklist_item, checklist_date, pm_freq_code, ---
                   labor_group, hours_down_maint, hours_down_part, hours_down_other, show_schedule_yn, ---
                   period_ptr, route_reason, crew_id, checklist_no, tour, requesting_person, --
                   project_id, scheduled_date, create_date, create_user, mod_date, mod_user, ---
                   sched_day, whep_fac_id, ecbm_checklist_no, fssp_call_num, fssp_problem_num, fssp_zip,
                   est_hours_due, fss_ma_id, past_due_reason_code)
                VALUES
                  (  r_Equip.Site_Id             --site_id,
                    ,EMDBA.em_wo_ptr_seq.NEXTVAL -- wo_ptr,
                    ,r_Equip.Reg_No              -- reg_no,
                    ,v_ModOrder_WorkOrder        -- wo_no,
                    ,v_Modification_No           -- modification_no,
                    ,NULL                        -- route_ptr,
                    ,r_Equip.Equip_Cat_Ptr       -- equip_cat_ptr,
                    ,r_Equip.Equip_No            -- equip_no,
                    ---
                    ,'C'                         -- wo_type_code,
                    ,'O' -- O - "OPEN" C- "CLOSE"  wo_status,
                    ,r_Equip.Subsite_Id          -- subsite_id,
                    ,NULL                        -- route_no,
                    ,NULL                        -- combine_id,
                    ,NULL                        -- combine_wono,
                    ,NULL                        -- combine_comment,
                    ---
                    ,v_ModOrder_WorkCodes         -- work_code,
                    ,r_Equip.Equipment_Ptr       -- equipment_ptr,
                    ,v_Modification_No||' '||v_WO_Desc  -- wo_desc,
                    ,v_ModOrder_Comments         -- wo_comment,
                    ,'N'                         -- standing_flag,
                    ,v_ModOrder_EstHours         -- est_hours,
                    ---
                    ,v_Priority                  -- priority_code,
                    ,v_Date_Issued               -- date_issued,
                    ,0                           -- hours_to_date,
                    ,'700'                       -- EMDBA.EM_DEPT_T  -- dept_code: HQ,MTSC,REG OR DIV
                    ,v_Date_Due_WO               -- date_due,
                    ---
                    ,NULL                        -- react_id,
                    ,NULL                        -- date_closed,
                    ,substr(v_Action_Verb_Noun_Code, 1, 1)  -- verb_code,
                    ,substr(v_Action_Verb_Noun_Code, 2, 2)  -- noun_code,
                    ,NULL                        -- cause_code,
                    ---
                    ,0                           -- material_cost,
                    ,0                           -- labor_cost,
                    ,NULL                        -- last_checklist_item,
                    ,NULL                        -- checklist_date,
                    ,NULL                        -- pm_freq_code,
                    ---
                    ,NULL                        -- labor_group,
                    ,0                           -- hours_down_maint,
                    ,0                           -- hours_down_part,
                    ,0                           -- hours_down_other,
                    ,'N'                         -- show_schedule_yn,
                    ---
                    ,NULL                        -- period_ptr,
                    ,NULL                        -- route_reason,
                    ,NULL                        -- crew_id,
                    ,NULL                        -- checklist_no,
                    ,NULL                        -- tour,
                    ,NULL                        -- requesting_person,
                     ---
                    ,NULL                        -- project_id,
                    ,NULL                        -- scheduled_date,
                    ,SYSDATE                     -- create_date,
                    ,p_currentUser               -- create_user,
                    ,SYSDATE                     -- mod_date,
                    ,p_currentUser               -- mod_user,
                    ,NULL                        -- sched_day,
                    ,NULL                        -- whep_fac_id,
                    ,NULL                        -- ecbm_checklist_no,
                    ,NULL                        -- fssp_call_num,
                    ,NULL                        -- fssp_problem_num,
                    ,NULL                        -- fssp_zip,
                    ,NULL                        -- est_hours_due,
                    ,NULL                        -- fss_ma_id,
                    ,NULL                        -- past_due_reason_code
                      );

       ELSE -- v_WO_Counter != 0
                
                UPDATE EMDBA.Em_Wo_t w
                   SET w.date_due = v_Date_Due_WO
                      ,w.priority_code = v_Priority
                      ,w.wo_status = 'O'
                      ,w.date_closed = NULL
                      --,w.crew_id = NULL
                      ,w.mod_date = SYSDATE
                      ,w.mod_user = p_currentUser
                      ,w.wo_comment = w.wo_comment||' Reopened on '||TO_CHAR(SYSDATE,'MM/DD/YYYY')
                 WHERE w.site_id = r_Equip.Site_Id
                   AND w.wo_no   = v_ModOrder_WorkOrder
                   AND w.wo_status = 'C'
                   AND w.modification_no = v_Modification_No
                   AND w.reg_no = r_Equip.Reg_No
                   ;
       
       END IF;

    END LOOP;

COMMIT;
------------------------------------------------------------------------------------
            -- Table: select * from ms47.ms47_sp_error_log order by 1
            EXCEPTION
                WHEN OTHERS
                THEN
                v_sqlerrm := SQLERRM;
                v_sqlcode := SQLCODE;
            ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                             ,'EM_BULLETIN_EDITOR_PKG.sp_CreateWO'
                                                             ,-1
                                                             ,0
                                                             ,0
                                                             ,v_ERROR_POS
                                                             ,v_sqlcode
                                                             ,v_sqlerrm
                                                            );


------------------------------------------------------------------------------------
END sp_CreateWO;
--=======================================================================================

FUNCTION f_DateDifference (arg_SS_MI_HH IN VARCHAR2,
                           arg_Date1    IN DATE,
                           arg_Date2    IN DATE) return NUMBER
AS
  v_RtnVal NUMBER;
BEGIN
     SELECT (arg_Date1-arg_Date2) * DECODE( UPPER(arg_SS_MI_HH),'SS', 24*60*60
                                                               ,'MI', 24*60
                                                               ,'HH', 24
                                                               ,'DD', 1
                                                               ,NULL)
       INTO v_RtnVal
       FROM dual;

       RETURN v_RtnVal;

END f_DateDifference;
--=======================================================================================
FUNCTION f_getRegister( arg_SubSiteID    IN VARCHAR2
                       ,arg_BulletinType IN VARCHAR2
                       ) return VARCHAR2
/*
Register consists of 3 digits.
  The first digit represents the forth digit in a Fiscal Year: "2" for "2012".
  The secont and the third depensds on combination of SubsiteID and Bulletin Type.
  The logic described avove is presented in the table below.
  As an exemple Fiscal year "2011" is used:
  -------------------------------------
  Register  SUBSITE   Bulletin_Type
  173       20        MWO
  174       20        MSB
  175       20        SMO
  176       20        MMO

  183       50        MWO
  184       50        MSB
  185       50        SMO
  186       50        MMO

  193       00        MWO
  194       00        MSB
  195       00        SMO
  196       00        MMO
----------------------------------------
*/

AS
  v_RtnVal      VARCHAR2(3) DEFAULT '';
  v_RegNo_Pos_1 CHAR(1);
BEGIN
--1.
  SELECT SUBSTR(c.fy,4)
    INTO v_RegNo_Pos_1
    FROM EMDBA.EM_AP_CALENDAR_T c
   WHERE TRUNC(SYSDATE) BETWEEN c.start_date AND c.end_date;

-- 2.
  SELECT DECODE(arg_SubSiteID||arg_BulletinType,  '00MWO','93'
                                                 ,'00MSB','94'
                                                 ,'00SMO','95'
                                                 ,'00MMO','96'
                                                 -----------
                                                 ,'20MWO','73'
                                                 ,'20MSB','74'
                                                 ,'20SMO','75'
                                                 ,'20MMO','76'
                                                 -----------
                                                 ,'50MWO','83'
                                                 ,'50MSB','84'
                                                 ,'50SMO','85'
                                                 ,'50MMO','86')

    INTO v_RtnVal
    FROM dual;

    RETURN v_RegNo_Pos_1||v_RtnVal;

END f_getRegister;
--=======================================================================================
END EM_BULLTN_EDITOR_01;
/
