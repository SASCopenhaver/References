CREATE OR REPLACE PACKAGE EMAPP.em_order_pkg is
-- Purpose: Order Screen.
-- MODIFICATION HISTORY
-- Person              Date    Comments
-- Tehseen Khokhar     6/2003
-- Tehseen 10/01/2003
-- $Header: /EMARS/Development/Database/Schemas/EMAPP/EMAPP.EM_ORDER_PKG.PSK 9     4/22/09 10:08a Mehdinh1 $
   vTotalRowCount   number := 0;

   procedure em_orderButtons;

-- returns a list of order status..
   procedure em_xml_os;

-- returns a list of source code..
   procedure em_xml_sc;


-- Gens HTML list of parts for a purchase order (TA Sept 7);
   procedure purchaseParts(pSiteId  in  em_site_t.site_id%type,
                           pOrderPtr    in  varchar2);

-- Gens grid list of parts needing auto7381 approval.
   procedure getAutoList(pSiteID in em_site_t.site_id%type);

   procedure div7381(pSiteId    in  em_site_t.site_id%type);

-- list of 7381s needing approval
   procedure getApprovalList(pSiteID  in  em_site_t.site_id%type);

-- Builds a order search dialog. Dialog returns the Oracle rowid of the selected work order...
   procedure em_getOrderData    (
                                pSite               in  em_order_t.site_id%type,
--                                p_order_date_s      in  em_order_t.order_date%type default null,
--                                p_order_date_e      in  em_order_t.order_date%type default null,
                                p_order_date_s      in  varchar2 default null,
                                p_order_date_e      in  varchar2 default null,
                                p_nsn               in  em_order_t.nsn%type default null,
                                p_nom               in  em_order_t.nom%type default null,
                                p_order_type_code   in  em_order_t.order_type_code%type default null,
                                p_module_id         in  em_order_t.module_id%type default null,
                                p_order_by_emp_id   in  em_order_t.order_by_emp_id%type default null,
                                p_order_for_emp_id  in  em_order_t.order_for_emp_id%type default null,
                                p_ne                in  em_order_t.order_for_emp_id%type default null,
                                p_wo_ptr            in  em_order_t.wo_ptr%type default null,
                                p_order_status_code in  em_order_t.order_status_code%type default null,
                                p_source_code       in  em_order_t.source_code%type default null,
                                p_open_yn           in  varchar2 default null
                                );
-- grid to display orders.
--   procedure em_getOrderList(prowid in rowid);
-- Builds a NSN search dialog. returns the nsn
   procedure em_getNSNData (pSite in  em_order_t.site_id%type);

-- get a list of requisition codes
   procedure em_XMLReqList;

-- get a list of source codes
   procedure em_XMLSourceCodes;

-- get a list of source codes
   procedure em_XMLSourceCodesStocked;

-- get a list of source codes
   procedure em_XMLSourceCodesNonStocked;


-- returns a list of emp id..
   procedure em_XMLEmpID_List(pSiteID in  em_site_t.site_id%type);

-- Builds a NSN search dialog for create order. returns the rowid
   procedure em_getCoNSNData (
            pSite in  em_order_t.site_id%type,
            p_NSN in em_catalog_t.nsn%type default null,
            p_NOM in em_catalog_t.local_nomen%type default null
            );
-- Procedure get_wo_data via find...
   procedure em_getCO(p_rowid in varchar2);

-- Returns all registers
   procedure em_getXMLRegisterList(pSiteID in em_site_t.site_id%type);

-- Returns work orders a reg no
   procedure em_wo_no_list(pSiteID in em_site_t.site_id%type, p_reg_no in em_register_t.reg_no%type);

-- Builds a Work order  search dialog for create stocked orders. returns the wono
   procedure em_getCoWONOData (
            pSite in  em_order_t.site_id%type,
            p_reg_no in em_register_t.reg_no%type default null
            );
-- save stocked orders
   procedure em_savestockedorders_prc;
   procedure em_savestocked_prc
    (
     p_site_id          in varchar2 default null,
     p_fy               in varchar2 default null,
     p_order_for_emp_id in varchar2 default null,
     p_nsn              in varchar2 default null,
     p_nom              in varchar2 default null,
     p_source_code      in varchar2 default null,
     p_bulk_unit        in varchar2 default null,
     p_qty_ordered      in varchar2 default null,
     p_uoi_code         in varchar2 default null,
     p_boh              in varchar2 default null,
     p_inv_group_code   in varchar2 default null,
     p_wo_ptr           in varchar2 default null,
     p_order_comment    in varchar2 default null,
     p_order_justif     in varchar2 default null,
     p_create_user      in varchar2 default null,
     p_mod_user         in varchar2 default null,
     p_receipt_unit_cost in varchar2 default null,
     p_order_type_code  in varchar2 default null,
     p_for_stock        in varchar2 default null,
     p_module_id        in varchar2 default 'STOCKED',
     p_commit           in varchar2 default 'Y',
     p_issuePtr         in varchar2 default null,
     p_orderStatus      in varchar2 default 'N',  -- added by TA
     p_roq              in number default null,
     p_roq_ind          in number default null,
     p_rights           in varchar2 default 'S',
     p_transfer_site_id in varchar2 default null,
     p_transfer_part_ptr in varchar2 default null,
     p_bulk_qty          in varchar2 default '0'
    );

-- save nonstocked orders
    procedure em_savenonstockedorders_prc;
    procedure em_savenonstocked_prc
    (
     pSiteID            in varchar2 default null,
     p_fy               in varchar2 default null,
     p_order_for_emp_id in varchar2 default null,
     p_nsn              in varchar2 default null,
     p_source_code      in varchar2 default null,
     p_bulk_unit        in varchar2 default null,
     p_qty_ordered      in varchar2 default null,
     p_uoi_code         in varchar2 default null,
     p_inv_group_code   in varchar2 default null,
     p_wo_ptr           in varchar2 default null,
     p_order_comment    in varchar2 default null,
     p_order_justif     in varchar2 default null,
     p_create_user      in varchar2 default null,
     p_mod_user         in varchar2 default null,
     p_receipt_unit_cost in varchar2 default null,
     p_order_type_code  in varchar2 default null,
     p_for_stock        in varchar2 default null,
     p_bulk_qty         in varchar2 default '0'
    );


-- check the number of orders ordered but not filled.
   procedure em_ckhorders_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type);

-- Procedure to list UOI and bulk unit
   procedure em_XMLUOIList;

-- Procedure to list group codes
   procedure em_XMLGCList;

-- procedure to check if the nsn is stocked.
   procedure em_chk_nsn_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type);

-- procedure to check if the nsn is stocked.
   procedure em_chk_nsn_mdims_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type);

-- procedure to check if the nsn is stocked.
   procedure em_chk_ssl_item_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type);

-- procedure to check if the nsn is stocked.
   procedure em_chk_nsn_replaced_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type);

-- Procedure to list order status
   procedure em_XMLOSList;

-- Procedure to list group codes
   procedure em_XMLVCList(pSiteID   in  em_site_t.site_id%type);

-- Procedure to list aic codes
   procedure em_XMLAICList;

-- Procedure to list facilities
   procedure em_XMLFACList(pSiteID in em_site_t.site_id%type);

-- save local 7381
   function  em_savelocal7381_fnc return varchar2;

-- Builds a Work order  search dialog for create stocked orders. returns the wono
   procedure em_getlocalData(pSiteID in em_site_t.site_id%type);
-- Builds a search dialog for autoreplenish local
    procedure em_getlocalAutoData(pSiteID in em_site_t.site_id%type,p_order_no in varchar2 default null,  padd in varchar2 default null);

-- fill the local screen based on the search
    procedure em_filllocalData(pSiteID in em_site_t.site_id%type,pRowID in varchar2 default null,
    pType in varchar2 default null,
    p_order_no in varchar2 default null

    );
    procedure em_filllocalDatanow(pSiteID in em_site_t.site_id%type,pRowID in varchar2 default null,
    pType in varchar2 default null,
    p_order_no in varchar2 default null
    );
-- fill the local screen based on the Autoreplenish
    procedure em_filllocalDataAuto(pSiteID in em_site_t.site_id%type,pRowID in varchar2 default null,
    pType in varchar2 default null,
    p_order_no in varchar2 default null
    );

-- Supplies, Services or Equipment Information grid...
--   procedure em_getEquipData(pSiteID in  em_order_t.site_id%type,p_order_no in  em_order_t.order_no%type default null);
   procedure em_getEquipData(pSiteID in  varchar2 default null,p_order_no in  varchar2 default null);
-- Procedure to list of folders
   procedure em_XMLFOLDERList(pSiteID in em_site_t.site_id%type);

-- Procedure to select vendor and oem from db.
   procedure em_nsn_l_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_vendor_part_t.part_nsn%type);

-- delete local grid
   procedure em_delete_nsn_prc(prowid in varchar2 default null);

-- Builds a search dialog for create auto orders. Returns the rowid
   procedure em_getautoData(pSiteID in em_site_t.site_id%type);

-- fill the auto screen based on the search
   procedure em_fillautoData(pSiteID in em_site_t.site_id%type,pRowID in varchar2 default null);

-- Auto order grid
   procedure em_fillautogrid(pSiteID in em_order_t.site_id%type,p_order_no in  em_order_t.order_no%type default null);

-- Auto grid iframe
   procedure autogridiframe(pSiteID in em_site_t.site_id%type,pUser in varchar2 default null);

-- Auto replenishment procedures.
   procedure em_view_autoreplenish_prc
   (
    psiteid in em_site_t.site_id%type default null,
    pUser in varchar2 default null,
    p_message       in varchar2 default null
    );

---SCR 00383
   PROCEDURE EM_VIEW_AUTOREPLENISH_ESPIN_f1;

-- Auto replenishment procedures ESPIN.
   procedure EM_VIEW_AUTOREPLENISH_ESPIN
   (
    psiteid in em_site_t.site_id%type default null,
    pUser in varchar2 default null,
    p_message       in varchar2 default null
    );

   procedure em_save_autoreplenish_prc
   (
    pSiteID         in em_site_t.site_id%type default null,
    pUser           in varchar2 default null,
    p_reorder       in owa.vc_arr,
    p_ptr           in owa.vc_arr,
--    p_chk           in owa.vc_arr,
--   p_chk_clone     in owa.vc_arr,
    p_message       in varchar2 default null,
    p_action        in varchar2,
    p_action_id     in varchar2,
    p_auto_justification in owa.vc_arr,
    p_auto_roq      in owa.vc_arr,
    p_rights        in varchar2
   );

   procedure em_save_autoreplenish_espin
   (
    pSiteID         in em_site_t.site_id%type default null,
    pUser           in varchar2 default null,
    p_reorder       in owa.vc_arr,
    p_ptr           in owa.vc_arr,
--    p_chk           in owa.vc_arr,
--   p_chk_clone     in owa.vc_arr,
    p_message       in varchar2 default null,
    p_action        in varchar2,
    p_action_id     in varchar2,
    p_auto_justification in owa.vc_arr,
    p_auto_roq      in owa.vc_arr,
    p_rights        in varchar2,
    p_transfer_item       in owa.vc_arr,
    p_transfer_site_id    in owa.vc_arr,
    p_transfer_part_ptr   in owa.vc_arr

   );


-- view orders screen
  procedure em_vieworders(pRowID in varchar2 default null);
-- Builds a pending list for processing.
   procedure em_getPendingData    (pSite    in  em_order_t.site_id%type);
-- delete orders
   procedure em_delete(pRowID in varchar2 default null);
-- release orders
   procedure em_release(pRowID in varchar2 default null);
--  Data for stocked via nsn(catalog table)...
   procedure em_getStockedData(pSiteID in varchar2 default null,p_nsn in varchar2 default null);
-- returns a list of emp name..
   procedure em_XMLEmpName_List(pSiteID in  em_site_t.site_id%type);
   PROCEDURE EM_AUTOREPLENISH_COUNT(pSiteID in em_site_t.site_id%type default null);
-- change status of orders
   procedure em_change_status_prc(pSiteID   in em_site_t.site_id%type default null,
                                  pOrderID  in em_order_t.order_no%type,
                                  pStatus   in varchar2 default null,
                                  pReqNO    in varchar2 default null);
-- Display requisition number field
   procedure checkreq_prc(pSiteID in em_site_t.site_id%type default null);
-- cancel scan orders
   procedure em_cancelscanorders(pRowID in varchar2 default null, puser number default 0);
-- procedure to check if the work order number exists for the register.
   procedure em_checkwono_prc(pSiteID in em_site_t.site_id%type, pRegNO in em_wo_t.reg_no%type, pWONO in em_wo_t.wo_no%type);
-- Gives the user the option of cancelling the processing of auto7381. SNAFU BUG 11544.
   procedure em_cancelauto7381(pSiteID in em_site_t.site_id%type,p_order_no in varchar2 default null);

   function em_getordercount_fnc (pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type)
   return number;

   function em_getwono(pWoPtr in em_wo_t.wo_ptr%type,pSiteID in em_site_t.site_id%type) return number;

   procedure em_check_auto_prc(pSiteID in em_site_t.site_id%type);

   procedure em_check_bu(pSiteID in em_site_t.site_id%type,pNSN in em_catalog_t.nsn%type,pUOICode in em_catalog_t.uoi_code%type );

   procedure em_getStockedlocalData(pSiteID in varchar2 default null,p_nsn in varchar2 default null);
-- procedure to check if the requisition numberis unique.
   procedure em_checkreq_prc(pSiteID in em_site_t.site_id%type, pLocReqNo in varchar2 default null);
-- Builds a search dialog for printing historical 7381
   procedure em_getlocalhist(pSiteID in em_site_t.site_id%type);
-- Builds a search dialog for printing historical 7381 auto
   procedure em_getlocalAutoHist(pSiteID in em_site_t.site_id%type,
   p_order_no in varchar2 default null);



  PROCEDURE em_XMLUser_EAS (pSiteID IN emdba.em_site_t.site_id%TYPE);
  PROCEDURE check_user_eas_roq_rights(pSiteID IN emdba.em_site_t.site_id%TYPE,
                           p_user_id IN emdba.em_user_t.user_id%type);
  PROCEDURE em_XML_EAS_Activated;
  FUNCTION EAS_Activated_fnc RETURN VARCHAR2;

end;
/
CREATE OR REPLACE PACKAGE BODY EMAPP.EM_ORDER_PKG is
-- Purpose: Order Screen.
-- MODIFICATION HISTORY
-- Person              Date    Comments
-- Tehseen Khokhar     6/2003
-- Tehseen 10/01/2003
-- $Header: /EMARS/Development/Database/Schemas/EMAPP/EMAPP.EM_ORDER_PKG.PBK 29    4/27/12 4:07p Jesse $

  ctx dbms_xmlgen.ctxhandle;
  myxml     varchar2(16000);
  vErrMsg   varchar2(255);

  procedure em_orderButtons is
  begin
     htp.TableOpen(cAttributes=>'class="infolabel" style="width: 0" bgcolor="#DCDCDC" cellpadding="2" valign="top"');
     htp.TableRowOpen;
     htp.p('<td><fieldset>');
     htp.TableOpen(cAttributes=>'class="infolabel" style="width: 0" bgcolor="#DCDCDC" cellpadding="6" valign="top"');
       htp.TableRowOpen;
          htp.TableData('<input type="button" id="btnCreate" name="btnCreate" value="New Order" class="tablerowdark" style="margin-left: 0; margin-right: 0; width: 100" onClick="createOrder()">');
       htp.TableRowClose;
       htp.TableRowOpen;
          htp.TableData('<input type="button" id="btnUpdate" name="btnCreate" value="Update Order" class="tablerowdark" style="margin-left: 0; margin-right: 0; width: 100" onClick="updateOrder()">');
       htp.TableRowClose;
       htp.TableRowOpen;
          htp.TableData('<input type="button" id="btnDelete" name="btnCreate" value="Cancel Order" class="tablerowdark" style="margin-left: 0; margin-right: 0; width: 100" onClick="deleteOrder()">');
       htp.TableRowClose;
       htp.TableRowOpen;
       htp.TableData('<BR><BR>');
       htp.TableRowClose;
       htp.TableRowOpen;
          htp.TableData('<input type="button" value="Release Pend." class="tablerowdark" style="margin-left: 0; margin-right: 0; width: 100" onClick="releasePending()">');
       htp.TableRowClose;
     htp.TableClose;
     htp.p('</fieldset></td>');
     htp.TableRowClose;
     htp.TableClose;
     htp.TableClose;
  end;


-- returns a list of order status..
procedure em_xml_os is
    cursor csr_os is
      select order_status_code "VALUE", order_status_code||'-'||order_status_desc "TEXT"
       from em_order_status_code_t;
 begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
     htp.p('<ROW>');
     htp.p('<VALUE></VALUE>');
     htp.p('<TEXT></TEXT>');
     htp.p('</ROW>');
   for cos in csr_os loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||cos.VALUE||'</VALUE>');
     htp.p('<TEXT>'||cos.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
 exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
 end;

-- returns a list of source code..
procedure em_xml_sc is
    cursor csr_sc is
      select source_code "VALUE",source_code||'-'|| source_code_desc "TEXT"
       from em_source_code_t;
 begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
     htp.p('<ROW>');
     htp.p('<VALUE></VALUE>');
     htp.p('<TEXT></TEXT>');
     htp.p('</ROW>');
   for csc in csr_sc loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||csc.VALUE||'</VALUE>');
     htp.p('<TEXT>'||csc.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
 exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
 end;
 -- Builds a order search dialog. Dialog returns the Oracle rowid of the selected order...
 procedure em_getOrderData    ( pSite               in  em_order_t.site_id%type,
                                p_order_date_s      in  varchar2 default null,
                                p_order_date_e      in  varchar2 default null,
                                p_nsn               in  em_order_t.nsn%type default null,
                                p_nom               in  em_order_t.nom%type default null,
                                p_order_type_code   in  em_order_t.order_type_code%type default null,
                                p_module_id         in  em_order_t.module_id%type default null,
                                p_order_by_emp_id   in  em_order_t.order_by_emp_id%type default null,
                                p_order_for_emp_id  in  em_order_t.order_for_emp_id%type default null,
                                p_ne                in  em_order_t.order_for_emp_id%type default null,
                                p_wo_ptr            in  em_order_t.wo_ptr%type default null,
                                p_order_status_code in  em_order_t.order_status_code%type default null,
                                p_source_code       in  em_order_t.source_code%type default null,
                                p_open_yn           in  varchar2 default null
                                ) is

    --variables to get the grid data
    type csr_ref_cursor is ref cursor;
    csr_ref          csr_ref_cursor;
    csr_data_ref     csr_ref_cursor;
    r_grid_data      sg_widget_grid_t%rowtype;
    row_count        number:=0;
    v_sql            varchar2(4000);
    v_sqlstm         varchar2(4000) default null;
    v_valuerow       varchar2(4000);
    v_site_id        em_site_t.site_id%type;
    v_siteid_param   varchar2(100) default null;
    v_nsn_param      varchar2(100) default null;
    v_nom_param      varchar2(100) default null;
    v_loc_param      varchar2(100) default null;
    v_oem_param      varchar2(100) default null;
    v_filled         varchar2(1) :='N';

    -- Dynamic sql related variables
    csr_handle       integer;
    n_return         integer;
    vFlags           varchar2(255) := 'rowselection,resizecolumns,autoresizecols,useattributes,resizerows,rownumbers,rowlines,collines,rowheader,colheader,vscroll,threedborder,sortrowheaders';

     begin
       vm_utility_pkg.startGrid(pGridName=>'gridOrders',pHeight=>'180',pWidth=>'750',pUseFlags=>'HIST');
          htp.p('<param name="numcols" value="16"/>');
          htp.p('<param name="colheadertext" value="SC,SC,NSN,NOM,For Stock,Order Dt,Qty,UI,Status,Wrk Ord,Order For,Ship No,Order No,Loc Req No,rowid,cancel_flag"/>');
          htp.p('<param name="colwidths" value="35,0,125,175,100,70,40,40,200,60,100,50,80,150,0,10"/>');
          htp.p('<param name="sortcolumns" value="1,2,3,4,5,6,7,8,9,10,11,12,13"/>');
          htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
          htp.p('<param name="doubleclickFunction" value="clickOrderFunction" />');
          htp.p('<param name="clickfunction" value="cancelClick" />');

          v_sql:='select nvl(source_code,''-'')||'',''||nvl(a.order_status_code,''-'')'||
          '||'',''||nsn||'',''||EM_REPLACE_CHARS(nom)||'',''||for_stock||'',''||'||
          'to_char(a.order_date,''MM-DD-YYYY'')||'',''||qty_ordered||'',''||uoi_code||'',''||'||
          'nvl(nvl(a.ORDER_STATUS_DESC,c.ORDER_STATUS_DESC),''-'')||'',''||'||
          'nvl(b.wo_no,''0'')||'',''||em_replace_chars(order_for_emp_id)||'',''||'||
          ' nvl(to_char(shipped_order_cnt),''-'')||'',''||order_no||'',''||po_num||'',''||'||
          'EM_ROWID_ENC(a.rowid)||'',''||EM_CAN_ORDER_BE_CANCELED_FNC(a.rowid) '
          ||'"rowdata" from em_order_t a , em_wo_t b ,em_order_status_code_t c where   '||
          '  a.site_id = '||pSite||
          '  and b.site_id(+) = '||pSite||
          ' and a.order_status_code=c.order_status_code(+) '||
          ' and a.order_status_code != ''VC1''' ||
          ' and a.wo_ptr = b.wo_ptr(+) ';

          if p_NSN is not null then
            v_sqlstm:=v_sqlstm||' and NSN like ''%'||p_NSN||'%'' ';
          end if;
          if p_NOM is not null then
            v_sqlstm:=v_sqlstm||' and upper(nom) like upper(''%'||p_NOM||'%'') ';
          end if;
          if p_order_type_code is not null then
            v_sqlstm:=v_sqlstm||' and a.order_type_code='''||p_order_type_code||'''';
          end if;
          if p_module_id is not null then
            v_sqlstm:=v_sqlstm||' and a.module_id='''||p_module_id||'''';
          end if;
          if p_order_by_emp_id is not null then
            v_sqlstm:=v_sqlstm||' and upper(order_by_emp_id) like upper(''%'||p_order_by_emp_id||'%'') ';
          end if;
          if p_order_for_emp_id is not null then
            v_sqlstm:=v_sqlstm||' and upper(order_for_emp_id) like upper(''%'||p_order_for_emp_id||'%'') ';
          end if;
          if p_ne is not null then
            v_sqlstm:=v_sqlstm||' and upper(order_for_emp_id) like upper(''%'||p_ne||'%'') ';
          end if;
          if p_open_yn is not null then
            if p_open_yn = 'Y' then
                  v_filled :='N';
             else
                  v_filled :='Y';
            end if;
            v_sqlstm:=v_sqlstm||' and order_filled_flag='''||v_filled||'''' ;
          end if;
          if p_order_status_code is not null then
            v_sqlstm:=v_sqlstm||' and a.order_status_code='''||p_order_status_code||'''';
          end if;
          if p_source_code is not null then
            v_sqlstm:=v_sqlstm||' and a.source_code='''||p_source_code||'''';
          end if;
          if p_wo_ptr is not null then
            v_sqlstm:=v_sqlstm||' and upper(order_no) like upper(''%'||p_wo_ptr||'%'') ';
          end if;
          if p_order_date_s is not null then
            v_sqlstm:=v_sqlstm||' and a.order_date>=to_date('''||p_order_date_s||''',''MM/DD/YYYY'')';
          end if;
          if p_order_date_e is not null then
            v_sqlstm:=v_sqlstm||' and a.order_date-1<=to_date('''||p_order_date_e||''',''MM/DD/YYYY'')';
          end if;
          v_sql:=v_sql||v_sqlstm||' order by order_no';
         open csr_data_ref for v_sql;
          loop
          fetch csr_data_ref into v_valuerow;
          exit when csr_data_ref%notfound;
          row_count:=row_count+1;
          htp.p('<param   name="row'||row_count||'text" value="'||v_valuerow||'"/>');
         end loop;
         close csr_data_ref;

         if row_count=0 then
            htp.p('<param   name="row1text" value="-,No data found."/>');
         end if;
         --We want at least a certain number of rows to show
         if row_count < r_grid_data.min_rows then
            row_count:=r_grid_data.min_rows;
         end if;
         htp.p('<param name ="numrows" value ="'||to_char(row_count)||'"/>');
      vm_utility_pkg.endGrid;
   --   em_error_pkg.em_log_prc(v_sql,'R');
  exception
    when others then
       em_error_pkg.em_error_prc;
--       raise;
end;

-- Builds a NSN search dialog. returns the nsn
procedure em_getNSNData (pSite in  em_order_t.site_id%type) is

   type woRefCurType is ref cursor;
   woRefCur woRefCurType;
   vThisRow   number default 0;
   vNumRows   number default 0;
   type woRecType is record (
     nsn                em_catalog_t.nsn%type,
     local_nomen        em_catalog_t.local_nomen%type,
     rop                em_catalog_t.rop%type,
     boh                em_catalog_t.boh%type,
     source_code        em_catalog_t.source_code%type,
     location1          em_catalog_t.location1%type
     );
--   recWOType woRecType;
   type NSNDATA is table of woRecType;
   recWOType NSNDATA;

    vSQL  varchar2(500);
   vBGColor varchar2(12) := 'WHITE';
begin
      htp.p('<body scroll="no" bgcolor="silver">');
      htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
      htp.p('<script language="javascript">');
      htp.p('window.status="Ready to begin order search."');
      htp.p('function clickFunction(col,row) { ');
      htp.p('   var srow=document.all.wogrid.getSelRow();');
      htp.p('   if (srow==0) { return } ');
      htp.p('   var vThisRow=document.all.wogrid.getCellText(1, srow);');
      htp.p('   opener.goNSN(vThisRow);');
      htp.p('}');
      htp.p('</script>');
      htp.p('</body>');
       vSQL := 'select nsn,EM_REPLACE_CHARS(local_nomen),rop,boh,source_code,location1 '||
       ' from em_catalog_t a '||
       ' where a.site_id = :1  '||
       ' and status_flag = ''Y''' ||
       ' order by nsn';
       execute immediate vSQL bulk collect into recWOType using pSite;
--      open woRefCur for vSQL using pSite;
      vm_utility_pkg.startGrid('wogrid');
      htp.p('<param name="numcols" value="6"/>');
      htp.p('<param name="colheadertext" value="NSN,NOM,ROP,BOH,SC,LOC"/>');
      htp.p('<param name="colwidths" value="90,210,50,50,50,100"/>');
      htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
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
         htp.p(recWOType(i).nsn||','||recWOType(i).local_nomen||','||recWOType(i).rop||','||
           recWOType(i).boh||','||recWOType(i).source_code||','||
           recWOType(i).location1||'"></param>');
         vNumRows := vNumRows + 1;
      end loop;
      htp.p('<param name="numrows" value="'||vNumRows||'" />');
      htp.p('</div>');
      vTotalRowCount := vNumRows;
      htp.BodyClose;
   exception
      when others then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end ;

 -- get a list of requisition codes
  procedure em_XMLReqList is
     cursor reqlist is
     select ORDER_TYPE_CODE VALUE, ORDER_TYPE_CODE||'-'||ORDER_TYPE_desc TEXT
     from em_ORDER_TYPE_code_t where REQUISITION_FLAG = 'Y' and order_type_code !='L';
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     htp.p('   <ROW>');
     htp.p('    <VALUE></VALUE>');
     htp.p('    <TEXT></TEXT>');
     htp.p('   </ROW>');
     for rlist in reqlist loop
       htp.p('   <ROW>');
       htp.p('    <VALUE>'||rlist.value||'</VALUE>');
       htp.p('    <TEXT>'||rlist.text||'</TEXT>');
       htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end em_XMLReqList;

 -- get a list of source codes
  procedure em_XMLSourceCodes is
     cursor sourcecode is
     select source_code VALUE, source_code ||'-'|| source_code_desc TEXT from em_source_code_t;

  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     htp.p('<ROW>');
     htp.p('<VALUE></VALUE>');
     htp.p('<TEXT></TEXT>');
     htp.p('</ROW>');
     for rlist in sourcecode loop
     htp.p('   <ROW>');
     htp.p('    <VALUE>'||rlist.value||'</VALUE>');
     htp.p('    <TEXT>'||rlist.text||'</TEXT>');
     htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;
 -- get a list of source codes
  procedure em_XMLSourceCodesStocked is
     cursor sourcecode is
     select source_code VALUE, source_code ||'-'|| source_code_desc TEXT from em_source_code_t;

  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     htp.p('<ROW>');
     htp.p('<VALUE></VALUE>');
     htp.p('<TEXT></TEXT>');
     htp.p('</ROW>');
     for rlist in sourcecode loop
     htp.p('   <ROW>');
     htp.p('    <VALUE>'||rlist.value||'</VALUE>');
     htp.p('    <TEXT>'||rlist.text||'</TEXT>');
     htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

 -- get a list of source codes
  procedure em_XMLSourceCodesNonStocked is
     cursor sourcecode is
     select source_code VALUE, source_code ||'-'|| source_code_desc TEXT from em_source_code_t
     where source_code IN ('1','A','D','G','R','S','T') ORDER BY source_code ;

  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     htp.p('<ROW>');
     htp.p('<VALUE></VALUE>');
     htp.p('<TEXT></TEXT>');
     htp.p('</ROW>');
     for rlist in sourcecode loop
     htp.p('   <ROW>');
     htp.p('    <VALUE>'||rlist.value||'</VALUE>');
     htp.p('    <TEXT>'||rlist.text||'</TEXT>');
     htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

-- returns a list of emp id..
procedure em_XMLEmpID_List(pSiteID in  em_site_t.site_id%type) is
    cursor users is
      select emp_id "VALUE", upper(last_name)||decode(first_name, null, null, ', ')||upper(first_name)||' - '||emp_id "TEXT"
       from em_employee_t
       where site_id = pSiteID and active_flag = 'A' order by last_name;
 begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
     htp.p('<ROW>');
     htp.p('<VALUE></VALUE>');
     htp.p('<TEXT></TEXT>');
     htp.p('</ROW>');
   for cusers in users loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||cUsers.VALUE||'</VALUE>');
     htp.p('<TEXT>'||cUsers.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
 exception
      when others then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
 end;
-- returns a list of emp name..
procedure em_XMLEmpName_List(pSiteID in  em_site_t.site_id%type) is
  cursor users is
      select upper(replace(Last_name,'&',''))||','||middle_name "VALUE", replace(Last_name,'&','')||','||First_name|| ' ' ||middle_name||' - '||employee_no "TEXT"
       from em_employee_t
       where site_id = pSiteID and active_flag = 'A' order by last_name;
 begin
   htp.p('<?xml version="1.0"?>');
   htp.p('<ROWSET>');
     htp.p('<ROW>');
     htp.p('<VALUE></VALUE>');
     htp.p('<TEXT></TEXT>');
     htp.p('</ROW>');
   for cusers in users loop
     htp.p('<ROW>');
     htp.p('<VALUE>'||cUsers.VALUE||'</VALUE>');
     htp.p('<TEXT>'||cUsers.TEXT||'</TEXT>');
     htp.p('</ROW>');
   end loop;
   htp.p('</ROWSET>');
 exception
      when others then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
 end;

-- Builds a NSN search dialog for create order. returns the rowid
procedure em_getCoNSNData (
            pSite in  em_order_t.site_id%type,
            p_NSN in em_catalog_t.nsn%type default null,
            p_NOM in em_catalog_t.local_nomen%type default null
            ) is

   type woRefCurType is ref cursor;
   woRefCur woRefCurType;
   vThisRow   number default 0;
   vNumRows   number default 0;
   type woRecType is record (
     nsn                em_catalog_t.nsn%type,
     local_nomen        em_catalog_t.local_nomen%type,
     rop                em_catalog_t.rop%type,
     boh                em_catalog_t.boh%type,
     duein             number,
     source_code        em_catalog_t.source_code%type,
     location1          em_catalog_t.location1%type,
     row_id             rowid
     );
--   recWOType woRecType;
   type CONSN is table of woRecType;
   recWOType CONSN;

   vSQL  varchar2(500);
   vBGColor varchar2(12) := 'WHITE';
begin
      htp.p('<body scroll="no" bgcolor="silver">');
      htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
      htp.p('<script language="javascript">');
      htp.p('window.status="Ready to begin order search."');
      htp.p('function clickFunction(col,row) { ');
      htp.p('   var srow=document.all.wogrid.getSelRow();');
      htp.p('   if (srow==0) { return } ');
      htp.p('   var vThisRow=document.all.wogrid.getCellText(1, srow);'); --9/2/2004 RSD changed from col 8
      htp.p('   opener.goCoNSN(vThisRow);');
      htp.p('}');
      htp.p('</script>');
      htp.p('</body>');
       vSQL := 'select nsn,local_nomen,rop,boh,em_order_pkg.em_getordercount_fnc('||pSite||',nsn) as duein, '||
       ' source_code,location1,EM_ROWID_ENC(rowid) '||
       ' from em_catalog_t a '||
       ' where a.site_id = '||pSite||
       ' and source_code != ''L'' '||
       '  and status_flag = ''Y''';
      if p_NSN is not null then
          vSQL:=vSQL||' and NSN like '''||p_NSN||'%'' ';
      end if;
      if p_NOM is not null then
         vSQL:=vSQL||' and upper(local_nomen) like upper(''%'||p_NOM||'%'') ';
      end if;
         vSQL:=vSQL||' order by nsn';
--      open woRefCur for vSQL;
      execute immediate vSQL bulk collect into recWOType;
      vm_utility_pkg.startGrid('wogrid');
      htp.p('<param name="numcols" value="8"/>');
      htp.p('<param name="colheadertext" value="NSN,NOM,ROP,BOH,Duein,SC,LOC"/>');
      htp.p('<param name="colwidths" value="120,300,50,50,50,80,80,0"/>');
      htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
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
         htp.p(recWOType(i).nsn||','||em_replace_chars(recWOType(i).local_nomen)||','||recWOType(i).rop||','||
           recWOType(i).boh||','||recWOType(i).duein||','||recWOType(i).source_code||','||recWOType(i).location1||','||recWOType(i).row_id||'"></param>');
         vNumRows := vNumRows + 1;
      end loop;
      htp.p('<param name="numrows" value="'||vNumRows||'" />');
      htp.p('</div>');
      vTotalRowCount := vNumRows;
      htp.BodyClose;
   exception
      when others then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end ;

   --  Data for stocked via nsn(catalog table)... tk
   --9/2/2004  RSD Since the TOTAL BOH needs to be all stock rooms and not one this function
   -- should be considered obsolete and the one below which selects by SITE ID and NSN called instead
    procedure em_getCO(p_rowid in varchar2) is
      s_query constant varchar2(4000) :=
         'select nsn as nsn_s, source_code, location1,inv_group_cd_1 as inv_group_cd,'
         ||' critical_flag , insurance_flag, '
         ||' bulkpack as bulk_quantity,EM_ROQ_ROWID_FNC ('''||EM_ROWID_DEC(p_rowid)||''') as roq,'
         ||' bulk_unit as bulk_unit, unit_cost,boh ,uoi_code as unit_of_issue,local_nomen as nom_s'
         ||' from em_catalog_t   '
         ||' where  rowid = '''||EM_ROWID_DEC(p_rowid)||'''';
    begin
     --htp.p(s_query);
     ctx := dbms_xmlgen.newContext(s_query);
     myxml := dbms_xmlgen.getXML(ctx);
     htp.p(myxml);
    exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
    end em_getCO;

--  Data for stocked via nsn(catalog table)
--  9/2/2004 Robbie added inline view to select sum of boh for the part for TOTAL BOH
    procedure em_getStockedData(pSiteID in varchar2 default null,p_nsn in varchar2 default null) is
      s_query constant varchar2(4000) :=
         'select a.nsn as nsn_s, a.source_code, a.location1, a.inv_group_cd_1 as inv_group_cd,'
         ||' a.critical_flag , a.insurance_flag, '
         ||' a.bulkpack as bulk_quantity,EM_ROQ_SITE_NSN_FNC ('||psiteid||','||''''||p_nsn||''') as roq,'
         ||' a.bulk_unit as bulk_unit, a.unit_cost,'
         ||' (select SUM(boh) from em_catalog_t where site_id= '||pSiteID||' and nsn ='''||p_nsn||''') as boh,'
         ||' EM_INV_UPDATE_PKG.return_boh('||psiteid||','||''''||p_nsn||''',room_id) as replaced_boh, '
         ||' a.uoi_code as unit_of_issue, decode(TO_CHAR(INSTR(a.local_nomen,''REPLACED'')),''0'',a.local_nomen,b.nomenclature) as nom_s'
         ||' from em_catalog_t A, em_mdims_catalog_t b '
         ||' where a.site_id= '||pSiteID
         ||' and a.nsn = b.nsn and a.nsn ='''||p_nsn||''' and room_id=''A''';


    begin
     --htp.p(s_query);
       ctx := dbms_xmlgen.newContext(s_query);
       myxml := dbms_xmlgen.getXML(ctx);
       htp.p(myxml);
    exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
    end;
-- tab out of NSN in local screen. It fills the info from catalog.
    procedure em_getStockedlocalData(pSiteID in varchar2 default null,p_nsn in varchar2 default null) is
      s_query constant varchar2(4000) :=
         'select nsn as nsn_l, uoi_code as unit_l,unit_cost as cost_l,OEM1 as oem_l,local_nomen as nom_l,'
         ||' EM_ROQ_SITE_NSN_FNC ('||psiteid||','||''''||p_nsn||''') as roq_l,'
         ||' critical_flag as critical_l, insurance_flag as insurance_l, '
         ||' (select SUM(boh) from em_catalog_t where site_id= '||pSiteID||' and nsn ='''||p_nsn||''') as boh_l'
         ||' from em_catalog_t  '
         ||' where site_id='||pSiteID
         ||' and source_code=''L'''
         ||' and nsn = '''||p_nsn||'''';
    begin
     ctx := dbms_xmlgen.newContext(s_query);
     myxml := dbms_xmlgen.getXML(ctx);
     htp.p(myxml);
    exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
    end;


   -- Returns all registers 10/20/2004 for the last 4 years
   procedure em_getXMLRegisterList(pSiteID in em_site_t.site_id%type) is
      s_query clob :=
        'select reg_no "VALUE", reg_no||''-''||replace(reg_name,''&'',''&amp;'') "TEXT" from em_register_t '||
        ' where substr(reg_no,2,2) != ''90'''||
        ' and reg_no !=''000'''||
        ' and site_id = '||pSiteID;
       CURSOR  em_getXMLRegisterList is
        select reg_no "VALUE", reg_no||'-'||replace(reg_name,'&','&amp;') "TEXT" from em_register_t
         where substr(reg_no,2,2) != '90'
         and reg_no !='000'
         and site_id =pSiteID
         and ( fy = vm_utility_pkg.getCurrentFY or fy=(vm_utility_pkg.getCurrentFY-1))
         order by substr(reg_no,1,1)desc, substr(reg_no,2,2) ;

   begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for cwono in em_getXMLRegisterList loop
       htp.p('<ROW>');
       htp.p('<VALUE>'||cwono.VALUE||'</VALUE>');
       htp.p('<TEXT>'||cwono.TEXT||'</TEXT>');
       htp.p('</ROW>');
     end loop;
     htp.p('</ROWSET>');

/*      ctx := dbms_xmlgen.newContext(s_query);
      myxml := dbms_xmlgen.getXML(ctx);
      htp.p(substr(myxml,1,32000));
      htp.p(substr(myxml,32001));
*/
    exception
      when others  then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end em_getXMLRegisterList;

-- Returns work orders for a reg no -- die soon.
   procedure em_wo_no_list(pSiteID in em_site_t.site_id%type, p_reg_no in em_register_t.reg_no%type) is
     cursor csr_wono is
      select wo_ptr "VALUE", wo_no "TEXT" from em_wo_t
      where site_id = pSiteID
       and reg_no =p_reg_no;
   begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for cwono in csr_wono loop
       htp.p('<ROW>');
       htp.p('<VALUE>'||cwono.VALUE||'</VALUE>');
       htp.p('<TEXT>'||cwono.TEXT||'</TEXT>');
       htp.p('</ROW>');
     end loop;
     htp.p('</ROWSET>');
   exception
      when others then
       em_error_pkg.em_ErrorInsert_prc;
       raise;
   end em_wo_no_list;

-- Builds a Work order  search dialog for create stocked orders. returns the wono
procedure em_getCoWONOData (
            pSite in  em_order_t.site_id%type,
            p_reg_no in em_register_t.reg_no%type default null
            ) is

   type woRefCurType is ref cursor;
   woRefCur woRefCurType;
   vThisRow   number default 0;
   vNumRows   number default 0;
   type woRecType is record (
         wo_no  em_wo_t.wo_no%type,
         subsite_id em_subsite_t.subsite_id%type,
         acronym    em_acronym_t.acronym%type,
         equip_no   em_equipment_t.equip_no%type,
         wo_ptr     em_order_t.wo_ptr%type
              );
   recWOType woRecType;
   vSQL  varchar2(500);
   vBGColor varchar2(12) := 'WHITE';
begin
      htp.p('<body scroll="no" bgcolor="silver">');
      htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
      htp.p('<script language="javascript">');
      htp.p('window.status="Ready to begin order search."');
      htp.p('function clickFunction(col,row) { ');
      htp.p('   var srow=document.all.wonogrid.getSelRow();');
      htp.p('   if (srow==0) { return } ');
      htp.p('   var vwono=document.all.wonogrid.getCellText(1, srow);');
      htp.p('   var vwoptr=document.all.wonogrid.getCellText(5, srow);');
        htp.p('opener.goCowono(vwono,vwoptr);');
        htp.p('opener.golocalwono(vwono,vwoptr);');
        htp.p('opener.unsetStocked();');
      htp.p('}');
      htp.p('setTimeout("setRowCount()", 1500);');
      htp.p('window.status="Search in Progress...."');
      htp.p('function setRowCount() {');
      htp.p('  window.status=document.all.wonogrid.getNumRows()+"  orders found."');
      htp.p('}');
      htp.p('</script>');
      htp.p('</body>');
       vSQL := ' select /*INDEX_COMBINE*/ a.wo_no,a.subsite_id, b.acronym,decode(a.combine_id,null,a.equip_no,''ALL'') as equip_no,a.wo_ptr'||
          ' from em_wo_t a, em_acronym_t b '||
          ' where a.site_id = :1 '||--pSite||
          ' and b.site_id = :2 '|| --pSite||
          ' and a.equip_cat_ptr = b.equip_cat_ptr'||
          ' and a.reg_no= :3 '||--p_reg_no||
          ' and nvl(combine_id,wo_ptr) = wo_ptr '|| --Tehseen: 12/18/2003.
          ' and a.wo_status = ''O''' ||
          ' order by wo_no,b.acronym,rpad(equip_no,50,''0'') ';


      open woRefCur for vSQL using pSite,pSite,p_reg_no ; --tk
      vm_utility_pkg.startGrid('wonogrid');
      htp.p('<param name="numcols" value="5"/>');
      htp.p('<param name="colheadertext" value="WONO,Subsite,Acronym,EquipNo,woptr"/>');
      --htp.p('<param name="colwidths" value="50,0,100,100,0"/>');
	  htp.p('<param name="colwidths" value="80,100,100,50,0"/>');
      htp.p('<param name="sortcolumns" value="1,2,3,4"/>');
      htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
      htp.p('<param name="cellsreleasedfunction" value="selRow" />');
      htp.p('<param name="urlframe" value="dummyframe">');
      htp.p('<param name="clickFunction" value="clickFunction" />');
      loop
         fetch woRefCur into recWOType;
         exit when woRefCur%notfound;
         vThisRow := vNumRows + 1;
         htp.p('<param name="row'||vThisRow||'text" value="');
         htp.p(recWOType.wo_no||','||recWOType.subsite_id||','||recWOType.acronym||','||recWOType.equip_no||','||recWOType.wo_ptr||'"></param>');
         vNumRows := vNumRows + 1;
      end loop;
      htp.p('<param name="numrows" value="'||vNumRows||'" />');
      htp.p('</div>');
      vTotalRowCount := vNumRows;
      htp.BodyClose;
 exception
  when others then
    em_error_pkg.em_ErrorInsert_prc;
    raise;
 end ;

-- check the number of orders ordered but not filled.
procedure em_ckhorders_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type) is

cursor csr_countorders is
select sum(qty_ordered)
from em_order_t
where site_id =pSiteID and nsn=p_nsn and order_filled_flag='N';

l_cnt PLS_INTEGER := 0;
begin
 open csr_countorders;
 fetch csr_countorders into l_cnt;
 close csr_countorders;
htp.p('<?xml version="1.0"?>');
htp.p('<QTYORDERED>'||nvl(l_cnt,'-1')||'</QTYORDERED>');

exception
  when others then
   htp.p('<?xml version="1.0"?>');
   htp.p('<QTYORDERED>-1</QTYORDERED>');
end;

-- check the number of orders ordered but not filled.
procedure em_chk_nsn_replaced_prc
               (pSiteID in em_site_t.site_id%type,
                p_nsn in em_order_t.nsn%type) is

cursor csr_countorders is
select replacement_nsn
from em_mdims_catalog_t
where nsn=p_nsn;

l_replaced_nsn em_catalog_t.nsn%type;

begin
   open csr_countorders;
  fetch csr_countorders into l_replaced_nsn;
  close csr_countorders;
  htp.p('<?xml version="1.0"?>');
  htp.p('<REPLACEDNSN>'||nvl(l_replaced_nsn,-1)||'</REPLACEDNSN>');

exception
  when others then
   htp.p('<?xml version="1.0"?>');
   htp.p('<REPLACEDNSN>-1</REPLACEDNSN>');
end;

function em_getordercount_fnc (pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type)
 return number
 is

cursor csr_countorders is
select sum(qty_ordered)
from em_order_t
where site_id =pSiteID and nsn=p_nsn and order_filled_flag='N';

l_cnt PLS_INTEGER := 0;
begin
 open csr_countorders;
 fetch csr_countorders into l_cnt;
 close csr_countorders;
 return l_cnt;
exception
  when others then
    em_error_pkg.em_ErrorInsert_prc;
   raise;
end;

function em_getwono(pWoPtr in em_wo_t.wo_ptr%type,pSiteID in em_site_t.site_id%type)
  return number
is
l_wo_no em_wo_t.wo_no%type :=0;
begin
  select wo_no into l_wo_no from em_wo_t where site_id = pSiteID and wo_ptr=pWoPtr;
  return l_wo_no;
end;

procedure em_savestockedorders_prc
  is
  l_emp em_order_t.order_for_emp_id%type;
begin
    if vm_utility_pkg.getArrVal('order_for_emp_id') is null then
       l_emp := vm_utility_pkg.getArrVal('nonemployee');
    else
       l_emp := vm_utility_pkg.getArrVal('order_for_emp_id');
    end if;
    em_savestocked_prc(
    vm_global_pks.g_currentsiteid,
    vm_utility_pkg.getCurrentFY,
    l_emp,
    vm_utility_pkg.getArrVal('nsn_s'),
    vm_utility_pkg.getArrVal('nom_s'),
    vm_utility_pkg.getArrVal('source_code'),
    vm_utility_pkg.getArrVal('bulk_unit'),
    vm_utility_pkg.getArrVal('qty_ordered'),
    vm_utility_pkg.getArrVal('unit_of_issue'),
    vm_utility_pkg.getArrVal('boh'),
    vm_utility_pkg.getArrVal('inv_group_cd'),
    vm_utility_pkg.getArrVal('wo_ptr_s'),
    vm_utility_pkg.getArrVal('ord_comment'),
    vm_utility_pkg.getArrVal('order_justif'),
    vm_global_pks.g_current_userid,
    vm_global_pks.g_current_userid,
    vm_utility_pkg.getArrVal('unit_cost'),
    vm_utility_pkg.getArrVal('requisition_type'),
    p_bulk_qty => vm_utility_pkg.getArrVal('bulk_quantity')
    );
end;


procedure em_savestocked_prc
(
     p_site_id          in varchar2 default null,
     p_fy               in varchar2 default null,
     p_order_for_emp_id in varchar2 default null,
     p_nsn              in varchar2 default null,
     p_nom              in varchar2 default null,
     p_source_code      in varchar2 default null,
     p_bulk_unit        in varchar2 default null,
     p_qty_ordered      in varchar2 default null,
     p_uoi_code         in varchar2 default null,
     p_boh              in varchar2 default null,
     p_inv_group_code   in varchar2 default null,
     p_wo_ptr           in varchar2 default null,
     p_order_comment    in varchar2 default null,
     p_order_justif     in varchar2 default null,
     p_create_user      in varchar2 default null,
     p_mod_user         in varchar2 default null,
     p_receipt_unit_cost in varchar2 default null,
     p_order_type_code  in varchar2 default null,
     p_for_stock        in varchar2 default null,
     p_module_id        in varchar2 default 'STOCKED',
     p_commit           in  varchar2 default 'Y', -- added by TA. This proc is called by issues. It will commit if set to 'N'
     p_issuePtr         in varchar2 default null,
     p_OrderStatus      in  varchar2 default 'N',
     p_roq              in number default null,  --roq added by rsd 09/16/2004
     p_roq_ind          in number default null,
     p_rights           in varchar2 default 'S',
     p_transfer_site_id in varchar2 default null,
     p_transfer_part_ptr in varchar2 default null,
     p_bulk_qty          in varchar2 default '0'
)
IS
    l_loc_req_no varchar2(30);
    l_order_no varchar2(30);
    l_order_no_seq number;
    l_order_ptr_seq number;

    l_source_code varchar2(1);
    l_pendflag boolean := false;
    l_num  PLS_INTEGER := 0;
    l_pending varchar(1) :='N';
    l_stocked varchar(1) := 'N';
    l_for_stock varchar2(1) := 'Y';
    l_module_id varchar2(30):='STOCKED';
    vStatusCode    varchar2(1) := 'N';
    vOrderType    varchar2(1) := 'N';
    l_psdsno  em_site_t.psdsno%type;
    l_order_for_emp_id em_order_t.order_for_emp_id%type := null;
    n_roq_ind number:=0;
    n_roq number :=null;
    l_transfer_facility   varchar2(200) := null;
    l_transfer_contact    varchar2(200) := null;
    l_eas_l BOOLEAN := FALSE;
    l_l PLS_INTEGER := 0;
 -- get the part_ptr based on nsn

    cursor csr_part_ptr is
        select part_ptr
        from em_catalog_t
        where site_id = p_site_id
        and nsn = p_nsn;

    cursor csr_part_info is
        select a.local_nomen,a.status_flag, a.source_code, b.nsn,b.nomenclature,
               b.source_code_of_supply,b.repair_code,
               decode(b.repair_code, 'C', decode(b.source_code_of_supply,'D','D','G','G','T'),b.repair_code) New_Source_Code,
               b.replacement_nsn
        from em_catalog_t a, em_mdims_catalog_t b
        where a.site_id = p_site_id
        and a.nsn = b.nsn
        and b.status_flag = 'Y'
        and a.nsn = p_nsn;

    l_mdims_item varchar2(1);
    l_part_info csr_part_info%rowtype;
    l_part_ptr em_catalog_t.part_ptr%type := null;

     --check if any orders are pending for the NSN
     cursor csr_nsnpend is
         select 1
         from em_order_t
         where site_id = p_site_id and nsn = p_nsn
         and order_filled_flag = 'N'
         and order_status_code='N';

     CURSOR csr_eas IS
          SELECT 1
                FROM  emdba.em_user_t a
                WHERE a.site_id =vm_global_pks.g_currentSiteID
                AND a.user_id=vm_global_pks.g_current_userid;

BEGIN
     open csr_part_ptr;
     fetch csr_part_ptr into l_part_ptr;
     close csr_part_ptr;

     open csr_part_info;
     fetch csr_part_info into l_part_info;
     close csr_part_info;

     l_source_code := nvl(l_part_info.New_Source_Code,p_source_code);
     l_module_id := p_module_id;
--if vm_utility_pkg.getArrVal('mode') = 'add' then
     select psdsno into l_psdsno from em_site_t where site_id = p_site_id;
     l_loc_req_no := substr(l_psdsno,1,4)||TO_CHAR(sysdate,'J')||round((sysdate - trunc(sysdate))*24*60*60);
     --substr(p_site_id,1,4)||TO_CHAR(sysdate,'J')||(sysdate - trunc(sysdate))*24*60*60;

    if p_commit='Y' then  -- Issue will call this procedure with p_commit=N. Orders created through issue will not be in pending.
        --Check the ROQ stuff here..only needed fo this anyway
     IF p_roq_ind IS NOT NULL THEN
        n_roq_ind:=1;
    ELSE
        n_roq_ind :=vm_utility_pkg.getArrVal('over_roq_ind');
    END IF;

    IF p_roq IS NOT NULL THEN
        n_roq:=p_roq;
    ELSE
        n_roq :=vm_utility_pkg.getArrVal('roq');
    END IF;

    IF (p_order_type_code IN ('N','X') AND (l_source_code IN ('A','D','G','S','T','U'))) THEN -- snafu. 12560. Tehseen
        OPEN csr_nsnpend;
        FETCH csr_nsnpend INTO l_num;
        l_pendflag := csr_nsnpend%FOUND;
        CLOSE csr_nsnpend;

        IF l_pendflag = TRUE THEN
            l_pending := 'Y';
        END IF;
    END IF;

    --Check if ROQ_IND is set and currentRight!=S if so we set the order to Pending
    --em_error_pkg.em_log_prc(vm_utility_pkg.getArrVal('currentright')||'= '||n_roq_ind);
    COMMIT;

        IF (emapp.em_order_pkg.EAS_Activated_fnc()='Y') THEN
            OPEN csr_eas;
            FETCH csr_eas INTO l_l;
            l_eas_l := csr_eas%FOUND;
            CLOSE csr_eas;
            IF (l_eas_l <> TRUE OR (l_l IS NULL)) AND n_roq_ind=1 THEN
                l_pendflag := TRUE;
                l_pending := 'Y';
            END IF;
        ELSE
            IF (vm_utility_pkg.getArrVal('currentright')!= 'S' OR p_rights!='S') AND n_roq_ind=1 THEN
                l_pendflag := TRUE;
                l_pending := 'Y';
            END IF;
        END IF;
    END IF;


-- Update the catalog for all are not set to pending.
-- 9/2004 RSD Kathy Carrico wanted due in to not be incremented if orders wee pending so a check was
-- added per her direction to not increment due ins for pending. However since Due in is show and used
-- by the software and users to know if parts should be ordered and since pending orders show up on the
-- local orders report per Lloyd Bell on 9/21/2004 RSD is changing it back to incremnet due in when an
-- order is created.
   --  if l_pending!='Y' then
     update em_catalog_t
        set no_parts_due = no_parts_due + p_qty_ordered,
            source_code  = nvl(l_part_info.New_Source_Code,source_code),
            status_flag  = 'Y',
            mod_date = sysdate
       where site_id = p_site_id
       and nsn = p_nsn and room_id='A' ;
   -- end if;

     select decode(count(1),0,'N','Y')
       into l_mdims_item
       from em_mdims_catalog_t
      where nsn = p_nsn
        and status_flag = 'Y';

     if l_mdims_item = 'Y' then
     -- Update when local nomenclature has a Replaced by in it.
        if l_part_info.local_nomen like '%REPLACED%' and
           l_part_info.replacement_nsn is null then
           update em_catalog_t
              set local_nomen = l_part_info.nomenclature,
                  replacement_nsn = null,
                  mod_date = sysdate
            where site_id = p_site_id
              and nsn = p_nsn and room_id='A' ;
        end if;
     end if;

     if p_wo_ptr is null then
        l_for_stock := 'Y';
        if p_order_comment = 'Auto Replenishment' then
          if p_transfer_site_id is not null then
            l_order_for_emp_id := 'Auto Xfer For Stock';
          else
            l_order_for_emp_id := 'Auto For Stock';
          end if;
        else
           l_order_for_emp_id := 'For Stock';
        end if;
     else
        l_for_stock := 'N';
        l_order_for_emp_id := p_order_for_emp_id;
     end if;

     select em_order_no_seq.nextval into l_order_no_seq from dual;
     l_order_no := p_fy||l_order_no_seq;

     select em_order_ptr_seq.nextval into l_order_ptr_seq from dual;

     if l_source_code in ('B', 'L') then
        vStatusCode := 'P';
        vOrderType := 'L';
     else
        vStatusCode := 'N';
        vOrderType := p_order_type_code;
     end if;

     if p_transfer_site_id is null then
        l_transfer_facility := vm_utility_pkg.getArrVal('transfer_facility');
        l_transfer_contact  := vm_utility_pkg.getArrVal('transfer_contact');
     else
        select site_name||'('||site_id||')',
               site_contact||' No'||phone1
          into l_transfer_facility,
               l_transfer_contact
          from em_site_t
         where site_id = p_transfer_site_id;
     end if;

     insert into em_order_t  (
       site_id,
       order_ptr,
       loc_req_no,
       order_no,
       po_num,
       order_for_emp_id,
       order_by_emp_id,
       nsn,
       nom,
       source_code,
       bulk_unit,
       unit_cost,
       qty_ordered,
       uoi_code,
       boh,
       inv_group_code,
       wo_ptr,
       order_comment,
       justify_order,
       create_user,
       create_date,
       mod_user,
       mod_date,
       pending_flag,
       order_filled_flag,
       order_type_code,
       module_id,
       for_stock,
       order_status_code,
       required_date,
       issue_ptr,
       transfer_facility,
       transfer_contact,
       requisition_comments,
       part_ptr,
       over_roq_ind,
       roq,
       bulk_qty,
       balance_order_owed
     )
     values  (
       p_site_id,
       l_order_ptr_seq,
       l_loc_req_no,
       l_order_no,
       l_order_no,
       l_order_for_emp_id,
       getUserInitials(vm_global_pks.g_currentSiteID, vm_global_pks.g_current_userid),
       p_nsn,
       -- 01/27/2005 cprice.  Added upper.
       upper(p_nom),
       l_source_code,
       p_bulk_unit,
       p_receipt_unit_cost,
       p_qty_ordered,
       p_uoi_code,
       nvl(p_boh,0),
       p_inv_group_code,
       p_wo_ptr,
       -- 01/27/05 cprice. Added upper.
       upper(p_order_comment),
       upper(p_order_justif),
       p_create_user,
       sysdate,
       p_mod_user,
       sysdate,
       l_pending,
       'N',
       vOrderType,    --p_order_type_code,
       l_module_id,
       l_for_stock,
       decode(l_pending,'Y','P',vStatusCode),
-- New Required date
to_date(vm_utility_pkg.getArrVal('required_date'),'mm/dd/yyyy'),

--       sysdate, -- required date added by TA.
       p_issueptr,
       l_transfer_facility, --vm_utility_pkg.getArrVal('transfer_facility'),
       l_transfer_contact, --vm_utility_pkg.getArrVal('transfer_contact'),
       vm_utility_pkg.getArrVal('requisition_comments'),
       l_part_ptr,
       n_roq_ind,
       n_roq,
       p_bulk_qty,
       p_qty_ordered
    );

  if sql%rowcount != 1  then
    raise_application_error(-20001,'Failed to create 1 for 1 order. Please see error log for details');
  end if;


  -- Must create a header record for B and L source codes...
  if l_source_code in ('B','L') then
     insert into em_local_order_header_t (
        site_id,
        order_no,
        shipment_cost,
        create_user,
        create_date,
        mod_user,
        mod_date
     )
     values (
        p_site_id,
        l_order_no,
        0,
        p_create_user,
        sysdate,
        p_mod_user,
        sysdate
     );
  end if;

-- create an nsn open transfer order (ESPIN NEW)
  if p_order_type_code = 'B' then
     insert into em_order_transfers_t
               (site_id, transfer_id, transfer_site_id, order_ptr,
                part_ptr, quantity_requested, quantity_transfered, process,
                transfer_filled_flag, transfer_received_flag, action_code, Required_date,
                create_date, create_user, mod_date, mod_user)
           values
                (p_transfer_site_id, em_transfer_id_seq.NEXTVAL, p_site_id, l_order_ptr_seq ,
                 p_transfer_part_ptr, p_qty_ordered, 0 ,'N',
                 'N', 'N', '', sysdate, sysdate, -1, sysdate, -1 );
  end if;


  -- Issues call this procedure with p_commit = N because it needs to issue the master commit.
  if p_commit = 'Y' then
       commit;
  end if;
exception
    when others then
    vErrMsg := sqlerrm;
    em_error_pkg.em_ErrorInsert_prc;
    raise;

end;


procedure em_savenonstockedorders_prc is
  l_emp em_order_t.order_for_emp_id%type;
begin
    if vm_utility_pkg.getArrVal('order_for_emp_id') is null then
       l_emp := vm_utility_pkg.getArrVal('nonemployee');
    else
       l_emp := vm_utility_pkg.getArrVal('order_for_emp_id');
    end if;

    em_savenonstocked_prc(
    vm_global_pks.g_currentSiteID,
    vm_utility_pkg.getCurrentFY,
    l_emp,
    vm_utility_pkg.getArrVal('nsn_ns'),
    vm_utility_pkg.getArrVal('source_code'),
    vm_utility_pkg.getArrVal('bulk_unit_ns'),
    vm_utility_pkg.getArrVal('qty_ordered_ns'),
    vm_utility_pkg.getArrVal('unit_of_issue_ns'),
    vm_utility_pkg.getArrVal('inv_group_cd_ns'),
    vm_utility_pkg.getArrVal('wo_ptr_s'),
    vm_utility_pkg.getArrVal('ord_comment'),
    vm_utility_pkg.getArrVal('order_justif'),
    vm_global_pks.g_current_userid,
    vm_global_pks.g_current_userid,
    vm_utility_pkg.getArrVal('unit_cost_ns'),
    vm_utility_pkg.getArrVal('requisition_type'),
    p_bulk_qty => vm_utility_pkg.getArrVal('bulk_quantity')
    );
end;


procedure em_savenonstocked_prc
    (
     pSiteID             in varchar2 default null,
     p_fy                in varchar2 default null,
     p_order_for_emp_id  in varchar2 default null,
     p_nsn               in varchar2 default null,
     p_source_code       in varchar2 default null,
     p_bulk_unit         in varchar2 default null,
     p_qty_ordered       in varchar2 default null,
     p_uoi_code          in varchar2 default null,
     p_inv_group_code    in varchar2 default null,
     p_wo_ptr            in varchar2 default null,
     p_order_comment     in varchar2 default null,
     p_order_justif      in varchar2 default null,
     p_create_user       in varchar2 default null,
     p_mod_user          in varchar2 default null,
     p_receipt_unit_cost in varchar2 default null,
     p_order_type_code   in varchar2 default null,
     p_for_stock         in varchar2 default null,
     p_bulk_qty          in varchar2 default '0'
    )

 is
 l_loc_req_no varchar2(30);
 l_order_no varchar2(30);
 l_order_no_seq number;
 l_required_date date;

 -- check if the any orders are pending for the NSN
 cursor csr_nsnpend is
 select 1
 from em_order_t
 where site_id = pSiteID and nsn = p_nsn
 and order_filled_flag = 'N';

 l_pendflag boolean := false;
 l_num  PLS_INTEGER := 0;
 l_pending varchar(1) :='N';
 l_stocked varchar2(1) := 'N';
 l_for_stock  varchar2(1) := 'Y';
 l_psdsno  em_site_t.psdsno%type;
 l_order_for_emp_id em_order_t.order_for_emp_id%type := null;
begin
     select psdsno into l_psdsno from em_site_t where site_id = pSiteID;
     l_loc_req_no := substr(l_psdsno,1,4)||TO_CHAR(sysdate,'J')||round((sysdate - trunc(sysdate))*24*60*60);

--     l_loc_req_no := substr(pSiteID,1,4)||TO_CHAR(TO_DATE('01-01-1997', 'MM-DD-YYYY'),'J')||(sysdate - trunc(sysdate))*24*60*60;
       if (p_order_type_code in ('N','X') and (p_source_code in ('A','D','G','S','T'))) then -- snafu. 12560
         open csr_nsnpend;
         fetch csr_nsnpend into l_num;
             l_pendflag := csr_nsnpend%found;
         close csr_nsnpend;
         if l_pendflag = true then
            l_pending := 'Y';
         end if;
       end if;


     select em_order_no_seq.nextval into l_order_no_seq from dual;
     l_order_no := p_fy||l_order_no_seq;

     if p_wo_ptr is null then
        l_for_stock := 'Y';
        l_order_for_emp_id := 'For Stock';
     else
        l_for_stock := 'N';
        l_order_for_emp_id := p_order_for_emp_id;
     end if;

     if vm_utility_pkg.getArrVal('required_date') is null then
       l_required_date := trunc(sysdate);
     else
       l_required_date := to_date(vm_utility_pkg.getArrVal('required_date'),'mm/dd/yyyy');
     end if;

     insert into em_order_t
     (
     site_id,
     order_ptr,
     loc_req_no,
     order_no,
     order_for_emp_id,
     order_by_emp_id,
     nsn,
     source_code,
     bulk_unit,
     unit_cost,
     qty_ordered,
     uoi_code,
     inv_group_code,
     wo_ptr,
     order_comment,
     justify_order,
     create_user,
     create_date,
     mod_user,
     mod_date,
     pending_flag,
     order_filled_flag,
     order_type_code,
     module_id,
     for_stock,
     order_status_code,
     transfer_facility,
     transfer_contact,
     requisition_comments,
     over_roq_ind,
required_date, -- Test for required date
Bulk_qty,
balance_order_owed
    )
    values
    (
    pSiteID,
    em_order_ptr_seq.nextval,
    l_loc_req_no,
    l_order_no,
    l_order_for_emp_id,
    getUserInitials(vm_global_pks.g_currentSiteID, vm_global_pks.g_current_userid),
    upper(p_nsn),
    p_source_code,
    p_bulk_unit,
    p_receipt_unit_cost,
    p_qty_ordered,
    p_uoi_code,
    p_inv_group_code,
    p_wo_ptr,
    upper(p_order_comment),
    upper(p_order_justif),
    p_create_user,
    sysdate,
    p_mod_user,
    sysdate,
    l_pending,
    'N',
    p_order_type_code,
    'NONSTOCKED',
    l_for_stock,
    decode(l_pending,'Y','P','N'),
     vm_utility_pkg.getArrVal('transfer_facility'),
     vm_utility_pkg.getArrVal('transfer_contact'),
     upper(vm_utility_pkg.getArrVal('requisition_comments')),
     vm_utility_pkg.getArrVal('over_roq_ind'),
-- New Required date
l_required_date, --to_date(vm_utility_pkg.getArrVal('required_date'),'mm/dd/yyyy'),
p_bulk_qty,
p_qty_ordered
    );

  commit;
  exception
    when others then
    em_error_pkg.em_ErrorInsert_prc;
    raise;
end;

-- save local 7381
function em_savelocal7381_fnc return varchar2 is

 l_loc_req_no varchar2(30);
 l_order_no varchar2(30);
 l_order_no_seq number;
 l_for_stock varchar2(1) :='Y';

-- check if the any orders are pending for the NSN
 cursor csr_nsnpend is
 select 1
 from em_order_t
 where site_id = vm_global_pks.g_currentSiteID and nsn = vm_utility_pkg.getArrVal('nsn_s')
 and order_filled_flag = 'N';

 l_pendflag boolean := false;
 l_num  PLS_INTEGER := 0;
 l_pending varchar(1) :='N';
 l_po_num varchar2(50);
 l_order varchar2(100);
 l_totalval number :=0;
 l_sc_nom em_vendor_part_t.sc_nom%type;
 l_vendor_part_found number default 0;
 l_name em_vendor_part_t.name%type;
 l_part_nsn em_vendor_part_t.part_nsn%type;
 b_nsn boolean := false;
 l_oem em_vendor_part_t.vendor_stock_no%type;
 l_psdsno  em_site_t.psdsno%type;
 n_parts_due number :=0;

 cursor csr_lrn is
 select po_num from em_order_t where site_id = vm_global_pks.g_currentSiteID
 and order_no =  vm_utility_pkg.getArrVal('order_no_l');


begin
 --RSD The for stock flag is sometimes somehow getting set when the wo_ptr is not null
 --since it shoudl never be we set it based on the wo_ptr.
 if vm_utility_pkg.getArrVal('wo_ptr_l') is not null then
   l_for_stock:='N';
 end if;
 if vm_utility_pkg.getArrVal('mode') in ('add','edit') then
         l_totalval := vm_utility_pkg.getArrVal('cost_l') * vm_utility_pkg.getArrVal('qty_l');
         l_loc_req_no := substr(l_psdsno,1,4)||TO_CHAR(sysdate,'J')||round((sysdate - trunc(sysdate))*24*60*60);

          l_pending := 'Y'; -- Local orders always pending. Have to be approved. TK
          l_order := vm_utility_pkg.getArrVal('order_no_l');
         if l_order is null then
           select psdsno into l_psdsno from em_site_t where site_id = vm_global_pks.g_currentSiteID;
           select em_order_no_seq.nextval into l_order_no_seq from dual;
           l_order_no := 'PO'||vm_utility_pkg.getCurrentFY||l_order_no_seq;
           l_po_num := l_order_no;
         else
           l_order_no := vm_utility_pkg.getArrVal('order_no_l');
           l_po_num := l_order_no;
         end if;

-- update/insert shipping information
         update em_local_order_header_t
         set shipment_cost  =  NVL(vm_utility_pkg.getArrVal('shipment_cost'),0),
         order_location_id  =  vm_utility_pkg.getArrVal('location'),
         mod_user           =  vm_global_pks.g_current_userid,
         mod_date           =  sysdate
         where site_id      =  vm_global_pks.g_currentSiteID and order_no = l_order_no;

         if sql%notfound then
           insert into em_local_order_header_t
           (site_id,
           order_no,
           shipment_cost,
           order_location_id,
           create_user,
           create_date,
           mod_user,
           mod_date
           )
           values
           (vm_global_pks.g_currentSiteID,
           l_order_no,
           NVL(vm_utility_pkg.getArrVal('shipment_cost'),0),
           vm_utility_pkg.getArrVal('location'),
           vm_global_pks.g_current_userid,
           sysdate,
           vm_global_pks.g_current_userid,
           sysdate
           );
         end if;

          -- update the upper section only if the user does not click add . At this point only the
         -- summary (grid) is displayed for all the orders.

         if vm_utility_pkg.getArrVal('l_save') in ('L','A') then       -- was L before.
            insert into em_order_t
           (
           site_id,
           order_ptr,
           nsn,
           loc_req_no,
           unit_cost,
           qty_ordered,
           pending_flag,
           order_type_code,
           po_num,
           order_no,
           original_order_no,
           wo_ptr,
           vc_id,
           pay_type,
           title,
           buyer,
           order_filled_flag,
           oem,
           order_by_emp_id,
           order_for_emp_id,
           aic_code,
           folder_id,
           uoi_code,
           justify_order,
           nom,
           module_id,
           required_date,
           for_stock,
           order_status_code,
           source_code,
           order_date,
           create_user,
           create_date,
           mod_user,
           mod_date,
           roq,
           over_roq_ind,
           balance_order_owed
           )
           values
          (
          vm_global_pks.g_currentSiteID,
          em_order_ptr_seq.nextval,
          vm_utility_pkg.getArrVal('nsn_l'),
          l_loc_req_no,
          vm_utility_pkg.getArrVal('cost_l'),
          vm_utility_pkg.getArrVal('qty_l'),
          l_pending,
          'L',
          l_po_num,--substr(l_po_num,1,10),
          l_order_no,
          l_order_no,  -- original order no.
          vm_utility_pkg.getArrVal('wo_ptr_l'),
          vm_utility_pkg.getArrVal('vendor'),
          vm_utility_pkg.getArrVal('paytype'),
          UPPER(vm_utility_pkg.getArrVal('title')),
          vm_utility_pkg.getArrVal('buyer'),
          'N',
          vm_utility_pkg.getArrVal('oem_l'),
          getUserInitials(vm_global_pks.g_currentSiteID, vm_global_pks.g_current_userid),
          UPPER(vm_utility_pkg.getArrVal('req_name')),
          vm_utility_pkg.getArrVal('aic'),
          ---decode(vm_utility_pkg.getArrVal('folder'),-1,''),
          REPLACE(vm_utility_pkg.getArrVal('folder'),'-1',''),
          vm_utility_pkg.getArrVal('unit_l'),
          -- 01/27/05 cprice. Added upper.
          upper(vm_utility_pkg.getArrVal('justify_l')),
          upper(vm_utility_pkg.getArrVal('nom_l')),
          'LOCAL',
          to_date(vm_utility_pkg.getarrval('date_required'),'MM/DD/YYYY'),
          l_for_stock,
          'P',
          'L',
          sysdate,
          vm_global_pks.g_current_userid,
          sysdate,
          vm_global_pks.g_current_userid,
          sysdate,
          vm_utility_pkg.getArrVal('roq_l'),
          vm_utility_pkg.getArrVal('over_roq_ind_l'),
          vm_utility_pkg.getArrVal('qty_l')
          );

          --9/2004 Per L BEll RSD Update the catalog table no_due in when the order is placed
          update em_catalog_t set no_parts_due= no_parts_due + vm_utility_pkg.getArrVal('qty_l')
          where site_id=vm_global_pks.g_currentSiteID
          and nsn=vm_utility_pkg.getArrVal('nsn_l') and room_id='A';

          --8/8/2005 Changed by Lloyd's request to track the Vendor properly.
           select count(part_nsn)
             into l_vendor_part_found
             from em_vendor_part_t
            where site_id  =   vm_global_pks.g_currentSiteID
              and part_nsn =   vm_utility_pkg.getArrVal('nsn_l')
              and vc_id    = vm_utility_pkg.getArrVal('vendor');

            select nvl(vc_name,''), nvl(vc_desc,'')
              into l_sc_nom, l_name
              from em_vendor_contrctr_t
             where site_id = vm_global_pks.g_currentSiteID
               and vc_id   = vm_utility_pkg.getArrVal('vendor');

           if l_vendor_part_found = 0 then
               insert into em_vendor_part_t
               (
               site_id,
               vc_id,
               sc_nom,
               vendor_stock_no,
               part_nsn,
               unit,
               cost,
               name,
               create_user,
               create_date,
               mod_user,
               mod_date
               )
               values
               (
               vm_global_pks.g_currentSiteID,
               vm_utility_pkg.getArrVal('vendor'),
               l_sc_nom,
               vm_utility_pkg.getArrVal('oem_l'),
               vm_utility_pkg.getArrVal('nsn_l'),
               vm_utility_pkg.getArrVal('unit_l'),
               to_number(vm_utility_pkg.getArrVal('cost_l')) * to_number(vm_utility_pkg.getArrVal('qty_l')),
               l_name,
               vm_global_pks.g_current_userid,
               sysdate,
               vm_global_pks.g_current_userid,
               sysdate
               );
           else
               update em_vendor_part_t
               set
               vendor_stock_no  = vm_utility_pkg.getArrVal('oem_l'),
               sc_nom           = l_sc_nom,
               part_nsn         = vm_utility_pkg.getArrVal('nsn_l'),
               unit             = vm_utility_pkg.getArrVal('unit_l'),
               cost             = to_number(vm_utility_pkg.getArrVal('cost_l')) * to_number(vm_utility_pkg.getArrVal('qty_l')),
               name             = l_name,
               mod_user         = vm_global_pks.g_current_userid,
               mod_date         = sysdate
               where site_id    = vm_global_pks.g_currentSiteID
               and  part_nsn    = vm_utility_pkg.getArrVal('nsn_l')
               and  vc_id       = vm_utility_pkg.getArrVal('vendor');
           end if;

           update em_vendor_part_t
               set
               last_vendor_ind  = 0,
               mod_user         = vm_global_pks.g_current_userid,
               mod_date         = sysdate
               where site_id    = vm_global_pks.g_currentSiteID
               and  part_nsn    = vm_utility_pkg.getArrVal('nsn_l');

           update em_vendor_part_t
               set
               last_vendor_ind  = 1,
               mod_user         = vm_global_pks.g_current_userid,
               mod_date         = sysdate
               where site_id    = vm_global_pks.g_currentSiteID
               and  part_nsn    = vm_utility_pkg.getArrVal('nsn_l')
               and  vc_id       = vm_utility_pkg.getArrVal('vendor');


       end if;
-- Update the upper section of the screen for all the order number if not U. else update all.
         if l_order is not null then
           if (vm_utility_pkg.getArrVal('l_save') = 'M') then -- was U
             update em_order_t
             set
               wo_ptr               =   vm_utility_pkg.getArrVal('wo_ptr_l'),
               for_stock            =   vm_utility_pkg.getArrVal('l_for_stock'),
               required_date        =   to_date(vm_utility_pkg.getarrval('date_required'),'MM/DD/YYYY'),
               vc_id                    =       vm_utility_pkg.getArrVal('vendor'),
               ORDER_STATUS_CODE    =   vm_utility_pkg.getArrVal('wo_status'),
               pay_type             =   vm_utility_pkg.getArrVal('paytype'),
               title                =   UPPER(vm_utility_pkg.getArrVal('title')),
               buyer                =   vm_utility_pkg.getArrVal('buyer'),
               order_for_emp_id     =   UPPER(vm_utility_pkg.getArrVal('req_name')),
               aic_code             =   vm_utility_pkg.getArrVal('aic'),
               ----folder_id            =       decode(vm_utility_pkg.getArrVal('folder'),-1,''),
               folder_id            =   REPLACE(vm_utility_pkg.getArrVal('folder'),'-1',''),
--               loc_req_no           =   l_loc_req_no,
               po_num               = l_po_num,
               mod_user             =   vm_global_pks.g_current_userid,
               mod_date             =   sysdate,
               create_date          = sysdate,
               order_date           = sysdate
               where site_id        =   vm_global_pks.g_currentSiteID
               and order_no         =   vm_utility_pkg.getArrVal('order_no_l');
               if (vm_utility_pkg.getArrVal('nsn_l')) is not null then

                   --09/2004 update catalog no_parts_due before updating quantity
                  begin  --Do it in it's own block because the order may not be there any more.
                    select qty_ordered into n_parts_due from em_order_t
                          where rowid=EM_ROWID_DEC(vm_utility_pkg.getArrVal('nsn_ptr'));

                    update em_catalog_t set no_parts_due=(no_parts_due-n_parts_due)
                    where site_id=vm_global_pks.g_currentSiteID and nsn=vm_utility_pkg.getArrVal('nsn_l')
                      and room_id='A';

                    update em_catalog_t set no_parts_due=no_parts_due+ vm_utility_pkg.getArrVal('qty_l')
                    where site_id=vm_global_pks.g_currentSiteID and nsn=vm_utility_pkg.getArrVal('nsn_l')
                      and room_id='A';
                   exception when others then null;  --Don't let this fail the order
                   end;

                update em_order_t
                set
                  nsn                   =   vm_utility_pkg.getArrVal('nsn_l'),
                  unit_cost         =   vm_utility_pkg.getArrVal('cost_l'),
                  qty_ordered       =   vm_utility_pkg.getArrVal('qty_l'),
                  oem               =   vm_utility_pkg.getArrVal('oem_l'),
                  uoi_code          =   vm_utility_pkg.getArrVal('unit_l'),
                  justify_order     =   vm_utility_pkg.getArrVal('justify_l'),
                  nom               =   vm_utility_pkg.getArrVal('nom_l'),
                  create_date       =   sysdate,
                  order_date           = sysdate,
                  mod_user          =   vm_global_pks.g_current_userid,
                  mod_date          =   sysdate
                  where rowid       =   EM_ROWID_DEC(vm_utility_pkg.getArrVal('nsn_ptr'));
               end if;
           else
             update em_order_t
             -- upper
             set
               wo_ptr               =   vm_utility_pkg.getArrVal('wo_ptr_l'),
               for_stock            =   vm_utility_pkg.getArrVal('l_for_stock'),
               required_date        =   to_date(vm_utility_pkg.getarrval('date_required'),'MM/DD/YYYY'),
               vc_id                    =       vm_utility_pkg.getArrVal('vendor'),
               ORDER_STATUS_CODE    =   vm_utility_pkg.getArrVal('wo_status'),
               pay_type             =   vm_utility_pkg.getArrVal('paytype'),
               title                =   UPPER(vm_utility_pkg.getArrVal('title')),
               buyer                =   vm_utility_pkg.getArrVal('buyer'),
               order_for_emp_id     =   UPPER(vm_utility_pkg.getArrVal('req_name')),
               aic_code             =   vm_utility_pkg.getArrVal('aic'),
               ---folder_id            =        decode(vm_utility_pkg.getArrVal('folder'),-1,''),
               folder_id            =   REPLACE(vm_utility_pkg.getArrVal('folder'),'-1',''),
--               loc_req_no           =   l_loc_req_no,
               po_num               = l_po_num,
               create_date          =   sysdate,
               order_date           = sysdate,
               mod_user             =   vm_global_pks.g_current_userid,
               mod_date             =   sysdate
               where order_no       =   vm_utility_pkg.getArrVal('order_no_l')
               and site_id          =   vm_global_pks.g_currentSiteID ;
          end if;
       end if;
    end if;
   return l_order_no;


  commit;
   exception
    when others then
    em_error_pkg.em_ErrorInsert_prc;
    raise;
end;

-- Procedure to list UOI and bulk unit
  procedure em_XMLUOIList1
   is
      s_query constant varchar2(4000) :=
         'select  uoi_code "VALUE", uoi_desc "TEXT" '
         ||' from em_uoi_t ORDER BY uoi_code ';
  begin
     ctx := dbms_xmlgen.newContext(s_query);
     myxml := dbms_xmlgen.getXML(ctx);
     htp.p(myxml);
  end;

-- Procedure to list UOI and bulk unit
  procedure em_XMLUOIList
   is
      cursor uoilist is
         select  uoi_code "VALUE", uoi_code||'-'||uoi_desc "TEXT"
         from em_uoi_t ORDER BY uoi_code;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rlist in uoilist loop
     htp.p('   <ROW>');
     htp.p('   <VALUE>'||rlist.value||'</VALUE>');
     htp.p('   <TEXT>'||rlist.text||'</TEXT>');
     htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

-- Procedure to list group codes
  procedure em_XMLGCList
   is
      cursor gclist is
         select  inv_group_code "VALUE",inv_group_code||'-'|| replace(inv_group_desc,'&','&amp;') "TEXT"
         from em_inv_group_code_t order by lpad(inv_group_code,10,'0');
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rlist in gclist loop
     htp.p('   <ROW>');
     htp.p('    <VALUE>'||rlist.value||'</VALUE>');
     htp.p('    <TEXT>'||rlist.text||'</TEXT>');
     htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

-- procedure to check if the nsn is stocked.
   procedure em_chk_nsn_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type) is
   cursor csr_nsn is
   select nsn,source_code from em_catalog_t
   where site_id = pSiteID and nsn = p_nsn;

   l_nsn   em_order_t.nsn%type;
   l_cnt PLS_INTEGER :=0;
   l_csr_nsn  csr_nsn%rowtype;
   l_found varchar2(1) := 'N';

   begin
     open csr_nsn;
     fetch csr_nsn into l_csr_nsn;
     if csr_nsn%notfound then
       l_found:='N';
     end if;
     close csr_nsn;
     if l_csr_nsn.source_code IN ('L','B','N','M') then
        l_found:='L';
     elsif l_csr_nsn.source_code='U' then
        l_found:='U';
     elsif l_csr_nsn.source_code is not null then
        l_found:='S';
     end if;
     htp.p('<?xml version="1.0"?>');
     htp.p('<NSNEXIST>'||nvl(l_found,'-1')||'</NSNEXIST>');
     exception
       when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<NSNEXIST>-1</NSNEXIST>');
   end;

-- procedure to check if the nsn is through Topeka.
   procedure em_chk_nsn_mdims_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type) is
   cursor csr_nsn is
   select nsn,repair_code from em_mdims_catalog_t
   where nsn = p_nsn and status_flag = 'Y';

   l_nsn   em_order_t.nsn%type;
   l_cnt PLS_INTEGER :=0;
   l_csr_nsn  csr_nsn%rowtype;
   l_found varchar2(1) := 'Y';

   begin
     open csr_nsn;
     fetch csr_nsn into l_csr_nsn;
     if csr_nsn%notfound then
       l_found:='N';
     end if;
     close csr_nsn;
     htp.p('<?xml version="1.0"?>');
     htp.p('<MDIMSNSN>'||nvl(l_found,'-1')||'</MDIMSNSN>');
     exception
       when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<MDIMSNSN>-1</MDIMSNSN>');
   end;

-- procedure to check if the nsn is procured from an SSL site.
   procedure em_chk_ssl_item_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_order_t.nsn%type) is
   cursor csr_nsn is
     SELECT nsn
       FROM em_site_t a, em_mdims_ssl_parts_t b
      where a.site_id = pSiteID
        and a.ssl_id = b.ssl_id
        and b.nsn = p_nsn
        and b.status_code = 'A';

--   select nsn,repair_code from em_mdims_catalog_t
--   where nsn = p_nsn and status_flag = 'Y';

   l_nsn   em_order_t.nsn%type;
   l_cnt PLS_INTEGER :=0;
   l_csr_nsn  csr_nsn%rowtype;
   l_found varchar2(1) := 'Y';

   begin
     open csr_nsn;
     fetch csr_nsn into l_csr_nsn;
     if csr_nsn%notfound then
       l_found:='N';
     end if;
     close csr_nsn;
     htp.p('<?xml version="1.0"?>');
     htp.p('<SSLNSN>'||nvl(l_found,'-1')||'</SSLNSN>');
     exception
       when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<SSLNSN>-1</SSLNSN>');
   end;

-- procedure to check if the work order number exists for the register.
   procedure em_checkwono_prc(pSiteID in em_site_t.site_id%type, pRegNO in em_wo_t.reg_no%type, pWONO in em_wo_t.wo_no%type) is
   cursor csr_wono is
   select wo_no,wo_ptr from em_wo_t
   where site_id = pSiteID and reg_no = pRegNo
   and wo_no = pWONO
   and wo_status = 'O';

   l_wono   em_order_t.nsn%type;
   l_cnt PLS_INTEGER :=0;
   l_csr_wono  csr_wono%rowtype;
   l_found varchar2(1) := 'N';
   l_ptr  em_wo_t.wo_ptr%type := 0;

   begin
     open csr_wono;
     fetch csr_wono into l_csr_wono;
     if csr_wono%found then
       l_ptr:=l_csr_wono.wo_ptr;
     end if;
     close csr_wono;
     htp.p('<?xml version="1.0"?>');
     htp.p('<WONOEXIST>'||l_ptr||'</WONOEXIST>');
     exception
       when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<WONOEXIST>0</WONOEXIST>');
   end;

/******* Local 7381 ********/
-- Procedure to list order status
  procedure em_XMLOSList
   is
   cursor csr_os is
   select order_status_code "VALUE",order_status_desc "TEXT" from em_order_status_code_t;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     htp.p('   <ROW>');
     htp.p('    <VALUE></VALUE>');
     htp.p('    <TEXT></TEXT>');
     htp.p('   </ROW>');
     for rlist in csr_os loop
       htp.p('   <ROW>');
       htp.p('    <VALUE>'||rlist.value||'</VALUE>');
       htp.p('    <TEXT>'||rlist.text||'</TEXT>');
       htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

-- Procedure to list group codes
  procedure em_XMLVCList(pSiteID    in  em_site_t.site_id%type)
   is
      cursor vclist is
         select  vc_id "VALUE", replace(vc_name,'&','&amp;')||'--'||min_code||'--'||vc_no "TEXT"
         from em_vendor_contrctr_t where site_id = pSiteID and vc_flag = 'V' order by vc_name;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rlist in vclist loop
       htp.p('   <ROW>');
       htp.p('    <VALUE>'||rlist.value||'</VALUE>');
       htp.p('    <TEXT>'||rlist.text||'</TEXT>');
       htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

-- Procedure to list aic codes
  procedure em_XMLAICList
   is
      cursor aiclist is
         select  aic_code "VALUE",aic_code||'-'||replace(aic_title,'&','&amp;') "TEXT"
         from em_aic_t where aic_flag = 'A' order by lpad(aic_code,10,'0');
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     htp.p('   <ROW>');
     htp.p('    <VALUE></VALUE>');
     htp.p('    <TEXT></TEXT>');
     htp.p('   </ROW>');
     for rlist in aiclist loop
       htp.p('   <ROW>');
       htp.p('    <VALUE>'||rlist.value||'</VALUE>');
       htp.p('    <TEXT>'||rlist.text||'</TEXT>');
       htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

-- Procedure to list facilities
  procedure em_XMLFACList(pSiteID in em_site_t.site_id%type)
   is
      cursor faclist is
         select  ORDER_LOCATION_ID "VALUE",a.zipcode||'--'||a.finance_no||'--'||replace(a.facility_name,'&','&amp;') "TEXT"
         from EM_ORDER_LOCATION_T a where
         a.site_id = pSiteID
         -- 01/27/05 cprice.  Added this to where clause in order to filter out inactive locations.
         and nvl(order_loc_status_flag, 'I') = 'A';
--       and SUBSITE_DEFAULT_YN = 'Y';
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     for rlist in faclist loop
       htp.p('   <ROW>');
       htp.p('    <VALUE>'||rlist.value||'</VALUE>');
       htp.p('    <TEXT>'||rlist.text||'</TEXT>');
       htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

-- Builds a search dialog for local orders not created via auto replenishment. Returns the rowid
    procedure em_getlocalData(pSiteID in em_site_t.site_id%type) is
       type woRefCurType is ref cursor;
       woRefCur woRefCurType;
       vThisRow   number default 0;
       vNumRows   number default 0;
       type woRecType is record (
             po_num             em_order_t.po_num%type,
             order_no           em_order_t.order_no%type,
             vendor             em_vendor_contrctr_t.vc_name%type,
             order_status_code  em_order_t.order_status_code%type,
             order_date         em_order_t.order_date%type,
             order_for_emp_id   em_order_t.order_for_emp_id%type,
             roq                em_order_t.roq%type
--             row_id             rowid
                  );
       recWOType woRecType;
       vSQL  varchar2(500);
       vBGColor varchar2(12) := 'WHITE';
    begin
          htp.p('<body scroll="no" bgcolor="silver">');
          htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
          htp.p('<script language="javascript">');
          htp.p('window.status="Ready to begin order search."');
          htp.p('function clickFunction(col,row) { ');
          htp.p('   var srow=document.all.wonogrid.getSelRow();');
          htp.p('   if (srow==0) { return } ');
          htp.p('   var vptr=document.all.wonogrid.getCellText(2, srow);');
          htp.p('opener.golocal(vptr);');
          htp.p('}');
          htp.p('</script>');
          htp.p('</body>');
          vSQL :='select distinct nvl(po_num,''0''),order_no,nvl(vc_name,''-''),nvl(order_status_code,''0''),'||
              ' trunc(a.order_date),nvl(order_for_emp_id,''0''), roq '||
              ' from em_order_t a, em_vendor_contrctr_t b'||
              ' where a.site_id = :1 '||--pSiteID||
              '  and b.site_id(+) = :2  '||--pSiteID||
              ' and a.vc_id = b.vc_id(+) '||
              ' and order_type_code = ''L'' '||
              -- 02/23/05 cprice.  Removed for resolution of issue #142 as per Lloyd's request.
--            ' and a.module_id != ''AUTOLOCAL''' ||
              ' and order_status_code = ''P'' '|| -- TK added
              ' and order_filled_flag = ''N'' '||
--            ' and original_order_no is not null '||
              ' order by order_no';
          open woRefCur for vSQL using pSiteID,pSiteID;
          vm_utility_pkg.startGrid('wonogrid');
          htp.p('<param name="numcols" value="6"/>');
          htp.p('<param name="colheadertext" value="PO Number,Control Number,Vendor,Status,Order Date,Requestor"/>');
          --2011.8.15 jesse htp.p('<param name="colwidths" value="60,60,100,40,50,50"/>');
		  htp.p('<param name="colwidths" value="80,80,210,45,60,100"/>');
          htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
          htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
          htp.p('<param name="cellsreleasedfunction" value="selRow" />');
          htp.p('<param name="urlframe" value="dummyframe">');
          htp.p('<param name="clickFunction" value="clickFunction" />');
          loop
             fetch woRefCur into recWOType;
             exit when woRefCur%notfound;
             vThisRow := vNumRows + 1;
             htp.p('<param name="row'||vThisRow||'text" value="');
             htp.p(recWOType.po_num||','||recWOType.order_no||','||recWOType.vendor||','||recWOType.order_status_code||','||TO_CHAR(recWOType.order_date,'MM/DD/YYYY')||','||recWOType.order_for_emp_id||'"></param>');
             vNumRows := vNumRows + 1;
          end loop;
          htp.p('<param name="numrows" value="'||vNumRows||'" />');
          htp.p('</div>');
          vTotalRowCount := vNumRows;
          htp.BodyClose;
     exception
      when others then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
     end ;
-- Builds a search dialog for autoreplenish local . button next to the grid
    procedure em_getlocalAutoData(pSiteID in em_site_t.site_id%type,
    p_order_no in varchar2 default null,
     padd in varchar2 default null) is

       type nsnRefCurType is ref cursor;
       nsnRefCur nsnRefCurType;
       vThisRow   number default 0;
       vNumRows   number default 0;
       type nsnRecType is record (
             nsn            em_order_t.nsn%type,
             order_no       em_order_t.order_no%type,
             qty_ordered       em_order_t.qty_ordered%type,
             bulk_unit      em_order_t.bulk_unit%type,
             nom            em_order_t.nom%type,
             vc_name        em_vendor_contrctr_t.vc_name%type,
             vc_id          em_vendor_contrctr_t.vc_id%type
                  );
       recNSNType nsnRecType;
       vSQL  varchar2(2000);
       vBGColor varchar2(12) := 'WHITE';
    begin
          htp.p('<body scroll="no" bgcolor="silver">');
          htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
          htp.p('<script language="javascript">');
          htp.p('window.status="Ready to begin order search."');
          htp.p('function clickFunction(col,row) { ');
          htp.p('   var srow=document.all.wonogrid.getSelRow();');
          htp.p('   if (srow==0) { return } ');
          htp.p('   var vptr=document.all.wonogrid.getCellText(2, srow);');
          htp.p('   var vcid=document.all.wonogrid.getCellText(7, srow);');
          --A = the add button on the grid in auto 7381
          if padd='A' then
            htp.p('opener.golocal(vptr,"A",vcid);');
          else
            htp.p('opener.golocal(vptr,"L",vcid);');
          end if;
          htp.p('}');
          htp.p('</script>');
          htp.p('</body>');
          -- the add to the grid.
          if padd = 'A' then
          vSQL :='select  distinct nsn,order_no,qty_ordered,bulk_unit,EM_REPLACE_CHARS(nom),vc_name,a.vc_id '||
              ' from em_order_t a, em_vendor_contrctr_t b, em_vendor_part_t c'||
              ' where a.site_id = :1 '||--pSiteID||
              ' and b.site_id(+) = :2 '||--pSiteID||
              ' and c.site_id(+) = :3 '||--pSiteID||
              ' and c.part_nsn(+)=a.nsn '||
              ' and b.vc_id(+) = c.vc_id '||
              ' and order_type_code = ''L'' '||
              ' and a.module_id = ''AUTOLOCAL''' ||
              ' and a.source_code in (''B'',''L'') '||
              ' and a.order_filled_flag = ''N'' '||
              ' and a.order_status_code in (''P'')'||
--              ' and order_no != '''||p_order_no||''''||
              ' and order_no != :4 '||
              ' and original_order_no is null '||
              ' order by nsn, order_no';
           open nsnRefCur for vSQL using pSiteID,pSiteID,pSiteID,p_order_no;
           else

--          vSQL :='select  distinct nsn,order_no,qty_ordered,bulk_unit,EM_REPLACE_CHARS(nom),vc_name,a.vc_id '||
          vSQL :='select  distinct nsn,order_no,qty_ordered,bulk_unit,REGEXP_REPLACE(nom, ''(\(.*\))|,'', ''\1'') nom ,vc_name,a.vc_id '||
              ' from em_order_t a, em_vendor_contrctr_t b, em_vendor_part_t c'||
              ' where a.site_id = :1 '||--pSiteID||
              '  and b.site_id(+) = :2 '||--pSiteID||
              '  and c.site_id(+) = :3 '||--pSiteID||
              ' and c.part_nsn(+)=a.nsn '||
              ' and b.vc_id(+) = c.vc_id '||
              ' and order_type_code = ''L'' '||
              ' and a.module_id = ''AUTOLOCAL''' ||
              ' and a.source_code in (''B'',''L'') '||
              ' and a.order_filled_flag = ''N'' '||
              ' and a.order_status_code in (''P'')'||
              ' and original_order_no is null '||
              ' order by nsn, order_no';


           open nsnRefCur for vSQL using pSiteID,pSiteID,pSiteID;
          end if;
--          open nsnRefCur for vSQL;
          vm_utility_pkg.startGrid('wonogrid');
          htp.p('<param name="numcols" value="7"/>');
          htp.p('<param name="colheadertext" value="NSN,Orderno,QTY,Unit,Nomen,Vendor,vcid"/>');
          htp.p('<param name="colwidths" value="90,10,30,40,320,90,0"/>');
          htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
          htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
          htp.p('<param name="cellsreleasedfunction" value="selRow" />');
          htp.p('<param name="urlframe" value="dummyframe">');
          htp.p('<param name="clickFunction" value="clickFunction" />');
          loop
             fetch nsnRefCur into recNSNType;
             exit when nsnRefCur%notfound;
             vThisRow := vNumRows + 1;
             htp.p('<param name="row'||vThisRow||'text" value="');
             htp.p(recNSNType.nsn||','||recNSNType.order_no||','||recNSNType.qty_ordered||','||recNSNType.bulk_unit||','||recNSNType.nom||','||recNSNType.vc_name||','||recNSNType.vc_id||'"></param>');
             vNumRows := vNumRows + 1;
          end loop;
          htp.p('<param name="numrows" value="'||vNumRows||'" />');
          htp.p('</div>');
          vTotalRowCount := vNumRows;
          htp.BodyClose;
          /*
     exception
      when others then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
        */
     end ;
-- Gives the user the option of cancelling the processing of auto7381. SNAFU BUG 11544.
   procedure em_cancelauto7381(pSiteID in em_site_t.site_id%type,p_order_no in varchar2 default null)
    is
   begin    --this doesn't cancel the order take it out of the purchase order
     update em_order_t
     set order_no = original_order_no,
     original_order_no = ''
     where site_id = pSiteID and
     order_no = p_order_no;
     commit;
   exception
      when others then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
   end;

-- fill the local screen based on the search
    procedure em_filllocalData(pSiteID in em_site_t.site_id%type,pRowID in varchar2 default null,
    pType in varchar2 default null,
    p_order_no in varchar2 default null
    ) is

    begin
    -- A = add with the add button next to the grid for locals!!
      if pType = 'A' then
        update em_order_t
        set original_order_no = order_no,
        order_no = p_order_no,
        po_num  = p_order_no,
        mod_date = sysdate --,
        --order_date  = sysdate RSD 81005 PER LL oderdate stays order date
        where order_no = pRowId
        and site_id = pSiteID;
        commit;
        em_filllocalDataAuto(pSiteID,pRowID,pType,p_order_no);
      else
        update em_order_t
        set
        original_order_no = order_no ,
        mod_date = sysdate  --,
       -- order_date  = sysdate  --order_date  = sysdate RSD 81005 PER LL oderdate stays order date
        where order_no = pRowId
        and site_id = pSiteID;
        commit;
         em_filllocalDatanow(pSiteID,pRowID,pType,p_order_no);
      end if;
    end;

-- fill the local screen based on the Autoreplenish
    procedure em_filllocalDataAuto(pSiteID in em_site_t.site_id%type,pRowID in varchar2 default null,
    pType in varchar2 default null,
    p_order_no in varchar2 default null
    )
    is
      s_query varchar2(4000) :=
      'select  a.order_no as order_no_l,a.wo_ptr as wo_ptr_l,a.vc_id as vendor,to_char(required_date,''mm/dd/yyyy'') as date_required, '
      ||' roq as roq_l'
      ||' from em_order_t a '
      ||' where a.site_id = '||pSiteID
      ||' and  a.order_no = '''||p_order_no||'''';

     begin
      ctx := dbms_xmlgen.newContext(s_query);
      myxml := dbms_xmlgen.getXML(ctx);
      htp.p(myxml);
     exception
       when others  then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
    end;
-- fill the local screen based on the search
    procedure em_filllocalDatanow(pSiteID in em_site_t.site_id%type,pRowID in varchar2 default null,
    pType in varchar2 default null,
    p_order_no in varchar2 default null
    )
    is
      s_query varchar2(4000) :=
      'select  a.order_no as order_no_l,a.loc_req_no as req_no_l,a.wo_ptr as wo_ptr_l, wo_no ,a.order_status_code as order_status,a.vc_id as vendor,'
      || 'a.pay_type as paytype, a.order_for_emp_id as req_name, a.title, a.buyer,a.for_stock as l_for_stock, '
      ||' to_char(required_date,''mm/dd/yyyy'') as date_required,order_status_code as wo_status, '
      ||' aic_code as aic, folder_id as folder, b.shipment_cost , '
      ||' roq as roq_l'
      ||' from em_order_t a, em_local_order_header_t b, em_wo_t c  '
      ||' where a.site_id = '||pSiteID
      ||' and b.site_id='||pSiteID
      ||' and c.site_id(+)='||pSiteID
      ||' and a.order_no=b.order_no '
      ||' and a.wo_ptr=c.wo_ptr(+) '
      ||' and  a.order_no = '''||pRowID||'''';

     begin
      ctx := dbms_xmlgen.newContext(s_query);
      myxml := dbms_xmlgen.getXML(ctx);
      htp.p(myxml);
     exception
       when others  then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
    end;

-- Supplies, Services or Equipment Information grid...
   procedure em_getEquipData    (
                                pSiteID             in  varchar2 default null,
                                p_order_no          in  varchar2 default null
                                ) is
    --variables to get the grid data
    type csr_ref_cursor is ref cursor;
    csr_ref          csr_ref_cursor;
    csr_data_ref     csr_ref_cursor;
    r_grid_data      sg_widget_grid_t%rowtype;
    row_count        number:=0;
    v_sql            varchar2(4000);
    v_sqlstm         varchar2(4000) default null;
    v_valuerow       varchar2(4000);

    -- Dynamic sql related variables
    csr_handle       integer;
    n_return         integer;
    vFlags           varchar2(255) := 'rowselection,resizecolumns,autoresizecols,useattributes,resizerows,rownumbers,rowlines,collines,rowheader,colheader,vscroll,threedborder,sortrowheaders';
     begin
       vm_utility_pkg.startGrid(pGridName=>'lstparts',pHeight=>'100',pWidth=>'665');
          htp.p('<param name="numcols" value="10"/>');
          htp.p('<param name="colheadertext" value="NSN,Nomenclature,Vendor Part,Qty,Unit,Unit Cost,Total Cost,ROWID,OEM,Justify"/>');
          htp.p('<param name="colwidths" value="150,150,100,30,60,60,60,0,0,100"/>');
          htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
          htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
          v_sql:='select nvl(nsn,''0'')||'',''||EM_REPLACE_CHARS(nom)||'',''||nvl(oem,''0'')||'',''||nvl(qty_ordered,''0'')||'',''||nvl(uoi_code,''0'')||'',''||nvl(unit_cost,''0'')||'',''||nvl(qty_ordered*unit_cost,''0'')||'',''||EM_ROWID_ENC(a.rowid)||'',''||nvl(vendor_stock_no,''0'')||'',''||nvl(justify_order,''0'')'
          ||'"rowdata" from em_order_t a, em_vendor_part_t b where   '||
               ' a.site_id = :1 '||--pSiteID||
               ' and b.site_id(+) = :2 '||--pSiteID||
               ' and a.nsn = b.part_nsn(+) '||
               ' and order_no=:3';
--               ' and order_no='''||p_order_no||'''';
       if pSiteID !=-999 then
          open csr_data_ref for v_sql using pSiteID,pSiteID,p_order_no;
          loop
          fetch csr_data_ref into v_valuerow;
          exit when csr_data_ref%notfound;
          row_count:=row_count+1;
          htp.p('<param   name="row'||row_count||'text" value="'||v_valuerow||'"/>');
         end loop;

         if row_count=0 then
            htp.p('<param   name="row1text" value="-,No data found."/>');
         end if;

         --We want at least a certain number of rows to show
         if row_count < r_grid_data.min_rows then
            row_count:=r_grid_data.min_rows;
         end if;

         htp.p('<param name ="numrows" value ="'||to_char(row_count)||'"/>');
      end if;
      vm_utility_pkg.endGrid;
  EXCEPTION
    WHEN others THEN
       em_error_pkg.em_error_prc;
  end;

  -- Procedure to list of folders
  procedure em_XMLFOLDERList(pSiteID in em_site_t.site_id%type)
   is
      cursor folderlist is
         select  folder_id "VALUE",a.folder_id||'--'||a.finance_no||'--'||a.custodian "TEXT"
         from em_order_folder_t a where
         a.site_id  = pSiteID;
  begin
     htp.p('<?xml version="1.0"?>');
     htp.p('<ROWSET>');
     htp.p('   <ROW>');
     htp.p('    <VALUE></VALUE>');
     htp.p('    <TEXT></TEXT>');
     htp.p('   </ROW>');
     for rlist in folderlist loop
       htp.p('   <ROW>');
       htp.p('    <VALUE>'||rlist.value||'</VALUE>');
       htp.p('    <TEXT>'||rlist.text||'</TEXT>');
       htp.p('   </ROW>');
     end loop;
     htp.p('</ROWSET>');
  end;

-- Procedure to select vendor and oem from db.
   procedure em_nsn_l_prc(pSiteID in em_site_t.site_id%type, p_nsn in em_vendor_part_t.part_nsn%type) is
   v_sql varchar(4000) := 'select vc_id as vendor, vendor_stock_no as oem_l from em_vendor_part_t '||
   ' where site_id = '||pSiteID||
   ' and part_nsn = '''||p_nsn||'''';
   begin
      ctx := dbms_xmlgen.newContext(v_sql);
      myxml := dbms_xmlgen.getXML(ctx);
      htp.p(myxml);
   end;
-- delete local grid for 7381 orders
   procedure em_delete_nsn_prc(prowid in varchar2 default null) is

   cursor csr_getorderdetail  is
   select nsn,QTY_ORDERED,site_id
   from em_order_t where
   rowid = EM_ROWID_DEC(prowid);
   l_csr_getorderdetail csr_getorderdetail%rowtype;


   begin
     -- 9/2004 Per Lloyd bell we update when order is created whether pending or not so decrement
     -- wheneve deleted and room_id added to query.
     open csr_getorderdetail;
     fetch csr_getorderdetail into l_csr_getorderdetail;
     close csr_getorderdetail;
     -- update catalog due in.
    update em_catalog_t
       set no_parts_due= GREATEST(no_parts_due - l_csr_getorderdetail.QTY_ORDERED,0)
       where site_id = l_csr_getorderdetail.site_id
       and nsn = l_csr_getorderdetail.nsn  and room_id='A' ;

     delete from em_order_t where rowid = EM_ROWID_DEC(prowid);
     commit;
   exception
    when others THEN
       em_error_pkg.em_error_prc;
   end;

-- Builds a search dialog for create auto orders. Returns the rowid
    procedure em_getautoData(pSiteID in em_site_t.site_id%type) is
       type woRefCurType is ref cursor;
       woRefCur woRefCurType;
       vThisRow   number default 0;
       vNumRows   number default 0;
       type woRecType is record (
             nsn          em_catalog_t.nsn%type,
             boh          em_catalog_t.boh%type,
             bulk_unit    em_catalog_t.bulk_unit%type,
             local_nomen  em_catalog_t.local_nomen%type,
             vc_name      em_vendor_contrctr_t.vc_name%type,
             row_id       rowid
                  );
       recWOType woRecType;
       vSQL  varchar2(500);
       vBGColor varchar2(12) := 'WHITE';
    begin
          htp.p('<body scroll="no" bgcolor="silver">');
          htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
          htp.p('<script language="javascript">');
          htp.p('window.status="Ready to begin order search."');
          htp.p('function clickFunction(col,row) { ');
          htp.p('   var srow=document.all.wonogrid.getSelRow();');
          htp.p('   if (srow==0) { return } ');
          htp.p('   var vptr=document.all.wonogrid.getCellText(6, srow);');
          htp.p('opener.goauto(vptr);');
          htp.p('}');
          htp.p('</script>');
          htp.p('</body>');
              vSQL :='select nsn,boh,bulk_unit,nom,vendor_stock_no,EM_ROWID_ENC(a.rowid)'||
              ' from em_order_t a, em_vendor_contrctr_t b'||
              ' where a.site_id = :1 '|| --pSiteID||
              ' and b.site_id = :2 '|| --pSiteID||
              ' and a.vc_id = b.vc_id'||
              ' order by nsn';
          open woRefCur for vSQL using pSiteID,pSiteID ;
          vm_utility_pkg.startGrid('wonogrid');
          htp.p('<param name="numcols" value="6"/>');
          htp.p('<param name="colheadertext" value="NSN,Qty,Unit,Nomenclature,Vendor,Rowid"/>');
          htp.p('<param name="colwidths" value="50,50,50,150,150,100"/>');
          htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
          htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
          htp.p('<param name="cellsreleasedfunction" value="selRow" />');
          htp.p('<param name="urlframe" value="dummyframe">');
          htp.p('<param name="clickFunction" value="clickFunction" />');
          loop
             fetch woRefCur into recWOType;
             exit when woRefCur%notfound;
             vThisRow := vNumRows + 1;
             htp.p('<param name="row'||vThisRow||'text" value="');
             htp.p(recWOType.nsn||','||recWOType.boh||','||recWOType.bulk_unit||','||recWOType.local_nomen||','||recWOType.vc_name||','||recWOType.row_id||'"></param>');
             vNumRows := vNumRows + 1;
          end loop;
          htp.p('<param name="numrows" value="'||vNumRows||'" />');
          htp.p('</div>');
          vTotalRowCount := vNumRows;
          htp.BodyClose;
     exception
      when others then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
     end ;

-- fill the auto screen based on the search
    procedure em_fillautoData(pSiteID in em_site_t.site_id%type,pRowID in varchar2 default null)
    is
      s_query constant varchar2(4000) :=
      'select  a.order_no as order_no_l,a.wo_ptr as wo_ptr_l,a.order_status_code as order_status,a.vc_id as vendor,'
      || 'a.pay_type as paytype, a.order_for_emp_id as req_name, a.title, a.buyer, '
      ||' to_char(a.required_date,''mm/dd/yyyy'') as date_required,aic_code as aic, folder_id as folder '
      ||' from em_order_t a  '
      ||' where a.site_id = '||pSiteID
      ||' and  order_no = '''||pRowID||'''';

     begin
      ctx := dbms_xmlgen.newContext(s_query);
      myxml := dbms_xmlgen.getXML(ctx);
      htp.p(myxml);

     exception
       when others  then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
    end;

-- Auto order grid
   procedure em_fillautogrid(pSiteID in em_order_t.site_id%type,p_order_no in em_order_t.order_no%type default null)
    is
    --variables to get the grid data
    type csr_ref_cursor is ref cursor;
    csr_ref          csr_ref_cursor;
    csr_data_ref     csr_ref_cursor;
    r_grid_data      sg_widget_grid_t%rowtype;
    row_count        number:=0;
    v_sql            varchar2(4000);
    v_sqlstm         varchar2(4000) default null;
    v_valuerow       varchar2(4000);

    -- Dynamic sql related variables
    csr_handle       integer;
    n_return         integer;
    vFlags           varchar2(255) := 'rowselection,resizecolumns,autoresizecols,useattributes,resizerows,rownumbers,rowlines,collines,rowheader,colheader,vscroll,threedborder,sortrowheaders';
     begin
       vm_utility_pkg.startGrid(pGridName=>'lstparts',pHeight=>'100',pWidth=>'665');
          htp.p('<param name="numcols" value="10"/>');
          htp.p('<param name="colheadertext" value="NSN,Nomenclature,Vendor Part,Qty,Unit,Unit Cost,Total Cost,ROWID,OEM,Justify"/>');
          htp.p('<param name="colwidths" value="100,200,100,30,60,60,60,0,0,100"/>');
          htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
          htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
          v_sql:='select nsn||'',''||nom||'',''||vendor_stock_no||'',''||qty_ordered||'',''||uoi_code||'',''||unit_cost||'',''||total_val||'',''||EM_ROWID_ENC(a.rowid)||'',''||oem||'',''||justify_order'
          ||'"rowdata" from em_order_t a, em_vendor_part_t b where   '||
               ' a.site_id = :1 '||--pSiteID||
               ' and b.site_id = :2 '||--pSiteID||
               ' and a.nsn(+) = b.part_nsn '||
               ' and order_no= :3 ';
--               ' and order_no='''||p_order_no||'''';
          open csr_data_ref for v_sql using pSiteID,pSiteID,p_order_no;
          loop
          fetch csr_data_ref into v_valuerow;
          exit when csr_data_ref%notfound;
          row_count:=row_count+1;
          htp.p('<param   name="row'||row_count||'text" value="'||v_valuerow||'"/>');
         end loop;
         if row_count=0 then
            htp.p('<param   name="row1text" value="-,No data found."/>');
         end if;
         --We want at least a certain number of rows to show
         if row_count < r_grid_data.min_rows then
            row_count:=r_grid_data.min_rows;
         end if;
         --htp.p(row_count);
         htp.p('<param name ="numrows" value ="'||to_char(row_count)||'"/>');
       vm_utility_pkg.endGrid;
   EXCEPTION
      WHEN others THEN
         em_error_pkg.em_error_prc;
   end;

   -- Auto grid iframe
   procedure autogridiframe(pSiteID in em_site_t.site_id%type,pUser in varchar2 default null)
    is
      l_espin_active varchar(1) default 'N';
   begin
     select espin_active
       into l_espin_active
       from em_site_t
      where site_id = pSiteID;

     if l_espin_active = 'N' then
        htp.p('<iframe name="frame1" borderWidth="none" src="em_order_pkg.em_view_autoreplenish_prc?psiteid='||pSiteID||'&pUser='||pUser||'" height=359 width=780></iframe>');
     else
        --Jesse 2012.4.27 htp.p('<iframe name="frame0" borderWidth="none" src="em_order_pkg.em_view_autoreplenish_espin_f1" height=55 width=786></iframe>');
		htp.p('<iframe name="frame0" borderWidth="none" src="em_order_pkg.em_view_autoreplenish_espin_f1" height=55 width=786></iframe><br />');
        htp.p('<iframe name="frame1" borderWidth="3" src="em_order_pkg.em_view_autoreplenish_espin?psiteid='||pSiteID||'&pUser='||pUser||'" height=359 width=780></iframe>');
     end if;
   end;


   PROCEDURE EM_AUTOREPLENISH_COUNT(pSiteID    in em_site_t.site_id%type default null)
     is
    -- CURSORS
    CURSOR csr_dataentry is
    select 1
    from em_catalog_t
    where site_id = pSiteID
    and reord_flag = 'N'
    and status_flag = 'Y'
    and room_id = 'A'
    and source_code not in ('R','1','A','M')
    and boh <= rop;

    l_count PLS_INTEGER := 0;
   begin
     open csr_dataentry;
     fetch csr_dataentry into l_count;
     close csr_dataentry;
     htp.p('<?xml version="1.0"?>');
     htp.p('<QTYPROCESSED>'||l_count||'</QTYPROCESSED>');
   end;



   PROCEDURE EM_VIEW_AUTOREPLENISH_PRC
    (
     pSiteID    in em_site_t.site_id%type default null,
     pUser      in varchar2 default null,
     p_message  in varchar2 default null
    )
     is
    -- CURSORS
    CURSOR csr_dataentry is
    select part_ptr,(average_boh-boh) reorder,rop, source_code, nsn, local_nomen,
    EM_ROQ_ROWID_FNC (rowid) as roq
    from em_catalog_t
    where site_id = pSiteID
    and reord_flag = 'N'
    and status_flag = 'Y'
    and NO_PARTS_DUE = 0 -- added per Lyod 10/2/2003   ---GSM readded per site issue
    and source_code not in ('R','1','A','X','M') -- Tehseen 3/8/2004. Added per Donna CAT 2M6
    and room_id = 'A' -- AUTO REPLENISH "A" PARTS ONLY - ADDED BY TA SEPT 12, 203.
    and boh <= rop
    order by nsn;

    l_csr_dataentry csr_dataentry%rowtype;

    -- Local Variables
    n_col   number :=0;
    l_counter   number :=0;
    p_rights varchar2(1) := 'R';

    BEGIN
        vm_utility_pkg.getCSS;
        p_rights := chkrights_fnc(pSiteID,pUser,'ORDERS');
        htp.p('<html><head>');
        htp.p('<SCRIPT language="JavaScript">');
        htp.p('var l_checked=false;');
        htp.p('var rights = "' ||p_rights|| '" ;') ;
        htp.p('function bodyload() {');
        htp.p(' document.body.style.cursor = "default";');
                htp.p('  for(x=0;x<emars.length;x++){');
        htp.p('    if(emars.elements[x].name == "p_chk"){');
        htp.p('         emars.elements[x+3].disabled=true; ');
        htp.p('    }');
        htp.p('  }  ');
        htp.p('   if (document.emars.p_message.value.length != 0) {');
        htp.p('      alert(document.emars.p_message.value);');
        htp.p('      document.emars.p_message.value = "";');
        htp.p('      return;');
        htp.p('   }');
        htp.p(' }');
        htp.p('function process(){ ');
        htp.p(' if (rights=="R") { ');
        htp.p('    alert("You do not have permission to this feature."); ');
        htp.p('    return; ');
        htp.p(' } ');
        htp.p('         emars.p_action.value = "PROCESS";');
        htp.p('  enableJustif();');
        htp.p(' emars.submit();');
        htp.p('}');
        htp.p('function processme() {');
                htp.p('  for(x=0;x<emars.length;x++){');
        htp.p('    if(emars.elements[x].name == "p_chk"){');
                htp.p('       if (emars.elements[x].checked==true){');
                htp.p('         document.emars.elements[x+1].value = "Y";');
        htp.p('         emars.elements[x+3].disabled=false; ');
        htp.p('       }');
        htp.p('       else {');
        htp.p('         emars.elements[x+1].value = "N";');
        htp.p('         emars.elements[x+3].disabled=true; ');
        htp.p('       }  ');
        htp.p('     }');
        htp.p('  }  ');
        htp.p('}');
        htp.p('  var preEl ;');
        htp.p('  var orgBColor;');
        htp.p('  var orgTColor;');
        htp.p('  function HighLightTR(){');
        htp.p('   var backColor="#94D6CE";');
        htp.p('   var textColor="cc3333";');
        htp.p('    if(typeof(preEl)!="undefined") {');
        htp.p('      preEl.bgColor=orgBColor;');
        htp.p('       try{ChangeTextColor(preEl,orgTColor);}catch(e){;}');
        htp.p('    }');
        htp.p('    var el = event.srcElement;');
        htp.p('    el = el.parentElement;');
        htp.p('    orgBColor = el.bgColor;');
        htp.p('    orgTColor = el.style.color;');
        htp.p('    el.bgColor=backColor;');
        htp.p('    try{ChangeTextColor(el,textColor);}catch(e){;}');
        htp.p('    preEl = el;');
        htp.p('  }');
        htp.p('  function ChangeTextColor(a_obj,a_color){  ;');
        htp.p('     for (i=0;i<a_obj.cells.length;i++)');
        htp.p('      a_obj.cells(i).style.color=a_color;');
        htp.p('  }');
        htp.p('  function selectall(){');
        htp.p('    for (i=0;i<emars.p_chk.length; i++) {');
        htp.p('     emars.p_chk[i].checked="true";');
        htp.p('    }');
        htp.p('    processme();');
        htp.p('  }');
        htp.p('  function enableJustif(){');
        htp.p('    for (i=0;i<emars.p_auto_justification.length; i++) {');
    --    htp.p('     alert(emars.p_auto_justification[i].value);');
        htp.p('     emars.p_auto_justification[i].disabled=false;');
        htp.p('    }');
        htp.p('  }');
        htp.p('

       function checkROQ(row){
           //check if they have put a quantity greater than ROQ in the field
           if(eval(emars.p_reorder[row-1].value) > eval(emars.p_auto_roq[row-1].value)){
                if(rights!=''S''){
                 // alert(''Quantity over ROQ,''+emars.p_auto_roq[row-1].value+''. Order status will be set to Pending'');
                  alert(''Quantity over ROQ.  Order status will be set to Pending'');
                }else{  alert(''Quantity Over ROQ.  You Must Enter a Jutification.'');
                }

                if(emars.p_auto_justification[row-1].value.length < 1 ){
                        emars.p_auto_justification[row-1].disabled=false;
                        emars.p_auto_justification[row-1].style.backgroundColor="YELLOW";
                        try{ emars.p_auto_justification[row-1].focus();} catch(e){}
               }
           }else{
             emars.p_auto_justification[row-1].disabled=false;
             emars.p_auto_justification[row-1].value='''';
             emars.p_auto_justification[row-1].style.backgroundColor="white"
             emars.p_auto_justification[row-1].disabled=true;
           }
         }

         function checkJustification(row){
             var thisfield=window.event.srcElement;
             if( eval(emars.p_reorder[row-1].value) > eval(emars.p_auto_roq[row-1].value) && emars.p_auto_justification[row-1].value.length < 1 ){
                alert(''Quantity Over ROQ.  You Must Enter a Jutification.'');
               try{ thisfield.focus();} catch(e){}
             }else{
                   emars.p_auto_justification[row-1].style.backgroundColor="white";
                   emars.p_auto_justification[row-1].disabled=true;
             }
         }

         function numeric(checkStr) {
            var checkOK = "0123456789";
            var allValid = true;
            var allNum = "";
            for (i = 0;  i < checkStr.length;  i++)
            {
            ch = checkStr.charAt(i);
            for (j = 0;  j < checkOK.length;  j++)
            if (ch == checkOK.charAt(j))
            break;
            if (j == checkOK.length)
            {
            allValid = false;
            break;
            }
            if (ch != ",")
            allNum += ch;
            }
            if (!allValid)
            {
            return (false);
            }
         }
          function enter(fieldnum) {
            var thisfield=window.event.srcElement;
            if(window.event && window.event.keyCode == 13) {
                  for(x=0;x<emars.length;x++){
                if(emars.elements[x].name=="p_reorder"){
                     if(numeric(emars.elements[x].value)==false ) {
                       alert("Order amount must be numeric.");
                       document.emars.elements[x].focus();
                       return;
                     }
                     if (emars.elements[x].value=="") {
                       emars.elements[x].focus();
                       return;
                     }
                }
              }
            }
          }
        ');
        /*
        */
        htp.p('  function deselectall(){');
        htp.p('    for (i=0;i<emars.p_chk.length; i++) {');
        htp.p('     emars.p_chk[i].checked=false;');
        htp.p('    }');
        htp.p('    processme();');
        htp.p('  }');
        htp.p(' </SCRIPT>');
        htp.p('</head>');
        htp.p('<body width="100%" onLoad="bodyload()">');
        htp.p('<FORM NAME="emars" ACTION="em_order_pkg.EM_SAVE_AUTOREPLENISH_PRC" METHOD="POST" >');
        htp.p('<INPUT TYPE="hidden" NAME=p_action VALUE="">');
        htp.p('<INPUT TYPE="hidden" NAME=p_action_id VALUE="">');
        htp.p('<INPUT TYPE="hidden" NAME=pSiteID VALUE="'||pSiteID||'">');
        htp.p('<INPUT TYPE="hidden" NAME=pUser VALUE="'||pUser||'">');
        htp.p('<INPUT TYPE="hidden" NAME=p_rights VALUE="'||p_rights||'">');
        htp.p('<INPUT TYPE="hidden" NAME=p_message VALUE="'||p_message||'">');
        htp.p('<table class=uitable border width="100%">');
        htp.p('<tr>');
        htp.p('<th></th>');
        htp.p('<th>SC</th>');
        htp.p('<th>NSN</th>');
        htp.p('<th>Nomenclature</th>');
        htp.p('<th>Order</th>');
        htp.p('<th>Justification </th>');
        htp.p('</tr>');
    FOR l_csr_dataentry IN csr_dataentry LOOP
        l_counter := l_counter + 1;
        htp.p('<tr bgcolor="DCDCDC"; onClick="HighLightTR()">');
        htp.p('<td width="2%">'||l_counter||' </td>');
        htp.p('<input type="hidden" name="p_ptr" value="'||l_csr_dataentry.part_ptr||'">');
        htp.p('<td width="3%">'||l_csr_dataentry.source_code||'</td>');
        htp.p('<td width="19%">'||l_csr_dataentry.nsn||'</td>');
        htp.p('<td width="39%">'||l_csr_dataentry.local_nomen||'</td>');
        htp.p('<td width="3%" ><input type="text" name="p_reorder" value="'||l_csr_dataentry.roq||'" size="4" MAXLENGTH="8" onKeyPress="enter('||l_counter||')" onBlur="checkROQ('||l_counter||')"</td>');
        htp.p('<td width="38%"><input type="text" name="p_auto_justification" value="" disabled="true" size="35" MAXLENGTH="100" onBlur="checkJustification('||l_counter||')" </td>');
            htp.p('<td><input type="hidden" name="p_auto_roq" value="'||l_csr_dataentry.roq||'"</td>');
        htp.p('</tr>');
    END LOOP;
        htp.p('<tr class=tablerow >');
        htp.p('<td colspan=6>');
        if l_counter = 0 then
           htp.p('<div class=maroonButton>No Inventory Items Found to Replenish.</div>');
        end if;
    htp.p('</td></tr></table></form></body></html>');
    --Robbied added 12/12/2004 to set date fro sites that don't use auto rep
    update em_site_t set AUTO_REPLENISH_DATE=sysdate where site_id=pSiteID;
    commit;

    END;

--------------------------------------------
PROCEDURE EM_VIEW_AUTOREPLENISH_ESPIN_f1
    IS

    n VARCHAR2(1):='N';

BEGIN
    vm_utility_pkg.getCSS;
    htp.p('<html>');
    htp.p('<head>');
    htp.p('</head>');
    htp.p('<body width="100%">');
    htp.p('   <FORM NAME="emars1">');
    htp.p('<table class=uitable border width="100%">');
    htp.p('    	<tbody style="font-size: 8pt">');
    htp.p('    	<tr style="font-size: 8pt">');
    htp.p('    		<th width="2%">&nbsp;&nbsp;&nbsp;</th>');
    htp.p('    		<th width="3%">SC&nbsp;</th>');
    htp.p('    		<th width="17%">NSN</th>');
    htp.p('    		<th width="33%">Nomenclature</th>');
    htp.p('    		<th width="6%">Order</th>');
    htp.p('    		<th width="28%">Justification </th>');
    htp.p('    		<th width="7%">Balancing Transfer?</font></th>');
    htp.p('    	</tr>');
    htp.p('    	</tbody>');
    --jesse htp.p('    	</table>');
    htp.p('</table></form>');
    htp.p('</body></html>');

EXCEPTION
    WHEN others THEN
        emapp.em_error_pkg.em_ErrorInsert_prc;
    RAISE;
END;


--------------------------------------------
PROCEDURE EM_VIEW_AUTOREPLENISH_ESPIN
    (
        pSiteID    in em_site_t.site_id%type default null,
        pUser      in varchar2 default null,
        p_message  in varchar2 default null
    )
    IS

    CURSOR csr_dataentry IS
    SELECT
        a.part_ptr, a.roq reorder, b.espin_rop rop, b.source_code, b.nsn, b.local_nomen,
        a.roq as roq,
        DECODE(a.transfer_site_id,NULL,'N','Y') AS transfer_item,
        a.transfer_site_id,
        a.transfer_part_ptr
    FROM
        em_order_autoreplenish_t a,
        em_catalog_T b
    WHERE a.site_id = b.site_id
        AND a.part_ptr = b.part_ptr
        AND b.reord_flag = 'N'
        AND a.site_id = pSiteID
        AND b.site_id = pSiteID
        AND b.status_flag = 'Y'
        AND b.NO_PARTS_DUE = 0 -- added per Lyod 10/2/2003   ---GSM readded per site issue
        AND b.source_code NOT IN ('R','1','X','M')
        AND room_id = 'A' -- AUTO REPLENISH "A" PARTS ONLY - ADDED BY TA SEPT 12, 203.
        AND b.boh <= b.espin_rop
    ORDER BY nsn;


    l_csr_dataentry csr_dataentry%rowtype;

    -- Local Variables
    n_col               NUMBER      := 0;
    l_counter           NUMBER      := 0;
    p_rights            VARCHAR2(1) := 'R';
    l_auto_run_espin    VARCHAR2(1) := 'N';
    l_auto_run          VARCHAR2(1) := 'N';

    BEGIN

   --Check to see Auto Replenish has been run today for espin sites.
    SELECT DECODE(COUNT(1),0,'N','Y')
            INTO l_auto_run
        FROM em_site_t
        WHERE auto_replenish_date > TRUNC(SYSDATE)+6/24
        AND site_id = pSiteID;

    SELECT DECODE(COUNT(1),0,'N','Y')
        INTO l_auto_run_espin
        FROM em_espin_orders_recommended_t
        WHERE site_id = pSiteID;

    --------------------------------------------
    IF l_auto_run = 'N' THEN
        IF l_auto_run_espin = 'Y' THEN

            -- Upload from the temp table has not been run
            DELETE em_order_autoreplenish_t WHERE site_id = pSiteID;COMMIT;

            -- Get recommended items from espin
            INSERT INTO em_order_autoreplenish_t
                    (
                        site_id, part_ptr, roq, transfer_site_id,
                        transfer_part_ptr, quantity_requested, order_type_code,
                        create_date, create_user, mod_date, mod_user
                    )
                SELECT  site_id, part_ptr, roq, transfer_site_id,
                    transfer_part_ptr, 0, '',
                    SYSDATE, -1, SYSDATE, -1
                    FROM em_espin_orders_recommended_t
                    WHERE site_id = pSiteID;
                COMMIT;

            -- delete items from the upload table.
            DELETE em_espin_orders_recommended_t WHERE site_id = pSiteID;COMMIT;

            --Robbied added 12/12/2004 to set date for sites that don't use auto rep
            UPDATE em_site_t
                SET AUTO_REPLENISH_DATE=SYSDATE
                WHERE site_id=pSiteID;
            COMMIT;
        END IF;
    END IF;

    vm_utility_pkg.getCSS;
    p_rights := chkrights_fnc(pSiteID,pUser,'ORDERS');
    htp.p('<html>');
    htp.p('<head>');
    htp.p('<SCRIPT language="JavaScript">');
    htp.p('var l_checked=false;');
    htp.p('var rights = "' ||p_rights|| '" ;') ;

    htp.p('
            //////////////////////////////////
            function bodyload() {
                // ESPIN PROCEDURE
                document.body.style.cursor = "default";
                for(x=0;x<emars.length;x++) {if(emars.elements[x].name == "p_chk"){emars.elements[x+3].disabled=true; }}
                if (document.emars.p_message.value.length != 0) {alert(document.emars.p_message.value);document.emars.p_message.value = "";return;}
            }
            //////////////////////////////////
            function process(){
                if (rights=="R") {alert("You do not have permission to this feature."); return; }
                emars.p_action.value = "PROCESS";
                enableJustif();
                emars.submit();
            }
            //////////////////////////////////
            function processme() {
                for(x=0;x<emars.length;x++){
                    if(emars.elements[x].name == "p_chk"){if (emars.elements[x].checked==true){document.emars.elements[x+1].value = "Y";emars.elements[x+3].disabled=false; }}
                    else {emars.elements[x+1].value = "N";emars.elements[x+3].disabled=true; }
                }
            }
            var preEl ;
            var orgBColor;
            var orgTColor;
            //////////////////////////////////
            function HighLightTR(){
                var backColor="#94D6CE";
                var textColor="cc3333";
                if(typeof(preEl)!="undefined") {preEl.bgColor=orgBColor;try{ChangeTextColor(preEl,orgTColor);}catch(e){;}}
                var el = event.srcElement;
                el = el.parentElement;
                orgBColor = el.bgColor;
                orgTColor = el.style.color;
                el.bgColor=backColor;
                try {ChangeTextColor(el,textColor);}catch(e){}
                preEl = el;
            }
            //////////////////////////////////
            function ChangeTextColor(a_obj,a_color){
                for (i=0;i<a_obj.cells.length;i++){a_obj.cells(i).style.color=a_color;}
            }
            //////////////////////////////////
            function selectall(){
                for (i=0;i<emars.p_chk.length; i++) {emars.p_chk[i].checked="true";}
                processme();
            }
            //////////////////////////////////
            function deselectall(){
                for (i=0;i<emars.p_chk.length; i++) {emars.p_chk[i].checked=false;}
                processme();
            }
            //////////////////////////////////
            function enableJustif(){
                for (i=0;i<emars.p_auto_justification.length; i++) {emars.p_auto_justification[i].disabled=false;}
            }

        ');

        htp.p('

            function checkROQ(row){
                //check if they have put a quantity greater than ROQ in the field
                //alert("this is a test");
                // if(eval(emars.p_reorder[row-1].value) > eval(emars.p_auto_roq[row-1].value)){

                row = row-1;
                try {
                    test1 = emars.p_reorder[0].value;

                    //alert("test1: "+test1);
                    //alert("eval(emars.p_reorder[row].value): "+eval(emars.p_reorder[row].value));     //new value 8
                    //alert("eval(emars.p_auto_roq[row].value): "+eval(emars.p_auto_roq[row].value));   // old value 2
                    //alert("emars.p_transfer_item[row].value: "+emars.p_transfer_item[row].value);     // Y

			      if ( (eval(emars.p_reorder[row].value) > eval(emars.p_auto_roq[row].value) && emars.p_transfer_item[row].value==''Y'')) {
                        alert(''No More than Maximum number of ROQ. (Because, this item is a Balancing Transfer).''+''\n\nYou Must Enter Same or Less.'');
                        emars.p_reorder[row].value = emars.p_auto_roq[row].value;
                        emars.p_reorder[row].focus();
                        return;
                    }

			      if ( (eval(emars.p_reorder[row].value) > eval(emars.p_auto_roq[row].value) && emars.p_transfer_item[row].value==''N'')) {

                        if (rights!=''S''){alert(''Quantity over ROQ.  Order status will be set to Pending'');}
                        else {if(emars.p_auto_justification[row].value.length < 1 ){
                                alert(''Quantity Over ROQ.  You Must Enter a Jutification (1).'');
                                emars.p_auto_justification[row].disabled=false;
                                emars.p_auto_justification[row].style.backgroundColor="YELLOW";
                                try {emars.p_auto_justification[row].focus();} catch(e){}}}}
                    else {
                        emars.p_auto_justification[row].disabled=false;
                        emars.p_auto_justification[row].value='''';
                        emars.p_auto_justification[row].style.backgroundColor="white"
                        emars.p_auto_justification[row].disabled=true;
                        // try{ emars.p_reorder[row+1].focus();} catch(e){}
                    }
                }
                catch(e){
                    if(eval(emars.p_reorder.value) > eval(emars.p_auto_roq.value)){
                        if (emars.p_transfer_item[row].value==''Y''){
                            alert(''No More than Maximum number of ROQ. (Because, this item is a Balancing Transfer).''+''\n\nYou Must Enter Same or Less.'');
                            emars.p_reorder[row].value = emars.p_auto_roq[row].value;
                        return;
                        }

                       if(rights!=''S''){alert(''Quantity over ROQ.  Order status will be set to Pending'');}
                        else {alert(''Quantity Over ROQ.  You Must Enter a Jutification (2).'');
                            if(emars.p_auto_justification.value.length < 1 ){
                                emars.p_auto_justification.disabled=false;
                                emars.p_auto_justification.style.backgroundColor="YELLOW";
                                try{ emars.p_auto_justification.focus();} catch(e){}}}}
                    else {
                        emars.p_auto_justification.disabled=false;
                        emars.p_auto_justification.value='''';
                        emars.p_auto_justification.style.backgroundColor="white"
                        emars.p_auto_justification.disabled=true;
                    }
                }
            }

            //////////////////////////////////
            function checkJustification(row){
                var thisfield=window.event.srcElement;
                try {test1 = emars.p_reorder[0].value;
                    if( eval(emars.p_reorder[row-1].value) > eval(emars.p_auto_roq[row-1].value) && emars.p_auto_justification[row-1].value.length < 1 ){
                        alert(''Quantity Over ROQ.  You Must Enter a Jutification.'');
                        try{ thisfield.focus();} catch(e){}}
                    else{
                        emars.p_auto_justification[row-1].style.backgroundColor="white";
                        emars.p_auto_justification[row-1].disabled=true;}}
                catch(e){
                    if( eval(emars.p_reorder.value) > eval(emars.p_auto_roq.value) && emars.p_auto_justification.value.length < 1 ){
                        alert(''Quantity Over ROQ.  You Must Enter a Jutification.'');
                        try{ thisfield.focus();} catch(e){}}
                    else{
                        emars.p_auto_justification.style.backgroundColor="white";
                        emars.p_auto_justification.disabled=true;}}
            }

            ////////////////////////
            function numeric(checkStr) {
                var checkOK = "0123456789";
                var allValid = true;
                var allNum = "";
                for (i = 0;  i < checkStr.length;  i++){
                    ch = checkStr.charAt(i);
                    for (j = 0;  j < checkOK.length;  j++){
                        if (ch == checkOK.charAt(j)){break;}
                        if (j == checkOK.length){allValid = false;break;}
                        if (ch != ","){allNum += ch;}
                        if (!allValid){return (false);}
                    }
                }
            }

            ////////////////////////
            function enter(fieldnum) {
                fieldnum = fieldnum-1;
                // alert(window.event.keyCode);
                // numeric(emars.p_reorder[fieldnum].value)==false
                if (!(( window.event.keyCode==13 || window.event.keyCode==9  || window.event.keyCode==8  ||
                        window.event.keyCode==46 || window.event.keyCode==16)|| window.event.keyCode >= 37 && window.event.keyCode <= 40)){
                    if (!(( window.event.keyCode > 47 && window.event.keyCode < 58) || (window.event.keyCode > 95 && window.event.keyCode < 106)) ) {
                        alert("Order amount must be numeric.");emars.p_reorder[fieldnum].value="0";emars.p_reorder[fieldnum].focus();return;}
                    if(emars.p_reorder[fieldnum].value=="") {emars.p_reorder[fieldnum].value="0";}
                }
            }

            /////EOF///////////////////

    ');

    htp.p(' </SCRIPT>');
    htp.p('</head>');

    htp.p('<body width="100%" onLoad="bodyload()">');
    htp.p('<FORM NAME="emars" ACTION="em_order_pkg.EM_SAVE_AUTOREPLENISH_ESPIN" METHOD="POST">'); --TARGET="NEW"
    htp.p('<INPUT TYPE="hidden" NAME=p_action       VALUE="">');
    htp.p('<INPUT TYPE="hidden" NAME=p_action_id    VALUE="">');
    htp.p('<INPUT TYPE="hidden" NAME=pSiteID        VALUE="'||pSiteID||'">');
    htp.p('<INPUT TYPE="hidden" NAME=pUser          VALUE="'||pUser||'">');
    htp.p('<INPUT TYPE="hidden" NAME=p_rights       VALUE="'||p_rights||'">');
    htp.p('<INPUT TYPE="hidden" NAME=p_message      VALUE="'||p_message||'">');

    htp.p('<table class=uitable border width="100%">');

/*
    htp.p('<tr>');
    htp.p('<th></th>');
    htp.p('<th>SC</th>');
    htp.p('<th>NSN</th>');
    htp.p('<th>Nomenclature</th>');
    htp.p('<th>Order</th>');
    htp.p('<th>Justification </th>');
    htp.p('<th>Balancing Transfer?</th>');
    htp.p('</tr>');
*/

    FOR l_csr_dataentry IN csr_dataentry LOOP
        l_counter := l_counter + 1;
        htp.p('<tr bgcolor="DCDCDC"; onClick="HighLightTR()">');


        htp.p('<input type="hidden" name="p_ptr" value="'||l_csr_dataentry.part_ptr||'">');
        htp.p('<input type="hidden" name="p_transfer_site_id" value="'||l_csr_dataentry.transfer_site_id||'">');
        htp.p('<input type="hidden" name="p_transfer_part_ptr" value="'||l_csr_dataentry.transfer_part_ptr||'">');

        IF l_csr_dataentry.transfer_item='Y' THEN
            htp.p('<td bgcolor="AA7FFF" width="2%">'||l_counter||' </td>');
            htp.p('<td bgcolor="AA7FFF" width="3%">'||l_csr_dataentry.source_code||'</td>');
            htp.p('<td bgcolor="AA7FFF" width="16%" <font size="2">'||l_csr_dataentry.nsn||'</td>');
            htp.p('<td bgcolor="AA7FFF" width="30%" <font size="1">'||l_csr_dataentry.local_nomen||'</td>');
            htp.p('<td bgcolor="AA7FFF" width="3%" ><input type="text" name="p_reorder" value="'||l_csr_dataentry.roq||'" size="4" MAXLENGTH="8" onKeyPress="enter('||l_counter||')" onKeyUp="enter('||l_counter||')" onBlur="checkROQ('||l_counter||')"</td>');
            htp.p('<td bgcolor="AA7FFF" width="30%"><input type="text" name="p_auto_justification" value="" disabled="true" size="35" MAXLENGTH="100" onBlur="checkJustification('||l_counter||')" </td>');

            htp.p('<td bgcolor="AA7FFF" width="3%">'||l_csr_dataentry.transfer_item||'</td>'); --hirad5
        ELSE
            htp.p('<td width="2%">'||l_counter||' </td>');
            htp.p('<td width="3%">'||l_csr_dataentry.source_code||'</td>');
            htp.p('<td width="16%" <font size="2">'||l_csr_dataentry.nsn||'</td>');
            htp.p('<td width="30%" <font size="1">'||l_csr_dataentry.local_nomen||'</td>');
            htp.p('<td width="3%" ><input type="text" name="p_reorder" value="'||l_csr_dataentry.roq||'" size="4" MAXLENGTH="8" onKeyPress="enter('||l_counter||')" onKeyUp="enter('||l_counter||')" onBlur="checkROQ('||l_counter||')"</td>');
            htp.p('<td width="30%"><input type="text" name="p_auto_justification" value="" disabled="true" size="35" MAXLENGTH="100" onBlur="checkJustification('||l_counter||')" </td>');

            htp.p('<td width="3%">'||l_csr_dataentry.transfer_item||'</td>'); --hirad5
        END IF;

        htp.p('<input type="hidden" name="p_transfer_item" value="'||l_csr_dataentry.transfer_item||'">');
        htp.p('<input type="hidden" name="p_auto_roq" value="'||l_csr_dataentry.roq||'">');
        htp.p('</tr>');

    END LOOP;

    IF l_counter = 0 THEN
        htp.p('<tr class=tablerow >');
        htp.p('<td colspan=6>');
        htp.p('<div class=maroonButton>No Inventory Items Found to Replenish.</div>');
        htp.p('</td></tr>');
    END IF;
    htp.p('</table></form>');
    htp.p('</body></html>');
END;


--------------------------------------------
PROCEDURE em_process_message
    IS
BEGIN
    htp.p('Request been processed........');
END;

--------------------------------------------
    -- SAVES AUTO REPLENISHMENT --
PROCEDURE em_save_autoreplenish_prc (
      pSiteID         in em_site_t.site_id%type default null,
      pUser           in varchar2 default null,
      p_reorder       in owa.vc_arr,
      p_ptr           in owa.vc_arr,
      p_message       in varchar2 default null,
      p_action        in varchar2,
      p_action_id     in varchar2 ,
      p_auto_justification in owa.vc_arr,
      p_auto_roq      in owa.vc_arr,
      p_rights        in varchar2
    ) is
    p_roq_ind  number;
    l_cnt PLS_INTEGER := 0;

    vOrderCount number default 0;

    -- get details for the order
    cursor csr_em_catalog_t(p1 in varchar2 default null) is
    select * from em_catalog_t
    where site_id = pSiteID and part_ptr = p1;

    l_csr_em_catalog_t    csr_em_catalog_t%rowtype;

    l_module_id varchar2(20) := 'STOCKED';
    begin

     if upper(p_action) = 'PROCESS' then
       for  i in 1..p_ptr.count loop

         open csr_em_catalog_t(p_ptr(i)); -- was l_cnt. TK.
         fetch csr_em_catalog_t into l_csr_em_catalog_t;
         close csr_em_catalog_t;

         if p_reorder(i) > 0  then
           if l_csr_em_catalog_t.source_code = 'L' then
             l_module_id := 'AUTOLOCAL';
           else
             l_module_id := 'STOCKED';
           end if;

           if p_auto_justification(i) is not null then
              p_roq_ind:=1;
           else
              p_roq_ind:=null;
           end if;

           em_order_pkg.em_savestocked_prc(
               pSiteID,
               vm_utility_pkg.getCurrentFY,
               '',
               l_csr_em_catalog_t.nsn,
               l_csr_em_catalog_t.local_nomen,
               l_csr_em_catalog_t.source_code,  -- 'L'
               l_csr_em_catalog_t.bulk_unit,
               p_reorder(i), -- was l_cnt . TK
               l_csr_em_catalog_t.uoi_code,
               l_csr_em_catalog_t.boh,
               l_csr_em_catalog_t.inv_group_cd_1,
               '',
               'Auto Replenishment',
               p_auto_justification(i),
               pUser,
               pUser,
               l_csr_em_catalog_t.unit_cost,
               'N',
               'Y',
               l_module_id, --'AUTOLOCAL',
               'Y',
               null,
               'P', -- Pending status for auto ourders. Added by TA
                p_auto_roq(i),
                p_roq_ind,
                p_rights,
                p_bulk_qty => l_csr_em_catalog_t.bulkpack
               );
               vOrderCount := vOrderCount + 1;
          end if;
--Tehseen: 7/18/06: Per Llyod. Moved inside the loop and out of "if" so not to do a mass update.

               update em_catalog_t
               set reord_flag = 'Y'
               --, mod_date = sysdate
               where site_id = pSiteID and
               nsn = l_csr_em_catalog_t.nsn and
               room_id = 'A';


       end loop;
         commit;
         -- Tehseen - 12/29/2003: Update flag to keep track of replenishments.
         update em_site_t
         set AUTO_REPLENISH_DATE = sysdate
         where site_id = pSiteID;
         commit;
       em_order_pkg.em_view_autoreplenish_prc(pSiteID,pUser,'Process Complete - '||vOrderCount||' orders created.' );
       return;
     end if;
    exception
      when others then
        em_error_pkg.em_errorInsert_prc;
    end;

    procedure em_save_autoreplenish_espin (
      pSiteID               in em_site_t.site_id%type default null,
      pUser                 in varchar2 default null,
      p_reorder             in owa.vc_arr,
      p_ptr                 in owa.vc_arr,
      p_message             in varchar2 default null,
      p_action              in varchar2,
      p_action_id           in varchar2 ,
      p_auto_justification  in owa.vc_arr,
      p_auto_roq            in owa.vc_arr,
      p_rights              in varchar2,
      p_transfer_item       in owa.vc_arr,
      p_transfer_site_id    in owa.vc_arr,
      p_transfer_part_ptr   in owa.vc_arr
    ) is
    p_roq_ind  number;
    p_order_type_code varchar2(1):= 'N';
    P_source_code em_catalog_t.source_code%type := 'T';

    l_cnt PLS_INTEGER := 0;

    vOrderCount number default 0;

    -- get details for the order
    cursor csr_em_catalog_t(p1 in varchar2 default null) is
    select * from em_catalog_t
    where site_id = pSiteID and part_ptr = p1;

    l_csr_em_catalog_t    csr_em_catalog_t%rowtype;

    l_module_id varchar2(20) := 'STOCKED';
    begin

     if upper(p_action) = 'PROCESS' then
       for  i in 1..p_ptr.count loop

         open csr_em_catalog_t(p_ptr(i)); -- was l_cnt. TK.
         fetch csr_em_catalog_t into l_csr_em_catalog_t;
         close csr_em_catalog_t;

         if p_reorder(i) > 0  then
           if l_csr_em_catalog_t.source_code = 'L' then
             l_module_id := 'AUTOLOCAL';
           else
             l_module_id := 'STOCKED';
           end if;

           if p_auto_justification(i) is not null then
              p_roq_ind:=1;
           else
              p_roq_ind:=null;
           end if;

           if p_transfer_item(i) = 'Y'  then
              p_order_type_code := 'B';
           else
              p_order_type_code := 'N';
              P_source_code := l_csr_em_catalog_t.source_code;
           end if;

           em_savestocked_prc(
               pSiteID,
               vm_utility_pkg.getCurrentFY,
               '',
               l_csr_em_catalog_t.nsn,
               l_csr_em_catalog_t.local_nomen,
               P_source_code,
               l_csr_em_catalog_t.bulk_unit,
               p_reorder(i),
               l_csr_em_catalog_t.uoi_code,
               l_csr_em_catalog_t.boh,
               l_csr_em_catalog_t.inv_group_cd_1,
               '',
               'Auto Replenishment',
               p_auto_justification(i),
               pUser,
               pUser,
               l_csr_em_catalog_t.unit_cost,
               p_order_type_code,--'N',-- If this is a transfer from another site then pass B
               'Y',
               l_module_id, --'AUTOLOCAL',
               'Y',
               null,
               'P', -- Pending status for auto orders. Added by TA
                p_auto_roq(i),
                p_roq_ind,
                p_rights,
                p_transfer_site_id(i),
                p_transfer_part_ptr(i),
               l_csr_em_catalog_t.bulkpack
               );
               vOrderCount := vOrderCount + 1;

         end if;
         -- Remove the record from the autoreplenish table.
         delete em_order_autoreplenish_t
          where site_id = pSiteID
            and part_ptr = p_ptr(i);

--Tehseen: 6/20/06: Per Constatino. Moved inside the loop so not to do a mass update.
           update em_catalog_t
           set reord_flag = 'Y'
           --, mod_date = sysdate
           where site_id = pSiteID and
           nsn = l_csr_em_catalog_t.nsn and
           room_id = 'A';
       end loop;
       commit;
         -- Tehseen - 12/29/2003: Update flag to keep track of replenishments.
/*
         update em_site_t
         set AUTO_REPLENISH_DATE = sysdate
         where site_id = pSiteID;
         commit;
*/
       em_order_pkg.em_view_autoreplenish_espin(pSiteID,pUser,'Process Complete - '||vOrderCount||' orders created.' );
       return;
     end if;
    exception
      when others then
        em_error_pkg.em_errorInsert_prc;
    end;


-- view orders screen
    procedure em_vieworders(pRowID in varchar2 default null)
    is
      s_query constant varchar2(4000) :=
      'select  a.order_type_code as requisition_type, a.order_status_code, a.order_for_emp_id as nonemployee, a.order_no as order_no_s, '
      ||' a.nsn as nsn_s,a.nom as nom_s, a.source_code, a.bulk_unit as bulk_unit,a.qty_ordered,a.unit_cost as unit_cost, '
      ||' a.uoi_code as unit_of_issue, a.wo_ptr as wo_ptr_s, b.wo_no as wo_no_s, order_comment as ord_comment,a.justify_order'
      ||' from em_order_t a , em_wo_t b  where a.rowid = '''||EM_ROWID_DEC(pRowID)||'''  and a.wo_ptr = b.wo_ptr(+) ' ;
     begin
--     htp.p(s_query);
      ctx := dbms_xmlgen.newContext(s_query);
      myxml := dbms_xmlgen.getXML(ctx);
      htp.p(myxml);
     exception
       when others  then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
    end;

-- Builds a pending.
   procedure em_getPendingData (pSite in em_order_t.site_id%type) is
      --variables to get the grid data
      type csr_ref_cursor is ref cursor;
      csr_ref          csr_ref_cursor;
      csr_data_ref     csr_ref_cursor;
      r_grid_data      sg_widget_grid_t%rowtype;
      row_count        number:=0;
      v_sql            varchar2(4000);
      v_sqlstm         varchar2(4000) default null;
      v_valuerow       varchar2(4000);
      v_site_id        em_site_t.site_id%type;
      v_siteid_param   varchar2(100) default null;
      v_nsn_param      varchar2(100) default null;
      v_nom_param      varchar2(100) default null;
      v_loc_param      varchar2(100) default null;
      v_oem_param      varchar2(100) default null;

      -- Dynamic sql related variables
      csr_handle       integer;
      n_return         integer;
      vFlags           varchar2(255) := 'rowselection,resizecolumns,autoresizecols,useattributes,resizerows,rownumbers,rowlines,collines,rowheader,colheader,vscroll,threedborder,sortrowheaders';
      vBGColor         varchar2(10) := 'BLUE';
      begin
         vm_utility_pkg.startGrid(pGridName=>'gridpending',pHeight=>'360',pWidth=>'880');
            htp.p('<param name="numcols" value="14"/>');
            htp.p('<param name="colheadertext" value="Order No,NSN,NOM,SC,Order Dt,Qty,Unit Cost,Total Cost,UI,Wrk Ord,By,For,ROQ"/>');
            htp.p('<param name="colwidths" value="70,95,160,25,65,35,50,50,35,60,25,100,25,0"/>');
            htp.p('<param name="sortcolumns" value="1,2,3,4,5,6,7,8,9,10,11"/>');
            htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
            htp.p('<param name="clickfunction" value="pendingClick" />');

            v_sql:='select order_no||'',''||nsn||'',''||em_replace_chars(nom)||'',''||source_code||'',''||'||
                     'to_char(order_date, ''MM/DD/YYYY'')||'',''||qty_ordered||'',''||unit_cost||'',''||to_char(qty_ordered*unit_cost)||'',''||'||
                     'uoi_code||'',''||em_order_pkg.em_getwono(wo_ptr,site_id)||'',''||'||
                     'em_replace_chars(order_by_emp_id)||'',''||'||
                     'nvl2(wo_ptr,em_replace_chars(order_for_emp_id),''For Stock'')||'',''||'||
                     'decode(over_roq_ind,1,''Y'',''N'')||'',''||EM_ROWID_ENC(a.rowid) '
            ||'"rowdata" from em_order_t a where   '||
            ' a.site_id =  :1 '||--pSite||
            ' and order_filled_flag = ''N'''||
            '  and pending_flag =''Y'''||
            ' and source_code !=''L''';
-- snafu 12560            ||' and source_code in (''A'',''T'',''D'',''G'',''S'')';

            v_sql:=v_sql||v_sqlstm||' order by order_no';

 -- em_error_pkg.em_log_prc(v_sql);
            open csr_data_ref for v_sql using pSite;
            loop
               fetch csr_data_ref into v_valuerow;
               exit when csr_data_ref%notfound;
               row_count:=row_count+1;
               htp.p('<param  name="row'||row_count||'text" value="'||v_valuerow||'"/>');
               if vBGColor = 'WHITE' then vBGColor:='C6EFF7'; else vBGColor :='WHITE'; end if;
               htp.p('<param name=row'||row_count||'attributes value="arial,null,10,NULL,'||vBGColor||',LEFT">');
            end loop;

           --We want at least a certain number of rows to show
           if row_count < r_grid_data.min_rows then
              row_count:=r_grid_data.min_rows;
           end if;

           htp.p('<param name ="numrows" value ="'||to_char(row_count)||'"/>');
        vm_utility_pkg.endGrid;
        htp.p('<br>');

        htp.p('<div class="captionmsmall">'||row_count||' pending orders found.</div>');
   EXCEPTION
      WHEN others THEN
          em_error_pkg.em_error_prc;
   end;



   procedure div7381(pSiteId    in  em_site_t.site_id%type) is
   begin
      htp.htmlOpen;
      htp.p('<fieldset><legend>STEP 2 - REVIEW/UPDATE PURCHASE ORDERS</legend>');

      htp.p('<table cellpadding="2" width="700" class="tablerow">');
      htp.p('<tr>');
      htp.p('<td width="40%" align="left">');

        htp.p('<table cellpadding="2" width="100%" class="tablerow">');
        htp.p('<tr><td colspan="2"><span style="height:15" />Purchase Orders Created</span>');
        htp.p('<select name="autoVendor" style="width:200" size="9" onClick="focusVen(this)" >');
        htp.p('</select>');
        htp.p('</td>');
        htp.p('</tr>');
        htp.p('</table>');

      htp.p('</td>');
      htp.p('<td width="60%" align="left">');

        htp.p('<table cellpadding="2" width="100%" border="0" class="tablerow">');
        htp.p('<tr>');
        htp.p('<td colspan="2"><font size="2" color="maroon">PURCHASE ORDER DETAILS:</font>');
        htp.p('</td>');
        htp.p('</tr><tr><td>&nbsp;</td></tr>');

        htp.p('<tr>');
        htp.p('<td align="right">Vendor:</td>');
        htp.p('<td colspan="3"><input type="text" name="lblVendor" size="80" onFocus="blur()" style="background-color:#DCDCDC; font-size: 12px" /></td>');
        htp.p('</tr>');

        htp.p('<tr>');
        htp.p('<td align="left" width="50%">Status:</td>');
        htp.p('<td colspan="3"><select name="st" onBlur="printf()">');
            --htp.p('<option selected value=""></option>');
            htp.p('<option selected value="P">PENDING</option>');
            htp.p('<option value="A">APPROVED</option>');
            htp.p('<option value="C">CANCELLED</option>');
        htp.p('</select><input type="button" value="PRINT" onClick="printf()" style="width:80; position:relative; left: 20"/></div></td>');
        htp.p('<td align="left" width="50%"></td><td></td>');
        htp.p('</td>');
        htp.p('</tr>');

        htp.p('<tr>');
        htp.p('<td align="left" colspan="4">');
        htp.p('Material Cost:&nbsp;<input type="text" align="right" style="background-color:#DCDCDC; font-size:12px" name="mc" onFocus="blur()" size="6" maxlength="4" />&nbsp;&nbsp;');
        htp.p('Shipping Cost:&nbsp;<input type="text" align="right" onChange="printf(this)" style="font-size:12px" name="sc" size="6" maxlength="4" value="0" />&nbsp;&nbsp;');
        htp.p('Total Cost:&nbsp;<input type="text" align="right" style="background-color:#DCDCDC; font-size:12px" name="tc" onFocus="blur()" size="6" maxlength="4" /></td>');
        htp.p('</td>');
        htp.p('</tr>');

        htp.p('<tr>');
        htp.p('<td align="right">AIC:</td>');
        htp.p('<td colspan="3"><select name="ac" onChange="printf()">');
        for curAIC in (select  aic_code "VALUE",aic_code||'-'||aic_title "TEXT"
         from em_aic_t where aic_flag = 'A') loop
           htp.p('<option value="'||curAIC.value||'">'||curAIC.text||'</option>');
        end loop;
        htp.p('<option selected value=""></option>');
        htp.p('</select></td>');
        htp.p('</tr>');

        htp.p('</table>');
      htp.p('</td>');

      htp.p('</tr>');
      htp.p('</table>');

      htp.p('</fieldset>');
      htp.htmlClose;

   end div7381;

   procedure getAutoList(pSiteID in em_site_t.site_id%type) is

      type csr_ref_cursor is ref cursor;
      csr_ref          csr_ref_cursor;
      csr_data_ref     csr_ref_cursor;
      r_grid_data      sg_widget_grid_t%rowtype;
      row_count        number:=0;
      v_sql            varchar2(4000);
      v_sqlstm         varchar2(4000) default null;
      v_valuerow       varchar2(4000);
      v_site_id        em_site_t.site_id%type;
      v_siteid_param   varchar2(100) default null;
      v_nsn_param      varchar2(100) default null;
      v_nom_param      varchar2(100) default null;
      v_loc_param      varchar2(100) default null;
      v_oem_param      varchar2(100) default null;
      v_shippingcost   em_local_order_header_t.shipment_cost%type;
      v_totalcost      number;

      -- Dynamic sql related variables
      csr_handle       integer;
      n_return         integer;
      vFlags           varchar2(255) := 'rowselection,resizecolumns,autoresizecols,useattributes,resizerows,rownumbers,rowlines,collines,rowheader,colheader,vscroll,threedborder,sortrowheaders';
      vBGColor         varchar2(10) := 'BLUE';

      vXMLStr          varchar2(4000);

      cursor curAutoList is
         select
           a.order_ptr,
           to_char(a.order_date, 'MM/DD/YYYY') order_date,
           to_char(a.required_date, 'MM/DD/YYYY') required_date,
           a.nsn,
           replace(a.nom, '&', '&amp;') nom,
           a.uoi_code,
           a.vc_id,
           a.qty_ordered qty,
           a.order_no,
           a.aic_code,
           c.facility_name,
           c.zipcode,
           b.min_code,
           b.vc_name,
           d.finance_no,
           a.unit_cost,
           a.order_status_code,
           a.qty_ordered * a.unit_cost total_cost
        from
           em_order_t a,
           em_vendor_contrctr_t b,
           em_subsite_facility_t c,
           em_site_t d
        where
           a.site_id = b.site_id (+)
           and a.vc_id  = b.vc_id (+)
           and a.site_id = c.site_id
           and a.site_id = d.site_id
           and c.site_id = pSiteID
           and a.site_id = pSiteID
           and c.subsite_default_yn = 'Y'
           and a.module_id = 'AUTOLOCAL'
           and a.source_code in ('B','L')
           and a.order_filled_flag = 'N'
           and a.order_status_code in ('P', 'A');

      bFoundMatch boolean := false;
      vShipmentCost     em_local_order_header_t.shipment_cost%type;
      vAC               em_order_t.aic_code%type;
      vMC               number;
      vST               em_order_t.order_status_code%type;
   begin
      htp.htmlOpen;
      htp.p('<body scroll="no" bgcolor="silver" onLoad="start()">');
      htp.TableOpen(cAttributes=>'class="tablerow" border="1" bgcolor="white" width="100%" cellspacing="1" style="font-face:arial; font-weight:normal"');
      for recAutoList in curAutoList loop

          bFoundMatch := false;

          begin
            select
               shipment_cost
            into
               v_ShippingCost
            from
               em_local_order_header_t
            where
               site_id = pSiteId
               and order_no = recAutoList.order_no;
         exception
            when others then
               v_ShippingCost := 0;
         end;

         v_totalcost := v_totalcost + v_ShippingCost;
         htp.TableRowOpen;
            htp.TableData(row_count + 1||'.', cAttributes=>'width="20"');
            htp.TableData(nvl(recAutoList.nsn, '-'), cAttributes=>'width="130"');
            htp.TableData(nvl(recAutoList.nom,'-'), cAttributes=>'width="180"');
            htp.TableData('<input name="quantity" onBlur="valq(this,'''||row_count||''')" type="text" size="4" maxlength="4" value="'||recAutoList.qty||'">', cAttributes=>'width="40"');
            htp.TableData('<input name="unit_c" onBlur="valq(this,'''||row_count||''')" type="text" size="4" maxlength="4" value="'||recAutoList.unit_cost||'">', cAttributes=>'width="40"');
            htp.TableData('<input name="tcost" onFocus="blur()" type="text" style="background-color:#dcdcdc; disabled:disabled" size="4" maxlength="4" value="'||recAutoList.total_cost||'">', cAttributes=>'width="40"');
            htp.p('<td colspan="3"><select name="v" onChange="clickv(this)">');

            --if row_count = 0 then
              for curVendors in (select vc_id, replace(vc_name, '&', '&amp;') vc_name from em_vendor_contrctr_t where site_id = pSiteID) loop
                 if recAutoList.vc_id = curVendors.vc_id then
                    bFoundMatch := true;
                    htp.p('<option selected value="'||curVendors.vc_id||'">'||curVendors.vc_name||'</option>');
                 else
                    htp.p('<option value="'||curVendors.vc_id||'">'||curVendors.vc_name||'</option>');
                 end if;
              end loop;
            --end if;
            if bFoundMatch = true then
               htp.p('<option value=""></option>');
            else
               htp.p('<option selected value=""></option>');
            end if;
            htp.p('</select><input type="hidden" name="po" value="'||recAutoList.order_ptr||'" /></td>');
         htp.TableRowClose;
         row_count := row_count + 1;
      end loop;
      htp.TableClose;
      htp.p('<input type="hidden" name="rowcount" value="'||row_count||'" />');

      htp.p('<xml id="vclist"><vc>');
      for curVendors in (select vc_id, replace(vc_name, '&', '&amp;') vc_name from em_vendor_contrctr_t where site_id = pSiteID) loop

          begin
          select distinct
             shipment_cost
          into
             vShipmentCost
          from
             em_local_order_header_t
          where site_id = pSiteID
          and order_no in (
             select
                order_no
             from
                em_order_t
             where
                 site_id = pSiteID
                 and module_id = 'AUTOLOCAL'
                 and order_Status_code in ('P', 'A')
                 and order_filled_flag = 'N'
                 and vc_id = curVendors.vc_id);

           select
              aic_code,
              order_status_code,
              sum(qty_ordered * unit_cost)
           into
              vAC,
              vST,
              vMC
           from
              em_order_t
           where
              site_id = pSiteID
              and module_id = 'AUTOLOCAL'
              and order_Status_code in ('P', 'A')
              and order_filled_flag = 'N'
              and vc_id = curVendors.vc_id
           group by
              aic_code,
              order_status_code;

           exception
              when others then null;
           end;

         htp.p('<v mc="'||vMC||'" st="'||vST||'" ac="'||vAC||'" vid="'||curVendors.vc_id||'" sc="'||vShipmentCost||'">'||curVendors.vc_id||'</v>');
      end loop;
      htp.p('<s>'||pSiteID||'</s>');
      htp.p('</vc></xml>');

      htp.p('<script language="javascript" />');
      htp.p(' function start() { ');
      htp.p(' }');

      htp.p('</script>');
      htp.p('</body>');

      htp.htmlClose;
   end getAutoList;

   procedure getApprovalList(pSiteID in em_site_t.site_id%type) is
    type csr_ref_cursor is ref cursor;
      csr_ref          csr_ref_cursor;
      csr_data_ref     csr_ref_cursor;
      r_grid_data      sg_widget_grid_t%rowtype;
      row_count        number:=0;
      v_sql            varchar2(4000);
      v_sqlstm         varchar2(4000) default null;
      v_valuerow       varchar2(4000);
      v_site_id        em_site_t.site_id%type;
      v_siteid_param   varchar2(100) default null;
      v_nsn_param      varchar2(100) default null;
      v_nom_param      varchar2(100) default null;
      v_loc_param      varchar2(100) default null;
      v_oem_param      varchar2(100) default null;
      n_over_roq_ind   number;

      -- Dynamic sql related variables
      csr_handle       integer;
      n_return         integer;
      vFlags           varchar2(255) := 'rowselection,resizecolumns,autoresizecols,useattributes,resizerows,rownumbers,rowlines,collines,rowheader,colheader,vscroll,threedborder,sortrowheaders';
      vBGColor         varchar2(10) := 'BLUE';
   begin
      htp.p('<font face="arial" size="2">The following purchase requests are awaiting approval or cancellation.</font><br><br>');
      vm_utility_pkg.startGrid(pGridName=>'gridapprove',pHeight=>'175',pWidth=>'760');
      htp.p('<param name="numcols" value="7"/>');
      htp.p('<param name="colheadertext" value="Order No,PO Number,Vendor,Status,Order Date,Requestor,ROQ Ind"/>');
      htp.p('<param name="colwidths" value="90,90,280,45,67,80,50"/>');
      htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
      htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
      htp.p('<param name="clickfunction" value="approvalClick" />');

      v_sql := 'select distinct order_no||'',''||po_num||'',''||em_replace_chars(VC_NAME)||'',''||order_status_code||'',''||'||
      'to_char(a.order_date, ''MM/DD/YYYY'')||'',''||em_replace_chars(order_for_emp_id)||'',''||decode(max(over_roq_ind),1,''Y'',''N'') '
             ||'from em_order_t a, em_vendor_contrctr_t b '
             ||' where a.site_id = :site'
             ||' and b.site_id(+) = :site'
             ||' and a.vc_id = b.vc_id(+) '
             ||' and order_type_code = ''L'''
             ||' and order_status_code in (''P'',''A'')'
             ||' and order_filled_flag =''N'''
             ||' and (((module_id=''AUTOLOCAL'') and original_order_no is not null) OR (module_id=''LOCAL'')) '
             ||' group by  order_no,po_num,VC_NAME,order_status_code,order_date,order_for_emp_id order by 1 ';

      open csr_data_ref for v_sql using pSiteID, pSiteID;
      loop
         fetch csr_data_ref into v_valuerow;
         exit when csr_data_ref%notfound;
         row_count:=row_count+1;
         htp.p('<param name="row'||row_count||'text" value="'||v_valuerow||'"/>');
         if vBGColor = 'WHITE' then vBGColor:='C6EFF7'; else vBGColor :='WHITE'; end if;
         htp.p('<param name=row'||row_count||'attributes value="arial,null,10,NULL,'||vBGColor||',LEFT">');
      end loop;

      --We want at least a certain number of rows to show
      if row_count < r_grid_data.min_rows then
         row_count:=r_grid_data.min_rows;
      end if;

      htp.p('<param name ="numrows" value ="'||to_char(row_count)||'"/>');
      vm_utility_pkg.endGrid;
      htp.p('<div class="captionmsmall">'||row_count||' purchase requests found.</div>');
   end;


   procedure purchaseParts(pSiteId  in  em_site_t.site_id%type,
                           pOrderPtr    in  varchar2) is
      cursor curOrders is
         select
            nsn,
            nom,
            uoi_code,
            qty_ordered,
            to_char(unit_cost, '$999,999.99') unit_cost,
            to_char(qty_ordered * unit_cost, '$999,999.99') total_cost
         from
            em_order_t
         where
            site_id = pSiteID
            and order_no = pOrderPtr;
/*
            in
               (select po_num
                from em_order_t
                where site_id = pSiteID and order_ptr = pOrderPtr);
                */
       row_count        number:=0;
      v_sql            varchar2(4000);
      v_sqlstm         varchar2(4000) default null;
      v_valuerow       varchar2(4000);
      v_site_id        em_site_t.site_id%type;
      v_siteid_param   varchar2(100) default null;
      v_nsn_param      varchar2(100) default null;
      v_nom_param      varchar2(100) default null;
      v_loc_param      varchar2(100) default null;
      v_oem_param      varchar2(100) default null;

      -- Dynamic sql related variables
      csr_handle       integer;
      n_return         integer;
      vFlags           varchar2(255) := 'rowselection,resizecolumns,autoresizecols,useattributes,resizerows,rownumbers,rowlines,collines,rowheader,colheader,vscroll,threedborder,sortrowheaders';
      vBGColor         varchar2(10) := 'BLUE';
   begin
      htp.TableOpen(cAttributes=>'bgcolor="WHITE, size="100%" cellpadding="0" callspacing="1" border="0"');
      htp.TableHeader(cValue=>'NSN', cAttributes=>'align="left" width="23%"');
      htp.TableHeader(cValue=>'Nomenclature', cAttributes=>'align="left" width="30%"');
      htp.TableHeader(cValue=>'UOI', cAttributes=>'align="center" width="10%"');
      htp.TableHeader(cValue=>'Qty', cAttributes=>'align="right" width="10%"');
      htp.TableHeader(cValue=>'Unit $', cAttributes=>'align="right" width="15%"');
      htp.TableHeader(cValue=>'Total $', cAttributes=>'align="right" width="20%"');
      for recOrders in curOrders loop
         if vBGColor='WHITE' then vBGColor:='#DCDCDC'; else vBGColor:='WHITE'; end if;
         htp.TableRowOpen(cAttributes=>'bgcolor="'||vBGColor||'"');
            htp.TableData(nvl(recOrders.NSN, '-'), cAttributes=>'class="captionmsmall" width="20%"');
            htp.TableData(recOrders.nom, cAttributes=>'class="captionmsmall" width="30%"');
            htp.TableData(recOrders.uoi_code, cAttributes=>'class="captionmsmall" align="center" width="10%"');
            htp.TableData(recOrders.qty_ordered, cAttributes=>'class="captionmsmall" align="right" width="10%"');
            htp.TableData(recOrders.unit_cost, cAttributes=>'class="captionmsmall" align="right" width="15%"');
            htp.TableData(recOrders.total_cost, cAttributes=>'class="captionmsmall" align="right" width="20%"');
         htp.TableRowClose;
      end loop;
      htp.TableClose;
   end;

-- cancel scan orders
    procedure em_cancelscanorders(pRowID in varchar2 default null, puser number default 0)
    is
     cursor csr_getorderdetail  is
     select nsn,QTY_ORDERED,site_id,order_type_code,order_ptr
     from em_order_t where
     rowid = EM_ROWID_DEC(prowid);
     l_csr_getorderdetail csr_getorderdetail%rowtype;

     begin
       open csr_getorderdetail;
       fetch csr_getorderdetail into l_csr_getorderdetail;
       close csr_getorderdetail;
       -- update catalog due in.  9/13/2004 RSD added GREATEST funtion to keep Due in 0 or >
      update em_catalog_t
         set no_parts_due= GREATEST(no_parts_due - l_csr_getorderdetail.QTY_ORDERED,0)
         where site_id = l_csr_getorderdetail.site_id
         and nsn = l_csr_getorderdetail.nsn and room_id='A';

     update em_order_t
     set ORDER_FILLED_FLAG = 'Y',
         ORDER_STATUS_CODE = 'VC1',
         mod_date=sysdate,
         mod_user=puser
     where rowid = EM_ROWID_DEC(pRowid);

-- Balance Transfer Order Canceled
       if l_csr_getorderdetail.order_type_code = 'B' then
         update em_order_transfers_t
            set ORDER_CANCELED_FLAG = 'Y',
                mod_date=sysdate,
                mod_user=puser
          where transfer_site_id = l_csr_getorderdetail.site_id
            and order_ptr = l_csr_getorderdetail.order_ptr;
       end if;

     commit;
     exception
       when others  then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
    end;



-- delete orders. Thsi procedure is called fromthe review pending screen
--
    procedure em_delete(pRowID in varchar2 default null)
    is
     cursor csr_getorderdetail  is
     select nsn,QTY_ORDERED,site_id
     from emdba.em_order_t where
     rowid = EM_ROWID_DEC(prowid);
     l_csr_getorderdetail csr_getorderdetail%rowtype;


     begin
  -- UN commented per Lloyd Bell 9/2004 after being comment per KC sometime last winter
       open csr_getorderdetail;
       fetch csr_getorderdetail into l_csr_getorderdetail;
       close csr_getorderdetail;
       -- update catalog due in.
      update emdba.em_catalog_t
         set no_parts_due= GREATEST(no_parts_due - l_csr_getorderdetail.QTY_ORDERED,0)
         where site_id = l_csr_getorderdetail.site_id
         and nsn = l_csr_getorderdetail.nsn and room_id='A';

      delete from emdba.em_order_t where rowid = EM_ROWID_DEC(pRowid);
      commit;
     exception
       when others  then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
    end;

-- release pening orders . Release screen where source code !=L.REVIEW/RELEASE/CANCEL PENDING ORDERS
    procedure em_release(pRowID in varchar2 default null)
    is
     cursor csr_getorderdetail  is
     select nsn,QTY_ORDERED,site_id
     from em_order_t where
     rowid = EM_ROWID_DEC(prowid);
     l_csr_getorderdetail csr_getorderdetail%rowtype;


     begin
   /*    open csr_getorderdetail;
       fetch csr_getorderdetail into l_csr_getorderdetail;
       close csr_getorderdetail;
       -- update catalog due in.
  */
     -- 9/2004 RSD Kathy Carrico wanted due in to not be incremented if orders wee pending so a check was
     -- added per her direction to not increment due ins for pending. However since Due in is show and used
     -- by the software and users to know if parts should be ordered and since pending orders show up on the
     -- local orders report per Lloyd Bell on 9/21/2004 RSD is changing it back to incremnet due in when an
     -- order is created.  SO this commented out by RSD 9/2004 because the duein was increased when the order
     -- was created but I added the ROOM_ID='A'
     /*  update em_catalog_t
         set no_parts_due= no_parts_due + l_csr_getorderdetail.QTY_ORDERED
         where site_id = l_csr_getorderdetail.site_id
         and nsn = l_csr_getorderdetail.nsn and room_id='A';
     */
      update em_order_t set pending_flag = 'N',
      order_status_code = 'N',
      order_status_desc = 'RELEASED FROM PENDING ON '||trunc(sysdate)
      where rowid = EM_ROWID_DEC(pRowid);
      commit;
     exception
       when others  then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
    end;
-- change status of orders
   procedure em_change_status_prc(pSiteID   in em_site_t.site_id%type default null,
                                  pOrderID  in em_order_t.order_no%type,
                                  pStatus   in varchar2 default null,
                                  pReqNO    in varchar2 default null)
   is
     cursor csr_getorderdetail  is
      select nsn,QTY_ORDERED
      from em_order_t where
      site_id  = pSiteID
      and order_no = pOrderID;

   begin
    if pReqNO is not null then
      update em_order_t
      set order_status_code = pStatus,
      order_filled_flag=decode(pStatus,'C','Y',order_filled_flag),
      po_num = UPPER(pReqNo)
      where site_id = pSiteID and order_no = pOrderID;
    else
      update em_order_t
      set order_status_code = pStatus,
      order_filled_flag=decode(pStatus,'C','Y',order_filled_flag)
      where site_id = pSiteID and order_no = pOrderID
      ;
    end if;
    -- 9/2004 RSD Kathy Carrico wanted due in to not be incremented if orders wee pending so a check was
     -- added per her direction to not increment due ins for pending. However since Due in is show and used
     -- by the software and users to know if parts should be ordered and since pending orders show up on the
     -- local orders report per Lloyd Bell on 9/21/2004 RSD is changing it back to incremnet due in when an
     -- order is created.  SO this was changed by RSD 9/2004 because the duein was increased when the order
     -- was created so now it check if its Canceled and I added the ROOM_ID='A'
    if pStatus='C' then
       FOR X in csr_getorderdetail LOOP
         update em_catalog_t
         set no_parts_due= greatest(no_parts_due-x.QTY_ORDERED,0)
         where site_id = pSiteID
         and nsn = x.nsn and room_id='A' ;
       END LOOP;
    end if;

    commit;
   end;

-- Display requisition number field
procedure checkreq_prc(pSiteID in em_site_t.site_id%type default null)
is
  l_req varchar2(1) :='Y';
  cursor csr_chkreq is
  select USE_DEFAULT_REQ
  from em_local_order_approver_t
  where site_id =pSiteID;
begin
  open  csr_chkreq;
  fetch csr_chkreq into l_req;
  close csr_chkreq;

  htp.p('<?xml version="1.0" ?>');
  htp.p('<REQCHK>'||l_req||'</REQCHK>');
exception
    when others then
     htp.p('<?xml version="1.0" ?>');
     htp.p('<REQCHK>-1</REQCHK>');
end;
--Robbie Added check for over ROQ pending here as well to here as well
procedure em_check_auto_prc(pSiteID in em_site_t.site_id%type)
 is
l_cycle           number := 0;
l_roq             number:=0;
l_part_count      number:=0;
l_auto_run        varchar2(1):='N';
l_auto_run_espin  varchar2(1):='N';
l_espin_active    varchar2(1):='N';
l_transfer_run    varchar2(1):='N';

CURSOR csr_dataentry is
    select 1
    from em_catalog_t
    where site_id = pSiteID
    and reord_flag = 'N'
    and status_flag = 'Y'
    and NO_PARTS_DUE = 0 -- added per Lyod 10/2/2003   ---GSM readded per site issue
    and source_code not in ('R','1','A','X','M') -- Tehseen 3/8/2004. Added per Donna CAT 2M6
    and room_id = 'A' -- AUTO REPLENISH "A" PARTS ONLY - ADDED BY TA SEPT 12, 203.
    and boh <= rop ;

begin
   --Check to see if site is using ESPIN for Auto replenish
   select espin_active
     into l_espin_active
     from em_site_t
    where site_id = pSiteID;

   --Check to see if site has any items to transfer.
   select decode(count(1),0,'N','Y')
     into l_transfer_run
     from em_order_transfers_t
    where site_id = pSiteID
      and transfer_filled_flag = 'N'
      and order_canceled_flag = 'N'    ;

   --Check to see Auto Replenish has been run today for espin sites.
   select decode(count(1),0,'N','Y')
     into l_auto_run_espin
     from em_site_t
    where auto_replenish_date > trunc(sysdate)+6/24
      and site_id = pSiteID;

   --Check to see Auto Replenish has been run today.
   select decode(trunc(AUTO_REPLENISH_DATE),trunc(sysdate),'Y','N')
     into l_auto_run
     from em_site_t
    where site_id = pSiteID;

   --Get the AUTO_REPLENISH_DATE so we can do the 72 hour check
   select trunc(sysdate-AUTO_REPLENISH_DATE)*24 into l_cycle from em_site_t where site_id = pSiteID;
   --Make sure there are parts to Replenish
   if l_cycle>72 then
     open csr_dataentry;
     fetch csr_dataentry into l_part_count;
     close csr_dataentry;
     l_cycle:=l_cycle*(nvl(l_part_count,0));
   end if;

   begin
    select max(nvl(over_roq_ind,0)) into l_roq from em_order_t where site_id=psiteid and
     pending_flag='Y' and order_filled_flag='N' and order_status_code in ('N','P');
   exception
     when others then
      l_roq:=0;
   end;

  htp.p('<?xml version="1.0"?>');
  htp.p('<ROW>');
  htp.p('<AUTOREP>'||l_cycle||'</AUTOREP>');
  htp.p('<ROQ>'||l_roq||'</ROQ>');
-- espin check to see if active site
  htp.p('<ESPIN_ACTIVE>'||l_espin_active||'</ESPIN_ACTIVE>');
  htp.p('<AUTO_RUN>'||l_auto_run||'</AUTO_RUN>');
  htp.p('<TRANSFER_RUN>'||l_transfer_run||'</TRANSFER_RUN>');
  htp.p('<AUTO_RUN_ESPIN>'||l_auto_run_espin||'</AUTO_RUN_ESPIN>');
  htp.p('</ROW>');

exception
   when others then
      htp.p('<xml version="1.0"?>');
      htp.p('<ROW>');
      htp.p('<AUTOREP>-1</AUTOREP>');
      htp.p('<ROQ>0</ROQ>');
    -- espin check to see if active site
      htp.p('<ESPIN_ACTIVE>Y</ESPIN_ACTIVE>');
      htp.p('<AUTO_RUN>N</AUTO_RUN>');
      htp.p('<TRANSFER_RUN>N</TRANSFER_RUN>');
      htp.p('<AUTO_RUN_ESPIN>Y</AUTO_RUN_ESPIN>');
      htp.p('</ROW>');
end;

procedure em_check_bu(pSiteID in em_site_t.site_id%type,pNSN in em_catalog_t.nsn%type,pUOICode in em_catalog_t.uoi_code%type )
is
cursor csr_uoi is
select uoi_code,bulkpack,bulk_unit
from em_catalog_t where site_id =pSiteID and nsn=pNSN and uoi_code=pUOICode and uoi_code!=bulk_unit;
l_f varchar2(1) := 'N';
l_csr_uoi csr_uoi%rowtype;

begin
  open csr_uoi;
  fetch csr_uoi into l_csr_uoi;
  if csr_uoi%found then
    l_f:='Y';
  end if;
  close csr_uoi;

  htp.p('<?xml version="1.0"?>');
  htp.p('<UOI found="'||l_f||'" bulkpack="'||l_csr_uoi.bulkpack||'" bulkunit="'||l_csr_uoi.bulk_unit||'"></UOI>');
 exception
   when others then
     htp.p('<xml version="1.0"?>');
     htp.p('<UOI>-1</UOI>');

end;

-- procedure to check if the requisition numberis unique.
   procedure em_checkreq_prc(pSiteID in em_site_t.site_id%type, pLocReqNo in varchar2 default null) is
   cursor csr_reqno is
   select order_no,po_num from em_order_t
   where site_id = pSiteID and upper(po_num) = UPPER(pLocReqNo);

   l_cnt number :=0;
   l_csr_reqno  csr_reqno%rowtype;

   begin
     open csr_reqno;
     fetch csr_reqno into l_csr_reqno;
     if csr_reqno%found then
       l_cnt:=99;
     end if;
     close csr_reqno;
     htp.p('<?xml version="1.0"?>');
     htp.p('<REQEXIST>'||l_cnt||'</REQEXIST>');
     exception
       when others then
        htp.p('<?xml version="1.0"?>');
        htp.p('<REQEXIST>0</REQEXIST>');
   end;


-- Builds a search dialog for printing historical 7381
    procedure em_getlocalhist(pSiteID in em_site_t.site_id%type) is
       type woRefCurType is ref cursor;
       woRefCur woRefCurType;
       vThisRow   number default 0;
       vNumRows   number default 0;
       type woRecType is record (
             po_num             em_order_t.po_num%type,
             order_no           em_order_t.order_no%type,
             vendor             em_vendor_contrctr_t.vc_name%type,
             order_status_code  em_order_t.order_status_code%type,
             order_date        em_order_t.order_date%type,
             order_for_emp_id   em_order_t.order_for_emp_id%type
                  );
       recWOType woRecType;
       vSQL  varchar2(500);
       vBGColor varchar2(12) := 'WHITE';
    begin
          htp.p('<body scroll="no" bgcolor="silver">');
          htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
          htp.p('<script language="javascript">');
          htp.p('window.status="Ready to begin order search."');
          htp.p('function clickFunction(col,row) { ');
          htp.p('   var srow=document.all.wonogrid.getSelRow();');
          htp.p('   if (srow==0) { return } ');
          htp.p('   var vptr=document.all.wonogrid.getCellText(2, srow);');
          htp.p('opener.golocalhistLocal(vptr);');
          htp.p('}');
          htp.p('</script>');
          htp.p('</body>');
          vSQL :='select distinct nvl(po_num,''0''),order_no,nvl(vc_name,''-''),nvl(order_status_code,''0''),trunc(a.order_date) order_date ,nvl(order_for_emp_id,''0'') '||
              ' from em_order_t a, em_vendor_contrctr_t b'||
              ' where a.site_id = :1 '||--pSiteID||
              '  and b.site_id(+) = :2 '||--pSiteID||
              ' and a.vc_id = b.vc_id(+) '||
              ' and order_type_code = ''L'' '||
              ' and a.module_id != ''AUTOLOCAL''' ||
              ' and  order_date > sysdate-90 '||
              ' order by order_date desc, order_no';
          open woRefCur for vSQL using pSiteID,pSiteID;
          vm_utility_pkg.startGrid('wonogrid');
          htp.p('<param name="numcols" value="6"/>');
          htp.p('<param name="colheadertext" value="PO Number,Control Number,Vendor,Status,Order Date,Requestor"/>');
          htp.p('<param name="colwidths" value="60,60,100,40,50,50"/>');
          htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
          htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
          htp.p('<param name="cellsreleasedfunction" value="selRow" />');
          htp.p('<param name="urlframe" value="dummyframe">');
          htp.p('<param name="clickFunction" value="clickFunction" />');
          loop
             fetch woRefCur into recWOType;
             exit when woRefCur%notfound;
             vThisRow := vNumRows + 1;
             htp.p('<param name="row'||vThisRow||'text" value="');
             htp.p(recWOType.po_num||','||recWOType.order_no||','||recWOType.vendor||','||recWOType.order_status_code||','||TO_CHAR(recWOType.order_date,'MM/DD/YYYY')||','||recWOType.order_for_emp_id||'"></param>');
             vNumRows := vNumRows + 1;
          end loop;
          htp.p('<param name="numrows" value="'||vNumRows||'" />');
          htp.p('</div>');
          vTotalRowCount := vNumRows;
          htp.BodyClose;
     exception
      when others then
        em_error_pkg.em_ErrorInsert_prc;
        raise;
     end ;


-- Builds a search dialog for autoreplenish historical print
    procedure em_getlocalAutoHist(pSiteID in em_site_t.site_id%type,
    p_order_no in varchar2 default null
) is

       type nsnRefCurType is ref cursor;
       nsnRefCur nsnRefCurType;
       vThisRow   number default 0;
       vNumRows   number default 0;
       type nsnRecType is record (
             po_num             em_order_t.po_num%type,
             order_no           em_order_t.order_no%type,
             vendor             em_vendor_contrctr_t.vc_name%type,
             order_status_code  em_order_t.order_status_code%type,
             order_date        em_order_t.order_date%type,
             order_for_emp_id   em_order_t.order_for_emp_id%type
                  );
       recNSNType nsnRecType;
       vSQL  varchar2(2000);
       vBGColor varchar2(12) := 'WHITE';
    begin
          htp.p('<body scroll="no" bgcolor="silver">');
          htp.p('<style>.captionMsmall { font-family: arial; font-weight: normal; font-size: 12; }</style>');
          htp.p('<script language="javascript">');
          htp.p('window.status="Ready to begin order search."');
          htp.p('function clickFunction(col,row) { ');
          htp.p('   var srow=document.all.wonogrid.getSelRow();');
          htp.p('   if (srow==0) { return } ');
          htp.p('   var vptr=document.all.wonogrid.getCellText(2, srow);');
          htp.p('   var vcid=document.all.wonogrid.getCellText(7, srow);');
          htp.p('opener.golocalhistAuto(vptr);');
          htp.p('}');
          htp.p('</script>');
          htp.p('</body>');
          -- the add to the grid.
          vSQL :='select distinct nvl(po_num,''0''),order_no,nvl(vc_name,''-''),nvl(order_status_code,''0''),trunc(a.order_date) order_date,nvl(order_for_emp_id,''0'') '||
              ' from em_order_t a, em_vendor_contrctr_t b'||
              ' where a.site_id = :1 '||--pSiteID||
              '  and b.site_id(+) = :2 '||--pSiteID||
              '  and a.vc_id = b.vc_id(+) '||
              ' and order_type_code = ''L'' '||
              ' and a.module_id = ''AUTOLOCAL''' ||
              ' and a.source_code in (''B'',''L'') '||
              ' and order_date > sysdate-90 '||
--              ' and original_order_no is null '||
              '  order by order_date desc, order_no';
          open nsnRefCur for vSQL using pSiteID,pSiteID ;
          vm_utility_pkg.startGrid('wonogrid');
          htp.p('<param name="numcols" value="6"/>');
          htp.p('<param name="colheadertext" value="PO Number,Control Number,Vendor,Status,Order Date,Requestor"/>');
          htp.p('<param name="colwidths" value="60,60,100,40,50,50"/>');
          htp.p('<param name="sortcolumns" value="1,2,3,4,5,6"/>');
          htp.p('<param name="sortcolumncolor" value="FFFFC6" />');
          htp.p('<param name="cellsreleasedfunction" value="selRow" />');
          htp.p('<param name="urlframe" value="dummyframe">');
          htp.p('<param name="clickFunction" value="clickFunction" />');
          loop
             fetch nsnRefCur into recNSNType;
             exit when nsnRefCur%notfound;
             vThisRow := vNumRows + 1;
             htp.p('<param name="row'||vThisRow||'text" value="');
             htp.p(recNSNType.po_num||','||recNSNType.order_no||','||recNSNType.vendor||','||recNSNType.order_status_code||','||TO_CHAR(recNSNType.order_date,'MM/DD/YYYY')||','||recNSNType.order_for_emp_id||'"></param>');
             vNumRows := vNumRows + 1;
          end loop;
          htp.p('<param name="numrows" value="'||vNumRows||'" />');
          htp.p('</div>');
          vTotalRowCount := vNumRows;
          htp.BodyClose;
     end ;

-------------------------------------------------
PROCEDURE em_XMLUser_EAS (pSiteID IN emdba.em_site_t.site_id%TYPE) IS
  CURSOR users IS
      SELECT TRIM(a.Last_name)||', '||TRIM(a.middle_name)|| '. ' ||TRIM(a.First_name) "VALUE",
           TRIM(a.Last_name)||', '||TRIM(a.middle_name )   || '. ' ||TRIM(a.First_name)|| ' - '||a.email_address "TEXT"
       FROM emdba.em_user_t a
       WHERE a.site_id = pSiteID
       AND a.active_flag = 'A'
       AND a.eas_roq='Y'
       ORDER BY a.last_name,a.middle_name, a.first_name;

BEGIN
    htp.p('<?xml version="1.0"?>');
    htp.p('<ROWSET>');
    FOR cusers IN users LOOP
        htp.p('<ROW>');
        htp.p('<VALUE>'||cUsers.VALUE||'</VALUE>');
        htp.p('<TEXT>'||cUsers.TEXT||'</TEXT>');
        htp.p('</ROW>');
    END LOOP;
    htp.p('</ROWSET>');
EXCEPTION
    WHEN others THEN
        emapp.em_error_pkg.em_ErrorInsert_prc;
    RAISE;
END;

-------------------------------------------------
PROCEDURE check_user_eas_roq_rights(pSiteID IN emdba.em_site_t.site_id%TYPE,
                           p_user_id IN emdba.em_user_t.user_id%type)
IS
  l_eas_roq VARCHAR2 (1) :='N';
  CURSOR csr_chkeas_roq IS
      SELECT a.eas_roq
      FROM  emdba.em_user_t a
      WHERE a.site_id =pSiteID
      AND a.user_id=p_user_id;
BEGIN
    OPEN csr_chkeas_roq;
    FETCH csr_chkeas_roq INTO l_eas_roq;
    CLOSE csr_chkeas_roq;

    htp.p('<?xml version="1.0" ?>');
    htp.p('<EASROQCHK>'||l_eas_roq||'</EASROQCHK>');
EXCEPTION
    WHEN others THEN
        htp.p('<?xml version="1.0" ?>');
        htp.p('<EASROQCHK>-1</EASROQCHK>');
END;

-----------------------
PROCEDURE em_XML_EAS_Activated IS
    n VARCHAR2(1):='N';
BEGIN
    SELECT n INTO n FROM TABLE(emapp.em_order_eas_t_rt) WHERE n='Y';
    htp.p('<?xml version="1.0"?>');
    htp.p('<ROWSET>');
    htp.p('<ROW>');
    htp.p('<EASACTIVATED>'||n||'</EASACTIVATED>');
    htp.p('</ROW>');
    htp.p('</ROWSET>');
EXCEPTION
    WHEN others THEN
        emapp.em_error_pkg.em_ErrorInsert_prc;
    RAISE;
END;
-----------------------
FUNCTION EAS_Activated_fnc RETURN VARCHAR2 IS
    n VARCHAR2(1):='N';
BEGIN
   SELECT n INTO n FROM TABLE(emapp.em_order_eas_t_rt) WHERE n='Y'; -- to activated EAS make this 'Y'
   RETURN (n);
EXCEPTION
    WHEN others THEN
        em_error_pkg.em_ErrorInsert_prc;
    RAISE;
END;
------------------------



end; -- package body em_order_pkg
/
