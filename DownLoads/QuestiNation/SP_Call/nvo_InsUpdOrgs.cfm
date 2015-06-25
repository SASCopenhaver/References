<cfset local.OrgID = #FORM.s_Orgs#>
<cfset local.OrgAbbr = #FORM.txt_OrgAbbr#>
<cfset local.OrgFullName = #FORM.txt_OrgFullName#>

<cfstoredproc procedure="PACK_INSUPD.sp_InsUpdOrg" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varOrgID"       value="#local.OrgID#"   null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varOrgAbbr"    value="#local.OrgAbbr#"    null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varOrgFullName"    value="#local.OrgFullName#"    null="No">
  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_InsUpdOrg" maxrows="-1" variable="IgnoreThis">
  <cfprocresult name="spr_InsUpdOrg" resultset="1">
</cfstoredproc>

<cfset client.InsUpdOrgID = #spr_InsUpdOrg.IDS#>
<!--- <cfwddx action="CFML2WDDX" input="#spr_IndUpdOrg#" output="client.strWDDXOrgID"> --->