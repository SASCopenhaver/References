<!--- inc_BC_for_UsrProfile.cfm --->
<cfif client.ListType EQ "401">
	<cfset local.PageName = "<a href='##' onClick='of_CallFile(401);'><font color='921326'><strong>Requesting Access</strong></font></a>">
<cfelseif client.ListType EQ "402">
	<cfset local.PageName = "<a href='##' onClick='of_CallFile(402);'><font color='921326'><strong>Requesting Changes</strong></font></a>">
<cfelseif client.ListType EQ "403">
	<cfset local.PageName = "<a href='##' onClick='of_CallFile(403);'><font color='921326'><strong>Active Users</strong></font></a>">
<cfelseif client.ListType EQ "404">
	<cfset local.PageName = "<a href='##' onClick='of_CallFile(404);'><font color='921326'><strong>Pre-Registered Users</strong></font></a>">
</cfif>
<!---<font color='#921326'><strong> --- </strong></font>--->
<div id="breadCrumb" onMouseOver="f_HideSubGlobalNavigation();">

<a href="##" onClick="of_CallFile(104);"><font color="#921326"><strong>ADMIN</strong></font></a>&nbsp;/&nbsp;
<a href="##" onClick="of_CallFile(202);"><font color="#921326"><strong>Verify and Change Users</strong></font></a>&nbsp;/&nbsp;
<cfoutput>#local.PageName#</cfoutput>&nbsp;/&nbsp;
User Profile
</div>