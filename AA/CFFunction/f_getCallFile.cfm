<!--- f_getCallFile.cfm --->
<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
	<cfif #client.CallPageID# EQ #spr_getNavigation.st_id#>
		<cfset client.PageName = spr_getNavigation.st_nm>
		<cfset client.CallFile = spr_getNavigation.st_call_file>
		<cfbreak>
	</cfif>
</cfloop>
<!---
<cfoutput>
#client.CallPageID#<br>
#client.CallFile#<br>
#client.PageName# </cfoutput><cfabort> --->