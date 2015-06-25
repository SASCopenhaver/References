-- Create table
create table PROJECT_MANAGERS
(
  PRJ_ID  NUMBER not null,
  USER_ID NUMBER not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table PROJECT_MANAGERS
  add constraint PK_PROJECT_MANAGERS primary key (PRJ_ID,USER_ID)
  using index 
  ;
