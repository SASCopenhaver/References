<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_AllOrgs" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllOrgs" maxrows="-1" variable="IgnoreThis">
    <cfprocresult name="spr_AllOrgs" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_AllOrgs")>
    <cfset temp = DeleteClientVariable("sprWDDX_AllOrgs")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_AllOrgs#" output="client.sprWDDX_AllOrgs">
