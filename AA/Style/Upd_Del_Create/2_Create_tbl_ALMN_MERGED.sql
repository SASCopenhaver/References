-- Create table
create table ALMN_MERGED
(
  ALMN_ID                      NUMBER(9) not null,
  ALMN_PFX_DSC                 VARCHAR2(10),
  ALMN_LAST_NM                 VARCHAR2(60) not null,
  ALMN_LAST_NM2                VARCHAR2(25),
  ALMN_FRST_NM                 VARCHAR2(40),
  ALMN_MIDL_NM                 VARCHAR2(40),
  ALMN_SFX_DSC                 VARCHAR2(15),
  ALMN_SEX_IND                 VARCHAR2(2),
  ALMN_DOB_DT                  DATE,
  ALMN_DCSD_IND                CHAR(1) default 'N',
  ALMN_DSABLD_IND              CHAR(1) default 'N',
  ALMN_CTZNSP_CNTRY_CD         VARCHAR2(2),
  ALMN_CTZNSP_CNTRY_CD2        VARCHAR2(2),
  ALMN_RESDNC_ADRS_TXT         VARCHAR2(500),
  ALMN_RESDNC_CITY_NM          VARCHAR2(60),
  ALMN_RESDNC_STATE_PRVNC_NM   VARCHAR2(40),
  ALMN_RESDNC_CNTRY_CD         VARCHAR2(2),
  ALMN_LEGAL_STATE_CD          CHAR(2),
  ALMN_CNGRTSNL_DSTRCT_NUM     NUMBER(4),
  ALMN_BSNS_ADRS_TXT           VARCHAR2(500),
  ALMN_BSNS_CITY_NM            VARCHAR2(60),
  ALMN_BSNS_STATE_PRVNC_NM     VARCHAR2(40),
  ALMN_BSNS_CNTRY_CD           VARCHAR2(2),
  ALMN_PREFRD_ADRS_IND         VARCHAR2(2) default '-1',
  ALMN_RESDNC_PHONE_NUM        VARCHAR2(30),
  ALMN_BSNS_PHONE_NUM          VARCHAR2(30),
  ALMN_CELL_NUM                VARCHAR2(30),
  ALMN_OTHR_PHONE_NUM          VARCHAR2(30),
  ALMN_PREFRD_PHONE_NUM_IND    VARCHAR2(2) default '-1',
  ALMN_FAX_NUM                 VARCHAR2(30),
  ALMN_EMAIL1_TXT              VARCHAR2(60),
  ALMN_EMAIL2_TXT              VARCHAR2(60),
  ALMN_PREFRD_EMAIL_IND        VARCHAR2(2) default '-1',
  ALMN_CNTCT_IND               CHAR(1),
  ALMN_ELP_SPEAK_FSI_LEVEL_NUM NUMBER(1),
  ALMN_ELP_READ_FSI_LEVEL_NUM  NUMBER(1),
  ALMN_ELP_COMP_FSI_LEVEL_NUM  NUMBER(1),
  ALMN_NOTES_TXT               VARCHAR2(4000),
  ALMN_CRTD_DT                 DATE not null,
  ALMN_CRTD_ID                 VARCHAR2(30) not null,
  ALMN_UPDT_ID                 VARCHAR2(30),
  ALMN_UPDT_DT                 DATE,
  ORIGINAL_ALMN_ID             NUMBER(9) not null,
  PGM_SRC_NM                   VARCHAR2(50) not null,
  SHOW_ALMN_IND                CHAR(1) default 'Y',
  ALMN_BSNS_NM                 VARCHAR2(100),
  ALMN_BSNS_POSTL_CD           VARCHAR2(10),
  ALMN_RESDNC_POSTL_CD         VARCHAR2(10)
)
  ;
-- Create/Recreate primary, unique and foreign key constraints 
alter table ALMN_MERGED
  add constraint PK_ALMN_ID_MEARGAED primary key (ALMN_ID)
  using index 
  tablespace ALUMNI
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 1M
    next 504K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
