<!--- NewUserRegistration_p2.cfm --->
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
	<!--- <script src="JS/of_helpYourself.js" type="text/javascript"></script> --->
	<cfinclude template="JS/incJS_f_HideSubGlobalNavigation.cfm">
	<cfinclude template="JS/of_CallFile.cfm">
<!--- .................................................... --->
	<script src="JS/of_populateSelect_ExtraRow.js" type="text/javascript"></script>
<!--- .................................................... --->
	<cfwddx action="wddx2cfml" input="#client.sprWDDX_getNavigation#" output="spr_getNavigation">
	<cfinclude template="JS/incJS_ArrayNavigation.cfm">
<!--- .................................................... --->
	<cfinclude template="JS/of_msgWaitForLoad.cfm">
	
<!--- .................................................... --->
<!--- <cfset local.PageHelp_ID = > --->
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
<cfset client.ControllerDB = "getTopics">
<cfinclude template="_ControllerDB.cfm">
<!--- ................................................... --->
<!--- Variable client.vBack prevents overriding values of client client.NUR_Usr_... variables by default values --->
<!--- <cfif NOT isDefined("client.vBack")> 
	<cfset client.ControllerVars = "setNewUserReg">
	<cfinclude template="_ControllerVars.cfm">--->
<!--- </cfif> --->
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
<!--- .................................................... --->
<cfset client.ControllerDB = "get_DOS_OfficeCode">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_DOS_OfficeCode.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getSecretQuestions">
<cfinclude template="_ControllerDB.cfm">
<!--- .................................................... --->
<cfif #client.NUR_Usr_ID# NEQ "0">
	<cfset client.ControllerDB = "getUserInfo">
	<cfinclude template="_ControllerDB.cfm">
</cfif>





<!--- .................................................... --->
</head>
<body  onLoad="JavaScript: of_hideDiv('id_msgWait');"><!--- onmousemove="closesubnav(event);"  --->
<form name="f_App" id="" action=""  method="post"><!--- onKeyDown="JavaScript: return f_onKeyDown();" --->
<!--- functin f_onKeyDown is in inc_LogIn.cfm --->
<input type="hidden" name="h_CallPageID" value="">
<!--- skipLinks is hidden, it specified in CSS file --->
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<cfinclude template="inc/_inc_Img_Seal.cfm">
<!--- Start HEADER --->
<div id="masthead"> <!---  onMouseOver="f_HideSubGlobalNavigation();" --->
	 
	<cfinclude template="inc/_inc_siteName.cfm">
	
	<!--- <cfinclude template="inc/_inc_Navigation_Utility.cfm">  --->
	<cfinclude template="inc/_inc_LinkBack.cfm">
	<!--- <cfinclude template="inc/_inc_Navigation_Global.cfm"> --->
  	<!--- <cfinclude template="JS/incJS_Navigation_SubGlobal.cfm"> --->
</div> 
<!--- End HEADER --->
<!--- Start PAGECELL --->
<div id="pagecell1" onMouseOver="f_HideSubGlobalNavigation();"> 
	<img alt="" src="Img/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="Img/tr_curve_white.gif" height="6" width="6" id="tr">
	<cfinclude template="inc/_inc_Navigation_Breadcrumb.cfm">
	<cfset local.PageHelp_ID = 65>
	<cfinclude template="inc/_inc_PageName_SmallLogo.cfm">
	<!--- The following file includes Section, Related and Advertisement Links --->
	<div id="pageNav"><!--- <cfinclude template="inc/inc_NewUserRegTopics.cfm"> ---></div>
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
<cfset client.Permission = "NO">