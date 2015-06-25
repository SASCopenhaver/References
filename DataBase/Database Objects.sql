--==============================================================================
/*
select * from SYS.USER_OBJECTS
where object_type = 'TABLE';

select * from SYS.USER_CATALOG 
where table_type = 'TABLE';

select * from SYS.USER_TAB_COMMENTS;

select * from USER_COL_COMMENTS;

select * from USER_CONSTRAINTS;
select * from USER_CONS_COLUMNS;
select * from USER_TAB_COLUMNS;

select * from USER_DEPENDENCIES;
select * from USER_INDEXES;

select * from SYS.user_procedures up;
select * from SYS.user_arguments ua;

--TEST:-------------------------------------------------------------------------
DECLARE
c_Cursor1 SYS_REFCURSOR;
c_Cursor2 SYS_REFCURSOR;
v_argIN VARCHAR2(50) DEFAULT 'TABLE';
BEGIN
    PACK_DATADICTIONARY.sp_getSelectedObjList(v_argIN, c_Cursor1, c_Cursor2);
END;
SELECT * FROM z_test_val;
--------------------------------------------------------------------------------
--==============================================================================
-- TEST ========================================================================
DELETE Z_TEST_VAL;

-- 1:rc_getSelectedObjList =====================================================
LOOP 
  FETCH rc_getSelectedObjList INTO vTestNumber, vTestString;
  EXIT WHEN rc_getSelectedObjList%NOTFOUND;
  
  INSERT INTO Z_TEST_VAL (COL_NUMBER, COL_CHAR, COL_DATE) 
  VALUES (vTestNumber, vTestString, SYSDATE);
 -- COMMIT;
  
  END LOOP;
CLOSE rc_getSelectedObjList;
--------------------------------------------------------------------------------

-- 2: rc_getObjPropertyList
LOOP -- 
  FETCH rc_getObjPropertyList INTO vTestNumber, vTestString;
  EXIT WHEN rc_getObjPropertyList%NOTFOUND;
  
  INSERT INTO Z_TEST_VAL (COL_NUMBER, COL_CHAR, COL_DATE) 
  VALUES (vTestNumber, vTestString, SYSDATE);
 -- COMMIT;
  
  END LOOP;
CLOSE rc_getObjPropertyList;
--------------------------------------------------------------------------------
COMMIT;
--------------------------------------------------------------------------------
-- TEST ========================================================================
--==============================================================================


*/