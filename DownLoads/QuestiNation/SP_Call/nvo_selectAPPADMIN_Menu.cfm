<cfstoredproc procedure="PACK_SELECT_ALL.sp_Menu" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varOrgID"    value="#strAppUser.UserOrgID#"    null="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_Menu" maxrows="-1" variable="IgnoreThis">
    <cfprocresult name="spr_Menu" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_Menu")>
    <cfset temp = DeleteClientVariable("sprWDDX_Menu")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_Menu#" output="client.sprWDDX_Menu">
