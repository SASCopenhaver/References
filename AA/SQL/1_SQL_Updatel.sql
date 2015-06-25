-- 1. 
DROP table PLACE_VISIT_MERGED;
---
create table PLACE_VISIT_MERGED
(
  PLACE_VISIT_PGM_ID         NUMBER(9) not null,
  PLACE_VISIT_ALMN_ID        NUMBER(9) not null,
  PLACE_VISIT_NUM            NUMBER(3) not null,
  PLACE_VISIT_CITY_NM        VARCHAR2(60),
  PLACE_VISIT_STATE_PRVNC_NM VARCHAR2(40),
  PLACE_VISIT_CNTRY_CD       VARCHAR2(2),
  PLACE_VISIT_HOST_INSTN_NM  VARCHAR2(200),
  PLACE_VISIT_CRTD_DT        DATE not null,
  PLACE_VISIT_CRTD_ID        VARCHAR2(30) not null,
  PLACE_VISIT_UPDT_DT        DATE,
  PLACE_VISIT_UPDT_ID        VARCHAR2(30),
  ORIGINAL_PGM_ID            NUMBER(9),
  ORIGINAL_ALMN_ID           NUMBER(9),
  PGM_SRC_NM                 VARCHAR2(50),
  PLACE_VISIT_MERGED_CD      VARCHAR2(1),
  MERGED_GROUP_PGM_ID        NUMBER(9),
  MERGED_GROUP_ALMN_ID       NUMBER(9),
  MERGE_STATUS               VARCHAR2(1) default 'P',
  MERGE_USR_ID               NUMBER(9)
)
;
comment on column PLACE_VISIT_MERGED.PLACE_VISIT_MERGED_CD
  is '"M" - Mereged Record (means this ALMN_ID has left in DB after merging and "E" eliminated from database IDs.  )';
comment on column PLACE_VISIT_MERGED.MERGED_GROUP_PGM_ID
  is 'PGM_ID of the record that will remain in the alumni table after merging';
comment on column PLACE_VISIT_MERGED.MERGED_GROUP_ALMN_ID
  is 'ALMN_ID of the record that will remain in the alumni table after merging';
comment on column PLACE_VISIT_MERGED.MERGE_STATUS
  is 'P- pending; C- complete';
---------------------------------------------------------------------------------------------

-- 2.
DROP table PGM_MERGED;
---
create table PGM_MERGED
(
  PGM_ID               NUMBER(9) not null,
  PGM_ALMN_ID          NUMBER(9) not null,
  PGM_TYPE_CD          NUMBER(9),
  PGM_FY_DT            NUMBER(4),
  PGM_YR_DT            NUMBER(4),
  PGM_START_DT         DATE,
  PGM_END_DT           DATE,
  PGM_FROM_CNTRY_CD    VARCHAR2(2),
  PGM_TO_CNTRY_CD      VARCHAR2(2),
  PGM_FIELD_STDY_CD    NUMBER(9),
  PGM_AGCY_NM          VARCHAR2(120),
  PGM_PLCMNT_ORG_NM    VARCHAR2(120),
  PGM_NMTNG_ORG_NM     VARCHAR2(120),
  PGM_SUB_CTGRY_TXT    VARCHAR2(200),
  PGM_TOPIC_TXT        VARCHAR2(260),
  PGM_STRTGC_GOAL_TXT  VARCHAR2(200),
  PGM_SPCL_AWARD_TXT   VARCHAR2(200),
  PGM_CRTD_DT          DATE,
  PGM_CRTD_ID          VARCHAR2(30),
  PGM_UPDT_DT          DATE,
  PGM_UPDT_ID          VARCHAR2(30),
  ORIGINAL_PGM_ID      NUMBER(9),
  ORIGINAL_ALMN_ID     NUMBER(9),
  PGM_SRC_NM           VARCHAR2(50),
  SHOW_PGM_IND         CHAR(1) default 'Y',
  PGM_MERGED_CD        VARCHAR2(1),
  MERGED_GROUP_PGM_ID  NUMBER(9),
  MERGED_GROUP_ALMN_ID NUMBER(9),
  MERGE_STATUS         VARCHAR2(1) default 'P',
  MERGE_USR_ID         NUMBER(9)
)
;
comment on column PGM_MERGED.MERGED_GROUP_PGM_ID
  is 'PGM_ID of the record that will remain in the alumni table after merging';
comment on column PGM_MERGED.MERGED_GROUP_ALMN_ID
  is 'ALMN_ID of the record that will remain in the alumni table after merging';
comment on column PGM_MERGED.MERGE_STATUS
  is 'P - pending; C - complete';
--------------------------------------------------------------------------------------

-- 3.
DROP table JOB_MERGED;
---
create table JOB_MERGED
(
  JOB_ALMN_ID      NUMBER(9) not null,
  JOB_NUM          NUMBER(3) not null,
  JOB_PGM_ID       NUMBER(9),
  JOB_TITLE_TXT    VARCHAR2(200),
  JOB_CRNT_IND     CHAR(1),
  JOB_INSTN_NM     VARCHAR2(200),
  JOB_CRTD_DT      DATE not null,
  JOB_CRTD_ID      VARCHAR2(30) not null,
  JOB_UPDT_DT      DATE,
  JOB_UPDT_ID      VARCHAR2(30),
  ORIGINAL_ALMN_ID NUMBER(9),
  PGM_SRC_NM       VARCHAR2(50),
  JOB_MERGED_CD    VARCHAR2(1),
  MERGED_GROUP_ID  NUMBER(9),
  MERGE_STATUS     VARCHAR2(1) default 'P',
  MERGE_USR_ID     NUMBER(9)
)
;
comment on column JOB_MERGED.JOB_MERGED_CD
  is '"M" - Mereged Record (means this ALMN_ID has left in DB after merging and "E" eliminated from database IDs.  )';
comment on column JOB_MERGED.MERGED_GROUP_ID
  is 'ID of the record that will remain in the alumni table after merging';
comment on column JOB_MERGED.MERGE_STATUS
  is 'P - pending; C - complete';
--------------------------------------------------------------------------------------

-- 4.
DROP table ERROR_MSG;
---
create table ERROR_MSG
(
  ERROR_DATE_TIME DATE default sysdate,
  ERROR_TXT       VARCHAR2(1000),
  ERROR_USR_ID    NUMBER,
  ERROR_SP_NAME   VARCHAR2(400)
)
;
---------------------------------------------------------------------------------------

-- 5.
DROP table CONVERTER;
---
create table CONVERTER
(
  CONVERTER_ID     NUMBER,
  CONVERTER_VAL    NUMBER,
  CONVERTER_PGM_ID NUMBER,
  CONV_VARCHAR2_1  VARCHAR2(1000),
  CONV_NUMBER_1    NUMBER,
  CONV_DATE_1      DATE,
  CONV_DESCR_1     VARCHAR2(1000),
  CONV_VARCHAR2_2  VARCHAR2(1000),
  CONV_NUMBER_2    NUMBER,
  CONV_DATE_2      DATE,
  CONV_DESCR_2     VARCHAR2(1000),
  CONV_VARCHAR2_3  VARCHAR2(1000),
  CONV_NUMBER_3    NUMBER,
  CONV_DATE_3      DATE,
  CONV_DESCR_3     VARCHAR2(1000)
)
;
create index INDX_CONV_ALMN_ID on CONVERTER (CONVERTER_VAL);
create index INDX_CONV_PGM_ID on CONVERTER (CONVERTER_PGM_ID);
-------------------------------------------------------------------------------------

-- 6.
DROP table ALMN_MERGED;
---
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
  ALMN_RESDNC_POSTL_CD         VARCHAR2(10),
  ALMN_MERGED_CD               VARCHAR2(1) default 'E',
  MERGED_GROUP_ID              NUMBER(9),
  MERGE_STATUS                 VARCHAR2(1) default 'P',
  MERGE_USR_ID                 NUMBER(9),
  MERGE_ORIG_PGM_COUNT         NUMBER
)
;
comment on column ALMN_MERGED.ALMN_MERGED_CD
  is '"M" - Mereged Record (means this ALMN_ID has left in DB after merging and "E" eliminated from database IDs.  )';
comment on column ALMN_MERGED.MERGED_GROUP_ID
  is 'ID of the record that will remain in the alumni table after merging';
comment on column ALMN_MERGED.MERGE_STATUS
  is 'P - pending; C - complete';
comment on column ALMN_MERGED.MERGE_ORIG_PGM_COUNT
  is 'Holds number of programs associated with almn_id before the merge';
alter table ALMN_MERGED
  add constraint PK_ALMN_ID_MERGAED primary key (ALMN_ID);
-------------------------------------------------------------------------------------
