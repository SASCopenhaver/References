<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_selectUsersInTblAnswers" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_UsersInAnswers" maxrows="-1" variable="IgnoreThis">
    <cfprocresult name="spr_UsersInAnswers" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_UsersInAnswers")>
    <cfset temp = DeleteClientVariable("sprWDDX_UsersInAnswers")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_UsersInAnswers#" output="client.sprWDDX_UsersInAnswers">
