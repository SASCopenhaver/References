<!--- <cfoutput>#URL.urlController#</cfoutput><cfabort> ---> 
<cfswitch expression="#URL.urlController#">
<!--- --------------------------------------------------------------------- --->
	<cfcase value="SetUpUser">
		<cfinclude template="SP_Call/nvo_SetUpUser.cfm">
		<cflocation url="_Controller.cfm?#client.URLTOKEN#&urlController=Home"><!--- Maintenance --->
	</cfcase>
<!--- --------------------------------------------------------------------- --->
	<cfcase value="Home">
		<cfset client.ModuleName = "Home">
		<cfset client.FileToGoTo = "Home.cfm">
	</cfcase>
<!--- --------------------------------------------------------------------- --->
	<cfcase value="Maintenance">
		<cfset client.ModuleName = "Maintenance">
		<cfset client.FileToGoTo = "Maintenance.cfm">
	</cfcase>

<!--- --------------------------------------------------------------------- --->
	<cfcase value="Evaluation">
		<!--- <cfinclude template="SP_Call/nvo_getUserProjects.cfm"> --->
		<cfset client.ModuleName = "Personal Project Evaluation">
		<cfset client.FileToGoTo = "Evaluation.cfm">
	</cfcase>
<!--- --------------------------------------------------------------------- --->
	<cfcase value="BranchInfo">
		<!--- <cfinclude template="SP_Call/nvo_getBranchInfo.cfm"> --->
		<cfset client.ModuleName = "Branch Information">
		<cfset client.FileToGoTo = "BranchInfo.cfm">
	</cfcase>
<!--- --------------------------------------------------------------------- --->
	<cfcase value="InsUpdUserPrjEval">
		<cfinclude template="SP_Call/nvo_InsUpdUserPrjEval.cfm">
		<cflocation url="_Controller.cfm?#client.URLTOKEN#&urlController=Evaluation">
	</cfcase>
<!--- --------------------------------------------------------------------- --->
	<cfcase value="OfficeInfo">
		<!--- <cfinclude template="SP_Call/nvo_getDivisionInfo.cfm"> --->
		<cfset client.ModuleName = "Office Information">
		<cfset client.FileToGoTo = "OfficeInfo.cfm">
	</cfcase>
<!--- --------------------------------------------------------------------- --->
	<cfcase value="DivisionInfo">
		<!--- <cfinclude template="SP_Call/nvo_getListOfBranches.cfm"> --->
		<cfset client.ModuleName = "Division Information">
		<cfset client.FileToGoTo = "DivisionInfo.cfm">
	</cfcase>
<!--- --------------------------------------------------------------------- --->

<!--- --------------------------------------------------------------------- --->
<!--- 
	<cfcase value="">
		<cfset client.ModuleName = "">
		<cfset client.FileToGoTo = "">
	</cfcase>
	<!--- <script language="JavaScript">alert("")</script> --->
 --->
<!--- --------------------------------------------------------------------- --->
</cfswitch>




<cflocation url="Shell.cfm?#client.URLTOKEN#">