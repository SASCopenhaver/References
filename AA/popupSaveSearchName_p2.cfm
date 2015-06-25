<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Save Custom Search</title>
<!--- STYLE SHEET .................................................... --->
	<link rel="stylesheet" href="Style/emx_nav_left.css" type="text/css">
<!--- GENERIC JavaScript FUNCTIONS ................................... --->
	<script src="JS/wddx.js" type="text/javascript"></script>
	<script src="JS/of_browserSelection.js" type="text/javascript"></script><script language="javascript" type="text/javascript">of_browserSelection();</script>
	
	<cfinclude template="JS/of_CallFile.cfm">
	<script src="JS/of_Submit.js" type="text/javascript"></script>
<!--- .................................................... --->
<!--- .................................................... --->
	<cfinclude template="JS/of_msgWaitForLoad.cfm">
<!--- .................................................... --->

<!--- .................................................... --->
<!--- .................................................... --->

</head>
<body >
<form name="f_App" id="" action=""  method="post">
<input type="hidden" name="h_CallPageID" value="">
<!--- skipLinks is hidden, it specified in CSS file --->
<div class="skipLinks">skip to: <a href="#content">page content</a> | <a href="pageNav">links on this page</a> | <a href="#globalNav">site navigation</a> | <a href="#siteInfo">footer (site information)</a> </div>
<div id="subglobal" class="subglobalNav"></div>
<!--- Start HEADER --->
<div id="masthead">
	<h1 id="siteName">
		<cflock scope="application" type="readonly" timeout="10">
			<cfoutput>#Application.siteName#</cfoutput>
		</cflock>
	</h1> 
</div> <!--- End HEADER --->
<!--- Start PAGECELL --->
<div id="pagecell2"> 
	<img alt="" src="Img/tl_curve_white.gif" height="6" width="6" id="tl"> <img alt="" src="Img/tr_curve_white.gif" height="6" width="6" id="tr">
	<div id="pageName"> 
		<h2>Save Custom Search</h2> 
		<img alt="small logo" src="Img/SL_popupSaveSearchName_p1.jpg" height="40" width="40"/>
	</div>
	<div id="content0">
		<cfinclude template="inc/inc_popupSaveSearchName_p2.cfm">
	</div>
	<div id="siteInfo">
		<img alt="World map" src="Img/worldmap_Small.gif" >
		&copy;<cfoutput>#Year(Now())#&nbsp;#Application.orgName#</cfoutput>
	</div>
</div> 
<!--- End PAGECELL --->
</form> 
</body>
</html>
<cfset client.Permission = "YES">