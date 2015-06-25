--------------------------------------------------------------------------------
DROP sequence USERS_ID;
create sequence USERS_ID increment by 1 start with 280;

DROP sequence ORGANIZATION_ID;
create sequence ORGANIZATION_ID increment by 1 start with 4;

DROP sequence ReaserchDates_IDs;
create sequence ReaserchDates_IDs increment by 1 start with 1;

DROP sequence SEQ_EMAIL;
create sequence SEQ_EMAIL
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1;
