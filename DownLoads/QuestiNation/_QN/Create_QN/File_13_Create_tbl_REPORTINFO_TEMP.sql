-- Create table
create table REPORTINFO_TEMP
(
  UUID    VARCHAR2(50) not null,
  PRJID   NUMBER not null,
  MNGROPP NUMBER,
  MNGRPE  NUMBER,
  MNGRTC  NUMBER,
  MNGRLS  NUMBER,
  MNGRPCE NUMBER,
  MNGRCAR NUMBER,
  MNGRCCR NUMBER,
  MNGRIC  NUMBER,
  MNGRTD  NUMBER,
  MNGRCO  NUMBER,
  PARTOPP NUMBER,
  PARTPE  NUMBER,
  PARTTC  NUMBER,
  PARTLS  NUMBER,
  PARTPCE NUMBER,
  PARTCAR NUMBER,
  PARTCCR NUMBER,
  PARTIC  NUMBER,
  PARTTD  NUMBER,
  PARTCO  NUMBER,
  PRJNAME VARCHAR2(255)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table REPORTINFO_TEMP
  add constraint PK_PRJINFO primary key (PRJID,UUID)
  using index 
 ;
