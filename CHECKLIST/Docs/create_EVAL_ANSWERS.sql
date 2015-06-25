create table EVAL_ANSWERS
(
  EVAL_PERSONID NUMBER not null,
  EVAL_PRJID    NUMBER not null,
  Q_101         NUMBER default -1,
  Q_102         NUMBER default -1,
  Q_103         NUMBER default -1,
  Q_104         NUMBER default -1,
  Q_105         NUMBER default -1,
  Q_106         NUMBER default -1,
  Q_107         NUMBER default -1,
  Q_108         NUMBER default -1,
  Q_109         NUMBER default -1,
  Q_110         NUMBER default -1,
  Q_111         NUMBER default -1,
  Q_112         NUMBER default -1,
  Q_113         NUMBER default -1,
  Q_114         NUMBER default -1,
  Q_115         NUMBER default -1,
  Q_116         NUMBER default -1,
  Q_117         NUMBER default -1,
  Q_118         NUMBER default -1,
  Q_119         NUMBER default -1,
  Q_120         NUMBER default -1,
  Q_121         NUMBER default -1,
  Q_122         NUMBER default -1,
  Q_123         NUMBER default -1,
  Q_124         NUMBER default -1,
  Q_125         NUMBER default -1,
  Q_126         NUMBER default -1,
  Q_127         NUMBER default -1,
  EVAL_STATUS   VARCHAR2(2) default 'NE'
)
tablespace PHONEBOOK
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 304K
    next 304K
    minextents 1
    maxextents unlimited
    pctincrease 0
  );
-- Add comments to the columns 
comment on column EVAL_ANSWERS.EVAL_STATUS
  is 'Three Statuses of Evaluation: E - Evaluated; PE - Partially Evaluated; NE - Not Evaluated';
-- Create/Recreate primary, unique and foreign key constraints 
alter table EVAL_ANSWERS
  add constraint PK_EVALANSWER primary key (EVAL_PERSONID,EVAL_PRJID)
  disable;
-- Grant/Revoke object privileges 
grant select, insert, update, delete, references, alter, index on EVAL_ANSWERS to SCOTT;
grant select, insert, update, delete, references, alter, index on EVAL_ANSWERS to SYSTEM;
