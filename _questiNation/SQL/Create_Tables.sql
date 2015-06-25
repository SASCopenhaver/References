-- Create table
create table ANSWERS
(
  PARTICIPANT_ID NUMBER(10) not null,
  REASERCH_ID    NUMBER(10) not null,
  Q1             NUMBER(10) default -10,
  Q2             NUMBER(10) default -10,
  Q3             NUMBER(10) default -10,
  Q4             NUMBER(10) default -10,
  Q5             NUMBER(10) default -10,
  Q6             NUMBER(10) default -10,
  Q7             NUMBER(10) default -10,
  Q8             NUMBER(10) default -10,
  Q9             NUMBER(10) default -10,
  Q10            NUMBER(10) default -10,
  Q11            NUMBER(10) default -10,
  Q12            NUMBER(10) default -10,
  Q13            NUMBER(10) default -10,
  Q14            NUMBER(10) default -10,
  Q15            NUMBER(10) default -10,
  Q16            NUMBER(10) default -10,
  Q17            NUMBER(10) default -10,
  Q18            NUMBER(10) default -10,
  Q19            NUMBER(10) default -10,
  Q20            NUMBER(10) default -10,
  Q21            NUMBER(10) default -10,
  Q22            NUMBER(10) default -10,
  Q23            NUMBER(10) default -10,
  Q24            NUMBER(10) default -10,
  Q25            NUMBER(10) default -10,
  Q26            NUMBER(10) default -10,
  Q27            NUMBER(10) default -10,
  Q28            NUMBER(10) default -10,
  Q29            NUMBER(10) default -10,
  Q30            NUMBER(10) default -10,
  Q31            NUMBER(10) default -10,
  Q32            NUMBER(10) default -10,
  Q33            NUMBER(10) default -10,
  Q34            NUMBER(10) default -10,
  Q35            NUMBER(10) default -10,
  Q36            NUMBER(10) default -10,
  Q37            NUMBER(10) default -10,
  Q38            NUMBER(10) default -10,
  Q39            NUMBER(10) default -10,
  Q40            NUMBER(10) default -10,
  Q41            NUMBER(10) default -10,
  Q42            NUMBER(10) default -10
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table ANSWERS
  add primary key (PARTICIPANT_ID,REASERCH_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
--------------------------------------------------------------------------------
-- Create table
create table COMMENTS
(
  PRJ_ID   NUMBER not null,
  USER_ID  NUMBER not null,
  Q_NUM    NUMBER not null,
  COMMENTS VARCHAR2(1)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table COMMENTS
  add constraint PK_COMMENTS primary key (PRJ_ID,USER_ID,Q_NUM)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
--------------------------------------------------------------------------------
-- Create table
create table MENUS
(
  IDS                   NUMBER(10) not null,
  MENU_ITEM             VARCHAR2(100) not null,
  SUPER_MENU            NUMBER not null,
  MENU_DESCRIPTION      VARCHAR2(200) not null,
  PAGE_TO_BE_CALLED     VARCHAR2(50) not null,
  IMG                   VARCHAR2(50),
  ORDER_TO_BE_PRESENTED NUMBER not null,
  MENU_OWNERSHIP        VARCHAR2(15)
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table MENUS
  add constraint PK_MENUS primary key (IDS)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
--------------------------------------------------------------------------------
-- Create table
create table ORGANIZATIONS
(
  IDS          NUMBER(10) not null,
  ABBREVIATION VARCHAR2(10) not null,
  FULL_NAME    VARCHAR2(100) not null
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table ORGANIZATIONS
  add constraint PK_ORGANIZATION_ID primary key (IDS)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
alter table ORGANIZATIONS
  add unique (ABBREVIATION)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
alter table ORGANIZATIONS
  add unique (FULL_NAME)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
--------------------------------------------------------------------------------
-- Create table
create table POTENTIAL_ANSWERS
(
  ANSWER_TYPE    CHAR(2) not null,
  ANSWER_LITERAL CHAR(1) not null,
  ANSWER_NUMERIC NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table POTENTIAL_ANSWERS
  add primary key (ANSWER_TYPE,ANSWER_LITERAL,ANSWER_NUMERIC)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
--------------------------------------------------------------------------------
-- Create table
create table PROJECT_MANAGERS
(
  PRJ_ID  NUMBER not null,
  USER_ID NUMBER not null
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table PROJECT_MANAGERS
  add constraint PK_PROJECT_MANAGERS primary key (PRJ_ID,USER_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
--------------------------------------------------------------------------------
-- Create table
create table QUESTIONS_LK
(
  IDS         NUMBER(10) not null,
  Q_TEXT      VARCHAR2(200) not null,
  ANSWER_TYPE CHAR(2) not null
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table QUESTIONS_LK
  add primary key (IDS)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
alter table QUESTIONS_LK
  add unique (Q_TEXT)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
--------------------------------------------------------------------------------
-- Create table
create table REASERCH_DATES
(
  IDS              NUMBER(10) not null,
  DESCRIPTIONS     VARCHAR2(255) not null,
  START_DATE       DATE not null,
  END_DATE         DATE not null,
  ANYBODY_ANSWERED CHAR(1),
  PRJ_SUPER_ID     NUMBER
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table REASERCH_DATES
  add primary key (IDS)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );

--------------------------------------------------------------------------------
-- Create table
create table USERS
(
  IDS       NUMBER not null,
  FNAME     VARCHAR2(20) not null,
  LNAME     VARCHAR2(20) not null,
  PASS      VARCHAR2(10) not null,
  EMAIL     VARCHAR2(100),
  ACT_INACT CHAR(1) default 'A' not null,
  ORG_ID    NUMBER not null
)
tablespace USERS
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table USERS
  add constraint PK_USERS primary key (IDS)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 128K
    minextents 1
    maxextents 4096
    pctincrease 0
  );
--------------------------------------------------------------------------------