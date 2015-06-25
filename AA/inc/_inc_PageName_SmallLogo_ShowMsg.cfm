<!--- _inc_PageName_SmallLogo.cfm --->
<div id="pageName"> 
	<h2><cfoutput>#client.PageName#</cfoutput></h2> 
	<!--- <cfset local.SmolLogoFileName = "SL_#Left(client.CallFile, Len(client.CallFile)-4)#.jpg"> --->
	<!--- <cfoutput>#local.SmolLogoFileName#</cfoutput> --->
	<cfif #client.PageName# EQ "Error">
		<img alt="small logo" src="Img/Error.jpg" height="40" width="40" />
	<cfelseif #client.PageName# EQ "Information">
		<img alt="small logo" src="Img/Info.jpg" height="40" width="40" />
	</cfif>
	
	
</div>
