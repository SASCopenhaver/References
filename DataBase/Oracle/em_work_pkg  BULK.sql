CREATE OR REPLACE PACKAGE BODY em_work_pkg is

-- Purpose: Corrective Work Order Screen.
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- Tehseen     2/27/2003
-- $Header: /EMARS/Development/Database/Schemas/EMAPP/EMAPP.EM_WORK_PKG.PBK 31    6/28/12 2:48p Jesse $
   ctx dbms_xmlgen.ctxhandle;
   myxml     varchar2(32000);
   vErrMsg   varchar2(4000);
   vErrCD    VARCHAR2(20);
   emissingkeyvalues   exception;

   -- Procedure to save newly added or updated registers...
   function em_save_register return em_register_t.reg_no%type is
      vNewRegNo em_register_t.reg_no%type;
      error_msg varchar2(200);
   begin
      if vm_utility_pkg.getArrVal('mode') = 'add' then
          vNewRegNo := substr(vm_utility_pkg.getCurrentFY, 4, 1)||upper(vm_utility_pkg.getArrVal('REG_NO'));
          insert into em_register_t (
             reg_no,
             reg_name,
             subsite_id,
             site_id,
             fy,
             last_no,
             mod_user,
             mod_date,
             create_user,
             create_date
          )  values (
             vNewRegNo,
             upper(vm_utility_pkg.getArrVal('REG_NAME')),
             vm_utility_pkg.getArrVal('DEFAULT_SUBSITE'),
             vm_global_pks.g_currentSiteID,
             vm_utility_pkg.getCurrentFY,
             '0101',
             vm_global_pks.g_current_userid,
             sysdate,
             vm_global_pks.g_current_userid,
             sysdate
          );
      else
          update
             em_register_t
          set
             subsite_id = vm_utility_pkg.getArrVal('DEFAULT_SUBSITE'),
             reg_name =  upper(vm_utility_pkg.getArrVal('REG_NAME')),
             mod_user = vm_global_pks.g_current_userid,
             mod_date = sysdate
          where
             site_id = vm_global_pks.g_currentSiteID
             and reg_no = vm_utility_pkg.getArrVal('REG_NO_EDIT');
      end if;
      commit;
      return vNewRegNo;
   exception
      when others then
        error_msg:= sqlerrm;
--        htp.p('<?xml version="1.0"?><message status="child records found" newvalue="-1">Operation Unsuccessful: '||error_msg||'</message>');
        em_error_pkg.em_ErrorInsert_prc;
        raise;
   end em_save_register;

-- Procedure delete a register
   procedure em_delete_reg(pSiteID in em_site_t.site_id%type default null, pRegNO in em_register_t.reg_no%type default null) is
     cursor csr_chk_wo is
     select 1 from em_wo_t where site_id = pSiteID
     and reg_no = pRegNO;

     n_reg  PLS_INTEGER :=0;
     retval boolean :=false;
     n_exist PLS_INTEGER :=1;
   begin
    open csr_chk_wo;
    fetch csr_chk_wo into n_reg;
       retval := csr_chk_wo%FOUND;
    close csr_chk_wo;
    if retval = true then
      n_exist := 4;
    end if;
    htp.p('<?xml version="1.0"?>');
    htp.p('<REGEXIST>'||n_exist||'</REGEXIST>');
    exception
      when others then
      htp.p('<?xml version="1.0"?>');
      htp.p('<REGEXIST>-1</REGEXIST>');
   end;

   -- Procedure delete a register
   procedure em_delete_register is
   begin
         delete from em_register_t
         where site_id = vm_global_pks.g_currentSiteID
         and reg_no = vm_utility_pkg.getArrVal('REG_NO');
         if sql%rowcount =0 then
            raise_application_error(-20001, 'Register: '||vm_utility_pkg.getArrVal('REG_NO')||' Was Not Found');
         end if;
      commit;
   exception
      when others then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end;

   procedure em_getTabbedRegisterList(pGridName in varchar2  default null,pSiteID in em_site_t.site_id%type default null)
   is
      vHeaderText   varchar2(200);

   type regRec is record
   (
    fy em_register_t.fy%type,
    reg_no em_register_t.reg_no%type,
    reg_name em_register_t.reg_name%type,
    last_no em_register_t.last_no%type,
    subsite_id em_register_t.subsite_id%type
   );

   type reg is table of regRec;
   rReg reg;
   vSQL varchar2(2000);
   begin
      begin
        select
           replace(colheadertext, ',', chr(9))
        into
           vHeaderText
        from
           sg_widget_grid_t
        where
           widget_name = pGridName;
        htp.p(vHeaderText);
      exception
      when others then null;
      end;
      vSQL := 'select fy,reg_no,reg_name,last_no,subsite_id from em_Register_t where site_id = :p1 and reg_no not in (''000'') order by  fy  ,reg_no desc';
      execute immediate vSQL bulk collect into rReg using pSiteID;
      for i in rReg.first..rReg.last loop
        htp.p(rReg(i).fy||chr(9)||rReg(i).reg_no||chr(9)||rReg(i).reg_name||chr(9)||nvl(lpad(rReg(i).last_no,4,'0'),0)||chr(9)||rReg(i).subsite_id);
      end loop;

   end em_getTabbedRegisterList;

   -- Returns this FY plus two-FY's prior
   procedure em_getXMLFYList is
      thisfy number := vm_utility_pkg.getCurrentFY;
      lastfy number := thisfy-2;
      s_query constant varchar2(250) :=
        'select distinct fy "VALUE", fy "TEXT" from em_ap_calendar_t where fy <= '||thisfy||' and fy >='||lastfy||' order by fy desc';

   begin
      ctx := dbms_xmlgen.newContext(s_query);
      myxml := dbms_xmlgen.getXML(ctx);
      htp.p(myxml);
   end em_getXMLFYList;

   -- Returns all registers for a FY
   procedure em_getXMLRegisterList(pSiteID in em_site_t.site_id%type) is
      cursor curRegisterCodes is
        select reg_no "VALUE", reg_no||'-'||replace(reg_name,'&',';') "TEXT" from em_register_t
        where reg_no !='000'
        and substr(reg_no,2,2) < '70'
         and site_id =pSiteID
         and FY =vm_utility_pkg.getCurrentFY
          order by reg_no desc;
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      for rCodes in curRegisterCodes loop
        if rCodes.value !='21' then
         htp.p('<ROW>');
         htp.p('<VALUE>'||rCodes.value||'</VALUE>');
         htp.p('<TEXT>'||rCodes.text||'</TEXT>');
         htp.p('</ROW>');
        end if;
      end loop;
      htp.p('</ROWSET>');
   end em_getXMLRegisterList;

   -- Returns registers for 3 FY's
   procedure em_getXMLRegList3(pSiteID in em_site_t.site_id%type) is

      thisFY number :=vm_utility_pkg.getCurrentFY;
      FY1 number :=thisFY-1;
      FY2 number :=thisFY-2;
      cursor curRegisterCodes is
        select reg_no "VALUE", reg_no||'-'||replace(reg_name,'&',';') "TEXT" from em_register_t
        where reg_no !='000'
        and substr(reg_no,2,2) != '90'
         and site_id =pSiteID
         and FY in (thisFY,FY1,FY2)
          order by reg_no desc;
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      for rCodes in curRegisterCodes loop
        if rCodes.value !='21' then
         htp.p('<ROW>');
         htp.p('<VALUE>'||rCodes.value||'</VALUE>');
         htp.p('<TEXT>'||rCodes.text||'</TEXT>');
         htp.p('</ROW>');
        end if;
      end loop;
      htp.p('</ROWSET>');
   end;


   -- Returns all registers
   procedure em_getXMLRegisterListAll(pSiteID in em_site_t.site_id%type default null) is
      cursor curRegCodes is
        select reg_no "VALUE",reg_no||'-'||replace (reg_name,'&',';') "TEXT"
		from em_register_t where site_id = pSiteID;
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      for rCodes in curRegCodes loop
         htp.p('<ROW>');
         htp.p('<VALUE>'||rCodes.value||'</VALUE>');
         htp.p('<TEXT>'||rCodes.text||'</TEXT>');
         htp.p('</ROW>');
      end loop;
      htp.p('</ROWSET>');
   end em_getXMLRegisterListAll;

   -- Returns an XML list of work codes...
   procedure em_getXMLWorkCodeList is
      cursor curWorkCodes is
        select work_code "VALUE", work_code||'-'||replace(work_code_desc, '&', ';') "TEXT" from em_work_code_t order by work_code;
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

   -- Jesse, 7/29/2010
   -- Returns an XML list of work codes which wo_type_code in ('C','B').
   -- Called from screen of em_work_maint_001
   procedure em_getXMLCmWorkCodeList is
      cursor curWorkCodes is
        select work_code "VALUE", work_code||'-'||replace(work_code_desc, '&', ';') "TEXT"
        from em_work_code_t
        where work_code_flag in ('C','B')
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
   end em_getXMLCmWorkCodeList;

   -- Jesse, 7/29/2010
   -- Returns an XML list of work codes which wo_type_code in ('P','B').
   -- Called from screen of em_work_maint_001
   procedure em_getXMLPmWorkCodeList is
      cursor curWorkCodes is
        select work_code "VALUE", work_code||'-'||replace(work_code_desc, '&', ';') "TEXT"
        from em_work_code_t
        where work_code_flag in ('P','B')
        order by work_code;
      -- work codes: 02,03,04 and 21 covered by 'P'; 01 and 06 by 'B'
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
   end em_getXMLPmWorkCodeList;

   procedure em_getXMLPriorityCodes is
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
         htp.p('<ROW>');
         htp.p('<VALUE>A</VALUE>');
         htp.p('<TEXT>A</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>B</VALUE>');
         htp.p('<TEXT>B</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>C</VALUE>');
         htp.p('<TEXT>C</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>D</VALUE>');
         htp.p('<TEXT>D</TEXT>');
         htp.p('</ROW>');
      htp.p('</ROWSET>');
   end em_getXMLPriorityCodes;

   procedure em_getXMLStanding is
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
         htp.p('<ROW>');
         htp.p('<VALUE>Y</VALUE>');
         htp.p('<TEXT>Yes</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>N</VALUE>');
         htp.p('<TEXT>No</TEXT>');
         htp.p('</ROW>');
      htp.p('</ROWSET>');
   end em_getXMLStanding;

-- check if record is in work sheet or labor table.
procedure em_woexist(psiteid in em_site_t.site_id%type,p_wo_ptr in em_wo_t.wo_ptr%type) is

  cursor csr_wscnt is
  select wo_ptr from em_wo_worksheet_t
  where site_id = psiteid
  and wo_ptr in
  (select wo_ptr from em_wo_t where site_id = psiteid
  and nvl(combine_id,wo_ptr) = p_wo_ptr);

  cursor csr_lbcnt is
  select wo_ptr from em_wo_labor_t
  where site_id = psiteid
  and wo_ptr in
  (select wo_ptr from em_wo_t where site_id = psiteid
  and nvl(combine_id,wo_ptr) = p_wo_ptr);

  cursor csr_Issuecnt is
  select wo_ptr from em_issue_t
  where site_id = psiteid
  and wo_ptr in
  (select wo_ptr from em_wo_t where site_id = psiteid
  and nvl(combine_id,wo_ptr) = p_wo_ptr);

  cursor csr_partcnt is
  select wo_ptr from em_wo_parts_contention_t
  where site_id = psiteid
  and wo_ptr in
  (select wo_ptr from em_wo_t where site_id = psiteid
  and nvl(combine_id,wo_ptr) = p_wo_ptr);

  l_csr_partcnt em_wo_t.wo_ptr%type;

  l_wo_ptr em_wo_t.wo_ptr%type;

  n_exist_no PLS_INTEGER :=4;

  retval boolean;
begin
  open csr_partcnt;
  fetch csr_partcnt into l_wo_ptr;
    retval := csr_partcnt%FOUND;
  close csr_partcnt;
  if retval = true then
    n_exist_no := 1;
  end if;
  if n_exist_no != 1 then
    open csr_wscnt;
    fetch csr_wscnt into l_csr_partcnt;
      retval := csr_wscnt%FOUND;
    close csr_wscnt;
    if retval = true then
      n_exist_no := 1;
    end if;
    if n_exist_no != 1 then
      open csr_lbcnt;
      fetch csr_lbcnt into l_wo_ptr;
        retval := csr_lbcnt%FOUND;
      close csr_lbcnt;
      if retval = true then
        n_exist_no := 1;
      end if;
      if n_exist_no != 1 then
        open csr_issuecnt;
        fetch csr_issuecnt into l_wo_ptr;
          retval := csr_issuecnt%FOUND;
        close csr_issuecnt;
        if retval = true then
          n_exist_no := 1;
        end if;
      end if;
    end if;
  end if;


  htp.p('<?xml version="1.0"?>');
  htp.p('<WOCOUNT>'||n_exist_no||'</WOCOUNT>');
exception
  when others then
      htp.p('<?xml version="1.0"?>');
      htp.p('<WOCOUNT>-1</WOCOUNT>');
end;

-- procedure to display the end of fiscal year.
   procedure  em_next_fiscal_yr_prc   is
    cursor csr_maxfy(p1 in varchar2) is
    select to_char(max(end_date-1),'MM/DD/YYYY') from em_ap_calendar_t where fy= p1;
    --l_csr_maxfy   date:=sysdate;
    l_csr_maxfy   varchar2(10);
   begin
     open csr_maxfy(vm_utility_pkg.getCurrentFY);
     fetch csr_maxfy into l_csr_maxfy;
     close csr_maxfy;
  htp.p('<?xml version="1.0"?>');
  htp.p('<NEXTFYDT>'||l_csr_maxfy||'</NEXTFYDT>');
   exception
      when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<NEXTFYDT>-1</NEXTFYDT>');
   end;


-- procedure to display today plus 464.
   procedure  em_end_fiscal_yr_prc   is
    cursor csr_maxfy(p1 in varchar2) is
    select to_char(max(end_date),'MM/DD/YYYY') from em_ap_calendar_t where fy= p1;
    --l_csr_maxfy   date:=sysdate;
    l_csr_maxfy   varchar2(10);
   begin
   -- Tehseen - 10/6/2003/> changed to sysdate  plus 364 as per LLyod Bell (Client)
   --open csr_maxfy(vm_utility_pkg.getCurrentFY);
   --fetch csr_maxfy into l_csr_maxfy;
   --close csr_maxfy;

   select to_char(sysdate+364,'MM/DD/YYYY') into l_csr_maxfy from dual;


  htp.p('<?xml version="1.0"?>');
  htp.p('<LASTFYDT>'||l_csr_maxfy||'</LASTFYDT>');

   exception
      when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<LASTFYDT>-1</LASTFYDT>');
   end;

  -- Procedure to delete a work order...
   procedure em_deletewo is
    v_err varchar2(300);
    v_code number;
   begin
     delete from em_wo_t
     where site_id = vm_global_pks.g_currentSiteID and
     nvl(combine_id,wo_ptr) =  vm_utility_pkg.getarrval('wo_ptr');
     commit;
   exception
    when others then
       v_err := sqlerrm;
       v_code := sqlcode;
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end;
--31274045
--==============================================================================
--==============================================================================
   function  em_savewo return varchar2
   IS
    l_wo_no em_wo_t.wo_no%type;
    l_wo_ptr em_wo_t.wo_ptr%type default 0;
    l_rowid varchar2(30) :='XXX';
    indx number :=1;
    l_combine_ptr em_wo_t.wo_ptr%type default null;
    l_combine_comment varchar2(255) :='';
    l_combine_wono   em_wo_t.combine_wono%type default null;
    l_esttimecnt PLS_INTEGER := 0;
    l_esttime number := 0;
    TYPE c_allcursor IS REF CURSOR;

    cursor csr_equip_no(p1 in varchar2) is
    select equip_no,equip_cat_ptr,equipment_ptr
    from em_equipment_t
    where site_id =vm_global_pks.g_currentSiteID
    and equipment_ptr =p1;

    cursor csr_opms_equip_no(p2 in varchar2) is
    select equip_no,equip_cat_ptr,equipment_ptr
    from em_equipment_t
    where site_id =vm_global_pks.g_currentSiteID
    and equip_cat_ptr in ( select equip_cat_ptr
                            from em_acronym_t
                           where site_id = vm_global_pks.g_currentSiteID
                                 and acronym = p2);

    l_equip_no csr_equip_no%rowtype;
    l_opms_equip_no csr_opms_equip_no%rowtype;

    v_equip_cat_ptr em_wo_t.equip_cat_ptr%type;
    v_equip_no em_wo_t.equip_no%type;
    v_equipment_ptr em_wo_t.equipment_ptr%type;

   BEGIN

    if vm_utility_pkg.getarrval('mode') in ('add') then
        -- get the equip_no based on the equip-cat-ptr
        ------------------------------------------------------------------------
        -- create work orders for all the equipment in the class if equip_no = all.
        if (vm_utility_pkg.getarrval('wo_no_h')) is null then
           l_wo_no := em_wo_num_fnc(vm_global_pks.g_currentSiteID,vm_utility_pkg.getarrval('reg_no'));
        else
           l_wo_no := vm_utility_pkg.getarrval('wo_no_h');
        end if;
        ------------------------------------------------------------------------
        if (vm_utility_pkg.getarrval('equip_no_h') = 'ALL')  THEN
            for x in (select 1
                        from em_equipment_t
                       where site_id = vm_global_pks.g_currentsiteid
                             and subsite_id = vm_utility_pkg.getarrval('subsite_id')
                             and EQUIP_STATUS_CODE = 'A'
                             and equip_cat_ptr in (Select equip_cat_ptr
                       from em_acronym_t where site_id = vm_global_pks.g_currentsiteid
                             and acronym=vm_utility_pkg.getarrval('acronym')
                             and active_flag='A')
                     )
            loop
              l_esttimecnt := l_esttimecnt +1;
            end loop;
            --------------------------------------------------------------------
            if vm_utility_pkg.getarrval('est_hours') > 0 then
               if substr(vm_utility_pkg.getarrval('reg_no'),2,2)>90  then
                 l_esttime :=vm_utility_pkg.getarrval('est_hours');
               else
                 l_esttime :=vm_utility_pkg.getarrval('est_hours') /l_esttimecnt;
               end if;
            else
               l_esttime := 0;
            end if;
            --------------------------------------------------------------------
--09/29/04 CM Updated so that if class selected on ALL
-- work orders are only generated for equipment with that class
            for x in (
                     select  equipment_ptr,equip_no,equip_cat_ptr
                     from em_equipment_t
                     where site_id = vm_global_pks.g_currentsiteid
                     and subsite_id = vm_utility_pkg.getarrval('subsite_id')
                     and EQUIP_STATUS_CODE = 'A'
                     and equip_cat_ptr in (Select equip_cat_ptr
                     from em_acronym_t where site_id = vm_global_pks.g_currentsiteid
                     and acronym=vm_utility_pkg.getarrval('acronym') and active_flag='A'
                     and equip_cat_ptr = decode(vm_utility_pkg.getarrval('class_code_h'),'-1',equip_cat_ptr,'',equip_cat_ptr,vm_utility_pkg.getarrval('class_code_h')))
                     )

            loop
              select em_wo_ptr_seq.nextval into l_wo_ptr from dual;

              if indx = 1 then
                  l_combine_ptr := l_wo_ptr;
                  l_combine_wono:= l_wo_no;
              end if;
                  indx := indx + 1;
-- Show as combine only for registers less than 90. Tehseen.
               if substr(vm_utility_pkg.getarrval('reg_no'),2,2)>90  then
                 l_combine_ptr := null;
                 l_combine_wono := null;
               end if;

               insert into em_wo_t
              (
              wo_ptr,
              reg_no,
              subsite_id,
              site_id,
              wo_no,
              combine_wono,
              wo_desc,
              equip_cat_ptr,
              equip_no,
              equipment_ptr,
              standing_flag,
              priority_code,
              wo_type_code,
              work_code,
              crew_id,
              modification_no,
              dept_code,
              date_issued,
              date_due,
              est_hours,
              hours_to_date,
              wo_comment,
              project_id,
              combine_id,
              wo_status,
              create_date,
              create_user,
              mod_date,
              mod_user,
              whep_fac_id
              --
              ,fssp_call_num
              ,fssp_problem_num
              ,fssp_zip
              --
              )
              values
              (
              l_wo_ptr,
              vm_utility_pkg.getarrval('reg_no'),
              vm_utility_pkg.getarrval('subsite_id'),
              vm_global_pks.g_currentsiteid,
              l_wo_no, -- function to return the wo number
              l_combine_wono,
              upper(vm_utility_pkg.getarrval('wo_desc')),
              x.equip_cat_ptr,--vm_utility_pkg.getarrval('acronym'),
              -- added upper 12/03/04 cp
              em_replace_chars(upper(x.equip_no)),
              x.equipment_ptr,
              vm_utility_pkg.getarrval('standing_flag'),
              vm_utility_pkg.getarrval('priority_code'),
              'C',
              vm_utility_pkg.getarrval('work_code'),
              vm_utility_pkg.getarrval('crew_id'),
              vm_utility_pkg.getarrval('modification_no'),
              vm_utility_pkg.getarrval('dept_code'),
              to_date(vm_utility_pkg.getarrval('date_issued'),'MM/DD/YYYY'),
              to_date(vm_utility_pkg.getarrval('date_due'),'MM/DD/YYYY'),
--              vm_utility_pkg.getarrval('est_hours'),
			  --2012.6.28 Jesse add ROUND(), 0.3333333333333 would be 0.33
              round(l_esttime,2),
              vm_utility_pkg.getarrval('hours_to_date'),
              UPPER(vm_utility_pkg.getarrval('wo_comment')),
              decode(vm_utility_pkg.getarrval('project_id'), '-1', null, vm_utility_pkg.getarrval('project_id')),
              l_combine_ptr,
              'O',
              sysdate,
              vm_global_pks.g_current_userid,
              sysdate,
              vm_global_pks.g_current_userid,
              vm_utility_pkg.getarrval('whep_fac_id')
              ---
              ,DECODE(vm_utility_pkg.getarrval('h_FSSP_Call'),   '',NULL,vm_utility_pkg.getarrval('h_FSSP_Call'))
              ,DECODE(vm_utility_pkg.getarrval('h_FSSP_Problem'),'',NULL,vm_utility_pkg.getarrval('h_FSSP_Problem'))
              ,DECODE(vm_utility_pkg.getarrval('h_FSSP_ZIP'),    '',NULL,vm_utility_pkg.getarrval('h_FSSP_ZIP'))
              ---
              );
           end loop;
       else
         if vm_utility_pkg.getarrval('req_4772') = 'Y' then
           if (vm_utility_pkg.getarrval('equip_no_h') = 'OPMS') then
             open csr_opms_equip_no (vm_utility_pkg.getarrval('acronym'));
             fetch csr_opms_equip_no into l_opms_equip_no;
             close csr_opms_equip_no;
             v_equip_cat_ptr:=l_opms_equip_no.equip_cat_ptr;
--             v_equip_no :=l_opms_equip_no.equip_no;
             v_equip_no :='OPMS';
             v_equipment_ptr := l_opms_equip_no.equipment_ptr;
           else
             open csr_equip_no(vm_utility_pkg.getarrval('equip_no_h'));
             fetch csr_equip_no into l_equip_no;
             close csr_equip_no;

             v_equip_cat_ptr:=l_equip_no.equip_cat_ptr;
             v_equip_no :=l_equip_no.equip_no;
             v_equipment_ptr := l_equip_no.equipment_ptr;

            end if;
         else
            if vm_utility_pkg.getarrval('class_ptr') is null then
              v_equip_cat_ptr:=vm_utility_pkg.getarrval('class_code_h');
            else
              v_equip_cat_ptr:=vm_utility_pkg.getarrval('class_ptr');
            end if;
            v_equip_no :=vm_utility_pkg.getarrval('equip_no_h');
            v_equipment_ptr :='';
         end if;
          select em_wo_ptr_seq.nextval into l_wo_ptr from dual;
          insert into em_wo_t
          (
          wo_ptr,
          reg_no,
          subsite_id,
          site_id,
          wo_no,
          wo_desc,
          equip_cat_ptr,
          equip_no,
          equipment_ptr,
          standing_flag,
          priority_code,
          wo_type_code,
          work_code,
          crew_id,
          modification_no,
          dept_code,
          date_issued,
          date_due,
          est_hours,
          hours_to_date,
          wo_comment,
          project_id,
          wo_status,
          create_date,
          create_user,
          mod_date,
          mod_user,
          whep_fac_id
          --
          ,fssp_call_num
          ,fssp_problem_num
          ,fssp_zip
          --
          )
          values
          (
          l_wo_ptr,
          vm_utility_pkg.getarrval('reg_no'),
          vm_utility_pkg.getarrval('subsite_id'),
          vm_global_pks.g_currentsiteid,
          l_wo_no, -- function to return the wo number
          upper(vm_utility_pkg.getarrval('wo_desc')),
          v_equip_cat_ptr,-- vm_utility_pkg.getarrval('equip_no_h'), -- was acronym
          -- added upper 12/03/04 cp
          em_replace_chars(upper(v_equip_no)), --vm_utility_pkg.getarrval('equip_no_h'),
          v_equipment_ptr,
          vm_utility_pkg.getarrval('standing_flag'),
          vm_utility_pkg.getarrval('priority_code'),
          'C',
          vm_utility_pkg.getarrval('work_code'),
          vm_utility_pkg.getarrval('crew_id'),
          vm_utility_pkg.getarrval('modification_no'),
          vm_utility_pkg.getarrval('dept_code'),
          to_date(vm_utility_pkg.getarrval('date_issued'),'MM/DD/YYYY'),
          to_date(vm_utility_pkg.getarrval('date_due'),'MM/DD/YYYY'),
		  --2012.6.28 Jesse add ROUND(), 0.3333333333333 would be 0.33
          round(vm_utility_pkg.getarrval('est_hours'),2),
          vm_utility_pkg.getarrval('hours_to_date'),
          UPPER(vm_utility_pkg.getarrval('wo_comment')),
          vm_utility_pkg.getarrval('project_id'),
          'O',
          sysdate,
          vm_global_pks.g_current_userid,
          sysdate,
          vm_global_pks.g_current_userid,
          vm_utility_pkg.getarrval('whep_fac_id')
          ---
          ,DECODE(vm_utility_pkg.getarrval('h_FSSP_Call'),   '',NULL,vm_utility_pkg.getarrval('h_FSSP_Call'))
          ,DECODE(vm_utility_pkg.getarrval('h_FSSP_Problem'),'',NULL,vm_utility_pkg.getarrval('h_FSSP_Problem'))
          ,DECODE(vm_utility_pkg.getarrval('h_FSSP_ZIP'),    '',NULL,vm_utility_pkg.getarrval('h_FSSP_ZIP'))
          ---
          );
       end if;    -- end if for all /individual.
          if l_combine_ptr is not null then
             l_wo_ptr := l_combine_ptr;
          end if;
          select EM_ROWID_ENC(rowid) into l_rowid
            from em_wo_t
           where wo_ptr  = l_wo_ptr
             and site_id = vm_global_pks.g_currentsiteid;
          return l_rowid;

    else
       -- update
        if (vm_utility_pkg.getarrval('equip_no_h') = 'ALL')  THEN
                      for x in (
                         select wo_ptr
                         from em_wo_t
                         where site_id = vm_global_pks.g_currentsiteid
                         and wo_no = vm_utility_pkg.getarrval('wo_no_h')
                         and combine_id = to_number(vm_utility_pkg.getarrval('wo_ptr'))) loop
                         l_esttimecnt := l_esttimecnt +1;
                      end loop;
             if vm_utility_pkg.getarrval('est_hours') > 0 then
               l_esttime :=vm_utility_pkg.getarrval('est_hours') /l_esttimecnt;
             else
               l_esttime := 0;
             end if;

            for x in (select wo_ptr
                      from em_wo_t
                      where site_id = vm_global_pks.g_currentsiteid
                      and wo_no = vm_utility_pkg.getarrval('wo_no_h')
                      and combine_id = to_number(vm_utility_pkg.getarrval('wo_ptr'))
                     ) loop
               update em_wo_t
               set
                wo_desc        =   UPPER(vm_utility_pkg.getarrval('wo_desc')),
                wo_comment     =   UPPER(vm_utility_pkg.getarrval('wo_comment')),
                work_code      =   vm_utility_pkg.getarrval('work_code'),
                date_issued    =   to_date(vm_utility_pkg.getarrval('date_issued'),'MM/DD/YYYY'),
                date_due       =   to_date(vm_utility_pkg.getarrval('date_due'),'MM/DD/YYYY'),
				--2012.6.28 Jesse add ROUND(), 0.3333333333333 would be 0.33
                est_hours      =   round(l_esttime,2),--vm_utility_pkg.getarrval('est_hours'),
                crew_id        =   vm_utility_pkg.getarrval('crew_id'),
                modification_no =  vm_utility_pkg.getarrval('modification_no'),
                priority_code  =   vm_utility_pkg.getarrval('priority_code'),
                dept_code      =   vm_utility_pkg.getarrval('dept_code'),
                project_id     =   vm_utility_pkg.getarrval('project_id'),
                mod_date       =   sysdate,
                mod_user       =   vm_global_pks.g_current_userid,
                whep_fac_id    =   vm_utility_pkg.getarrval('whep_fac_id')
                ---
                ,fssp_call_num    = DECODE(vm_utility_pkg.getarrval('h_FSSP_Call'),   '',NULL,vm_utility_pkg.getarrval('h_FSSP_Call'))
                ,fssp_problem_num = DECODE(vm_utility_pkg.getarrval('h_FSSP_Problem'),'',NULL,vm_utility_pkg.getarrval('h_FSSP_Problem'))
                ,fssp_zip         = DECODE(vm_utility_pkg.getarrval('h_FSSP_ZIP'),    '',NULL,vm_utility_pkg.getarrval('h_FSSP_ZIP')),
                ---
                past_due_reason_code = vm_utility_pkg.getarrval('past_due_reason_code')

               where  site_id = vm_global_pks.g_currentsiteid and wo_ptr  =   x.wo_ptr;
            end loop;
         else
           update em_wo_t
           set
            wo_desc        =   UPPER(vm_utility_pkg.getarrval('wo_desc')),
            wo_comment     =   UPPER(vm_utility_pkg.getarrval('wo_comment')),
            work_code      =   vm_utility_pkg.getarrval('work_code'),
            date_issued    =   to_date(vm_utility_pkg.getarrval('date_issued'),'MM/DD/YYYY'),
            date_due       =   to_date(vm_utility_pkg.getarrval('date_due'),'MM/DD/YYYY'),
			--2012.6.28 Jesse add ROUND(), 0.3333333333333 would be 0.33
            est_hours      =   round(to_number(vm_utility_pkg.getarrval('est_hours')),2),
            crew_id        =   vm_utility_pkg.getarrval('crew_id'),
            dept_code      =   vm_utility_pkg.getarrval('dept_code'),
            project_id     =   vm_utility_pkg.getarrval('project_id'),
            modification_no=   vm_utility_pkg.getarrval('modification_no'),
            priority_code  = vm_utility_pkg.getarrval('priority_code'),
            mod_date       =   sysdate,
            mod_user       =   vm_global_pks.g_current_userid,
            whep_fac_id    =   vm_utility_pkg.getarrval('whep_fac_id')
            ---
            ,fssp_call_num    = DECODE(vm_utility_pkg.getarrval('h_FSSP_Call'),   '',NULL,vm_utility_pkg.getarrval('h_FSSP_Call'))
            ,fssp_problem_num = DECODE(vm_utility_pkg.getarrval('h_FSSP_Problem'),'',NULL,vm_utility_pkg.getarrval('h_FSSP_Problem'))
            ,fssp_zip         = DECODE(vm_utility_pkg.getarrval('h_FSSP_ZIP'),    '',NULL,vm_utility_pkg.getarrval('h_FSSP_ZIP')),
            ---
            past_due_reason_code = vm_utility_pkg.getarrval('past_due_reason_code')
           where site_id = vm_global_pks.g_currentsiteid and wo_ptr  =   to_number(vm_utility_pkg.getarrval('wo_ptr'));
         end if;
       return 'Y';
    end if;     -- main end if for insert/update
     commit;

      exception
      when others  then

       vErrCD := SQLCODE;
       vErrMsg := sqlerrm;

       em_error_pkg.em_ErrorInsert_prc;
       raise;
   END em_savewo;
--==============================================================================
--==============================================================================
-- check to see if the work order number already exists.
   procedure em_wono9(pSiteID in em_site_t.site_id%type ,p_wo IN em_wo_t.wo_no%type, p_regno IN em_wo_t.reg_no%type ) is
    l_ptr VARCHAR2(30);
    l_response varchar2(3) := 'NO';
     cursor c_ptr is
     select EM_ROWID_ENC(ROWID) from em_wo_t
     where site_id = pSiteID and wo_no = p_wo and reg_no = p_regno;

   begin

     open c_ptr;
     fetch c_ptr into l_ptr;
     close c_ptr;
     htp.p('<?xml version="1.0"?>');
     htp.p('<WONO9>'||l_ptr||'</WONO9>');
   exception
     when others then
       htp.p('<?xml version="1.0"?>');
       htp.p('<WONO9>-1</WONO9>');
   end;

-- return the calulated date
procedure em_date_prc (pStartDate varchar2 default to_char(sysdate,'mm/dd/yyyy'),
                      pAdd in number default 0) is
    l_caldate  date;
   begin
     select to_date(pStartDate,'mm/dd/yyyy') + pAdd into l_caldate from dual;
     htp.p('<?xml version="1.0"?>');
     htp.p('<caldate>'||to_char(l_caldate,'mm/dd/yyyy')||'</caldate>');
   exception
     when others then
      htp.p('<?xml version="1.0"?>');
      htp.p('<caldate>-1</caldate>');
   end;

-- get wo number
   procedure em_WONO(p_wo_no IN em_wo_t.wo_no%type) is
   begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<WONO>'||p_wo_no||'</WONO>');
   exception
     when others then
         htp.p('<?xml version="1.0"?>');
         htp.p('<WONO>-1</WONO>');
   end;

   -- Procedure get_wo_data via find...
    procedure em_getWO(p_rowid in varchar2,pSiteID in varchar2 default null)     is

        type workrec is record(
        wo_ptr  em_wo_t.wo_ptr%type,
        F4772_REQ_FLAG varchar2(1),
        mod_date varchar2(20),
        mod_user varchar2(200),
        create_user varchar2(100),
        modification_no em_wo_t.modification_no%type,
        reg_no em_wo_t.reg_no%type,
        wo_status em_wo_t.wo_status%type,
        reg_no_key em_wo_t.reg_no%type,

        wo_no em_wo_t.wo_no%type,

        wo_no_key em_wo_t.wo_no%type,
        wo_desc em_wo_t.wo_desc%type,
        wo_desc_key em_wo_t.wo_desc%type,
        subsite_id em_wo_t.subsite_id%type,
        acronym em_acronym_t.acronym%type,
        class_code em_acronym_t.class_code%type,
        class_ptr em_wo_t.equip_cat_ptr%type,
        equip_no em_wo_t.equip_no%type,
        standing_flag em_wo_t.standing_flag%type,
        priority_code em_wo_t.priority_code%type,
        work_code em_wo_t.work_code%type,
        crew_id em_wo_t.crew_id%type,
        dept_code em_wo_t.dept_code%type,
        date_issued varchar2(20),
        date_due varchar2(20),
        date_closed varchar2(20),
        est_hours em_wo_t.est_hours%type,
        project_id em_wo_t.project_id%type,
        hours_to_date em_wo_t.hours_to_date%type,
        wo_comment em_wo_t.wo_comment%type,
        create_date em_wo_t.create_date%type,
        FY varchar2(4),
        FY_key varchar2(4),
        whep_fac_id em_wo_t.whep_fac_id%type,
        ecbm_view_only em_acronym_t.ecbm_view_only%type
        ---
        ,fssp_call_num     em_wo_t.fssp_call_num%type
        ,fssp_problem_num  em_wo_t.fssp_problem_num%type
        ,fssp_zip          em_wo_t.fssp_zip%type
        ---
        ,fss_ma_id em_wo_t.fss_ma_id%type
        --
        ,past_due_reason_code   em_wo_t.past_due_reason_code%type
        );
        worec workrec;

         s_query constant varchar2(4000) :=
         'select  wo_ptr,F4772_REQ_FLAG as req_4772,a.mod_date, em_equipment_pkg.getUserName(a.site_id, a.mod_user) mod_user, '
         ||'em_equipment_pkg.getUserName(a.site_id, a.create_user) create_user,modification_no,reg_no, '
         ||'wo_status,reg_no as reg_no_key, wo_no, wo_no as wo_no_key, wo_desc, wo_desc as wo_desc_key, subsite_id, acronym, '
         ||' decode(a.combine_id,null,decode(equip_no,''OPMS'','''',class_code),'''') as class_code, a.equip_cat_ptr as class_ptr, '
         || ' decode(a.combine_id, null, a.equip_no, ''ALL'') as equip_no , standing_flag, '
         || ' priority_code, work_code, crew_id, dept_code, to_char(date_issued,''mm/dd/yyyy'') as date_issued , '
         ||' to_char(date_due,''mm/dd/yyyy'') as date_due,to_char(date_closed,''mm/dd/yyyy'') as date_closed, est_hours, project_id, '
         ||' hours_to_date, wo_comment , a.create_date, '
         ||' lpad(substr(reg_no,1,1),4,''200'') as FY , lpad(substr(reg_no,1,1),4,''200'') as FY_key, whep_fac_id, ecbm_view_only'
         ---
         ||',fssp_call_num, '
         ||'fssp_problem_num, '
         ||'fssp_zip '
         ---
         || ',nvl(a.fss_ma_id,''for FSS only'') '
         || ', to_char(a.past_due_reason_code) as past_due_reason_code '
         ||' from em_wo_t a, em_acronym_t c  '
         ||' where a.site_id = :p1 '--||pSiteID
         ||' and c.site_id = :p2 '--||pSiteID
         ||' and a.equip_cat_ptr=c.equip_cat_ptr '
--         ||' and  a.rowid = '''||EM_ROWID_DEC(p_rowid)||'''';
         ||' and  a.rowid = :p3 ';
        type cur_wo is ref cursor;
        cur_Rec cur_wo;
    begin
     open cur_Rec for s_query using pSiteID,pSiteID,EM_ROWID_DEC(p_rowid);
     fetch cur_Rec into worec;
     close cur_rec;

    htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      htp.p('<ROW>');
      htp.p('<wo_ptr>'||         worec.wo_ptr||'</wo_ptr>');
      htp.p('<F4772_REQ_FLAG>'|| worec.F4772_REQ_FLAG||'</F4772_REQ_FLAG>');
      htp.p('<mod_date>'||       worec.mod_date||'</mod_date>');
      htp.p('<mod_user>'||       worec.mod_user ||'</mod_user>');
      htp.p('<create_date>'||    worec.create_date||'</create_date>');
      htp.p('<create_user>'||    worec.create_user ||'</create_user>');
      htp.p('<modification_no>'||worec.modification_no ||'</modification_no>');
      htp.p('<reg_no>'||         worec.reg_no ||'</reg_no>');
      htp.p('<wo_status>'||      worec.wo_status||'</wo_status>');
      htp.p('<reg_no_key>'||     worec.reg_no_key||'</reg_no_key>');
      htp.p('<wo_no>'||          worec.wo_no||'</wo_no>');
      htp.p('<wo_no_key>'||      worec.wo_no_key||'</wo_no_key>');
      htp.p('<wo_desc>'||        worec.wo_desc||'</wo_desc>');
      htp.p('<wo_desc_key>'||    worec.wo_desc_key||'</wo_desc_key>');
      htp.p('<subsite_id>'||     worec.subsite_id||'</subsite_id>');
      htp.p('<acronym>'||        worec.acronym ||'</acronym>');
      htp.p('<class_code>'||     worec.class_code ||'</class_code>');
      htp.p('<class_ptr>'||      worec.class_ptr ||'</class_ptr>');
      htp.p('<equip_no>'||       worec.equip_no ||'</equip_no>');
      htp.p('<standing_flag>'||  worec.standing_flag ||'</standing_flag>');

      ---
      htp.p('<txt_fssp_call>'||worec.fssp_call_num ||'</txt_fssp_call>');
      htp.p('<h_fssp_call>'||worec.fssp_call_num ||'</h_fssp_call>');

      htp.p('<txt_fssp_problem>'||worec.fssp_problem_num ||'</txt_fssp_problem>');
      htp.p('<h_fssp_problem>'||worec.fssp_problem_num ||'</h_fssp_problem>');

      htp.p('<txt_fssp_zip>'||worec.fssp_zip ||'</txt_fssp_zip>');
      htp.p('<h_fssp_zip>'||worec.fssp_zip ||'</h_fssp_zip>');
      ---

      htp.p('<txt_fssmaid>'|| worec.fss_ma_id ||'</txt_fssmaid>');

      htp.p('<priority_code>'|| worec.priority_code ||'</priority_code>');
      htp.p('<work_code>'|| worec.work_code ||'</work_code>');
      htp.p('<crew_id>'|| worec.crew_id ||'</crew_id>');
      htp.p('<dept_code>'|| worec.dept_code ||'</dept_code>');
      htp.p('<date_issued>'|| worec.date_issued ||'</date_issued>');
      htp.p('<date_due>'|| worec.date_due ||'</date_due>');
      htp.p('<date_closed>'|| worec.date_closed ||'</date_closed>');
      htp.p('<est_hours>'|| worec.est_hours ||'</est_hours>');
      htp.p('<project_id>'|| worec.project_id ||'</project_id>');
      htp.p('<hours_to_date>'|| worec.hours_to_date ||'</hours_to_date>');
      htp.p('<wo_comment>'|| worec.wo_comment ||'</wo_comment>');
      htp.p('<FY>'||worec.FY ||'</FY>');
      htp.p('<FY_key>'||worec.FY_key ||'</FY_key>');
      htp.p('<whep_fac_id>'||worec.whep_fac_id ||'</whep_fac_id>');
      htp.p('<ecbm_view_only>'||worec.ecbm_view_only ||'</ecbm_view_only>');
      htp.p('<past_due_reason_code>'||worec.past_due_reason_code||'</past_due_reason_code>');

      htp.p('</ROW>');
      htp.p('</ROWSET>');

     htp.p('<!--'||p_rowid||'-->');
    exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
    end em_getWO;
-- procedure to calculate the total est hours for 'ALL' //atir
-- em_esthours_prc?pSiteID='+currentSite+'&pWoPtr=
   procedure em_esthours_prc(pSiteID in em_site_t.site_id%type default null,
                             pWoPtr in em_wo_t.wo_ptr%type default null)
     is
     cursor csr_eshours is
     select round(sum(est_hours),2)
     from em_wo_t where site_id = pSiteID
     and combine_id = pWoPtr;

     n_hrs  number :=0;
   begin
    open csr_eshours;
    fetch csr_eshours into n_hrs;
    close csr_eshours;
    htp.p('<?xml version="1.0"?>');
    htp.p('<ESTHOUR>'||n_hrs||'</ESTHOUR>');
    exception
      when others then
      htp.p('<?xml version="1.0"?>');
      htp.p('<ESTHOUR>-1</ESTHOUR>');
   end;

    -- Returns XML list of dept codes and descriptions...
    procedure em_getXMLDeptList is
      cursor nsn is
      select dept_code "VALUE", dept_code||'-'||replace(dept_name,'&',';')"TEXT"
       from em_dept_t
       order by dept_code;

    begin
         htp.p('<?xml version="1.0"?>');
         htp.p('<ROWSET>');
         for cnsn in nsn loop
           htp.p('<ROW>');
           htp.p('<VALUE>'||cnsn.VALUE||'</VALUE>');
           htp.p('<TEXT>'||cnsn.TEXT||'</TEXT>');
           htp.p('</ROW>');
         end loop;
         htp.p('</ROWSET>');
    end em_getXMLDeptList;

-- get count of rows for grdMaterial
   procedure em_materialcnt(p_wo_ptr IN em_wo_t.wo_ptr%type,psiteid in em_site_t.site_id%type) is
    n_MATERIALCOUNT   number := 0;
   begin
       SELECT count(*) into n_MATERIALCOUNT from
       (select 1 from em_wo_parts_contention_t a, em_wo_t b
       where a.site_id = psiteid and b.site_id = psiteid
       and a.wo_ptr = b.wo_ptr and a.wo_ptr= p_wo_ptr );
     htp.p('<?xml version="1.0"?>');
     htp.p('<MATERIALCOUNT>'||n_MATERIALCOUNT||'</MATERIALCOUNT>');
   exception
     when others then
         htp.p('<?xml version="1.0"?>');
         htp.p('<MATERIALCOUNT>-1</MATERIALCOUNT>');
   end;

  -- check if parts are ordered for this work order
  procedure em_check_parts(pWOPtr IN em_wo_t.wo_ptr%type,pSiteID in em_site_t.site_id%type) is
    cursor csk_part_chk is
    select 1 from em_wo_parts_contention_t
    where site_id = pSiteID
    and wo_ptr = pWOPtr;

    l_cnt   PLS_INTEGER := 0;
    l_found PLS_INTEGER := 0;
  begin
    open csk_part_chk;
    fetch csk_part_chk into l_cnt;
    if csk_part_chk%found then
      l_found := 4;
    end if;
    close csk_part_chk;
    htp.p('<?xml version="1.0"?>');
    htp.p('<PARTS>'||l_found||'</PARTS>');
  exception
    when others then
      htp.p('<?xml version="1.0"?>');
      htp.p('<PARTS>-1</PARTS>');
  end;

   procedure em_getMaterialList(p_wo_ptr in em_wo_t.wo_ptr%type,psiteid in em_site_t.site_id%type) is

   type rec_material is record(
    reg_no em_wo_t.reg_no%type,
    wo_no  em_wo_t.wo_no%type,
    nsn em_catalog_t.nsn%type,
    nom em_wo_parts_contention_t.nom%type,
    qty_req number,
    required_date varchar2(20),
    rowid varchar2(20),
    boh number
    );

    type matTBL is table of rec_material;
    rReg matTbl;
    vSQL varchar2(2000);
    begin
/*
      vSQL := 'select reg_no, wo_no, a.nsn,nom,qty_req,to_char(required_date,''MM/DD/YYYY'') as required_date, '||
      ' a.rowid,c.boh from em_wo_parts_contention_t a, em_wo_t b, em_catalog_t c '||
      ' where a.site_id= :p1 and b.site_id= :p2 and c.site_id(+)= :p3 and a.wo_ptr = b.wo_ptr and a.wo_ptr=  '||
      ' :p4 and a.nsn=c.nsn(+) ';
*/

      vSQL := 'select reg_no, wo_no, a.nsn,nom,qty_req,to_char(required_date,''MM/DD/YYYY'') as required_date, '||
      ' a.rowid, c.boh from emdba.em_wo_parts_contention_t a, emdba.em_wo_t b, emdba.em_catalog_t c '||
      ' where a.site_id= :p1 and b.site_id= :p2 and c.site_id(+)= :p3 and a.wo_ptr = b.wo_ptr and a.wo_ptr=  '||
      ' :p4 and a.nsn=c.nsn(+) ';



      execute immediate vSQL bulk collect into rReg using psiteid,psiteid,psiteid,p_wo_ptr;
--      htp.p('REG Number'||chr(9)||'WO Number'||chr(9)||'NSN'||chr(9)||'NOM'||chr(9)||'Qty Req'||chr(9)||'Req Date'||chr(9)||'ptr'||chr(9)||'boh');
      htp.p('REG'||chr(9)||'WO'||chr(9)||'NSN'||chr(9)||'NOM'||chr(9)||'QtyReq'||chr(9)||'ReqDate'||chr(9)||'ptr'||chr(9)||'BOH');

--      for rReg in (select reg_no, wo_no, a.nsn,nom,qty_req,to_char(required_date,'MM/DD/YYYY') as required_date,a.rowid,c.boh from em_wo_parts_contention_t a, em_wo_t b, em_catalog_t c where a.site_id= psiteid and b.site_id= psiteid and c.site_id(+)= psiteid and a.wo_ptr = b.wo_ptr and a.wo_ptr= p_wo_ptr and a.nsn=c.nsn(+) ) loop
      for i in 1..rReg.count loop
         htp.p(rReg(i).reg_no||chr(9)||rReg(i).wo_no||chr(9)||rReg(i).nsn||chr(9)||rReg(i).nom||chr(9)||rReg(i).qty_req||chr(9)||rReg(i).required_date||chr(9)||rReg(i).rowid||chr(9)||rReg(i).boh);
      end loop;
     exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end em_getMaterialList;


   -- Procedure to save a work order material...
   procedure em_savewomaterial

   IS
   l_nsn em_wo_parts_contention_t.nsn%type;
   l_nom em_wo_parts_contention_t.nom%type;

   cursor csr_location(p_nsn in varchar2) is
   select location1
   from em_catalog_t
   where site_id = vm_global_pks.g_currentsiteid
   and nsn = p_nsn;

   l_location em_wo_parts_contention_t.location%type := '';

   BEGIN

     if vm_utility_pkg.getarrval('nsnnom') is not null then
         l_nsn := substr(vm_utility_pkg.getarrval('nsnnom'),1,16);
         l_nom := substr(vm_utility_pkg.getarrval('nsnnom'),17,length(vm_utility_pkg.getarrval('nsnnom'))-16);
     else
         l_nsn := vm_utility_pkg.getarrval('nsn');
         l_nom := vm_utility_pkg.getarrval('nom');
     end if;
     open csr_location(l_nsn);
     fetch csr_location into l_location;
     close csr_location;

    if vm_utility_pkg.getarrval('mode') in ('add') then
        insert into em_wo_parts_contention_t
        (
        site_id,
        cont_ptr,
        wo_ptr,
        nsn,
        nom,
        qty_req,
        required_date,
        stocked,
        location,
        create_date,
        create_user,
        mod_date,
        mod_user
        )
        values
        (
        vm_global_pks.g_currentsiteid,
        em_cont_ptr_seq.nextval,
        vm_utility_pkg.getarrval('wo_ptr'),
        l_nsn,
        l_nom,
        vm_utility_pkg.getarrval('qty_req'),
        to_date(vm_utility_pkg.getarrval('required_date'),'MM/DD/YYYY'),
        vm_utility_pkg.getarrval('chkstocked'),
        l_location,
        sysdate,
        vm_global_pks.g_current_userid,
        sysdate,
        vm_global_pks.g_current_userid
        );
     else
       update em_wo_parts_contention_t
       set
        nsn         = l_nsn,
        nom         = l_nom,
        qty_req     = vm_utility_pkg.getarrval('qty_req'),
        required_date = to_date(vm_utility_pkg.getarrval('required_date'),'MM/DD/YYYY'),
        stocked     = vm_utility_pkg.getarrval('chkstocked'),
        location    = l_location,
        mod_date    = sysdate,
        mod_user    = vm_global_pks.g_current_userid
       where rowid  = EM_ROWID_DEC(vm_utility_pkg.getarrval('materialrowid'));
     end if;
     commit;
     exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   END em_savewomaterial;

     -- Procedure to delete a work order material...
   procedure em_deletewomaterial
   is
   begin
      if vm_utility_pkg.getarrval('prowval') is null  then
        raise emissingkeyvalues;
      end if;
      delete from em_wo_parts_contention_t
      where rowid = EM_ROWID_DEC(vm_utility_pkg.getarrval('prowval'));
      commit;
   exception
      when emissingkeyvalues then
        vErrMsg := sqlerrm;
        rollback;
        raise_application_error(-20001, 'Missing Key Values');
      when others then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end;


-- returns a list of NSN..
procedure em_xmlnsn_list (psiteid in em_site_t.site_id%type
                          ,p_fsc in varchar2 default null) is
    cursor nsn is
      select nsn||replace(local_nomen,'&',';') "VALUE", nsn||'-'||rpad(replace(local_nomen,'&',';'),100)||'-'||rpad(ROOM_ID,50) "TEXT"
       from em_catalog_t
       where site_id = psiteid
       and nsn like '%'||p_fsc||'%'
       order by nsn,room_id;

 begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
   for cnsn in nsn loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||cnsn.VALUE||'</VALUE>');
     htp.p('<TEXT>'||cnsn.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
 exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
 end;

-- returns a list of NSN..
procedure em_xmlnom_list (psiteid in em_site_t.site_id%type,p_nom in varchar2 default null) is
    cursor nsn is
      select nsn||replace(local_nomen,'&',';') "VALUE", nsn||'-'||replace(local_nomen,'&',';')||'-'||room_id "TEXT"
       from em_catalog_t
       where site_id = psiteid
       and UPPER(local_nomen) like '%'||UPPER(p_nom)||'%'
       order by nsn,room_id;

 begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
   for cnsn in nsn loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||cnsn.VALUE||'</VALUE>');
     htp.p('<TEXT>'||cnsn.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
 exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
 end;
-- returns a list of NSN..
procedure em_xmlnsn (p_fsc in varchar2 default null) is
    cursor nsn is
      select nsn "VALUE", nsn "TEXT"
       from em_catalog_t
       where site_id = vm_global_pks.g_currentsiteid
       and nsn like '%'||p_fsc||'%';

 begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
   for cnsn in nsn loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||cnsn.VALUE||'</VALUE>');
     htp.p('<TEXT>'||cnsn.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
 exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
 end;

 -- return the BOH .
 procedure em_boh_prc(p_nsnnom in varchar2 default null,psiteid in em_site_t.site_id%type)
 is
   l_BOH   em_catalog_t.boh%type;
    cursor csr_em_catalog_t is
    select sum(boh)
    from em_catalog_t where NSN = p_nsnnom
    and site_id = psiteid;
 begin
    open csr_em_catalog_t;
    fetch csr_em_catalog_t into l_BOH;
    close csr_em_catalog_t;
     htp.p('<?xml version="1.0"?>');
     htp.p('<BOH>'||l_BOH||'</BOH>');
 exception
   when others then
         htp.p('<?xml version="1.0"?>');
         htp.p('<BOH>-1</BOH>');
 end;

 function em_boh_fnc(p_nsnnom in varchar2 default null,psiteid in em_site_t.site_id%type) return number
 is
   l_BOH   em_catalog_t.boh%type;
    cursor csr_em_catalog_t is
    select sum(boh)
    from em_catalog_t where NSN = p_nsnnom
    and site_id = psiteid;
 begin
    open csr_em_catalog_t;
    fetch csr_em_catalog_t into l_BOH;
    close csr_em_catalog_t;
    return l_boh;
 end;

-- returns a list of FSC..
procedure em_xmlfsc_list(pSiteID in em_site_t.site_id%type) is
    cursor fsc is
      select FSC_CODE "VALUE", FSC_CODE||'-'||replace(FSC_CODE_DESC,'&',';') "TEXT"
       from em_fsc_code_t
       where fsc_code in (select substr(NSN,1,4)
                            from em_catalog_t
                           where site_id = pSiteID);

 begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
   for cfsc in fsc loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||cfsc.VALUE||'</VALUE>');
     htp.p('<TEXT>'||cfsc.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
 exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
 end;

-- returns a list of FSC..
procedure em_xmlfsclist is
    cursor fsc is
      select FSC_CODE "VALUE", FSC_CODE||'-'||replace(FSC_CODE_DESC,'&',';') "TEXT"
       from em_fsc_code_t order by FSC_CODE;

 begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
   for cfsc in fsc loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||cfsc.VALUE||'</VALUE>');
     htp.p('<TEXT>'||cfsc.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
 exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
 end;

 procedure em_XMLGetAcroListEquipCnt(pSiteID   in  em_site_t.site_id%type,
                                       pSubsite in em_subsite_t.subsite_id%type default null,
                                       pECBM_ACTIVE in em_acronym_t.ecbm_active%type default null,
                                       pECBM_VIEW_ONLY in em_acronym_t.ecbm_view_only%type default null) is
     cursor cAcronyms is
      select distinct b.acronym VALUE, rpad(b.acronym,8)||' - '||F4772_REQ_FLAG TEXT
          from  em_acronym_t b
          where b.site_id = pSiteID
          and b.ACTIVE_FLAG = 'A'
          and
		  (
		  	(
		  	 nvl(b.ECBM_ACTIVE,'N') = NVL(pECBM_ACTIVE,nvl(b.ECBM_ACTIVE,'N'))
          	 and nvl(b.ECBM_VIEW_ONLY,'N') = NVL(pECBM_VIEW_ONLY,nvl(b.ECBM_VIEW_ONLY,'N'))
			)
			or
			(
			 nvl(b.ECBM_ACTIVE,'Y') = NVL(pECBM_ACTIVE,nvl(b.ECBM_ACTIVE,'Y'))
          	 and nvl(b.ECBM_VIEW_ONLY,'Y') = NVL(pECBM_VIEW_ONLY,nvl(b.ECBM_VIEW_ONLY,'Y'))
			)
		  )
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


-- Pass in an acronym, I'll respond back in XML telling whether it is 4772 required or not.
  procedure em_XMLIs4772Req(pSiteID in  em_site_t.site_id%type,
                            pAcronym in varchar2 default null
                            ) is
     cursor c4772Req  is
       select F4772_REQ_FLAG
         from em_acronym_t
         where site_id = pSiteID
         and acronym = pAcronym;

     v4772Req em_acronym_t.F4772_req_flag%type default 'N';
  begin
     open c4772Req;
     fetch c4772Req into v4772Req;
     close c4772Req;
     htp.p('<?xml version="1.0"?>');
     htp.p('<FLAGS>');
     htp.p('<F4772REQ>'||v4772Req||'</F4772REQ>');
     htp.p('</FLAGS>');
  exception
     when others then
         htp.p('<?xml version="1.0"?>');
         htp.p('<F4772REQ>-1</F4772REQ>');
  end em_XMLIs4772Req;

  -- Pass in equip_ptr, I'll respond back with an ecbm activeness.
  procedure em_get_ecbm_status(pSiteID in  em_site_t.site_id%type,
                            	pEquipPtr in em_equipment_t.equipment_ptr%type default null
                            ) is
     cursor csr_flag  is
       select nvl(a.ecbm_active,'N')
         from em_acronym_t a, em_equipment_t b
         where a.site_id = pSiteID
         and b.site_id = pSiteID
         and b.equipment_ptr = pEquipPtr
         and a.equip_cat_ptr = b.equip_cat_ptr;

     v_flag varchar2(1) := 'N';

  begin
     open csr_flag;
     fetch csr_flag into v_flag;
     close csr_flag;
     htp.p('<?xml version="1.0"?>');
     htp.p('<ecbm_active>'||v_flag||'</ecbm_active>');
  exception
     when others then
         htp.p('<?xml version="1.0"?>');
     htp.p('<ecbm_active></ecbm_active>');
  end;

-- Pass in equipment_ptr, I'll respond back with a class code.
  procedure em_get_class(pSiteID in  em_site_t.site_id%type,
            pEquipPtr in em_equipment_t.equipment_ptr%type default null
  ) is
     cursor csr_class  is
       select class_code
         from em_acronym_t a, em_equipment_t b
         where a.site_id = pSiteID
         and b.site_id = pSiteID
         and b.equipment_ptr = pEquipPtr
         and a.equip_cat_ptr = b.equip_cat_ptr;

     l_class_code  em_acronym_t.class_code%type;

  begin
     open csr_class;
     fetch csr_class into l_class_code;
     close csr_class;
     htp.p('<?xml version="1.0"?>');
     htp.p('<CLASSCODE>'||l_class_code||'</CLASSCODE>');
  exception
     when others then
         htp.p('<?xml version="1.0"?>');
     htp.p('<CLASSCODE></CLASSCODE>');
  end;

-- procedure to list class code for acronym
procedure em_XMLClassList_acro(pSiteID in varchar2 default null,
                               p_acro in varchar2 default null)
                               is


      cursor csr_equip_list is
         select  distinct equip_cat_ptr "VALUE", class_code "TEXT"
         from em_acronym_t
         where site_id = pSiteID
         and acronym=p_acro and active_flag='A'
         order by lpad(class_code,10,'0');

  begin

   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
     for x in csr_equip_list LOOP
     htp.p('<ROW>');
     htp.p('<VALUE>'||x.VALUE||'</VALUE>');
     htp.p('<TEXT>'||x.TEXT||'</TEXT>');
     htp.p('</ROW>');
     end loop;
   htp.p('</ROWSET>');
end;

-- 29/09/04 CM procedure to list class code for ALL Equipment with a specific
--             acronym and  subsite
procedure em_XMLClassList_acro_equip(pSiteID in varchar2 default null,
                                     p_acro in varchar2 default null,
                                     p_subsite_id    in varchar2 default '00',
                                     p_equip_status  in varchar2 :='A')
                                     is


      cursor csr_equip_list is
         select  distinct b.equip_cat_ptr "VALUE", b.class_code "TEXT"
         from em_equipment_t a, em_acronym_t b
         where a.site_id = pSiteID
         and a.subsite_id = p_subsite_id
         and a.site_id = b.site_id
         and a.equip_cat_ptr = b.equip_cat_ptr
         and b.active_flag = 'A'
         and b.acronym = p_acro
         order by lpad(class_code,10,'0');

  begin

   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
     for x in csr_equip_list LOOP
     htp.p('<ROW>');
     htp.p('<VALUE>'||x.VALUE||'</VALUE>');
     htp.p('<TEXT>'||x.TEXT||'</TEXT>');
     htp.p('</ROW>');
     end loop;
   htp.p('</ROWSET>');
end;

-- procedure to list equip no based on the acronym
  procedure em_XMLEquipList_acro(psiteid    in em_site_t.site_id%type,
                            p_subsite_id    in varchar2 default '00',
                            p_acro          in varchar2 default null,
                            p_equip_status  in varchar2 :='A',
                            pRegNo          in varchar2 default null
                            ) is

      cursor csr_equip_list is
         select  distinct equipment_ptr "VALUE", equip_no "TEXT"
         from em_equipment_t
         where site_id = psiteid
         and subsite_id = p_subsite_id
         and EQUIP_STATUS_CODE = p_equip_status
         and equip_cat_ptr in (Select equip_cat_ptr
         from em_acronym_t where site_id = psiteid
         and acronym=p_acro and active_flag='A')
         order by lpad(equip_no,50,'0');

  begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
     for x in csr_equip_list LOOP
     htp.p('<ROW>');
     htp.p('<VALUE>'||x.VALUE||'</VALUE>');
     htp.p('<TEXT>'||x.TEXT||'</TEXT>');
     htp.p('</ROW>');
     end loop;
   htp.p('</ROWSET>');
   end em_XMLEquipList_acro;


-- procedure to list equup no not already selected.
  procedure em_XMLEquipList_minus(psiteid    in em_site_t.site_id%type,
                            p_subsite_id    in varchar2 default '00',
                            p_acro          in varchar2 default null,
                            p_equip_status  in varchar2 :='A',
                            pRegNo          in varchar2 default null,
                            pWONO           in varchar2 default null
                            ) is

      cursor csr_equip_list is
         select  distinct equipment_ptr "VALUE", equip_no "TEXT"
         from em_equipment_t
         where site_id = psiteid
         and subsite_id = p_subsite_id
         and EQUIP_STATUS_CODE = p_equip_status
         and equip_cat_ptr in (Select equip_cat_ptr
         from em_acronym_t where site_id = psiteid
         and acronym=p_acro and active_flag='A')
         minus
         (select  distinct equipment_ptr "VALUE", equip_no "TEXT"
         from em_wo_t
         where site_id = psiteid and wo_type_code = 'C' and reg_no=pRegNo and wo_no = pWONO
         )
         order by 2;
  begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
     for x in csr_equip_list LOOP
     htp.p('<ROW>');
     htp.p('<VALUE>'||x.VALUE||'</VALUE>');
     htp.p('<TEXT>'||x.TEXT||'</TEXT>');
     htp.p('</ROW>');
     end loop;
   htp.p('</ROWSET>');
   end ;

-- Procedure to evoke an equipment item number list for a site and classification...
  procedure em_XMLEquipList_no(psiteid in em_site_t.site_id%type,
                            p_subsite_id      in  varchar2 default '00',
                            p_reg_no  in varchar2,
                            p_Acro   in  varchar2) is

      cursor csr_equip_list is
         (select  distinct equipment_ptr "VALUE", equip_no "TEXT"
         from em_equipment_t
         where site_id = psiteid
         and subsite_id = p_subsite_id
         and equip_status_code = 'A'
         and equip_cat_ptr in
           (select equip_cat_ptr from em_acronym_t where site_id =psiteid and acronym =p_Acro and active_flag='A')
         )
         order by lpad(equip_no,10,'0')         ;

  begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
       htp.p('<ROW>');
       htp.p('<VALUE></VALUE>');
       htp.p('<TEXT></TEXT>');
       htp.p('</ROW>');
     for x in csr_equip_list LOOP
       htp.p('<ROW>');
       htp.p('<VALUE>'||x.VALUE||'</VALUE>');
       htp.p('<TEXT>'||x.TEXT||'</TEXT>');
       htp.p('</ROW>');
     end loop;
   htp.p('</ROWSET>');
   end em_XMLEquipList_no;

-- Procedure to evoke an equipment item number list for a site and classification...
  procedure em_EquipList_no(psiteid in em_site_t.site_id%type,
                            p_subsite_id      in  varchar2 default '00',
                            p_reg_no  in varchar2,
                            p_Acro   in  varchar2) is

      cursor csr_equip_list is
         select  distinct equipment_ptr "VALUE", equip_no "TEXT"
         from em_equipment_t
         where site_id = psiteid
         and subsite_id = p_subsite_id
         and equip_status_code = 'A'
         and equip_cat_ptr in
           (select equip_cat_ptr from em_acronym_t where site_id =psiteid and acronym =p_Acro and active_flag='A')
         minus
         (select  distinct equipment_ptr "VALUE", equip_no "TEXT"
         from em_wo_t
         where site_id = psiteid and wo_type_code = 'C' and reg_no=p_reg_no
         )
         order by 2;

  begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
       htp.p('<ROW>');
       htp.p('<VALUE></VALUE>');
       htp.p('<TEXT></TEXT>');
       htp.p('</ROW>');
     for x in csr_equip_list LOOP
       htp.p('<ROW>');
       htp.p('<VALUE>'||x.VALUE||'</VALUE>');
       htp.p('<TEXT>'||x.TEXT||'</TEXT>');
       htp.p('</ROW>');
     end loop;
   htp.p('</ROWSET>');
   end;

-- Procedure to evoke project id list for a site ...
  procedure em_XMLProjectIdList_no(psiteid in em_site_t.site_id%type) is
      cursor csrprojlists is
        select project_id "VALUE",project_id||'-'||replace(substr(project_desc,1,20),'&',';') "TEXT" from em_project_t
        where site_id = psiteid
        and project_status = 'A'
        ORDER BY project_id ASC;
    begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
     htp.p('<ROW>');
     htp.p('<VALUE></VALUE>');
     htp.p('<TEXT></TEXT>');
     htp.p('</ROW>');
     for x in csrprojlists LOOP
     htp.p('<ROW>');
     htp.p('<VALUE>'||x.VALUE||'</VALUE>');
     htp.p('<TEXT>'||x.TEXT||'</TEXT>');
     htp.p('</ROW>');
     end loop;
   htp.p('</ROWSET>');
   end em_XMLProjectIdList_no;

-- Procedure to evoke whepfac_id list for a site ...
procedure getXMLFacility_whep_fac_id(pSiteID em_site_t.site_id%type) is

    cursor curfacility is
       select whep_fac_id "VALUE", SUBSTR(SUBSTR(ZIPCODE,1,5)||'-'||EM_REPLACE_CHARS(FACILITY_NAME),1,30) AS TEXT
         from em_subsite_facility_t
        where zipcode is not null
          and site_id = pSiteID
     order by ZIPCODE||'-'||FACILITY_NAME;

begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
   for rfacility in curfacility loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||rfacility.VALUE||'</VALUE>');
     htp.p('<TEXT>'||rfacility.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
end getXMLFacility_whep_fac_id;

   -- get rights
   procedure em_rights(psiteid in em_site_t.site_id%type,p_user_id in em_user_t.user_id%type) is

    l_rights varchar2(3) := 'NO';
   begin
     l_rights := chkrights_fnc(psiteid,p_user_id,'workorder');
     htp.p('<?xml version="1.0"?>');
     htp.p('<RIGHTS>'||l_rights||'</RIGHTS>');
   exception
     when others then
         htp.p('<?xml version="1.0"?>');
         htp.p('<RIGHTS>-1</RIGHTS>');
   end;
-- returns a list of crew..
procedure em_crew_list(psiteid in em_site_t.site_id%type)
    is

    cursor ccrews is
       select crew_id "VALUE",
	   		crew_id||'/'||replace(crew_supervisor,'&','and')||'/'||replace(crew_desc,'&','and') "TEXT",
			crew_status_code "ACTIVE"
        from em_crew_t
        where site_id = psiteid
        and CREW_STATUS_CODE = 'A'  -- 1/13/06:-Tehseen: Defect 254
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
     htp.prn('<TEXT>'||crews.TEXT);
     if crews.ACTIVE = 'I' THEN
        htp.prn(' (INACTIVE)');
     end if;
     htp.p('</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');

   exception
      when others  then
          null;
end;

    -- Returns XML list of register codes and descriptions...
    procedure em_getXMLRegList(psiteid in em_site_t.site_id%type) is
      cursor curReg is
        select reg_no VALUE, reg_no||'-'||replace(reg_name, '&', ';') TEXT
		from em_register_t where site_id = psiteid order by reg_no desc;
    begin
       htp.p('<?xml version="1.0"?>');
       htp.p('<ROWSET>');
       for recReg in curReg loop
          htp.p('<ROW>');
          htp.p('<VALUE>'||recReg.VALUE||'</VALUE>');
          htp.p('<TEXT>'||recReg.TEXT||'</TEXT>');
          htp.p('</ROW>');
       end loop;
       htp.p('</ROWSET>');
    end em_getXMLRegList;

    -- check if acronym/class exists in em_prod_acronym_t table
    procedure em_existopms(p_site_id in em_site_t.site_id%type,p_equip_cat_ptr in varchar2)
     is
     OPMS number;
    begin

     select count(equip_cat_ptr) into opms from em_prod_acronym_t
     where site_id = p_site_id and equip_cat_ptr in (select equip_cat_ptr from em_acronym_t where site_id = p_site_id and acronym = p_equip_cat_ptr);
    htp.p('<?xml version="1.0"?>');
    htp.p('<OPMS>'||opms||'</OPMS>');
    end;

  -- select the subsite based on the register.
    procedure em_regsubsite_prc(pSiteID in em_site_t.site_id%type,pRegNo in em_register_t.reg_no%type) is

      s_query constant varchar2(250) :=
        'select distinct a.subsite_id "VALUE", a.SUBSITE_ID||'' - ''||b.SUBSITE_NAME "TEXT" from em_register_t a, em_subsite_t b
         where a.site_id ='||pSiteID||
         ' and b.site_id = '||pSiteID||
         ' and a.subsite_id = b.subsite_id'||
         ' and b.status_flag = ''A'''||
         ' and a.reg_no ='||pRegNo;

    begin

      ctx   := dbms_xmlgen.newContext(s_query);
      myxml := dbms_xmlgen.getXML(ctx);
      htp.p(myxml);

    end;

  -- create DD for 1- 100 work orders
    procedure em_workordernum_prc(pSite em_site_t.site_id%type, pRegNo in em_wo_t.reg_no%type)
     is
     cursor csr_wono is
      select distinct wo_no
      from em_wo_t
      where site_id = TO_NUMBER(pSite)
      and reg_no = pRegNo
      and wo_no < 101;

     l_csr_wono em_wo_t.wo_no%type;

     l_wono varchar2(4000) default null;
    begin
      for x in csr_wono loop
        l_wono := x.wo_no||','||l_wono;
      end loop;
      if trim(l_wono) is null then
        l_wono := '0';
      else
        l_wono := ','||l_wono;
      end if;
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      for x in 1..100 loop
       if instr(l_wono,','||to_char(x)||',', 1) = 0 then
        htp.p('<ROW>');
        htp.p('<VALUE>'||x||'</VALUE>');
        htp.p('<TEXT>'||to_char(x)||'</TEXT>');
        htp.p('</ROW>');
       end if;
      end loop;
      htp.p('</ROWSET>');
    end;


   -- Returns a list of WO# for a site from EM_WO_T
   procedure em_XMLWONbr_List(pSite em_site_t.site_id%type
                              ,pRegNo in em_wo_t.reg_no%type)
     is
     cursor cWoNbrs is
      select wo_no
      from em_wo_t
      where site_id = TO_NUMBER(pSite)
      and reg_no = pRegNo;

    begin

      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');

      for cur_rec in CWoNbrs loop
        htp.p('<ROW>');
        htp.p('<VALUE>'||cur_rec.wo_no||'</VALUE>');
        htp.p('<TEXT>'||cur_rec.wo_no||'</TEXT>');
        htp.p('</ROW>');
      end loop;

      htp.p('</ROWSET>');

    end; --em_XMLWONbr_List


   -- Builds a work order search dialog. Dialog returns the Oracle rowid of the selected work order...
   procedure em_woSearchDialog( pSite       in  em_wo_t.site_id%type,
                                pRegNo      in  em_register_t.reg_no%type,
                                pWOType     in  em_wo_t.wo_type_code%type default 'C',
                                pWOStatus   in  em_wo_t.wo_status%type default 'O',
                                pWONo       in  em_wo_t.wo_no%type default null) is
      vSelected varchar2(12);
   begin
      htp.p('<body scroll="no" bgcolor="silver" onLoad="loadFunc()">');
      htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
      htp.p('<script language="javascript">');

      htp.p('function loadFunc() {document.all.reg_no.focus();}');
      htp.p('window.status="Ready to begin work order search."');

      htp.p('function clickFunction(col,row) { ');
      htp.p('   var srow=document.all.wogrid.getSelRow();');
      htp.p('   if (srow==0) { return } ');
      htp.p('   var vThisRow=document.all.wogrid.getCellText(14, srow);');--11
      htp.p('   opener.go1(vThisRow);');
      htp.p('   self.close();');
      htp.p('}');

      htp.p('function go1() {  ');
      htp.p('   window.staus="Searching...One Moment Please" ');
      htp.p('   vURL="em_work_pkg.em_getWOData?pSite='||pSite||'&pWOStatus='||pWOStatus||'&pRegNo="+document.all.reg_no.value+"&pWONo="+document.all.wonum.value;');
      htp.p('   objHTTP = new ActiveXObject("Microsoft.XMLHttp");');
      htp.p('   objHTTP.open("GET", vURL, false);');
      htp.p('   document.all.wodiv.innerHTML="<br><br>Searching...One Moment Please..."');
      htp.p('   objHTTP.send();');
      htp.p('   document.all.wodiv.innerHTML=objHTTP.responseText');
      htp.p('   setTimeout("setRowCount()", 500);');
      htp.p('}');

      htp.p('
            var tString = "";
            function typeAhead() {
                 var thisfield=window.event.srcElement;
                 if(window.event && window.event.keyCode == 13) {
                    document.all.wonum.focus();
                    return false;
                 }

                  // Global Variables
                  var i = 0;
                  var success = false;
                  var elem = event.srcElement;
                  var tLowElemText = "";
                  // Get the unicode char of the keypress
                  var eCode = event.keyCode;
                  // Check if it''s a vaid ASCII Character
                  if (eCode == 27){
                     tString = "";
                     elem.selectedIndex = 0;
                     try {
                        elem.onchange();
                     } catch(e) {}
                  } else if ( (eCode >= 32) && (eCode < 122)) {
                  // Convert the Code to the corresponding character and add to searchstring
                  tString += String.fromCharCode(eCode);
                  // ... and perform the search starting from the top element in the listbox
                     while (success == false)
                     {
                     i = 0;
                     // Convert everything to lowercase; allows an easy comparison
                     var tLowString = tString.toLowerCase();
                     // Compose the regexp searchstring ...
                     var rExpr = eval("/^" +  tLowString + "/");
                        while ((i < elem.length)&& (success == false) )
                        {
                           tLowElemText = elem.options[i].text.toLowerCase();
                           // success: Position the listbox on the (first) found element
                           if (tLowElemText.search(rExpr) != -1)
                            {
                              elem.selectedIndex = i;
                              try {
                                elem.onchange();
                              } catch(e) {}
                              success = true;
                           }
                           else {
                              i++; }
                        } // while i < elem.length
                        // if nothing is found in the entire list, the last character of the searstring is
                        // removed to allow typing the correct "next" character
                        if (success == false) {
                           tString = tString.substr(0, tString.length-1);
                        }
                     }   // while success = false
                  }
                  //   Just for demo use: updates the span displaying the typed
                  //     characters; remove from code before re-using
                  //   lchr.innerText =String.fromCharCode(eCode);
                  //   tsf.innerText = tString;
                  window.event.returnValue = false;
                  window.event.cancelBubble = true;            }

            function enterhit() {
                 var thisfield=window.event.srcElement;
                 if(window.event && window.event.keyCode == 13) {
                    document.all.btnGo.focus();
                    return false;
                 }
            }
      ');

      htp.p('function setRowCount() {');
      htp.p('  window.status=document.all.wogrid.getNumRows()+" work orders found."');
      htp.p('}');
      htp.p('</script>');
      htp.p('<div name="searchdiv" style="margin-top:2; margin-bottom:8; margin-right:4; margin-left:4;overflow:scroll;" class="captionMsmall">');
      htp.p('<fieldset><legend><font face="arial" size="2">Search Criteria</legend>');
      htp.TableOpen(cAttributes=>'cellpadding="3"');
         htp.TableRowOpen;
            htp.tableData('<font face="arial" size="2"><B>Register:', cAttributes=>'class="captionMsmall"');
            htp.p('<td>');
            htp.p('<select name="reg_no" class="captionmsmall"  onKeyPress="typeAhead()" onChange="document.all.wonum.value='''';">');
            for rReg in (select reg_no, reg_no||'-'||reg_name name from em_register_t where site_id=pSite and reg_no !='000'
             and substr(reg_no,2,2) != '90' order by reg_no desc ) loop
               vSelected := null;
               if rReg.reg_no = pRegNo then vSelected := 'SELECTED'; end if;
               htp.p('<option value="'||rReg.reg_no||'" '||vSelected||'>'||rReg.name||'</option>');
            end loop;
            htp.p('</select>');
            htp.p('</td>');
            htp.tableData('<font face="arial" size="2"><B>WO Number:', cAttributes=>'class="area"');
            htp.p('<td>');
            htp.p('<input type="text" name="wonum" size="8" onKeyPress="enterhit()" maxval="8"></input>');
            htp.p('</td>');
            htp.tableData('<font face="arial" size="2"><B><button value="GO" onClick="go1()" name="btnGo">GO</button>');
         htp.TableRowClose;
      htp.TableClose;
      htp.p('</fieldset>');
      htp.p('</div>');
      htp.p('<div name="wodiv" id="wodiv" style="text-align:left; font-family:arial; font-size: x-small;overflow:scroll;">
            <br>Select a register you wish to search, or the register plus the work order number if known, then click "GO" to begin searching.
      ');
      htp.p('</div>');
      htp.BodyClose;
   end em_woSearchDialog;

   -- Builds a work order search dialog. Dialog returns the Oracle rowid of the selected work order...
   procedure em_getWOData     ( pSite       in  em_wo_t.site_id%type,
                                pRegNo      in  em_register_t.reg_no%type,
                                pWOType     in  em_wo_t.wo_type_code%type default 'C',
                                pWOStatus   in  em_wo_t.wo_status%type default 'O',
                                pWONo       in  em_wo_t.wo_no%type default null) is

      type woRefCurType is ref cursor;
      woRefCur woRefCurType;

      vThisRow   number default 0;
      vNumRows   number default 0;

      type woRecType is record (
         reg_no em_register_t.reg_no%type,
         wo_no  em_wo_t.wo_no%type,
         work_code  em_wo_t.work_code%type,
         acronym    em_acronym_t.acronym%type,
         class      em_acronym_t.class_code%type,
         equip_no   em_equipment_t.equip_no%type,
         wo_status  em_wo_t.wo_status%type,
         crew_id    em_wo_t.crew_id%type,
         date_issued  varchar2(12),
         wo_desc    em_wo_t.wo_desc%type,
----
         fssp_call_num     em_wo_t.fssp_call_num%type
        ,fssp_problem_num  em_wo_t.fssp_problem_num%type
        ,fssp_zip          em_wo_t.fssp_zip%type,
---
----
         row_id     rowid );
--      recWOType woRecType;

      vSQL  varchar2(1500);
      vBGColor varchar2(12) := 'WHITE';

      type recTable is table of woRecType;
      recWOType recTable;

   begin
       vSQL := ' select /*INDEX_COMBINE*/ a.reg_no, a.wo_no, '
             ||'a.work_code, b.acronym, decode(a.combine_id,null,b.class_code,''''), '
             ||' decode(a.combine_id,null,a.equip_no,''ALL'') as equip_no, a.wo_status, '
             ||'a.crew_id, to_char(a.date_issued, ''MM/DD/YYYY'') date_issued, '
             ||'a.wo_desc,'
             ---
             ||'a.fssp_call_num,'
             ||'a.fssp_problem_num,'
             ||'a.fssp_zip,'
             ---
             ||'EM_ROWID_ENC(a.rowid) '||
          ' from em_wo_t a, em_acronym_t b '||
          ' where a.site_id = '||pSite||
          ' and b.site_id = '||pSite||
          ' and a.equip_cat_ptr = b.equip_cat_ptr '||
          ' and nvl(combine_id,wo_ptr) = wo_ptr '||
          ' and a.wo_type_code = ''C'' ';
		  ----|| ' and a.wo_status = ''O'' ';   --jesse 2103.2.12
           if pRegNo is not null then
            vSQL := vSQL||' and a.reg_no='||pRegNo;
          end if;
          if pWONo is not null then
             vSQL := vSQL||' and a.wo_no='||pWONo;
          end if;
          vSQL := vSQL||'  order by reg_no,lpad(wo_no,8,''0''),lpad(acronym,10,''0''),lpad(equip_no,10,''0'')';
--      open woRefCur for vSQL;
      execute immediate vSQL bulk collect into recWOType;
      vm_utility_pkg.startGrid('wogrid');
      htp.p('<param name="numcols" value="14"/>');--11
      htp.p('<param name="colheadertext" value="Reg No,WO No,WC,Acronym,CC,Equip No,Stts,Crew,Dt Issued,WO Description"/>');
      -- jesse htp.p('<param name="colwidths" value="30,65,30,150,40,80,60,40,70,120,0,0,0,0"/>');
      htp.p('<param name="colwidths" value="30,65,30,80,30,80,35,45,70, 600,0,0,0,0"/>');
      htp.p('<param name="sortcolumns" value="1,2,3,4,5,6,7,8,9,10"/>');
      htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
      htp.p('<param name="cellsreleasedfunction" value="selRow" />');
      htp.p('<param name="urlframe" value="dummyframe">');
      htp.p('<param name="clickFunction" value="clickFunction" />');
--      loop
--         fetch woRefCur into recWOType;
--         exit when woRefCur%notfound;
         for i in 1..recWOType.count loop
         vThisRow := vNumRows + 1;
         htp.p('<param name="row'||vThisRow||'text" value="');
         if recWOType(i).equip_no='OPMS' then
           htp.p(recWOType(i).reg_no||','||recWOType(i).wo_no||','||recWOType(i).work_code||','||
           recWOType(i).acronym||','||''||','||recWOType(i).equip_no||','||
           recWOType(i).wo_status||','||recWOType(i).crew_id||','||recWOType(i).date_issued||','||
           replace(recWOType(i).wo_desc,',',':')||','||
           ---
           recWOType(i).fssp_call_num||','||
           recWOType(i).fssp_problem_num||','||
           recWOType(i).fssp_zip||','||
           ---
           recWOType(i).row_id||'"></param>');
         else
           htp.p(recWOType(i).reg_no||','||recWOType(i).wo_no||','||recWOType(i).work_code||','||
           recWOType(i).acronym||','||recWOType(i).class||','||recWOType(i).equip_no||','||
           recWOType(i).wo_status||','||recWOType(i).crew_id||','||recWOType(i).date_issued||','||
           replace(recWOType(i).wo_desc,',',':')||','||
           ---
           --htp.p('<param name="row'||vThisRow||'text" value="'||  ||'"></param>');
           recWOType(i).fssp_call_num||','||
           recWOType(i).fssp_problem_num||','||
           recWOType(i).fssp_zip||','||

           ---
           recWOType(i).row_id||'"></param>');
         end if;
         vNumRows := vNumRows + 1;
      end loop;
      htp.p('<param name="numrows" value="'||vNumRows||'" />');

      --jesse add this line
      vm_utility_pkg.endGrid;

      htp.p('</div>');
      vTotalRowCount := vNumRows;
      htp.BodyClose;
     exception
      when others then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end em_getWOData;

-- procedure to get the year.
    procedure get_year is
    l_yr varchar2(4) :=2002;
    begin
      select
          fy
       into
          l_yr
       from
          em_ap_calendar_t
       where
       trunc(sysdate)
      between start_date and end_date;
      htp.p('<?xml version="1.0" ?>');
      htp.p('<YR>'||l_yr||'</YR>');
    exception
      when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<YR>-1</YR>');
      end;


  -- create DD for 1- 99 reg no
    procedure em_regnum_prc(pSiteID in em_site_t.site_id%type)
     is

     --last digit of current FY, eg 1 out of 2011, 0 out of 2010
     l_yr varchar2(4) := substr(EM_GET_CURRENT_FY(sysdate),4,1);

     -- existing reg_no(s) for current FY
     cursor csr_regno is
      select substr(reg_no,2) reg_no
      from em_register_t
      where site_id = pSiteID
        and substr(reg_no,1,1) = l_yr;

     l_csr_regno em_wo_t.reg_no%type;
     l_regno varchar2(4000) default null;

    begin
      l_yr := substr(EM_GET_CURRENT_FY(sysdate),4,1);
      for x in csr_regno loop
        l_regno := x.reg_no||','||l_regno;
      end loop;
      if trim(l_regno) is null then
        l_regno := '0';
      else
        l_regno := rtrim(l_regno,',');
      end if;
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      for x in 1..99 loop
        if EM_GET_CURRENT_FY(sysdate) >= '2011' and x > 70 then
            null;
            --doing nothing. from fiscal year of 2011, reg_no 71 ~ 99 are reserved for
            /*  2010.7.29 based on Kathy Carrico
                reg_no    desc              | subsite ID
                ----------------------------------------
                x71     | FSS Work Order    | any
                x72     |                   | any
                x73     | MWO - FMO         | 20
                x74     | MSB - FMO         | 20
                x75     | SMO - FMO         | 20
                x76     | MMO - FMO         | 20
                ........
                x83     | MWO - S & B       | 50
                x84     | MSB - S & B       | 50
                x85     | SMO - S & B       | 50
                x86     | MMO - S & B       | 50
                ........
                x90     | Reactive          | any
                ........
                x93     | MWO               | 00
                x94     | MSB               | 00
                x95     | SMO               | 00
                x96     | MMO               | 00
                ........
                ----------------------------------------
            */
        else
            if instr(l_regno, lpad(x,2,0), 1) = 0 then
                htp.p('<ROW>');
                htp.p('<VALUE>'||lpad(x,2,'0')||'</VALUE>');
                htp.p('<TEXT>'||lpad(to_char(x),2,'0')||'</TEXT>');
                htp.p('</ROW>');
            end if;
        end if;
      end loop;
      htp.p('</ROWSET>');
    end;

  -- create DD for 1- 99 reg no
    procedure em_regnumall_prc
     is
    begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
      for x in 1..99 loop
        htp.p('<ROW>');
        htp.p('<VALUE>'||lpad(x,2,'0')||'</VALUE>');
        htp.p('<TEXT>'||lpad(to_char(x),2,'0')||'</TEXT>');
        htp.p('</ROW>');
      end loop;
      htp.p('</ROWSET>');
    end;

-- count # of records in register
procedure em_regcnt_prc(psiteid in em_site_t.site_id%type) is
  cursor csr_lbcnt is
  select count(*)
  from em_Register_t
  where site_id = pSiteID;

  l_cnt  PLS_INTEGER := 0;

begin
  select count(*) into l_cnt
  from em_Register_t
  where site_id = pSiteID;
  htp.p('<?xml version="1.0"?>');
  htp.p('<REGCOUNT>'||l_cnt||'</REGCOUNT>');
exception
  when others then
      htp.p('<?xml version="1.0"?>');
      htp.p('<REGCOUNT>-1</REGCOUNT>');
end;

-- make sure duplicate item is not inserted.
procedure em_chk_dupwo_prc
  (
  pSiteID in em_wo_t.site_id%type default null,
  pRegNo in em_wo_t.reg_no%type default null,
  pWONO in em_wo_t.wo_no%type default null,
  pECP  in em_wo_t.equip_cat_ptr%type default null,
  pEN   in em_wo_t.equip_no%type default null
  )
  is
  cursor chkdup1 is
  select 1 from em_wo_t
  where site_id = pSiteID
  and reg_no = pRegNo
  and wo_no = pWONO
  and equip_cat_ptr = pECP
  and equip_no = pEN;

  cursor chkdup2 is
  select 1 from em_wo_t
  where site_id = pSiteID
  and reg_no = pRegNo
  and wo_no = pWONO;

  l_no PLS_INTEGER :=0;
  l_found PLS_INTEGER := 0;

begin
 if pRegNo < 90 then
    open chkdup2;
    fetch chkdup2 into l_no;
    if chkdup2%found then
       l_found := 4;
    end if;
    close chkdup2;
 else
    open chkdup1;
    fetch chkdup1 into l_no;
    if chkdup1%found then
       l_found := 4;
    end if;
    close chkdup1;
 end if;

 htp.p('<?xml version="1.0" ?>');
 htp.p('<DUPWORK>'||l_found||'</DUPWORK>');

 exception
   when others then
    htp.p('<?xml version="1.0" ?>');
    htp.p('<DUPWORK>-1</DUPWORK>');
end;

procedure em_getStatus is
   begin
      htp.p('<?xml version="1.0"?>');
      htp.p('<ROWSET>');
         htp.p('<ROW>');
         htp.p('<VALUE>O</VALUE>');
         htp.p('<TEXT>Open</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>C</VALUE>');
         htp.p('<TEXT>Closed</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>B</VALUE>');
         htp.p('<TEXT>ByPass</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>L</VALUE>');
         htp.p('<TEXT>Late</TEXT>');
         htp.p('</ROW>');
         htp.p('<ROW>');
         htp.p('<VALUE>P</VALUE>');
         htp.p('<TEXT>Pending</TEXT>');
         htp.p('</ROW>');
      htp.p('</ROWSET>');
   end;

-- procedure to check for multiuser
  procedure em_chkmultiuser_prc (pSiteID in em_site_t.site_id%type, pWoNo in em_wo_t.wo_no%type,pRegNo in em_wo_t.reg_no%type)
   is

    cursor ckhmu is
     select  1   from em_wo_t
     where site_id =pSiteID
     and nvl(combine_id,wo_ptr) = wo_ptr
     and wo_type_code = 'C'
     and wo_no = pWoNo
     and reg_no = pRegNo;
     l_num PLS_INTEGER := 0;
     l_flag varchar2(1) :='N';
   begin
     open ckhmu;
     fetch ckhmu into l_num;
     if ckhmu%found then
        l_flag :='Y';
     end if;
     close ckhmu;
     htp.p('<?xml version="1.0"?>');
     htp.p('<CHKDUPWONO>'||l_flag||'</CHKDUPWONO>');
   exception
     when others then
       htp.p('<?xml version="1.0"?>');
       htp.p('<CHKDUPWONO>N</CHKDUPWONO>');
   end;

   procedure getcurrentYear IS
   begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<CURRENTFY>'||substr(vm_utility_pkg.getCurrentFY, 4, 1)||'</CURRENTFY>');
   end;


-- procedure to check for duplicate equipno
  procedure em_chkequipno_prc (pSiteID in em_site_t.site_id%type,pSubsiteID in varchar2 default null,
  pWoNo in em_wo_t.wo_no%type,pRegNo in em_wo_t.reg_no%type,pEquipNo in varchar2 default null)
   is

    cursor ckhmu is
     select  1
     from em_wo_t
     where site_id = pSiteID and subsite_id = pSubsiteID and wo_type_code = 'C' and reg_no=pRegNo
     and wo_no = pWONO and equip_no = pEquipNo;
     l_num PLS_INTEGER := 0;
     l_flag varchar2(1) :='N';
   begin
     open ckhmu;
     fetch ckhmu into l_num;
     if ckhmu%found then
        l_flag :='Y';
     end if;
     close ckhmu;
     htp.p('<?xml version="1.0"?>');
     htp.p('<CHKDUPEQUIP>'||l_flag||'</CHKDUPEQUIP>');
   exception
     when others then
       htp.p('<?xml version="1.0"?>');
       htp.p('<CHKDUPEQUIP>N</CHKDUPEQUIP>');
   end;

   ---------------------------------------
   -- procedure to create the list for the past due reason dropdown
   ---------------------------------------

   procedure em_XMLPastDueReasonList is

           cursor c_PastDueReasonList is
                select to_char(a.reason_code) "VALUE",  to_char(a.reason_code)||'. '||trim(a.past_due_reason) AS TEXT
                 from emdba.em_past_due_reason_t a
            order by a.reason_code;

        begin
           htp.p('<?xml version="1.0"?>');
           htp.p('<ROWSET>');
           for i in c_PastDueReasonList loop
             htp.p('<ROW>');
             htp.p('<VALUE>'||i.VALUE||'</VALUE>');
             htp.p('<TEXT>'||i.TEXT||'</TEXT>');
             htp.p('</ROW>');
           end loop;
           htp.p('</ROWSET>');
        end em_XMLPastDueReasonList;

   ---------------------------------------
   -- procedure to check the work order due date for its past due status
   -- if it is past due then it sends a "Y" back to the interface
   ---------------------------------------


    procedure em_isWOPastDue(pSiteID in em_site_t.site_id%type,
                             pWoPtr     in em_wo_t.wo_ptr%type default null)

              is

                v_wo_date_due   emdba.em_wo_t.date_due%type;
                v_isWOPastDue   varchar2(1):='N';
                v_wo_status     emdba.em_wo_t.wo_status%type;

              begin

                select date_due, wo_status
                into v_wo_date_due, v_wo_status
                from emdba.em_wo_t
                where site_id = pSiteID
                and wo_ptr = pWoPtr;

                htp.p('<?xml version="1.0"?>');
                if trunc(v_wo_date_due) < trunc(sysdate) and v_wo_status = 'O' then -- work order is past due
                    htp.p('<ISPASTDUE>Y</ISPASTDUE>');
                ELSE
                    htp.p('<ISPASTDUE>N</ISPASTDUE>');
                end if;
            end;


--------------------------------------------------------------------------------
PROCEDURE em_getMTSCTicketXML IS

    CURSOR cur_mtsc is
        SELECT a.mtsc_ticket_code "VALUE", a.mtsc_ticket_code||'-'||REPLACE(a.mtsc_ticket_desc,'&',';')"TEXT"
        FROM emdba.em_mtsc_open_ticket_code_t a
        WHERE a.active_flag='A'
        ORDER BY a.mtsc_ticket_code;

BEGIN

    htp.p('<?xml version="1.0"?>');
    htp.p('<ROWSET>');
    htp.p('<ROW>');
    htp.p('<VALUE></VALUE>');
    htp.p('<TEXT></TEXT>');
    htp.p('</ROW>');
    FOR rec_mtsc IN cur_mtsc LOOP
        htp.p('<ROW>');
        htp.p('<VALUE>'||rec_mtsc.VALUE||'</VALUE>');
        htp.p('<TEXT>'||rec_mtsc.TEXT||'</TEXT>');
        htp.p('</ROW>');
    END LOOP;
    htp.p('</ROWSET>');

END;

--------------------------------------------------------------------------------
PROCEDURE em_chk_MTSC_default_user(pSiteID in em_site_t.site_id%TYPE, pUser_id IN emdba.em_user_t.user_id%TYPE) IS

    CURSOR csr_1 IS
        SELECT
        TRIM(a.last_name)||', '||NVL2(TRIM(a.middle_name),TRIM(a.middle_name)||', ',TRIM(a.middle_name))||TRIM(a.first_name) req_name,
        REGEXP_REPLACE(a.tel_no1, '([[:digit:]]{3})([[:digit:]]{4})([[:digit:]]{4})', '(\1) \2-\3') tel_no1,
        --TRIM(REPLACE(TO_CHAR(a.tel_no1,'999,999,9999'),',','-')) tel_no1,
        TRIM(a.user_logon) user_logon
        FROM emdba.em_user_t a
        WHERE --a.site_id =pSiteID AND
        a.user_id=pUser_id ;

    v_name       VARCHAR2(50):= 'NA';
    v_phone      VARCHAR2(20):= '000-000-0000';
    v_user_logon VARCHAR2(16):= 'NA';

BEGIN
    OPEN csr_1;FETCH csr_1 INTO v_name, v_phone, v_user_logon;CLOSE csr_1;
    htp.p('<?xml version="1.0"?>');htp.p('<ROWSET>');htp.p('<ROW>');
    htp.p('<VAL1>'||NVL(TRIM(v_name),'-1')||'</VAL1>');
    htp.p('<VAL2>'||NVL(TRIM(v_phone),'-1')||'</VAL2>');
    htp.p('<VAL3>'||NVL(TRIM(v_user_logon),'-1')||'</VAL3>');
    htp.p('</ROW>');htp.p('</ROWSET>');
EXCEPTION
  WHEN others then
   htp.p('<?xml version="1.0"?>');
   htp.p('<VAL1>-1</VAL1>');
END;

--------------------------------------------------------------------------------
PROCEDURE em_chk_MTSC_Ticket(pSiteID in emdba.em_site_t.site_id%TYPE, pWoPtr IN emdba.em_wo_t.wo_ptr%TYPE) IS

    CURSOR csr_1 IS
        SELECT
            1,
            a.mtsc_knowledge_page,
            a.mtsc_problem_desc,
            a.mtsc_requestor_name,
            a.mtsc_requestor_ace_id,
            a.mtsc_requestor_phone,
            a.mtsc_equipment_status,
            To_CHAR(a.mtsc_start_date, 'MM/DD/YYYY') mtsc_start_date,
            a.mtsc_start_time,
            a.mtsc_ticket_no,
            a.mtsc_ticket_status
        FROM emdba.em_wo_mtsc_ticket_t a
        WHERE a.site_id=pSiteID
        AND a.wo_ptr=pWoPtr
        AND a.processed='Y'
        AND a.updated='N';

    CURSOR csr_2 IS
        SELECT
            1,
            a.mtsc_knowledge_page,
            a.mtsc_problem_desc,
            a.mtsc_requestor_name,
            a.mtsc_requestor_ace_id,
            a.mtsc_requestor_phone,
            a.mtsc_equipment_status,
            To_CHAR(a.mtsc_start_date, 'MM/DD/YYYY') mtsc_start_date,
            a.mtsc_start_time,
            a.mtsc_ticket_no,
            a.mtsc_ticket_status
        FROM emdba.em_wo_mtsc_ticket_t a
        WHERE a.site_id=pSiteID
        AND a.wo_ptr=pWoPtr
        AND a.processed='Y'
        AND a.updated='Y';

    CURSOR csr_3 IS
        SELECT
            1
        FROM emdba.em_wo_t a
        WHERE a.site_id=pSiteID
        AND a.wo_ptr=pWoPtr
        --AND a.wo_status='O'
        AND a.work_code IN ('08','23');

    l_l_l BOOLEAN := FALSE;l_l PLS_INTEGER := 0;rec1 csr_1%ROWTYPE;
    l_l_l_2 BOOLEAN := FALSE;l_l_2 PLS_INTEGER := 0;rec2 csr_2%ROWTYPE;
    l_l_l_3 BOOLEAN := FALSE;l_l_3 PLS_INTEGER := 0;rec3 csr_3%ROWTYPE;


BEGIN

    OPEN csr_1;FETCH csr_1 INTO rec1;l_l_l := csr_1%FOUND;CLOSE csr_1;
    OPEN csr_2;FETCH csr_2 INTO rec2;l_l_l_2 := csr_2%FOUND;CLOSE csr_2;
    OPEN csr_3;FETCH csr_3 INTO rec3;l_l_l_3 := csr_3%FOUND;CLOSE csr_3;

    htp.p('<?xml version="1.0"?>');htp.p('<ROWSET>');htp.p('<ROW>');
    IF l_l_l = TRUE THEN
       htp.p('<VAL1>1</VAL1>');
       htp.p('<VAL2>'||TRIM(rec1.mtsc_knowledge_page)||'</VAL2>');
       htp.p('<VAL3>'||TRIM(rec1.mtsc_problem_desc)||'</VAL3>');
       htp.p('<VAL4>'||TRIM(rec1.mtsc_requestor_name)||'</VAL4>');
       htp.p('<VAL5>'||TRIM(rec1.mtsc_requestor_ace_id)||'</VAL5>');
       htp.p('<VAL6>'||TRIM(rec1.mtsc_requestor_phone)||'</VAL6>');
       htp.p('<VAL7>'||TRIM(rec1.mtsc_equipment_status)||'</VAL7>');
       htp.p('<VAL8>'||TRIM(rec1.mtsc_start_date)||'</VAL8>');
       htp.p('<VAL9>'||TRIM(rec1.mtsc_start_time)||'</VAL9>');
       htp.p('<VAL10>'||TRIM(rec1.mtsc_ticket_no)||'</VAL10>');
       htp.p('<VAL11>'||TRIM(rec1.mtsc_ticket_status)||'</VAL11>');

    ELSE
      IF l_l_l_2 = TRUE THEN
       htp.p('<VAL1>-2</VAL1>');
       htp.p('<VAL2>'||TRIM(rec2.mtsc_knowledge_page)||'</VAL2>');
       htp.p('<VAL3>'||TRIM(rec2.mtsc_problem_desc)||'</VAL3>');
       htp.p('<VAL4>'||TRIM(rec2.mtsc_requestor_name)||'</VAL4>');
       htp.p('<VAL5>'||TRIM(rec2.mtsc_requestor_ace_id)||'</VAL5>');
       htp.p('<VAL6>'||TRIM(rec2.mtsc_requestor_phone)||'</VAL6>');
       htp.p('<VAL7>'||TRIM(rec2.mtsc_equipment_status)||'</VAL7>');
       htp.p('<VAL8>'||TRIM(rec2.mtsc_start_date)||'</VAL8>');
       htp.p('<VAL9>'||TRIM(rec2.mtsc_start_time)||'</VAL9>');
       htp.p('<VAL10>'||TRIM(rec2.mtsc_ticket_no)||'</VAL10>');
       htp.p('<VAL11>'||TRIM(rec2.mtsc_ticket_status)||'</VAL11>');
      ELSE
         IF (l_l_l_3 = TRUE AND l_l_l != TRUE) THEN
             htp.p('<VAL1>-1</VAL1>');
         ELSE
             htp.p('<VAL1>-3</VAL1>');
         END IF;
      END IF;
    END IF;
    htp.p('</ROW>');htp.p('</ROWSET>');


EXCEPTION
  WHEN others then
   htp.p('<?xml version="1.0"?>');htp.p('<ROWSET>');htp.p('<ROW>');
   htp.p('<VAL1>-1</VAL1>');htp.p('</ROW>');htp.p('</ROWSET>');
END;

--------------------------------------------------------------------------------
PROCEDURE em_save_MTSC_Ticket0823
           IS

    error_msg VARCHAR2(300);

BEGIN
    htp.p('<?xml version="1.0"?>');
    htp.p('<VAL1>1</VAL1>');
EXCEPTION
    WHEN OTHERS THEN
        htp.p('<?xml version="1.0"?>');
        htp.p('<VAL1>-1</VAL1>');
        error_msg:= SQLERRM;
        em_error_pkg.em_ErrorInsert_prc;
        RAISE;
END;
--------------------------------------------------------------------------------


end; -- package body em_work_pkg
/
