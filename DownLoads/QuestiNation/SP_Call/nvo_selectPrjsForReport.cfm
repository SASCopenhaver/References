
<cfstoredproc procedure="PACK_SELECT_ALL.sp_AllPrjsForReport" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllPrjsForReport" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllPrjsForReport" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_AllPrjsForReport")>
    <cfset temp = DeleteClientVariable("sprWDDX_AllPrjsForReport")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_AllPrjsForReport#" output="client.sprWDDX_AllPrjsForReport">


