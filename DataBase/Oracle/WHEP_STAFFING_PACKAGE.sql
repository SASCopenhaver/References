CREATE OR REPLACE PACKAGE WHEP.WHEP_STAFFING_PACKAGE
  IS

PROCEDURE whep_get_cert_info(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type);


 procedure whep_get_pkg_status(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in whep.whep_local_inventory.package_id%type default 1);


    procedure whep_set_status(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in whep.whep_local_inventory.package_id%type default 1,
                            pPackage_status in emdba.em_staffing_pkg_status_t.package_status%type,
                            pComments in WHEP.whep_approvals.package_comments%type default ' ',
                            pUser in emdba.em_user_t.user_id%type default -1,
                            pApprovalDate in varchar2,
                            pPackageType in varchar2 default 'EWHEP');


    procedure whep_get_pkg_id (pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type);



END; -- Package spec
/
CREATE OR REPLACE PACKAGE BODY WHEP.WHEP_STAFFING_PACKAGE
IS
--
-- To modify this template, edit file PKGBODY.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package body
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
   -- Enter procedure, function bodies as shown below
PROCEDURE whep_get_cert_info(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type)

        is

        lcName     whep.whep_approvals.approvers_name%type;
        lcUserLast_name      emdba.em_user_t.last_name%type;
        lcCertDate           varchar2(30);
        lnUserID             emdba.em_user_t.user_id%type;
        lncount              number;

        begin
             select count(1) into lnCount
             from whep.whep_approvals a
            where a.site_id = pSite_id
            and a.whep_fac_id = tnFac_id
            and a.certification = 'T';

            if lncount > 0 then
                select nvl(a.approvers_name,'NONE'), NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE') into lcName, lcCertDate
                from whep.whep_approvals a
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.certification = 'T';
            else
                lcName := 'NONE';
                lcCertDate := 'NONE';
            END IF;



            htp.p('<?xml version="1.0"?>');
            htp.p('<ROW>');
            htp.p('<CNAME>'||lcName||'</CNAME>');
            htp.p('<CAPPDATE>'||lcCertDate||'</CAPPDATE>');
            HTP.P('</ROW>');

        END;

    procedure whep_get_pkg_status(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in whep.whep_local_inventory.package_id%type default 1)

                            is

            lcDefaultWhepFacId          emdba.em_subsite_facility_t.default_whep_fac_id%type;
            lcPackageStatus             emdba.em_staffing_pkg_status_t.package_status%type;


        begin

             select default_whep_fac_id into lcDefaultWhepFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;


             select package_status
             INTO lcPackageStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = lcDefaultWhepFacId
             and package_id = pPackage_id
             and package_type = 'EWHEP';

            htp.p('<?xml version="1.0"?>');
            htp.p('<PSTATUS>'||lcPackageStatus||'</PSTATUS>');

        END;


    procedure whep_set_status(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in whep.whep_local_inventory.package_id%type default 1,
                            pPackage_status in emdba.em_staffing_pkg_status_t.package_status%type,
                            pComments in WHEP.whep_approvals.package_comments%type default ' ',
                            pUser in emdba.em_user_t.user_id%type default -1,
                            pApprovalDate in varchar2,
                            pPackageType in varchar2 default 'EWHEP')


                            is


        lnDefaultFacId      emdba.em_subsite_facility_t.default_whep_fac_id%type;
        lcCurrentStatus     emdba.em_staffing_pkg_status_t.package_status%type;
        lnNewPackageID      number;
        lcActiveFlag        varchar2(1):='A';

        begin

             select default_whep_fac_id into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;

             select package_status into lcCurrentStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id
             and package_id = pPackage_id;


             if pPackageType = 'EWHEP' then
                insert into WHEP.whep_approvals
                (site_id, whep_fac_id, approvaldate, create_date, create_user,
                package_status, package_id, package_comments)
                values(pSite_id, tnFac_id, to_date(nvl(pApprovalDate,sysdate),'MM/DD/YYYY HH:MI AM'), sysdate, pUser, pPackage_status, pPackage_id, pComments);
                commit;
            end if;

            if lcCurrentStatus = 'A' or lcCurrentStatus = 'R' then
                   -- When change is made to currently approved package or the returned package, the new status is 'C';

                 -- Use this space for future code to copy current package to archives

                 if lcCurrentStatus = 'A' then
                     select max(package_id)+1 into lnNewPackageID
                     from emdba.em_staffing_pkg_status_t
                     where site_id = pSite_id
                     and whep_fac_id = tnFac_id;

                     insert into emdba.em_staffing_pkg_status_t
                     (site_id, whep_fac_id, create_date, create_user, mod_date, mod_user,
                     package_status, package_id, active_flag, package_type)
                     values(pSite_id, tnFac_id, sysdate, pUser, sysdate, pUser,
                     'C',lnNewPackageID,'A',pPackageType);
                     lcActiveFlag := 'I';
                 end if;
                 -- UPDATE THE CURRENT PACKAGE ID'S IN EACH TABLE TO THE NEW PACKAGE ID.
                 -- (CODE IS NOT YET INSERTED TO DO THIS)


                update emdba.em_staffing_pkg_status_t
                set package_status = pPackage_status,
                mod_date = sysdate,
                mod_user = pUser,
                ACTIVE_FLAG = lcActiveFlag
                where site_id = pSite_id
                and whep_fac_id = lnDefaultFacId
                and package_id = pPackage_id
                and package_type = pPackageType;
            else

                update emdba.em_staffing_pkg_status_t
                set package_status = pPackage_status,
                mod_date = sysdate,
                mod_user = pUser
                where site_id = pSite_id
                and whep_fac_id = lnDefaultFacId
                and package_id = pPackage_id;
            END IF;

        commit;
            htp.p('<?xml version="1.0"?>');
            htp.p('<RESPONSE>SUCCESS</RESPONSE>');
        end;

    procedure whep_get_pkg_id (pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type)

                    is

         lnDefaultFacId      emdba.em_subsite_facility_t.default_whep_fac_id%type;
         lnPackage_id        emdba.em_staffing_pkg_status_t.package_id%type;
         lcPackage_status    emdba.em_staffing_pkg_status_t.package_status%type;

        begin

             select default_whep_fac_id into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;

             select package_status, package_id
             INTO lcPackage_Status, lnPackage_id
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = lNDefaultFacId
             and active_flag = 'A'
             and package_type = 'EWHEP';

            htp.p('<?xml version="1.0"?>');
            htp.p('<ROW>');
            htp.p('<PSTATUS>'||lcPackage_Status||'</PSTATUS>');
            htp.p('<PID>'||to_char(lnPackage_id)||'</PID>');
            HTP.P('</ROW>');
        END;



END;
/
