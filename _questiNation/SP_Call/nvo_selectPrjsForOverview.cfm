<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_PrjsForOverview" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_ActPrjsForOverview" maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_InactPrjsForOverview" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_ActPrjsForOverview" resultset="1">
	<cfprocresult name="spr_InactPrjsForOverview" resultset="2">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_ActPrjsForOverview")>
    <cfset temp = DeleteClientVariable("sprWDDX_ActPrjsForOverview")>
</cfif>
<cfif isDefined("client.sprWDDX_InactPrjsForOverview")>
    <cfset temp = DeleteClientVariable("sprWDDX_InactPrjsForOverview")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_ActPrjsForOverview#"   output="client.sprWDDX_ActPrjsForOverview">
<cfwddx action="CFML2WDDX" input="#spr_InactPrjsForOverview#" output="client.sprWDDX_InactPrjsForOverview">
