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
	<cfinclude template="JS/incJS_f_HideSubGlobalNavigation.cfm">
	<cfinclude template="JS/of_CallFile.cfm">
<!--- .................................................... --->
	<cfwddx action="wddx2cfml" input="#client.sprWDDX_getNavigation#" output="spr_getNavigation">
	<cfinclude template="JS/incJS_ArrayNavigation.cfm">
<!--- .................................................... --->
	<cfinclude template="JS/of_msgWaitForLoad.cfm">
	
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
<!--- .................................................... --->
<!--- <cfoutput>#client.CallPageID#</cfoutput><cfabort>
Using value of #client.CallPageID# determine presence of topics:
Advertisement; Feature; Story; Capsule Story;
 --->
<!--- 
<cfset client.ControllerDB = "getTopics">
<cfinclude template="_ControllerDB.cfm"> 
--->
<cfset client.ControllerDB = "getAlnmProfile">
<cfinclude template="_ControllerDB.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "sp_getProminent_Categories">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_Prominent_Categories.cfm">
<!--- .................................................... --->
<cfoutput query="spr_getAlnmProfile">
	<!--- client.AP_AlmnID --->
	<!--- ... --->
	<cfset client.AP_Pfx = #almn_pfx_dsc#>
	<cfset client.AP_Frst_Nm = #almn_frst_nm#>
	<cfset client.AP_Midl_Nm = #almn_midl_nm#>
	<cfset client.AP_Last_Nm = #almn_last_nm#>
	<cfset client.AP_Last_Nm2 = #almn_last_nm2#>
	<cfset client.AP_Sfx = #almn_sfx_dsc#>
	<!--- ... --->
	<cfset client.AP_Sex = #almn_sex_ind#>
	<cfset client.AP_DOB = #almn_dob_dt#>
	<!--- ... --->
	<cfset client.AP_Ctznsp_Cd = #almn_ctznsp_cntry_cd#>
	<cfset client.AP_Ctznsp_Cd2 = #almn_ctznsp_cntry_cd2#>
	<!--- ... --->
	<cfset client.AP_cntct_ind = #almn_cntct_ind#>
	<cfset client.AP_Dcsd = #almn_dcsd_ind#>
	<cfset client.AP_Dsabld = #almn_dsabld_ind#>
	<!--- ... --->
	<cfset client.AP_Resdnc_Adrs_Txt = #almn_resdnc_adrs_txt#>
	<cfset client.AP_Resdnc_City_Nm = #almn_resdnc_city_nm#>
	<cfset client.AP_Resdnc_State_Prvnc_Nm = #almn_resdnc_state_prvnc_nm#>
	<cfset client.AP_Resdnc_Cntry_Cd = #almn_resdnc_cntry_cd#>
	<cfset client.AP_Resdnc_Postl_CD = #almn_resdnc_postl_cd#>
	<!--- ... --->
	<!--- 
	<cfset client.AP_Legal_State_CD = #almn_legal_state_cd#>
	<cfset client.AP_Cngrtsnl_dstrct_Num = #almn_cngrtsnl_dstrct_num#>
	 --->
	<!--- ... --->
	<cfset client.AP_Bsns_Nm = #almn_bsns_nm#>
	<cfset client.AP_Bsns_Adrs_Txt = #almn_bsns_adrs_txt#>
    <cfset client.AP_Bsns_City_Nm = #almn_bsns_city_nm#>
	<cfset client.AP_Bsns_State_Prvnc_Nm = #almn_bsns_state_prvnc_nm#>
	<cfset client.AP_Bsns_Cntry_Cd = #almn_bsns_cntry_cd#>
	<cfset client.AP_Bsns_Postl_CD  = #almn_bsns_postl_cd#>
	<!--- ... --->
	<cfset client.AP_Prfrd_Adrs_ind = #almn_prefrd_adrs_ind#>
	<!--- ... --->
	<!--- Title/Profession Institution --->
	<!--- ... --->
	<cfset client.AP_resdnc_phone_num = #almn_resdnc_phone_num#>
	<cfset client.AP_bsns_phone_num = #almn_bsns_phone_num#>
	<cfset client.AP_cell_num = #almn_cell_num#>
	<cfset client.AP_othr_phone_num = #almn_othr_phone_num#>
	
	<!--- ... --->
	<cfset client.AP_prefrd_phone_num_ind = #almn_prefrd_phone_num_ind#>
	<!--- ... --->
	<cfset client.AP_fax_num = #almn_fax_num#>
	<!--- ... --->
	<cfset client.AP_email1_txt = #almn_email1_txt#>
	<cfset client.AP_email2_txt = #almn_email2_txt#>
	<!--- ... --->
	<cfset client.AP_prefrd_email_ind = #almn_prefrd_email_ind#>
	<!--- ... --->
	<cfset client.AP_intrst = #almn_intrst_cd#>
	<!--- ... --->
	<cfset client.AP_speak_level = #almn_elp_speak_fsi_level_num#>
	<cfset client.AP_read_level = #almn_elp_read_fsi_level_num#>
	<cfset client.AP_comp_level = #almn_elp_comp_fsi_level_num#>
	<!--- ... --->
	<cfset client.AP_notes_txt = #almn_notes_txt#>
	<!--- ... --->
	<!--- Temp measers --->
	<cfset client.AP_New_title_txt = "">
	<cfset client.AP_New_instn_nm = "">
	<!--- ... --->
	<cfset client.AP_Prominent_CD = #almn_prominent_cd#>
	<!--- !!!! --->
</cfoutput>


<!--- .................................................... --->
<cfset client.ControllerDB = "getInterests">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_ArrayInterest.cfm">


<!--- .................................................... --->
<cfset client.ControllerDB = "getPrefix">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_ArrayPrefix.cfm">

<!--- .................................................... --->
<cfset client.ControllerDB = "getCountryCityPost">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_CountryCityPost.cfm">


<!--- .................................................... --->
</head>
<body  onLoad="JavaScript: of_hideDiv('id_msgWait');"><!--- onmousemove="closesubnav(event);"  --->
<form name="f_App" id="" action=""  method="post" onKeyUp="f_onKeyUp()"><!--- onKeyDown="JavaScript: return f_onKeyDown();" --->
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
	<!--- <cfinclude template="inc/_inc_Navigation_Breadcrumb.cfm"> --->
	<cfinclude template="inc/inc_BreadcrumbForAlmnRec.cfm">
	<cfset local.PageHelp_ID = 45>
	<cfinclude template="inc/_inc_PageName_SmallLogo.cfm">
	<!--- The following file includes Section, Related and Advertisement Links --->
	<!--- <cfinclude template="inc/_inc_PageNavigation.cfm"> --->
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

<script language="javascript" type="text/javascript">
//onKeyUp="f_onKeyUp()"
function f_onKeyUp() 
{
	var vKeyCode = window.event.keyCode;
	if (vKeyCode == 13)
	{
		f_UpdateAlmnRecord();
	}
}
</script>
<cfset client.Permission = "YES">

