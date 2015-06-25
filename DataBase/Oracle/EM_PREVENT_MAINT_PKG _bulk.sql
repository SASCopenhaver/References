CREATE OR REPLACE PACKAGE EM_PREVENT_MAINT_PKG
  IS
-- Purpose: PM CATALOG Screen.
-- MODIFICATION HISTORY
-- Person              Date    Comments
-- Tehseen Khokhar     2/14/2003


-- Procedure to evoke an equipment item list for a site and classification...
  procedure em_XMLRouteList(p_subsite_id     in  varchar2 default '00',
                            p_equip_cat_ptr  in  varchar2,
                            p_equip_no       in  varchar2);

   -- Generates Routes for a supplied site, subsite, and Acro combo
  procedure em_XMLSubAcroRoute_List(pSite      IN  VARCHAR2
                                    ,pSubSite  IN  VARCHAR2
                                    ,pAcronym  IN  VARCHAR2
                                    ,pFreqInd  IN  CHAR      DEFAULT NULL);

   -- Procedure to evoke an equipment item list for a site and classification...
  procedure em_XMLEquipList(psiteid in em_site_t.site_id%type,p_equip_cat_ptr   in  varchar2);

  -- Procedure to get equip no based equipment_cat_ptr from em_equipment_t for a site ..
  procedure em_XMLEquipListAdd(psiteid in em_site_t.site_id%type,p_equip_cat_ptr in  varchar2);

   -- Get the screen data based via GO
  procedure em_XMLPMScreen(p_equip_cat_ptr   in  varchar2 default null,
                           p_equip_no        in  varchar2 default null,
                           p_route_no        in varchar2  default null);

  -- Get the screen data via find.
  procedure em_XMLPMFind(p_route_ptr    in varchar2 default null);

-- TO retrive acronym/equipment class from em_route_t
  procedure em_XMLEquipClassifList(p_subsite_id in em_subsite_t.subsite_id%type default '00');

  -- save PM data...
  function  em_save_pm return varchar2;

  -- delete PM data...
  procedure em_delete_pm;

 -- DD for Route status.
  procedure em_XMLRouteStatusList;

-- suspend/activate by Acronym.
   procedure em_getAcronymList(pSiteID in varchar2);

-- suspend/activate by Equipment.
   procedure em_getEquipList(pSiteID in varchar2);

-- suspend/activate by Routes.
   procedure em_getrouteList(pSiteID in varchar2);

-- get the count of acronym
  procedure em_acronymcount(p_type in varchar2,psiteid in varchar2);
-- Activate/Deactivate
   procedure em_acronymprocess(pSiteID in varchar2 default null,
                               p_subsite_id in varchar2 default null ,
                               p_equip_cat_ptr in varchar2 default null ,
                               p_acronym    in varchar2 default null ,
                               p_class      in varchar2 default null,
                               p_fr         in varchar2 default null,
                               p_process    in varchar2 default null,
                               p_ap         in varchar2 default null,
                               p_wk         in varchar2 default null,
                               p_equip_no   in varchar2 default null,
                               p_route_no   in varchar2 default null,
                               p_aer        in varchar2 default null);
  procedure em_XMLGetCompleteAcroList;

-- check if any work orders are open in em_wo_t
procedure em_woexist(psiteid in  em_site_t.site_id%type,p_route_no in em_wo_t.route_no%type);

-- get a list of checklist
procedure em_XMLCheckList;

-- get a list of checklists for a supplied acronym and site...
procedure em_XMLAcroCheckList(pAcronym  IN  em_acronym_t.acronym%TYPE
                                           ,pSiteID in  em_site_t.site_id%type DEFAULT vm_global_pks.g_currentsiteid);

-- get a list of Routes with (SubSite and Acronym)s...
procedure em_XMLRouteAcroList(pSiteID  IN  em_site_t.site_id%type DEFAULT vm_global_pks.g_currentsiteid);


-- get a list of Equipment Numbers and PM Frequencies for a supplied route...
procedure em_XMLRouteEqpNbrList(pSiteID        IN  em_site_t.site_id%TYPE     DEFAULT vm_global_pks.g_currentsiteid
                                ,pRouteNbr    IN  em_route_t.route_no%TYPE
                                ,pSubSiteID   IN  em_route_t.subsite_id%TYPE  DEFAULT NULL
                                ,pAcronym     IN  em_acronym_t.acronym%TYPE   DEFAULT NULL
                                ,pSubSiteInd  IN  CHAR                        DEFAULT NULL
                                ,pAcroInd     IN  CHAR                        DEFAULT NULL);


-- Builds a addpm search dialog. Dialog returns the Oracle rowid of the selected work order...
procedure em_getPMData (pSite in  em_wo_t.site_id%type default null,
                           pType in  em_route_t.route_status_code%type default null,
                           pSubsite in em_route_t.subsite_id%type default null
                          );
vTotalRowCount   number := 0;

procedure em_XMLGetAcroListEquipCnt(pSiteID   in  em_site_t.site_id%type,
                                      pSubsite in em_subsite_t.subsite_id%type);

-- Returns an XML list of work codes...
procedure em_getXMLWorkCodeList;

-- Returns the 1st list of data to graph for the manager reports...
procedure em_getReportData1;

-- Returns the 2nd list of data to graph for the manager reports...
procedure em_getReportData2;

 -- Returns the 3rd list of data to graph for the manager reports...
procedure em_getReportData3;

-- Returns the 4th list of data to graph for the manager reports...
procedure em_getReportData4;

-- Returns the list to order by for the manager reports...
procedure em_getReport_OrderBy;

-- check for the unique row in em_route_t table
procedure checkemroutet
(
pSiteID     in em_route_t.site_id%type default null,
pSubsiteID  in em_route_t.subsite_id%type default null,
pRouteNo    in em_route_t.route_no%type default null,
pPmFreq     in em_route_t.pm_freq_code%type default null,
pWC         in em_route_t.work_code%type default null,
p_addequip_no_h in em_route_t.work_code%type default null,
p_equip_no_h    in em_route_t.work_code%type default null,
p_class_code_h  in em_route_t.work_code%type default null,
p_req_4772      in em_route_t.work_code%type default null
);

-- 2011.6.14 Jesse, activate a route as user request
PROCEDURE re_activate_route(
	p_siteid in em_route_t.site_id%type,
	p_routeptr in em_route_t.route_ptr%type
);

-- Evokes an XML list of crews based on the tour...
procedure em_XMLCrewList(pSiteID in em_site_t.site_id%type, pTour in em_crew_t.tour%type);

-- Returns an XML list of employee level codes...
procedure em_XMLEmpLevelList;

END; -- Package Specification EM_PREVENT_MAINT_PKG
/
CREATE OR REPLACE PACKAGE BODY EM_PREVENT_MAINT_PKG
IS
-- Purpose: PM CATALOG Screen.
-- MODIFICATION HISTORY
-- Person              Date    Comments
-- Tehseen Khokhar     2/14/2003
-- $Header: /EMARS/Development/Database/Schemas/EMAPP/EMAPP.EM_PREVENT_MAINT_PKG.PBK 11    1/12/12 8:35a Jesse $
  ctx dbms_xmlgen.ctxhandle;
  myxml     varchar2(4000);
  vErrMsg   varchar2(1000);

-- Evokes an XML list of crews...
   procedure em_XMLCrewList(pSiteID in em_site_t.site_id%type, pTour in em_crew_t.tour%type) is
    cursor ccrews is
       select crew_id "VALUE", crew_id "TEXT", crew_status_code "ACTIVE"
        from em_crew_t
        where site_id = psiteid
        and tour = pTour
        and CREW_STATUS_CODE = 'A'
        order by crew_id;
   begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
      htp.p('<ROW>');
       htp.p('<VALUE></VALUE>');
       htp.p('<TEXT></TEXT>');
       htp.p('</ROW>');
     for crews in ccrews loop
       htp.p('<ROW>');
       htp.p('<VALUE>'||crews.VALUE||'</VALUE>');
       htp.prn('<TEXT>'||em_replace_chars(crews.TEXT));
       if crews.ACTIVE = 'I' THEN
          htp.prn(' (INACTIVE)');
       end if;
       htp.p('</TEXT>');
       htp.p('</ROW>');
     end loop;
     htp.p('</ROWSET>');
   end em_XMLCrewList;

-- check if any work orders are open in em_wo_t
procedure em_woexist(psiteid in em_site_t.site_id%type,p_route_no in em_wo_t.route_no%type) is
  cursor csr_routecnt is
  select route_ptr from em_wo_t
  where site_id = psiteid
  and route_ptr = p_route_no
  and wo_status = 'O' and wo_type_code='S';

  l_route_no em_route_t.route_ptr%type;
  n_route_no PLS_INTEGER :=0;
  retval boolean;
begin
  open   csr_routecnt;
  fetch csr_routecnt into l_route_no;
    retval := csr_routecnt%FOUND;
  close csr_routecnt;
  if retval = true then
    n_route_no := 1;
  end if;
  htp.p('<?xml version="1.0"?>');
  htp.p('<ROUTECOUNT>'||n_route_no||'</ROUTECOUNT>');
exception
  when others then
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROUTECOUNT>-1</ROUTECOUNT>');
end;

-- delete PM data...
procedure em_delete_pm  is
  vsqlmsg  varchar2(200);

  cursor csr_duedate is
  select ap,wk,END_DATE from em_ap_calendar_t
  where trunc(sysdate) between start_date and end_date;

  l_csr_duedate csr_duedate%rowtype;
begin
  open csr_duedate;
  fetch csr_duedate into l_csr_duedate;
  close csr_duedate;

  update em_route_t
    set
    delete_ap     =   l_csr_duedate.ap,
    delete_wk     =   l_csr_duedate.wk,
    effective_wk = null,effective_ap=null,effective_status=null,
    sus_start_ap =null, sus_start_wk=null,sus_end_ap=null,sus_end_wk=null,
    route_status_code   =   'D',
    mod_date      =   sysdate,
    mod_user      =   vm_global_pks.g_current_userid
    where route_ptr = vm_utility_pkg.getarrval('p_route_ptr')
    and site_id =  vm_global_pks.g_currentsiteid;

    update em_wo_t
    set date_due = l_csr_duedate.END_DATE, mod_date=sysdate,
       mod_user=vm_global_pks.g_current_userid
    where site_id =    vm_global_pks.g_currentsiteid AND wo_type_code='S' and
     route_ptr = vm_utility_pkg.getarrval('p_route_ptr')
     ;
    commit;

exception
  when others  then
     em_error_pkg.em_ErrorInsert_prc;
     raise;
end;

-- check for the unique row in em_route_t table
procedure checkemroutet
(
pSiteID     in em_route_t.site_id%type default null,
pSubsiteID  in em_route_t.subsite_id%type default null,
pRouteNo    in em_route_t.route_no%type default null,
pPmFreq     in em_route_t.pm_freq_code%type default null,
pWC         in em_route_t.work_code%type default null,
p_addequip_no_h in em_route_t.work_code%type default null,
p_equip_no_h    in em_route_t.work_code%type default null,
p_class_code_h  in em_route_t.work_code%type default null,
p_req_4772      in em_route_t.work_code%type default null
) is
--pSiteID&pSubsiteID&pRouteNo&pPmFreq&pWC);
cursor csr_chkpm(pEquipNo in varchar2,pEquipCatPtr in varchar2) is
  -- Jesse 2011.6.14 select 1 from em_route_t where
  select route_ptr from em_route_t
  where site_id = pSiteID and
  	subsite_id = pSubsiteID  and
  	route_no = pRouteNo and
  	equip_no = pEquipNo and
  	equip_cat_ptr = pEquipCatPtr and
  	pm_freq_code = pPmFreq and
  	work_code = pWC;

  --l_n  PLS_INTEGER :=0; Jesse 2011.6.14 return the route_ptr if it exists
  v_route_ptr number := 0;
  l_found PLS_INTEGER :=1;

  cursor csr_equip_no(p1 in varchar2) is
    select equip_no,equip_cat_ptr,equipment_ptr from em_equipment_t
    where site_id=pSiteID and equipment_ptr = p1;

  l_equip_no csr_equip_no%rowtype;
  v_equip_cat_ptr em_wo_t.equip_cat_ptr%type;
  v_equip_no em_wo_t.equip_no%type;
  l_equip em_wo_t.equip_no%type;
begin
         if p_req_4772= 'Y' then
           if p_addequip_no_h is not null then
              l_equip := p_addequip_no_h;
           else
              l_equip := p_equip_no_h;
           end if;
           open csr_equip_no(l_equip);
           fetch csr_equip_no into l_equip_no;
           close csr_equip_no;
            v_equip_cat_ptr:=l_equip_no.equip_cat_ptr;
            v_equip_no :=l_equip_no.equip_no;
         else
            v_equip_cat_ptr:=p_class_code_h;
           if p_addequip_no_h is not null then
              v_equip_no := p_addequip_no_h;
           else
              v_equip_no := p_equip_no_h;
           end if;
         end if;
  open csr_chkpm(v_equip_no,v_equip_cat_ptr);
  fetch csr_chkpm into v_route_ptr; -- l_n;
  if csr_chkpm%notfound then
     -- jesse 2011.6.14 l_found := 4;
	 v_route_ptr := 0;
  end if;
  close csr_chkpm;
  htp.p('<?xml version="1.0"?>');
  --Jesse 2011.6.14 htp.p('<PMCHK>'||l_found||'</PMCHK>');
  htp.p('<PMCHK>' || v_route_ptr || '</PMCHK>');
exception
  when others then
    htp.p('<?xml version="1.0" ?>');
    --htp.p('<PMCHK>'||l_found||'</PMCHK>');
	htp.p('<PMCHK>' || v_route_ptr || '</PMCHK>');
end;

-- 2011.6.14 Jesse, activate a route as user request
PROCEDURE re_activate_route(
	p_siteid in em_route_t.site_id%type,
	p_routeptr in em_route_t.route_ptr%type
)
IS

BEGIN
	update em_route_t
	set route_status_code = 'A',
		mod_date = sysdate,
		mod_user = -1
	where site_id = p_siteid
		and route_ptr = p_routeptr
		and route_status_code <> 'A';

	commit;

	htp.p('<?xml version="1.0" ?>');
	htp.p('<route_ptr>1</route_ptr>');
EXCEPTION
	when others then
    htp.p('<?xml version="1.0" ?>');
	htp.p('<route_ptr>0</route_ptr>');
END;

-- save PM data...
function  em_save_pm return varchar2 is
    vsqlmsg  varchar2(200);
    l_row_id varchar2(30) := 'XXX';
    l_route_ptr em_route_t.route_ptr%type;

    cursor csr_em_route_t(pSiteID in em_site_t.site_id%type, p_routr_ptr in em_route_t.route_ptr%type)  is
    select * from em_route_t
    where site_id = pSiteID
    and route_ptr = p_routr_ptr;

    l_csr_em_route_t    csr_em_route_t%rowtype;

    cursor csr_equip_no(p1 in varchar2) is
    select equip_no,equip_cat_ptr,equipment_ptr from em_equipment_t where equipment_ptr =p1;

    l_equip_no csr_equip_no%rowtype;

    v_equip_cat_ptr em_wo_t.equip_cat_ptr%type;
    v_equip_no em_wo_t.equip_no%type;
    v_equipment_ptr em_wo_t.equipment_ptr%type :='';
   begin
    if vm_utility_pkg.getarrval('mode') in ('add') then
         if vm_utility_pkg.getarrval('req_4772') = 'Y' then
           open csr_equip_no(vm_utility_pkg.getarrval('addequip_no_h'));
           fetch csr_equip_no into l_equip_no;
           close csr_equip_no;
            v_equip_cat_ptr:=l_equip_no.equip_cat_ptr;
            v_equip_no :=l_equip_no.equip_no;
            v_equipment_ptr := l_equip_no.equipment_ptr;
         else
            v_equip_cat_ptr:=vm_utility_pkg.getarrval('class_code_h');
            v_equip_no :=vm_utility_pkg.getarrval('addequip_no_h');
         end if;

        select em_route_ptr_seq.nextval into l_route_ptr from dual;
        insert into em_route_t
        (
        route_ptr,
        subsite_id,
        work_code,
        site_id,
        effective_ap,
        pm_freq_code,
        route_no,
        labor_group_code,
        route_status_code,
        schedule_ap,
        schedule_wk,
        schedule_day,
        tour,
        est_hours,
        crew_id,
        rsr_code,
        checklist_type_code,
        checklist_no,
        labor_class_code,
        equip_cat_ptr,
        equip_no,
        equipment_ptr,
        pm_comments,
        emp_level_code,
        sus_start_ap,
        sus_start_wk,
        sus_end_ap,
        sus_end_wk,
        effective_wk,
        sched_day,
        sched_wk,
        sched_ap,
        create_date,
        create_user,
        mod_date,
        mod_user,
        effective_status
        )
        values
        (
        l_route_ptr,
        vm_utility_pkg.getarrval('addsubsite_id'),
        vm_utility_pkg.getarrval('work_code'),
        vm_global_pks.g_currentsiteid,
        vm_utility_pkg.getarrval('effective_ap'),
        vm_utility_pkg.getarrval('pm_freq_code'),
        vm_utility_pkg.getarrval('addroute'),
        vm_utility_pkg.getarrval('labor_group_code'),
        --'I',
        vm_utility_pkg.getarrval('route_status_code'),
        vm_utility_pkg.getarrval('schedule_ap'),
        vm_utility_pkg.getarrval('schedule_wk'),
        vm_utility_pkg.getarrval('schedule_day'),
        vm_utility_pkg.getarrval('tour'),
        vm_utility_pkg.getarrval('est_hours'),
        vm_utility_pkg.getarrval('crew_id'),
        vm_utility_pkg.getarrval('rsr_code'),
        vm_utility_pkg.getarrval('checklist_type_code'),
        vm_utility_pkg.getarrval('checklist_no'),
        vm_utility_pkg.getarrval('labor_class_code'),
        v_equip_cat_ptr,---vm_utility_pkg.getarrval('addacronym'),  -- equip_cat_ptr
        -- upper added 12/03/04 cp
        upper(v_equip_no),---vm_utility_pkg.getarrval('addequip_no_h'), ---tk
        v_equipment_ptr,
        upper(vm_utility_pkg.getarrval('pm_comments')),
        vm_utility_pkg.getarrval('emp_level_code'),
        vm_utility_pkg.getarrval('sus_start_ap'),
        vm_utility_pkg.getarrval('sus_start_wk'),
        vm_utility_pkg.getarrval('sus_end_ap'),
        vm_utility_pkg.getarrval('sus_end_wk'),
        vm_utility_pkg.getarrval('effective_wk'),
        vm_utility_pkg.getarrval('sched_day'),
        vm_utility_pkg.getarrval('sched_wk'),
        vm_utility_pkg.getarrval('sched_ap'),
        sysdate,
        vm_global_pks.g_current_userid,
        sysdate,
        vm_global_pks.g_current_userid,
        'A'
        );
        select EM_ROWID_ENC(rowid) into l_row_id from em_route_t where route_ptr =  l_route_ptr;
        return l_row_id;
     else
       open csr_em_route_t(vm_global_pks.g_currentsiteid,vm_utility_pkg.getarrval('edit_route_ptr'));
       fetch csr_em_route_t into l_csr_em_route_t;
       close csr_em_route_t;
       insert into em_route_history_t
       (
       site_id,
       change_date,
       route_ptr,
       subsite_id,
       route_no,
       work_code,
       equip_cat_ptr,
       equip_no,
       pm_freq_code,
       labor_group_code,
       old_labor_group_code,
       route_status_code,
       tour,
       old_tour,
       crew_id,
       old_crew_id,
       equipment_ptr,
       effective_day,
       old_effective_day,
       effective_ap,
       old_effective_ap,
       sched_ap,
       old_sched_ap,
       sched_wk,
       old_sched_wk,
       sched_day,
       old_sched_day,
       sched_tour,
       old_sched_tour,
       est_hours,
       old_est_hours,
       rsr_code,
       old_rsr_code,
       checklist_type_code,
       old_checklist_type_code,
       checklist_no,
       old_checklist_no,
       labor_class_code,
       old_labor_class_code,
       emp_level_code,
       old_emp_level_code,
       sus_start_ap,
       old_sus_start_ap,
       sus_start_wk,
       old_sus_start_wk,
       sus_end_ap,
       old_sus_end_ap,
       sus_end_wk,
       old_sus_end_wk,
       effective_wk,
       old_effective_wk,
       schedule_ap,
       old_schedule_ap,
       schedule_wk,
       old_schedule_wk,
       schedule_day,
       old_schedule_day,
       delete_ap,
       old_delete_ap,
       delete_wk,
       old_delete_wk,
       pm_comments,
       old_pm_comments,
       last_status,
       old_last_status,
       schedule_fy,
       old_schedule_fy,
       work_qty,
       old_work_qty,
       create_date,
       create_user,
       mod_date,
       mod_user
             )
       values
       (
       vm_global_pks.g_currentsiteid,
       sysdate,
       l_csr_em_route_t.route_ptr,
       l_csr_em_route_t.subsite_id,
       l_csr_em_route_t.route_no,
       l_csr_em_route_t.work_code,
       l_csr_em_route_t.equip_cat_ptr,
       -- upper added 12/03/04 cp
       upper(l_csr_em_route_t.equip_no),
       vm_utility_pkg.getarrval('pm_freq_code'),
       vm_utility_pkg.getarrval('labor_group_code'),
       l_csr_em_route_t.labor_group_code,
       l_csr_em_route_t.route_status_code,
       vm_utility_pkg.getarrval('tour'),
       l_csr_em_route_t.tour,
       vm_utility_pkg.getarrval('crew_id'),
       l_csr_em_route_t.crew_id,
       l_csr_em_route_t.equipment_ptr,
       l_csr_em_route_t.effective_day,  -- ?
       l_csr_em_route_t.effective_day,
       vm_utility_pkg.getarrval('effective_ap'),
       l_csr_em_route_t.effective_ap,
       l_csr_em_route_t.sched_ap,            --?
       l_csr_em_route_t.sched_ap,
       l_csr_em_route_t.sched_wk,        --?
       l_csr_em_route_t.sched_wk,
       l_csr_em_route_t.sched_day,       --?
       l_csr_em_route_t.sched_day,
       l_csr_em_route_t.sched_tour,      --?
       l_csr_em_route_t.sched_tour,
       vm_utility_pkg.getarrval('est_hours'),
       l_csr_em_route_t.est_hours,
       vm_utility_pkg.getarrval('rsr_code'),
       l_csr_em_route_t.rsr_code,
       vm_utility_pkg.getarrval('checklist_type_code'),
       l_csr_em_route_t.checklist_type_code,
       vm_utility_pkg.getarrval('checklist_no'),
       l_csr_em_route_t.checklist_no,
       vm_utility_pkg.getarrval('labor_class_code'),
       l_csr_em_route_t.labor_class_code,
       vm_utility_pkg.getarrval('emp_level_code'),
       l_csr_em_route_t.emp_level_code,
       vm_utility_pkg.getarrval('sus_start_ap'),
       l_csr_em_route_t.sus_start_ap,
       vm_utility_pkg.getarrval('sus_start_wk'),
       l_csr_em_route_t.sus_start_wk,
       vm_utility_pkg.getarrval('sus_end_ap'),
       l_csr_em_route_t.sus_end_ap,
       vm_utility_pkg.getarrval('sus_end_wk'),
       l_csr_em_route_t.sus_end_wk,
       vm_utility_pkg.getarrval('effective_wk'),
       l_csr_em_route_t.effective_wk,
       vm_utility_pkg.getarrval('schedule_ap'),
       l_csr_em_route_t.schedule_ap,
       vm_utility_pkg.getarrval('schedule_wk'),
       l_csr_em_route_t.schedule_wk,
       vm_utility_pkg.getarrval('schedule_day'),
       l_csr_em_route_t.schedule_day,
       l_csr_em_route_t.delete_ap,--?
       l_csr_em_route_t.delete_ap,
       l_csr_em_route_t.delete_wk,   --?
       l_csr_em_route_t.delete_wk,
       upper(vm_utility_pkg.getarrval('pm_comments')),
       upper(l_csr_em_route_t.pm_comments),
       l_csr_em_route_t.last_status,                    --?
       l_csr_em_route_t.last_status,
       l_csr_em_route_t.schedule_fy,                    --?
       l_csr_em_route_t.schedule_fy,
       l_csr_em_route_t.work_qty,     --?
       l_csr_em_route_t.work_qty,
       l_csr_em_route_t.create_date,
       l_csr_em_route_t.create_user,
       sysdate,
       vm_global_pks.g_current_userid
       );
       update em_route_t
       set
        work_code           =   vm_utility_pkg.getarrval('work_code'),
        effective_ap        =   vm_utility_pkg.getarrval('effective_ap'),
        pm_freq_code        =   vm_utility_pkg.getarrval('pm_freq_code'),
        labor_group_code    =   vm_utility_pkg.getarrval('labor_group_code'),
        route_status_code   =   vm_utility_pkg.getarrval('route_status_code'),
        schedule_ap         =   vm_utility_pkg.getarrval('schedule_ap'),
        schedule_wk         =   vm_utility_pkg.getarrval('schedule_wk'),
        schedule_day        =   vm_utility_pkg.getarrval('schedule_day'),
        tour                =  vm_utility_pkg.getarrval('tour'),
        est_hours           =   vm_utility_pkg.getarrval('est_hours'),
        crew_id             =   vm_utility_pkg.getarrval('crew_id'),
        rsr_code            =   vm_utility_pkg.getarrval('rsr_code'),
        checklist_type_code =   vm_utility_pkg.getarrval('checklist_type_code'),
        checklist_no        =   vm_utility_pkg.getarrval('checklist_no'),
        labor_class_code    =   vm_utility_pkg.getarrval('labor_class_code'),
        pm_comments         =   upper(vm_utility_pkg.getarrval('pm_comments')),
        emp_level_code      =   vm_utility_pkg.getarrval('emp_level_code'),
        sus_start_ap        =   vm_utility_pkg.getarrval('sus_start_ap'),
        sus_start_wk        =   vm_utility_pkg.getarrval('sus_start_wk'),
        sus_end_ap          =   vm_utility_pkg.getarrval('sus_end_ap'),
        sus_end_wk          =   vm_utility_pkg.getarrval('sus_end_wk'),
        effective_wk        =   vm_utility_pkg.getarrval('effective_wk'),
        sched_ap            =   vm_utility_pkg.getarrval('sched_ap'),      ----GSM fixed from '1111111111111'
        sched_wk            =   vm_utility_pkg.getarrval('sched_wk'),
        sched_day           =   vm_utility_pkg.getarrval('sched_day'),
        mod_date            =   sysdate,
        mod_user            =   vm_global_pks.g_current_userid
       where
         site_id = vm_global_pks.g_currentsiteid and route_ptr = vm_utility_pkg.getarrval('edit_route_ptr');

       /*
        (route_no = vm_utility_pkg.getarrval('findroute_no') or route_no = vm_utility_pkg.getarrval('route')) and
        (equip_cat_ptr = vm_utility_pkg.getarrval('findacronym') or equip_cat_ptr = vm_utility_pkg.getarrval('editecp')) and
        (equip_no = vm_utility_pkg.getarrval('findequip_no') or equip_no = vm_utility_pkg.getarrval('equip_no')) and
        site_id = vm_global_pks.g_currentsiteid;
        */
       return 'Y';
     end if;

     commit;
     exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
    end;

-- Procedure to evoke an equipment item list for a site and classification
  procedure em_XMLRouteList(p_subsite_id     in  varchar2 default '00',
                            p_equip_cat_ptr  in  varchar2,
                            p_equip_no       in  varchar2) is
      s_query constant varchar2(400) :=
         'select distinct route_no "VALUE", route_no "TEXT" '
         ||' from em_route_t '
         ||' where equip_cat_ptr = '||p_equip_cat_ptr
         ||' and subsite_id  = '||p_subsite_id
         ||' and equip_no      = '''||p_equip_no||'''';
-- tk. 5/24/2004.
     cursor cRoutes is
         select distinct route_no "VALUE", route_no "TEXT"
         from em_route_t
         where equip_cat_ptr =p_equip_cat_ptr
         and subsite_id  = p_subsite_id
         and equip_no      = p_equip_no;

  begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      for cur_rec in cRoutes loop
         htp.p('<ROW>');
         htp.p('<VALUE>'||cur_rec.value||'</VALUE>');
         htp.p('<TEXT>'||cur_rec.text||'</TEXT>');
         htp.p('</ROW>');
      end loop;
      htp.p('</ROWSET>');
  --   ctx := dbms_xmlgen.newContext(s_query);
  --   myxml := dbms_xmlgen.getXML(ctx);
  --   htp.p(myxml);
  end em_XMLRouteList;

  -- Generates Routes for a supplied site, subsite, and Acro combo
  procedure em_XMLSubAcroRoute_List(pSite      IN  VARCHAR2
                                    ,pSubSite  IN  VARCHAR2
                                    ,pAcronym  IN  VARCHAR2
                                    ,pFreqInd  IN  CHAR     DEFAULT NULL) is

  CURSOR cRoutes IS
    select DISTINCT rte.route_no VALUE,  rte.route_no || NVL2(pFreqInd, ' ( Freq: ' || rte.pm_freq_code || ')', NULL) TEXT
      from em_route_t    rte,
           em_acronym_t  acr
    where rte.equip_cat_ptr = acr.equip_cat_ptr
      and rte.site_id    = pSite
      and rte.subsite_id = pSubSite
      and acr.acronym    = pAcronym;

   begin

      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      for cur_rec in cRoutes loop
         htp.p('<ROW>');
         htp.p('<VALUE>'||cur_rec.value||'</VALUE>');
         htp.p('<TEXT>'||cur_rec.text||'</TEXT>');
         htp.p('</ROW>');
      end loop;
      htp.p('</ROWSET>');
   end em_XMLSubAcroRoute_List;

-- Procedure to evoke an equipment item list for a site ..
  procedure em_XMLEquipList(psiteid in em_site_t.site_id%type,p_equip_cat_ptr   in  varchar2) is
      cursor cEquip is
         select distinct equip_no "VALUE", equip_no "TEXT"
          from em_route_t where site_id = psiteid
          and equip_cat_ptr = p_equip_cat_ptr;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for cur_rec in cEquip loop
         htp.p('<ROW>');
         htp.p('<VALUE>'||cur_rec.value||'</VALUE>');
         htp.p('<TEXT>'||cur_rec.text||'</TEXT>');
         htp.p('</ROW>');
     end loop;
     htp.p('</ROWSET>');
  end em_XMLEquipList;

-- Procedure to get equip no based equipment_cat_ptr from em_equipment_t for a site ..
  procedure em_XMLEquipListAdd(psiteid in em_site_t.site_id%type,p_equip_cat_ptr   in  varchar2) is
   cursor cEquip is
     select equip_no "VALUE", equip_no "TEXT"
        from em_equipment_t
        where site_id = pSiteID
         and equip_cat_ptr = p_equip_cat_ptr
         and equip_status_code = 'A';
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for cur_rec in cEquip loop
         htp.p('<ROW>');
         htp.p('<VALUE>'||cur_rec.value||'</VALUE>');
         htp.p('<TEXT>'||cur_rec.text||'</TEXT>');
         htp.p('</ROW>');
     end loop;
     htp.p('</ROWSET>');
  end em_XMLEquipListAdd;

 -- Builds a addpm search dialog. Dialog returns the Oracle rowid of the selected order...
   procedure em_getPMData (pSite in  em_wo_t.site_id%type default null,
                           pType in  em_route_t.route_status_code%type default null,
                           pSubsite in em_route_t.subsite_id%type default null
                          ) is
      type woRefCurType is ref cursor;
      woRefCur woRefCurType;
      vThisRow   number default 0;
      vNumRows   number default 0;

      type woRecType is record (
         subsite_id em_route_t.subsite_id%type,
         acronym    em_acronym_t.acronym%type,
         equip_no   em_equipment_t.equip_no%type,
         class_code      em_acronym_t.class_code%type,
         route_no   em_route_t.route_no%type,
         pm_freq_code  em_route_t.pm_freq_code%type,
         checklist_no  em_route_t.checklist_no%type,
         checklist_type_code em_route_t.checklist_type_code%type,
         est_hours em_route_t.est_hours%type,
         route_status_code em_route_t.route_status_code%type,
         delete_ap  em_route_t.delete_ap%type,
         delete_wk em_route_t.delete_wk%type,
         row_id     rowid );
--      recWOType woRecType;

      vSQL  varchar2(500);
      vBGColor varchar2(12) := 'WHITE';
     type v_rectbl is table of woRecType;
     recWOType v_rectbl;

     cursor c_em_ap_calendar_t is
     select ap,wk
     from em_ap_calendar_t
     where trunc(start_date) <= trunc(sysdate)
     and trunc(end_date) >= trunc(sysdate);

     l_apwk   c_em_ap_calendar_t%rowtype;
     l_worow boolean := false;
   begin
      open c_em_ap_calendar_t;
      fetch c_em_ap_calendar_t into l_apwk;
      close c_em_ap_calendar_t;

      htp.p('<body scroll="no" bgcolor="silver">');
      htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
      htp.p('<script language="javascript">');
      htp.p('window.status="Ready to begin work order search."');
      htp.p('function clickFunction(col,row) { ');
      htp.p('   var srow=document.all.wogrid.getSelRow();');
      htp.p('   if (srow==0) { return } ');
      htp.p('   var vThisRow=document.all.wogrid.getCellText(11, srow);');
      htp.p('   opener.gopm(vThisRow);');
      htp.p('   self.close();');
--      htp.p('   self.close();');
      htp.p('}');
--      htp.p('setTimeout("setRowCount()", 1500);');
      htp.p('function setRowCount() {');
      htp.p('  window.status=document.all.wogrid.getNumRows()+" work orders found."');
      htp.p('}');
      htp.p('</script>');
      htp.p('</body>');
           vSQL :=
           'select  subsite_id, acronym,equip_no,class_code,route_no,pm_freq_code,nvl(checklist_no,''0''),'||
           ' nvl(checklist_type_code,''0''),nvl(est_hours,''0''),nvl(route_status_code,''0''),delete_ap,delete_wk,EM_ROWID_ENC(a.rowid) '||
           ' from em_route_t a, em_acronym_t b '||
           ' where b.equip_cat_ptr=a.equip_cat_ptr '||
           ' and  a.site_id = '||pSite||
           '  and b.site_id = '||pSite ||' and route_status_code !=''D''' ;
      if pSubsite is not null then
         vSQL := vSQL||' and subsite_id = '||pSubsite;
      end if;
      if pType is not null then
         vSQL := vSQL||' and  route_status_code = '''||pType||'''';
      end if;
      vSQL := vSQL||' order by subsite_id,acronym,lpad(equip_no,10,''0''),lpad(route_no,15,''0'')';

      execute immediate vsql bulk collect into recWOType;

      vm_utility_pkg.startGrid('wogrid');
      htp.p('<param name="numcols" value="11"/>');
      htp.p('<param name="colheadertext" value="Sub Site,Acronym,Equip. No.,Class Code,Route No.,Freq., Checklist No.,Type,Est. Hours,Status,rowid"/>');
      -- 2011.8.18 jesse htp.p('<param name="colwidths" value="30,100,40,40,40,40,40,40,30,40,0"/>');
	  htp.p('<param name="colwidths" value="60,100,60,80,60,40,100,40,80,60,0"/>');
      htp.p('<param name="sortcolumns" value="1,2,3,4,5,6,7,8,9,10,11"/>');
      htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
      htp.p('<param name="cellsreleasedfunction" value="selRow" />');
      htp.p('<param name="urlframe" value="dummyframe">');
      htp.p('<param name="clickFunction" value="clickFunction" />');
      for i in 1..recWOType.count loop
         if NVL(recWOType(i).delete_ap,0) < l_apwk.ap then
           l_worow :=true;
         end if;
         if ((nvl(recWOType(i).delete_ap,0) = l_apwk.ap) and ( nvl(recWOType(i).delete_wk,0) < l_apwk.wk)) then
           l_worow :=true;
         end if;
         if l_worow  then
           vThisRow := vNumRows + 1;
           htp.p('<param name="row'||vThisRow||'text" value="');
           htp.p(recWOType(i).subsite_id||','||recWOType(i).acronym||','||recWOType(i).equip_no||','||
             recWOType(i).class_code||','||recWOType(i).route_no||','||recWOType(i).pm_freq_code||','||
             recWOType(i).checklist_no||','||recWOType(i).checklist_type_code||','||recWOType(i).est_hours||','||
             recWOType(i).route_status_code||','||recWOType(i).row_id||'"></param>');
           vNumRows := vNumRows + 1;
         end if;
      end loop;
      htp.p('<param name="numrows" value="'||vNumRows||'" />');
      htp.p('</div>');
      vTotalRowCount := vNumRows;
      htp.BodyClose;
   exception
      when others then
         em_error_pkg.em_ErrorInsert_prc;
         raise;
   end em_getPMData;
  -- Get the screen data via find.
  procedure em_XMLPMFind(p_route_ptr in varchar2 default null)
     is
      s_query constant varchar2(4000) :=
         'select route_ptr, route_ptr as edit_route_ptr,route_status_code,subsite_id ,acronym||'' - ''||class_code as acronym , b.equip_cat_ptr as editecp, equip_no ,route_no as route,pm_freq_code, checklist_no, checklist_type_code, effective_ap, effective_wk, schedule_ap, '
         ||'  schedule_wk,work_code, schedule_day, tour , crew_id, est_hours, rsr_code, labor_group_code, delete_ap, delete_wk, '
         ||' labor_class_code, emp_level_code, pm_comments, sus_start_ap, sus_start_wk, sus_end_ap, '
         ||' sus_end_wk, sched_ap, sched_wk, sched_day, nvl(a.ecbm_active,''N'') as ecbm_active '
         ||' from em_route_t a, em_acronym_t b '
         ||' where a.equip_cat_ptr = b.equip_cat_ptr '
         || ' and  a.rowid = :p1';
--         || ' and  a.rowid = '''||EM_ROWID_DEC(p_route_ptr)||'''';
    type csr_ref is ref cursor;
    csr_route csr_ref;

    type c_routeRecord is record
    (
      route_ptr em_route_t.route_ptr%type,
      edit_route_ptr em_route_t.route_ptr%type,
      route_status_code em_route_t.route_status_code%type,
      subsite_id em_route_t.subsite_id%type,
      acronym varchar2(2000),
      editecp em_route_t.equip_cat_ptr%type,
      equip_no em_route_t.equip_no%type,
      route em_route_t.route_no%type,
      pm_freq_code em_route_t.pm_freq_code%type,
      checklist_no em_route_t.checklist_no%type,
      checklist_type_code em_route_t.checklist_type_code%type,
      effective_ap em_route_t.effective_ap%type,
      effective_wk em_route_t.effective_wk%type,
      schedule_ap em_route_t.schedule_ap%type,
      schedule_wk em_route_t.schedule_wk%type,
      work_code em_route_t.work_code%type,
      schedule_day em_route_t.schedule_day%type,
      tour em_route_t.tour%type,
      crew_id em_route_t.crew_id%type,
      est_hours em_route_t.est_hours%type,
      rsr_code em_route_t.rsr_code%type,
      labor_group_code em_route_t.labor_group_code%type,
      delete_ap em_route_t.delete_ap%type,
      delete_wk em_route_t.delete_wk%type,
      labor_class_code em_route_t.labor_class_code%type,
      emp_level_code em_route_t.emp_level_code%type,
      pm_comments em_route_t.pm_comments%type,
      sus_start_ap em_route_t.sus_start_ap%type,
      sus_start_wk em_route_t.sus_start_wk%type,
      sus_end_ap em_route_t.sus_end_ap%type,
      sus_end_wk em_route_t.sus_end_wk%type,
      sched_ap em_route_t.sched_ap%type,
      sched_wk em_route_t.sched_wk%type,
      sched_day em_route_t.sched_day%type,
      ecbm_active em_route_t.ecbm_active%type
    );
    c_roureRec  c_routeRecord;
   begin
    open csr_route for s_query using EM_ROWID_DEC(p_route_ptr);
    fetch csr_route into c_roureRec;
    close csr_route;
    htp.p('<?xml version="1.0"?>');
    htp.p('<ROWSET>');
        htp.p('<ROW>');
        htp.p('<ecbm_active>'||c_roureRec.ecbm_active||'</ecbm_active>');
        htp.p('<route_ptr>'||c_roureRec.route_ptr||'</route_ptr>');
        htp.p('<edit_route_ptr>'||c_roureRec.edit_route_ptr||'</edit_route_ptr>');
        htp.p('<route_status_code>'||c_roureRec.route_status_code||'</route_status_code>');
        htp.p('<subsite_id>'||c_roureRec.subsite_id||'</subsite_id>');
        htp.p('<acronym>'||c_roureRec.acronym||'</acronym>');
        htp.p('<editecp>'||c_roureRec.editecp||'</editecp>');
        htp.p('<equip_no>'||c_roureRec.equip_no||'</equip_no>');
        htp.p('<route>'||c_roureRec.route||'</route>');
        htp.p('<pm_freq_code>'||c_roureRec.pm_freq_code||'</pm_freq_code>');
        htp.p('<checklist_no>'||c_roureRec.checklist_no||'</checklist_no>');
        htp.p('<checklist_type_code>'||c_roureRec.checklist_type_code||'</checklist_type_code>');
        htp.p('<effective_ap>'||c_roureRec.effective_ap||'</effective_ap>');
        htp.p('<effective_wk>'||c_roureRec.effective_wk||'</effective_wk>');
        htp.p('<schedule_ap>'||c_roureRec.schedule_ap||'</schedule_ap>');
        htp.p('<schedule_wk>'||c_roureRec.schedule_wk||'</schedule_wk>');
        htp.p('<work_code>'||c_roureRec.work_code||'</work_code>');
        htp.p('<schedule_day>'||c_roureRec.schedule_day||'</schedule_day>');
        htp.p('<tour>'||c_roureRec.tour||'</tour>');
        htp.p('<crew_id>'||c_roureRec.crew_id||'</crew_id>');
        htp.p('<est_hours>'||c_roureRec.est_hours||'</est_hours>');
        htp.p('<rsr_code>'||c_roureRec.rsr_code||'</rsr_code>');
        htp.p('<labor_group_code>'||c_roureRec.labor_group_code||'</labor_group_code>');
        htp.p('<delete_ap>'||c_roureRec.delete_ap||'</delete_ap>');
        htp.p('<delete_wk>'||c_roureRec.delete_wk||'</delete_wk>');
        htp.p('<labor_class_code>'||c_roureRec.labor_class_code||'</labor_class_code>');
        htp.p('<emp_level_code>'||c_roureRec.emp_level_code||'</emp_level_code>');
        htp.p('<pm_comments>'||em_replace_chars(c_roureRec.pm_comments)||'</pm_comments>');
        htp.p('<sus_start_ap>'||c_roureRec.sus_start_ap||'</sus_start_ap>');
        htp.p('<sus_start_wk>'||c_roureRec.sus_start_wk||'</sus_start_wk>');
        htp.p('<sus_end_ap>'||c_roureRec.sus_end_ap||'</sus_end_ap>');
        htp.p('<sus_end_wk>'||c_roureRec.sus_end_wk||'</sus_end_wk>');
        htp.p('<sched_ap>'||c_roureRec.sched_ap||'</sched_ap>');
        htp.p('<sched_wk>'||c_roureRec.sched_wk||'</sched_wk>');
        htp.p('<sched_day>'||c_roureRec.sched_day||'</sched_day>');
        htp.p('</ROW>');
      htp.p('</ROWSET>');
--      ctx := dbms_xmlgen.newContext(s_query);
--     myxml := dbms_xmlgen.getXML(ctx);
--     htp.p(myxml);
  exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
  end ;

  -- Procedure to retrive data for PM screen via GO.. Tehseen: I do not think this code is been used. Will not
  --change to bind variables etc. 5/25/2004.
  procedure em_XMLPMScreen(p_equip_cat_ptr   in  varchar2 default null,
                           p_equip_no        in  varchar2 default null,
                           p_route_no        in varchar2  default null
                          ) is

      s_query constant varchar2(400) :=
         'select route_status_code,pm_freq_code, checklist_no, checklist_type_code, effective_ap, effective_wk, schedule_ap, '
         ||' schedule_wk,  schedule_day, tour, crew_id, est_hours, rsr_code, labor_group_code, '
         || ' labor_class_code, emp_level_code, pm_comments, sus_start_ap, sus_start_wk, sus_end_ap, '
         || ' sus_end_wk '
         ||' from em_route_t '
         || ' where site_id = vm_global_pks.g_currentSiteID '
         ||' and route_no = '||p_route_no
         ||' and equip_cat_ptr = '||p_equip_cat_ptr
         ||' and equip_no = '''||p_equip_no||'''';
  begin
     ctx := dbms_xmlgen.newContext(s_query);
     myxml := dbms_xmlgen.getXML(ctx);
     htp.p(myxml);
  end em_XMLPMScreen;


-- TO retrive acronym/equipment class from em_route_t
  procedure em_XMLEquipClassifList(p_subsite_id in em_subsite_t.subsite_id%type default '00') is
     cursor c_route is
         select distinct b.equip_cat_ptr "VALUE", b.acronym||'  '||b.class_code||' - '||b.acronym_desc "TEXT"
          from em_route_t a, em_acronym_t b
          where a.equip_cat_ptr = b.equip_cat_ptr
          and a.site_id = vm_global_pks.g_currentSiteID
          and a.subsite_id = p_subsite_id;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for cur_rec in c_route loop
         htp.p('<ROW>');
         htp.p('<VALUE>'||cur_rec.value||'</VALUE>');
         htp.p('<TEXT>'||cur_rec.text||'</TEXT>');
         htp.p('</ROW>');
     end loop;
     htp.p('</ROWSET>');

  end em_XMLEquipClassifList;

 -- DD for Route status.
  procedure em_XMLRouteStatusList is
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     htp.p('   <ROW>');
     htp.p('    <VALUE>A</VALUE>');
     htp.p('    <TEXT>A - Active</TEXT>');
     htp.p('   </ROW>');
     htp.p('   <ROW>');
     htp.p('    <VALUE>I</VALUE>');
     htp.p('    <TEXT>I - Suspended</TEXT>');
     htp.p('   </ROW>');
     htp.p('   <ROW>');
     htp.p('    <VALUE>D</VALUE>');
     htp.p('    <TEXT>D - Deleted</TEXT>');
     htp.p('   </ROW>');
     htp.p('</ROWSET>');
  end em_XMLRouteStatusList;

-- get the count of acronym
  procedure em_acronymcount(p_type in varchar2,psiteid in varchar2) is
    n_ACRONYMCOUNT   PLS_INTEGER := 0;
  begin
     if p_type = 'A' then
       SELECT count(*) into n_acronymcount from
       (select distinct subsite_id,a.equip_cat_ptr from em_route_t a where a.site_id = pSiteID );
      elsif p_type = 'E' then
       SELECT count(*) into n_acronymcount from
         (select distinct a.equip_cat_ptr, subsite_id,equip_no from em_route_t a where a.site_id = pSiteID );
      elsif p_type = 'R' then
       SELECT count(*) into n_acronymcount from
         (select distinct a.equip_cat_ptr,subsite_id,equip_no, route_no,pm_freq_code,route_status_code,route_status_code from em_route_t a  where a.site_id = psiteid);
      end if;
     htp.p('<?xml version="1.0"?>');
     htp.p('<ACRONYMCOUNT>'||n_acronymcount||'</ACRONYMCOUNT>');
  exception
     when others then
         htp.p('<?xml version="1.0"?>');
         htp.p('<ACRONYMCOUNT>-1</ACRONYMCOUNT>');
  end;
-- suspend/activate by Acronym.
   procedure em_getAcronymList(pSiteID in varchar2) is
     vNumRow number :=80;
   begin
      htp.p('ect'||chr(9)||'SubSite'||chr(9)||'Acronym'||chr(9)||'Class');
      for rReg
         in (select distinct subsite_id, acronym,class_code,a.equip_cat_ptr as equip_cat_ptr
               from em_route_t a, em_acronym_t b
              where a.equip_cat_ptr=b.equip_cat_ptr
                and a.site_id = pSiteID
                and nvl(b.ecbm_active,'N') <> 'Y'
                and b.site_id = pSiteID
           order by subsite_id,acronym)
      loop
         htp.p(rReg.equip_cat_ptr||chr(9)||rReg.subsite_id||chr(9)||rReg.acronym||chr(9)||rReg.class_code);
      end loop;
   end em_getAcronymList;

-- suspend/activate by Equipment.
   procedure em_getEquipList(pSiteID in varchar2) is
   begin
      htp.p('ect'||chr(9)||'SubSite'||chr(9)||'Acronym'||chr(9)||'Class Code'||chr(9)||'Equip No');
      for rReg
        in (select distinct a.equip_cat_ptr as equip_cat_ptr, subsite_id,acronym, class_code, equip_no
              from em_route_t a, em_acronym_t b
             where a.equip_cat_ptr=b.equip_cat_ptr
               and a.site_id = pSiteID
               and b.site_id = pSiteID
               and nvl(b.ecbm_active,'N') <> 'Y'
          order by subsite_id,acronym,lpad(equip_no,10,'0'))
      loop
         htp.p(rReg.equip_cat_ptr||chr(9)||rReg.subsite_id||chr(9)||rReg.acronym||chr(9)||rReg.class_code||chr(9)||rReg.equip_no);
      end loop;

   end em_getEquipList;

-- suspend/activate by Routes.
   procedure em_getRouteList(pSiteID in varchar2) is
   begin
      htp.p('ect'||chr(9)||'SubSite'||chr(9)||'Acronym'||chr(9)||'Class Code'||chr(9)||'Equip No'||chr(9)||'Route NO'||chr(9)||'Freq Code'||chr(9)||'Status'||chr(9)||'Status Desc');
      for rReg in
          (select distinct a.equip_cat_ptr as equip_cat_ptr,
                  subsite_id,acronym,class_code,equip_no, route_no,pm_freq_code,
                  decode(route_status_code,'A','6','I','5','') as route_status_number,
                  decode(effective_status,'A', 'Re-Active Pending','I','Suspension Pending',null,
                  decode(route_status_code,'A','Activated','I','Suspended',''),'UNKNOWN') as route_status_desc
             from em_route_t a, em_acronym_t b
            where a.equip_cat_ptr=b.equip_cat_ptr
              and a.site_id = pSiteID
              and b.site_id = pSiteID
              and route_status_code !='D'
              and nvl(b.ecbm_active,'N') <> 'Y'
         order by subsite_id, acronym, lpad(equip_no,10,'0'), pm_freq_code, lpad(route_no,10,'0'))
     loop
         htp.p(rReg.equip_cat_ptr||chr(9)||rReg.subsite_id||chr(9)||rReg.acronym||chr(9)||
            rReg.class_code||chr(9)||rReg.equip_no||chr(9)||rReg.route_no||chr(9)||
            rReg.pm_freq_code||chr(9)||rReg.route_status_number||chr(9)||rReg.route_status_desc);
      end loop;
   end em_getRouteList;

-- Acronym
   procedure em_acronymprocess(pSiteID in varchar2 default null,
                               p_subsite_id in varchar2 default null ,
                               p_equip_cat_ptr in varchar2 default null ,
                               p_acronym    in varchar2 default null ,
                               p_class      in varchar2 default null ,
                               p_fr         in varchar2 default null,
                               p_process    in varchar2 default null,
                               p_ap         in varchar2 default null,
                               p_wk         in varchar2 default null,
                               p_equip_no   in varchar2 default null,
                               p_route_no   in varchar2 default null,
                               p_aer        in varchar2 default null) is

   -- Cursor to get equip_cat_ptr based on acronym and class
    CURSOR c_em_acronym_t(p_a in varchar2, p_c in varchar2) is
    select equip_cat_ptr
    from em_acronym_t
    where acronym=p_a
    and class_code = p_c;

    l_equip_cat_ptr em_acronym_t.equip_cat_ptr%type;

    CURSOR c_em_ap_calendar_t is
    select ap,wk
    from em_ap_calendar_t
    where trunc(start_date) <= trunc(sysdate)
    and trunc(end_date) >= trunc(sysdate);

    l_em_ap_calendar_t   c_em_ap_calendar_t%rowtype;

    l_ap em_ap_calendar_t.ap%type ;
    l_wk em_ap_calendar_t.wk%type ;
    ls_ap em_ap_calendar_t.ap%type ;
    ls_wk em_ap_calendar_t.wk%type ;

-- subsite
    TYPE SS IS TABLE OF em_route_t.subsite_id%type INDEX BY BINARY_INTEGER;
    s_arr SS;
    ss_i number;
    iss number :=1;
    v_s_ind number:=1;
    v_s varchar2(4000);

-- equip cat ptr
    TYPE pcr IS TABLE OF em_acronym_t.equip_cat_ptr%type INDEX BY BINARY_INTEGER;
    p_arr pcr;
    ip number :=1;
    v_p_ind number:=1;
    v_p varchar2(4000);

-- acronym
    TYPE acr IS TABLE OF em_acronym_t.acronym%type INDEX BY BINARY_INTEGER;
    a_arr acr;
    ia number :=1;
    v_a_ind number:=1;
    v_a varchar2(4000);

-- class
    TYPE class IS TABLE OF em_acronym_t.class_code%type INDEX BY BINARY_INTEGER;
    c_arr class;
    ic number :=1;
    v_c_ind number:=1;
    v_c varchar2(4000);

-- equip no
    TYPE equip IS TABLE OF em_equipment_t.equip_no%type INDEX BY BINARY_INTEGER;
    e_arr equip;
    ie number :=1;
    v_e_ind number:=1;
    v_e varchar2(4000);

-- route no
    TYPE route IS TABLE OF em_route_t.route_no%type INDEX BY BINARY_INTEGER;
    r_arr route;
    ir number :=1;
    v_r_ind number:=1;
    v_r varchar2(4000);

-- frequency
    TYPE fr IS TABLE OF em_route_t.PM_FREQ_CODE%type INDEX BY BINARY_INTEGER;
    fr_arr fr;
    ifr number :=1;
    v_fr_ind number:=1;
    v_fr varchar2(4000);


BEGIN
      v_s := p_subsite_id;
      WHILE v_s_ind != 0 LOOP
          v_s_ind := INSTR(v_s, ',',1,1);
          if v_s_ind = 0 then
            s_arr(iss) := v_s;
            exit ;
          end if;
          s_arr(iss) := substr(v_s,1,v_s_ind-1);
          v_s := substr(v_s,v_s_ind+1,length(v_s));
          iss := iss + 1;
      END LOOP;

-- equip cat ptr
      v_p := p_equip_cat_ptr;

      WHILE v_p_ind != 0 LOOP
          v_p_ind := INSTR(v_p, ',',1,1);
          if v_p_ind = 0 then
            p_arr(ip) := v_p;
            exit ;
          end if;
          p_arr(ip) := substr(v_p,1,v_p_ind-1);
          v_p := substr(v_p,v_p_ind+1,length(v_p));
          ip := ip + 1;
      END LOOP;

-- acronym
      v_a := p_acronym;
      WHILE v_a_ind != 0 LOOP
          v_a_ind := INSTR(v_a, ',',1,1);
          if v_a_ind = 0 then
            a_arr(ia) := v_a;
            exit ;
          end if;
          a_arr(ia) := substr(v_a,1,v_a_ind-1);
          v_a := substr(v_a,v_a_ind+1,length(v_a));
          ia := ia + 1;
      END LOOP;
-- class
      v_c := p_class;
      WHILE v_c_ind != 0 LOOP
          v_c_ind := INSTR(v_c, ',',1,1);
          if v_c_ind = 0 then
            c_arr(ic) := v_c;
            exit ;
          end if;
          c_arr(ic) := substr(v_c,1,v_c_ind-1);
          v_c := substr(v_c,v_c_ind+1,length(v_c));
          ic := ic + 1;
      END LOOP;

-- equipment
      v_e := p_equip_no;
      WHILE v_e_ind != 0 LOOP
          v_e_ind := INSTR(v_e, ',',1,1);
          if v_e_ind = 0 then
            e_arr(ie) := v_e;
            exit ;
          end if;
          e_arr(ie) := substr(v_e,1,v_e_ind-1);
          v_e := substr(v_e,v_e_ind+1,length(v_e));
          ie := ie + 1;
      END LOOP;

-- route no
      v_r := p_route_no;
      WHILE v_r_ind != 0 LOOP
          v_r_ind := INSTR(v_r,',',1,1);
          if v_r_ind = 0 then
            r_arr(ir) := v_r;
            exit ;
          end if;
          r_arr(ir) := substr(v_r,1,v_r_ind-1);
          v_r := substr(v_r,v_r_ind+1,length(v_r));
          ir := ir + 1;
      END LOOP;
-- PM_FREQ_CODE
      v_fr := p_fr;
      WHILE v_fr_ind != 0 LOOP
          v_fr_ind := INSTR(v_fr,',',1,1);
          if v_fr_ind = 0 then
            fr_arr(ifr) := v_fr;
            exit ;
          end if;
          fr_arr(ifr) := substr(v_fr,1,v_fr_ind-1);
          v_fr := substr(v_fr,v_fr_ind+1,length(v_fr));
          ifr := ifr + 1;
      END LOOP;

    ls_ap := p_ap;
    ls_wk := p_wk;
      --RSD get the current ap and wk if the selected ones are this week
      --we need to update immediatley
      open c_em_ap_calendar_t;
      fetch c_em_ap_calendar_t into l_em_ap_calendar_t;
      close c_em_ap_calendar_t;

           -- use current ap and wk if none is selected.
    if (ls_ap = '-1') or (ls_wk = '-1') then
      ls_ap := l_em_ap_calendar_t.ap;
      ls_wk := l_em_ap_calendar_t.wk;
    end if;
    l_ap := l_em_ap_calendar_t.ap;
    l_wk := l_em_ap_calendar_t.wk;
    ss_i := 0;
    --7/28/04 RSD added effective_status, is it this week logic logic.
    if p_aer = 'A' then
     if p_process = 'A' then
          for   ss_i in 1..s_arr.count loop
           if ls_ap=l_ap and ls_wk=l_wk then
             update em_route_t set route_status_code='A',
             effective_status= null,effective_ap=null, effective_wk = null,
             mod_date=sysdate, mod_user =0
            where site_id = pSiteID and
              subsite_id = s_arr(ss_i)  and
              equip_cat_ptr = p_arr(ss_i);
           else
             update em_route_t
             set effective_status= 'A',effective_ap=ls_ap, effective_wk = ls_wk,
             mod_date=sysdate, mod_user =0
            where site_id = pSiteID and
              subsite_id = s_arr(ss_i)  and
              equip_cat_ptr = p_arr(ss_i);
          end if;
        end loop;
       else
          for  ss_i in 1..s_arr.count loop
            if ls_ap=l_ap and ls_wk=l_wk then
             update em_route_t
             set route_status_code='I',  effective_status= null,effective_ap=null, effective_wk = null,
             mod_date=sysdate, mod_user =0
            where site_id = pSiteID and
              subsite_id = s_arr(ss_i)  and
              equip_cat_ptr = p_arr(ss_i);
           else
            update em_route_t
            set effective_status='I',effective_ap=ls_ap, effective_wk=ls_wk,
             mod_date=sysdate, mod_user =0
            where site_id = pSiteID and subsite_id = s_arr(ss_i) and
            equip_cat_ptr = p_arr(ss_i);
           end if;
          end loop;
        end if;
    elsif p_aer = 'E' then
       if p_process = 'A' then
          for ss_i in 1..s_arr.count loop
           if ls_ap=l_ap and ls_wk=l_wk then
               update em_route_t
               set route_status_code='A',  effective_status= null,effective_ap=null, effective_wk = null,
               mod_date=sysdate, mod_user =0
               where site_id = pSiteID and
                subsite_id = s_arr(ss_i)  and
                equip_cat_ptr = p_arr(ss_i) and
               upper(equip_no) = upper(e_arr(ss_i));
            else
              update em_route_t
              set effective_status='A',effective_ap = l_ap,effective_wk = l_wk,
              mod_date=sysdate, mod_user =0
              where site_id = pSiteID and subsite_id = s_arr(ss_i)  and
              equip_cat_ptr = p_arr(ss_i) and
             upper(equip_no) = upper(e_arr(ss_i));
            end if;
         end loop;
       else  -- p_process = 'I'
          for ss_i in 1..s_arr.count loop
           if ls_ap=l_ap and ls_wk=l_wk then
             update em_route_t
             set route_status_code='I', effective_status= null,effective_ap=null, effective_wk = null,
              mod_date=sysdate, mod_user=0
             where site_id = pSiteID and
              subsite_id = s_arr(ss_i)  and
              equip_cat_ptr = p_arr(ss_i) and
             upper(equip_no) = upper(e_arr(ss_i));
--em_error_pkg.em_log_prc(s_arr(ss_i)||'s_arr '||p_arr(ss_i)||'p_arr '||e_arr(ss_i)||'e_arr','TEST');
           else
             update em_route_t
             set effective_status='I',
             effective_ap = l_ap, effective_wk = l_wk,
             mod_date=sysdate, mod_user =0
             where site_id = pSiteID and subsite_id = s_arr(ss_i)  and
             equip_cat_ptr = p_arr(ss_i) and
             upper(equip_no) = upper(e_arr(ss_i));
           end if;
         end loop;
      end if;
    commit; --Note this needed to be here for some reason does not make sense but leave it
    elsif p_aer = 'R' then
       if p_process = 'A' then
          for ss_i in 1..s_arr.count loop
            if ls_ap=l_ap and ls_wk=l_wk then
             update em_route_t
             set route_status_code='A', effective_status= null,effective_ap=null, effective_wk = null,
             mod_date=sysdate, mod_user =0
            where site_id = pSiteID and
              subsite_id = s_arr(ss_i)  and
              equip_cat_ptr = p_arr(ss_i) and
               upper(equip_no) = upper(e_arr(ss_i)) and
              route_no = r_arr(ss_i) and
              pm_freq_code=fr_arr(ss_i);
           else
            update em_route_t
            set effective_status='A',effective_ap=ls_ap,effective_wk=ls_wk,
              mod_date=sysdate, mod_user =0
            where site_id = pSiteID and subsite_id = s_arr(ss_i)  and
            equip_cat_ptr = p_arr(ss_i) and
            upper(equip_no) = upper(e_arr(ss_i)) and
            route_no = r_arr(ss_i) and
            pm_freq_code=fr_arr(ss_i);
          end if;
         end loop;
        else --p_process='I'
          for  ss_i in 1..s_arr.count loop
           if ls_ap=l_ap and ls_wk=l_wk then
              update em_route_t
              set route_status_code='I', effective_status=null,effective_ap=null, effective_wk = null,
               mod_date=sysdate, mod_user =0
              where site_id = pSiteID and
                 subsite_id = s_arr(ss_i)  and
                 equip_cat_ptr = p_arr(ss_i) and
                 equip_no = e_arr(ss_i) and
                 route_no = r_arr(ss_i) and
                 pm_freq_code=fr_arr(ss_i);
           else
                update em_route_t
                set effective_status='I', effective_ap = ls_ap,effective_wk = ls_wk,
                mod_date=sysdate, mod_user =0
                where site_id = pSiteID and subsite_id = s_arr(ss_i)  and
                equip_cat_ptr = p_arr(ss_i) and
                upper(equip_no) = upper(e_arr(ss_i)) and
                route_no = r_arr(ss_i) and
                pm_freq_code=fr_arr(ss_i);
           end if;
         end loop;
        end if;
    end if;
   commit;

   exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end em_acronymprocess;

  -- Get a list of all acronyms...
  procedure em_XMLGetCompleteAcroList is
    cursor cAcronyms is
         select distinct b.equip_cat_ptr VALUE, b.acronym||'  '||b.class_code||' - '||replace(b.acronym_desc,'&','&amp;') TEXT
          from em_acronym_t b where site_id = vm_global_pks.g_currentSiteID order by TEXT;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rAcronyms in cAcronyms loop
     htp.p('   <ROW>');
     htp.p('    <VALUE>'||rAcronyms.value||'</VALUE>');
     htp.p('    <TEXT>'||rAcronyms.text||'</TEXT>');
     htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;


 -- get a list of checklist
  procedure em_XMLCheckList is
     cursor checklist is
     select distinct checklist_no||' '||'-'||' '||checklist_type_code VALUE, checklist_no||'-'||checklist_type_code TEXT from em_route_t
     where site_id = vm_global_pks.g_currentSiteID;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rlist in checklist loop
     htp.p('   <ROW>');
     htp.p('    <VALUE>'||rlist.value||'</VALUE>');
     htp.p('    <TEXT>'||rlist.text||'</TEXT>');
     htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end em_XMLCheckList;


 -- get a list of checklists for a supplied acronym and site...
procedure em_XMLAcroCheckList(pAcronym  IN  em_acronym_t.acronym%TYPE
                              ,pSiteID in  em_site_t.site_id%type DEFAULT vm_global_pks.g_currentsiteid)  is
bNoRecFound  BOOLEAN  :=TRUE;
cursor cChecklists is
   select DISTINCT checklist_no ||'-'|| checklist_type_code VALUE,  checklist_no || '-' || checklist_type_code TEXT
      from em_route_t    rte,
           em_acronym_t  acr
    where rte.site_id = pSiteID and acr.site_id = pSiteID and
      rte.equip_cat_ptr = acr.equip_cat_ptr
      and acr.acronym = pAcronym;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rlist in cChecklists loop
        htp.p('   <ROW>');
        htp.p('    <VALUE>'||rlist.value||'</VALUE>');
        htp.p('    <TEXT>'||rlist.text||'</TEXT>');
        htp.p('   </ROW>');
        bNoRecFound := FALSE;
     end loop;
     if bNoRecFound then
       RAISE NO_DATA_FOUND;
     end if;
     htp.p('</ROWSET>');
  exception
     when NO_DATA_FOUND then
       htp.p('   <ROW>');
       htp.p('    <VALUE>-1</VALUE>');
       htp.p('    <TEXT>--NONE--</TEXT>');
       htp.p('   </ROW>');
       htp.p('</ROWSET>');
     when OTHERS then
       NULL;
  end; -- END em_XMLAcroCheckList


-- get a list of Routes with (SubSite and Acronym)s...
 procedure em_XMLRouteAcroList(pSiteID  IN  em_site_t.site_id%type DEFAULT vm_global_pks.g_currentsiteid) is
 cursor cRoutes is
   SELECT  DISTINCT rte.route_no VALUE, rte.route_no || ' (' || rte.subsite_id || ' - '|| acr.acronym ||')' TEXT
   FROM  em_route_t rte, em_acronym_t  acr
   WHERE  rte.equip_cat_ptr = acr.equip_cat_ptr
   AND  rte.site_id = pSiteID;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rRoute in cRoutes loop
        htp.p('   <ROW>');
        htp.p('    <VALUE>'||rRoute.value||'</VALUE>');
        htp.p('    <TEXT>'||rRoute.text||'</TEXT>');
        htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end; -- END  em_XMLRouteAcroList


-- get a list of Equipment Numbers and PM Frequencies for a supplied route...
 procedure em_XMLRouteEqpNbrList(pSiteID       IN  em_site_t.site_id%TYPE      DEFAULT vm_global_pks.g_currentsiteid
                                 ,pRouteNbr    IN  em_route_t.route_no%TYPE
                                 ,pSubSiteID   IN  em_route_t.subsite_id%TYPE  DEFAULT NULL
                                 ,pAcronym     IN  em_acronym_t.acronym%TYPE   DEFAULT NULL
                                 ,pSubSiteInd  IN  CHAR                        DEFAULT NULL
                                 ,pAcroInd     IN  CHAR                        DEFAULT NULL) is

 cursor cRouteAcros is
   SELECT DISTINCT rte.equipment_ptr VALUE
          , NVL2(pSubSiteInd, eqp.subsite_id || ' - ', NULL)
           || NVL2(pAcroInd, acr.acronym || ' - ', NULL)
           || eqp.equip_no TEXT
     FROM  em_route_t       rte
           ,em_equipment_t  eqp
           ,em_acronym_t    acr
    WHERE rte.equipment_ptr = eqp.equipment_ptr
      AND eqp.equip_cat_ptr = acr.equip_cat_ptr
      AND rte.site_id       = pSiteID
      AND rte.route_no      = pRouteNbr
      AND NVL2(pSubSiteID, rte.subsite_id, NULL) = pSubSiteID
      AND NVL2(pAcronym, acr.acronym, NULL) = pAcronym;

 begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rAcro in cRouteAcros loop
        htp.p('   <ROW>');
        htp.p('    <VALUE>'||rAcro.value||'</VALUE>');
        htp.p('    <TEXT>'||rAcro.text||'</TEXT>');
        htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
 end; -- END  em_XMLRouteEqpNbrList

 procedure em_XMLGetAcroListEquipCnt(pSiteID   in  em_site_t.site_id%type,
                                      pSubsite in em_subsite_t.subsite_id%type) is
     cursor cAcronyms is
      select distinct b.equip_cat_ptr VALUE, rpad(b.acronym,8)||'  '||rpad(b.class_code,2)||' - '||rpad(replace(b.acronym_desc, '&', '&amp;'),47)||' - '||F4772_REQ_FLAG TEXT
          from  em_acronym_t b
          where b.site_id = pSiteID
          and b.ACTIVE_FLAG = 'A'
          order by text;
    begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rAcronyms in cAcronyms loop
     htp.p('   <ROW>');
     htp.p('    <VALUE>'||rAcronyms.value||'</VALUE>');
     htp.p('    <TEXT>'||rAcronyms.text||'</TEXT>');
     htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

   -- Returns an XML list of work codes...
   procedure em_getXMLWorkCodeList is
      cursor curWorkCodes is
        select work_code "VALUE", work_code||'-'||replace(work_code_desc, '&', '&amp;') "TEXT"
		from em_work_code_t
		where work_code_flag in ('P','B')
		order by work_code;
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      for rCodes in curWorkCodes loop

         htp.p('<ROW>');
         htp.p('<VALUE>'||rCodes.value||'</VALUE>');
         htp.p('<TEXT>'||rCodes.text||'</TEXT>');
         htp.p('</ROW>');

      end loop;
      htp.p('</ROWSET>');
   end em_getXMLWorkCodeList;

-- Returns the 1st list of data to graph for the manager reports...
   procedure em_getReportData1   is
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
         htp.p('<ROW>');
         htp.p('<VALUE>C</VALUE><TEXT>% Quantity Completed</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>P</VALUE><TEXT>% Quantity Part. Completed</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>B</VALUE><TEXT>% Quantity Bypassed</TEXT>');
         htp.p('</ROW>');
      htp.p('</ROWSET>');
   end em_getReportData1;

-- Returns the 2nd list of data to graph for the manager reports...
   procedure em_getReportData2   is
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
         htp.p('<ROW>');
         htp.p('<VALUE>CO</VALUE><TEXT>Completion Rate by Acronym</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>CA</VALUE><TEXT>Completion Rate for all Acronyms</TEXT>');
         htp.p('</ROW>');
      htp.p('</ROWSET>');
   end em_getReportData2;

   -- Returns the 3rd list of data to graph for the manager reports...
   procedure em_getReportData3   is
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
         htp.p('<ROW>');
         htp.p('<VALUE>EQP</VALUE><TEXT>By Equipment</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>ACR</VALUE><TEXT>By Acronym</TEXT>');
         htp.p('</ROW>');
      htp.p('</ROWSET>');
   end em_getReportData3;

      -- Returns the 4th list of data to graph for the manager reports...
   procedure em_getReportData4   is
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
         htp.p('<ROW>');
         htp.p('<VALUE>DET</VALUE><TEXT>Total Time (Details)</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>SUM</VALUE><TEXT>Total Time (Summary)</TEXT>');
         htp.p('</ROW>');
      htp.p('</ROWSET>');
   end em_getReportData4;

 -- Returns the list of items to order by for the manager reports...
   procedure em_getReport_OrderBy   is
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
         htp.p('<ROW>');
         htp.p('<VALUE>WOR</VALUE><TEXT>Work Order #</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>WOC</VALUE><TEXT>Work Code (Work Order Past Due Only)</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>CRE</VALUE><TEXT>Crew ID (Work Order Past Due Only)</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>ACR</VALUE><TEXT>Acronym</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>DUE</VALUE><TEXT>Due Date</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>REG</VALUE><TEXT>Register # (Project Record Summary Only)</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>PRO</VALUE><TEXT>Project # (Project Record Summary Only)</TEXT>');
         htp.p('</ROW>');
      htp.p('</ROWSET>');
   end em_getReport_OrderBy;

-- Returns an XML list of employee level codes...
   procedure em_XMLEmpLevelList is
     s_query varchar2(2000);
     cursor c_route is
     select emp_level_code "VALUE", emp_level_code "TEXT" from em_emp_level_t order by emp_level_code;

   begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for cur_rec in c_route loop
         htp.p('<ROW>');
         htp.p('<VALUE>'||cur_rec.value||'</VALUE>');
         htp.p('<TEXT>'||cur_rec.text||'</TEXT>');
         htp.p('</ROW>');
     end loop;
     htp.p('</ROWSET>');
   end em_XMLEmpLevelList;

END; -- Package Body EM_PREVENT_MAINT_PKG
/
