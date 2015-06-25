CREATE OR REPLACE PACKAGE BODY EMAPP.EM_STAFFING_PACKAGE
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
PROCEDURE get_pkg_info(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackageType  in varchar2 default 'EWHEP',
                            pPackage_ID in emdba.em_staffing_pkg_status_t.package_id%type)

        is

        lcUserLast_name      emdba.em_user_t.last_name%type;
        lcName               VARCHAR2(4000):='NONE';
        lcCertDate           varchar2(30):='NONE';
        
        --Grace added for store area reviewer info
        --Grace commented out 08/20/2013
        --lcRName               VARCHAR2(4000):='NONE';
        --lcRCertDate           varchar2(30):='NONE';
        
        --Grace added for store hq validator info
        --Grace commented out 08/20/2013
        --lcVName               VARCHAR2(4000):='NONE';
        --lcVCertDate           varchar2(30):='NONE';
        
        lnUserID             emdba.em_user_t.user_id%type;
        lncount              number;
        lnAcount             number;
        --Grace added on 07/29/2013
        --Grace commented out 08/20/2013
        --lnRcount number;
        --lnVcount number;
        
        lcSubLast_name       emdba.em_user_t.last_name%type;
        lcSubFirst_name      emdba.em_user_t.first_name%type;
        lcSubName            varchar2(70):='NONE';
        lcSubmit_date        varchar2(30):='NONE';
        lcAppComments        varchar2(4000):='';
        lcSubComments        varchar2(4000):='';
        lcApproversEmail     varchar2(500):='NONE';
        lcStatus             varchar2(3):='';
        lcCertStatus         varchar2(3):='';
        --Grace added on 07/30/2013
        --Grace commented out 08/20/2013
        --lcRCertStatus         varchar2(3):='';
        --lcVCertStatus         varchar2(3):='';
        stmt                    number := 1;

        begin
            stmt := 60;
             select a.package_Status  into lcStatus
             from emdba.em_staffing_pkg_status_t a
             where a.site_id = pSite_id
             and a.whep_fac_id = tnFac_id
             and a.package_id = pPackage_id
             and a.package_type = pPackageType
             and a.active_flag = 'A';
             stmt := 70;


             IF pPackageType = 'EWHEP' THEN
                 select count(1) into lnCount
                 from whep.whep_approvals a
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_id
                and a.package_status  ='S';
                stmt := 80;
                --Grace modified on 08/20/2013, adding 'ARA','ARR', 'VA','VR'
                select count(1) into lnACount
                from whep.whep_approvals a
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_id
                and a.package_status  IN ('A','R','ARA','ARR','VA','VR');
                stmt := 90;
                -- Grace added on 07/29/2013 count area reviewer's action
                -- Grace commented out on 08/20/2013
                /*
                select count(1) into lnRCount
                from whep.whep_approvals a
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_id
                and a.package_status  IN ('ARA','ARR');
                stmt := 100;
                */
                -- Grace added on 07/29/2013 count hq validator's action
                -- Grace commented out on 08/20/2013
                /*
                select count(1) into lnVCount
                from whep.whep_approvals a
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_id
                and a.package_status  IN ('VA','VR');
                 stmt := 200;
                 */
              -- Grace added on 07/29/2013 for area reviewer info
              -- Grace commented out on 08/20/2013
              /*
              if lnRcount > 0 then
                    select nvl(a.area_reviewers_name,'NONE'),
                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments,'NONE'), a.package_status
                    into lcRName, lcRCertDate, lcAppComments, lcRCertStatus
                    from whep.whep_approvals a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                    and a.package_status IN ('ARA','ARR')
                    and a.approvaldate = (select max(b.approvaldate) from whep.whep_approvals b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status IN ('ARA','ARR'));
                    --group by a.approvers_name;
              end if;
                 stmt := 300;
              */
            -- Grace added on 07/29/2013 for hq validator info
            -- Grace commented out on 08/20/2013
            /*
              if lnVcount > 0 then
                    select nvl(a.hq_validators_name,'NONE'),
                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments,'NONE'), a.package_status
                    into lcVName, lcVCertDate, lcAppComments, lcVCertStatus
                    from whep.whep_approvals a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                    and a.package_status IN ('VA','VR')
                    and a.approvaldate = (select max(b.approvaldate) from whep.whep_approvals b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status IN ('VA','VR'));
                    --group by a.approvers_name;
              end if;
                 stmt := 400;
              */
              -- Grace modified on 08/20/2013, added ARA,ARR,VA,VR in in clause
              if lnAcount > 0 then
                    select 
                    --nvl(a.approvers_name,'NONE'),
                    case 
                        when a.package_status in ('ARA','ARR') then a.area_reviewers_name 
                        when a.package_status in ('VA','VR') then a.hq_validators_name
                        when a.package_status in ('A','R') then nvl(a.approvers_name,'NONE')
                        else nvl(a.approvers_name,'NONE')
                    end "name",
                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments,'NONE'), a.package_status
                    into lcName, lcCertDate, lcAppComments, lcCertStatus
                    from whep.whep_approvals a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                    and a.package_status IN ('A','R','ARA','ARR','VA','VR')
                    and a.approvaldate = (select max(b.approvaldate) from whep.whep_approvals b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status IN ('A','R','ARA','ARR','VA','VR'));
                    --group by a.approvers_name;
              end if;

              if lncount > 0 then
                    select nvl(a.submitters_name, 'NONE'),
                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments,'NONE'), nvl(approvers_email,'NONE')
                    into lcSubName, lcSubmit_Date, lcSubComments, lcApproversEmail
                    from whep.whep_approvals a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                   and a.package_status= 'S'
                    and a.approvaldate = (select max(b.approvaldate) from whep.whep_approvals b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status = 'S');
                   -- group by a.submitters_name;
                END IF;

            ELSE
                SELECT COUNT(1) INTO lncount
                FROM MS47.PACKAGE_CERT A
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_ID
                and a.package_status = 'S';

                SELECT COUNT(1) INTO lnAcount
                FROM MS47.PACKAGE_CERT A
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_ID
                and a.package_status IN ('A','R');
                if lnAcount > 0 then
                   select nvl(a.approvers_name,'NONE'),
                   NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments,'NONE'),
                   a.package_status
                   into lcName, lcCertDate, lcAppComments, lcCertStatus
                    from MS47.PACKAGE_CERT a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                    and a.package_status IN ('A','R')
                    and a.approvaldate = (select max(b.approvaldate) from MS47.PACKAGE_CERT b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status IN ('A','R'));
                end if;
                if lncount > 0 then
--                    select nvl(a.approvers_name,'NONE'), nvl(a.submitters_name, 'NONE'),
--                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments, 'NONE'), NVL(approvers_email,'NONE')
--                     into lcName, lcSubName, lcSubmit_Date, lcSubComments, lcApproversEmail

                    SELECT nvl(a.submitters_name, 'NONE'),
                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments, 'NONE'), NVL(approvers_email,'NONE')
                    into lcSubName, lcSubmit_Date, lcSubComments, lcApproversEmail
                    from MS47.PACKAGE_CERT a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                    and a.package_status = 'S'
                    and a.approvaldate = (select max(b.approvaldate) from MS47.PACKAGE_CERT b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status = 'S');

                /*else
                    lcName := 'NONE';
                    lcCertDate := 'NONE';*/
                END IF;

            end if; --if pPackage_Type = 'EWHEP'

            if lncount = 0 then
                lcSubName :='NONE';
                lcSubmit_date :='NONE';
                lcSubComments :='NONE';
                lcApproversEmail := 'NONE';
                lcName := 'NONE';
            END IF;

            if lnAcount = 0  AND (lcStatus = 'C' or lcStatus = 'S') then
                lcName := 'NONE';
                lcCertDate := 'NONE';
                lcAppComments := 'NONE';
                --lcApproversEmail := 'NONE';
            END IF;

/*            IF lcStatus = 'S' then

               lcName := 'NONE';
            END IF;*/

            htp.p('<?xml version="1.0"?>');
            htp.p('<ROW>');
            htp.p('<CNAME>'||lcName||'</CNAME>');
            htp.p('<CAPPDATE>'||lcCertDate||'</CAPPDATE>');
            htp.p('<CSUBNAME>'||lcSubName||'</CSUBNAME>');
            htp.p('<CSUBDATE>'||LCSUBMIT_DATE||'</CSUBDATE>');
            htp.p('<CAPPCOMMENTS>'||LCAPPCOMMENTS||'</CAPPCOMMENTS>');
            HTP.P('<CSUBCOMMENTS>'||LCSUBCOMMENTS||'</CSUBCOMMENTS>');
            HTP.P('<CAPPEMAIL>'||lcApproversEmail||'</CAPPEMAIL>');
            htp.p('<CPKGSTATUS>'||LCCERTSTATUS||'</CPKGSTATUS>');
            --Grace added for store area reviewer info
            --Grace commented out on 08/20/2013
            --htp.p('<CRNAME>'||lcRName||'</CRNAME>');
            --htp.p('<CRAPPDATE>'||lcRCertDate||'</CRAPPDATE>');
            --Grace added for store hq validator info
            --Grace commented out on 08/20/2013
            --htp.p('<CVNAME>'||lcVName||'</CVNAME>');
            --htp.p('<CVAPPDATE>'||lcVCertDate||'</CVAPPDATE>');
            --Grace added for store status for area reviewer action
            --Grace commented out on 08/20/2013
            --htp.p('<CPKGRSTATUS>'||LCRCERTSTATUS||'</CPKGRSTATUS>');
            --Grace added for store status for hq validator action
            --Grace commented out on 08/20/2013
            --htp.p('<CPKGVSTATUS>'||LCVCERTSTATUS||'</CPKGVSTATUS>');
            HTP.P('</ROW>');
      exception
      when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<ROW><ERROR>ERROR-'||to_char(stmt)|| '-' ||SUBSTR (SQLERRM, 1, 100)||'</ERROR></ROW>');
        END;
PROCEDURE get_pkg_info_old(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackageType  in varchar2 default 'EWHEP',
                            pPackage_ID in emdba.em_staffing_pkg_status_t.package_id%type)

        is

        lcName               VARCHAR2(4000):='NONE';
        lcUserLast_name      emdba.em_user_t.last_name%type;
        lcCertDate           varchar2(30):='NONE';
        lnUserID             emdba.em_user_t.user_id%type;
        lncount              number;
        lnAcount             number;
        lcSubLast_name       emdba.em_user_t.last_name%type;
        lcSubFirst_name      emdba.em_user_t.first_name%type;
        lcSubName            varchar2(70):='NONE';
        lcSubmit_date        varchar2(30):='NONE';
        lcAppComments        varchar2(4000):='';
        lcSubComments        varchar2(4000):='';
        lcApproversEmail     varchar2(500):='NONE';
        lcStatus             varchar2(1):='';
        lcCertStatus         varchar2(1):='';


        begin
             select a.package_Status  into lcStatus
             from emdba.em_staffing_pkg_status_t a
             where a.site_id = pSite_id
             and a.whep_fac_id = tnFac_id
             and a.package_id = pPackage_id
             and a.package_type = pPackageType
             and a.active_flag = 'A';



             IF pPackageType = 'EWHEP' THEN
                 select count(1) into lnCount
                 from whep.whep_approvals a
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_id
                and a.package_status  ='S';

                select count(1) into lnACount
                from whep.whep_approvals a
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_id
                and a.package_status  IN ('A','R');

              if lnAcount > 0 then
                    select nvl(a.approvers_name,'NONE'),
                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments,'NONE'), a.package_status
                    into lcName, lcCertDate, lcAppComments, lcCertStatus
                    from whep.whep_approvals a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                    and a.package_status IN ('A','R')
                    and a.approvaldate = (select max(b.approvaldate) from whep.whep_approvals b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status IN ('A','R'));
                    --group by a.approvers_name;
              end if;

              if lncount > 0 then
                    select nvl(a.submitters_name, 'NONE'),
                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments,'NONE'), nvl(approvers_email,'NONE')
                    into lcSubName, lcSubmit_Date, lcSubComments, lcApproversEmail
                    from whep.whep_approvals a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                   and a.package_status= 'S'
                    and a.approvaldate = (select max(b.approvaldate) from whep.whep_approvals b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status = 'S');
                   -- group by a.submitters_name;
                END IF;

            ELSE
                SELECT COUNT(1) INTO lncount
                FROM MS47.PACKAGE_CERT A
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_ID
                and a.package_status = 'S';

                SELECT COUNT(1) INTO lnAcount
                FROM MS47.PACKAGE_CERT A
                where a.site_id = pSite_id
                and a.whep_fac_id = tnFac_id
                and a.package_id = pPackage_ID
                and a.package_status IN ('A','R');
                if lnAcount > 0 then
                   select nvl(a.approvers_name,'NONE'),
                   NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments,'NONE'),
                   a.package_status
                   into lcName, lcCertDate, lcAppComments, lcCertStatus
                    from MS47.PACKAGE_CERT a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                    and a.package_status IN ('A','R')
                    and a.approvaldate = (select max(b.approvaldate) from MS47.PACKAGE_CERT b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status IN ('A','R'));
                end if;
                if lncount > 0 then
--                    select nvl(a.approvers_name,'NONE'), nvl(a.submitters_name, 'NONE'),
--                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments, 'NONE'), NVL(approvers_email,'NONE')
--                     into lcName, lcSubName, lcSubmit_Date, lcSubComments, lcApproversEmail

                    SELECT nvl(a.submitters_name, 'NONE'),
                    NVL(to_char(a.approvaldate,'MM/DD/YYYY HH:MI AM'),'NONE'), NVL(package_comments, 'NONE'), NVL(approvers_email,'NONE')
                    into lcSubName, lcSubmit_Date, lcSubComments, lcApproversEmail
                    from MS47.PACKAGE_CERT a
                    where a.site_id = pSite_id
                    and a.whep_fac_id = tnFac_id
                    and a.package_id = pPackage_ID
                    and a.package_status = 'S'
                    and a.approvaldate = (select max(b.approvaldate) from MS47.PACKAGE_CERT b where b.site_id = pSite_id
                    and b.whep_fac_id = tnFac_id and b.package_id = pPackage_ID and b.package_status = 'S');

                /*else
                    lcName := 'NONE';
                    lcCertDate := 'NONE';*/
                END IF;

            end if; --if pPackage_Type = 'EWHEP'

            if lncount = 0 then
                lcSubName :='NONE';
                lcSubmit_date :='NONE';
                lcSubComments :='NONE';
                lcApproversEmail := 'NONE';
                lcName := 'NONE';
            END IF;

            if lnAcount = 0  AND (lcStatus = 'C' or lcStatus = 'S') then
                lcName := 'NONE';
                lcCertDate := 'NONE';
                lcAppComments := 'NONE';
                --lcApproversEmail := 'NONE';
            END IF;

/*            IF lcStatus = 'S' then

               lcName := 'NONE';
            END IF;*/

            htp.p('<?xml version="1.0"?>');
            htp.p('<ROW>');
            htp.p('<CNAME>'||lcName||'</CNAME>');
            htp.p('<CAPPDATE>'||lcCertDate||'</CAPPDATE>');
            htp.p('<CSUBNAME>'||lcSubName||'</CSUBNAME>');
            htp.p('<CSUBDATE>'||LCSUBMIT_DATE||'</CSUBDATE>');
            htp.p('<CAPPCOMMENTS>'||LCAPPCOMMENTS||'</CAPPCOMMENTS>');
            HTP.P('<CSUBCOMMENTS>'||LCSUBCOMMENTS||'</CSUBCOMMENTS>');
            HTP.P('<CAPPEMAIL>'||lcApproversEmail||'</CAPPEMAIL>');
            htp.p('<CPKGSTATUS>'||LCCERTSTATUS||'</CPKGSTATUS>');
            HTP.P('</ROW>');

        END;

    procedure get_pkg_status(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1,
                            pPackageType  in varchar2 default 'EWHEP')

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

           exception
              when others then
                htp.p('<?xml version="1.0"?>');
                htp.p('<PSTATUS>ERROR</PSTATUS>');
     END;
 
     
/*****************************************************************************************************
 * Procedure Name: set_status
 * Purpose: This procedure accepts the site_id, facility_id(tnFac_id), staffing package type (pPackage_Type),
 *          Staffing Package Id (pPackage_id), approvers or submitters comments(pComments),
 *          the current User (pUser), Approval Date (pApprovalDate) -sysdate,Approvers email address
 *          (pApproversEmail) (only when applicable - Statuses of "A" and "R"), and the Approver's
 *          password (pApproversPasswd) (only when the user is an approver) as parameters.  Using these parameters, it copies the
 *          data for the specified staffing package to the archive tables.  Prior to doing this, it
 *          checks to see if there are three packages that have already been archived.  If so, it
 *          calls the "remove_archive_package" procedure to remove the oldest one.
 * Note: The package_type will be either "EWHEP" OR "MS47".
 * Author: Michael E. Harris
 * Create Date: 12/21/2010
 * Modification Date: 07/29/2013
 * Modification history: Grace Xu modified for new submission and approval process for EWHEP, 
 *                       whep package first submits to area reviewer, then HQ validator, then area manager/delegate
 *****************************************************************************************************/

    procedure set_status(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1,
                            pPackage_status in emdba.em_staffing_pkg_status_t.package_status%type,
                            pComments in WHEP.whep_approvals.package_comments%type default ' ',
                            pUser in emdba.em_user_t.user_id%type default -1,
                            pApprovalDate in varchar2,
                            pPackageType in varchar2 default 'EWHEP',
                            pApproversName in whep.whep_approvals.approvers_name%type default '',
                            pApproversEmail in whep.whep_approvals.approvers_email%type default '',
                            pApproversPasswd in emdba.em_user_t.user_password%type default '')


                            is
        
       cursor dfault_fac_id is
              select default_whep_fac_id --into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;

       cursor current_status (tcDefaultFacId in emdba.em_subsite_facility_t.default_whep_fac_id%type)
        is
            select package_status --into lcCurrentStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = tcDefaultFacId
             and package_id = pPackage_id
             AND active_flag ='A'
             and package_type = pPackageType;

     cursor current_user is
           select * --into user_rec
             from emdba.em_user_t a
             where a.user_id = pUser;
     -- Grace modified on 07/29/2013 added user's email
     cursor user_name is
         select TRIM(a.last_name), TRIM(a.first_name), a.email_address 
         --into lc_last_name, lc_first_name
         from emdba.em_user_t a
         where a.user_id = pUser;
        
          cursor approver is
            select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
            email_address, user_id, user_logon, user_password
            from emdba.em_user_t where USER_ID in (SELECT APPROVAL_USER_ID FROM EMDBA.EM_STAFFING_PKG_STATUS_T WHERE
            SITE_ID = pSite_id and whep_fac_id = tnFac_id and package_type = pPackageType
            and active_flag = 'A');
            
            --Grace Xu modified on 06/12/2013
             cursor q_area_manager (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where a.area_cd = p_Area_id 
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'S';
             
            cursor q_area_manager_delegate (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where a.area_cd = p_Area_id 
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'Y';
             
            cursor q_area_reviewer (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where a.area_cd = p_Area_id 
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'R';
            
            cursor q_validator is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'V';
      

        lnDefaultFacId      emdba.em_subsite_facility_t.default_whep_fac_id%type;
        lcCurrentStatus     emdba.em_staffing_pkg_status_t.package_status%type;
        lnNewPackageID      number;
        lcActiveFlag        varchar2(1):='A';
        USER_REC            EMDBA.EM_USER_T%ROWTYPE;
        Approver_rec        approver%rowtype;
        lcManager_name      varchar2(100):='NONE';
        lcApprovers_name    varchar2(100):='';
        lcApprovers_email   whep.whep_approvals.submitters_email%type:=NULL;
        lcStatus            emdba.em_staffing_pkg_status_t.package_status%type;
        lcPackageType       emdba.em_staffing_pkg_status_t.package_type%type;
        lc_last_name        varchar2(100);
        lc_first_name       varchar2(100);
        lc_email            whep.whep_approvals.submitters_email%type:=NULL;
        lcuserPassword      emdba.em_user_t.user_password%type;
        r_area_manager_rec  q_area_manager%rowtype;
        v_Response          varchar2(100);
        v_criteria_version  number(10,0):=0;
        v_area_cd           emdba.em_user_t.area_cd%type;
        v_submitters_user_id    emdba.em_user_t.user_id%type:=NULL;
        v_submitters_email  whep.whep_approvals.submitters_email%type:=NULL;
        v_area_reviewers_name   varchar2(100);
        v_area_reviewers_email  varchar2(100);
        v_area_reviewers_id emdba.em_user_t.user_id%type;
        --Grace Xu modified on 06/12/2013
        area_manager_rec    q_area_manager%rowtype;
        area_manager_delegate_rec q_area_manager_delegate%rowtype;
        area_reviewer_rec   q_area_reviewer%rowtype;
        validator_rec       q_validator%rowtype;
        v_is_areareviewer       varchar2(1) := 'N';
        v_is_hqvalidator        varchar2(1) := 'N';
        v_user_id               emdba.em_user_t.user_id%type;
        stmt number := 1;
        begin
             --Grace Xu modified on 06/12/2013
             select area
             into v_area_cd
             from emdba.em_site_t
             where site_id = pSite_id;

             if v_area_cd = '1H' then
                 v_area_cd := '1G';
             end if;
            
            
            /* Grace added on 07/29/2013 */
            -- check if current user is area reviewer
            select user_id
            into v_user_id
            from emdba.em_user_t
            where (whep_approver = 'R' or ms47_approver = 'R')
            and area_cd = v_area_cd;

            if pUser = v_user_id then
              v_is_areareviewer := 'Y';
            end if;
            
          -- check if current user is HQ validator
            select user_id
            into v_user_id
            from emdba.em_user_t
            where (whep_approver = 'V' or ms47_approver = 'V');
            
            if pUser = v_user_id then
              v_is_hqvalidator := 'Y';
            end if;
          -- End Grace added on 07/12/2013
          
        /* This procedure sets the status for the specified staffing package
            the following is the meaning for each status:
            C - Current/Working package
            S - Submitted package (Package has been submitted for review)
            R - Returned (Package has been returned to Submitter for editions and additions,
            A - Approved package (Package has been approved)
            --- The following statuses were added on 01/03/2013 only WHEP package uses the new statuses ---
            ARA - Area Reviewer Approved
            --R - Area Reviewer Returned or Area Manager Returned ???
            ARR - Area Reviewer Returned 
            VA  - HQ Validator Approved
            VR  - HQ Validator Returned - If HQ validator returns, package will be returned to area reviewer such as become "S" submitted

            */


             /*select default_whep_fac_id into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;*/
             open dfault_fac_id;
             fetch dfault_fac_id into lnDefaultFacId;
             close dfault_fac_id;


             if pPackagetype = 'EWHEP' THEN
                lcPackagetype := 'WHEP';
             ELSE
                 lcPackagetype := pPackageType;
                 lnDefaultFacId := tnFac_id;
             end if;




             /*select package_status into lcCurrentStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = lnDefaultFacId
             and package_id = pPackage_id
             AND active_flag ='A'
             and package_type = pPackageType;*/

             open current_status(lnDefaultFacId);
             fetch current_status into lcCurrentStatus;
             close current_status;

             open approver;
             fetch approver into approver_rec;
             close approver;

             open current_user;
             fetch current_user into user_rec;
             close current_user;

             open user_name;
             fetch user_name into lc_last_name, lc_first_name, lc_email;
             close user_name;

            stmt := 90;
            open q_area_manager(v_area_cd);
            fetch q_area_manager into area_manager_rec;
            close q_area_manager;
            stmt := 100;
            open q_area_reviewer(v_area_cd);
            fetch q_area_reviewer into area_reviewer_rec;
            close q_area_reviewer;
            stmt := 300;
            open q_validator;
            fetch q_validator into validator_rec;
            close q_validator;
            stmt := 400;
            
            open q_area_manager_delegate(v_area_cd);
            fetch q_area_manager_delegate into area_manager_delegate_rec;
            close q_area_manager_delegate;
             stmt := 500;
             
            --end Grace Xu modified on 06/12/2013

            if (approver_rec.user_id <> pUser and pPackage_status in ('A','R','ARA','ARR','VA','VR'))
                and (user_rec.whep_approver = 'N' and user_rec.ms47_approver = 'N') then
                htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                RETURN;
            end if;


 /*            insert into whep.hm (a,b) values ('pPackage_id',pPackage_id);
             insert into whep.hm (a,b) values ('pPackageType',pPackageType);
             insert into whep.hm (a,b) values ('pPackage_Status',pPackage_Status);
             insert into whep.hm (a,b) values ('current_status',lcCurrentStatus);
             insert into whep.hm (a,b) values ('lnDefaultFacId',lnDefaultFacId);
             COMMIT;*/

             lcStatus :=pPackage_Status;
             lnNewPackageID := pPackage_id;

            /*select * into user_rec
             from emdba.em_user_t a
             where a.user_id = pUser;*/


            select distinct criteria_version
            into v_criteria_version
            from whep.whep_criteria;

            if pPackageType = 'MS47' then
                v_criteria_version := null;
            end if;

             lcuserPassword := emapp.em_decryption_fnc(user_rec.user_password);

            -- insert into hm (a,b) values ('user_rec.whep_approver',user_rec.whep_approver);
             --commit;
             --Grace Xu modified on 06/12/2013
             if pPackage_status = 'A' then
                 if pPackageType = 'EWHEP' then
                    --if USER_REC.whep_approver ='N' then
                    if USER_REC.whep_approver <> 'S' and USER_REC.whep_approver <> 'Y' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                    --if USER_REC.ms47_approver ='N' then
                     if USER_REC.ms47_approver <> 'S' and USER_REC.ms47_approver <> 'Y' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 end if;
                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;
             --Grace Xu added on 06/12/2013 if it is area reviewer approved
             if pPackage_status = 'ARA' then
                 if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver <> 'R' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                    RETURN;
                 end if;
                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;
             --Grace Xu added on 06/12/2013 if it is HQ validator approved
             if pPackage_status = 'VA' then
                 if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver <> 'V' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                    RETURN;
                 end if;
                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;
             
             -- Approver's pass

             -- if the new status is 'S' then the lcmanager_name is the submitters name
             -- and the ApproversName is passed
             -- if the new status is 'A' then the lcmanager_name is the approvers name
             -- if the new status is 'ARA' or 'ARR' then the lcmanager_name is the reviewer's name
             -- if the new status is 'VA' or 'VR' then the lcmanager_name is the headquarters' validator's name
             --Note: pPackage_status is the new package status

             if pPackage_status = 'S' then
             -- Grace Xu commented on 06/13/2013, same as the following 2 statements.
                --lcmanager_name := user_rec.First_name||' '||user_rec.Last_name; -- Submitters_name
                --lcApprovers_name := pApproversName;
            -- insert into whep.hm (a,b) values ('lcmanager_name',user_rec.First_name);
            -- commit;
                lcmanager_name := lc_first_name||' '||lc_last_name; -- Submitters_name
                lcApprovers_name := pApproversName;
                lcApprovers_email := pApproversEmail;
                v_submitters_user_id := user_rec.user_id;
                v_submitters_email := user_rec.email_address;

             else --C') then
               --   lcApprovers_name := user_rec.First_name||' '||user_rec.Last_name;
                lcmanager_name := user_rec.First_name||' '||user_rec.Last_name; -- Submitters_name
                lcApprovers_name := lc_first_name||' '||lc_last_name; -- Submitters_name
                lcApprovers_email := lc_email; 
                 if lcCurrentStatus = 'A' then
                     select max(package_id)+1 into lnNewPackageID
                     from emdba.em_staffing_pkg_status_t
                     where site_id = pSite_id
                     and whep_fac_id = lnDefaultFacId
                     and package_type = pPackageType;
                 end if;
                 
             end if;
             --Grace Xu modified on 06/12/2013 for ewhep new fields area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email
             if pPackageType = 'EWHEP' then
                if pPackage_status = 'ARA' or pPackage_status = 'ARR' then
                  insert into WHEP.whep_approvals
                  (site_id, whep_fac_id, approvaldate, create_date, create_user,
                  package_status, package_id, package_comments, submitterS_NAME,
                  approvers_name, approvers_email, submitters_user_id, submitters_email,
                  area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email)
                  values(pSite_id, lnDefaultFacId, sysdate,
                  sysdate, pUser, pPackage_status ,lnNewPackageID,
                  pComments, lcManager_name, null,null,
                  v_submitters_user_id, v_submitters_email,
                  lcApprovers_name, lcApprovers_email,null,null);
                elsif pPackage_status = 'VA' or pPackage_status = 'VR' then
                  insert into WHEP.whep_approvals
                  (site_id, whep_fac_id, approvaldate, create_date, create_user,
                  package_status, package_id, package_comments, submitterS_NAME,
                  approvers_name, approvers_email, submitters_user_id, submitters_email,
                  area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email)
                  values(pSite_id, lnDefaultFacId, sysdate,
                  sysdate, pUser, pPackage_status ,lnNewPackageID,
                  pComments, lcManager_name, null,null,
                  v_submitters_user_id, v_submitters_email,
                  null,null,lcApprovers_Name, lcApprovers_email);
                else
                  insert into WHEP.whep_approvals
                  (site_id, whep_fac_id, approvaldate, create_date, create_user,
                  package_status, package_id, package_comments, submitterS_NAME,
                  approvers_name, approvers_email, submitters_user_id, submitters_email,
                  area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email)
                  values(pSite_id, lnDefaultFacId, sysdate,
                  sysdate, pUser, pPackage_status ,lnNewPackageID,
                  pComments, lcManager_name, lcApprovers_Name, pApproversEmail,
                  v_submitters_user_id, v_submitters_email,
                  null,null,null,null);
                end if;
             else
                 INSERT INTO MS47.PACKAGE_CERT
                 (SITE_ID, WHEP_FAC_ID, APPROVALDATE, CREATE_DATE, USER_ID, PACKAGE_STATUS,
                 PACKAGE_ID, PACKAGE_COMMENTS, submitters_name, approvers_name,
                 approvers_email, submitters_user_id, submitters_email)
                 VALUES (pSite_id, tnFac_id, sysdate, sysdate, pUser,
                 pPackage_status, lnNewPackageID, pComments, lcManager_name,
                 lcApprovers_name, pApproversEmail, v_submitters_user_id, v_submitters_email);
                 --to_date(nvl(pApprovalDate,sysdate),'MM/DD/YYYY HH:MI AM')

            end if;
            commit;

--            if lcCurrentStatus in ('A', 'R') then
                   -- When change is made to currently approved package or the returned package, the new status is 'C';

                 -- Use this space for future code to copy current package to archives

            if (pPackage_status = 'C' and lcCurrentStatus = 'A') then
               update emdba.em_staffing_pkg_status_t
               set ACTIVE_FLAG = 'I'
               where site_id = pSite_id
               and whep_fac_id = lnDefaultFacId
               --and package_id <> lnNewPackageID;
               and package_type = pPackageType
               AND package_id <> lnNewPackageID;

               commit;

                -- When a change is made to an approved package, it is a new package.  Therefore,
                -- UPDATE THE CURRENT PACKAGE ID'S IN EACH TABLE TO THE NEW PACKAGE ID.
                 update_pkg_id(pSite_id, tnFac_id, pPackageType, lnNewPackageID);

                 if pPackageType = 'EWHEP' then
                    update whep.whep_craft_position
                    set current_quantity = approved_quantity
                    where site_id = pSite_id
                    and whep_fac_id = lnDefaultFacId;

                    update whep.whep_additional_craft_position
                    set current_quantity = approved_quantity
                    where site_id = pSite_id
                    and whep_fac_id = lnDefaultFacId;
                end if;


            end if;

             if lcCurrentStatus = 'A' then  -- If current package status is "A",
                                            -- then the package is being set to "C".
                     /*select max(package_id)+1 into lnNewPackageID
                     from emdba.em_staffing_pkg_status_t
                     where site_id = pSite_id
                     and whep_fac_id = tnFac_id
                     and package_type = pPackageType;*/

                   /*   commented on 10/19/2010 by Michael E. Harris
                        The following code was moved to a preceding section.*/
                    --Grace Xu commented on 06/12/2013
                    /*
                    select area
                    into v_area_cd
                    from emdba.em_site_t
                    where site_id = pSite_id;

                    if v_area_cd = '1H' then
                        v_area_cd := '1G';
                    end if;

                     open q_area_manager(v_area_cd);
                     fetch q_area_manager into r_area_manager_rec;
                     close q_area_manager;
                    */
                    
                     insert into emdba.em_staffing_pkg_status_t
                     (site_id, whep_fac_id, create_date, create_user, mod_date, mod_user,
                     package_status, package_id, active_flag, package_type, approval_date, approval_user_id, criteria_version)
                     values(pSite_id, lnDefaultFacId, sysdate, pUser, sysdate, pUser,
                     'C',lnNewPackageID,'A',pPackageType, null, area_manager_rec.user_id, v_criteria_version);
                     commit;
                     lcActiveFlag := 'I';
                     lcStatus :='A';
            --Grace modified on 06/12/2013 added tow more conditions
             elsif lcCurrentStatus = 'R' or lcCurrentStatus = 'ARR' then
                    lcActiveFlag := 'A';
                    lcStatus := 'C';
            --if the package gets returned by HQ validator, then next status of package would be only be 'S' - submitted stay at area reviewer to approve it.
             elsif lcCurrentStatus = 'VR' then
                    lcActiveFlag := 'A';
                    lcStatus := 'S';
            END IF;




--             else
    if pPackage_status = 'A' then

        update emdba.em_staffing_pkg_status_t
        set package_status = lcStatus,
        mod_date = sysdate,
        mod_user = pUser,
        active_flag = lcActiveFlag,
        approval_date = sysdate,
        archived_date = sysdate
        --approval_user_id = pUser
        where site_id = pSite_id
        and whep_fac_id = lnDefaultFacId
        and package_id = pPackage_id
        and package_type = pPackageType;
        COMMIT;
/*        delete from whep.hm;
        commit;*/


        -- If the package status is 'A' (Approved) then archive that package.
        archive_package(pSite_id, tnFac_id, pPackageType, pPackage_id, v_Response);
        if v_Response = 'ARCHIVEDDUPLICATE' THEN
            htp.p('<?xml version="1.0"?>');
            htp.p('<RESPONSE>ARCHIVEDDUPLICATE</RESPONSE>');
            RETURN;
        END IF;

    else -- pPackage_status <> 'C' then

        if pPackage_status = 'S' and pPackageType = 'EWHEP' then
            update whep.whep_craft_position
            set approved_quantity = estimated_quantity,
            mod_date = sysdate,
            mod_user = pUser
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId;
            commit;
        end if;
        
         update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;
            
        /* Grace Xu commented out on 06/12/2013 two update statements are same in if else condition
        if pPackage_status in ('R','S') then
            update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;

        elsif pPackage_status = 'C' then

            update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;

        end if;
        */
    --  AND package_id <> lnNewPackageID;
    end if;


        commit;
        htp.p('<?xml version="1.0"?>');
        htp.p('<RESPONSE>SUCCESS</RESPONSE>');

        -- Recording package status change in modification history table.
        -- Although this is done in the respective tables - WHEP_APPROVALS, MS47.CERTIFICATION
        -- we keep another history for quality assurance purposes.
        WHEP.WHEP_WORKHOUR_SUMMARY.INSERT_INTO_HISTORY(pSite_id, lnDefaultFacId,
            'PACKAGE APPROVAL/SUBMISSION',pUser, pPackageType||' Package Status set to: '||pPackage_status);

   exception
      when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<RESPONSE>ERROR-'||v_area_cd||to_char(stmt)|| '-' ||SUBSTR (SQLERRM, 1, 100)||'</RESPONSE>');

    end;    
/*****************************************************************************************************
 * Procedure Name: set_status
 * Purpose: This procedure accepts the site_id, facility_id(tnFac_id), staffing package type (pPackage_Type),
 *          Staffing Package Id (pPackage_id), approvers or submitters comments(pComments),
 *          the current User (pUser), Approval Date (pApprovalDate) -sysdate,Approvers email address
 *          (pApproversEmail) (only when applicable - Statuses of "A" and "R"), and the Approver's
 *          password (pApproversPasswd) (only when the user is an approver) as parameters.  Using these parameters, it copies the
 *          data for the specified staffing package to the archive tables.  Prior to doing this, it
 *          checks to see if there are three packages that have already been archived.  If so, it
 *          calls the "remove_archive_package" procedure to remove the oldest one.
 * Note: The package_type will be either "EWHEP" OR "MS47".
 * Author: Michael E. Harris
 * Create Date: 12/21/2010
 * Modification Date: 06/12/2013 
 * Modification history: Grace Xu modified for new submission and approval process for EWHEP, 
 *                       whep package first submits to area reviewer, then HQ validator, then area manager/delegate
 *****************************************************************************************************/

    procedure set_status_07292013(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1,
                            pPackage_status in emdba.em_staffing_pkg_status_t.package_status%type,
                            pComments in WHEP.whep_approvals.package_comments%type default ' ',
                            pUser in emdba.em_user_t.user_id%type default -1,
                            pApprovalDate in varchar2,
                            pPackageType in varchar2 default 'EWHEP',
                            pApproversName in whep.whep_approvals.approvers_name%type default '',
                            pApproversEmail in whep.whep_approvals.approvers_email%type default '',
                            pApproversPasswd in emdba.em_user_t.user_password%type default '')


                            is

       cursor dfault_fac_id is
              select default_whep_fac_id --into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;

       cursor current_status (tcDefaultFacId in emdba.em_subsite_facility_t.default_whep_fac_id%type)
        is
            select package_status --into lcCurrentStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = tcDefaultFacId
             and package_id = pPackage_id
             AND active_flag ='A'
             and package_type = pPackageType;

     cursor current_user is
           select * --into user_rec
             from emdba.em_user_t a
             where a.user_id = pUser;

     cursor user_name is
         select TRIM(a.last_name), TRIM(a.first_name)
         --into lc_last_name, lc_first_name
         from emdba.em_user_t a
         where a.user_id = pUser;

          cursor approver is
            select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
            email_address, user_id, user_logon, user_password
            from emdba.em_user_t where USER_ID in (SELECT APPROVAL_USER_ID FROM EMDBA.EM_STAFFING_PKG_STATUS_T WHERE
            SITE_ID = pSite_id and whep_fac_id = tnFac_id and package_type = pPackageType
            and active_flag = 'A');
            
            --Grace Xu modified on 06/12/2013
             cursor q_area_manager (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where a.area_cd = p_Area_id 
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'S';

            cursor q_area_manager_delegate (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where a.area_cd = p_Area_id 
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'Y';

            cursor q_area_reviewer (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where a.area_cd = p_Area_id 
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'R';

            cursor q_validator is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'V';
      

        lnDefaultFacId      emdba.em_subsite_facility_t.default_whep_fac_id%type;
        lcCurrentStatus     emdba.em_staffing_pkg_status_t.package_status%type;
        lnNewPackageID      number;
        lcActiveFlag        varchar2(1):='A';
        USER_REC            EMDBA.EM_USER_T%ROWTYPE;
        Approver_rec        approver%rowtype;
        lcManager_name      varchar2(100):='NONE';
        lcApprovers_name    varchar2(100):='';
        lcStatus            emdba.em_staffing_pkg_status_t.package_status%type;
        lcPackageType       emdba.em_staffing_pkg_status_t.package_type%type;
        lc_last_name        varchar2(100);
        lc_first_name       varchar2(100);
        lcuserPassword      emdba.em_user_t.user_password%type;
        r_area_manager_rec  q_area_manager%rowtype;
        v_Response          varchar2(100);
        v_criteria_version  number(10,0):=0;
        v_area_cd           emdba.em_user_t.area_cd%type;
        v_submitters_user_id    emdba.em_user_t.user_id%type;
        v_submitters_email  whep.whep_approvals.submitters_email%type:=NULL;
        v_area_reviewers_name   varchar2(100);
        v_area_reviewers_email  varchar2(100);
        v_area_reviewers_id emdba.em_user_t.user_id%type;
        --Grace Xu modified on 06/12/2013
        area_manager_rec    q_area_manager%rowtype;
        area_manager_delegate_rec q_area_manager_delegate%rowtype;
        area_reviewer_rec   q_area_reviewer%rowtype;
        validator_rec       q_validator%rowtype;

        begin


        /* This procedure sets the status for the specified staffing package
            the following is the meaning for each status:
            C - Current/Working package
            S - Submitted package (Package has been submitted for review)
            R - Returned (Package has been returned to Submitter for editions and additions,
            A - Approved package (Package has been approved)
            --- The following statuses were added on 01/03/2013 ---
            ARA - Area Reviewer Approved
            R - Area Reviewer Returned or Area Manager Returned ???
            ARR - Area Reviewer Returned 
            VA  - HQ Validator Approved
            VR  - HQ Validator Returned - If HQ validator returns, package will be returned to area reviewer such as become "S" submitted

            */


             /*select default_whep_fac_id into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;*/
             open dfault_fac_id;
             fetch dfault_fac_id into lnDefaultFacId;
             close dfault_fac_id;


             if pPackagetype = 'EWHEP' THEN
                lcPackagetype := 'WHEP';
             ELSE
                 lcPackagetype := pPackageType;
                 lnDefaultFacId := tnFac_id;
             end if;




             /*select package_status into lcCurrentStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = lnDefaultFacId
             and package_id = pPackage_id
             AND active_flag ='A'
             and package_type = pPackageType;*/

             open current_status(lnDefaultFacId);
             fetch current_status into lcCurrentStatus;
             close current_status;

             open approver;
             fetch approver into approver_rec;
             close approver;

             open current_user;
             fetch current_user into user_rec;
             close current_user;

             open user_name;
             fetch user_name into lc_last_name, lc_first_name;
             close user_name;

             --Grace Xu modified on 06/12/2013
             select area
             into v_area_cd
             from emdba.em_site_t
             where site_id = pSite_id;

            if v_area_cd = '1H' then
                 v_area_cd := '1G';
            end if;
            
            open q_area_manager(v_area_cd);
            fetch q_area_manager into area_manager_rec;
            close q_area_manager;

            open q_area_manager_delegate(v_area_cd);
            fetch q_area_manager_delegate into area_manager_delegate_rec;
            close q_area_manager_delegate;

            open q_area_reviewer(v_area_cd);
            fetch q_area_reviewer into area_reviewer_rec;
            close q_area_reviewer;

            open q_validator;
            fetch q_validator into validator_rec;
            close q_validator;
            --end Grace Xu modified on 06/12/2013

            if (approver_rec.user_id <> pUser and pPackage_status in ('A','R','ARA','ARR','VA','VR'))
                and (user_rec.whep_approver = 'N' and user_rec.ms47_approver = 'N') then
                htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                RETURN;
            end if;


 /*            insert into whep.hm (a,b) values ('pPackage_id',pPackage_id);
             insert into whep.hm (a,b) values ('pPackageType',pPackageType);
             insert into whep.hm (a,b) values ('pPackage_Status',pPackage_Status);
             insert into whep.hm (a,b) values ('current_status',lcCurrentStatus);
             insert into whep.hm (a,b) values ('lnDefaultFacId',lnDefaultFacId);
             COMMIT;*/

             lcStatus :=pPackage_Status;
             lnNewPackageID := pPackage_id;

            /*select * into user_rec
             from emdba.em_user_t a
             where a.user_id = pUser;*/


            select distinct criteria_version
            into v_criteria_version
            from whep.whep_criteria;

            if pPackageType = 'MS47' then
                v_criteria_version := null;
            end if;

             lcuserPassword := emapp.em_decryption_fnc(user_rec.user_password);

            -- insert into hm (a,b) values ('user_rec.whep_approver',user_rec.whep_approver);
             --commit;
             --Grace Xu modified on 06/12/2013
             if pPackage_status = 'A' then
                 if pPackageType = 'EWHEP' then
                    --if USER_REC.whep_approver ='N' then
                    if USER_REC.whep_approver <> 'S' and USER_REC.whep_approver <> 'Y' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                    --if USER_REC.ms47_approver ='N' then
                     if USER_REC.ms47_approver <> 'S' and USER_REC.ms47_approver <> 'Y' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 end if;
                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;
             --Grace Xu added on 06/12/2013 if it is area reviewer approved
             if pPackage_status = 'ARA' then
                 if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver <> 'R' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                    RETURN;
                 end if;
                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;
             --Grace Xu added on 06/12/2013 if it is HQ validator approved
             if pPackage_status = 'VA' then
                 if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver <> 'V' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                    RETURN;
                 end if;
                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;
             
             -- Approver's pass

             -- if the new status is 'S' then the lcmanager_name is the submitters name
             -- and the ApproversName is passed
             -- if the new status is 'A' then the lcmanager_name is the approvers name
             -- if the new status is 'ARA' or 'ARR' then the lcmanager_name is the reviewer's name
             -- if the new status is 'VA' or 'VR' then the lcmanager_name is the headquarters' validator's name
             --Note: pPackage_status is the new package status

             if pPackage_status = 'S' then
             -- Grace Xu commented on 06/13/2013, same as the following 2 statements.
                --lcmanager_name := user_rec.First_name||' '||user_rec.Last_name; -- Submitters_name
                --lcApprovers_name := pApproversName;
            -- insert into whep.hm (a,b) values ('lcmanager_name',user_rec.First_name);
            -- commit;
                lcmanager_name := lc_first_name||' '||lc_last_name; -- Submitters_name
                lcApprovers_name := pApproversName;

                v_submitters_user_id := user_rec.user_id;
                v_submitters_email := user_rec.email_address;

             else --C') then
               --   lcApprovers_name := user_rec.First_name||' '||user_rec.Last_name;
                lcmanager_name := user_rec.First_name||' '||user_rec.Last_name; -- Submitters_name
                lcApprovers_name := lc_first_name||' '||lc_last_name; -- Submitters_name
                 if lcCurrentStatus = 'A' then
                     select max(package_id)+1 into lnNewPackageID
                     from emdba.em_staffing_pkg_status_t
                     where site_id = pSite_id
                     and whep_fac_id = lnDefaultFacId
                     and package_type = pPackageType;
                 end if;
                 
             end if;
             --Grace Xu modified on 06/12/2013 for ewhep new fields area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email
             if pPackageType = 'EWHEP' then
                if pPackage_status = 'ARA' or pPackage_status = 'ARR' then
                  insert into WHEP.whep_approvals
                  (site_id, whep_fac_id, approvaldate, create_date, create_user,
                  package_status, package_id, package_comments, submitterS_NAME,
                  approvers_name, approvers_email, submitters_user_id, submitters_email,
                  area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email)
                  values(pSite_id, lnDefaultFacId, sysdate,
                  sysdate, pUser, pPackage_status ,lnNewPackageID,
                  pComments, lcManager_name, null,null,
                  v_submitters_user_id, v_submitters_email,
                  lcApprovers_Name, pApproversEmail,null,null);
                elsif pPackage_status = 'VA' or pPackage_status = 'VR' then
                  insert into WHEP.whep_approvals
                  (site_id, whep_fac_id, approvaldate, create_date, create_user,
                  package_status, package_id, package_comments, submitterS_NAME,
                  approvers_name, approvers_email, submitters_user_id, submitters_email,
                  area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email)
                  values(pSite_id, lnDefaultFacId, sysdate,
                  sysdate, pUser, pPackage_status ,lnNewPackageID,
                  pComments, lcManager_name, null,null,
                  v_submitters_user_id, v_submitters_email,
                  null,null,lcApprovers_Name, pApproversEmail);
                else
                  insert into WHEP.whep_approvals
                  (site_id, whep_fac_id, approvaldate, create_date, create_user,
                  package_status, package_id, package_comments, submitterS_NAME,
                  approvers_name, approvers_email, submitters_user_id, submitters_email,
                  area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email)
                  values(pSite_id, lnDefaultFacId, sysdate,
                  sysdate, pUser, pPackage_status ,lnNewPackageID,
                  pComments, lcManager_name, lcApprovers_Name, pApproversEmail,
                  v_submitters_user_id, v_submitters_email,
                  null,null,null,null);
                end if;
             else
                 INSERT INTO MS47.PACKAGE_CERT
                 (SITE_ID, WHEP_FAC_ID, APPROVALDATE, CREATE_DATE, USER_ID, PACKAGE_STATUS,
                 PACKAGE_ID, PACKAGE_COMMENTS, submitters_name, approvers_name,
                 approvers_email, submitters_user_id, submitters_email)
                 VALUES (pSite_id, tnFac_id, sysdate, sysdate, pUser,
                 pPackage_status, lnNewPackageID, pComments, lcManager_name,
                 lcApprovers_name, pApproversEmail, v_submitters_user_id, v_submitters_email);
                 --to_date(nvl(pApprovalDate,sysdate),'MM/DD/YYYY HH:MI AM')

            end if;
            commit;

--            if lcCurrentStatus in ('A', 'R') then
                   -- When change is made to currently approved package or the returned package, the new status is 'C';

                 -- Use this space for future code to copy current package to archives

            if (pPackage_status = 'C' and lcCurrentStatus = 'A') then
               update emdba.em_staffing_pkg_status_t
               set ACTIVE_FLAG = 'I'
               where site_id = pSite_id
               and whep_fac_id = lnDefaultFacId
               --and package_id <> lnNewPackageID;
               and package_type = pPackageType
               AND package_id <> lnNewPackageID;

               commit;

                -- When a change is made to an approved package, it is a new package.  Therefore,
                -- UPDATE THE CURRENT PACKAGE ID'S IN EACH TABLE TO THE NEW PACKAGE ID.
                 update_pkg_id(pSite_id, tnFac_id, pPackageType, lnNewPackageID);

                 if pPackageType = 'EWHEP' then
                    update whep.whep_craft_position
                    set current_quantity = approved_quantity
                    where site_id = pSite_id
                    and whep_fac_id = lnDefaultFacId;

                    update whep.whep_additional_craft_position
                    set current_quantity = approved_quantity
                    where site_id = pSite_id
                    and whep_fac_id = lnDefaultFacId;
                end if;


            end if;

             if lcCurrentStatus = 'A' then  -- If current package status is "A",
                                            -- then the package is being set to "C".
                     /*select max(package_id)+1 into lnNewPackageID
                     from emdba.em_staffing_pkg_status_t
                     where site_id = pSite_id
                     and whep_fac_id = tnFac_id
                     and package_type = pPackageType;*/

                   /*   commented on 10/19/2010 by Michael E. Harris
                        The following code was moved to a preceding section.*/
                    --Grace Xu commented on 06/12/2013
                    /*
                    select area
                    into v_area_cd
                    from emdba.em_site_t
                    where site_id = pSite_id;

                    if v_area_cd = '1H' then
                        v_area_cd := '1G';
                    end if;

                     open q_area_manager(v_area_cd);
                     fetch q_area_manager into r_area_manager_rec;
                     close q_area_manager;
                    */
                    
                     insert into emdba.em_staffing_pkg_status_t
                     (site_id, whep_fac_id, create_date, create_user, mod_date, mod_user,
                     package_status, package_id, active_flag, package_type, approval_date, approval_user_id, criteria_version)
                     values(pSite_id, lnDefaultFacId, sysdate, pUser, sysdate, pUser,
                     'C',lnNewPackageID,'A',pPackageType, null, area_manager_rec.user_id, v_criteria_version);
                     commit;
                     lcActiveFlag := 'I';
                     lcStatus :='A';
            --Grace modified on 06/12/2013 added tow more conditions
             elsif lcCurrentStatus = 'R' or lcCurrentStatus = 'ARR' then
                    lcActiveFlag := 'A';
                    lcStatus := 'C';
            --if the package gets returned by HQ validator, then next status of package would be only be 'S' - submitted stay at area reviewer to approve it.
             elsif lcCurrentStatus = 'VR' then
                    lcActiveFlag := 'A';
                    lcStatus := 'S';
            END IF;




--             else
    if pPackage_status = 'A' then

        update emdba.em_staffing_pkg_status_t
        set package_status = lcStatus,
        mod_date = sysdate,
        mod_user = pUser,
        active_flag = lcActiveFlag,
        approval_date = sysdate,
        archived_date = sysdate
        --approval_user_id = pUser
        where site_id = pSite_id
        and whep_fac_id = lnDefaultFacId
        and package_id = pPackage_id
        and package_type = pPackageType;
        COMMIT;
/*        delete from whep.hm;
        commit;*/


        -- If the package status is 'A' (Approved) then archive that package.
        archive_package(pSite_id, tnFac_id, pPackageType, pPackage_id, v_Response);
        if v_Response = 'ARCHIVEDDUPLICATE' THEN
            htp.p('<?xml version="1.0"?>');
            htp.p('<RESPONSE>ARCHIVEDDUPLICATE</RESPONSE>');
            RETURN;
        END IF;

    else -- pPackage_status <> 'C' then

        if pPackage_status = 'S' and pPackageType = 'EWHEP' then
            update whep.whep_craft_position
            set approved_quantity = estimated_quantity,
            mod_date = sysdate,
            mod_user = pUser
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId;
            commit;
        end if;
        
         update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;
            
        /* Grace Xu commented out on 06/12/2013 two update statements are same in if else condition
        if pPackage_status in ('R','S') then
            update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;

        elsif pPackage_status = 'C' then

            update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;

        end if;
        */
    --  AND package_id <> lnNewPackageID;
    end if;


        commit;
        htp.p('<?xml version="1.0"?>');
        htp.p('<RESPONSE>SUCCESS</RESPONSE>');

        -- Recording package status change in modification history table.
        -- Although this is done in the respective tables - WHEP_APPROVALS, MS47.CERTIFICATION
        -- we keep another history for quality assurance purposes.
        WHEP.WHEP_WORKHOUR_SUMMARY.INSERT_INTO_HISTORY(pSite_id, lnDefaultFacId,
            'PACKAGE APPROVAL/SUBMISSION',pUser, pPackageType||' Package Status set to: '||pPackage_status);

   exception
      when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<RESPONSE>ERROR</RESPONSE>');

    end;
/*****************************************************************************************************
 * Procedure Name: set_status
 * Purpose: This procedure accepts the site_id, facility_id(tnFac_id), staffing package type (pPackage_Type),
 *          Staffing Package Id (pPackage_id), approvers or submitters comments(pComments),
 *          the current User (pUser), Approval Date (pApprovalDate) -sysdate,Approvers email address
 *          (pApproversEmail) (only when applicable - Statuses of "A" and "R"), and the Approver's
 *          password (pApproversPasswd) (only when the user is an approver) as parameters.  Using these parameters, it copies the
 *          data for the specified staffing package to the archive tables.  Prior to doing this, it
 *          checks to see if there are three packages that have already been archived.  If so, it
 *          calls the "remove_archive_package" procedure to remove the oldest one.
 * Note: The package_type will be either "EWHEP" OR "MS47".
 * Author: Michael E. Harris
 * Create Date: 12/21/2010
 *
 *****************************************************************************************************/

    procedure set_status_old(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1,
                            pPackage_status in emdba.em_staffing_pkg_status_t.package_status%type,
                            pComments in WHEP.whep_approvals.package_comments%type default ' ',
                            pUser in emdba.em_user_t.user_id%type default -1,
                            pApprovalDate in varchar2,
                            pPackageType in varchar2 default 'EWHEP',
                            pApproversName in whep.whep_approvals.approvers_name%type default '',
                            pApproversEmail in whep.whep_approvals.approvers_email%type default '',
                            pApproversPasswd in emdba.em_user_t.user_password%type default '')


                            is

       cursor dfault_fac_id is
              select default_whep_fac_id --into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;

       cursor current_status (tcDefaultFacId in emdba.em_subsite_facility_t.default_whep_fac_id%type)
        is
            select package_status --into lcCurrentStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = tcDefaultFacId
             and package_id = pPackage_id
             AND active_flag ='A'
             and package_type = pPackageType;

     cursor current_user is
           select * --into user_rec
             from emdba.em_user_t a
             where a.user_id = pUser;

     cursor user_name is
         select TRIM(a.last_name), TRIM(a.first_name)
         --into lc_last_name, lc_first_name
         from emdba.em_user_t a
         where a.user_id = pUser;

          cursor approver is
            select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
            email_address, user_id, user_logon, user_password
            from emdba.em_user_t where USER_ID in (SELECT APPROVAL_USER_ID FROM EMDBA.EM_STAFFING_PKG_STATUS_T WHERE
            SITE_ID = pSite_id and whep_fac_id = tnFac_id and package_type = pPackageType
            and active_flag = 'A');

            cursor q_area_manager (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id from emdba.em_user_t a
                where a.area_cd = p_Area_id --b.area from emdba.em_site_t b where b.site_id = pSite_id) OR
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'S';

            cursor q_area_reviewer (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id from emdba.em_user_t a
                where a.area_cd = p_Area_id --b.area from emdba.em_site_t b where b.site_id = pSite_id) OR
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'AR';

            cursor q_validator is
                select a.user_id from emdba.em_user_t a
                where decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'V';





        lnDefaultFacId      emdba.em_subsite_facility_t.default_whep_fac_id%type;
        lcCurrentStatus     emdba.em_staffing_pkg_status_t.package_status%type;
        lnNewPackageID      number;
        lcActiveFlag        varchar2(1):='A';
        USER_REC            EMDBA.EM_USER_T%ROWTYPE;
        Approver_rec        approver%rowtype;
        lcManager_name      varchar2(100):='NONE';
        lcApprovers_name    varchar2(100):='';
        lcStatus            emdba.em_staffing_pkg_status_t.package_status%type;
        lcPackageType       emdba.em_staffing_pkg_status_t.package_type%type;
        lc_last_name        varchar2(100);
        lc_first_name       varchar2(100);
        lcuserPassword      emdba.em_user_t.user_password%type;
        r_area_manager_rec  q_area_manager%rowtype;
        v_Response          varchar2(100);
        v_criteria_version  number(10,0):=0;
        v_area_cd           emdba.em_user_t.area_cd%type;
        v_submitters_user_id    emdba.em_user_t.user_id%type;
        v_submitters_email  whep.whep_approvals.submitters_email%type:=NULL;
        v_area_reviewers_name   varchar2(100);
        v_area_reviewers_email  varchar2(100);
        v_area_reviewers_id emdba.em_user_t.user_id%type;


        begin


        /* This procedure sets the status for the specified staffing package
            the following is the meaning for each status:
            C - Current/Working package
            S - Submitted package (Package has been submitted for review)
            R - Returned (Package has been returned to Submitter for editions and additions,
            A - Approved package (Package has been approved)
            --- The following statuses were added on 01/03/2013 ---
            ARA - Area Reviewer Approved
            R - Area Reviewer Returned or Area Manager Returned
            VA  - HQ Validator Approved
            VR  - HQ Validator Returned

            */


             /*select default_whep_fac_id into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;*/
             open dfault_fac_id;
             fetch dfault_fac_id into lnDefaultFacId;
             close dfault_fac_id;


             if pPackagetype = 'EWHEP' THEN
                lcPackagetype := 'WHEP';
             ELSE
                 lcPackagetype := pPackageType;
                 lnDefaultFacId := tnFac_id;
             end if;




             /*select package_status into lcCurrentStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = lnDefaultFacId
             and package_id = pPackage_id
             AND active_flag ='A'
             and package_type = pPackageType;*/

             open current_status(lnDefaultFacId);
             fetch current_status into lcCurrentStatus;
             close current_status;

             open approver;
             fetch approver into approver_rec;
             close approver;

             open current_user;
             fetch current_user into user_rec;
             close current_user;

             open user_name;
             fetch user_name into lc_last_name, lc_first_name;
             close user_name;

            if (approver_rec.user_id <> pUser and pPackage_status in ('A','R','ARA','ARR','VA','VR'))
                and (user_rec.whep_approver = 'N' and user_rec.ms47_approver = 'N') then
                htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                RETURN;
            end if;


 /*            insert into whep.hm (a,b) values ('pPackage_id',pPackage_id);
             insert into whep.hm (a,b) values ('pPackageType',pPackageType);
             insert into whep.hm (a,b) values ('pPackage_Status',pPackage_Status);
             insert into whep.hm (a,b) values ('current_status',lcCurrentStatus);
             insert into whep.hm (a,b) values ('lnDefaultFacId',lnDefaultFacId);
             COMMIT;*/

             lcStatus :=pPackage_Status;
             lnNewPackageID := pPackage_id;

            /*select * into user_rec
             from emdba.em_user_t a
             where a.user_id = pUser;*/


            select distinct criteria_version
            into v_criteria_version
            from whep.whep_criteria;

            if pPackageType = 'MS47' then
                v_criteria_version := null;
            end if;

             lcuserPassword := emapp.em_decryption_fnc(user_rec.user_password);

            -- insert into hm (a,b) values ('user_rec.whep_approver',user_rec.whep_approver);
             --commit;

             if pPackage_status = 'A' then
                 if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver ='N' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                     if USER_REC.ms47_approver ='N' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 end if;
                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;

             -- Approver's pass

             -- if the new status is 'S' then the lcmanager_name is the submitters name
             -- and the ApproversName is passed
             -- if the new status is 'A' then the lcmanager_name is the approvers name
             -- if the new status is 'ARA' or 'ARR' then the lcmanager_name is the reviewer's name
             -- if the new status is 'VA' or 'VR' then the lcmanager_name is the headquarters' validator's name
             --Note: pPackage_status is the new package status

             if pPackage_status = 'S' then
                lcmanager_name := user_rec.First_name||' '||user_rec.Last_name; -- Submitters_name
                lcApprovers_name := pApproversName;
            -- insert into whep.hm (a,b) values ('lcmanager_name',user_rec.First_name);
            -- commit;
                lcmanager_name := lc_first_name||' '||lc_last_name; -- Submitters_name
                lcApprovers_name := pApproversName;

                v_submitters_user_id := user_rec.user_id;
                v_submitters_email := user_rec.email_address;

             else --C') then
               --   lcApprovers_name := user_rec.First_name||' '||user_rec.Last_name;
                lcApprovers_name := lc_first_name||' '||lc_last_name; -- Submitters_name
                 if lcCurrentStatus = 'A' then
                     select max(package_id)+1 into lnNewPackageID
                     from emdba.em_staffing_pkg_status_t
                     where site_id = pSite_id
                     and whep_fac_id = lnDefaultFacId
                     and package_type = pPackageType;


                 end if;
             end if;

             if pPackageType = 'EWHEP' then
                insert into WHEP.whep_approvals
                (site_id, whep_fac_id, approvaldate, create_date, create_user,
                package_status, package_id, package_comments, submitterS_NAME,
                approvers_name, approvers_email, submitters_user_id, submitters_email)
                values(pSite_id, lnDefaultFacId, sysdate,
                sysdate, pUser, pPackage_status ,lnNewPackageID,
                pComments, lcManager_name, lcApprovers_Name, pApproversEmail,
                v_submitters_user_id, v_submitters_email);
             else
                 INSERT INTO MS47.PACKAGE_CERT
                 (SITE_ID, WHEP_FAC_ID, APPROVALDATE, CREATE_DATE, USER_ID, PACKAGE_STATUS,
                 PACKAGE_ID, PACKAGE_COMMENTS, submitters_name, approvers_name,
                 approvers_email, submitters_user_id, submitters_email)
                 VALUES (pSite_id, tnFac_id, sysdate, sysdate, pUser,
                 pPackage_status, lnNewPackageID, pComments, lcManager_name,
                 lcApprovers_name, pApproversEmail, v_submitters_user_id, v_submitters_email);
                 --to_date(nvl(pApprovalDate,sysdate),'MM/DD/YYYY HH:MI AM')

            end if;
            commit;

--            if lcCurrentStatus in ('A', 'R') then
                   -- When change is made to currently approved package or the returned package, the new status is 'C';

                 -- Use this space for future code to copy current package to archives

            if (pPackage_status = 'C' and lcCurrentStatus = 'A') then
               update emdba.em_staffing_pkg_status_t
               set ACTIVE_FLAG = 'I'
               where site_id = pSite_id
               and whep_fac_id = lnDefaultFacId
               --and package_id <> lnNewPackageID;
               and package_type = pPackageType
               AND package_id <> lnNewPackageID;

               commit;

                -- When a change is made to an approved package, it is a new package.  Therefore,
                -- UPDATE THE CURRENT PACKAGE ID'S IN EACH TABLE TO THE NEW PACKAGE ID.
                 update_pkg_id(pSite_id, tnFac_id, pPackageType, lnNewPackageID);

                 if pPackageType = 'EWHEP' then
                    update whep.whep_craft_position
                    set current_quantity = approved_quantity
                    where site_id = pSite_id
                    and whep_fac_id = lnDefaultFacId;

                    update whep.whep_additional_craft_position
                    set current_quantity = approved_quantity
                    where site_id = pSite_id
                    and whep_fac_id = lnDefaultFacId;
                end if;


            end if;

             if lcCurrentStatus = 'A' then  -- If current package status is "A",
                                            -- then the package is being set to "C".
                     /*select max(package_id)+1 into lnNewPackageID
                     from emdba.em_staffing_pkg_status_t
                     where site_id = pSite_id
                     and whep_fac_id = tnFac_id
                     and package_type = pPackageType;*/

                   /*   commented on 10/19/2010 by Michael E. Harris
                        The following code was moved to a preceding section.*/

                    select area
                    into v_area_cd
                    from emdba.em_site_t
                    where site_id = pSite_id;

                    if v_area_cd = '1H' then
                        v_area_cd := '1G';
                    end if;

                     open q_area_manager(v_area_cd);
                     fetch q_area_manager into r_area_manager_rec;
                     close q_area_manager;

                     insert into emdba.em_staffing_pkg_status_t
                     (site_id, whep_fac_id, create_date, create_user, mod_date, mod_user,
                     package_status, package_id, active_flag, package_type, approval_date, approval_user_id, criteria_version)
                     values(pSite_id, lnDefaultFacId, sysdate, pUser, sysdate, pUser,
                     'C',lnNewPackageID,'A',pPackageType, null, r_area_manager_rec.user_id, v_criteria_version);
                     commit;
                     lcActiveFlag := 'I';
                     lcStatus :='A';

             elsif lcCurrentStatus = 'R' then
                    lcActiveFlag := 'A';
                    lcStatus := 'C';

            END IF;




--             else
    if pPackage_status = 'A' then

        update emdba.em_staffing_pkg_status_t
        set package_status = lcStatus,
        mod_date = sysdate,
        mod_user = pUser,
        active_flag = lcActiveFlag,
        approval_date = sysdate,
        archived_date = sysdate
        --approval_user_id = pUser
        where site_id = pSite_id
        and whep_fac_id = lnDefaultFacId
        and package_id = pPackage_id
        and package_type = pPackageType;
        COMMIT;
/*        delete from whep.hm;
        commit;*/


        -- If the package status is 'A' (Approved) then archive that package.
        archive_package(pSite_id, tnFac_id, pPackageType, pPackage_id, v_Response);
        if v_Response = 'ARCHIVEDDUPLICATE' THEN
            htp.p('<?xml version="1.0"?>');
            htp.p('<RESPONSE>ARCHIVEDDUPLICATE</RESPONSE>');
            RETURN;
        END IF;

    else -- pPackage_status <> 'C' then

        if pPackage_status = 'S' and pPackageType = 'EWHEP' then
            update whep.whep_craft_position
            set approved_quantity = estimated_quantity,
            mod_date = sysdate,
            mod_user = pUser
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId;
            commit;
        end if;

        if pPackage_status in ('R','S') then
            update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;

        elsif pPackage_status = 'C' then

            update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;

        end if;
    --  AND package_id <> lnNewPackageID;
    end if;


        commit;
        htp.p('<?xml version="1.0"?>');
        htp.p('<RESPONSE>SUCCESS</RESPONSE>');

        -- Recording package status change in modification history table.
        -- Although this is done in the respective tables - WHEP_APPROVALS, MS47.CERTIFICATION
        -- we keep another history for quality assurance purposes.
        WHEP.WHEP_WORKHOUR_SUMMARY.INSERT_INTO_HISTORY(pSite_id, lnDefaultFacId,
            'PACKAGE APPROVAL/SUBMISSION',pUser, pPackageType||' Package Status set to: '||pPackage_status);

   exception
      when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<RESPONSE>ERROR</RESPONSE>');

    end;

    procedure get_pkg_id (pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackageType  in varchar2 default 'EWHEP')

                    is

         lnDefaultFacId      emdba.em_subsite_facility_t.default_whep_fac_id%type;
         lnPackage_id        emdba.em_staffing_pkg_status_t.package_id%type:=0;
         lcPackage_status    emdba.em_staffing_pkg_status_t.package_status%type;

        begin

             select default_whep_fac_id into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;



             IF pPackageType = 'MS47' THEN
                lnDefaultFacId := tnFac_id;
             END IF;

             select package_status, package_id
             INTO lcPackage_Status, lnPackage_id
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = lNDefaultFacId
             and active_flag = 'A'
             and package_type = pPackageType;

            htp.p('<?xml version="1.0"?>');
            htp.p('<ROW>');
            htp.p('<PSTATUS>'||lcPackage_Status||'</PSTATUS>');
            htp.p('<PID>'||to_char(lnPackage_id)||'</PID>');
            HTP.P('</ROW>');
        END;


/*****************************************************************************************************
 * Procedure Name: update_pkg_id
 * Purpose: This procedure accepts the site_id, facility_id(tnFac_id), staffing package type (pPackage_Type),
 *          Staffing Package Id (pPackage_id) as parameters.  Using these parameters, it updates the
 *          the specified staffing package id when a change is made to an approved staffing package.
 *
 * Note: The package_type will be either "EWHEP" OR "MS47".
 * Author: Michael E. Harris
 * Create Date: 12/21/2010
 *
 *****************************************************************************************************/


    procedure update_pkg_id(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackageType  in varchar2 default 'EWHEP',
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1)


            is


        cursor whep_tables is
            select table_name from ALL_TAB_COLUMNS where COLUMN_NAME='PACKAGE_ID'
            and owner = 'WHEP' AND table_name NOT LIKE 'VIEW%'
            and table_name not like '%_BK%' and table_name not in ('QUERY_RESULTS', 'WHEP_EXCEPTIONS','WHEP_MODIFICATION_HISTORY', 'WHEP_APPROVALS')
            AND TABLE_NAME NOT LIKE 'V_%' AND TABLE_NAME NOT LIKE 'WHE_2C%' AND
            TABLE_NAME NOT LIKE 'WHE_MAJOR%' AND TABLE_NAME NOT LIKE 'WHEP_R_%'  AND TABLE_NAME LIKE 'WHEP_%'
            AND TABLE_NAME NOT LIKE '%_ARCHIVE' AND TABLE_NAME NOT LIKE '%_ARC'
            AND TABLE_NAME NOT LIKE '%BXUP'
            AND TABLE_NAME NOT LIKE '%BXP'
            AND TABLE_NAME NOT LIKE '%TEMP'
            ORDER BY TABLE_NAME;

        cursor ms47_tables is
            select table_name from ALL_TAB_COLUMNS where COLUMN_NAME='PACKAGE_ID'
            and owner = 'MS47' AND table_name NOT LIKE 'VIEW%'
            and table_name not like '%_BK%' AND TABLE_NAME NOT IN ('PACKAGE_CERT', 'FACILITY','ROUTEINVENTORY', 'MS47_SP_ERROR_LOG','MS47_SUBSITE_FACILITY_T')
            AND TABLE_NAME NOT LIKE 'V_%' AND table_name not like '%FACILITY%' AND
            TABLE_NAME NOT LIKE 'MS47_F%' AND TABLE_NAME NOT LIKE 'MS47_R_%'  AND TABLE_NAME NOT LIKE '%$%'
            and TABLE_NAME NOT LIKE '%HIRAD' AND TABLE_NAME NOT LIKE '%_HM' AND TABLE_NAME NOT LIKE 'ACT_%'
            AND TABLE_NAME NOT LIKE '%_ORG'
            AND TABLE_NAME NOT LIKE '%BXUP'
            AND TABLE_NAME NOT LIKE '%BXP'
            AND TABLE_NAME NOT LIKE '%TEMP'
            ORDER BY TABLE_NAME;


        v_field_name    varchar2(100);
        sql_statement varchar(2000):='';


BEGIN

        IF pPACKAGETYPE = 'EWHEP' THEN
            FOR J IN WHEP_TABLES LOOP
                if j.table_name = 'WHEP_HIGH_BAY' THEN
                    v_field_name := 'whep_fac_id';
                else
                    v_field_name := 'default_whep_fac_id';
                end if;
                sql_statement := 'update whep.'||j.table_name||' set package_id = :1 '||
                    'where site_id = :2 and '||v_field_name||' = :3';
                execute immediate sql_statement using pPackage_id, pSite_id, tnfac_id ;
                commit;
            end loop;


            update emdba.em_subsite_facility_t set package_id = pPackage_id
            where site_id = pSite_id and default_whep_fac_id = tnFac_id;
            commit;


        else

            FOR J IN MS47_TABLES LOOP
                sql_statement := 'update MS47.'||j.table_name||' set package_id = :1 '||
                    'where site_id = :2 and whep_fac_id = :3';
                execute immediate sql_statement using pPackage_id, pSite_id, tnfac_id ;
                commit;
            end loop;
        END IF;
END;



  procedure get_pkg_approver_info(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                               papprover_type in varchar2 default 'EWHEP')

            is

            cursor site_area_info is
            select area from emdba.em_site_t
            where site_id = pSite_id;

            cursor approver (fac_id in emdba.em_subsite_facility_t.whep_fac_id%type) is
            select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
            email_address, user_id, user_logon, user_password
            from emdba.em_user_t where USER_ID in (SELECT APPROVAL_USER_ID FROM EMDBA.EM_STAFFING_PKG_STATUS_T WHERE
            SITE_ID = pSite_id and whep_fac_id = Fac_id and package_type = papprover_type
            and active_flag = 'A');
            /*area_cd = area_id
            and WHEP_APPROVER= 'Y';*/


            /* cursor MS47_approver is
            select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
            email_address, user_id, user_logon, user_password
            from emdba.em_user_t where USER_ID in (SELECT APPROVAL_USER_ID FROM EMDBA.EM_STAFFING_PKG_STATUS_T WHERE
            SITE_ID = pSite_id and whep_fac_id = tnFac_id and package_type = 'MS47'
            and active_flag = 'A');
            select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
            email_address, user_id, user_logon, user_password
            from emdba.em_user_t where area_cd = area_id1
            and  MS47_APPROVER = 'Y';*/

            APPROVER_INFO   APPROVER%ROWTYPE;
            APPROVER_REC    EMDBA.EM_USER_T%ROWTYPE;
            LCAREA_ID       VARCHAR2(2):='';
            LCNAME          VARCHAR2(400):='';
            LCEMAIL         VARCHAR2(200):='';
            LNUSER_ID       EMDBA.EM_USER_T.user_id%TYPE;
            LCUSER_LOGON    EMDBA.EM_USER_T.user_logon%TYPE;
            LCPASSWORD      EMDBA.EM_USER_T.user_password%TYPE;
            v_fac_id        emdba.em_subsite_facility_t.whep_fac_id%type:=tnFac_id;
            v_user_id_ISC   EMDBA.EM_USER_T.user_id%TYPE;

        BEGIN

/*        OPEN SITE_AREA_INFO;
        FETCH SITE_AREA_INFO INTO LCAREA_ID;
        CLOSE SITE_AREA_INFO;*/

        -- CODE ADDED BY MICHAEL E. HARRIS ON 12/1/2009
        -- AT REQUEST OF KATHY CARRICO(BOSS)

     /*   IF pSite_id in (320, 489, 391, 277, 212, 393) then
            if PAPPROVER_TYPE = 'EWHEP' then
                select first_name ||' '||middle_name||' '||last_name,
                email_address, user_id, user_logon, user_password
                into LCNAME, LCEMAIL, LNUSER_ID, LCUSER_LOGON, LCPASSWORD
                from emdba.em_user_t
                where user_id = 1324114 and whep_approver = 'S';
            ELSE
                -- Hirad 090811
                IF pSite_id IN (489, 391, 277, 212, 393) THEN
                   v_user_id_ISC := 1324114; -- JOHN W. HOLDEN
                ELSE
                   v_user_id_ISC := 1007780; -- per Mark on 090811 Make Chicago ISC active for DAVID G. SHERFIELD SR Only
                END IF;

                select first_name ||' '||middle_name||' '||last_name,
                email_address, user_id, user_logon, user_password
                into LCNAME, LCEMAIL, LNUSER_ID, LCUSER_LOGON, LCPASSWORD
                from emdba.em_user_t
                --where user_id = 1324114 and ms47_approver = 'S';
                where user_id = v_user_id_ISC and ms47_approver = 'S';

            end if;

        else*/



/*            LCAREA_ID = '1K'

        CASE
            WHEN pSite_id = 79 THEN
                 LCAREA_ID := '1J';
            WHEN pSite_id IN (489,391) THEN
                 LCAREA_ID := '1F';
            WHEN pSite_id = 277 THEN
                 LCAREA_ID := '1H';
            WHEN pSite_id = 212 THEN
                 LCAREA_ID := '1B';
            ELSE*/
                 OPEN SITE_AREA_INFO;
                FETCH SITE_AREA_INFO INTO LCAREA_ID;
                CLOSE SITE_AREA_INFO;
       -- END CASE;




            IF PAPPROVER_TYPE = 'EWHEP' THEN
                select default_whep_fac_id
                into v_fac_id
                from emdba.em_subsite_facility_t
                where site_id = pSite_id
                and whep_fac_id = tnFac_id;
            end if;
               OPEN APPROVER(v_fac_id);
               FETCH APPROVER INTO LCNAME, LCEMAIL, LNUSER_ID, LCUSER_LOGON,
               LCPASSWORD;
               CLOSE APPROVER;
           /* ELSE
               OPEN MS47_APPROVER;
               FETCH MS47_APPROVER INTO LCNAME, LCEMAIL, LNUSER_ID, LCUSER_LOGON,
               LCPASSWORD;
               CLOSE MS47_APPROVER;
            END IF;*/
      --  end if;


            htp.p('<?xml version="1.0"?>');
            htp.p('<ROW>');
            HTP.P('<UNAME>'||LCNAME||'</UNAME>');
            HTP.P('<UEMAIL>'||LCEMAIL||'</UEMAIL>');
            htp.p('<USERID>'||TO_CHAR(LNUSER_ID)||'</USERID>');
            HTP.P('</ROW>');

    exception
      when others then
             htp.p('<?xml version="1.0"?>');
            htp.p('<ROW>');
            HTP.P('<UNAME>ERROR</UNAME>');
            HTP.P('<UEMAIL>ERROR</UEMAIL>');
            HTP.P('</ROW>');
      END get_pkg_approver_info;

    procedure new_pkg(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackageType  in varchar2 default 'EWHEP',
                            PAll          IN VARCHAR2 DEFAULT 'N')


                            is


    cursor ms47_facilities is
    select site_id, whep_fac_id
    from emdba.em_subsite_facility_t
    where ms47_enable = 'Y' minus (select site_id, whep_fac_id from emdba.em_staffing_pkg_status_t where
    package_type = 'MS47');

    CURSOR EWHEP_FACILITIES IS
    select site_id, whep_fac_id
    from emdba.em_subsite_facility_t
    where WHEP_enable = 'Y' AND whep_fac_id = DEFAULT_WHEP_FAC_ID minus (select site_id, whep_fac_id from emdba.em_staffing_pkg_status_t where
    package_type = 'EWHEP');

    TYPE cur_typ IS REF CURSOR;

    cursor whep_approver is
    select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
    email_address, user_id, user_logon, user_password
    from emdba.em_user_t where area_cd in (SELECT area FROM EMDBA.EM_Site_T WHERE
    SITE_ID = pSite_id)
    and whep_approver = 'S';

    cursor ms47_approver is
    select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
    email_address, user_id, user_logon, user_password
    from emdba.em_user_t where area_cd in (SELECT area FROM EMDBA.EM_Site_T WHERE
    SITE_ID = pSite_id)
    and ms47_approver = 'S';


    facilities cur_typ;

    lnCount                 integer:=0;
    lnFacId          emdba.em_subsite_facility_t.default_whep_fac_id%type;
    lnSQLStatement          varchar2(4000);
    approver_rec        whep_approver%rowtype;
    v_criteria_version  emdba.em_staffing_pkg_status_t.criteria_version%type:=0;

    begin



         lnFacId := tnFac_id;
         if pPackageType = 'EWHEP' then
            select b.default_whep_fac_id
            into lnFacId
            from emdba.em_subsite_facility_t b
            where b.site_id = pSite_id
            and b.whep_fac_id = tnFac_id;

            select distinct nvl(criteria_version,0)
            into v_criteria_version
            from whep.whep_criteria;

            open whep_approver;
            fetch whep_approver into approver_rec;
            close whep_approver;

         else
            open ms47_approver;
            fetch ms47_approver into approver_rec;
            close ms47_approver;
         end if;


         select NVL(count(1),0) into lnCount
         from emdba.em_staffing_pkg_status_t a
         where a.site_id = pSite_id
         and a.whep_fac_id = lnFacId
         and a.package_type = pPackageType;

         if lnCount = 0 then
            insert into emdba.em_staffing_pkg_status_t a
            values(pSite_id, lnFacId, sysdate, -1, sysdate, -1, 'A', 1,'C', pPackageType,null,approver_rec.user_id, v_criteria_version,null, null, 'N','N', NULL, 0, 0, 0, NULL);
            commit;
         end if;
    end new_pkg;



    procedure main_menu_old(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pCalledFromReports in varchar2 default 'N')

                            is



             lcOpener   varchar2(30) := '';


        begin

        htp.p('<script language="javascript">');
        if pCalledFromReports = 'Y' then
           lcOpener := 'opener.opener.';
        end if;
        htp.p('function StaffingMenu() {


    var lcStatus = "Approved";




    if (ndcFlag) {
        var bldgSvcsButton = "Building Service/High Bay/FMO/MOS";
    }
    else {
        var bldgSvcsButton = "Building Service/FMO/MOS";
    }


    var lcwhepStatus = "Approved";
    var lcms47Status = "Approved";


    if ('||lcOpener||'opener.lastwhepCertStatus == ''R'') {
        lcwhepStatus = ''<font color="red">Returned</font>'';
    }
    if ('||lcOpener||'opener.lastwhepCertStatus ==''A'') {
        lcwhepStatus = ''<font color="lime">Approved</font>'';
    }
    if ('||lcOpener||'opener.lastms47CertStatus == ''R'') {
        lcms47Status = ''<font color="red">Returned</font>'';
    }
    if ('||lcOpener||'opener.lastms47CertStatus ==''A'') {
        lcms47Status = ''<font color="lime">Approved</font>'';
    }

    '||lcOpener||'opener.wheppackageStatus = '||lcOpener||'opener.document.getElementById(''hidWHEPPackage_Status'').value;
    '||lcOpener||'opener.ms47packageStatus = '||lcOpener||'opener.document.getElementById(''hidMS47Package_Status'').value;



    var currentStatus = "Working";
    '||lcOpener||'opener.currentWhepStatus = "Working";
    '||lcOpener||'opener.currentMS47Status = "Working";



    switch('||lcOpener||'opener.ms47packageStatus) {
        case ''R'': {  // Approver Returned
            '||lcOpener||'opener.currentMS47Status = ''<font color="red">Returned</font>'';
            break;
        }
        case ''A'': { //Approved
            '||lcOpener||'opener.currentMS47Status = ''<font color="lime">Approved</font>'';
            break;
        }
        case ''C'': { // Current - Working
            '||lcOpener||'opener.currentMS47Status = ''<font color="white">Working</font>'';
            break;
        }
        case ''S'': { // Submitted
            '||lcOpener||'opener.currentMS47Status = ''<font color="yellow">Submitted</font>'';
        }
    }

    switch('||lcOpener||'opener.wheppackageStatus) {
        case ''R'': {  // Approver Returned
            '||lcOpener||'opener.currentWhepStatus = ''<font color="red">Returned</font>'';
            break;
        }
        case ''A'': { //Approved
            '||lcOpener||'opener.currentWhepStatus = ''<font color="lime">Approved</font>'';
            break;
        }
        case ''C'': { // Current - Working
            '||lcOpener||'opener.currentWhepStatus = ''<font color="white">Working</font>'';
            break;
        }
        case ''S'': { // Submitted
            '||lcOpener||'opener.currentWhepStatus = ''<font color="yellow">Submitted</font>'';
        }
    }


   '||lcOpener||'opener.document.all.divStaffingMenu.innerHTML=
    ''<center><table cellpadding="3" cellspacing="0" width="652" height="400" border="0" id="table1" align="center" bgcolor = "#A7A400" valign="top">''+
                //<!-- MSTableType="layout" -->
''<tr height="27">''+
''<td height="27" width="315" colspan="6">''+
''<font color="black">Current WHEP Package Status: </font>''+'||lcOpener||'opener.currentWhepStatus+''</font>''+
''</td>''+
''<td>&nbsp;</td>''+
''<td height="27" width="315" colspan="4" align ="right">''+
''<font color="black">Current MS47 Package Status: </font>''+'||lcOpener||'opener.currentMS47Status+''</font>''+
''</td>''+
''</tr>''+

                ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td valign="top" colspan="6" align="right">''+
                        ''<img border="2" src="/emars-img/emarsStaffing.jpg" width="200" height="100" align="center" hspace="3"></td>''+
                        ''<td align="center">&nbsp;<input type="button" onClick=doMenu("eMS47Direct") style="background: #FFFF00; color : #FF0000;  width: 120; height:29; font-weight:bold; text-align:justify" value="Staffing Direct" /></td>''+
                        ''<td height="114">&nbsp;</td>''+
                        ''</tr>''+
                ''<tr>''+
                        ''<td></td>''+
                        ''<td></td>''+
                        ''<td></td>''+
                        ''<td></td>''+

                        ''<td></td>''+
                        ''<td></td>''+
                        ''<td></td>''+

                        ''<td></td>''+
                        ''<td height="21"></td>''+

                ''</tr>''+
                ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td height="35" valign="top" align="center" colspan="9">''+
                        ''<input type="button" onClick=doMenu("SiteInfo") style="width: 270; height:25; color: blue; font-weight:bold" value="Facility Information" /></td>''+
                ''</tr>''+
                ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td align="center" valign="top" colspan="4"><input type="button" onClick=doMenu("MailProcessingEquipment") style="width: 270; height:25; color: blue; font-weight:bold" value="Mail Processing Equipment" id="mailproc" name="mailproc" /></td>''+

                        ''<td>&nbsp;</td>''+


                       ''<td valign="top" align="center" colspan="3"><input type="button" onClick=doMenu("Postal") style="width: 270; height:25; color: blue; font-weight:bold" value="Inventory and Scheduling" /></td>''+
                        ''<td height="35">&nbsp;</td>''+
                ''</tr>''+
                 ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td align ="center" valign="top" colspan="4"><input type="button" onClick=doMenu("BldgBldgEquipment") style="width: 270; height:25; color: blue; font-weight:bold" value="Bldg & Building Equipment" id="buildequip" name="buildequip" /></td>''+
                        ''<td>&nbsp;</td>''+

                        ''<td valign="top" colspan="3"><input type="button" onClick=doMenu("Routes") style="width: 270; height:25; color: blue; font-weight:bold" value="PS Form 4776 (Routes)" id="routes" name="routes" /></td>''+
                        ''<td height="35">&nbsp;</td>''+
                ''</tr>''+
                 ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td align ="center" valign="top" colspan="4"><input type="button" onClick=doMenu("BuildingServiceFMO") style="width: 270; height:25; color: blue; font-weight:bold" value="''+bldgSvcsButton+''" id="buildsrv" name="buildsrv" /></td>''+

                        ''<td>&nbsp;</td>''+

                        ''<td valign="top" align="center" colspan="3"><input type="button" onClick=doMenu("MS47System") style="width: 270; height:25; color: blue; font-weight:bold" value="SYSTEM" /></td>''+
                        ''<td height="35">&nbsp;</td>''+
                ''</tr>''+
                 ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td align="center" valign="top" colspan="4">''+
                        ''<input type="button" onClick=doMenu("WorkSummary") style="width: 270; height:25; color: blue; font-weight:bold" value="Work Hour Summary" id="worksummary" name="worksummary" /></td>''+

                        ''<td>&nbsp;</td>''+

                        ''<td valign="top" colspan="3"><input type="button" onClick=doMenu("MS47Reports") style="width: 270; height:25; color: blue; font-weight:bold" value="MS47 Reports" /></td>''+
                        ''<td height="35">&nbsp;</td>''+
                ''</tr>''+
          ''<tr>''+
                        ''<td>&nbsp;</td>''+
            ''<td valign="top" colspan="13" align="center" height="35">''+
            ''<input type="button" onClick=doMenu("WHEPReports") style="width: 320; height:25; color: blue; font-weight:bold" value="WHEP Reports" id="whepreports" name="whepreports"/></td>''+
                ''</tr>''+

                ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td valign="top" align="center" colspan="10">''+
                        ''&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onClick=doMenu("PackageCertification") style="width: 320; height:25; color: blue; font-weight:bold" value="Staffing Package Submission/Approval" id="pckgecert" name="pckgecert"/></td>''+
                       ''<td height="35" align="center">''+
                            ''<img name="nm_Help_1" id="id_Help_1" onClick="imgHelp_onClick(17);" src="/emars-img/MS47_Help.png">''+
                        ''</td>''+
                ''</tr>''+


        ''<tr>''+
        ''<td width="70">&nbsp;</td>''+
            ''<td  colspan="9" height="29">This WHEP Staffing Package was last Submitted on&nbsp; <font color="yellow">''+'||lcOpener||'opener.lastwhepSubDate+''</font>&nbsp; by &nbsp;<font color="yellow">''+'||lcOpener||'opener.lastwhepSubName+''</font>.</font></td>''+
            ''</tr>''+

        ''<tr>''+
            ''<td width="70">&nbsp;</td>''+
            ''<td colspan="9"><font style="size:8px;">This WHEP Staffing Package was last ''+lcwhepStatus+'' on&nbsp; <font color="yellow">''+'||lcOpener||'opener.lastwhepCertDate+''</font>&nbsp; by &nbsp;<font color="yellow">''+'||lcOpener||'opener.lastwhepCertName+''</font>.</font></td>''+
            ''<td width="150">&nbsp;</td>''+
            ''<tdwidth="88">&nbsp;</td>''+
            ''<td width="4" >&nbsp;</td>''+
            ''<td height="29" width="97">&nbsp;</td>''+
        ''</tr>''+

        ''<tr>''+

        ''<td width="70">&nbsp;</td>''+
            ''<td  colspan="9" height="29">This MS47 Staffing Package was last Submitted on&nbsp; <font color="yellow">''+'||lcOpener||'opener.lastms47SubDate+''</font>&nbsp; by &nbsp;<font color="yellow">''+'||lcOpener||'opener.lastms47SubName+''</font>.</font></td>''+

            ''</tr>''+
        ''<tr>+
            <td width="70">&nbsp;</td>
            <td colspan="9"><font style="size:8px;">This MS47 Staffing Package was last ''+lcms47Status+'' on&nbsp; <font color="yellow">''+'||lcOpener||'opener.lastms47CertDate+''</font>&nbsp; by &nbsp;<font color="yellow">''+'||lcOpener||'opener.lastms47CertName+''</font>.</font></td>
            <td width="150">&nbsp;</td>
            <tdwidth="88">&nbsp;</td>
            <td width="4" >&nbsp;</td>
            <td height="29" width="97">&nbsp;</td>
        </tr>
        </table></center>;
}');
         htp.p('</script>');


end;


procedure staffing_initialize_iframe(pSiteid in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPage in varchar2 default 'Submit',
                            pUser in emdba.em_user_t.user_id%type)
                            is

begin

htp.p('<iframe width=940 height=360 name="iframefacs" id="iframefacs" src= "emapp.em_staffing_package.staffing_facility_sel?pSiteid='||pSiteid||'&tnFac_id='||tnFac_id||'&pPage='||pPage||'&pUser='||to_char(pUser)||'" ></iframe>');
end;


procedure staffing_facility_sel(pSiteid in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPage in varchar2 default 'Submit',
                            pUser in emdba.em_user_t.user_id%type)


        is


        --This cursor is the data for the grid on the Package Approval/Submission module on
        --the "Staffing Menu"  It queries emdba.em_subsite_facility for 4 of the columns
        --and simultaneously queries the package status from emdba.em_staffing_package_status_t.
        --Note: only the whep_enabled default facilities(facilities in which the default_whep_fac_id
        --matches the whep_fac_id) have whep package statuses.

        cursor facilities is
 select c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                 c.whep_enable, c.ms47_enable, decode(c.whep_fac_id,c.default_whep_fac_id,'Y','N') as default_facility,
                 decode(c.whep_enable,'Y',decode(c.whep_fac_id,c.default_whep_fac_id,(select a.package_status from emdba.em_staffing_pkg_status_t a where
                 a.site_id = c.site_id and a.whep_fac_id = c.whep_fac_id and a.package_type = 'EWHEP' AND A.active_flag = 'A'),NULL)) AS WHEP_PACKAGE_STATUS,
            /*     decode(c.whep_enable,'Y', decode(c.whep_fac_id, c.default_whep_fac_id, (select trim(d.first_name)||' '||trim(d.middle_name)||' '||trim(d.last_name) from
                 emdba.em_user_t d where d.user_id in (select a.approval_user_id from emdba.em_staffing_pkg_status_t a where
                 a.site_id = c.site_id and a.whep_fac_id = c.whep_fac_id and a.package_type = 'EWHEP' and a.active_flag = 'A')), '&nbsp;'), '&nbsp;') as whep_approver,
                 decode(c.MS47_enable,'Y', (select trim(d.first_name)||' '||trim(d.middle_name)||' '||trim(d.last_name) from
                 emdba.em_user_t d where d.user_id in (select a.approval_user_id from emdba.em_staffing_pkg_status_t a where
                 a.site_id = c.site_id and a.whep_fac_id = c.whep_fac_id and a.package_type = 'MS47' and a.active_flag = 'A')), '&nbsp;') as ms47_approver,*/
                 decode(c.MS47_enable,'Y',(select a.package_status from emdba.em_staffing_pkg_status_t a where
                 a.site_id = c.site_id and a.whep_fac_id = c.whep_fac_id and a.package_type = 'MS47' AND A.active_flag = 'A'),NULL) AS MS47_PACKAGE_STATUS
                    from emdba.em_subsite_facility_t c
                    where c.site_id = pSiteid
                    and (c.whep_enable = 'Y' or c.ms47_enable = 'Y')
                    order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name;

        /*  select c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                 c.whep_enable, c.ms47_enable, decode(c.whep_fac_id,c.default_whep_fac_id,'Y','N') as default_facility
                    from emdba.em_subsite_facility_t c
                    where c.site_id = pSiteid
                    and (c.whep_enable = 'Y' or c.ms47_enable = 'Y')
                    order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name;*/








  --         cursor current_returned is




        reccount            INTEGER(4):=0;
        recnum              integer(4):=0;
        recnum2             integer(4):=0;
        v_Whep_Package_Status   varchar2(100):='';
        v_MS47_Package_Status   varchar2(100):='';
        v_Whep_Approver_Name    varchar2(100):='';
        v_MS47_Approver_Name    varchar2(100):='';
        v_Whep_Approver_Id      integer(8):=0;
        v_MS47_Approver_Id      integer(8):=0;
        v_Whep_Approver_Priv    varchar2(1);
        v_MS47_Approver_Priv    varchar2(1);
        v_is_areareviewer       varchar2(1) := 'N';
        v_is_hqvalidator        varchar2(1) := 'N';
        v_user_id               emdba.em_user_t.user_id%type;
        v_area                   emdba.em_site_t.area%type;
        begin
          -- Start Grace added on 07/12/2013
          -- check if current user is area reviewer
            select area
            into v_area
            from emdba.em_site_t
            where site_id = pSiteid;

            if v_area = '1H' then
                v_area := '1G';
            end if;

            select user_id
            into v_user_id
            from emdba.em_user_t
            where (whep_approver = 'R' or ms47_approver = 'R')
            and area_cd = v_area;

            if pUser = v_user_id then
              v_is_areareviewer := 'Y';
            end if;
            
          -- check if current user is HQ validator
            select user_id
            into v_user_id
            from emdba.em_user_t
            where (whep_approver = 'V' or ms47_approver = 'V');
            
            if pUser = v_user_id then
              v_is_hqvalidator := 'Y';
            end if;
          -- End Grace added on 07/12/2013    
            
            select count(*)
            INTO RECCOUNT
            from (select a.facility_name, a.whep_fac_id, a.default_whep_fac_id
            from emdba.em_subsite_facility_t a
            where a.site_id = pSiteid
            --and a.whep_fac_id = tnFac_id
            and (a.whep_enable = 'Y' or a.ms47_enable = 'Y')
           --group by a.acronym, a.class_code, a.acronym_fk, b.acronym_desc
            order by decode(a.subsite_default_yn,'Y','A','B'),a.facility_name);




             htp.p('<html>');

             htp.p('<head>');
htp.p('<script language="Javascript">');



htp.p('function checkBox_onClick(cValue) { ');
htp.p(' var objGridData = new ActiveXObject("microsoft.XMLDOM");');
htp.p('var checkCount = 0');
htp.p('if (document.getElementById(cValue).checked) {');
htp.p(' parent.document.getElementById("btnSave").disabled = false;');
htp.p('}');
htp.p('else {');
htp.p(' objGridData.async=false;');
htp.p(' objGridData.load("emapp.em_staffing_package.staffing_get_xmlFacility_Data?pSite_id='||to_char(pSiteid)||'&tnFac_id='||to_char(tnFac_id)||'");');
--htp.p('   "&pInSite=Y");');
htp.p(' if (objGridData.parsed) {');
htp.p('     var po=objGridData.getElementsByTagName("ROW");');
htp.p('     var numRows = po.length;');

htp.p('     for (var i = 0; i < po.length; i++) {');

htp.p('                     if (po(i).childNodes(4).text =="Y" && po(i).childNodes(6).text =="Y"  ) {' );
htp.p('                         if (document.getElementById("whep_"+po(i).childNodes(0).text).checked==true) {');
htp.p('                             checkCount++;');
htp.p('                         }');
htp.p('                     }');
-- for ms47
if  v_is_areareviewer != 'Y' and v_is_hqvalidator != 'Y' then
htp.p('                     if (po(i).childNodes(5).text =="Y"  ) {' );
htp.p('                         if (document.getElementById("ms47_"+po(i).childNodes(0).text).checked==true) {');
htp.p('                             checkCount++;');
htp.p('                         }');
htp.p('                     }');
end if;
-- end if for ms47
htp.p('     }');
htp.p(' }');
htp.p(' if (checkCount ==0) {');
htp.p('     parent.document.getElementById("btnSave").disabled = true;');
htp.p(' }');
htp.p('}');
--htp.p('facilitiesOption = facilitiesOption+cValue+"|";');
htp.p('}');

htp.p('function selectFields() {');
htp.p('if (parent.document.all.radAppSel(0).checked==true) {');
htp.p(' var lcStatus = "C";');
htp.p('}');
htp.p('if (parent.document.all.radAppSel(1).checked==true) {');
htp.p(' var lcStatus = "S";');
htp.p('}');
htp.p('var checkCount = 0;');
htp.p(' var objGridData = new ActiveXObject("microsoft.XMLDOM");');
htp.p(' objGridData.async=false;');
htp.p(' objGridData.load("emapp.em_staffing_package.staffing_get_xmlFacility_Data?pSite_id='||to_char(pSiteid)||'&tnFac_id='||to_char(tnFac_id)||'");');
--htp.p('   "&pInSite=Y");');
htp.p(' if (objGridData.parsed) {');
htp.p('     var po=objGridData.getElementsByTagName("ROW");');
htp.p('     var numRows = po.length;');

htp.p('     for (var i = 0; i < po.length; i++) {');
htp.p('                 if (document.all.allfacs.checked) {'); -- Checked
htp.p('                     parent.document.getElementById("btnSave").disabled = false;');
--if pPage = 'Submit' then
htp.p('                     if (po(i).childNodes(4).text =="Y" && po(i).childNodes(6).text =="Y"  && po(i).childNodes(9).text ==lcStatus && po(i).childNodes(11).text=='||to_char(pUser)||') {' );
htp.p('                         document.getElementById("whep_"+po(i).childNodes(0).text).checked=true;');
htp.p('                         checkCount++;');
htp.p('                     }');
-- for ms47 Grace modified
if  v_is_areareviewer != 'Y' and v_is_hqvalidator != 'Y' then
htp.p('                     if (po(i).childNodes(5).text =="Y" && po(i).childNodes(10).text ==lcStatus && po(i).childNodes(12).text=='||to_char(pUser)||') {' );
htp.p('                         document.getElementById("ms47_"+po(i).childNodes(0).text).checked=true;');
htp.p('                         checkCount++;');
htp.p('                     }');
end if;
--end for ms47
htp.p('                 }');
htp.p('                 else {'); -- Not checked
htp.p('                     parent.document.getElementById("btnSave").disabled = true;');
--htp.p('                   document.getElementById(po(i).childNodes(0).text+po(i).childNodes(1).text).checked=false;');
htp.p('                     if (po(i).childNodes(4).text =="Y" && po(i).childNodes(6).text =="Y" && po(i).childNodes(9).text ==lcStatus && po(i).childNodes(11).text=='||to_char(pUser)||') {' );
htp.p('                         document.getElementById("whep_"+po(i).childNodes(0).text).checked=false;');
htp.p('                     }');
-- for ms47 Grace modified
if  v_is_areareviewer != 'Y' and v_is_hqvalidator != 'Y' then
htp.p('                     if (po(i).childNodes(5).text =="Y" && po(i).childNodes(10).text ==lcStatus && po(i).childNodes(12).text=='||to_char(pUser)||') {' );
htp.p('                         document.getElementById("ms47_"+po(i).childNodes(0).text).checked=false;');
htp.p('                     }');
end if;
-- end for ms47
htp.p('                 }');
--htp.p('             }');
htp.p('     }');
htp.p(' }');
htp.p(' if (checkCount ==0) {');
htp.p('     parent.document.getElementById("btnSave").disabled = true;');
htp.p(' }');
htp.p('}');

htp.p('function toggleCheckboxes(pPage) {

    var iobj = window.iframefacs;
    var objxmlData=new ActiveXObject("microsoft.XMLDOM");
    objxmlData.async=false;
    objxmlData.load("emapp.em_staffing_package.staffing_get_xmlFacility_Data?pSite_id='||to_char(pSiteid)||'&tnFac_id='||to_char(tnFac_id)||'");
    if (objxmlData.parsed) {
        var po=objxmlData.getElementsByTagName("ROW");
        var numRows = po.length;
        for (var i = 0; i < numRows; i++) {
            if (po(i).childNodes(4).text == "Y" && po(i).childNodes(6).text == "Y") { // if whep_enabled and
                //  a default facility and the checkbox is checked, then submit the package


                // Note: po(i).childNodes(9).text is the whep package status
                if (pPage == "Submit"){
                   if (po(i).childNodes(9).text == "C") { //Enabling checkbox
                      document.getElementById("whep_"+po(i).childNodes(0).text).unselectable ="off";
                      document.getElementById("whep_"+po(i).childNodes(0).text).disabled = false;

                    }
                    else { // Disabling checkbox
                        document.getElementById("whep_"+po(i).childNodes(0).text).unselectable ="on";
                        document.getElementById("whep_"+po(i).childNodes(0).text).disabled = true;
                    }
                }
                if (pPage == "Approve"){
                   if(po(i).childNodes(9).text =="S") {  //Enabling checkbox
                       document.getElementById("whep_"+po(i).childNodes(0).text).unselectable ="off";
                       document.getElementById("whep_"+po(i).childNodes(0).text).disabled = false;
                   }
                   else { // Disabling checkbox
                        document.getElementById("whep_"+po(i).childNodes(0).text).unselectable ="on";
                        document.getElementById("whep_"+po(i).childNodes(0).text).disabled = true;
                   }
               }
            }');

-- for ms47 Grace modified
if  v_is_areareviewer != 'Y' and v_is_hqvalidator != 'Y' then
htp.p(' if (po(i).childNodes(5).text == "Y") { // if ms47_enabled and

                if (pPage == "Submit") {
                   if (po(i).childNodes(10).text == "C") {
                      document.getElementById("ms47_"+po(i).childNodes(0).text).unselectable ="off";
                      document.getElementById("ms47_"+po(i).childNodes(0).text).disabled = false;
                   }
                   else {
                       document.getElementById("ms47_"+po(i).childNodes(0).text).unselectable ="on";
                       document.getElementById("ms47_"+po(i).childNodes(0).text).disabled = true;
                   }
                }

                if (pPage == "Approve") {
                   if (po(i).childNodes(10).text =="S") {
                      document.getElementById("ms47_"+po(i).childNodes(0).text).unselectable ="off";
                      document.getElementById("ms47_"+po(i).childNodes(0).text).disabled = false;
                   }
                   else {
                       document.getElementById("ms47_"+po(i).childNodes(0).text).unselectable ="on";
                        document.getElementById("ms47_"+po(i).childNodes(0).text).disabled = true;
                    }
                }
            }');
end if;
-- end for ms47          
htp.p('        }
    }
}'
);


htp.p('</script>');


            htp.p('</head><body width="100%"><FORM NAME="staffingfacilities" METHOD="POST">');

--setting table parameters and column headings

           -- htp.p('<embed src="beep-07.wav" autostart="false" width="0" height="0" id="beep1" enablejavascript="true">');
            htp.p('<table width="900" frame="box" rules="cols" height="350" id="outertable"'||
            ' style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; '||
            'PADDING-TOP: 0px;font-size:11px;font-family:Arial" vAlign="bottom" class="controlrow" >');
            htp.p('<tr bgcolor="#000080">');
            htp.p('<th  colspan="7" style="text-align:left;border-bottom:ridge"><font face="Arial" size="5" color="#FFFFFF" ><b>All</b></font>&nbsp;<font face="Arial" color="#FFFFFF" size="1"> Packages (eWHEP and MS47)</font>');
            htp.p('<input type="checkbox" name="allfacs" value="selectFacs" id="allfacs" onclick="selectFields()" /></th></tr>');
            htp.p('<tr bgcolor="#000080"><td align="center" width="50px"><font color="white" style="font-weight:bolder">WHEP</font></td>');
            htp.p('<td align="center" width="50px"><font color="white" style="font-weight:bolder">MS47</font></td><td align="center" width="200px"><font color="white" style="font-weight:bolder"><center>FACILITY NAME</center></font></td>');
            htp.p('<td align="center"><font color="white" style="font-weight:bolder">WHEP PKG. STATUS</font></td>');
            HTP.P('<td align="center"><font color="white" style="font-weight:bolder">MS47 PKG. STATUS</font></td>');
            HTP.P('<td align="center" width="100px"><font color="white" style="font-weight:bolder">WHEP APPROVER&rsquo;S NAME</font></td>');
             HTP.P('<td align="center" width="100px"><font color="white" style="font-weight:bolder">MS47 APPROVER&rsquo;S NAME</font></td></tr>');
          --htp.p( '<tr style="color:#FFFFFF">');
            --htp.p('</tr>');
            --htp.p('<td vAlign=top>');
            --htp.p('<table id="firstColumn" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px" vAlign=bottom class="controlrow" style="font-size:11px;font-family:Arial" width="100%" bgcolor="#FFFFFF">');

--Filling the actual columns of the table with data.

            for i in facilities loop
                recnum := recnum + 1;
               -- if recnum <= trunc(reccount/2) then
--                    htp.p('<tr bgcolor="#FFFFFF" style="border-top:none; border-bottom:none">');
                   htp.p('<tr bgcolor="silver" style="border-bottom-style:ridge">');


                    if i.whep_enable = 'Y' AND i.default_facility = 'Y' then
                         select trim(d.first_name)||' '||trim(d.middle_name)||' '||trim(d.last_name), d.user_id
                        into v_Whep_Approver_Name, v_Whep_Approver_Id
                        from emdba.em_user_t d
                        where d.user_id in (select a.approval_user_id from emdba.em_staffing_pkg_status_t a where
                        a.site_id = pSiteid and a.whep_fac_id = i.whep_fac_id and a.package_type = 'EWHEP' and a.active_flag = 'A');

                        select whep_approver
                        into v_Whep_Approver_Priv
                        from emdba.em_user_t
                        where user_id = pUser;
                        
                        --Displaying the checkbox for the WHEP boxes
                        -- The checkbox should be disabled if the Package Status is 'C' for working and the page is 'Submit'
                        
                        htp.p('<td align="center" width="50px"><input type="checkbox" id="whep_'||to_char(i.whep_fac_id)||'" name="whep_'||to_char(i.whep_fac_id)
                            ||'" value="whep_'||to_char(i.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                            ||emapp.iif((staffing_is_facility_status(pSiteid, i.whep_fac_id,'C','EWHEP') and pPage='Submit')
                            or ((staffing_is_facility_status(pSiteid, i.whep_fac_id,'S','EWHEP')  and (v_Whep_Approver_Id = pUser  or v_WHEP_Approver_Priv = 'R' )) and pPage = 'Approve')  
                            or  ((staffing_is_facility_status(pSiteid, i.whep_fac_id,'ARA','EWHEP')  and (v_Whep_Approver_Id = pUser  or v_WHEP_Approver_Priv = 'V' )) and pPage = 'Approve') 
                            or  ((staffing_is_facility_status(pSiteid, i.whep_fac_id,'VA','EWHEP')  and (v_Whep_Approver_Id = pUser  or v_WHEP_Approver_Priv = 'S'  or v_WHEP_Approver_Priv = 'Y')) and pPage = 'Approve'),
                            '',' unselectable="on" disabled ')||' /></td>');

                    ELSE
                        HTP.P('<td align="center" width="50px">&nbsp;</td>');
                    end if;
                    -- Grace modified on 07/12/2013 for area reviewer and hq validator, they have nothing to do with MS47 packages
                    if i.ms47_enable = 'Y' and v_is_areareviewer != 'Y' and v_is_hqvalidator != 'Y' THEN
                        select trim(d.first_name)||' '||trim(d.middle_name)||' '||trim(d.last_name), d.user_id
                        into v_MS47_Approver_Name, v_MS47_Approver_Id
                        from emdba.em_user_t d
                        where d.user_id in (select a.approval_user_id from emdba.em_staffing_pkg_status_t a where
                        a.site_id = pSiteid and a.whep_fac_id = i.whep_fac_id and a.package_type = 'MS47' and a.active_flag = 'A');


                        select MS47_approver
                        into v_MS47_Approver_Priv
                        from emdba.em_user_t
                        where user_id = pUser;

                        --Displaying the checkbox for the MS47 boxes
                        -- The checkbox should be disabled if the Package Status is 'C' for working and the page is 'Submit'

                       htp.p('<td align="center" width="50px"><input type="checkbox" id="ms47_'||to_char(i.whep_fac_id)||'" name="ms47_'||to_char(i.whep_fac_id)
                            ||'" value="ms47_'||to_char(i.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                            ||emapp.iif((staffing_is_facility_status(pSiteid, i.whep_fac_id,'C','MS47') and pPage='Submit')
                            or ((staffing_is_facility_status(pSiteid, i.whep_fac_id,'S','MS47') and (v_MS47_Approver_Id = pUser or v_MS47_Approver_Priv = 'R')) and pPage = 'Approve'),'', ' unselectable="on" disabled ')||' /></td>');

                    ELSE
                        HTP.P('<td align="center" width="50px">&nbsp;</td>');
                    end if;

                    htp.p('<td width="200px">'||i.facility_name||'</td>');
--displaying the whep package status column
--(this column is only filled if the facility is WHEP-enabled and it is a "default" facility.)
                    if i.whep_enable = 'Y' AND i.default_facility = 'Y' then
                        --Grace Xu modified on 06/03/2013
                        if i.whep_package_status = 'C' then
                            v_Whep_Package_Status := '<font color="white" style="font-weight:bolder">WORKING</font>';
                        elsif i.whep_package_status = 'S' then
                            v_Whep_Package_Status := '<font color="yellow" style="font-weight:bolder">SUBMITTED</font>';
                        elsif i.whep_package_Status = 'R' then
                            v_Whep_Package_Status := '<font color="red" style="font-weight:bolder">RETURNED</font>';
                        elsif i.whep_package_Status = 'A' then
                            v_Whep_Package_Status := '<font color="green" style="font-weight:bolder">APPROVED</font>';
                        elsif i.whep_package_Status = 'ARR' then
                            v_Whep_Package_Status := '<font color="red" style="font-weight:bolder">AREA REVIEWER RETURNED</font>';
                        elsif i.whep_package_Status = 'ARA' then
                            v_Whep_Package_Status := '<font color="green" style="font-weight:bolder">AREA REVIEWER REVIEWED</font>';
                        elsif i.whep_package_Status = 'VR' then
                            v_Whep_Package_Status := '<font color="red" style="font-weight:bolder">HQ VALIDATOR RETURNED</font>';
                        elsif i.whep_package_Status = 'VA' then
                            v_Whep_Package_Status := '<font color="green" style="font-weight:bolder">HQ VALIDATOR VALIDATED</font>';
                        end if;
                       htp.p('<td align="center" width="100px">'||v_Whep_Package_Status||'</td>');


                    else
                        HTP.P('<td align="center" width="100px">&nbsp;</td>');
                        v_Whep_Approver_Name :=' ';
                    end if;

 --displaying the ms47 package status column (this column is only filled if the facility is MS47-enabled.)
                   if i.ms47_enable = 'Y' then
                        if i.ms47_package_status = 'C' then
                            v_MS47_Package_Status := '<font color="white" style="font-weight:bolder">WORKING</font>';
                        elsif i.ms47_package_status = 'S' then
                            v_MS47_Package_Status := '<font color="yellow" style="font-weight:bolder">SUBMITTED</font>';
                        elsif i.ms47_package_Status = 'R' then
                            v_MS47_Package_Status := '<font color="red" style="font-weight:bolder">RETURNED</font>';
                        elsif i.ms47_package_Status = 'A' then
                            v_MS47_Package_Status := '<font color="green" style="font-weight:bolder">APPROVED</font>';
                        end if;

                        htp.p('<td align="center" width="100px">'||v_MS47_Package_Status||'</td>');
                    else
                        v_MS47_Approver_Name :=' ';
                        HTP.P('<td align="center" width="100px">&nbsp;</td>');
                    end if;






                        HTP.P('<td align="center" width="100px">'||v_Whep_Approver_Name||'</td>'); --WHEP Approver's name

                       HTP.P('<td align="center" width="100px">'||v_MS47_Approver_Name||'</td>'); --MS47Approver's name


                    recnum2 := 0;

                   /* for j in (select c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                          c.whep_enable, c.ms47_enable, decode(c.whep_fac_id,c.default_whep_fac_id,'Y','N') as default_facility
                          from emdba.em_subsite_facility_t c
                          where c.site_id = pSiteid
                          and (c.whep_enable = 'Y' or c.ms47_enable = 'Y')
                          order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name) loop
                          recnum2 := recnum2 + 1;
                          if recnum2 = recnum + trunc(reccount/2) then
                            if j.whep_enable='Y' AND j.default_facility = 'Y' then

                                htp.p('<td align="center"><input type="checkbox" id="whep_'||to_char(j.whep_fac_id)||'" name="whep_'||to_char(j.whep_fac_id)
                                    ||'" value="whep_'||to_char(j.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                                    ||emapp.iif(staffing_is_facility_status(pSiteid, j.whep_fac_id,'S','EWHEP'),' unselectable="on" disabled ','')||' /></td>');

                            ELSE
                                HTP.P('<td>&nbsp;</td>');
                            end if;

                            if j.ms47_enable = 'Y' THEN
                               htp.p('<td align="center"><input type="checkbox" id="ms47_'||to_char(j.whep_fac_id)||'" name="ms47_'||to_char(j.whep_fac_id)
                                    ||'" value="ms47_'||to_char(j.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                                    ||emapp.iif(staffing_is_facility_status(pSiteid, j.whep_fac_id,'S','MS47'), ' unselectable="on" disabled ','')||' /></td>');

                            ELSE
                                HTP.P('<td  align="center">&nbsp;</td>');
                            end if;

                            htp.p('<td>'||j.facility_name||'</td>');
                        end if;
                    end loop;
                    htp.p('</tr>');
                end if;
            end loop;

            if whep.whep_r_pkg.whep_is_odd(reccount) then
                recnum := 0;
                for i in (select c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                          c.whep_enable, c.ms47_enable, decode(c.whep_fac_id,c.default_whep_fac_id,'Y','N') as default_facility
                          from emdba.em_subsite_facility_t c
                          where c.site_id = pSiteid
                          and (c.whep_enable = 'Y' or c.ms47_enable = 'Y')
                          order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name) loop
                    recnum := recnum + 1;
                    if recnum = reccount then
                        htp.p('<tr bgcolor="#000080" style="border-top-style:ridge;border-bottom-style:ridge">');
                        htp.p('<td colspan="6" >');
                        htp.p('<table width = "898" class="controlrow" bgcolor ="#000080" >');

                    htp.p('<tr bgcolor="#000080" style="border-top-style:ridge;border-bottom-style:ridge">');
                    htp.p('<td style="width:275">&nbsp;</td>');

                    if i.whep_enable = 'Y' AND i.default_facility = 'Y' then

                        htp.p('<td align="center"  style="border-left-style:ridge;border-right-style:ridge;width=50px"><center><input type="checkbox" id="whep_'||to_char(i.whep_fac_id)||'" name="whep_'||to_char(i.whep_fac_id)
                            ||'" value="whep_'||to_char(i.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                            ||emapp.iif(staffing_is_facility_status(pSiteid, i.whep_fac_id,'S','EWHEP'),' unselectable="on" disabled ','')||' /></center></td>');

                    ELSE
                        HTP.P('<td align="center"  style="border-left-style:ridge;border-right-style:ridge;width=50px">&nbsp;</td>');
                    end if;

                    if i.ms47_enable = 'Y' THEN
                       htp.p('<td align="center"  style="border-right-style:ridge;width=50px"><input type="checkbox" id="ms47_'||to_char(i.whep_fac_id)||'" name="ms47_'||to_char(i.whep_fac_id)
                            ||'" value="ms47_'||to_char(i.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                            ||emapp.iif(staffing_is_facility_status(pSiteid, i.whep_fac_id,'S','MS47'), ' unselectable="on" disabled ','')||' /></td>');

                    ELSE
                        HTP.P('<td align="center"  style="border-right-style:ridge;width=50px">&nbsp;</td>');
                    end if;

                    htp.p('<td><font color="white" face="Arial" size="-1">'||i.facility_name||'</font></td>');
                        /*htp.p('<td colspan="2"style="border-top-style:ridge"><center><input type="checkbox" id="'||LOWER(trim(i.acronym))||trim(i.acronym_fk)||'" name="'||lower(trim(i.acronym))||trim(i.acronym_fk)
                        ||'" value="'||i.acronym_fk||'" onclick="" '
                        ||emapp.iif(whep_is_acronym_in_site(pSiteid, tnFac_id, i.acronym_fk),'', ' unselectable="on" disabled ')||' />'
                        ||emapp.iif(whep_is_acronym_in_site(pSiteid, tnFac_id, i.acronym_fk),'<font color="#FFFFFF">', ' <font color="#ACACAC">')
                        ||initcap(whep.whep_replace_chars(i.acronym_desc))||' ('||i.acronym||'_'||i.class_code||')'||
                        ' </font> '||'</center></td>');*/

                      /*  htp.p('</td></tr></table></tr>');
                    end if;*/
                end loop;
            --end if;

            htp.p('</table></form></body></html>');
        end; --Staffing_facility_sel


  procedure staffing_facility_sel_old(pSiteid in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPage in varchar2 default 'Submit',
                            pUser in emdba.em_user_t.user_id%type)


        is


        --This cursor is the data for the grid on the Package Approval/Submission module on
        --the "Staffing Menu"  It queries emdba.em_subsite_facility for 4 of the columns
        --and simultaneously queries the package status from emdba.em_staffing_package_status_t.
        --Note: only the whep_enabled default facilities(facilities in which the default_whep_fac_id
        --matches the whep_fac_id) have whep package statuses.

        cursor facilities is
 select c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                 c.whep_enable, c.ms47_enable, decode(c.whep_fac_id,c.default_whep_fac_id,'Y','N') as default_facility,
                 decode(c.whep_enable,'Y',decode(c.whep_fac_id,c.default_whep_fac_id,(select a.package_status from emdba.em_staffing_pkg_status_t a where
                 a.site_id = c.site_id and a.whep_fac_id = c.whep_fac_id and a.package_type = 'EWHEP' AND A.active_flag = 'A'),NULL)) AS WHEP_PACKAGE_STATUS,
            /*     decode(c.whep_enable,'Y', decode(c.whep_fac_id, c.default_whep_fac_id, (select trim(d.first_name)||' '||trim(d.middle_name)||' '||trim(d.last_name) from
                 emdba.em_user_t d where d.user_id in (select a.approval_user_id from emdba.em_staffing_pkg_status_t a where
                 a.site_id = c.site_id and a.whep_fac_id = c.whep_fac_id and a.package_type = 'EWHEP' and a.active_flag = 'A')), '&nbsp;'), '&nbsp;') as whep_approver,
                 decode(c.MS47_enable,'Y', (select trim(d.first_name)||' '||trim(d.middle_name)||' '||trim(d.last_name) from
                 emdba.em_user_t d where d.user_id in (select a.approval_user_id from emdba.em_staffing_pkg_status_t a where
                 a.site_id = c.site_id and a.whep_fac_id = c.whep_fac_id and a.package_type = 'MS47' and a.active_flag = 'A')), '&nbsp;') as ms47_approver,*/
                 decode(c.MS47_enable,'Y',(select a.package_status from emdba.em_staffing_pkg_status_t a where
                 a.site_id = c.site_id and a.whep_fac_id = c.whep_fac_id and a.package_type = 'MS47' AND A.active_flag = 'A'),NULL) AS MS47_PACKAGE_STATUS
                    from emdba.em_subsite_facility_t c
                    where c.site_id = pSiteid
                    and (c.whep_enable = 'Y' or c.ms47_enable = 'Y')
                    order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name;

        /*  select c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                 c.whep_enable, c.ms47_enable, decode(c.whep_fac_id,c.default_whep_fac_id,'Y','N') as default_facility
                    from emdba.em_subsite_facility_t c
                    where c.site_id = pSiteid
                    and (c.whep_enable = 'Y' or c.ms47_enable = 'Y')
                    order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name;*/








  --         cursor current_returned is




        reccount            INTEGER(4):=0;
        recnum              integer(4):=0;
        recnum2             integer(4):=0;
        v_Whep_Package_Status   varchar2(100):='';
        v_MS47_Package_Status   varchar2(100):='';
        v_Whep_Approver_Name    varchar2(100):='';
        v_MS47_Approver_Name    varchar2(100):='';
        v_Whep_Approver_Id      integer(8):=0;
        v_MS47_Approver_Id      integer(8):=0;
        v_Whep_Approver_Priv    varchar2(1);
        v_MS47_Approver_Priv    varchar2(1);


        begin
            select count(*)
            INTO RECCOUNT
            from (select a.facility_name, a.whep_fac_id, a.default_whep_fac_id
            from emdba.em_subsite_facility_t a
            where a.site_id = pSiteid
            --and a.whep_fac_id = tnFac_id
            and (a.whep_enable = 'Y' or a.ms47_enable = 'Y')
           --group by a.acronym, a.class_code, a.acronym_fk, b.acronym_desc
            order by decode(a.subsite_default_yn,'Y','A','B'),a.facility_name);




             htp.p('<html>');

             htp.p('<head>');
htp.p('<script language="Javascript">');



htp.p('function checkBox_onClick(cValue) { ');
htp.p(' var objGridData = new ActiveXObject("microsoft.XMLDOM");');
htp.p('var checkCount = 0');
htp.p('if (document.getElementById(cValue).checked) {');
htp.p(' parent.document.getElementById("btnSave").disabled = false;');
htp.p('}');
htp.p('else {');
htp.p(' objGridData.async=false;');
htp.p(' objGridData.load("emapp.em_staffing_package.staffing_get_xmlFacility_Data?pSite_id='||to_char(pSiteid)||'&tnFac_id='||to_char(tnFac_id)||'");');
--htp.p('   "&pInSite=Y");');
htp.p(' if (objGridData.parsed) {');
htp.p('     var po=objGridData.getElementsByTagName("ROW");');
htp.p('     var numRows = po.length;');

htp.p('     for (var i = 0; i < po.length; i++) {');

htp.p('                     if (po(i).childNodes(4).text =="Y" && po(i).childNodes(6).text =="Y"  ) {' );
htp.p('                         if (document.getElementById("whep_"+po(i).childNodes(0).text).checked==true) {');
htp.p('                             checkCount++;');
htp.p('                         }');
htp.p('                     }');
htp.p('                     if (po(i).childNodes(5).text =="Y"  ) {' );
htp.p('                         if (document.getElementById("ms47_"+po(i).childNodes(0).text).checked==true) {');
htp.p('                             checkCount++;');
htp.p('                         }');
htp.p('                     }');
htp.p('     }');
htp.p(' }');
htp.p(' if (checkCount ==0) {');
htp.p('     parent.document.getElementById("btnSave").disabled = true;');
htp.p(' }');
htp.p('}');
--htp.p('facilitiesOption = facilitiesOption+cValue+"|";');
htp.p('}');

htp.p('function selectFields() {');
htp.p('if (parent.document.all.radAppSel(0).checked==true) {');
htp.p(' var lcStatus = "C";');
htp.p('}');
htp.p('if (parent.document.all.radAppSel(1).checked==true) {');
htp.p(' var lcStatus = "S";');
htp.p('}');
htp.p('var checkCount = 0;');
htp.p(' var objGridData = new ActiveXObject("microsoft.XMLDOM");');
htp.p(' objGridData.async=false;');
htp.p(' objGridData.load("emapp.em_staffing_package.staffing_get_xmlFacility_Data?pSite_id='||to_char(pSiteid)||'&tnFac_id='||to_char(tnFac_id)||'");');
--htp.p('   "&pInSite=Y");');
htp.p(' if (objGridData.parsed) {');
htp.p('     var po=objGridData.getElementsByTagName("ROW");');
htp.p('     var numRows = po.length;');

htp.p('     for (var i = 0; i < po.length; i++) {');
htp.p('                 if (document.all.allfacs.checked) {'); -- Checked
htp.p('                     parent.document.getElementById("btnSave").disabled = false;');
--if pPage = 'Submit' then
htp.p('                     if (po(i).childNodes(4).text =="Y" && po(i).childNodes(6).text =="Y"  && po(i).childNodes(9).text ==lcStatus && po(i).childNodes(11).text=='||to_char(pUser)||') {' );
htp.p('                         document.getElementById("whep_"+po(i).childNodes(0).text).checked=true;');
htp.p('                         checkCount++;');
htp.p('                     }');
htp.p('                     if (po(i).childNodes(5).text =="Y" && po(i).childNodes(10).text ==lcStatus && po(i).childNodes(12).text=='||to_char(pUser)||') {' );
htp.p('                         document.getElementById("ms47_"+po(i).childNodes(0).text).checked=true;');
htp.p('                         checkCount++;');
htp.p('                     }');
htp.p('                 }');
htp.p('                 else {'); -- Not checked
htp.p('                     parent.document.getElementById("btnSave").disabled = true;');
--htp.p('                   document.getElementById(po(i).childNodes(0).text+po(i).childNodes(1).text).checked=false;');
htp.p('                     if (po(i).childNodes(4).text =="Y" && po(i).childNodes(6).text =="Y" && po(i).childNodes(9).text ==lcStatus && po(i).childNodes(11).text=='||to_char(pUser)||') {' );
htp.p('                         document.getElementById("whep_"+po(i).childNodes(0).text).checked=false;');
htp.p('                     }');
htp.p('                     if (po(i).childNodes(5).text =="Y" && po(i).childNodes(10).text ==lcStatus && po(i).childNodes(12).text=='||to_char(pUser)||') {' );
htp.p('                         document.getElementById("ms47_"+po(i).childNodes(0).text).checked=false;');
htp.p('                     }');
htp.p('                 }');
--htp.p('             }');
htp.p('     }');
htp.p(' }');
htp.p(' if (checkCount ==0) {');
htp.p('     parent.document.getElementById("btnSave").disabled = true;');
htp.p(' }');
htp.p('}');

htp.p('function toggleCheckboxes(pPage) {

    var iobj = window.iframefacs;
    var objxmlData=new ActiveXObject("microsoft.XMLDOM");
    objxmlData.async=false;
    objxmlData.load("emapp.em_staffing_package.staffing_get_xmlFacility_Data?pSite_id='||to_char(pSiteid)||'&tnFac_id='||to_char(tnFac_id)||'");
    if (objxmlData.parsed) {
        var po=objxmlData.getElementsByTagName("ROW");
        var numRows = po.length;
        for (var i = 0; i < numRows; i++) {
            if (po(i).childNodes(4).text == "Y" && po(i).childNodes(6).text == "Y") { // if whep_enabled and
                //  a default facility and the checkbox is checked, then submit the package


                // Note: po(i).childNodes(9).text is the whep package status
                if (pPage == "Submit"){
                   if (po(i).childNodes(9).text == "C") { //Enabling checkbox
                      document.getElementById("whep_"+po(i).childNodes(0).text).unselectable ="off";
                      document.getElementById("whep_"+po(i).childNodes(0).text).disabled = false;

                    }
                    else { // Disabling checkbox
                        document.getElementById("whep_"+po(i).childNodes(0).text).unselectable ="on";
                        document.getElementById("whep_"+po(i).childNodes(0).text).disabled = true;
                    }
                }
                if (pPage == "Approve"){
                   if(po(i).childNodes(9).text =="S") {  //Enabling checkbox
                       document.getElementById("whep_"+po(i).childNodes(0).text).unselectable ="off";
                       document.getElementById("whep_"+po(i).childNodes(0).text).disabled = false;
                   }
                   else { // Disabling checkbox
                        document.getElementById("whep_"+po(i).childNodes(0).text).unselectable ="on";
                        document.getElementById("whep_"+po(i).childNodes(0).text).disabled = true;
                   }
               }
            }

            if (po(i).childNodes(5).text == "Y") { // if ms47_enabled and

                if (pPage == "Submit") {
                   if (po(i).childNodes(10).text == "C") {
                      document.getElementById("ms47_"+po(i).childNodes(0).text).unselectable ="off";
                      document.getElementById("ms47_"+po(i).childNodes(0).text).disabled = false;
                   }
                   else {
                       document.getElementById("ms47_"+po(i).childNodes(0).text).unselectable ="on";
                       document.getElementById("ms47_"+po(i).childNodes(0).text).disabled = true;
                   }
                }

                if (pPage == "Approve") {
                   if (po(i).childNodes(10).text =="S") {
                      document.getElementById("ms47_"+po(i).childNodes(0).text).unselectable ="off";
                      document.getElementById("ms47_"+po(i).childNodes(0).text).disabled = false;
                   }
                   else {
                       document.getElementById("ms47_"+po(i).childNodes(0).text).unselectable ="on";
                        document.getElementById("ms47_"+po(i).childNodes(0).text).disabled = true;
                    }
                }
            }
        }
    }
}'
);


htp.p('</script>');


            htp.p('</head><body width="100%"><FORM NAME="staffingfacilities" METHOD="POST">');

--setting table parameters and column headings

           -- htp.p('<embed src="beep-07.wav" autostart="false" width="0" height="0" id="beep1" enablejavascript="true">');
            htp.p('<table width="900" frame="box" rules="cols" height="350" id="outertable"'||
            ' style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; '||
            'PADDING-TOP: 0px;font-size:11px;font-family:Arial" vAlign="bottom" class="controlrow" >');
            htp.p('<tr bgcolor="#000080">');
            htp.p('<th  colspan="7" style="text-align:left;border-bottom:ridge"><font face="Arial" size="5" color="#FFFFFF" ><b>All</b></font>&nbsp;<font face="Arial" color="#FFFFFF" size="1"> Packages (eWHEP and MS47)</font>');
            htp.p('<input type="checkbox" name="allfacs" value="selectFacs" id="allfacs" onclick="selectFields()" /></th></tr>');
            htp.p('<tr bgcolor="#000080"><td align="center" width="50px"><font color="white" style="font-weight:bolder">WHEP</font></td>');
            htp.p('<td align="center" width="50px"><font color="white" style="font-weight:bolder">MS47</font></td><td align="center" width="200px"><font color="white" style="font-weight:bolder"><center>FACILITY NAME</center></font></td>');
            htp.p('<td align="center"><font color="white" style="font-weight:bolder">WHEP PKG. STATUS</font></td>');
            HTP.P('<td align="center"><font color="white" style="font-weight:bolder">MS47 PKG. STATUS</font></td>');
            HTP.P('<td align="center" width="100px"><font color="white" style="font-weight:bolder">WHEP APPROVER&rsquo;S NAME</font></td>');
             HTP.P('<td align="center" width="100px"><font color="white" style="font-weight:bolder">MS47 APPROVER&rsquo;S NAME</font></td></tr>');
          --htp.p( '<tr style="color:#FFFFFF">');
            --htp.p('</tr>');
            --htp.p('<td vAlign=top>');
            --htp.p('<table id="firstColumn" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px" vAlign=bottom class="controlrow" style="font-size:11px;font-family:Arial" width="100%" bgcolor="#FFFFFF">');

--Filling the actual columns of the table with data.

            for i in facilities loop
                recnum := recnum + 1;
               -- if recnum <= trunc(reccount/2) then
--                    htp.p('<tr bgcolor="#FFFFFF" style="border-top:none; border-bottom:none">');
                   htp.p('<tr bgcolor="silver" style="border-bottom-style:ridge">');


                    if i.whep_enable = 'Y' AND i.default_facility = 'Y' then
                         select trim(d.first_name)||' '||trim(d.middle_name)||' '||trim(d.last_name), d.user_id
                        into v_Whep_Approver_Name, v_Whep_Approver_Id
                        from emdba.em_user_t d
                        where d.user_id in (select a.approval_user_id from emdba.em_staffing_pkg_status_t a where
                        a.site_id = pSiteid and a.whep_fac_id = i.whep_fac_id and a.package_type = 'EWHEP' and a.active_flag = 'A');

                        select whep_approver
                        into v_Whep_Approver_Priv
                        from emdba.em_user_t
                        where user_id = pUser;

                        htp.p('<td align="center" width="50px"><input type="checkbox" id="whep_'||to_char(i.whep_fac_id)||'" name="whep_'||to_char(i.whep_fac_id)
                            ||'" value="whep_'||to_char(i.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                            ||emapp.iif((staffing_is_facility_status(pSiteid, i.whep_fac_id,'C','EWHEP') and pPage='Submit')
                            or ((staffing_is_facility_status(pSiteid, i.whep_fac_id,'S','EWHEP')  and (v_Whep_Approver_Id = pUser  or v_WHEP_Approver_Priv = 'R')) and pPage = 'Approve')  ,'',' unselectable="on" disabled ')||' /></td>');

                    ELSE
                        HTP.P('<td align="center" width="50px">&nbsp;</td>');
                    end if;

                    if i.ms47_enable = 'Y' THEN
                        select trim(d.first_name)||' '||trim(d.middle_name)||' '||trim(d.last_name), d.user_id
                        into v_MS47_Approver_Name, v_MS47_Approver_Id
                        from emdba.em_user_t d
                        where d.user_id in (select a.approval_user_id from emdba.em_staffing_pkg_status_t a where
                        a.site_id = pSiteid and a.whep_fac_id = i.whep_fac_id and a.package_type = 'MS47' and a.active_flag = 'A');


                        select MS47_approver
                        into v_MS47_Approver_Priv
                        from emdba.em_user_t
                        where user_id = pUser;

                        --Displaying the checkbox for the MS47 boxes
                        -- The checkbox should be disabled if the Package Status is 'C' for working and the page is 'Submit'

                       htp.p('<td align="center" width="50px"><input type="checkbox" id="ms47_'||to_char(i.whep_fac_id)||'" name="ms47_'||to_char(i.whep_fac_id)
                            ||'" value="ms47_'||to_char(i.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                            ||emapp.iif((staffing_is_facility_status(pSiteid, i.whep_fac_id,'C','MS47') and pPage='Submit')
                            or ((staffing_is_facility_status(pSiteid, i.whep_fac_id,'S','MS47') and (v_MS47_Approver_Id = pUser or v_MS47_Approver_Priv = 'R')) and pPage = 'Approve'),'', ' unselectable="on" disabled ')||' /></td>');

                    ELSE
                        HTP.P('<td align="center" width="50px">&nbsp;</td>');
                    end if;

                    htp.p('<td width="200px">'||i.facility_name||'</td>');
--displaying the whep package status column
--(this column is only filled if the facility is WHEP-enabled and it is a "default" facility.)
                    if i.whep_enable = 'Y' AND i.default_facility = 'Y' then

                        if i.whep_package_status = 'C' then
                            v_Whep_Package_Status := '<font color="white" style="font-weight:bolder">WORKING</font>';
                        elsif i.whep_package_status = 'S' then
                            v_Whep_Package_Status := '<font color="yellow" style="font-weight:bolder">SUBMITTED</font>';
                        elsif i.whep_package_Status = 'R' then
                            v_Whep_Package_Status := '<font color="red" style="font-weight:bolder">RETURNED</font>';
                        else
                            v_Whep_Package_Status := '<font color="green" style="font-weight:bolder">APPROVED</font>';
                        end if;
                       htp.p('<td align="center" width="100px">'||v_Whep_Package_Status||'</td>');


                    else
                        HTP.P('<td align="center" width="100px">&nbsp;</td>');
                        v_Whep_Approver_Name :=' ';
                    end if;

 --displaying the ms47 package status column (this column is only filled if the facility is MS47-enabled.)
                   if i.ms47_enable = 'Y' then

                        if i.ms47_package_status = 'C' then
                            v_MS47_Package_Status := '<font color="white" style="font-weight:bolder">WORKING</font>';
                        elsif i.ms47_package_status = 'S' then
                            v_MS47_Package_Status := '<font color="yellow" style="font-weight:bolder">SUBMITTED</font>';
                        elsif i.ms47_package_Status = 'R' then
                            v_MS47_Package_Status := '<font color="red" style="font-weight:bolder">RETURNED</font>';
                        else
                            v_MS47_Package_Status := '<font color="green" style="font-weight:bolder">APPROVED</font>';
                        end if;

                        htp.p('<td align="center" width="100px">'||v_MS47_Package_Status||'</td>');
                    else
                        v_MS47_Approver_Name :=' ';
                        HTP.P('<td align="center" width="100px">&nbsp;</td>');
                    end if;






                        HTP.P('<td align="center" width="100px">'||v_Whep_Approver_Name||'</td>'); --WHEP Approver's name

                       HTP.P('<td align="center" width="100px">'||v_MS47_Approver_Name||'</td>'); --MS47Approver's name


                    recnum2 := 0;

                   /* for j in (select c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                          c.whep_enable, c.ms47_enable, decode(c.whep_fac_id,c.default_whep_fac_id,'Y','N') as default_facility
                          from emdba.em_subsite_facility_t c
                          where c.site_id = pSiteid
                          and (c.whep_enable = 'Y' or c.ms47_enable = 'Y')
                          order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name) loop
                          recnum2 := recnum2 + 1;
                          if recnum2 = recnum + trunc(reccount/2) then
                            if j.whep_enable='Y' AND j.default_facility = 'Y' then

                                htp.p('<td align="center"><input type="checkbox" id="whep_'||to_char(j.whep_fac_id)||'" name="whep_'||to_char(j.whep_fac_id)
                                    ||'" value="whep_'||to_char(j.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                                    ||emapp.iif(staffing_is_facility_status(pSiteid, j.whep_fac_id,'S','EWHEP'),' unselectable="on" disabled ','')||' /></td>');

                            ELSE
                                HTP.P('<td>&nbsp;</td>');
                            end if;

                            if j.ms47_enable = 'Y' THEN
                               htp.p('<td align="center"><input type="checkbox" id="ms47_'||to_char(j.whep_fac_id)||'" name="ms47_'||to_char(j.whep_fac_id)
                                    ||'" value="ms47_'||to_char(j.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                                    ||emapp.iif(staffing_is_facility_status(pSiteid, j.whep_fac_id,'S','MS47'), ' unselectable="on" disabled ','')||' /></td>');

                            ELSE
                                HTP.P('<td  align="center">&nbsp;</td>');
                            end if;

                            htp.p('<td>'||j.facility_name||'</td>');
                        end if;
                    end loop;
                    htp.p('</tr>');
                end if;
            end loop;

            if whep.whep_r_pkg.whep_is_odd(reccount) then
                recnum := 0;
                for i in (select c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                          c.whep_enable, c.ms47_enable, decode(c.whep_fac_id,c.default_whep_fac_id,'Y','N') as default_facility
                          from emdba.em_subsite_facility_t c
                          where c.site_id = pSiteid
                          and (c.whep_enable = 'Y' or c.ms47_enable = 'Y')
                          order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name) loop
                    recnum := recnum + 1;
                    if recnum = reccount then
                        htp.p('<tr bgcolor="#000080" style="border-top-style:ridge;border-bottom-style:ridge">');
                        htp.p('<td colspan="6" >');
                        htp.p('<table width = "898" class="controlrow" bgcolor ="#000080" >');

                    htp.p('<tr bgcolor="#000080" style="border-top-style:ridge;border-bottom-style:ridge">');
                    htp.p('<td style="width:275">&nbsp;</td>');

                    if i.whep_enable = 'Y' AND i.default_facility = 'Y' then

                        htp.p('<td align="center"  style="border-left-style:ridge;border-right-style:ridge;width=50px"><center><input type="checkbox" id="whep_'||to_char(i.whep_fac_id)||'" name="whep_'||to_char(i.whep_fac_id)
                            ||'" value="whep_'||to_char(i.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                            ||emapp.iif(staffing_is_facility_status(pSiteid, i.whep_fac_id,'S','EWHEP'),' unselectable="on" disabled ','')||' /></center></td>');

                    ELSE
                        HTP.P('<td align="center"  style="border-left-style:ridge;border-right-style:ridge;width=50px">&nbsp;</td>');
                    end if;

                    if i.ms47_enable = 'Y' THEN
                       htp.p('<td align="center"  style="border-right-style:ridge;width=50px"><input type="checkbox" id="ms47_'||to_char(i.whep_fac_id)||'" name="ms47_'||to_char(i.whep_fac_id)
                            ||'" value="ms47_'||to_char(i.whep_fac_id)||'" onclick="checkBox_onClick(this.id)" '
                            ||emapp.iif(staffing_is_facility_status(pSiteid, i.whep_fac_id,'S','MS47'), ' unselectable="on" disabled ','')||' /></td>');

                    ELSE
                        HTP.P('<td align="center"  style="border-right-style:ridge;width=50px">&nbsp;</td>');
                    end if;

                    htp.p('<td><font color="white" face="Arial" size="-1">'||i.facility_name||'</font></td>');
                        /*htp.p('<td colspan="2"style="border-top-style:ridge"><center><input type="checkbox" id="'||LOWER(trim(i.acronym))||trim(i.acronym_fk)||'" name="'||lower(trim(i.acronym))||trim(i.acronym_fk)
                        ||'" value="'||i.acronym_fk||'" onclick="" '
                        ||emapp.iif(whep_is_acronym_in_site(pSiteid, tnFac_id, i.acronym_fk),'', ' unselectable="on" disabled ')||' />'
                        ||emapp.iif(whep_is_acronym_in_site(pSiteid, tnFac_id, i.acronym_fk),'<font color="#FFFFFF">', ' <font color="#ACACAC">')
                        ||initcap(whep.whep_replace_chars(i.acronym_desc))||' ('||i.acronym||'_'||i.class_code||')'||
                        ' </font> '||'</center></td>');*/

                      /*  htp.p('</td></tr></table></tr>');
                    end if;*/
                end loop;
            --end if;

            htp.p('</table></form></body></html>');
        end; --Staffing_facility_sel



    procedure staffing_get_xmlFacility_Data(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type)
                            /*pACTION  in varchar2 default 'S',
                            pPackage_Type in varchar2 default 'MS47')*/
              is

          cursor facilitydata is
          select c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                 c.whep_enable, c.ms47_enable, decode(c.whep_fac_id,c.default_whep_fac_id,'Y','N') as default_facility,
                 nvl((select a.package_ID from emdba.em_staffing_pkg_status_t a where a.site_id = pSite_id
                             and a.whep_fac_id = c.whep_fac_id and a.active_flag = 'A' and a.package_type = 'EWHEP'),0) AS WHEP_PKG_ID,
                 nvl((select B.package_ID from emdba.em_staffing_pkg_status_t B where B.site_id = pSite_id
                 and B.whep_fac_id = c.whep_fac_id and B.active_flag = 'A' and B.package_type = 'MS47'),0) AS MS47_PKG_ID,

                 nvl((select a.package_STATUS from emdba.em_staffing_pkg_status_t a where a.site_id = pSite_id
                             and a.whep_fac_id = c.whep_fac_id and a.active_flag = 'A' and a.package_type = 'EWHEP'),'0') AS WHEP_PKG_STATUS,
                 nvl((select B.package_STATUS from emdba.em_staffing_pkg_status_t B where B.site_id = pSite_id
                 and B.whep_fac_id = c.whep_fac_id and B.active_flag = 'A' and B.package_type = 'MS47'),'0') AS MS47_PKG_STATUS,
           nvl((select a.approval_user_id from emdba.em_staffing_pkg_status_t a where a.site_id = pSite_id
                             and a.whep_fac_id = c.whep_fac_id and a.active_flag = 'A' and a.package_type = 'EWHEP'),0) AS WHEP_APPROVER_ID,
                 nvl((select B.approval_user_id from emdba.em_staffing_pkg_status_t B where B.site_id = pSite_id
                 and B.whep_fac_id = c.whep_fac_id and B.active_flag = 'A' and B.package_type = 'MS47'),0) AS MS47_APPROVER_ID
                    from emdba.em_subsite_facility_t c
                    where c.site_id = pSite_id
                    and (c.whep_enable = 'Y' or c.ms47_enable = 'Y')
                    order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name;

 /*         cursor submitted is
          SELECT c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                 c.whep_enable, c.ms47_enable
                    from emdba.em_subsite_facility_t c
                    where c.site_id = pSite_id
                    and  c.whep_fac_id in (select a.whep_fac_id frOM emdba.em_staffing_pkg_status_t A
                    WHERE a.site_id = pSite_id and  a.package_status = 'S'
                    and a.active_flag = 'A' and a.package_type = pPackage_Type)
                    order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name;


         CURSOR approved_returned is

           SELECT c.facility_name, c.whep_fac_id, c.default_whep_fac_id, c.subsite_default_yn,
                 c.whep_enable, c.ms47_enable
                    from emdba.em_subsite_facility_t c
                    where c.site_id = pSite_id
                    and  c.whep_fac_id in (select a.whep_fac_id frOM emdba.em_staffing_pkg_status_t A
                    WHERE a.site_id = pSite_id and  a.package_status in ('R','A')
                    and a.active_flag = 'A' and a.package_type = pPackage_Type)
                    order by decode(c.subsite_default_yn,'Y','A','B'),c.facility_name;

 --          cursor current_returned is */





          begin
              htp.p('<?xml version="1.0"?>');
              htp.p('<ROWSET>');
              --if pSubmitted = 'N' then
                  for i in facilitydata loop
                      htp.p('<ROW>');
                      htp.p('<WHEPFACID>'||to_char(i.whep_fac_id)||'</WHEPFACID>');
                      htp.p('<FACILITYNAME>'||initcap(i.facility_name)||'</FACILITYNAME>');
                      htp.p('<VALUEID>'||to_char(i.whep_fac_id)||'</VALUEID>');
                      htp.p('<DEFAULTFACID>'||to_char(I.default_whep_fac_id)||'</DEFAULTFACID>');
                      htp.p('<WHEPENABLED>'||i.WHEP_ENABLE||'</WHEPENABLED>');
                      htp.p('<MS47ENABLED>'||i.MS47_ENABLE||'</MS47ENABLED>');
                      htp.p('<DEFAULTFACILITY>'||i.DEFAULT_FACILITY||'</DEFAULTFACILITY>');
                      htp.p('<WHEPPKGID>'||TO_CHAR(I.WHEP_PKG_ID)||'</WHEPPKGID>');
                      htp.p('<MS47PKGID>'||TO_CHAR(I.MS47_PKG_ID)||'</MS47PKGID>');
                      htp.p('<WHEPPKGSTATUS>'||I.WHEP_PKG_STATUS||'</WHEPPKGSTATUS>');
                      htp.p('<MS47PKGSTATUS>'||I.MS47_PKG_STATUS||'</MS47PKGSTATUS>');
                      htp.p('<WHEPAPPROVERID>'||to_char(I.WHEP_APPROVER_ID)||'</WHEPAPPROVERID>');
                      htp.p('<MS47APPROVERID>'||TO_CHAR(I.MS47_APPROVER_ID)||'</MS47APPROVERID>');
                     htp.p('</ROW>');
                  END LOOP;
              /*else
                  for i in SUBMITTED loop
                      htp.p('<ROW>');
                       htp.p('<WHEPFACID>'||TO_CHAR(i.WHEP_FAC_ID)||'</WHEPFACID>');
                      htp.p('</ROW>');
                 end loop;
              end if;*/

              HTP.P('</ROWSET>');
          end;

function staffing_is_facility_status(pSiteid in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pstatus in varchar2,
                            pPackage_Type in emdba.em_staffing_pkg_status_t.package_type%type default 'MS47')
                            return boolean

        is

        reccount            Integer(4):=0;
        lcStatus            varchar2(4):='';


        begin

        case pstatus

             when 'W' then
                  select whep_enable into lcStatus
                  from emdba.em_subsite_facility_t where site_id = pSiteid
                     and whep_fac_id = tnFac_id;

                  if lcStatus = 'Y' then
                     return true;
                  else
                      return false;
                  end if;
             when 'M' then
                 select ms47_enable
                 into lcStatus
                 from emdba.em_subsite_facility_t where site_id = pSiteid
                 and whep_fac_id = tnFac_id;
                 if lcStatus = 'Y' then
                     return true;
                 else
                      return false;
                 end if;
             else

                 select package_status
                     into lcStatus
                     from emdba.em_staffing_pkg_status_t where site_id = pSiteid
                     and whep_fac_id = tnFac_id and package_type = pPackage_Type
                     and active_flag = 'A';
                  if  pstatus = lcStatus then
                     return true;
                  else
                      return false;
                  end if;

              end case;


        end;


/*****************************************************************************************************
 * Procedure Name: archive_package
 * Purpose: This procedure accepts the site_id, facility_id(tnFac_id), staffing package type (pPackage_Type),
 *          Staffing Package Id (pPackage_id) as parameters.  Using these parameters, it copies the
 *          data for the specified staffing package to the archive tables.  Prior to doing this, it
 *          checks to see if there are three packages that have already been archived.  If so, it
 *          calls the "remove_archive_package" procedure to remove the oldest one.
 * Note: The package_type will be either "EWHEP" OR "MS47".
 * Author: Michael E. Harris
 * Create Date: 12/21/2010
 *
 *****************************************************************************************************/

procedure archive_package(pSiteid in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_Type in emdba.em_staffing_pkg_status_t.package_type%type default 'MS47',
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1,
                            pResult out varchar2)

          is

-- WHEP Tables

        type add_craft_tt is table of whep.whep_additional_craft_position%rowtype index by PLS_INTEGER;
        type adj_levels_tt is table of whep.whep_adjustment_levels%rowtype index by pls_integer;
        type adj_tt is table of whep.whep_adjustments%rowtype index by PLS_INTEGER;
       -- type approvals_tt is table of whep.whep_approvals%rowtype index by PLS_INTEGER;
        type craft_pos_tt is table of whep.whep_craft_position%rowtype index by PLS_INTEGER;
        type high_bay_tt is table of whep.whep_high_bay%rowtype index by PLS_INTEGER;
        type local_criteria_tt is table of whep.whep_local_criteria%rowtype index by PLS_INTEGER;
        type local_criteria_levels_tt is table of whep.whep_local_criteria_levels%rowtype index by PLS_INTEGER;
        type local_inv_tt is table of whep.whep_local_inventory%rowtype index by PLS_INTEGER;
        type m489567_tt is table of whep.whep_m489567%rowtype index by PLS_INTEGER;
        type site_summ_tt is table of whep.whep_site_summary%rowtype index by PLS_INTEGER;
        type summ_tt is table of whep.whep_summary%rowtype index by PLS_INTEGER;
        type summ_levels_tt is table of whep.whep_summary_levels%rowtype index by PLS_INTEGER;
        type site_wkhour_reqs_tt is table of whep.whep_site_wkhour_reqs%rowtype index by PLS_INTEGER;

-- eMARS Table

        type subsite_facility_tt is table of emdba.em_subsite_facility_t%rowtype index by PLS_INTEGER;


--MS47 Tables

        type areaperform_tt is table of ms47.areaperform%rowtype index by PLS_INTEGER;
        type body4776_tt is table of ms47.body4776%rowtype index by PLS_INTEGER;
        type compcleaning_tt is table of ms47.compcleaning%rowtype index by PLS_INTEGER;
        type frequency_tt is table of ms47.frequency%rowtype index by PLS_INTEGER;
        type inventory_tt is table of ms47.inventory%rowtype index by PLS_INTEGER;
        type man_contract_tt is table of ms47.man_contract_ent_per_freq%rowtype index by PLS_INTEGER;
        type man4776_tt is table of ms47.man4776%rowtype index by PLS_INTEGER;
        --type package_cert_tt is table of ms47.package_cert%rowtype index by PLS_INTEGER;
        type routedetail_tt is table of ms47.routedetail%rowtype index by PLS_INTEGER;
        type routeheader_tt is table of ms47.routeheader%rowtype index by PLS_INTEGER;
        type source_tt is table of ms47.source%rowtype index by PLS_INTEGER;
        type system_control_tt is table of ms47.system_control%rowtype index by PLS_INTEGER;




        add_craft       add_craft_tt;
        adj_levels      adj_levels_tt;
        adj             adj_tt;
       -- approvals       approvals_tt;
        craft_pos       craft_pos_tt;
        high_bay        high_bay_tt;
        local_criteria  local_criteria_tt;
        local_criteria_levels   local_criteria_levels_tt;
        local_inv       local_inv_tt;
        m489567         m489567_tt;
        site_summ       site_summ_tt;
        summary         summ_tt;
        summ_levels     summ_levels_tt;
        wkhour_reqs     site_wkhour_reqs_tt;

        facilities      subsite_facility_tt;

        areaperform     areaperform_tt;
        boddy4776       body4776_tt;
        compclean       compcleaning_tt;
        freq            frequency_tt;
        inventory       inventory_tt;
        man_cont_entry  man_contract_tt;
        man4776         man4776_tt;
        --pckge_cert      package_cert_tt;
        route_detail    routedetail_tt;
        route_header    routeheader_tt;
        source          source_tt;
        sys_control     system_control_tt;


        reccount        integer:=0;
        v_min_pkg_id    EMDBA.em_staffing_pkg_status_t.package_id%TYPE:=0;
        v_instance_count    integer:=0;


    begin


        if pPackage_Type = 'EWHEP' then

            select count(*) into reccount
                from whep.whep_local_inventory_BK
                where site_id = pSiteid
                and default_whep_fac_id = tnFac_id
                and package_id = pPackage_id;

            if reccount > 0 then
              pResult := 'ARCHIVEDUPLICATE';
            --  htp.p('<?xml version="1.0"?>');
             -- htp.p('<ANSWER>ARCHIVEDUPLICATE</ANSWER>');
              RETURN;
            END IF;


            reccount:=0;

            --COUNT THE NUMBER OF PACKAGES THAT ARE ALREADY ARCHIVED

            select count(1)
            into reccount
            from
            (SELECT DISTINCT PACKAGE_ID
            FROM whep.WHEP_LOCAL_INVENTORY_BK
            WHERE SITE_ID = pSiteid AND DEFAULT_WHEP_FAC_ID = tnFac_id);

            -- GET THE PACKAGE_ID OF THE OLDEST ONE

            select min(package_id)
            into v_min_pkg_id
            from whep.WHEP_LOCAL_INVENTORY_BK
            WHERE SITE_ID = pSiteid
            AND DEFAULT_WHEP_FAC_ID = tnFac_id;

            -- BEFORE ARCHIVING THE CURRENT PACKAGE,
            --CHECK TO SEE IF THERE ARE ALREADY 3 ARCHIVED PACKAGES.
            -- IF THERE ARE, REMOVE THE OLDEST ONE.

        --     If the current instance is "AWHEP" then
       --     disregard the three package limit and retain all packages.

            select count(1)
            into v_instance_count
            from nmars.em_app_homepage_t
            where lower(db_dad) ='awhep';

           if reccount >= 3  and v_instance_count = 0 then
                remove_archive_package(pSiteid, tnFac_id, v_min_pkg_id, 'EWHEP');
            END IF;



            -- SELECTING DATA TO BE ARCHIVED VIA BULK COLLECTS.
            -- BULK COLLECTS ARE USED FOR EFFICIENT PERFORMANCE

            select * bulk collect into add_craft from WHEP.whep_additional_craft_position
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into adj_levels from whep.whep_adjustment_levels
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk COLLECT into adj from whep.whep_adjustments
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            /*select * bulk collect into approvals from whep.whep_approvals
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;*/

            select * bulk collect into craft_pos from whep.whep_craft_position
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into high_bay from whep.whep_high_bay
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into local_criteria from whep.whep_local_criteria
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into local_criteria_levels from whep.whep_local_criteria_levels
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into local_inv from whep.whep_local_inventory
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into m489567 from whep.whep_m489567
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into site_summ from whep.whep_site_summary
            where site_id = pSiteid and default_whep_fac_id = tnFac_id and package_id = pPackage_id;

            select * bulk collect into summary from whep.whep_summary
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into summ_levels from whep.whep_summary_levels
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into wkhour_reqs from whep.whep_site_wkhour_reqs
            where site_id = pSiteid and default_whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into facilities from emdba.em_subsite_facility_t
            where site_id = pSiteid and default_whep_fac_id = tnFac_id;



            forall add_craft_indx in add_craft.first .. add_craft.last
                insert into whep.whep_addnl_craft_position_bk values add_craft(add_craft_indx);

            forall adj_levels_indx in adj_levels.first .. adj_levels.last
                insert into whep.whep_adjustment_levels_bk values adj_levels(adj_levels_indx);

            forall adj_indx in adj.first .. adj.last
                insert into whep.whep_adjustments_bk values adj(adj_indx);

            /*forall approvals_indx in approvals.first .. approvals.last
                insert into whep.whep_approvals_bk values approvals(approvals_indx);*/
--/*
            forall craft_pos_indx in craft_pos.first ..craft_pos.last
                insert into whep.whep_craft_position_bk values craft_pos(craft_pos_indx);

            forall high_bay_indx in high_bay.first .. high_bay.last
                insert into whep.whep_high_bay_bk values high_bay(high_bay_indx);

            forall local_criteria_indx in local_criteria.first .. local_criteria.last
                insert into whep.whep_local_criteria_BK values local_criteria(local_criteria_indx);

            forall local_criteria_levels_indx in local_criteria_levels.first .. local_criteria_levels.last
                insert into whep.whep_local_criteria_levels_bk values local_criteria_levels(local_criteria_levels_indx);

            forall local_inv_indx in local_inv.first .. local_inv.last
                insert into whep.whep_local_inventory_BK values local_inv(local_inv_indx);
--*/
            forall m489567_indx in m489567.first .. m489567.last
                insert into whep.whep_m489567_bk values m489567(m489567_indx);

            forall site_summ_indx in site_summ.first .. site_summ.last
                insert into whep.whep_site_summary_bk values site_summ(site_summ_indx);

            forall summary_indx in summary.first .. summary.last
                insert into whep.whep_summary_bk values summary(summary_indx);

            forall summary_levels_indx in summ_levels.first .. summ_levels.last
                insert into whep.whep_summary_levels_bk values summ_levels(summary_levels_indx);

            forall wkhour_reqs_indx in wkhour_reqs.first .. wkhour_reqs.last
                insert into whep.whep_site_wkhour_reqs_bk values wkhour_reqs(wkhour_reqs_indx);


            forall facilities_indx in facilities.first .. facilities.last
                insert into emdba.em_subsite_facility_t_bk values facilities(facilities_indx);

        else


            select count(*) into reccount
                from MS47.system_control_BK
                where site_id = pSiteid
                and whep_fac_id = tnFac_id
                and package_id = pPackage_id;

            if reccount > 0 then

               pResult := 'ARCHIVEDUPLICATE';
             --htp.p('<?xml version="1.0"?>');
             -- htp.p('<ANSWER>ARCHIVEDUPLICATE</ANSWER>');
              RETURN;
            END IF;


            reccount:=0;

            --COUNT THE NUMBER OF PACKAGES THAT ARE ALREADY ARCHIVED

            select count(1)
            into reccount
            from
            (SELECT DISTINCT PACKAGE_ID
            FROM MS47.system_control_BK
            WHERE SITE_ID = pSiteid AND WHEP_FAC_ID = tnFac_id);

            -- GET THE PACKAGE_ID OF THE OLDEST ONE

            select min(package_id)
            into v_min_pkg_id
            from MS47.system_control_BK
            WHERE SITE_ID = pSiteid
            AND WHEP_FAC_ID = tnFac_id;

            -- BEFORE ARCHIVING THE CURRENT PACKAGE,
            --CHECK TO SEE IF THERE ARE ALREADY 3 ARCHIVED PACKAGES.
            -- IF THERE ARE, REMOVE THE OLDEST ONE.

            if reccount >= 3 then
                remove_archive_package(pSiteid, tnFac_id, v_min_pkg_id, 'MS47');
            END IF;



            -- SELECTING DATA TO BE ARCHIVED VIA BULK COLLECTS.
            -- BULK COLLECTS ARE USED FOR EFFICIENT PERFORMANCE




            select * bulk collect into areaperform from ms47.areaperform
            where site_id = pSiteid and whep_fac_id = tnFac_id; --and package_id = pPackage_id;

            select * bulk collect into boddy4776 from ms47.body4776
            where site_id = pSiteid and whep_fac_id = tnFac_id;-- and package_id = pPackage_id;

            select * bulk collect into compclean from ms47.compcleaning
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into freq from ms47.frequency
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into inventory from ms47.inventory
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into man_cont_entry  from ms47.man_contract_ent_per_freq
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into man4776  from ms47.man4776
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            /*select * bulk collect into pckge_cert  from ms47.package_cert
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;*/

            select * bulk collect into route_detail  from ms47.routedetail
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into route_header from ms47.routeheader
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into source from ms47.source
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;

            select * bulk collect into sys_control from ms47.system_control
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;


            FORALL areaperform_indx in areaperform.first ..areaperform.last
                insert into ms47.areaperform_BK values areaperform(areaperform_indx);

            forall body4776_indx in boddy4776.first .. boddy4776.last
                insert into ms47.body4776_BK values boddy4776(body4776_indx);

            forall compclean_indx in compclean.first .. compclean.last
                insert into ms47.compcleaning_BK values compclean(compclean_indx);

            forall freq_indx in freq.first .. freq.last
                insert into ms47.frequency_BK values freq(freq_indx);

            forall inventory_indx in inventory.first .. inventory.last
                insert into ms47.inventory_BK values inventory(inventory_indx);

            forall man_cont_entry_indx in man_cont_entry.first .. man_cont_entry.last
                insert into ms47.man_contract_ent_per_freq_BK values man_cont_entry(man_cont_entry_indx);

            /*forall pckge_cert_indx in pckge_cert.first .. pckge_cert.last
                insert into ms47.act_package_cert_BK values pckge_cert(pckge_cert_indx);*/

            forall route_detail_indx in route_detail.first .. route_detail.last
                insert into ms47.routedetail_BK values route_detail(route_detail_indx);

            forall route_header_indx in route_header.first .. route_header.last
                insert into ms47.routeheader_BK values route_header(route_header_indx);

            forall source_indx in source.first .. source.last
                insert into ms47.source_BK values source(source_indx);

            forall sys_control_indx in sys_control.first .. sys_control.last
                insert into ms47.system_control_BK values sys_control(sys_control_indx);

        end if;

            COMMIT;




              pResult := 'SUCCESS';
          --    htp.p('<?xml version="1.0"?>');
          --    htp.p('<ANSWER>SUCCESS</ANSWER>');

       exception
          when others then
            pResult := 'ERROR';
 --           htp.p('<?xml version="1.0"?>');
--            htp.p('<ANSWER>ERROR</ANSWER>');*/

    end;



procedure redelegate_authority(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1,
                            pPackageType in varchar2 default 'EWHEP',
                            pUser in emdba.em_user_t.user_id%type default -1,
                            pApproversPasswd in emdba.em_user_t.user_password%type default '',
                            pAction in varchar2 default 'D') -- D is for Redelegate, E is for Dedelegate
                            -- These symbols were chosen to remain consistent with the front end (javascript file);
                            -- "R" could not be used because it was used for "Return" in a previous
                            -- version of the javascript file.

          is

               /* cursor q_xml_approvers(arg_area_id in emdba.em_site_t.area%type) is
                    select a.user_id as value, trim(a.first_name)||' '||trim(a.middle_name)||' '||trim(a.last_name) as text
                    from emdba.em_user_t a
                    where a.area_cd = arg_area_id
                    and (a.w*/

         cursor current_user is
               select * --into user_rec
                 from emdba.em_user_t a
                 where a.user_id = pUser;

         cursor user_name is
             select TRIM(a.last_name), TRIM(a.first_name)
             --into lc_last_name, lc_first_name
             from emdba.em_user_t a
            where a.user_id = pUser;



        USER_REC            EMDBA.EM_USER_T%ROWTYPE;
        lcuserPassword      emdba.em_user_t.user_password%type;
        v_District_code emdba.em_site_t.district_code%type;
        v_Redelegated_User_id   emdba.em_user_t.user_id%type;


        begin
            open current_user;
            fetch current_user into user_rec;
            close current_user;

            select a.district_code
            into v_District_code
            from emdba.em_site_t a where a.site_id = pSite_id;


             lcuserPassword := emapp.em_decryption_fnc(user_rec.user_password);


                  if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver in ('Y','N') then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                     if USER_REC.ms47_approver in ('Y','N') then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 end if;
                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;




           -- if pPackageType = 'EWHEP' then
                select b.user_id
                into v_Redelegated_User_id
                from emdba.em_user_t b
                where b.site_id in (select c.site_id from emdba.em_site_t c where c.district_code = v_District_code)
                and decode(pPackageType,'EWHEP', b.whep_approver, b.ms47_approver) = 'Y';



            -- If the action is to Dedelegate or revoke approval authority then
            -- update the current facility's approval_user_id with
            -- the Area Manager's user_id;
            -- Because only the Area Manager can delegate and dedelegate
            -- the approval authority, by default, the current user is the
            -- Area Manager.  This is designated by conditions in the javascript code.
            if pAction = 'E' then
                v_Redelegated_User_id := pUser;
            end if;


           UPDATE emdba.em_staffing_pkg_status_t a set a.approval_user_id = v_Redelegated_User_id,
            a.mod_date = sysdate,
            a.mod_user = pUser
           where a.site_id = pSite_id
           and a.whep_fac_id = tnFac_id
           and a.package_id = pPackage_id
           and a.package_type = pPackageType
           and a.active_flag = 'A';

           commit;

         htp.p('<?xml version="1.0"?>');
        htp.p('<RESPONSE>SUCCESS</RESPONSE>');

       exception
          when others then
            htp.p('<?xml version="1.0"?>');
            htp.p('<RESPONSE>ERROR</RESPONSE>');
    end;


procedure is_area_manager(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            pUser in emdba.em_user_t.user_id%type default -1)


          is


          v_user_id     emdba.em_user_t.user_id%type;
          v_area        emdba.em_site_t.area%type;



          begin

            select area
            into v_area
            from emdba.em_site_t
            where site_id = pSite_id;

            if v_area = '1H' then
                v_area := '1G';
            end if;

            select user_id
            into v_user_id
            from emdba.em_user_t
            where (whep_approver = 'S' or ms47_approver = 'S')
            and area_cd = v_area;

            if pUser = v_user_id then
                  htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>Y</RESPONSE>');
            else
                 htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>N</RESPONSE>');
            end if;
        end;




procedure get_redelegate_info(pSite_id in emdba.em_subsite_facility_t.site_id%type,
          arg_package_type    emdba.em_staffing_pkg_status_t.package_type%type)

                is

-- This procedure fetches the user_id from em_user_t of the user that is the
-- district ms47  OR WHEP approver(user who has the authority to approve packages for the district) of the
-- specified site.

            --type delegate_ref_cursor is ref cursor;

            cursor redelegate is
            select TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name,
            a.email_address, a.user_id, a.user_logon, a.user_password
            from emdba.em_user_t a where a.district_code in (select b.district_code from emdba.em_site_t b  WHERE
            b.SITE_ID = pSite_id) and a.ms47_approver = 'Y';


            delegate_name_cursor redelegate%rowtype ;



        v_sql_statement     varchar2(4000);
        redelegate_rec  redelegate%rowtype;

        begin



            /*open redelegate;
            fetch redelegate into redelegate_rec;
            close redelegate;*/

/*            v_sql_statement := 'select TRIM(first_name) ||" "||middle_name||" "||TRIM(last_name) as USER_name,
            email_address, user_id, user_logon, user_password
            from emdba.em_user_t where district_code in (select district_code from emdba.em_site_t  WHERE
            SITE_ID = :1) ';*/
            if arg_package_type = 'MS47' THEN

                OPEN redelegate;
                FETCH redelegate INTO redelegate_rec;
                CLOSE REDELEGATE;
 --              v_sql_statement := v_sql_statement||' and ms47_approver = :2';
            else
                select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
                email_address, user_id, user_logon, user_password
                into redelegate_rec
                from emdba.em_user_t where district_code in (select district_code from emdba.em_site_t  WHERE
                SITE_ID = pSite_id)  and whep_approver = 'Y';
--                v_sql_statement := v_sql_statement||'and whep_approver = :2';
            end if;

--            execute immediate v_sql_statement using pSite_id, 'Y' returning redelegate_rec;
            htp.p('<?xml version="1.0"?>');
--              htp.p('<ROWSET>');
            htp.p('<ROW>');
            htp.p('<DELEGATENAME>'||REDELEGATE_REC.USER_NAME||'</DELEGATENAME>');
            HTP.P('<DELEGATEEMAIL>'||REDELEGATE_REC.EMAIL_ADDRESS||'</DELEGATEEMAIL>');
            HTP.P('<DELEGATEUSERID>'||TO_CHAR(REDELEGATE_REC.USER_ID)||'</DELEGATEUSERID>');
            HTP.P('</ROW>');
--              htp.p('</ROWSET>');
        END;

procedure is_approver(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            pUser in emdba.em_user_t.user_id%type default -1)

          is


          v_user_id     emdba.em_user_t.user_id%type;
          appcnt      number:=0;


          begin

          --Searching for the number of times that the current user
          -- is found as a package approver.  If it is more than 0, then
          -- the current user is an approver.

            select nvl(count(1),0)
            into appcnt
            from emdba.em_staffing_pkg_status_t a
            where a.site_id = pSite_id
            and a.approval_user_id = pUser;

            htp.p('<?xml version="1.0"?>');
            if appcnt > 0 then
                htp.p('<RESPONSE>Y</RESPONSE>');
            else
                htp.p('<RESPONSE>N</RESPONSE>');
            end if;
        end;


procedure is_returner(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            pUser in emdba.em_user_t.user_id%type default -1)

          is


          v_user_id     emdba.em_user_t.user_id%type;
          appcnt      number:=0;
          v_area_code   emdba.em_site_t.area%type;

          user_rec      emdba.em_user_t%rowtype;


          begin

          --Searching for the number of times that the current user
          -- is found as a package approver.  If it is more than 0, then
          -- the current user is an approver.

          select area
          into v_area_code
          from emdba.em_site_t
          where site_id = pSite_id;

          select a.*
          into user_rec
          from emdba.em_user_t a
          where a.user_id = pUser;

            htp.p('<?xml version="1.0"?>');
         if user_rec.area_cd = v_area_code
            and (user_rec.whep_approver = 'R' or user_rec.ms47_approver = 'R') then
            htp.p('<RESPONSE>Y</RESPONSE>');
        else
            htp.p('<RESPONSE>N</RESPONSE>');
        end if;
    end;





/*****************************************************************************************************
 * Procedure Name: remove_archive_package
 * Purpose: This procedure accepts the site_id, facility_id(tnFac_id), staffing package type (pPackage_Type),
 *          Staffing Package Id (pPackage_id) as parameters.  Using these parameters, it removes the
 *          data for the specified staffing package.
 * Note: The package_type will be either "EWHEP" OR "MS47".
 * Author: Michael E. Harris
 * Create Date: 12/21/2010
 *
 *****************************************************************************************************/

procedure remove_archive_package(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1,
                            pPackageType in varchar2 default 'EWHEP')


          is

    -- Retrieve a list of the WHEP Tables from all_tab_columns system table

        cursor tWhepArchiveTables is
        select table_name from ALL_TAB_COLUMNS where COLUMN_NAME='WHEP_FAC_ID'
        and owner = 'WHEP' AND table_name NOT LIKE 'VIEW%'
        and table_name like '%_BK%' and table_name not in ('WHEP_CRITERIA_BK','WHEP_APPROVALS_BK','QUERY_RESULTS', 'WHEP_EXCEPTIONS','WHEP_MODIFICATION_HISTORY')
        AND TABLE_NAME NOT LIKE 'V_%' AND TABLE_NAME NOT LIKE 'WHE_2C%' AND
        TABLE_NAME NOT LIKE 'WHE_MAJOR%' AND TABLE_NAME NOT LIKE 'WHEP_R_%'  AND TABLE_NAME LIKE 'WHEP_%'
        ORDER BY TABLE_NAME;

    -- Retrieve a list of the MS47 Tables from all_tab_columns system table

        CURSOR tMS47ArchiveTables IS
        select table_name from ALL_TAB_COLUMNS where COLUMN_NAME='PACKAGE_ID'
        and owner = 'MS47' AND table_name NOT LIKE 'VIEW%'
        and table_name like '%_BK%' AND TABLE_NAME NOT IN ('ROUTEINVENTORY', 'MS47_SP_ERROR_LOG','MS47_SUBSITE_FACILITY_T')
        AND TABLE_NAME NOT LIKE 'V_%' AND
        TABLE_NAME NOT LIKE 'MS47_F%' AND TABLE_NAME NOT LIKE 'MS47_R_%'  AND TABLE_NAME NOT LIKE '%$%'
        and TABLE_NAME NOT LIKE '%HIRAD' AND TABLE_NAME NOT LIKE '%_HM'
        ORDER BY TABLE_NAME;


        TYPE TABLE_NAME_TT IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
        type whep_Table_tt is table of all_tab_columns.table_name%type index by PLS_INTEGER;
--        type ms47_Table_tt is table of all_tab_columns%rowtype index by PLS_INTEGER;


        tWhepTables             table_NAME_tt;
        tMS47Tables             whep_table_tt;

       v_FieldName              varchar2(80):='';
        sql_statement           varchar(2000):='';
        v_Archive_Table_Name    varchar2(80):='';
        v_counter               number:=0;

        BEGIN




 /*         IF pPackageType = 'EWHEP' THEN


                select 'WHEP.'||table_name as table_name bulk collect into tWhepTables from ALL_TAB_COLUMNS where COLUMN_NAME='WHEP_FAC_ID'
                and owner = 'WHEP' AND table_name NOT LIKE 'VIEW%'
                and table_name like '%_BK%' and table_name not in ('WHEP_APPROVALS_BK','QUERY_RESULTS', 'WHEP_EXCEPTIONS','WHEP_MODIFICATION_HISTORY')
                AND TABLE_NAME NOT LIKE 'V_%' AND TABLE_NAME NOT LIKE 'WHE_2C%' AND
                TABLE_NAME NOT LIKE 'WHE_MAJOR%' AND TABLE_NAME NOT LIKE 'WHEP_R_%'  AND TABLE_NAME LIKE 'WHEP_%'
                ORDER BY TABLE_NAME;

               forall whep_table_indx in tWhepTables.first .. tWhepTables.last
                    execute immediate 'DELETE FROM :1'||
                            ' WHERE SITE_ID = :2 '||
                            ' AND '||
                            emapp.iif(':3' = 'WHEP.WHEP_HIGH_BAY_BK','WHEP_FAC_ID','DEFAULT_WHEP_FAC_ID')||' = :4'||
                            ' AND PACKAGE_ID = :5' USING tWhepTables(whep_TABLE_INDX), pSite_id, tWhepTables(whep_table_indx),
                            tnFac_id, pPackage_id;

            else

                select table_name bulk collect into tMS47Tables from ALL_TAB_COLUMNS where COLUMN_NAME='PACKAGE_ID'
                and owner = 'MS47' AND table_name NOT LIKE 'VIEW%'
                and table_name like '%_BK%' AND TABLE_NAME NOT IN ('ROUTEINVENTORY', 'MS47_SP_ERROR_LOG','MS47_SUBSITE_FACILITY_T')
                AND TABLE_NAME NOT LIKE 'V_%' AND
                TABLE_NAME NOT LIKE 'MS47_F%' AND TABLE_NAME NOT LIKE 'MS47_R_%'  AND TABLE_NAME NOT LIKE '%$%'
                and TABLE_NAME NOT LIKE '%HIRAD' AND TABLE_NAME NOT LIKE '%_HM'
                ORDER BY TABLE_NAME;

               forall MS47_table_indx in tMS47Tables .first .. tMS47Tables.last
                    execute immediate 'DELETE FROM MS47.:1'||
                            ' WHERE SITE_ID = :2 '||
                            ' AND WHEP_FAC_ID = :3'||
                            ' AND PACKAGE_ID = :4' USING tMS47Tables(MS47_TABLE_INDX), pSite_id, tnFac_id, pPackage_id;

            end if;
            COMMIT;*/
--  Original code commented on 12/23/2010 By Michael E. Harris to experiment with
   -- bulk collect and forall coding methods

           --LOOP THROUGH THE ARCHIVE TABLES AND remove THE SPECIFIED PACKAGE

            IF pPackageType = 'EWHEP' THEN

                  for table_rec in tWhepArchiveTables loop

                  -- Note: the "WHEP_HIGH_BAY_BK Table does not have a "default_whep_fac_id".
                        if table_rec.table_name = 'WHEP_HIGH_BAY_BK'  THEN
                            v_FieldName := 'WHEP_FAC_ID';
                        ELSE
                            V_FieldName := 'DEFAULT_WHEP_FAC_ID';
                        END IF;
                        sql_statement := 'DELETE FROM WHEP.'||TABLE_REC.TABLE_NAME||
                        ' WHERE SITE_ID = :1 '||
                        ' AND '||v_FieldName||' = :2'||
                        ' AND PACKAGE_ID = :3';
                        --PS_DYNAMIC.PLSQL(sql_statement);

                       execute immediate sql_statement
                       USING pSite_id, tnFac_id, pPackage_id;
                       commit;
                  end loop;

                  delete from emdba.em_subsite_facility_t_bk where site_id = pSite_id
                  and default_whep_fac_id = tnFac_id
                  and package_id = pPackage_id;

                  commit;

               ELSE

                  for table_rec in tMS47ArchiveTables loop
                         sql_statement := 'DELETE FROM MS47.'||TABLE_REC.TABLE_NAME||
                        ' WHERE SITE_ID = :1 '||
                        ' AND WHEP_FAC_ID = :2'||
                        ' AND PACKAGE_ID = :3';
                        --PS_DYNAMIC.PLSQL(sql_statement);
                       execute immediate sql_statement USING pSite_id, tnFac_id, pPackage_id;
                       commit;
                  end loop;
               END IF;

        END remove_archive_package;


        procedure get_criteria_version(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1)



        is

        v_criteria_version  emdba.em_staffing_pkg_status_t.criteria_version%type:=0;



            begin


                if pPackage_id > 0 then
                    select criteria_version
                    into v_criteria_version
                    from emdba.em_staffing_pkg_status_t
                    where site_id = pSite_id
                    and whep_fac_id = tnFac_id
                    and package_id = pPackage_id
                    and package_type = 'EWHEP';
                else
                    select criteria_version
                    into v_criteria_version
                    from emdba.em_staffing_pkg_status_t
                    where site_id = pSite_id
                    and whep_fac_id = tnFac_id
                    and active_flag = 'A'
                    and package_type = 'EWHEP';
                end if;



            htp.p('<?xml version="1.0"?>');
            htp.p('<CRITERIAVERSION>'||TO_CHAR(v_criteria_version)||'</CRITERIAVERSION>');

        end;


procedure get_XML_Staffing_Pkgs(pSiteid in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_type in varchar2 default 'EWHEP')


       IS


        s_query varchar2(4000) :=   'select a.package_id "VALUE",  to_char(trunc(A.approval_date)) AS TEXT
         from emdba.em_staffing_pkg_status_t a
        where a.site_id = '||pSiteid||' and a.whep_fac_id='||tnFac_id||' and a.package_id in '||
        '(select distinct b.package_id from whep.whep_local_inventory_bk b where b.site_id = '||psiteid||
        ' and b.default_whep_fac_id = '||tnfac_id||') and a.package_type = ''EWHEP''
        order by A.APPROVAL_DATE DESC';


/*     s_query varchar2(400) := 'SELECT whep_fac_id "VALUE", SUBSITE_ID||''-''||FACILITY_NAME AS TEXT'
         || ' FROM em_subsite_facility_t '
         || ' WHERE site_id = '||pSiteID
         || ' AND whep_enable=''Y'''
         || ' ORDER by subsite_id, facility_name';*/

     ctx dbms_xmlgen.ctxhandle;
     myxml     clob;
     vErrMsg   varchar2(1000);
     vStdErrmsg varchar2(200) := 'An error was encountered that was not caused by you. System administrators have been notified. Please try again later.';
  BEGIN

    if pPackage_type = 'MS47' then
        s_query := 'select a.package_id "VALUE",  to_char(A.approval_date) AS TEXT
         from emdba.em_staffing_pkg_status_t a
        where a.site_id = '||pSiteid||' and a.whep_fac_id='||tnFac_id||' and a.package_id in '||
        '(select distinct b.package_id from ms47.system_control_bk b where b.site_id = '||psiteid||
        ' and b.whep_fac_id = '||tnfac_id||') and a.package_type = ''MS47''
        order by A.APPROVAL_DATE DESC';
    end if;

     ctx := dbms_xmlgen.newContext(s_query);
     myxml := dbms_xmlgen.getXML(ctx);
     htp.p(myxml);
  EXCEPTION
     WHEN others THEN
        em_error_pkg.em_error_prc;

  end;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE get_Est_vs_Aut_info (pSiteID  emdba.em_subsite_facility_t.site_id%TYPE,
                               tnfac_id emdba.em_subsite_facility_t.whep_fac_id%TYPE,
                               pDefault_whep_fac_id emdba.em_subsite_facility_t.default_whep_fac_id%TYPE)
IS

    v_l NUMBER :=0;v_e NUMBER :=0; v_a NUMBER :=0; v_aa number:=0; v_p number:=0; v_ap number:=0;

BEGIN

-- Commented on 06/20/2012 by Michael E. Harris


  /*  SELECT DECODE(
    ABS(ROUND(((SELECT NVL(SUM(estimated_quantity),0) FROM whep.whep_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id AND labcat_fk <> '1AWXFI')+(SELECT NVL(SUM(estimated_quantity),0) FROM whep.whep_additional_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id)),0)
    -
    ROUND(((SELECT NVL(SUM(approved_quantity),0) FROM WHEP.whep_craft_position b, whep.whep_laborcats c WHERE b.site_id = pSiteID AND b.whep_fac_id = tnfac_id AND b.labcat_fk = c.labcat_pk)+(SELECT NVL(SUM(approved_quantity),0) FROM WHEP.whep_additional_craft_position b  WHERE b.site_id = pSiteID AND b.default_whep_fac_id = pDefault_whep_fac_id )),0)),0,0,1)
    ,
    ROUND(((SELECT NVL(SUM(estimated_quantity),0) FROM whep.whep_craft_position  WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id AND labcat_fk <> '1AWXFI')+(SELECT NVL(SUM(estimated_quantity),0) FROM whep.whep_additional_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id)),0)
    ,
    ROUND(((SELECT NVL(SUM(approved_quantity),0) FROM WHEP.whep_craft_position b, whep.whep_laborcats c WHERE b.site_id = pSiteID AND b.whep_fac_id = tnfac_id AND b.labcat_fk = c.labcat_pk)+(SELECT NVL(SUM(approved_quantity),0) FROM WHEP.whep_additional_craft_position b  WHERE b.site_id = pSiteID AND b.default_whep_fac_id = pDefault_whep_fac_id)),0)
    INTO v_l, v_e, v_a FROM dual;*/



    select nvl(sum(nvl(estimated_quantity,0)),0), nvl(sum(nvl(proposed_quantity,0)),0), nvl(sum(nvl(approved_quantity,0)),0)
    into v_e, v_p, v_a
    from whep.whep_craft_position
    where site_id = pSiteID
    AND default_whep_fac_id = pDefault_whep_fac_id
    AND labcat_fk <> '1AWXFI';


    select nvl(sum(nvl(proposed_quantity,0)),0), nvl(sum(nvl(approved_quantity,0)),0)
    into v_ap, v_aa
    from whep.whep_additional_craft_position
    where site_id = pSiteID
    AND default_whep_fac_id = pDefault_whep_fac_id;
    --AND labcat_fk <> '1AWXFI';

 /*   v_a := v_a + v_aa;
    v_p := v_p + v_ap;*/

    htp.p('<?xml version="1.0"?>');htp.p('<ROWSET>');htp.p('<ROW>');

    if v_a > v_e then
    --IF v_l = 1 THEN
       v_l := 1;
       htp.p('<VAL1>'||v_l||'</VAL1>');
       htp.p('<VAL2>'||v_e||'</VAL2>');
       htp.p('<VAL3>'||v_p||'</VAL3>');
       htp.p('<VAL4>'||v_a||'</VAL4>');
    ELSE
       htp.p('<VAL1>0</VAL1>');
    END IF;
    htp.p('</ROW>');htp.p('</ROWSET>');

EXCEPTION
    WHEN OTHERS THEN
    em_error_pkg.em_error_prc;
    htp.p('<?xml version="1.0"?>');htp.p('<ROWSET>');htp.p('<ROW>');
    htp.p('<VAL1>-1</VAL1>');htp.p('</ROW>');htp.p('</ROWSET>');

END;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE get_Est_vs_Pro_info (pSiteID  emdba.em_subsite_facility_t.site_id%TYPE,
                               tnfac_id emdba.em_subsite_facility_t.whep_fac_id%TYPE,
                               pDefault_whep_fac_id emdba.em_subsite_facility_t.default_whep_fac_id%TYPE)
IS

    v_l NUMBER :=0; v_e NUMBER :=0; v_p NUMBER :=0; v_ap number:=0; v_auth number:=0;
    v_add_auth number:=0;

BEGIN

-- Commented on 06/20/2012 by Michael E. Harris

 /*   SELECT DECODE(
        ABS(ROUND(((SELECT NVL(SUM(estimated_quantity),0) FROM whep.whep_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id AND labcat_fk <> '1AWXFI')+(SELECT NVL(SUM(estimated_quantity),0) FROM whep.whep_additional_craft_position WHERE site_id =  pSiteID AND default_whep_fac_id = pDefault_whep_fac_id)),0)
        -
        ROUND(((SELECT NVL(SUM(proposed_quantity),0) FROM whep.whep_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id AND labcat_fk <> '1AWXFI')+(SELECT NVL(SUM(proposed_quantity),0) FROM whep.whep_additional_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id)),0)),0,0,1)
        ,
        ROUND(((SELECT NVL(SUM(estimated_quantity),0) FROM whep.whep_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id AND labcat_fk <> '1AWXFI')+(SELECT NVL(SUM(estimated_quantity),0) FROM whep.whep_additional_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id)),0)
        ,
        ROUND(((SELECT NVL(SUM(proposed_quantity),0) FROM whep.whep_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id AND labcat_fk <> '1AWXFI')+(SELECT NVL(SUM(proposed_quantity),0) FROM whep.whep_additional_craft_position WHERE site_id = pSiteID AND default_whep_fac_id = pDefault_whep_fac_id)),0)
        INTO v_l, v_e, v_p
    FROM dual;*/


    select nvl(sum(nvl(estimated_quantity,0)),0), nvl(sum(nvl(proposed_quantity,0)),0), nvl(sum(nvl(approved_quantity,0)),0)
    into v_e, v_p, v_auth
    from whep.whep_craft_position
    where site_id = pSiteID
    AND default_whep_fac_id = pDefault_whep_fac_id
    AND labcat_fk <> '1AWXFI';


    select nvl(sum(nvl(proposed_quantity,0)),0),nvl(sum(nvl(approved_quantity,0)),0)
    into v_ap,  v_add_auth
    from whep.whep_additional_craft_position
    where site_id = pSiteID
    AND default_whep_fac_id = pDefault_whep_fac_id;
   -- AND labcat_fk <> '1AWXFI';
  /*  v_p := v_p + v_ap;
    v_auth := v_auth + v_add_auth;*/

    htp.p('<?xml version="1.0"?>');htp.p('<ROWSET>');htp.p('<ROW>');
    if v_p > v_e then
    --IF v_l = 1 THEN
        v_l := 1;
       htp.p('<VAL1>'||v_l||'</VAL1>'); -- 1 = True if compared quantities are different, 0 = False
       htp.p('<VAL2>'||v_e||'</VAL2>'); -- Grand total of Proposed Positions
       htp.p('<VAL3>'||v_p||'</VAL3>'); -- Grand total of Estimated Positions
       htp.p('<VAL4>'||v_auth||'</VAL4>'); -- Grand total of Authorized Positions
    ELSE
       htp.p('<VAL1>0</VAL1>');
    END IF;
    htp.p('</ROW>');htp.p('</ROWSET>');

EXCEPTION
    WHEN OTHERS THEN
    em_error_pkg.em_error_prc;
    htp.p('<?xml version="1.0"?>');htp.p('<ROWSET>');htp.p('<ROW>');
    htp.p('<VAL1>-1</VAL1>');htp.p('</ROW>');htp.p('</ROWSET>');

END;

--------------------------------------------------------------------------------
--------------PROCEDURE Staffing_Approval_eMAIL---------------------------------
--------------AUTHOR: Hirad Mehdinejad------------------------------------------
--------------DATE OF CREATION: 05/14/2012--------------------------------------
--------------------------------------------------------------------------------
PROCEDURE Staffing_Approval_eMAIL (pSiteID IN emdba.em_subsite_facility_t.site_id%TYPE,
                                   tnfac_id IN emdba.em_subsite_facility_t.whep_fac_id%TYPE,
                                   pPackage_ID IN emdba.em_staffing_pkg_status_t.package_id%TYPE)

IS

-- for production
    --fromm       VARCHAR2(100)  DEFAULT 'mark.schwabenlender@email.usps.gov';
    --too           VARCHAR2(100)  DEFAULT 'thomas.d.duchesne@email.usps.gov';
    --bcc         VARCHAR2(150)  DEFAULT 'Robert.E.Thoensen@email.usps.gov';

-- for testing
    fromm       VARCHAR2(100)  DEFAULT 'hirad.mehdinejad@email.usps.gov';
    too         VARCHAR2(100)  DEFAULT 'hirad.mehdinejad@email.usps.gov';
    bcc         VARCHAR2(150)  DEFAULT 'hirad.mehdinejad@email.usps.gov';

    toWhom      VARCHAR2(100)  DEFAULT 'Thomas D. Duchesne';
    cc          VARCHAR2(150)  DEFAULT 'hirad.mehdinejad@email.usps.gov';
    cc2         VARCHAR2(150)  DEFAULT 'dominic.l.bratta@email.usps.gov';
    sub         VARCHAR2(400)  DEFAULT 'eMARS WHEP PACKAGE STATUS ';
    sub3        VARCHAR2(400)  DEFAULT '(Estimated/Authorized) Auto-eMail on: '||TO_CHAR(SYSDATE, 'MM-DD-YYYY HH24:MI:SS');
    p_comments_WHEP  VARCHAR2(40) DEFAULT 'WHEP PACKAGE';
    p_comments_line_1 VARCHAR2(4000) DEFAULT '';
    p_comments_line_2 VARCHAR2(4000) DEFAULT '';
    p_comments_line_3 VARCHAR2(4000) DEFAULT '';

    CURSOR csr_1 IS
        SELECT
            area.area_name, dist.district_name, site.site_name, a.site_id, a.whep_fac_id, fac.facility_name, fac.subsite_default_YN,
            fac.address1 ||', '||fac.state||', '||TRIM (fac.zipcode) address,
            NVL2(TO_CHAR(a.approval_user_id),usr.last_name||', '||usr.middle_name||', '||usr.first_name,'UNKNOWN') approval_name,
            a.approval_date, a.approval_user_id, a.app_overage_justification, a.app_overage_email_date, a.grand_authorized_total, a.grand_estimated_total
        FROM emdba.em_staffing_pkg_status_t a ,emdba.em_subsite_facility_t fac, emdba.em_site_t site, emdba.em_area_t area, emdba.em_district_code_t dist, emdba.em_user_t usr
        WHERE a.site_id=pSiteID --24
        AND a.whep_fac_id=tnfac_id --100
        AND a.package_id=pPackage_ID --3
        AND a.package_type='EWHEP'
        AND a.package_status='A'
        AND fac.site_id=a.site_id
        AND fac.whep_fac_id=a.whep_fac_id
        AND site.site_id=fac.site_id
        AND site.area=area.area_code
        AND site.district_code=dist.district_code
        AND a.approval_user_id=usr.user_id(+);

    l_l_l BOOLEAN := FALSE;l_l PLS_INTEGER := 0;rec1 csr_1%ROWTYPE;

BEGIN

    OPEN csr_1;FETCH csr_1 INTO rec1;l_l_l := csr_1%FOUND;CLOSE csr_1;
    IF l_l_l = TRUE THEN
        conn := utl_smtp.open_connection(smtp_host, smtp_port);
        utl_smtp.helo(conn, smtp_host);utl_smtp.mail(conn, fromm);utl_smtp.rcpt(conn, too);utl_smtp.rcpt(conn, cc);utl_smtp.rcpt(conn, bcc);utl_smtp.open_data(conn);
        utl_smtp.write_raw_data(conn, utl_raw.cast_to_raw('From: '|| fromm || utl_tcp.CRLF));
        UTL_SMTP.write_raw_data(conn, utl_raw.cast_to_raw('To: '|| too || utl_tcp.CRLF));
        utl_smtp.write_raw_data(conn, utl_raw.cast_to_raw('Cc: '|| cc || utl_tcp.CRLF));
        utl_smtp.write_raw_data(conn, utl_raw.cast_to_raw('Cc: '|| cc2 || utl_tcp.CRLF));
        utl_smtp.write_raw_data(conn, utl_raw.cast_to_raw('Bcc: '|| bcc || utl_tcp.CRLF));

        utl_smtp.write_raw_data(conn, utl_raw.cast_to_raw('Subject: '||sub||sub3|| utl_tcp.CRLF));
        UTL_smtp.write_data(conn, 'MIME-Version: ' || '1.0' || UTL_tcp.CRLF);
        UTL_smtp.write_data(conn, 'Content-Type: ' || 'text/html; charset=utf-8'|| UTL_tcp.CRLF);
        UTL_smtp.write_data(conn, 'Content-Transfer-Encoding: ' || '"8Bit"' || UTL_tcp.CRLF);
        utl_smtp.write_data(conn,UTL_TCP.CRLF);

        p_comments_line_1 := '<h2>Hi '||toWhom||',</h2>'||crlf||'<h4>'||'Below is the site that has approved their '|| p_comments_whep ||' and their Grand total Authorized Craft Positions is more than Grand Total Estimated Positions.</h4>'||crlf||'<h3>Ready for your review.</h3>'||crlf||'<i>As of '||TO_CHAR(SYSDATE, 'MM-DD-YYYY HH24:MI:SS')||'</i>';
        UTL_SMTP.write_data(conn,UTL_tcp.CRLF|| p_comments_line_1);

        p_comments_line_2 := '<HTML><HEAD></HEAD><BODY>
            <TABLE class="MAIN" width="" cellspacing=1 cellpadding=1 align="left" border="1">
            <TBODY style="font: xx-small">
            <TH width="" scope="col">PACKAGE</TH>
            <TH width="" scope="col">AREA_NAME</TH>
            <TH width="" scope="col">DISTRICT_NAME</TH>
            <TH width="" scope="col">eMARS_SITE_ID</TH>
            <TH width="" scope="col">SITE_NAME</TH>
            <TH width="" scope="col">FACILITY_NAME</TH>
            <TH width="" scope="col">eMARS_FACILITY_ID</TH>
            <TH width="" scope="col">PARENT_SITE</TH>
            <TH width="" scope="col">ADDRESS</TH>
            <TH width="" scope="col">APPROVED_BY</TH>
            <TH width="" scope="col">APPROVED_DATE</TH>
            <TH width="" scope="col">ESTIMATED_TOTAL</TH>
            <TH width="" scope="col">AUTHORIZED_TOTAL</TH>
            ';

        UTL_smtp.write_data(conn,UTL_tcp.CRLF||p_comments_line_2);
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TR bgcolor=#FFFFD4 align="left" class="MAIN">');

        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD><FONT COLOR="red">'||'WHEP'||'</FONT></TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(rec1.area_name)||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(rec1.district_name)||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(rec1.site_id)||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(rec1.site_name)||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(rec1.FACILITY_NAME)||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(rec1.whep_fac_id)||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(rec1.subsite_default_YN)||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(rec1.address)||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(rec1.approval_name)||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||NVL(TO_CHAR(rec1.approval_date,'MM-DD-YYYY HH24:MI:SS'),'UNKNOWN')||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(TO_CHAR(rec1.grand_estimated_total))||'</TD>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<TD>'||TRIM(TO_CHAR(rec1.grand_authorized_total))||'</TD>');

        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'</TBODY></TABLE>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<hr />');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<br>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<FONT COLOR="Crimson">'||'JUSTIFICATION:'||'</FONT>');

        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<br>');
        UTL_SMTP.write_data(conn,UTL_tcp.CRLF|| NVL(TRIM(rec1.app_overage_justification),'....UNKNOWN....'));

        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<br>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<hr />');

        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'</BODY></HTML>');
        UTL_smtp.write_data(conn,UTL_tcp.CRLF||'<FONT COLOR="red" FACE="Courier New">---------END---'||'<i>As of '||TO_CHAR(SYSDATE, 'MM-DD-YYYY HH24:MI:SS')||'</i>'||'-----------</FONT> <BR>');
        utl_smtp.close_data(conn);
        utl_smtp.quit(conn);

        UPDATE emdba.em_staffing_pkg_status_t a SET a.app_overage_email_date=SYSDATE WHERE a.site_id=pSiteID AND a.whep_fac_id=tnfac_id AND a.package_id=pPackage_ID; COMMIT;
    ELSE
         NULL;
    END IF;


EXCEPTION
    WHEN UTL_smtp.transient_error OR UTL_smtp.permanent_error THEN
         UTL_SMTP.quit(conn);
    WHEN OTHERS THEN
         UTL_SMTP.quit(conn);
         DBMS_OUTPUT.put_line(sqlerrm);
END;

--------------------------------------------------------------------------------
--------------PROCEDURE save_overage_justification------------------------------
--------------AUTHOR: Michael E. Harris-----------------------------------------
--------------DATE OF CREATION: 05/16/2012--------------------------------------
--------------------------------------------------------------------------------

  PROCEDURE save_overage_justification (pSiteID IN emdba.em_subsite_facility_t.site_id%TYPE,
                                   tnfac_id IN emdba.em_subsite_facility_t.whep_fac_id%TYPE,
                                   pPackage_ID IN emdba.em_staffing_pkg_status_t.package_id%TYPE,
                                   p_Grand_Estimated_total in emdba.em_staffing_pkg_status_t.grand_estimated_total%type,
                                   p_Grand_Proposed_total in emdba.em_staffing_pkg_status_t.grand_proposed_total%type,
                                   p_Grand_Authorized_total in emdba.em_staffing_pkg_status_t.grand_authorized_total%type,
                                   p_overage_justification in emdba.em_staffing_pkg_status_t.sub_overage_justification%type default null,
                                   p_Approval_Type in varchar2 default 'S',
                                   pUser    in emdba.em_user_t.user_id%type default -1)

                                   is

       begin


            if p_Approval_Type = 'S' then

                update emdba.em_staffing_pkg_status_t a
                    set a.grand_estimated_total = p_Grand_Estimated_total,
                    a.grand_proposed_total = p_Grand_Proposed_total,
                    a.grand_authorized_total = p_Grand_Authorized_total,
                    a.sub_overage_justification = p_overage_justification,
                    a.sub_overage_flag = 'Y',
                    a.mod_date = sysdate,
                    a.mod_user = pUser
                    where a.site_id = pSiteID
                    and a.whep_fac_id = tnfac_id
                    and a.package_id = pPackage_ID
                    and a.package_type = 'EWHEP';

                else
                    update emdba.em_staffing_pkg_status_t a
                        set a.grand_authorized_total = p_Grand_Authorized_total,
                        a.grand_estimated_total = p_Grand_Estimated_total,
                        a.grand_proposed_total = p_Grand_Proposed_total,
                        a.APP_overage_justification = p_overage_justification,
                        a.app_overage_flag = 'Y',
                        a.mod_date = sysdate,
                        a.mod_user = pUser
                        where a.site_id = pSiteID
                        and a.whep_fac_id = tnfac_id
                        and a.package_id = pPackage_ID
                        and a.package_type = 'EWHEP';

            end if;

            COMMIT;
        END;



procedure restore_archived_package(pSiteid in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_Type in emdba.em_staffing_pkg_status_t.package_type%type default 'MS47',
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1)
--                            pResult out varchar2)

                            is


-- WHEP Tables

        type add_craft_tt is table of whep.whep_addnl_craft_position_bk%rowtype index by PLS_INTEGER;
        type adj_levels_tt is table of whep.whep_adjustment_levels_bk%rowtype index by pls_integer;
        type adj_tt is table of whep.whep_adjustments_bk%rowtype index by PLS_INTEGER;
       -- type approvals_tt is table of whep.whep_approvals%rowtype index by PLS_INTEGER;
        type craft_pos_tt is table of whep.whep_craft_position_bk%rowtype index by PLS_INTEGER;
        type high_bay_tt is table of whep.whep_high_bay_bk%rowtype index by PLS_INTEGER;
        type local_criteria_tt is table of whep.whep_local_criteria_bk%rowtype index by PLS_INTEGER;
        type local_criteria_levels_tt is table of whep.whep_local_criteria_levels_bk%rowtype index by PLS_INTEGER;
        type local_inv_tt is table of whep.whep_local_inventory_bk%rowtype index by PLS_INTEGER;
        type m489567_tt is table of whep.whep_m489567_bk%rowtype index by PLS_INTEGER;
        type site_summ_tt is table of whep.whep_site_summary_bk%rowtype index by PLS_INTEGER;
        type summ_tt is table of whep.whep_summary_bk%rowtype index by PLS_INTEGER;
        type summ_levels_tt is table of whep.whep_summary_levels_bk%rowtype index by PLS_INTEGER;
        type site_wkhour_reqs_tt is table of whep.whep_site_wkhour_reqs_bk%rowtype index by PLS_INTEGER;

-- eMARS Table

        type subsite_facility_tt is table of emdba.em_subsite_facility_t_bk%rowtype index by PLS_INTEGER;



        cursor tWhepTables is
        select table_name from ALL_TAB_COLUMNS where COLUMN_NAME='WHEP_FAC_ID'
        and owner = 'WHEP' AND table_name NOT LIKE 'VIEW%'
        and table_name not like '%_ARC%'
        and table_name not like '%WHEP_MAINTENANCE%'
        and table_name not like '%WHEP_THRESHOLD%'
        and table_name not like '%WHEP_APPROVALS%'
        and table_name not like '%_BK%' and table_name not in ('WHEP_ERRORS', 'WHEP_CRITERIA','WHEP_CRITERIA_UPDATE','WHEP_CRITERIA_BK','WHEP_APPROVALS_BK','QUERY_RESULTS', 'WHEP_EXCEPTIONS','WHEP_MODIFICATION_HISTORY')
        AND TABLE_NAME NOT LIKE 'V_%' AND TABLE_NAME NOT LIKE 'WHE_2C%' AND
        TABLE_NAME NOT LIKE 'WHE_MAJOR%' AND TABLE_NAME NOT LIKE 'WHEP_R_%'  AND TABLE_NAME LIKE 'WHEP_%'
        ORDER BY TABLE_NAME;


        add_craft       add_craft_tt;
        adj_levels      adj_levels_tt;
        adj             adj_tt;
       -- approvals       approvals_tt;
        craft_pos       craft_pos_tt;
        high_bay        high_bay_tt;
        local_criteria  local_criteria_tt;
        local_criteria_levels   local_criteria_levels_tt;
        local_inv       local_inv_tt;
        m489567         m489567_tt;
        site_summ       site_summ_tt;
        summary         summ_tt;
        summ_levels     summ_levels_tt;
        wkhour_reqs     site_wkhour_reqs_tt;

        facilities      subsite_facility_tt;

        reccount        integer:=0;
        v_current_pkg_id    EMDBA.em_staffing_pkg_status_t.package_id%TYPE:=0;
        v_result        varchar2(40);
        v_FieldName              varchar2(80):='';
        sql_statement           varchar(2000):='';
        v_archived_criteria_version number(4,0):=0;
        v_current_criteria_version  number(4,0):=0;

        begin

            htp.p('<?xml version="1.0"?>');

            -- First, get the current package_id
            select package_id
            into v_current_pkg_id
            from emdba.em_staffing_pkg_status_t
            where site_id = pSiteid
            and whep_fac_id = tnFac_id
            and package_type = 'EWHEP'
            AND active_flag = 'A';

           /* select distinct package_id
            into v_current_pkg_id
            from whep.whep_local_inventory
            where site_id = pSiteid
            and default_whep_fac_id = tnFac_id;*/

            -- Checking to see if the selected package is in the archive

            select count(*)
            into reccount
            from whep.whep_local_inventory_bk
            where site_id = pSiteid
            and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;


            if reccount = 0 then --Error  - This means that the selected package is

            -- not in the archive.
--              pResult := 'ARCHIVENOTFOUND';
              htp.p('<RESPONSE>ARCHIVENOTFOUND</RESPONSE>');
                return;
            end if;


            -- Before beginning the restoration process
            -- check the criteria_version of the current whep_criteria table.
            -- If the criteria_version of the archived package is not equal to the current
            -- criteria_version, then the desired package cannot be restored, because
            -- data inconsistencies would be created if it were.
/*
            -- This section was commented on 09/06/2012 at request of
            -- Mark Schwabenlender
            select criteria_version
            into v_archived_criteria_version
            from emdba.em_staffing_pkg_status_t
            where site_id = pSiteid
            and whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select distinct criteria_version
            into v_current_criteria_version
            from whep.whep_criteria;

            if v_archived_criteria_version <> v_current_criteria_version then
                htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>CRITERIA_MISMATCH</RESPONSE>');
                RETURN;
            END IF;

*/


            -- Archive the current staffing package for future editions
            --and as a safeguard

            archive_package(pSiteid, tnFac_id, 'EWHEP', v_current_pkg_id, v_result);

            IF v_result = 'ERROR' THEN
--              pResult := 'ARCHIVEERROR';
              htp.p('<RESPONSE>ARCHIVEERROR</RESPONSE>');
              RETURN;
            elsif v_result IN ('SUCCESS','ARCHIVEDUPLICATE') THEN

                update emdba.em_staffing_pkg_status_t
                set archived_date = sysdate
                where site_id = pSiteid
                and whep_fac_id = tnFac_id
                and package_type = 'EWHEP'
                and package_id = v_current_pkg_id;
                commit;
            END IF;

            -- Removing the current package
              for table_rec in tWhepTables loop

              -- Note: the "WHEP_HIGH_BAY_BK Table does not have a "default_whep_fac_id".
                    if table_rec.table_name = 'WHEP_HIGH_BAY'  THEN
                        v_FieldName := 'WHEP_FAC_ID';
                    ELSE
                        V_FieldName := 'DEFAULT_WHEP_FAC_ID';
                    END IF;
                    sql_statement := 'DELETE FROM WHEP.'||TABLE_REC.TABLE_NAME||
                    ' WHERE SITE_ID = :1 '||
                    ' AND '||v_FieldName||' = :2';
                    --' AND PACKAGE_ID = :3';
                    --PS_DYNAMIC.PLSQL(sql_statement);

                   execute immediate sql_statement
                   USING pSiteid, tnFac_id; --, pPackage_id;
                   commit;
              end loop;

              delete from emdba.em_subsite_facility_t where site_id = pSiteid
              and default_whep_fac_id = tnFac_id or
              whep_fac_id in (select whep_fac_id from emdba.em_subsite_facility_t_bk
              where site_id = pSiteid and default_whep_fac_id = tnFac_id
              and package_id = pPackage_id);
              --and package_id = pPackage_id;
              commit;

              update emdba.em_staffing_pkg_status_t
              set active_flag = 'I'
              where site_id = pSiteid
              and whep_fac_id = tnFac_id
              and package_type = 'EWHEP'
              and package_id = v_current_pkg_id;
              commit;


--              INSERTING THE SELECTED ARCHIVE PACKAGE

             -- SELECTING DATA TO BE ARCHIVED VIA BULK COLLECTS.
            -- BULK COLLECTS ARE USED FOR EFFICIENT PERFORMANCE

            select * bulk collect into add_craft from WHEP.whep_addnl_craft_position_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into adj_levels from whep.whep_adjustment_levels_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk COLLECT into adj from whep.whep_adjustments_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            /*select * bulk collect into approvals from whep.whep_approvals
            where site_id = pSiteid and whep_fac_id = tnFac_id; -- and package_id = pPackage_id;*/

            select * bulk collect into craft_pos from whep.whep_craft_position_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into high_bay from whep.whep_high_bay_bk
            where site_id = pSiteid and whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into local_criteria from whep.whep_local_criteria_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into local_criteria_levels from whep.whep_local_criteria_levels_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into local_inv from whep.whep_local_inventory_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into m489567 from whep.whep_m489567_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into site_summ from whep.whep_site_summary_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into summary from whep.whep_summary_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into summ_levels from whep.whep_summary_levels_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into wkhour_reqs from whep.whep_site_wkhour_reqs_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;

            select * bulk collect into facilities from emdba.em_subsite_facility_t_bk
            where site_id = pSiteid and default_whep_fac_id = tnFac_id
            and package_id = pPackage_id;



            forall add_craft_indx in add_craft.first .. add_craft.last
                insert into whep.whep_additional_craft_position values add_craft(add_craft_indx);

            forall adj_levels_indx in adj_levels.first .. adj_levels.last
                insert into whep.whep_adjustment_levels values adj_levels(adj_levels_indx);

            forall adj_indx in adj.first .. adj.last
                insert into whep.whep_adjustments values adj(adj_indx);

            /*forall approvals_indx in approvals.first .. approvals.last
                insert into whep.whep_approvals_bk values approvals(approvals_indx);*/
--/*
            forall craft_pos_indx in craft_pos.first ..craft_pos.last
                insert into whep.whep_craft_position values craft_pos(craft_pos_indx);

            forall high_bay_indx in high_bay.first .. high_bay.last
                insert into whep.whep_high_bay values high_bay(high_bay_indx);

            forall local_criteria_indx in local_criteria.first .. local_criteria.last
                insert into whep.whep_local_criteria values local_criteria(local_criteria_indx);

            forall local_criteria_levels_indx in local_criteria_levels.first .. local_criteria_levels.last
                insert into whep.whep_local_criteria_levels values local_criteria_levels(local_criteria_levels_indx);

            forall local_inv_indx in local_inv.first .. local_inv.last
                insert into whep.whep_local_inventory values local_inv(local_inv_indx);
--*/
            forall m489567_indx in m489567.first .. m489567.last
                insert into whep.whep_m489567 values m489567(m489567_indx);

            forall site_summ_indx in site_summ.first .. site_summ.last
                insert into whep.whep_site_summary values site_summ(site_summ_indx);

            forall summary_indx in summary.first .. summary.last
                insert into whep.whep_summary values summary(summary_indx);

            forall summary_levels_indx in summ_levels.first .. summ_levels.last
                insert into whep.whep_summary_levels values summ_levels(summary_levels_indx);

            forall wkhour_reqs_indx in wkhour_reqs.first .. wkhour_reqs.last
                insert into whep.whep_site_wkhour_reqs values wkhour_reqs(wkhour_reqs_indx);


            forall facilities_indx in facilities.first .. facilities.last
                insert into emdba.em_subsite_facility_t values facilities(facilities_indx);

              update emdba.em_staffing_pkg_status_t
              set active_flag = 'A'
              where site_id = pSiteid
              and whep_fac_id = tnFac_id
              and package_type = 'EWHEP'
              and package_id = pPackage_id;
              commit;

--              pResult := 'SUCCESS';
              htp.p('<RESPONSE>SUCCESS</RESPONSE>');

 /*      exception
          when others then
--            pResult := 'RESTOREERROR';
--            htp.p('<?xml version="1.0"?>');
            htp.p('<RESPONSE>RESTOREERROR</RESPONSE>');*/



        end;


procedure get_XML_Staffing_Pkgs_Arc(pSiteid in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_type in varchar2 default 'EWHEP')


       IS


        s_query varchar2(4000) :=   'select a.package_id "VALUE",  to_char(trunc(A.archived_date))||'' - ''||to_char(a.package_id) AS TEXT
         from emdba.em_staffing_pkg_status_t a
        where a.site_id = '||pSiteid||' and a.whep_fac_id='||tnFac_id||' and a.package_id in '||
        '(select distinct b.package_id from whep.whep_local_inventory_bk b where b.site_id = '||psiteid||
        ' and b.default_whep_fac_id = '||tnfac_id||') and a.package_type = ''EWHEP''
        order by A.ARCHIVED_DATE DESC';


/*     s_query varchar2(400) := 'SELECT whep_fac_id "VALUE", SUBSITE_ID||''-''||FACILITY_NAME AS TEXT'
         || ' FROM em_subsite_facility_t '
         || ' WHERE site_id = '||pSiteID
         || ' AND whep_enable=''Y'''
         || ' ORDER by subsite_id, facility_name';*/

     ctx dbms_xmlgen.ctxhandle;
     myxml     clob;
     vErrMsg   varchar2(1000);
     vStdErrmsg varchar2(200) := 'An error was encountered that was not caused by you. System administrators have been notified. Please try again later.';
  BEGIN

    if pPackage_type = 'MS47' then
        s_query := 'select a.package_id "VALUE",  to_char(A.archived_date) AS TEXT
         from emdba.em_staffing_pkg_status_t a
        where a.site_id = '||pSiteid||' and a.whep_fac_id='||tnFac_id||' and a.package_id in '||
        '(select distinct b.package_id from ms47.system_control_bk b where b.site_id = '||psiteid||
        ' and b.whep_fac_id = '||tnfac_id||') and a.package_type = ''MS47''
        order by A.ARCHIVED_DATE DESC';
    end if;

     ctx := dbms_xmlgen.newContext(s_query);
     myxml := dbms_xmlgen.getXML(ctx);
     htp.p(myxml);
  EXCEPTION
     WHEN others THEN
        em_error_pkg.em_error_prc;

  end;

    procedure main_menu(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pCalledFromReports in varchar2 default 'N')

                            is



             lcOpener   varchar2(30) := '';


        begin

        htp.p('<script language="javascript">');
        if pCalledFromReports = 'Y' then
           lcOpener := 'opener.opener.';
        end if;
        htp.p('function StaffingMenu() {


    var lcStatus = "Approved";




    if (ndcFlag) {
        var bldgSvcsButton = "Building Service/High Bay/FMO/MOS";
    }
    else {
        var bldgSvcsButton = "Building Service/FMO/MOS";
    }


    var lcwhepStatus = "Approved";
    var lcms47Status = "Approved";


    if ('||lcOpener||'opener.lastwhepCertStatus == ''R'') {
        lcwhepStatus = ''<font color="red">Returned by Area Mananger</font>'';
    }
    if ('||lcOpener||'opener.lastwhepCertStatus ==''A'') {
        lcwhepStatus = ''<font color="lime">Approved by Area Manager</font>'';
    }
    /* Grace added on 05/21/2013 */
    if ('||lcOpener||'opener.lastwhepCertStatus == ''ARR'') {
        lcwhepStatus = ''<font color="red">Returned by Area Reviewer</font>'';
    }
    if ('||lcOpener||'opener.lastwhepCertStatus ==''ARA'') {
        lcwhepStatus = ''<font color="lime">Reviewed by Area Reviewer</font>'';
    }
    if ('||lcOpener||'opener.lastwhepCertStatus == ''VR'') {
        lcwhepStatus = ''<font color="red">Returned by HQ Validator</font>'';
    }
    if ('||lcOpener||'opener.lastwhepCertStatus ==''VA'') {
        lcwhepStatus = ''<font color="lime">Validated by HQ Validator</font>'';
    }

    if ('||lcOpener||'opener.lastms47CertStatus == ''R'') {
        lcms47Status = ''<font color="red">Returned by Area Manager</font>'';
    }
    if ('||lcOpener||'opener.lastms47CertStatus ==''A'') {
        lcms47Status = ''<font color="lime">Approved by Area Manager</font>'';
    }
    /* Grace added on 05/21/2013 */
    if ('||lcOpener||'opener.lastms47CertStatus == ''ARR'') {
        lcms47Status = ''<font color="red">Returned by Area Reviewer</font>'';
    }
    if ('||lcOpener||'opener.lastms47CertStatus ==''ARA'') {
        lcms47Status = ''<font color="lime">Reviewed by Area Reviewer</font>'';
    }
    if ('||lcOpener||'opener.lastms47CertStatus == ''VR'') {
        lcms47Status = ''<font color="red">Returned by HQ validator</font>'';
    }
    if ('||lcOpener||'opener.lastms47CertStatus ==''VA'') {
        lcms47Status = ''<font color="lime">Validated by HQ validator</font>'';
    }
    '||lcOpener||'opener.wheppackageStatus = '||lcOpener||'opener.document.getElementById(''hidWHEPPackage_Status'').value;
    '||lcOpener||'opener.ms47packageStatus = '||lcOpener||'opener.document.getElementById(''hidMS47Package_Status'').value;



    var currentStatus = "Working";
    '||lcOpener||'opener.currentWhepStatus = "Working";
    '||lcOpener||'opener.currentMS47Status = "Working";



    switch('||lcOpener||'opener.ms47packageStatus) {
        case ''R'': {  // Approver Returned
            '||lcOpener||'opener.currentMS47Status = ''<font color="red">Area Manager Returned</font>'';
            break;
        }
        case ''A'': { //Approved
            '||lcOpener||'opener.currentMS47Status = ''<font color="lime">Area Manager Approved</font>'';
            break;
        }
        case ''C'': { // Current - Working
            '||lcOpener||'opener.currentMS47Status = ''<font color="white">Working</font>'';
            break;
        }
        case ''S'': { // Submitted
            '||lcOpener||'opener.currentMS47Status = ''<font color="yellow">Submitted</font>'';
        }
        /* Grace added on 05/21/2013 */
        case ''ARR'': { // area reviewer returned
            '||lcOpener||'opener.currentMS47Status = ''<font color="red"Area Reviewer Returned</font>'';
        }
        case ''ARA'': { // area reviewer approved
            '||lcOpener||'opener.currentMS47Status = ''<font color="lime">Area Reviewer Reviewed</font>'';
        }
        case ''VR'': { // HQ Validator returned
            '||lcOpener||'opener.currentMS47Status = ''<font color="red">HQ Validator Returned</font>'';
        }
        case ''VA'': { // HQ Validator approved
            '||lcOpener||'opener.currentMS47Status = ''<font color="lime">HQ Validator Validated</font>'';
        }
    }

    switch('||lcOpener||'opener.wheppackageStatus) {
        case ''R'': {  // Approver Returned
            '||lcOpener||'opener.currentWhepStatus = ''<font color="red">Area Manager Returned</font>'';
            break;
        }
        case ''A'': { //Approved
            '||lcOpener||'opener.currentWhepStatus = ''<font color="lime">Area Manager Approved</font>'';
            break;
        }
        case ''C'': { // Current - Working
            '||lcOpener||'opener.currentWhepStatus = ''<font color="white">Working</font>'';
            break;
        }
        case ''S'': { // Submitted
            '||lcOpener||'opener.currentWhepStatus = ''<font color="yellow">Submitted</font>'';
        }
        /* Grace Added on 05/21/2013 */
        case ''ARR'': { // area reviewer returned
            '||lcOpener||'opener.currentWhepStatus = ''<font color="red">Area Reviewer Returned</font>'';
        }
        case ''ARA'': { // area reviewer approved
            '||lcOpener||'opener.currentWhepStatus = ''<font color="lime">Area Reviewer Reviewed</font>'';
        }
        case ''VR'': { // HQ validator returned
            '||lcOpener||'opener.currentWhepStatus = ''<font color="red">HQ Validator Returned</font>'';
        }
        case ''VA'': { // HQ validator approved
            '||lcOpener||'opener.currentWhepStatus = ''<font color="lime">HQ Validator Validated</font>'';
        }
    }


   '||lcOpener||'opener.document.all.divStaffingMenu.innerHTML=
    ''<center><table cellpadding="3" cellspacing="0" width="652" height="400" border="0" id="table1" align="center" bgcolor = "#A7A400" valign="top">''+
                //<!-- MSTableType="layout" -->
''<tr height="27">''+
''<td height="27" width="315" colspan="6">''+
''<font color="black">Current WHEP Package Status: </font>''+'||lcOpener||'opener.currentWhepStatus+''</font>''+
''</td>''+
''<td>&nbsp;</td>''+
''<td height="27" width="315" colspan="4" align ="right">''+
''<font color="black">Current MS47 Package Status: </font>''+'||lcOpener||'opener.currentMS47Status+''</font>''+
''</td>''+
''</tr>''+

                ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td valign="top" colspan="6" align="right">''+
                        ''<img border="2" src="/emars-img/emarsStaffing.jpg" width="200" height="100" align="center" hspace="3"></td>''+
                        ''<td align="center">&nbsp;<input type="button" onClick=doMenu("eMS47Direct") style="background: #FFFF00; color : #FF0000;  width: 120; height:29; font-weight:bold; text-align:justify" value="Staffing Direct" /></td>''+
                        ''<td height="114">&nbsp;</td>''+
                        ''</tr>''+
                ''<tr>''+
                        ''<td></td>''+
                        ''<td></td>''+
                        ''<td></td>''+
                        ''<td></td>''+

                        ''<td></td>''+
                        ''<td></td>''+
                        ''<td></td>''+

                        ''<td></td>''+
                        ''<td height="21"></td>''+

                ''</tr>''+
                ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td height="35" valign="top" align="center" colspan="9">''+
                        ''<input type="button" onClick=doMenu("SiteInfo") style="width: 270; height:25; color: blue; font-weight:bold" value="Facility Information" /></td>''+
                ''</tr>''+
                ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td align="center" valign="top" colspan="4"><input type="button" onClick=doMenu("MailProcessingEquipment") style="width: 270; height:25; color: blue; font-weight:bold" value="Mail Processing Equipment" id="mailproc" name="mailproc" /></td>''+

                        ''<td>&nbsp;</td>''+


                       ''<td valign="top" align="center" colspan="3"><input type="button" onClick=doMenu("Postal") style="width: 270; height:25; color: blue; font-weight:bold" value="Inventory and Scheduling" /></td>''+
                        ''<td height="35">&nbsp;</td>''+
                ''</tr>''+
                 ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td align ="center" valign="top" colspan="4"><input type="button" onClick=doMenu("BldgBldgEquipment") style="width: 270; height:25; color: blue; font-weight:bold" value="Bldg & Building Equipment" id="buildequip" name="buildequip" /></td>''+
                        ''<td>&nbsp;</td>''+

                        ''<td valign="top" colspan="3"><input type="button" onClick=doMenu("Routes") style="width: 270; height:25; color: blue; font-weight:bold" value="PS Form 4776 (Routes)" id="routes" name="routes" /></td>''+
                        ''<td height="35">&nbsp;</td>''+
                ''</tr>''+
                 ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td align ="center" valign="top" colspan="4"><input type="button" onClick=doMenu("BuildingServiceFMO") style="width: 270; height:25; color: blue; font-weight:bold" value="''+bldgSvcsButton+''" id="buildsrv" name="buildsrv" /></td>''+

                        ''<td>&nbsp;</td>''+

                        ''<td valign="top" align="center" colspan="3"><input type="button" onClick=doMenu("MS47System") style="width: 270; height:25; color: blue; font-weight:bold" value="SYSTEM" /></td>''+
                        ''<td height="35">&nbsp;</td>''+
                ''</tr>''+
                 ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td align="center" valign="top" colspan="4">''+
                        ''<input type="button" onClick=doMenu("WorkSummary") style="width: 270; height:25; color: blue; font-weight:bold" value="Work Hour Summary" id="worksummary" name="worksummary" /></td>''+

                        ''<td>&nbsp;</td>''+

                        ''<td valign="top" colspan="3"><input type="button" onClick=doMenu("MS47Reports") style="width: 270; height:25; color: blue; font-weight:bold" value="MS47 Reports" /></td>''+
                        ''<td height="35">&nbsp;</td>''+
                ''</tr>''+
          ''<tr>''+
                        ''<td>&nbsp;</td>''+
            ''<td valign="top" colspan="13" align="center" height="35">''+
            ''<input type="button" onClick=doMenu("WHEPReports") style="width: 320; height:25; color: blue; font-weight:bold" value="WHEP Reports" id="whepreports" name="whepreports"/></td>''+
                ''</tr>''+

                ''<tr>''+
                        ''<td>&nbsp;</td>''+
                        ''<td>&nbsp;</td>''+
                        ''<td valign="top" align="center" colspan="10">''+
                        ''&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" onClick=doMenu("PackageCertification") style="width: 320; height:25; color: blue; font-weight:bold" value="Staffing Package Submission/Approval" id="pckgecert" name="pckgecert"/></td>''+
                       ''<td height="35" align="center">''+
                            ''<img name="nm_Help_1" id="id_Help_1" onClick="imgHelp_onClick(17);" src="/emars-img/MS47_Help.png">''+
                        ''</td>''+
                ''</tr>''+


        ''<tr>''+
        ''<td width="70">&nbsp;</td>''+
            ''<td  colspan="9" height="29">This WHEP Staffing Package was last Submitted on&nbsp; <font color="yellow">''+'||lcOpener||'opener.lastwhepSubDate+''</font>&nbsp; by &nbsp;<font color="yellow">''+'||lcOpener||'opener.lastwhepSubName+''</font>.</font></td>''+
            ''</tr>''+

        ''<tr>''+
            ''<td width="70">&nbsp;</td>''+
            ''<td colspan="9"><font style="size:8px;">This WHEP Staffing Package was last ''+lcwhepStatus+'' on&nbsp; <font color="yellow">''+'||lcOpener||'opener.lastwhepCertDate+''</font>&nbsp; by &nbsp;<font color="yellow">''+'||lcOpener||'opener.lastwhepCertName+''</font>.</font></td>''+
            ''<td width="150">&nbsp;</td>''+
            ''<tdwidth="88">&nbsp;</td>''+
            ''<td width="4" >&nbsp;</td>''+
            ''<td height="29" width="97">&nbsp;</td>''+
        ''</tr>''+

        ''<tr>''+

        ''<td width="70">&nbsp;</td>''+
            ''<td  colspan="9" height="29">This MS47 Staffing Package was last Submitted on&nbsp; <font color="yellow">''+'||lcOpener||'opener.lastms47SubDate+''</font>&nbsp; by &nbsp;<font color="yellow">''+'||lcOpener||'opener.lastms47SubName+''</font>.</font></td>''+

            ''</tr>''+
        ''<tr>+
            <td width="70">&nbsp;</td>
            <td colspan="9"><font style="size:8px;">This MS47 Staffing Package was last ''+lcms47Status+'' on&nbsp; <font color="yellow">''+'||lcOpener||'opener.lastms47CertDate+''</font>&nbsp; by &nbsp;<font color="yellow">''+'||lcOpener||'opener.lastms47CertName+''</font>.</font></td>
            <td width="150">&nbsp;</td>
            <tdwidth="88">&nbsp;</td>
            <td width="4" >&nbsp;</td>
            <td height="29" width="97">&nbsp;</td>
        </tr>
        </table></center>;
}');
         htp.p('</script>');


end;
 procedure is_area_reviewer(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            pUser in emdba.em_user_t.user_id%type default -1)


          is


          v_user_id     emdba.em_user_t.user_id%type;
          v_area        emdba.em_site_t.area%type;



          begin

            select area
            into v_area
            from emdba.em_site_t
            where site_id = pSite_id;

            if v_area = '1H' then
                v_area := '1G';
            end if;

            select user_id
            into v_user_id
            from emdba.em_user_t
            where (whep_approver = 'R' or ms47_approver = 'R')
            and area_cd = v_area;

            if pUser = v_user_id then
                  htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>Y</RESPONSE>');
            else
                 htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>N</RESPONSE>');
            end if;
        end;


procedure is_hq_validator(pUser in emdba.em_user_t.user_id%type default -1)

          is


          v_user_id     emdba.em_user_t.user_id%type;


          begin

            select user_id
            into v_user_id
            from emdba.em_user_t
            where (whep_approver = 'V' or ms47_approver = 'V');

            if pUser = v_user_id then
                  htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>Y</RESPONSE>');
            else
                 htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>N</RESPONSE>');
            end if;
        end;
/*Grace Xu added on 05/29/2013*/
procedure is_area_manager_delegate(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            pUser in emdba.em_user_t.user_id%type default -1)


          is


          v_user_id     emdba.em_user_t.user_id%type;
          v_area        emdba.em_site_t.area%type;



          begin

            select area
            into v_area
            from emdba.em_site_t
            where site_id = pSite_id;

            if v_area = '1H' then
                v_area := '1G';
            end if;

            select user_id
            into v_user_id
            from emdba.em_user_t
            where (whep_approver = 'Y' or ms47_approver = 'Y')
            and area_cd = v_area;

            if pUser = v_user_id then
                  htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>Y</RESPONSE>');
            else
                 htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>N</RESPONSE>');
            end if;
        end;
/*Grace Xu added on 05/29/2013*/
procedure get_area_reviewer_info(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            pUser in emdba.em_user_t.user_id%type default -1)


          is

          v_user_name   varchar2(100);
          v_user_email  varchar2(100);
          v_user_id     emdba.em_user_t.user_id%type;
          v_area        emdba.em_site_t.area%type;



          begin

            select area
            into v_area
            from emdba.em_site_t
            where site_id = pSite_id;

            if v_area = '1H' then
                v_area := '1G';
            end if;

            select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name, email_address, user_id
            into v_user_name, v_user_email, v_user_id
            from emdba.em_user_t
            where (whep_approver = 'R' or ms47_approver = 'R')
            and area_cd = v_area;

            htp.p('<?xml version="1.0"?>');
            htp.p('<ROW>');
            htp.p('<REVIEWERNAME>'||v_user_name||'</REVIEWERNAME>');
            HTP.P('<REVIEWEREMAIL>'||v_user_email||'</REVIEWEREMAIL>');
            HTP.P('<REVIEWERUSERID>'||TO_CHAR(v_user_id)||'</REVIEWERUSERID>');
            HTP.P('</ROW>');

        end;
/*Grace Xu added on 05/29/2013*/
        procedure get_hq_validator_info(pUser in emdba.em_user_t.user_id%type default -1)

          is

          v_user_name   varchar2(100);
          v_user_email  varchar2(100);
          v_user_id     emdba.em_user_t.user_id%type;


          begin

            select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name, email_address, user_id
            into v_user_name, v_user_email, v_user_id
            from emdba.em_user_t
            where (whep_approver = 'V' or ms47_approver = 'V');

            htp.p('<?xml version="1.0"?>');
            htp.p('<ROW>');
            htp.p('<VALIDATORNAME>'||v_user_name||'</VALIDATORNAME>');
            HTP.P('<VALIDATOREMAIL>'||v_user_email||'</VALIDATOREMAIL>');
            HTP.P('<VALIDATORUSERID>'||TO_CHAR(v_user_id)||'</VALIDATORUSERID>');
            HTP.P('</ROW>');
        end;

/* Modified set_status() with more parameters passed into procedure, Grace Xu Modified on 05/24/2013 */
procedure set_status_new(pSite_id in emdba.em_subsite_facility_t.site_id%type,
                            tnFac_id in emdba.em_subsite_facility_t.whep_fac_id%type,
                            pPackage_id in EMDBA.em_staffing_pkg_status_t.package_id%type default 1,
                            pPackage_status in emdba.em_staffing_pkg_status_t.package_status%type,
                            pComments in WHEP.whep_approvals.package_comments%type default ' ',
                            pUser in emdba.em_user_t.user_id%type default -1,
                            pApprovalDate in varchar2,
                            pPackageType in varchar2 default 'EWHEP',
                            pApproversName in whep.whep_approvals.approvers_name%type default '',
                            pApproversEmail in whep.whep_approvals.approvers_email%type default '',
                            pApproversPasswd in emdba.em_user_t.user_password%type default '',
                            pReviewersName in whep.whep_approvals.area_reviewers_name%type default '',
                            pReviewersEmail in whep.whep_approvals.area_reviewers_email%type default '',
                            pReviewersPasswd in emdba.em_user_t.user_password%type default '',
                            pValidatorsName in whep.whep_approvals.hq_validators_name%type default '',
                            pValidatorsEmail in whep.whep_approvals.hq_validators_email%type default '',
                            pValidatorsPasswd in emdba.em_user_t.user_password%type default ''
                            )
                            is

       cursor dfault_fac_id is
             select default_whep_fac_id --into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;

       cursor current_status (tcDefaultFacId in emdba.em_subsite_facility_t.default_whep_fac_id%type)
        is
            select package_status --into lcCurrentStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = tcDefaultFacId
             and package_id = pPackage_id
             AND active_flag ='A'
             and package_type = pPackageType;

     cursor current_user is
           select * --into user_rec
             from emdba.em_user_t a
             where a.user_id = pUser;

     cursor user_name is
         select TRIM(a.last_name), TRIM(a.first_name)
         --into lc_last_name, lc_first_name
         from emdba.em_user_t a
         where a.user_id = pUser;

          cursor approver is
            select TRIM(first_name) ||' '||middle_name||' '||TRIM(last_name) as USER_name,
            email_address, user_id, user_logon, user_password
            from emdba.em_user_t where USER_ID in (SELECT APPROVAL_USER_ID FROM EMDBA.EM_STAFFING_PKG_STATUS_T WHERE
            SITE_ID = pSite_id and whep_fac_id = tnFac_id and package_type = pPackageType
            and active_flag = 'A');

            cursor q_area_manager (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where a.area_cd = p_Area_id --b.area from emdba.em_site_t b where b.site_id = pSite_id) OR
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'S';

            cursor q_area_manager_delegate (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where a.area_cd = p_Area_id --b.area from emdba.em_site_t b where b.site_id = pSite_id) OR
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'Y';

            cursor q_area_reviewer (p_Area_id in emdba.em_user_t.area_cd%type) is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where a.area_cd = p_Area_id --b.area from emdba.em_site_t b where b.site_id = pSite_id) OR
                and decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'AR';

            cursor q_validator is
                select a.user_id, TRIM(a.first_name) ||' '||a.middle_name||' '||TRIM(a.last_name) as USER_name, a.email_address, user_password
                from emdba.em_user_t a
                where decode(pPackageType,'EWHEP',a.whep_approver, a.ms47_approver) = 'V';





        lnDefaultFacId      emdba.em_subsite_facility_t.default_whep_fac_id%type;
        lcCurrentStatus     emdba.em_staffing_pkg_status_t.package_status%type;
        lnNewPackageID      number;
        lcActiveFlag        varchar2(1):='A';
        USER_REC            EMDBA.EM_USER_T%ROWTYPE;
        Approver_rec        approver%rowtype;
        area_manager_rec    q_area_manager%rowtype;
        area_manager_delegate_rec q_area_manager_delegate%rowtype;
        area_reviewer_rec   q_area_reviewer%rowtype;
        validator_rec       q_validator%rowtype;
        lcManager_name      varchar2(100):='NONE';
        lcApprovers_name    varchar2(100):='';
        lcReviewers_name    varchar2(100):='';
        lcValidators_name   varchar2(100):='';
        lcStatus            emdba.em_staffing_pkg_status_t.package_status%type;
        lcPackageType       emdba.em_staffing_pkg_status_t.package_type%type;
        lc_last_name        varchar2(100);
        lc_first_name       varchar2(100);
        lcuserPassword      emdba.em_user_t.user_password%type;
        r_area_manager_rec  q_area_manager%rowtype;
        v_Response          varchar2(100);
        v_criteria_version  number(10,0):=0;
        v_area_cd           emdba.em_user_t.area_cd%type;
        v_submitters_user_id    emdba.em_user_t.user_id%type;
        v_submitters_email  whep.whep_approvals.submitters_email%type:=NULL;
        v_area_reviewer_name   varchar2(100);
        v_area_reviewer_email  varchar2(100);
        v_area_reviewer_id emdba.em_user_t.user_id%type;


        begin


        /* This procedure sets the status for the specified staffing package
            the following is the meaning for each status:
            C - Current/Working package
            S - Submitted package (Package has been submitted for review)
            R - Returned (Package has been returned to Submitter for editions and additions by area manager) ??? Grace changed
            A - Approved package (Package has been approved)
            --- The following statuses were added on 01/03/2013 ---
            ARA - Area Reviewer Approved
            ???R - Area Reviewer Returned or Area Manager Returned??? Grace changed
            ARR - Area Reviewer Returned
            VA  - HQ Validator Approved
            VR  - HQ Validator Returned

            */


             /*select default_whep_fac_id into lnDefaultFacId
             from emdba.em_subsite_facility_t
             where site_id = pSite_id
             and whep_fac_id = tnFac_id;*/
             open dfault_fac_id;
             fetch dfault_fac_id into lnDefaultFacId;
             close dfault_fac_id;


             if pPackagetype = 'EWHEP' THEN
                lcPackagetype := 'WHEP';
             ELSE
                 lcPackagetype := pPackageType;
                 lnDefaultFacId := tnFac_id;
             end if;


             /*select package_status into lcCurrentStatus
             from emdba.em_staffing_pkg_status_t
             where site_id = pSite_id
             and whep_fac_id = lnDefaultFacId
             and package_id = pPackage_id
             AND active_flag ='A'
             and package_type = pPackageType;*/

             open current_status(lnDefaultFacId);
             fetch current_status into lcCurrentStatus;
             close current_status;

             open approver;
             fetch approver into approver_rec;
             close approver;

             open current_user;
             fetch current_user into user_rec;
             close current_user;

             open user_name;
             fetch user_name into lc_last_name, lc_first_name;
             close user_name;

             select area
             into v_area_cd
             from emdba.em_site_t
             where site_id = pSite_id;

            if v_area_cd = '1H' then
                 v_area_cd := '1G';
            end if;

            open q_area_manager(v_area_cd);
            fetch q_area_manager into area_manager_rec;
            close q_area_manager;

            open q_area_manager_delegate(v_area_cd);
            fetch q_area_manager_delegate into area_manager_delegate_rec;
            close q_area_manager;

            open q_area_reviewer(v_area_cd);
            fetch q_area_reviewer into area_reviewer_rec;
            close q_area_reviewer;

            open q_validator;
            fetch q_validator into validator_rec;
            close q_validator;

            -- Grace question: is it possible the approver_rec has multiple records returned???
            if (approver_rec.user_id <> pUser and pPackage_status in ('A','R','ARA','ARR','VA','VR'))
                and (user_rec.whep_approver = 'N' and user_rec.ms47_approver = 'N') then
                htp.p('<?xml version="1.0"?>');
                htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                RETURN;
            end if;


 /*            insert into whep.hm (a,b) values ('pPackage_id',pPackage_id);
             insert into whep.hm (a,b) values ('pPackageType',pPackageType);
             insert into whep.hm (a,b) values ('pPackage_Status',pPackage_Status);
             insert into whep.hm (a,b) values ('current_status',lcCurrentStatus);
             insert into whep.hm (a,b) values ('lnDefaultFacId',lnDefaultFacId);
             COMMIT;*/

             lcStatus :=pPackage_Status;
             lnNewPackageID := pPackage_id;

            /*select * into user_rec
             from emdba.em_user_t a
             where a.user_id = pUser;*/


            select distinct criteria_version
            into v_criteria_version
            from whep.whep_criteria;

            if pPackageType = 'MS47' then
                v_criteria_version := null;
            end if;

             lcuserPassword := emapp.em_decryption_fnc(user_rec.user_password);

            -- insert into hm (a,b) values ('user_rec.whep_approver',user_rec.whep_approver);
            -- commit;

            -- If package has been approved by area manager, then check the user priv Grace added comments
            -- Grace modified the following 05/20/2013
            /* original
             if pPackage_status = 'A' then
                 if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver ='N' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                     if USER_REC.ms47_approver ='N' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 end if;
                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;
            */
            -- Grace modified 05/20/2013 if it is area manager or delegate approved
            if pPackage_status = 'A' then
                 if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver <> 'S' and USER_REC.whep_approver <> 'Y' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                     if USER_REC.ms47_approver <> 'S' and USER_REC.ms47_approver <> 'Y' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 end if;

                if lcuserPassword <> pApproversPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;

            -- Grace added 05/20/2013 if it is area reviewer approved
            if pPackage_status = 'ARA' then
                 if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver <> 'AR' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                     if USER_REC.ms47_approver <> 'AR' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 end if;
                if lcuserPassword <> pReviewersPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;

            -- Grace added 05/20/2013 if it is HQ validator approved
            if pPackage_status = 'VA' then
                 if pPackageType = 'EWHEP' then
                    if USER_REC.whep_approver <> 'V' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 else
                     if USER_REC.ms47_approver <> 'V' then
                        htp.p('<?xml version="1.0"?>');
                        htp.p('<RESPONSE>NO_PRIV</RESPONSE>');
                        RETURN;
                    end if;
                 end if;
                if lcuserPassword <> pValidatorsPasswd then
                    htp.p('<?xml version="1.0"?>');
                    htp.p('<RESPONSE>INVALID_PASSWD</RESPONSE>');
                    return;
                end if;
             end if;



             -- Approver's pass

             -- if the new status is 'S' then the lcmanager_name is the submitters name
             -- and the ApproversName is passed
             -- if the new status is 'A' then the lcmanager_name is the approvers name
             -- if the new status is 'ARA' or 'ARR' then the lcmanager_name is the reviewer's name
             -- if the new status is 'VA' or 'VR' then the lcmanager_name is the headquarters' validator's name
             -- Note: pPackage_status is the new package status

             if pPackage_status = 'S' then
                /* Grace commented the following 2 lines out 05/20/2013 they do the same thing as following 2 statements
                lcmanager_name := user_rec.First_name||' '||user_rec.Last_name; -- Submitters_name
                lcApprovers_name := pApproversName;
                */
            -- insert into whep.hm (a,b) values ('lcmanager_name',user_rec.First_name);
            -- commit;
                lcmanager_name := lc_first_name||' '||lc_last_name; -- Submitters_name
                lcReviewers_name := pReviewersName;

                v_submitters_user_id := user_rec.user_id;
                v_submitters_email := user_rec.email_address;
             /* Grace modified on 05/20/2013
                pPackage_statues is A/ARA/ARR/VA/VR/C/R
             */
             else --C') then
                 -- Grace modified, please check if the logic is correct???
                 if pPackage_status = 'ARA' or pPackage_status = 'ARR' then
                    lcmanager_name := pReviewersName;
                    lcReviewers_name := pReviewersName;
                 elsif pPackage_status = 'VA' or pPackage_status = 'VR' then
                    lcmanager_name := pValidatorsName;
                    lcValidators_name := pValidatorsName;
                 elsif pPackage_status = 'A' then
                    lcmanager_name := pApproversName;
                    lcApprovers_name := pApproversName;
                 end if;
                 -- if there is any change made to approved package, then will generate a new package
                 if lcCurrentStatus = 'A' then
                     select max(package_id)+1 into lnNewPackageID
                     from emdba.em_staffing_pkg_status_t
                     where site_id = pSite_id
                     and whep_fac_id = lnDefaultFacId
                     and package_type = pPackageType;
                 end if;

             end if;
             --Grace modified on 05/23/2013 new fields area_reviewers_name, area_reviews_email, hq_validators_name, hq_validators_email
             if pPackageType = 'EWHEP' then
                insert into WHEP.whep_approvals
                (site_id, whep_fac_id, approvaldate, create_date, create_user,
                package_status, package_id, package_comments, submitterS_NAME,
                approvers_name, approvers_email, submitters_user_id, submitters_email,
                area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email)
                values(pSite_id, lnDefaultFacId, sysdate,
                sysdate, pUser, pPackage_status ,lnNewPackageID,
                pComments, lcManager_name, lcApprovers_Name, pApproversEmail,
                v_submitters_user_id, v_submitters_email,
                lcReviewers_name, pReviewersEmail, lcValidators_name, pValidatorsEmail);
             else
                 INSERT INTO MS47.PACKAGE_CERT
                 (SITE_ID, WHEP_FAC_ID, APPROVALDATE, CREATE_DATE, USER_ID, PACKAGE_STATUS,
                 PACKAGE_ID, PACKAGE_COMMENTS, submitters_name, approvers_name,
                 approvers_email, submitters_user_id, submitters_email,
                 area_reviewers_name, area_reviewers_email, hq_validators_name, hq_validators_email)
                 VALUES (pSite_id, tnFac_id, sysdate, sysdate, pUser,
                 pPackage_status, lnNewPackageID, pComments, lcManager_name,
                 lcApprovers_name, pApproversEmail, v_submitters_user_id, v_submitters_email,
                 lcReviewers_name, pReviewersEmail, lcValidators_name, pValidatorsEmail);
                 --to_date(nvl(pApprovalDate,sysdate),'MM/DD/YYYY HH:MI AM')

            end if;
            commit;

--            if lcCurrentStatus in ('A', 'R') then
                   -- When change is made to currently approved package or the returned package, the new status is 'C';

                 -- Use this space for future code to copy current package to archives

            if (pPackage_status = 'C' and lcCurrentStatus = 'A') then
               update emdba.em_staffing_pkg_status_t
               set ACTIVE_FLAG = 'I'
               where site_id = pSite_id
               and whep_fac_id = lnDefaultFacId
               --and package_id <> lnNewPackageID;
               and package_type = pPackageType
               AND package_id <> lnNewPackageID;

               commit;

                -- When a change is made to an approved package, it is a new package.  Therefore,
                -- UPDATE THE CURRENT PACKAGE ID'S IN EACH TABLE TO THE NEW PACKAGE ID.
                 update_pkg_id(pSite_id, tnFac_id, pPackageType, lnNewPackageID);

                 if pPackageType = 'EWHEP' then
                    update whep.whep_craft_position
                    set current_quantity = approved_quantity
                    where site_id = pSite_id
                    and whep_fac_id = lnDefaultFacId;

                    update whep.whep_additional_craft_position
                    set current_quantity = approved_quantity
                    where site_id = pSite_id
                    and whep_fac_id = lnDefaultFacId;
                end if;


            end if;

             if lcCurrentStatus = 'A' then  -- If current package status is "A",
                                            -- then the package is being set to "C".
                     /*select max(package_id)+1 into lnNewPackageID
                     from emdba.em_staffing_pkg_status_t
                     where site_id = pSite_id
                     and whep_fac_id = tnFac_id
                     and package_type = pPackageType;*/

                   /*   commented on 10/19/2010 by Michael E. Harris
                        The following code was moved to a preceding section.*/
                    /* Grace commented it out, moved to beginning of procedure
                    select area
                    into v_area_cd
                    from emdba.em_site_t
                    where site_id = pSite_id;

                    if v_area_cd = '1H' then
                        v_area_cd := '1G';
                    end if;
                    */
                    /* Grace commented out
                     open q_area_manager(v_area_cd);
                     fetch q_area_manager into r_area_manager_rec;
                     close q_area_manager;
                    */
                    -- Grace Modified use area_manager_rec.user_id, when approved package changed, then create a new record with package_status = C
                     insert into emdba.em_staffing_pkg_status_t
                     (site_id, whep_fac_id, create_date, create_user, mod_date, mod_user,
                     package_status, package_id, active_flag, package_type, approval_date, approval_user_id, criteria_version)
                     values(pSite_id, lnDefaultFacId, sysdate, pUser, sysdate, pUser,
                     'C',lnNewPackageID,'A',pPackageType, null, area_manager_rec.user_id, v_criteria_version);

                     commit;
                     lcActiveFlag := 'I';
                     lcStatus := 'A';
            --Grace Modified  on 05/21/2013 added two more conditions
             elsif lcCurrentStatus = 'R' or lcCurrentStatus = 'ARR' then
                    lcActiveFlag := 'A';
                    lcStatus := 'C';
             elsif lcCurrentStatus = 'VR' then
                    lcActiveFlag := 'A';
                    lcStatus := 'S';
            END IF;




--             else

    if pPackage_status = 'A' then

        update emdba.em_staffing_pkg_status_t
        set package_status = lcStatus,
        mod_date = sysdate,
        mod_user = pUser,
        active_flag = lcActiveFlag,
        approval_date = sysdate,
        archived_date = sysdate
        --approval_user_id = pUser
        where site_id = pSite_id
        and whep_fac_id = lnDefaultFacId
        and package_id = pPackage_id
        and package_type = pPackageType;
        COMMIT;
/*        delete from whep.hm;
        commit;*/


        -- If the package status is 'A' (Approved) then archive that package.
        archive_package(pSite_id, tnFac_id, pPackageType, pPackage_id, v_Response);
        if v_Response = 'ARCHIVEDDUPLICATE' THEN
            htp.p('<?xml version="1.0"?>');
            htp.p('<RESPONSE>ARCHIVEDDUPLICATE</RESPONSE>');
            RETURN;
        END IF;

    else -- pPackage_status <> 'C' then

        if pPackage_status = 'S' and pPackageType = 'EWHEP' then
            update whep.whep_craft_position
            set approved_quantity = estimated_quantity,
            mod_date = sysdate,
            mod_user = pUser
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId;
            commit;
        end if;
        /* Grace Modified on 05/21/2013 */
            update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;
            commit;
        /*
        if pPackage_status in ('R','S') then
            update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;

        elsif pPackage_status = 'C' then

            update emdba.em_staffing_pkg_status_t
            set package_status = lcStatus,
            mod_date = sysdate,
            mod_user = pUser,
            active_flag = lcActiveFlag
            where site_id = pSite_id
            and whep_fac_id = lnDefaultFacId
            and package_id = pPackage_id
            and package_type = pPackageType;

        end if;
        */
    --  AND package_id <> lnNewPackageID;
    end if;


        commit;

        htp.p('<?xml version="1.0"?>');
        htp.p('<RESPONSE>SUCCESS</RESPONSE>');

        -- Recording package status change in modification history table.
        -- Although this is done in the respective tables - WHEP_APPROVALS, MS47.CERTIFICATION
        -- we keep another history for quality assurance purposes.
        WHEP.WHEP_WORKHOUR_SUMMARY.INSERT_INTO_HISTORY(pSite_id, lnDefaultFacId,
            'PACKAGE APPROVAL/SUBMISSION',pUser, pPackageType||' Package Status set to: '||pPackage_status);

   exception
      when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<RESPONSE>ERROR</RESPONSE>');

    end;

 procedure is_default_facility(pSiteID in emdba.em_site_t.site_id%type,
       tnFac_Id    in emdba.em_subsite_facility_t.whep_fac_id%type)
       
       is
       
       
       
       lcdefault_facility  VARCHAR2(1);
       
       begin
       
            select decode(whep_fac_id,default_whep_fac_id,'Y','N')  into lcdefault_facility
            from emdba.em_subsite_facility_t
            where site_id = pSiteID
            and whep_fac_id = tnFac_Id;
 
 
                 htp.p('<?xml version="1.0"?>');
                htp.p('<DEFAULTFAC>'||trim(lcdefault_facility)||'</DEFAULTFAC>');
           
           
      END; 

END;
/
