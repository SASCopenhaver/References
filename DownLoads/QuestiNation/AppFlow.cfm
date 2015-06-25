<!--- <cfoutput>#URL.urlCase#</cfoutput><cfabort> --->
<cfif isDefined("URL.urlCase")>
    <cfset local.Case = #URL.urlCase#>
</cfif>

<cfif isDefined("client.Case")>
	<cfset local.Case = #client.Case#>
	<cfset temp = DeleteClientVariable("Case")>
</cfif>


<cfswitch expression="#local.Case#">
<!--- ********************************************************************* --->
    <cfcase value="Log In">
        <cfinclude template="SP_Call/nvo_selectAllOrgs.cfm">
        <cfinclude template="SP_Call/nvo_selectAllUsers.cfm">
        <cfset local.FileToGo = "LogIn.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="UserIsAuthenticated">
       <cfinclude template="strAppUser.cfm">
       
       <cfif #strAppUser.UserOrgID# EQ 0>
           <cfinclude template="SP_Call/nvo_selectAPPADMIN_Menu.cfm">
           <cfset local.Case = "Menu">
           <cfset local.FileToGo = "MenuForAPPADMIN.cfm">
       
	   <cfelse>
	       <cfinclude template="SP_Call/nvo_selectUSER_Menu.cfm">
           <cfset local.Case = "Menu">
           <cfset local.FileToGo = "MenuForUSER.cfm">
       </cfif>
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="Create Personal Profile">
        <cfset local.FileToGo = "EditorCreateNewUser.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="Update Personal Profile">
        <cfinclude template="strAppUser.cfm">
        <cfinclude template="SP_Call/nvo_InsUpdUsers.cfm">
        <cfset local.FileToGo = "EditorUser.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="Personal Profile">
        <cfset local.FileToGo = "EditorUser.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="Organization Editor">
        <cfinclude template="SP_Call/nvo_selectAllOrgs.cfm">
        <cfinclude template="SP_Call/nvo_selectAllUsers.cfm">
       <cfset local.FileToGo = "EditorOrgs.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="InsUpdOrgs">
        <cfinclude template="SP_Call/nvo_InsUpdOrgs.cfm">
        <cfinclude template="SP_Call/nvo_selectAllOrgs.cfm">
        <cfset local.Case = "Organization Editor">
		<cfset local.FileToGo = "EditorOrgs.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="APPADMINMenu">
	<!--- 
        <cfoutput>#isDefined("client.strWDDXAppUser")#</cfoutput>
        <br>
        <cfoutput>#GetClientVariablesList()#</cfoutput> 
        <cfabort>
     --->
       <cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
       
       <!--- <cfoutput>#strAppUser.UserOrgID#</cfoutput><cfabort> --->
       
       <cfinclude template="SP_Call/nvo_selectAPPADMIN_Menu.cfm">
       <cfset local.Case = "Menu">
       <cfset local.FileToGo = "MenuForAPPADMIN.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="USERMenu">
       <cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
       <cfinclude template="SP_Call/nvo_selectUSER_Menu.cfm">
       <cfset local.Case = "Menu">
       <cfset local.FileToGo = "MenuForUSER.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="Admin All Participants">
        <cfinclude template="SP_Call/nvo_selectAllOrgs.cfm">
        <cfinclude template="SP_Call/nvo_selectAllUsers.cfm">
        <cfset local.FileToGo = "EditorUsersByAPPADMIN.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="InsUpdUserProfile">
        <cfinclude template="strInsUpdUser.cfm">
        <cfinclude template="SP_Call/nvo_InsUpdUsersByAPPADMIN.cfm">
        <cfinclude template="SP_Call/nvo_selectAllUsers.cfm">
		<cfset local.Case = "User Profile">
        <cfset local.FileToGo = "EditorUsersByAPPADMIN.cfm">
    </cfcase>
<!--- ********************************************************************* --->   
    <cfcase value="Project Editor">
        <cfinclude template="SP_Call/nvo_selectProjsStatuses.cfm">
        <cfinclude template="SP_Call/nvo_selectAllActiveProjects.cfm">
        <cfset local.FileToGo = "EditorProjects.cfm">
    </cfcase>   
<!--- ********************************************************************* --->
    <cfcase value="InsUpdPrjs">
        <cfinclude template="SP_Call/nvo_InsUpdPrjs.cfm">
        <cfinclude template="SP_Call/nvo_selectProjsStatuses.cfm">
        <cfinclude template="SP_Call/nvo_selectAllActiveProjects.cfm">
		<cfset local.Case = "Project Editor">
        <cfset local.FileToGo = "EditorProjects.cfm">
    </cfcase>  
<!--- ********************************************************************* --->
    <cfcase value="Assign Participants">
				<!--- ADDed --->		
		<cfinclude template="SP_Call/nvo_selectAllOrgs.cfm">
		
        <cfinclude template="SP_Call/nvo_selectProjsStatuses.cfm">
        <cfinclude template="SP_Call/nvo_selectAllActiveProjects.cfm">
        <cfinclude template="SP_Call/nvo_selectAllUsers.cfm">
        <cfinclude template="SP_Call/nvo_selectUsersInTblAnswers.cfm">
        <cfinclude template="SP_Call/nvo_selectPrjManagers.cfm">
        <cfset local.FileToGo = "EditorAssignParticipants.cfm">
    </cfcase>   
<!--- ********************************************************************* --->   
    <cfcase value="InsUpdAssignedParts">
		<!--- ADDed --->		
		<cfinclude template="SP_Call/nvo_selectAllOrgs.cfm">
		
        <cfinclude template="SP_Call/nvo_InsUpdAssignedParts.cfm">
		
        <cfinclude template="SP_Call/nvo_selectProjsStatuses.cfm">
        <cfinclude template="SP_Call/nvo_selectAllActiveProjects.cfm">
        <cfinclude template="SP_Call/nvo_selectAllUsers.cfm">
        <cfinclude template="SP_Call/nvo_selectUsersInTblAnswers.cfm">
        <cfinclude template="SP_Call/nvo_selectPrjManagers.cfm">
		<cfset local.Case = "Assign Participants">
		<cfset local.FileToGo = "EditorAssignParticipants.cfm">
    </cfcase>    
<!--- ********************************************************************* --->
    <cfcase value="ProjectRequested">
        <cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
        <cfset client.PrjID = #FORM.s_UserPrjs#>
		<cfinclude template="SP_Call/nvo_selectQandA.cfm"> <!--- Questions and Assumed Answers --->
        <cfinclude template="SP_Call/nvo_selectUserAnswers.cfm">
		<cfinclude template="SP_Call/nvo_selectIfUserHasComments.cfm">
		<cfset local.Case = "Questionnaire">
        <cfset local.FileToGo = "Questionnaire.cfm">
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="InsUpdAnswers">
		<!--- START portion InsUpd Answers --->
		<cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
		<cfinclude template="SP_Call/nvo_InsUpdUserAnswers.cfm">
		<!--- END portion InsUpd Answers --->
		
		<!--- START portion re-retrievs updated information --->
		<cfinclude template="SP_Call/nvo_selectQandA.cfm">
		<cfinclude template="SP_Call/nvo_selectUserAnswers.cfm">
		<cfinclude template="SP_Call/nvo_selectIfUserHasComments.cfm">
		<cfset local.Case = "Questionnaire">
        <cfset local.FileToGo = "Questionnaire.cfm">
		<!--- END portion re-retrievs updated information --->
    </cfcase>
<!--- ********************************************************************* --->
    <cfcase value="Create Reports">
		<cfinclude template="SP_Call/nvo_selectPrjsForReport.cfm">
		<cfset local.FileToGo = "EditorReports.cfm">
  	</cfcase>
<!--- ********************************************************************* --->
    <cfcase value="DeletePrj">
		<!--- The following portion deletes Project --->
		<cfinclude template="SP_Call/nvo_deleteProject.cfm">
		
    	<!--- The following portion take users back to the Project Editor --->
		<cfset local.Case = "Project Editor">
		<cfset client.Case = "Project Editor">
		<cfset local.FileToGo = "AppFlow.cfm">
	</cfcase>
<!--- ********************************************************************* --->
    <cfcase value="Project Overview">
		<cfinclude template="SP_Call/nvo_selectPrjsForOverview.cfm">
		<cfset local.FileToGo = "EditorProjectOverview.cfm">
  	</cfcase>
<!--- ********************************************************************* --->
    <cfcase value="InsUpdArchive">
		<cfinclude template="SP_Call/nvo_InsUpdArchive.cfm">
		<cfset client.Case = "Project Overview">
		<cfset local.FileToGo = "AppFlow.cfm">
  	</cfcase>
<!--- ********************************************************************* --->
    <cfcase value="Report For Selected Projects">
		<cfinclude template="SP_Call/nvo_selectReportInfo.cfm">
		<cfset local.FileToGo = "Report.cfm">
  	</cfcase>
<!--- ********************************************************************* --->
    <cfcase value="E-Mail">
		<!--- 
		<cfinclude template="SP_Call/nvo_selectAllPrjsForEMail.cfm"> 
		<cfinclude template="SP_Call/nvo_selectAllUsersForEMail.cfm">
		<cfinclude template="SP_Call/nvo_selectPartsStatForEMail.cfm">
		 --->
		<!--- <cfinclude template="SP_Call/nvo_selectEmailMsg.cfm"> --->
		<cfset local.FileToGo = "EditorEMail.cfm">
  	</cfcase>
<!--- ********************************************************************* --->
    <cfcase value="InsUpdEmail">
		<cfinclude template="SP_Call/nvo_InsUpdEMail.cfm">
		<cfset client.Case = "E-Mail">
		<cfset local.FileToGo = "AppFlow.cfm">
  	</cfcase>

<!--- ********************************************************************* --->
    <cfcase value="SendEmail">
		<cfinclude template="EMail_Send.cfm">
		<cfset client.Case = "E-Mail">
		<cfset local.FileToGo = "AppFlow.cfm">
  	</cfcase>

<!--- ********************************************************************* --->
</cfswitch>

<cflocation url="Shell.cfm?#client.URLTOKEN#&urlFileToGoTo=#local.FileToGo#&urlModuleName=#local.Case#">