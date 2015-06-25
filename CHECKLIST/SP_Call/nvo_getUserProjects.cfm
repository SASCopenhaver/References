<!--- nvo_getUserProjects.cfm --->
<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">

<!--- ********************************************************************* --->
<!--- <cfif #strUser.SecurityUserRole# EQ "BC" OR #strUser.SecurityUserRole# EQ "PO"> --->
	<cfstoredproc procedure="PACK_EVAL.sp_getGenericInfo" datasource="#client.DSN#" returncode="No">
		<!--- --- --->
		<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_StrategicGoals"  maxrows="-1" variable="IgnoreThis">
		<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_Questions"       maxrows="-1" variable="IgnoreThis">
		<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_NPA_PrgrOfficers"  maxrows="-1" variable="IgnoreThis">
		<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_FiscalYears"  maxrows="-1" variable="IgnoreThis">
		<!--- --- --->
		<cfprocresult name="spr_StrategicGoals"  resultset="1">
		<cfprocresult name="spr_Questions"       resultset="2">
		<cfprocresult name="spr_NPA_PrgrOfficers"  resultset="3">
		<cfprocresult name="spr_FiscalYears"  resultset="4">
		<!--- --- --->
	</cfstoredproc>

	<cfwddx action="CFML2WDDX" input="#spr_StrategicGoals#"  output="client.sprWDDX_StrategicGoals">
	<cfwddx action="CFML2WDDX" input="#spr_Questions#"       output="client.sprWDDX_Questions">
	<cfwddx action="CFML2WDDX" input="#spr_NPA_PrgrOfficers#"   output="client.sprWDDX_NPA_PrgrOfficers">
	<cfwddx action="CFML2WDDX" input="#spr_FiscalYears#"   output="client.sprWDDX_FiscalYears">
<!--- ===================================================================== --->
<!--- <cfelseif  #strUser.SecurityUserRole# EQ "SA" >
	<cfstoredproc procedure="PACK_EVAL.sp_getGenericInfo" datasource="#client.DSN#" returncode="No">
		<!--- --- --->
		<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_StrategicGoals"  maxrows="-1" variable="IgnoreThis">
		<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_Questions"       maxrows="-1" variable="IgnoreThis">
		<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_NPA_PrgrOfficers"  maxrows="-1" variable="IgnoreThis">
		<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_FiscalYears"  maxrows="-1" variable="IgnoreThis">
		<!--- --- --->
		<cfprocresult name="spr_StrategicGoals"  resultset="1">
		<cfprocresult name="spr_Questions"       resultset="2">
		<cfprocresult name="spr_NPA_PrgrOfficers"  resultset="3">
		<cfprocresult name="spr_FiscalYears"  resultset="4">
		<!--- --- --->
	</cfstoredproc>

	<cfwddx action="CFML2WDDX" input="#spr_StrategicGoals#"  output="client.sprWDDX_StrategicGoals">
	<cfwddx action="CFML2WDDX" input="#spr_Questions#"       output="client.sprWDDX_Questions">
	<cfwddx action="CFML2WDDX" input="#spr_NPA_PrgrOfficers#"  output="client.sprWDDX_NPA_PrgrOfficers">
	<cfwddx action="CFML2WDDX" input="#spr_FiscalYears#"   output="client.sprWDDX_FiscalYears">
</cfif> --->




<!--- ********************************************************************* --->
<!--- ********************************************************************* --->
<!--- ********************************************************************* --->
<!--- <cfswitch expression="#strUser.SecurityUserRole#">
	<!--- ================================================================= --->
	<cfcase value="PO"> ---><!--- Program Officer --->
		<cfstoredproc procedure="PACK_EVAL.sp_getPersonalProjects" datasource="#client.DSN#" returncode="No">
			<cfprocparam type="In"  cfsqltype="CF_SQL_NUMERIC" variable="argPersonID" value="#strUser.PersonID#"  null="No">
			<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getPersonalProjects" maxrows="-1" variable="IgnoreThis">
			<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getAnswers"          maxrows="-1" variable="IgnoreThis">
				
			<cfprocresult name="spr_getPersonalProjects" resultset="1">
			<cfprocresult name="spr_getAnswers"          resultset="2">
		</cfstoredproc>
			
		<cfwddx action="CFML2WDDX" input="#spr_getPersonalProjects#" output="client.sprWDDX_getPersonalProjects">
		<cfwddx action="CFML2WDDX" input="#spr_getAnswers#"          output="client.sprWDDX_getAnswers">
		
	<!--- </cfcase> --->
	<!--- ================================================================= --->
	<!--- <cfcase value="BC"> ---><!--- Brench Chief --->
		<!--- 
		<cfstoredproc procedure="PACK_EVAL.sp_getPersonalProjects" datasource="#client.DSN#" returncode="No">
			<cfprocparam type="In"  cfsqltype="CF_SQL_NUMERIC" variable="argPersonID" value="#strUser.PersonID#"  null="No">
			<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getPersonalProjects" maxrows="-1" variable="IgnoreThis">
			<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getAnswers"          maxrows="-1" variable="IgnoreThis">
			
			<cfprocresult name="spr_getPersonalProjects" resultset="1">
			<cfprocresult name="spr_getAnswers"          resultset="2">	
		</cfstoredproc>
					
		<cfwddx action="CFML2WDDX" input="#spr_getPersonalProjects#" output="client.sprWDDX_getPersonalProjects">
		<cfwddx action="CFML2WDDX" input="#spr_getAnswers#"          output="client.sprWDDX_getAnswers">
		
	</cfcase>
	<!--- ================================================================= --->
	<cfcase value="DC"><!--- Division Cheif --->
	
	</cfcase>
	<!--- ================================================================= --->
	<cfcase value="SA"><!--- System Administrator --->
	
	</cfcase>
	<!--- ================================================================= --->

</cfswitch> --->
<!--- ********************************************************************* --->
<!--- <cfoutput>#spr_getPersonalProjects.recordCount#    #strUser.SecurityUserRole#    #strUser.UserFullName#</cfoutput><cfabort>  --->
<!--- 
<cfoutput>
spr_StrategicGoals = #spr_StrategicGoals.recordCount#<br>
spr_Questions = #spr_Questions.recordCount#<br>
spr_NPA_PrgrOfficers = #spr_StrategicGoals.recordCount#<br>
spr_FiscalYears = #spr_FiscalYears.recordCount#<br>
spr_getPersonalProjects = #spr_getPersonalProjects.recordCount#<br>
spr_getAnswers = #spr_getAnswers.recordCount#
</cfoutput>
<cfabort>
 --->
<cfwddx action="CFML2WDDX" input="#strUser#" output="client.strWDDXUser">

