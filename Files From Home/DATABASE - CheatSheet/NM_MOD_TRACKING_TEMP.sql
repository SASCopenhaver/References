-- Create table
create global temporary table NM_MOD_TRACKING_TEMP
(
  parent_id            VARCHAR2(50),
  child_id             VARCHAR2(50),
  area                 CHAR(2),
  area_name            VARCHAR2(25),
  district_code        VARCHAR2(3),
  district_name        VARCHAR2(30),
  site_id              NUMBER,
  site_name            VARCHAR2(50),
  reg_workorder_no     VARCHAR2(50),
  bulletinno_descr     VARCHAR2(100),
  acronym              VARCHAR2(50),
  equip_no             VARCHAR2(50),
  serial_no            VARCHAR2(50),
  class_code           VARCHAR2(10),
  start_dt             VARCHAR2(10),
  due_dt               VARCHAR2(10),
  complete_dt          VARCHAR2(10),
  labor_hr             VARCHAR2(20),
  labor_cost           VARCHAR2(20),
  material_cost        VARCHAR2(20),
  record_status        VARCHAR2(20),
  date_ref             VARCHAR2(10),
  random_ref_num       NUMBER,
  past_due_reason_code NUMBER
)
on commit delete rows;
-- Grant/Revoke object privileges 
grant select, insert, update on NM_MOD_TRACKING_TEMP to EMAPP;
grant select, insert, update on NM_MOD_TRACKING_TEMP to EMDBA;
grant select, insert, update on NM_MOD_TRACKING_TEMP to MS47;
grant select, insert, update on NM_MOD_TRACKING_TEMP to PUBLIC;