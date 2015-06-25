<!--- This Stored Procedure
1) Inserts or Updates receord 
2) Retrieves This record from database
--->

<cfstoredproc procedure="questination.PACK_INSUPD.sp_InsUpdUser" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varID"       value="#strAppUser.UserID#"   null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varFName"    value="#strAppUser.UserFName#"    null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varLName"    value="#strAppUser.UserLName#"    null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPass"     value="#strAppUser.UserPass#"     null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varEmail"    value="#strAppUser.UserEmail#"    null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varActInact" value="#strAppUser.UserActInact#" null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varOrgID"    value="#strAppUser.UserOrgID#"    null="No">
  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_InsUpdUser" maxrows="-1" variable="IgnoreThis">
  <cfprocresult name="spr_IndUpdUser" resultset="1">
</cfstoredproc>

<!--- Updating strAppUser with information retrieved from database --->
<!--- <cfset strAppUser = StructNew()> --->
<cfset strAppUser.UserID       = #spr_IndUpdUser.IDS#>
<cfset strAppUser.UserFName    = #spr_IndUpdUser.FName#>
<cfset strAppUser.UserLName    = #spr_IndUpdUser.LName#>
<cfset strAppUser.UserPass     = #spr_IndUpdUser.Pass#>
<cfset strAppUser.UserEmail    = #spr_IndUpdUser.Email#>
<cfset strAppUser.UserActInact = #spr_IndUpdUser.Act_Inact#>
<cfset strAppUser.UserOrgID    = #spr_IndUpdUser.Org_ID#>

<cfif isDefined("client.strWDDXAppUser")>
    <cfset temp = DeleteClientVariable("strWDDXAppUser")>
</cfif>

<cfwddx action="CFML2WDDX" input="#strAppUser#" output="client.strWDDXAppUser">

<!---
<cfoutput>
TEST:<br>
#strAppUser.UserID#<br>
#strAppUser.UserFName#<br>
#strAppUser.UserLName#<br>
#strAppUser.UserPass#<br>
#strAppUser.UserEmail#<br>
#strAppUser.UserActInact#<br>
#strAppUser.UserOrgID#
</cfoutput><cfabort>
 --->


