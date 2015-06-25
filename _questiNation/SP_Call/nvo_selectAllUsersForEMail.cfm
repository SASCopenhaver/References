
<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_AllUsersForEMail" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllUsersForEMail" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllUsersForEMail" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_AllUsersForEMail")>
    <cfset temp = DeleteClientVariable("sprWDDX_AllUsersForEMail")>
</cfif>
<cfwddx action="CFML2WDDX" input="#spr_AllUsersForEMail#" output="client.sprWDDX_AllUsersForEMail">

<!--- <cfoutput query="client.spr_AllUsersForEMail">#UserFName#<br></cfoutput><cfabort> --->