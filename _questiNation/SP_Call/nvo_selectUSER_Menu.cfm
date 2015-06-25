<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_UserMenu" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varUserID"    value="#strAppUser.UserID#"    null="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_UserPrjs" maxrows="-1" variable="IgnoreThis">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_UserMenu" maxrows="-1" variable="IgnoreThis">
    
    <cfprocresult name="spr_UserPrjs" resultset="1">
    <cfprocresult name="spr_UserMenu" resultset="2">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_UserPrjs")>
    <cfset temp = DeleteClientVariable("sprWDDX_UserPrjs")>
</cfif>
<cfif isDefined("client.sprWDDX_UserMenu")>
    <cfset temp = DeleteClientVariable("sprWDDX_UserMenu")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_UserPrjs#" output="client.sprWDDX_UserPrjs">
<cfwddx action="CFML2WDDX" input="#spr_UserMenu#" output="client.sprWDDX_UserMenu">


<!---
#strAppUser.UserID#<br>
#strAppUser.UserFName#<br>
#strAppUser.UserLName#<br>
#strAppUser.UserPass#<br>
#strAppUser.UserEmail#<br>
#strAppUser.UserActInact#<br>
#strAppUser.UserOrgID#
 --->