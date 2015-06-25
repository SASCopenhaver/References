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
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table MENUS
  add constraint PK_MENUS primary key (IDS)
  using index 
  ;