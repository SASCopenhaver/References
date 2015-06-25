<!--- nvo_getListOfBranches.cfm --->
<cfif isDefined("client.strWDDXUser")>
	<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">
</cfif>
<!--- <cfoutput>#strUser.UserOfficeID#</cfoutput><cfabort> --->

<cfstoredproc procedure="PACK_EVAL.sp_getListOfBranches" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="In"  cfsqltype="CF_SQL_NUMERIC" variable="argDivisionID" value="#strUser.UserOfficeID#"  null="No">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getListOfBranches" maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getPrjsInDivision" maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_FiscalYears"  maxrows="-1" variable="IgnoreThis">
	
	<cfprocresult name="spr_getListOfBranches" resultset="1">
	<cfprocresult name="spr_getPrjsInDivision" resultset="2">
	<cfprocresult name="spr_FiscalYears" resultset="3">
</cfstoredproc>
<!--- 
<cfoutput>
	#spr_getListOfBranches.recordCount#<br>
	#spr_getPrjsInDivision.recordCount#<br>
	#spr_FiscalYears.recordCount#
</cfoutput><cfabort>
 --->
<cfset client.NumOfBranches = #spr_getListOfBranches.recordCount#>

<cfwddx action="CFML2WDDX" input="#spr_getListOfBranches#" output="client.sprWDDX_getListOfBranches">
<cfwddx action="CFML2WDDX" input="#spr_getPrjsInDivision#" output="client.sprWDDX_getPrjsInDivision">
<cfwddx action="CFML2WDDX" input="#spr_FiscalYears#" output="client.sprWDDX_FiscalYears">

<!--- <cfwddx action="CFML2WDDX" input="#strUser#" output="client.strWDDXUser"> --->