
<cfstoredproc procedure="PACK_SELECT_ALL.sp_selectQandA" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_Quest" maxrows="-1" variable="IgnoreThis">
    <cfprocresult name="spr_Quest" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_Quest")>
    <cfset temp = DeleteClientVariable("sprWDDX_Quest")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_Quest#" output="client.sprWDDX_Quest">

