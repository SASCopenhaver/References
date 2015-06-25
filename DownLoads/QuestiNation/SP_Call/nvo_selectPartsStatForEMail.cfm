<cfstoredproc procedure="PACK_SELECT_ALL.sp_selectPartsStatForEMail" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_PartsStatForEMail" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_PartsStatForEMail" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_PartsStatForEMail")>
    <cfset temp = DeleteClientVariable("sprWDDX_PartsStatForEMail")>
</cfif>
<cfwddx action="CFML2WDDX" input="#spr_PartsStatForEMail#" output="client.sprWDDX_PartsStatForEMail">
<!--- <cfoutput query="spr_PartsStatForEMail">#PartID# #PrjID# #AnswrStat#</cfoutput><cfabort> --->