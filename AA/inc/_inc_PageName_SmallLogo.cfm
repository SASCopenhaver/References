<!--- _inc_PageName_SmallLogo.cfm --->
<div id="pageName"> 
	<h2><cfoutput>#client.PageName#</cfoutput></h2> 
	<cfset local.SmolLogoFileName = "SL_#Left(client.CallFile, Len(client.CallFile)-4)#.jpg">
	<!--- <cfoutput>#local.SmolLogoFileName#</cfoutput> --->
	<cfoutput>
	<a href="##" onClick="JavaScript: of_pageHelp(#local.PageHelp_ID#);">
		<!--- <img alt="small logo" src="Img/#local.SmolLogoFileName#" border="0" height="50" width="40" /> --->
		<img alt="small logo" src="Img/Help.jpg" border="0" height="50" width="40" />
	</a>
	</cfoutput>
</div>
