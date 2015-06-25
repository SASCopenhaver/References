<cfstoredproc procedure="PACK_SELECT_ALL.sp_AllUsers" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllUsers" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllUsers" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_AllUsers")>
    <cfset temp = DeleteClientVariable("sprWDDX_AllUsers")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_AllUsers#" output="client.sprWDDX_AllUsers">
