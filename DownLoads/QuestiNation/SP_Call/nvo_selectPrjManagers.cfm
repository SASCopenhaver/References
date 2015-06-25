<cfstoredproc procedure="PACK_SELECT_ALL.sp_PrjMngrs" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_PrjMngrs" maxrows="-1" variable="IgnoreThis">
    <cfprocresult name="spr_AllPrjMngrs" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_AllPrjMngrs")>
    <cfset temp = DeleteClientVariable("sprWDDX_AllPrjMngrs")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_AllPrjMngrs#" output="client.sprWDDX_AllPrjMngrs">
