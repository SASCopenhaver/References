create or replace package PACK_GEN authid definer
is
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
  -- Author  : SSURIKOV
  -- Created : 05/09/2005
  -- Purpose : New Architecture

  -- Public type declarations
  type refc_Base is REF CURSOR;

   -- Public variable declarations
  vCounter NUMERIC;

  -- Public function and procedure declarations
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
  procedure sp_getFILE (arg_USR_ROLE_ID IN NUMERIC,
                        spr_getFILE OUT refc_Base);
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
  procedure sp_getDataFrom_SITE_CODE_LK (arg_SITE_CODE_LK IN VARCHAR2,
                                         spr_getDataFrom_SITE_CODE_LK OUT refc_Base);                                                                 
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
  procedure sp_getObjctsAndObjctProperties (arg_SF_FILE_ID IN NUMERIC,
                                            arg_SCP_LANG IN VARCHAR2,
                                            spr_get_SITE_FILE_OBJCT OUT refc_Base,
                                            spr_get_SITE_OBJCT_CSS_PRPRTY OUT refc_Base,
                                            spr_get_SITE_NAVIGATION OUT refc_Base,
                                            spr_get_OBJCT_CTRL_and_DSC OUT refc_Base);
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
  procedure sp_authenticateUSR (arg_USR_USR_NM IN VARCHAR2,
                                arg_USR_PASS IN VARCHAR2,
                                spr_authenticateUSR OUT refc_Base);
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

  --function <FunctionName>(<Parameter> <Datatype>) return <Datatype>;
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
END PACK_GEN;
/
create or replace package body PACK_GEN
is
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
  -- Author  : SSURIKOV
  -- Created : 10/09/2006 
  -- Purpose : New Architecture
  -- Public variable declarations

  --vCounter NUMERIC;
-- Public function and procedure declarations

--==================================================================
--==================================================================
 procedure sp_getFILE (arg_USR_ROLE_ID IN NUMERIC,
                       spr_getFILE OUT refc_Base)
is
Begin
     OPEN spr_getFILE FOR
     select sf_file_id, sf_file_nm, sf_file_dsc, sf_file_act_inact 
     from site_files     sf,  
          site_role      sr, 
          site_file_role sfr
     where     sf.sf_file_act_inact = 'A'
           and sfr.sfr_file_id = sf.sf_file_id
           and sr.sr_role_id = sfr.sfr_role_id
           and sr.sr_role_act_inact = 'A'
           and sr.sr_role_id = arg_USR_ROLE_ID;
 
End sp_getFILE;
--==================================================================
--==================================================================
  procedure sp_getDataFrom_SITE_CODE_LK (arg_SITE_CODE_LK IN VARCHAR2,
                                         spr_getDataFrom_SITE_CODE_LK OUT refc_Base)
is
Begin
     OPEN spr_getDataFrom_SITE_CODE_LK FOR
     select t.cl_item_nm, t.cl_item_cd, t.cl_item_desc, t.cl_item_comments
     from site_code_lk t
     where t.cl_item_nm = arg_SITE_CODE_LK;
  
End sp_getDataFrom_SITE_CODE_LK;
--==================================================================
--==================================================================
  procedure sp_getObjctsAndObjctProperties (arg_SF_FILE_ID IN NUMERIC,
                                            arg_SCP_LANG IN VARCHAR2,
                                            --------------------------------------------------
                                            spr_get_SITE_FILE_OBJCT OUT refc_Base,        -- 1
                                            spr_get_SITE_OBJCT_CSS_PRPRTY OUT refc_Base,  -- 2
                                            spr_get_SITE_NAVIGATION OUT refc_Base,        -- 3
                                            spr_get_OBJCT_CTRL_and_DSC OUT refc_Base)     -- 4
is
Begin
     --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
     -- 1:
     OPEN spr_get_SITE_FILE_OBJCT FOR
     select sfo_objct_id, sfo_file_id, sfo_objct_nm, sfo_objct_super_id, sfo_act_inact
     from site_file_objct sfo
     where sfo.sfo_file_id = arg_SF_FILE_ID;
     --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
     -- 2:
     OPEN spr_get_SITE_OBJCT_CSS_PRPRTY FOR
     select sop_objct_id, sop_file_id, 
            'position: '||NVL(sop_position,'')||'; ' as sop_position, 
            'top: '||NVL(sop_top, '')||'; '          as sop_top, 
            'height: '||NVL(sop_height, '')||'; '    as sop_height, 
            'left: '||NVL(sop_left, '')||'; '        as sop_left,
            'right: '||NVL(sop_right, '')||'; '      as sop_right,
            'width: '||NVL(sop_width, '')||'; '      as sop_width,
            'margin: '||NVL(sop_margin, '')||'; '    as sop_margin,
            'padding: '||NVL(sop_padding, '')||'; '  as sop_padding,
            'z-index: '||NVL(sop_z_index, '')||'; '  as sop_z_index,
            'background: '||NVL(sop_background, '')||'; ' as sop_background,
            NVL(sop_addnl_prprty, '')                as sop_addnl_prprty
     from site_objct_css_prprty sop
     where sop.sop_file_id = arg_SF_FILE_ID;
     --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
     -- 3:
     OPEN spr_get_SITE_NAVIGATION FOR
     select  sn_file_id, sn.sn_nav_cd, sn.sn_nav_nm, sn.sn_nav_file_id
     from site_navigation sn
     where sn.sn_file_id = arg_SF_FILE_ID;
     --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
     -- 4
     OPEN spr_get_OBJCT_CTRL_and_DSC FOR
     select --- soc:
            soc_ctrl_id, soc_objct_id, soc_ctrl_nm, 
            NVL(soc_call_file_id,'') as soc_call_file_id,
            --- scd:
            scd_lang, scd_ctrl_label, 
            DECODE(scd_ctrl_label_comnt,
                                        null,'',
                                        '','',
                                        '('||scd_ctrl_label_comnt||')') as scd_ctrl_label_comnt, 
            scd_writing_from, scd_size
     from site_ctrl_dsc scd, site_objct_ctrl soc, site_file_objct sfo
     where scd.scd_ctrl_id = soc.soc_ctrl_id
           and
           soc.soc_objct_id = sfo.sfo_objct_id
           and
           sfo.sfo_file_id = arg_SF_FILE_ID
           and
           scd.scd_lang = arg_SCP_LANG;
     --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
         
End sp_getObjctsAndObjctProperties;
--==================================================================
--==================================================================
  procedure sp_authenticateUSR (arg_USR_USR_NM IN VARCHAR2,
                                arg_USR_PASS IN VARCHAR2,
                                spr_authenticateUSR OUT refc_Base)
is Begin

  OPEN spr_authenticateUSR FOR
  select usr_id, 
         usr_role_id, 
         usr_pfx, 
         usr_frst_nm, 
         usr_mi, 
         usr_last_nm, 
         usr_sfx, 
         usr_usr_nm, 
         usr_pass, 
         usr_act_inact 
  from usr
  where usr_usr_nm = arg_USR_USR_NM
        and 
        usr_pass = arg_USR_PASS;
                             
End sp_authenticateUSR;                               
--==================================================================
--==================================================================                               
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--

--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--




  --function <FunctionName>(<Parameter> <Datatype>) return <Datatype>;
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
END PACK_GEN;
/
