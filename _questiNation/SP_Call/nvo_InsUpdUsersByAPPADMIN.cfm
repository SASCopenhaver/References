<!--- This Stored Procedure
1) Inserts or Updates receord 
2) Retrieves This record from database
--->

<cfstoredproc procedure="questination.PACK_INSUPD.sp_InsUpdUser" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varID"       value="#strInsUpdUser.UserID#"   null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varFName"    value="#strInsUpdUser.UserFName#"    null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varLName"    value="#strInsUpdUser.UserLName#"    null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPass"     value="#strInsUpdUser.UserPass#"     null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varEmail"    value="#strInsUpdUser.UserEmail#"    null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varActInact" value="#strInsUpdUser.UserActInact#" null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varOrgID"    value="#strInsUpdUser.UserOrgID#"    null="No">
  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_InsUpdUser" maxrows="-1" variable="IgnoreThis">
  <cfprocresult name="spr_IndUpdUser" resultset="1">
</cfstoredproc>

<!--- Updating strAppUser with information retrieved from database --->
<cfset strInsUpdUser = StructNew()>
<cfset strInsUpdUser.UserID       = #spr_IndUpdUser.IDS#>
<cfset strInsUpdUser.UserFName    = #spr_IndUpdUser.FName#>
<cfset strInsUpdUser.UserLName    = #spr_IndUpdUser.LName#>
<cfset strInsUpdUser.UserPass     = #spr_IndUpdUser.Pass#>
<cfset strInsUpdUser.UserEmail    = #spr_IndUpdUser.Email#>
<cfset strInsUpdUser.UserActInact = #spr_IndUpdUser.Act_Inact#>
<cfset strInsUpdUser.UserOrgID    = #spr_IndUpdUser.Org_ID#>

<cfif isDefined("client.InsUpdUserID")>
    <cfset temp = DeleteClientVariable("InsUpdUserID")>
</cfif>

<cfif isDefined("client.strWDDXInsUpdUser")>
    <cfset temp = DeleteClientVariable("strWDDXInsUpdUser")>
</cfif>

<cfset client.InsUpdUserID = #spr_IndUpdUser.IDS#>

<cfwddx action="CFML2WDDX" input="#strInsUpdUser#" output="client.strWDDXInsUpdUser">
<!---
<cfoutput>
TEST:<br>
UserID=#strInsUpdUser.UserID#<br>
UserFName=#strInsUpdUser.UserFName#<br>
UserLName=#strInsUpdUser.UserLName#<br>
UserPass=#strInsUpdUser.UserPass#<br>
UserEmail=#strInsUpdUser.UserEmail#<br>
UserActInact=#strInsUpdUser.UserActInact#<br>
UserOrgID=#strInsUpdUser.UserOrgID#
</cfoutput><cfabort>
 --->

