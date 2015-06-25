<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title><cfoutput>#client.PageName#</cfoutput></title>
<!--- 
<cfif #client.Permission# NEQ "YES">
	<cflocation url="_Controller.cfm?urlController=index_cfm">
</cfif> 
 --->
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
	<cfinclude template="JS/of_ruleInMultSelectCntrl.cfm">
<!--- .................................................... --->
	<cfinclude template="JS/of_msgWaitForLoad.cfm">
<!--- .................................................... --->
	<cfwddx action="wddx2cfml" input="#client.sprWDDX_getNavigation#" output="spr_getNavigation">
	<cfinclude template="JS/incJS_ArrayNavigation.cfm">
<!--- .................................................... --->
<cfinclude template="JS/incJS_f_ShowSelection.cfm">
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
//=====================================================================================
</script>
<!--- 
<cfoutput>#client.CallPageID#</cfoutput><cfabort>
Using value of #client.CallPageID# determine presence of topics:
Advertisement; Feature; Story; Capsule Story;
 --->
<!--- .................................................... --->
<cfset client.CS_Search_Type = "UPD">
<!--- .................................................... --->
<!--- 
<cfset client.ControllerDB = "getTopics">
<cfinclude template="_ControllerDB.cfm">
 --->
<!--- .................................................... --->
<cfif client.CS_SetDefault EQ "YES">
	<cfset client.ControllerVars = "defineVarsForCustSearch">
	<cfinclude template="_ControllerVars.cfm">
</cfif>
<!--- .................................................... --->
<cfset client.ControllerDB = "getCustomSearches">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_ArrayCustomSearches.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getCountries">
<cfinclude template="_ControllerDB.cfm">
<!--- .................................................... --->
<!--- 
<cfset client.ControllerDB = "getCntryFrom">
<cfinclude template="_ControllerDB.cfm">

<cfset client.ControllerDB = "getCntryTo">
<cfinclude template="_ControllerDB.cfm">
 --->
 <!--- .................................................... --->
<cfset client.ControllerDB = "getPrograms">
<cfinclude template="_ControllerDB.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getPgmFiscalYr">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_ArrayPgmFiscalYr.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getPgmStartYr"> 
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_ArrayPgmStartYr.cfm">
<!--- .................................................... --->
<cfinclude template="JS/incJS_ArrayFiscalAndPgmStartYr.cfm">
<!--- .................................................... --->
<cfset client.ControllerDB = "getCountryCityPost">
<cfinclude template="_ControllerDB.cfm">
<cfinclude template="JS/incJS_CountryCityPost.cfm">
<!--- .................................................... --->

<!--- .................................................... --->
<!--- .................................................... --->
</head>
<!--- <body  onLoad="JavaScript: of_hideDiv('id_msgWait');">onmousemove="closesubnav(event);"  --->
<body>

<script language="javascript">
function do_totals1()

		{
alert("click")
		document.all.pleasewaitScreen.style.pixelTop = (document.body.scrollTop + 50);

		document.all.pleasewaitScreen.style.visibility="visible";

		//window.setTimeout('do_totals2()',1);

		}	

		

		function do_totals2()

		{

		//lengthy_calculation();

		document.all.pleasewaitScreen.style.visibility="hidden";

		}

		

		function lengthy_calculation()

		{

		var x,y

		

		for(x=0;x<1000000;x++)

			{

			y += (x * y) / (y - x);			

			}

		}

		</script>

		<DIV ID="pleasewaitScreen" STYLE="position:absolute;z-index:5;top:30%;left:42%;visibility:hidden">

			<TABLE BGCOLOR="#000000" BORDER="1" BORDERCOLOR="#000000" CELLPADDING="0" CELLSPACING="0" HEIGHT="100" WIDTH="150" ID="Table1">

				<TR>

					<TD WIDTH="100%" HEIGHT="100%" BGCOLOR="silver" ALIGN="CENTER" VALIGN="MIDDLE">

						<FONT FACE="Arial" SIZE="4" COLOR="blue"><B>Calculating<br>

								Please Wait</B></FONT>

					</TD>

				</TR>

			</TABLE>

		</DIV>






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
<div id="pagecell1"> 
	<img alt="" src="Img/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="Img/tr_curve_white.gif" height="6" width="6" id="tr">
	<cfinclude template="inc/_inc_Navigation_Breadcrumb.cfm">
	<cfset local.PageHelp_ID = 43>
	<cfinclude template="inc/_inc_PageName_SmallLogo.cfm">
	<!--- The following file includes Section, Related and Advertisement Links --->
	<!--- <cfinclude template="inc/_inc_PageNavigation.cfm"> --->
	<div id="content0">
	<!--- <div id="contentXXX"> Its opening is determined in _inc_PageNavigation.cfm --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
		<!--- <cfoutput>#client.Permission#</cfoutput> --->
		<cfinclude template="inc/inc_#client.CallFile#">
		<!--- !!!!!!!!!!!!!!!!! --->
		<!--- <cfset client.CS_SetVars = "YES"> --->
		<!--- !!!!!!!!!!!!!!!!! --->
		<!--- <cfinclude template="inc/_inc_Feature.cfm"> --->
		<!--- <cfinclude template="inc/_inc_Story.cfm"> --->
		<!--- <cfinclude template="inc/_inc_Story_Capsule.cfm"> --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
		<!--- ----------------------------------------------------------------------------------------------------- --->
	</div> <!--- End of <div id="contentXXX"> --->
	<cfinclude template="inc/_inc_Navigation_SiteInfo.cfm">
	<cfset client.Permission = "NO">
	<!--- <cfoutput>#client.Permission#</cfoutput> --->
</div> 
<!--- End PAGECELL --->
</form> 
</body>

</html>
