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
	<!--- <script src="JS/of_populateSelect.js" type="text/javascript"></script> --->
	<!--- <script src="JS/of_selectedInDDLB.js" type="text/javascript"></script> --->
	<cfinclude template="JS/incJS_f_HideSubGlobalNavigation.cfm">
	<cfinclude template="JS/of_CallFile.cfm">
<!--- .................................................... --->
	<cfinclude template="JS/of_msgWaitForLoad.cfm">
<!--- .................................................... --->
<!--- .................................................... --->
<!--- 	
	<cfwddx action="wddx2cfml" input="#client.sprWDDX_getNavigation#" output="spr_getNavigation">
	<cfinclude template="JS/incJS_ArrayNavigation.cfm">
 --->	
<!--- .................................................... --->
<cfif #client.ValForButton# EQ "102">
	<cfset client.CS_SetDefault = "NO">
</cfif>
<!--- .................................................... --->
</head>
<body onLoad="JavaScript: of_hideDiv('id_msgWait');"><!--- onmousemove="closesubnav(event);"  --->
<form name="f_App" id="" action="" onKeyDown="JavaScript: return f_onKeyDown();" method="post">
<!--- functin f_onKeyDown is in inc_LogIn.cfm --->
<input type="hidden" name="h_CallPageID" value="">
<!--- skipLinks is hidden, it specified in CSS file --->
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<cfinclude template="inc/_inc_Img_Seal.cfm">
<!--- <div id="subglobal" class="subglobalNav"></div> --->
<!--- Start HEADER --->
<div id="masthead"> <!---  onMouseOver="f_HideSubGlobalNavigation();" --->
	<h1 id="siteName" >
		<cflock scope="application" type="readonly" timeout="10">
			<cfoutput>#Application.siteName#</cfoutput>
		</cflock>
	</h1> 
	<!--- <cfinclude template="inc/_inc_siteName.cfm"> --->
	<!--- <cfinclude template="inc/_inc_Navigation_Utility.cfm"> --->
	<!--- <cfinclude template="inc/_inc_Navigation_Global.cfm"> --->
  	<!--- <cfinclude template="JS/incJS_Navigation_SubGlobal.cfm"> --->
</div> 
<!--- End HEADER --->
<!--- Start PAGECELL --->
<div id="pagecell1" >  <!--- onMouseOver="f_HideSubGlobalNavigation();" --->
	<img alt="" src="Img/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="Img/tr_curve_white.gif" height="6" width="6" id="tr">
	<!--- <cfinclude template="inc/_inc_Navigation_Breadcrumb.cfm"> --->
	<cfinclude template="inc/_inc_PageName_SmallLogo_ShowMsg.cfm">
	<!--- The following file includes Section, Related and Advertisement Links --->
	<!--- <cfinclude template="inc/_inc_PageNavigation.cfm"> --->
	<div id="content0">
	<!--- <div id="contentXXX"> Its opening is determined in _inc_PageNavigation.cfm --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
		<!--- <cfinclude template="inc/inc_LogIn.cfm"> --->
		<!--- <cfinclude template="inc/_inc_Feature.cfm"> --->
		<!--- <cfinclude template="inc/_inc_Story.cfm"> --->
		<!--- <cfinclude template="inc/_inc_Story_Capsule.cfm"> --->
		
		
		
		<cfif #client.PageName# EQ "Error">
			<cfset local.FontStyle = "c_fieldNameRed">
		<cfelseif #client.PageName# EQ "Information">
			<cfset local.FontStyle = "c_fieldNameNavy">
		</cfif>
		<br><br>
		<table title="Message" cellpadding="2" cellspacing="2" align="center" width="50%" border="0">
			<cfoutput>
			<!--- <tr><td class="#local.FontStyle#" style="font-size:14px; font-weight:bold;">#client.MsgType#</td></tr> --->
			<tr><td class="#local.FontStyle#" style="padding:15px 0px 0px 0px; font-size:12px; font-weight:bold;">#client.MsgTxt#</td></tr>
			</cfoutput>
			<tr><td align="center" style="padding:20px 0px 10px 0px;">&nbsp;
				<input name="cb_Submit" 
					   type="button" 
					   value="&nbsp;&nbsp;&nbsp;OK&nbsp;&nbsp;&nbsp;" 
					   class="c_formbuttons"
					   onClick="of_CallFile('<cfoutput>#client.ValForButton#</cfoutput>');">
			
			</td></tr>
		</table>
		<!--- <cfset local.delClientVar = DeleteClientVariable("MsgType")> 
		<cfset local.delClientVar = DeleteClientVariable("Msg")> 
		<cfset local.delClientVar = DeleteClientVariable("CaseToCall")>  --->
		<!--- 
		<script language="javascript1.2" type="text/javascript">
		function f_NextPage()
		{
			of_Submit("_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=<cfoutput>#client.CaseToCall#</cfoutput>");
		}
		
		</script>
		 --->
				
		
		<!--- ----------------------------------------------------------------------------------------------------- --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
	</div> <!--- End of <div id="contentXXX"> --->
	<!--- <cfinclude template="inc/_inc_Navigation_SiteInfo.cfm"> --->
	<div id="siteInfo">
		<img alt="World map" src="Img/worldmap_Small.gif" >
		&copy;<cfoutput>#Year(Now())#&nbsp;#Application.orgName#</cfoutput>
	</div>
</div> 
<!--- End PAGECELL --->
</form> 
</body>
</html>
