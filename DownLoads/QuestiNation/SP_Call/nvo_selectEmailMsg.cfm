
<cfstoredproc procedure="PACK_SELECT_ALL.sp_EmailMsg" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID"    value="0"    null="No">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_EmailMsg" maxrows="-1" variable="IgnoreThis">
    <cfprocresult name="spr_EmailMsg" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_EmailMsg")>
    <cfset temp = DeleteClientVariable("sprWDDX_EmailMsg")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_EmailMsg#" output="client.sprWDDX_EmailMsg">
