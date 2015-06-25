
<cfset local.SQL_Update = #FORM.h_SQL_Update#>
<cfset local.SQL_Delete = #FORM.h_SQL_Delete#>

<cfset local.ParticipantID = #strAppUser.UserID#>
<cfset local.ReaserchID = #client.PrjID#>
<!--- 
<cfoutput>
#local.SQL_Update#
<br>
#local.SQL_Delete#
<br>
#local.ParticipantID#
<br>
#local.ReaserchID#
<br>
</cfoutput><cfabort>
 --->
<cfstoredproc procedure="PACK_InsUpd.sp_InsUpdUserAnswers" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varSQL_Update"    value="#local.SQL_Update#"    null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varSQL_Delete"    value="#local.SQL_Delete#"    null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varParticipantID" value="#local.ParticipantID#" null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varReaserchID"    value="#local.ReaserchID#"    null="No">
</cfstoredproc>


