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
	<script src="JS/of_populateSelect_ExtraRow.js" type="text/javascript"></script>
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
<!--- .................................................... --->
<!--- <cfoutput>#client.CallPageID#</cfoutput><cfabort>
Using value of #client.CallPageID# determine presence of topics:
Advertisement; Feature; Story; Capsule Story;
 --->
<!--- 
<cfset client.ControllerDB = "getTopics">
<cfinclude template="_ControllerDB.cfm">
 --->
<!--- .................................................... --->
<cfset client.ControllerDB = "getSelfData">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_UsrAddnlCntries.cfm">
<!--- .... --->
<cfset local.AddCntryTemp = "">
<cfset local.AddCntry = "">
<cfset local.AddCntryTempCD = "">
<cfset local.AddCntryCD = "">

<cfloop query="spr_getAddlCntries" startrow="1" endrow="#spr_getAddlCntries.recordCount#">
	<cfif #usr_cntry_is_prmry# EQ "N">
		<cfset local.AddCntryTemp = #usr_cntry_cntry_nm#>
		<cfset local.AddCntry = local.AddCntry&local.AddCntryTemp&", ">
		
		<cfset local.AddCntryTempCD = #usr_cntry_cntry_cd#>
		<cfset local.AddCntryCD = local.AddCntryCD&local.AddCntryTempCD&", ">
	</cfif>
</cfloop>

<cfif #local.AddCntry# EQ "">
	<cfset local.AddCntry = "No additional countries.">
<cfelseif #local.AddCntry# EQ "*">
	<cfset local.AddCntry = "All countries.">
<cfelse>
	<cfset local.AddCntry = Left(local.AddCntry, Len(local.AddCntry)-2)>
</cfif>
<!--- ................................................................................. --->
<!--- .................................................... --->
<cfset client.ControllerDB = "getPrefix">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_ArrayPrefix.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getAppRoles">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_AppRoles.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getCountryCityPost">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_CountryCityPost.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "get_DOS_OfficeCode">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_DOS_OfficeCode.cfm">
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
	<!--- <cfinclude template="inc/_inc_Navigation_Breadcrumb.cfm"> --->
	<!--- <cfinclude template="inc/inc_BC_for_UsrProfile.cfm"> --->
	<cfset local.PageHelp_ID = 56>
	<cfinclude template="inc/_inc_PageName_SmallLogo.cfm">
	<!--- The following file includes Section, Related and Advertisement Links --->
	<!--- <cfinclude template="inc/_inc_PageNavigation.cfm"> --->
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