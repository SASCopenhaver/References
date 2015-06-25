<cfstoredproc procedure="PACK_SELECT_ALL.sp_AllActivePrjs" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllPrjs" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllPrjs" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_AllPrjs")>
    <cfset temp = DeleteClientVariable("sprWDDX_AllPrjs")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_AllPrjs#" output="client.sprWDDX_AllPrjs">
