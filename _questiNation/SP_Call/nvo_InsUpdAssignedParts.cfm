<cfset client.PrjsStat = #FORM.s_PrjsStat#>
<cfset client.PrjID = #FORM.s_Prjs#>
<cfset client.OrgID = #FORM.s_Orgs#>
<cfset local.UsersInTarget = #FORM.h_UsersInTarget#>
<cfset local.MngrInTarget = #FORM.h_Mngr#>
<!--- 
TEST:<br><cfoutput>
client.PrjsStat = #client.PrjsStat#<br>
client.PrjID = #client.PrjID#<br>
client.OrgID = #client.OrgID#<br>
local.UsersInTarget = #local.UsersInTarget#<br>
local.MngrInTarget = #local.MngrInTarget#<br>
</cfoutput><cfabort>
 --->

<cfstoredproc procedure="questination.PACK_INSUPD.sp_InsUpdAssignedParts" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID"         value="#client.PrjID#"         null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varUsersInTarget" value="#local.UsersInTarget#"  null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varMngrsInTarget" value="#local.MngrInTarget#"   null="No">
</cfstoredproc>

