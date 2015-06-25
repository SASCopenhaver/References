<cfstoredproc procedure="PACK_SELECT_ALL.sp_AllPrjsForEMail" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllPrjsForEMail" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllPrjsForEMail" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_AllPrjsForEMail")>
    <cfset temp = DeleteClientVariable("sprWDDX_AllPrjsForEMail")>
</cfif>
<cfwddx action="CFML2WDDX" input="#spr_AllPrjsForEMail#" output="client.sprWDDX_AllPrjsForEMail">

