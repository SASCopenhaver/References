<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title><cfoutput>#client.PageName#</cfoutput></title>
<!--- STYLE SHEET .................................................... --->
	<link rel="stylesheet" href="Style/emx_nav_left.css" type="text/css">
<!--- GENERIC JavaScript FUNCTIONS ................................... --->
	<script src="JS/wddx.js" type="text/javascript"></script>
	<script src="JS/of_browserSelection.js" type="text/javascript"></script><script language="javascript" type="text/javascript">of_browserSelection();</script>
	<script src="JS/of_Style.js" type="text/javascript"></script>
	<script src="JS/of_innerHTML.js" type="text/javascript"></script>
	<script src="JS/of_Submit.js" type="text/javascript"></script>
	<script src="JS/of_populateSelect.js" type="text/javascript"></script>
	<script src="JS/of_selectedInDDLB.js" type="text/javascript"></script>
	
	<script src="JS/of_Mod.js" type="text/javascript"></script>
	
	<cfinclude template="JS/incJS_f_HideSubGlobalNavigation.cfm">
	<cfinclude template="JS/of_CallFile.cfm">
<!--- .................................................... --->
	<cfwddx action="wddx2cfml" input="#client.sprWDDX_getNavigation#" output="spr_getNavigation">
	<cfinclude template="JS/incJS_ArrayNavigation.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getListOfPrograms">
<cfinclude template="_ControllerDB.cfm">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getListOfPrograms#" output="spr_getListOfPrograms">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getListOfPlaceVisit#" output="spr_getListOfPlaceVisit">
<!--- .................................................... --->
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getCountry#" output="spr_getCountry">
<!--- .................................................... --->
	<cfinclude template="JS/of_msgWaitForLoad.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getCountryCityPost">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_CountryCityPost.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getPgmType">
<cfinclude template="_ControllerDB.cfm">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getPgmType#" output="spr_getPgmType">
<!--- .................................................... --->
<cfset client.ControllerDB = "getFieldOfStudy">
<cfinclude template="_ControllerDB.cfm">
<!--- .................................................... --->
<script language="javascript" type="text/javascript">
function of_pageHelp(argHelpItemId){with(self.document.forms[0])
{//alert(argHelpItemId)
	var popupPage = "popupCtrlHelp.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlHelpItemId="+argHelpItemId;
	//alert(argHelpItemId)
	var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=400,height=250','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
}}
</script>
<!--- <cfoutput>#client.CallPageID#</cfoutput><cfabort>
Using value of #client.CallPageID# determine presence of topics:
Advertisement; Feature; Story; Capsule Story;
 --->
<!--- <cfset client.ControllerDB = "getTopics">
<cfinclude template="_ControllerDB.cfm">
 --->

<script language="javascript" type="text/javascript">
//
//------------------------------------------------------------------------------------------------------

<cfwddx action="CFML2JS" input="#spr_getFieldOfStudy#" toplevelvariable="tlv_FS">
var rowsFS = tlv_FS.getRowCount();
function arrayFS(apgm_field_stdy_cd, apgm_field_stdy_nm)
{
	this.apgm_field_stdy_cd = apgm_field_stdy_cd; this.apgm_field_stdy_nm = apgm_field_stdy_nm;
}
//
orgBfrFS = new Array();
for (var fs=0; fs<rowsFS; fs++)
{
	orgBfrFS[fs] = new arrayFS (
								tlv_FS.pgm_field_stdy_cd[fs],
								tlv_FS.pgm_field_stdy_nm[fs]
								)
}
//
//-----------------------------------------------------------------------------------------------------

<cfwddx action="CFML2JS" input="#spr_getPgmType#" toplevelvariable="tlv_PT">
var rowsPT = tlv_PT.getRowCount();
function arrayPT(apgm_type_crnt_cd, apgm_type_nm)
{
	this.apgm_type_crnt_cd = apgm_type_crnt_cd;			this.apgm_type_nm = apgm_type_nm;
}
//
orgBfrPT = new Array();
for (var t=0; t<rowsPT; t++)
{
	orgBfrPT[t] = new arrayPT (
								tlv_PT.pgm_type_crnt_cd[t],
								tlv_PT.pgm_type_nm[t]
								)
}

//
//-----------------------------------------------------------------------------------------------------

<cfwddx action="CFML2JS" input="#spr_getListOfPlaceVisit#" toplevelvariable="tlv_PV">
var rowsPV = tlv_PV.getRowCount();
function arrayPV(aplace_visit_pgm_id, aplace_visit_almn_id, aplace_visit_city_nm, aplace_visit_state_prvnc_nm, 
				aplace_visit_cntry_cd, aplace_visit_cntry_nm, aplace_visit_host_instn_nm)
{
	this.aplace_visit_pgm_id = aplace_visit_pgm_id;			this.aplace_visit_almn_id = aplace_visit_almn_id;
	this.aplace_visit_city_nm = aplace_visit_city_nm;		this.aplace_visit_state_prvnc_nm = aplace_visit_state_prvnc_nm;
	this.aplace_visit_cntry_cd = aplace_visit_cntry_cd;		this.aplace_visit_cntry_nm = aplace_visit_cntry_nm;
	this.aplace_visit_host_instn_nm = aplace_visit_host_instn_nm;
}
//
orgBfrPV = new Array();
for (var v=0; v<rowsPV; v++)
{
	orgBfrPV[v] = new arrayPV (
								tlv_PV.place_visit_pgm_id[v],
								tlv_PV.place_visit_almn_id[v],
								tlv_PV.place_visit_city_nm[v],
								tlv_PV.place_visit_state_prvnc_nm[v],
								tlv_PV.place_visit_cntry_cd[v],
								tlv_PV.place_visit_cntry_nm[v],
								tlv_PV.place_visit_host_instn_nm[v]
								)
}
//
//-----------------------------------------------------------------------------------------------------
<cfwddx action="CFML2JS" input="#spr_getListOfPrograms#" toplevelvariable="tlv_LOP">
var rowsLOP = tlv_LOP.getRowCount();
function arrayLOP(   apgm_id ,apgm_almn_id,apgm_type_cd,apgm_type_nm,apgm_fy_dt,apgm_yr_dt
					/*MAIN*/
					/*DETAILS*/
						,apgm_start_dt,apgm_end_dt
					/*DETAILS*/
					/*MAIN*/
					,apgm_from_cntry_cd,apgm_from_cntry_nm,apgm_to_cntry_cd,apgm_to_cntry_nm
					/*MAIN*/
					/*DETAILS*/
						,apgm_field_stdy_cd,apgm_field_stdy_nm,apgm_agcy_nm,apgm_plcmnt_org_nm
						,apgm_nmtng_org_nm,apgm_sub_ctgry_txt,apgm_topic_txt,apgm_strtgc_goal_txt
						,apgm_spcl_award_txt,apgm_updt_dt,apgm_updt_id,apgm_src_nm
					/*DETAILS*/
				)
{
		this.apgm_id = apgm_id;						this.apgm_almn_id = apgm_almn_id;			this.apgm_type_cd = apgm_type_cd;
		this.apgm_type_nm = apgm_type_nm;			this.apgm_fy_dt = apgm_fy_dt;				this.apgm_yr_dt = apgm_yr_dt;
		this.apgm_start_dt = apgm_start_dt;			this.apgm_end_dt = apgm_end_dt;				this.apgm_from_cntry_cd = apgm_from_cntry_cd;
		this.apgm_from_cntry_nm = apgm_from_cntry_nm;this.apgm_to_cntry_cd = apgm_to_cntry_cd;	this.apgm_to_cntry_nm = apgm_to_cntry_nm;
		this.apgm_field_stdy_cd = apgm_field_stdy_cd;this.apgm_field_stdy_nm = apgm_field_stdy_nm;this.apgm_agcy_nm = apgm_agcy_nm;
		this.apgm_plcmnt_org_nm = apgm_plcmnt_org_nm;this.apgm_nmtng_org_nm = apgm_nmtng_org_nm; this.apgm_sub_ctgry_txt = apgm_sub_ctgry_txt;
		this.apgm_topic_txt = apgm_topic_txt;		this.apgm_strtgc_goal_txt = apgm_strtgc_goal_txt; this.apgm_spcl_award_txt = apgm_spcl_award_txt;
		this.apgm_updt_dt = apgm_updt_dt;			this.apgm_updt_id = apgm_updt_id;			this.apgm_src_nm = apgm_src_nm;
}
//
orgBfrLOP = new Array();
for (var p=0; p<rowsLOP; p++)
{
	orgBfrLOP[p] = new arrayLOP( tlv_LOP.pgm_id[p],
								 tlv_LOP.pgm_almn_id[p],
								 tlv_LOP.pgm_type_cd[p],
								 tlv_LOP.pgm_type_nm[p],
								 tlv_LOP.pgm_fy_dt[p],
								 tlv_LOP.pgm_yr_dt[p],
								 tlv_LOP.pgm_start_dt[p],
								 tlv_LOP.pgm_end_dt[p],
								 tlv_LOP.pgm_from_cntry_cd[p],
								 tlv_LOP.pgm_from_cntry_nm[p],
								 tlv_LOP.pgm_to_cntry_cd[p],
								 tlv_LOP.pgm_to_cntry_nm[p],
								 tlv_LOP.pgm_field_stdy_cd[p],
								 tlv_LOP.pgm_field_stdy_nm[p],
								 tlv_LOP.pgm_agcy_nm[p],
								 tlv_LOP.pgm_plcmnt_org_nm[p],
								 tlv_LOP.pgm_nmtng_org_nm[p],
								 tlv_LOP.pgm_sub_ctgry_txt[p],
								 tlv_LOP.pgm_topic_txt[p],
								 tlv_LOP.pgm_strtgc_goal_txt[p],
								 tlv_LOP.pgm_spcl_award_txt[p],
								 tlv_LOP.pgm_updt_dt[p],
								 tlv_LOP.pgm_updt_id[p],
								 tlv_LOP.pgm_src_nm[p]
	)
	
}
//
//-----------------------------------------------------------------------------------------------------
</script>
<!--- .................................................... --->
</head>
<body  onLoad="JavaScript: of_hideDiv('id_msgWait');"><!--- onmousemove="closesubnav(event);"  --->
<form name="f_App" id="" action=""  method="post"><!--- onKeyDown="JavaScript: return f_onKeyDown();" --->
<!--- functin f_onKeyDown is in inc_LogIn.cfm --->
<input type="hidden" name="h_CallPageID" value="">
<!--- skipLinks is hidden, it specified in CSS file --->
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<cfinclude template="inc/_inc_Img_Seal.cfm">
<div id="subglobal" class="subglobalNav"></div>
<!--- Start HEADER --->
<div id="masthead">
	 
	<cfinclude template="inc/_inc_siteName.cfm">
	 
	<cfinclude template="inc/_inc_Navigation_Utility.cfm">
	<cfinclude template="inc/_inc_Navigation_Global.cfm">
  	<cfinclude template="JS/incJS_Navigation_SubGlobal.cfm">
</div> 
<!--- End HEADER --->
<!--- Start PAGECELL --->
<div id="pagecell1" onMouseOver="f_HideSubGlobalNavigation();">  
	<img alt="" src="Img/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="Img/tr_curve_white.gif" height="6" width="6" id="tr">
	<cfinclude template="inc/_inc_Navigation_Breadcrumb.cfm">
	<cfset local.PageHelp_ID = 44>
	<cfinclude template="inc/_inc_PageName_SmallLogo.cfm">
	<!--- The following file includes Section, Related and Advertisement Links --->
	<!--- <cfinclude template="inc/_inc_PageNavigation.cfm">  --->
	<!--- <div id="contentXXX"> Its opening is determined in _inc_PageNavigation.cfm --->
	<div id="content0">
		<!--- ----------------------------------------------------------------------------------------------------- --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
		<cfinclude template="inc/inc_#client.CallFile#">
		<!--- <cfinclude template="inc/_inc_Feature.cfm"> --->
		<!--- <cfinclude template="inc/_inc_Story.cfm"> --->
		<!--- <cfinclude template="inc/_inc_Story_Capsule.cfm"> --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
	</div> <!--- End of <div id="contentXXX"> --->
	<cfinclude template="inc/_inc_Navigation_SiteInfo.cfm">
</div> 
<!--- End PAGECELL --->

</form> 
</body>
</html>
<cfset client.Permission = "YES">