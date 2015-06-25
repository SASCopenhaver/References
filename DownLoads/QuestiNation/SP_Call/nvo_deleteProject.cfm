<cfset local.PrjID = #FORM.s_Prjs#>

<cfstoredproc procedure="PACK_INSUPD.sp_DeletePrj" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID"  value="#local.PrjID#"  null="No">
</cfstoredproc>

