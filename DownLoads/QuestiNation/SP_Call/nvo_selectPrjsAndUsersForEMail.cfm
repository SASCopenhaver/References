

<cfstoredproc procedure="PACK_SELECT_ALL.sp_AllPrjsForEMail" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllPrjsForEMail" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllPrjsForEMail" resultset="1">
</cfstoredproc>

<cfstoredproc procedure="PACK_SELECT_ALL.sp_AllUsersForEMail" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllUsersForEMail" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllUsersForEMail" resultset="1">
</cfstoredproc>

<cfstoredproc procedure="PACK_SELECT_ALL.sp_selectPartsStatForEMail" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_PartsStatForEMail" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_PartsStatForEMail" resultset="1">
</cfstoredproc>


<cfif isDefined("client.sprWDDX_AllPrjsForEMail")>
    <cfset temp = DeleteClientVariable("sprWDDX_AllPrjsForEMail")>
</cfif>
<cfwddx action="CFML2WDDX" input="#spr_AllPrjsForEMail#" output="client.sprWDDX_AllPrjsForEMail">

<cfif isDefined("client.sprWDDX_AllUsersForEMail")>
    <cfset temp = DeleteClientVariable("sprWDDX_AllUsersForEMail")>
</cfif>
<cfwddx action="CFML2WDDX" input="#spr_AllUsersForEMail#" output="client.sprWDDX_AllUsersForEMail">

<cfif isDefined("client.sprWDDX_PartsStatForEMail")>
    <cfset temp = DeleteClientVariable("sprWDDX_PartsStatForEMail")>
</cfif>
<cfwddx action="CFML2WDDX" input="#spr_PartsStatForEMail#" output="client.sprWDDX_PartsStatForEMail">
