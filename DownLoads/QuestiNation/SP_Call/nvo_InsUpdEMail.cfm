
<cfset local.Process = #URL.urlProcess#>
<cfset local.MsgID = #FORM.h_MsgID#>
<cfset local.EMailType = #FORM.rb_EmailType#>

<cfif local.EMailType EQ "Pre-defined">
	<cfset local.PrjID = "0">
<cfelse>
	<cfset local.PrjID = #FORM.s_Prjs#>
</cfif>

<cfset local.Msg   = #FORM.txta_EMailMsg#>
<cfset local.URL_Address = #FORM.txt_DefaultURL#>
<cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
<cfset local.AdminID = #strAppUser.UserID#>
<!--- <cfoutput>#local.Process#<br>#local.PrjID#<br>#local.Msg#<br>#local.URL_Address#<br>#local.AdminID#</cfoutput><cfabort> --->

<cfstoredproc procedure="PACK_INSUPD.sp_InsUpdEMail" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varProcess" value="#local.Process#"   null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varMsgID" value="#local.MsgID#"   null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID" value="#local.PrjID#"   null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varMsg" value="#local.Msg#"    null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varURL_Address" value="#local.URL_Address#" null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varAdminID" value="#local.AdminID#"   null="No">
</cfstoredproc>
