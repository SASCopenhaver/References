CREATE OR REPLACE TRIGGER SYNC_PHONEBOOK_EVDB_TRG_new
  after update on phonebook
  for each row
  WHEN (new.draft_yn = 'N')
declare
    vPersonID NUMBER;
    RtnVal NUMBER;
begin
-----------------------------------------------------------------------
-- USIA.PERSON --------------------------------------------------------
     vPersonID := pack_func.f_PersonID( InitCap(:new.firstname)
                                       ,InitCap(:new.middle_initial)
                                       ,InitCap(:new.lastname)
                                       ,InitCap(:new.prefix) );
------------------------------------------------------------------------
-- USIA.PERSON_ORGANIZATION --------------------------------------------
     RtnVal := pack_func.f_Org( vPersonID
                               ,:new.org_id
                               ,:new.person_role ); --po_position
------------------------------------------------------------------------
-- USIA.PERSON_PERSON_ROLE ---------------------------------------------

   RtnVal := pack_func.f_Role( vPersonID          
                              ,:new.person_role );
------------------------------------------------------------------------
-- USIA.PERSON_PHONE_NUMBER --------------------------------------------

   RtnVal := PACK_FUNC.f_PhonesFax(
                                   vPersonID
                                  ,:new.workphone
                                  ,NVL(:new.homephone, 'NotAvailable')
                                  ,NVL(:new.faxnumber, 'NotAvailable')
                                  );

------------------------------------------------------------------------
-- USIA.PERSON_EMAIL ---------------------------------------------------
   RtnVal := PACK_FUNC.f_Email (
                                vPersonID
                               ,:new.work_emailaddress
                               ,NVL(:new.personal_emailaddress, 'NotAvailable')
                               );
------------------------------------------------------------------------

end SYNC_PHONEBOOK_EVDB_TRG_new;



****************************************************************************************************************************************************************************************************************

CREATE OR REPLACE package           PACK_FUNC as

  -- Author  : Sergey Surikov
  -- Created : 2/3/2003 12:40:38 PM
  -- Purpose :  
----------------------------------------------------------------- 
  function f_PersonID(
                      varFName  IN VARCHAR2
                     ,varMName  IN VARCHAR2
                     ,varLName  IN VARCHAR2
                     ,varPrefix IN VARCHAR2
                     ) return NUMBER;
----------------------------------------------------------------- 
  
  function f_Org( varPersonID IN NUMBER
                 ,varOrgID    IN NUMBER
                 ,varPos      IN VARCHAR2
                ) return NUMBER;                                                                
----------------------------------------------------------------- 

  function f_Role( varPersonID IN NUMBER
                  ,varRole     IN VARCHAR2
                 ) return NUMBER;    
-----------------------------------------------------------------

  function f_PhonesFax(
                       varPersonID  IN NUMBER
                      ,varWorkPhone IN VARCHAR2
                      ,varHomePhone IN VARCHAR2
                      ,varFax       IN VARCHAR2
                      ) return NUMBER; 
-----------------------------------------------------------------

  function f_Email (
                    varPersonID      IN NUMBER
                   ,varWorkEmail     IN VARCHAR2
                   ,varPersonalEmail IN VARCHAR2
                   ) return NUMBER; 
----------------------------------------------------------------- 

--pragma RESTRICT_REFERENCES(f_PersonID, WNDS,WNPS,RNPS);
           

end PACK_FUNC;
/

CREATE OR REPLACE package body           PACK_FUNC as

----------------------------------------------------------------------

function f_PersonID (
            varFName IN VARCHAR2
           ,varMName IN VARCHAR2
           ,varLName IN VARCHAR2
           ,varPrefix IN VARCHAR2
           ) return NUMBER
is
  vPersonID NUMBER;
begin
--
  select per_person_id into vPersonID
   from usia.person
   where per_first_name = varFName
         and
         per_middle_name = varMName
         and
         per_last_name = varLName;
   Return vPersonID;
--
  EXCEPTION
   when NO_DATA_FOUND then

      select usia.s_audit_id.nextval into vPersonID
       from dual;

   insert into usia.person (
          per_person_id
         ,per_first_name
         ,per_middle_name
         ,per_last_name
         ,per_familiar_name
         ,per_sort_name
         ,per_prefix
         ,per_createdby
          )
    values(
           vPersonID
          ,varFName
          ,varMName
          ,varLName
          ,varFName
          ,RTrim( varLName||', '||varFName||' '||DECODE(NVL(varMName,''), '', '', varMName||'.')  )
          ,varPrefix
          ,'trigger'
           );

--
  Return vPersonID;
--
end f_PersonID;
--------------------------------------------------------------------

function f_Org(  varPersonID IN NUMBER
                ,varOrgID    IN NUMBER
                ,varPos      IN VARCHAR2
                ) return NUMBER
IS
  RtnVal NUMBER;
  vPR_Description VARCHAR2(20);
Begin
   RtnVal :=0;
   select count(po_person_id )
    into RtnVal
    from usia.person_organization po
    where po.po_person_id = varPersonID
          and
          po_organization_id = varOrgID;

          select pr_description into vPR_Description
          from usia.person_role
          where pr_role_code = varPos;

     IF RtnVal > 0 THEN

         UPDATE usia.person_organization po
         SET po.po_status = 'A', po.po_primary = 'Y'
         where po.po_person_id = varPersonID
           and
           po_organization_id = varOrgID;
     ELSE

         insert into usia.person_organization
         ( po_person_id, po_organization_id, po_position, po_status, po_primary )
         values
         ( varPersonID, varOrgID, vPR_Description,'A', 'Y' );

     END IF;

         UPDATE usia.person_organization po
         SET po.po_status = 'I', po.po_primary = 'N'
         where po.po_person_id = varPersonID
           and
           po_organization_id <> varOrgID;


    Return RtnVal;

End f_Org;

--------------------------------------------------------------------

function f_Role( varPersonID IN NUMBER
                ,varRole     IN VARCHAR2
               ) return NUMBER
is
RtnVal NUMBER;
Begin

     select count(*) into RtnVal
      from usia.person_person_role ppr
      where ppr.ppr_person_id = varPersonID;

     IF RtnVal = 0 THEN
        insert into usia.person_person_role
         ( ppr_person_id, ppr_role )
        values
         ( varPersonID, varRole );
     END IF;

     Return RtnVal;

End f_Role;
--------------------------------------------------------------------

function f_PhonesFax(
                       varPersonID  IN NUMBER
                      ,varWorkPhone IN VARCHAR2
                      ,varHomePhone IN VARCHAR2
                      ,varFax       IN VARCHAR2
                      ) return NUMBER
is
RtnVal NUMBER;
Begin
--
     DELETE usia.person_phone_number
      where ppn_person_id = varPersonID;
--
     begin
          insert into usia.person_phone_number
                 (ppn_phone_id
                 ,ppn_person_id
                 ,ppn_number
                 ,ppn_location
                 ,ppn_type
                 ,ppn_perferred)
          values
                (usia.s_audit_id.NextVal
                ,varPersonID
                ,varWorkPhone
                ,'B'
                ,'T'
                ,'Y');
     end;
--
     if varHomePhone <> 'NotAvailable' then
      begin
           insert into usia.person_phone_number
                 (ppn_phone_id
                 ,ppn_person_id
                 ,ppn_number
                 ,ppn_location
                 ,ppn_type
                 ,ppn_perferred)
          values
                (usia.s_audit_id.NextVal
                ,varPersonID
                ,varHomePhone
                ,'H'
                ,'T'
                ,'N');
      end;
     end if;
--
     if varFax <> 'NotAvailable' then
      begin
           insert into usia.person_phone_number
                 (ppn_phone_id
                 ,ppn_person_id
                 ,ppn_number
                 ,ppn_location
                 ,ppn_type
                 ,ppn_perferred)
          values
                (usia.s_audit_id.NextVal
                ,varPersonID
                ,varFax
                ,'B'
                ,'F'
                ,'N');
      end;
     end if;
--
     RtnVal := 0;
     Return RtnVal;
End f_PhonesFax;
--------------------------------------------------------------------

function f_Email (
                  varPersonID      IN NUMBER
                 ,varWorkEmail     IN VARCHAR2
                 ,varPersonalEmail IN VARCHAR2
                 ) return NUMBER
is
RtnVal NUMBER;
Begin
--
     delete usia.person_email
      where pem_person_id = varPersonID;
--
    begin
     insert into usia.person_email
       (pem_email_id
       ,pem_person_id
       ,pem_email
       ,pem_location
       ,pem_preferred)
     values
       (usia.s_audit_id.NextVal
       ,varPersonID
       ,varWorkEmail
       ,'B'
       ,'Y');
    end;

    if varPersonalEmail <> 'NotAvailable' then
     begin
          insert into usia.person_email
            (pem_email_id
            ,pem_person_id
            ,pem_email
            ,pem_location
            ,pem_preferred)
          values
            (usia.s_audit_id.NextVal
            ,varPersonID
            ,varPersonalEmail
            ,'H'
            ,'N');
     end;
    end if;

     RtnVal := 0;
     Return RtnVal;
End f_Email;

--------------------------------------------------------------------
end PACK_FUNC;
/




