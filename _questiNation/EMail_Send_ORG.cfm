<cfset local.emailType = #FORM.rb_EmailType#>
<cfset local.emailFrom = #FORM.h_From#>
<cfset local.emailTo = #FORM.h_To#>
<cfset local.PrjName = #FORM.h_PrjName#>
<cfset local.EMailMsg = #FORM.txta_EMailMsg#>
<cfset local.PartNameListForConfirm = #FORM.h_PartNameListForConfirm#>
<!---
<cfoutput>
local.emailFrom=#local.emailFrom#<br>
local.emailTo=#local.emailTo#<br>
FORM.h_PrjName=#FORM.h_PrjName#<br>
local.EMailMsg=#local.EMailMsg#<br>	
local.PartNameListForConfirm=#local.PartNameListForConfirm#<br>
</cfoutput><cfabort>
 --->

 <cfloop index="Email_To" list="#local.emailTo#" delimiters=";">
	<cfmail to="#local.emailFrom#" from="#Email_To#" subject="Project: #FORM.h_PrjName#">
	#local.EMailMsg#
	</cfmail>
</cfloop>

<!--- Confirmation to the Sender --->
<cfmail to="#local.emailFrom#" from="#local.emailFrom#" subject="E-Mail confirmation for the Project: #FORM.h_PrjName#">
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	Do NOT forget to verify e-mail addresses in the list of participants.	
	Selected Participants with incorrect e-mail address	
	WILL NOT receive your message.	
	
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Project Name: #local.PrjName#
================================================================================
The following is an '#local.emailType#' e-mail:

#local.EMailMsg#

It was sent to:
<cfloop index="PartNameEmail" list="#local.PartNameListForConfirm#" delimiters=";">
#PartNameEmail#
</cfloop>
________________________________________________________________________________
</cfmail>
 
<!--- To save sent e-mail --->
<cfset local.Process = "S">
<cfset local.MsgID = "0">
<cfset local.PrjID = #FORM.s_Prjs#>
<cfset local.Msg   = #local.EMailMsg#>
<cfset local.URL_Address = #FORM.txt_DefaultURL#>

<cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
<cfset local.AdminID = #strAppUser.UserID#>
<!--- <cfoutput>#local.emailType#<br>#local.Process#<br>#local.PrjID#<br>#local.Msg#<br>#local.URL_Address#<br>#local.AdminID#</cfoutput><cfabort> --->
<cfstoredproc procedure="PACK_INSUPD.sp_InsUpdEMail" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varProcess" value="#local.Process#"   null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varMsgID" value="#local.MsgID#"   null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID" value="#local.PrjID#"   null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varMsg" value="#local.Msg#"    null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varURL_Address" value="#local.URL_Address#" null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varAdminID" value="#local.AdminID#"   null="No">
</cfstoredproc>
