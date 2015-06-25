<cfset local.PrjID = #FORM.h_PrjID#>

<cfstoredproc procedure="PACK_INSUPD.sp_InsUpdArchivePrj" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID" value="#local.PrjID#" null="No">
</cfstoredproc>

