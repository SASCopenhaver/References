

<cfif isDefined("local.ModuleName")>
        <cfswitch expression="#local.ModuleName#">
        <!--- ********************************************************************* --->
            <cfcase value="Log In">
                <img src="Img/h_LogIn.jpg" alt="Log In" border="0">
            </cfcase>
        <!--- ********************************************************************* --->
            <cfcase value="Menu">
                <img src="Img/h_Menu.jpg" alt="Menu" border="0">
            </cfcase>
        <!--- ********************************************************************* --->
            <cfcase value="Update Personal Profile">
                <img src="Img/h_UpdatePersonalProfile.jpg" alt="Update Personal Profile"border="0">
            </cfcase>
        <!--- ********************************************************************* --->
            <cfcase value="Personal Profile">
                <img src="Img/h_UpdatePersonalProfile.jpg" alt="Update Personal Profile"border="0">
            </cfcase>
        <!--- ********************************************************************* --->
            <cfcase value="Organization Editor">
                <img src="Img/h_OrgEditor.jpg" alt="Organization Editor" border="0">
            </cfcase>
        <!--- ********************************************************************* --->
            <cfcase value="Admin All Participants">
                <img src="Img/h_AdminAllParticipants.JPG" alt="Admin All Participants" border="0">
            </cfcase>
        <!--- ********************************************************************* --->   
            <cfcase value="Project Editor">
                <img src="Img/h_Project.jpg" alt="Project Editor"border="0">
            </cfcase>   
        <!--- ********************************************************************* --->   
            <cfcase value="Assign Participants">
                <img src="Img/h_AssignParticipants.jpg" alt="" width="65" height="58" border="0">
				<!--- 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img src="Img/h_Super.jpg" border="0">
				 --->
            </cfcase>  
            <!--- ********************************************************************* --->   
            <cfcase value="Create Personal Profile">
                <img src="Img/h_CreatePersonalProfile.jpg" alt="Create Personal Profile"border="0">
            </cfcase> 
            <!--- ********************************************************************* --->   
            <cfcase value="Questionnaire">
                <img src="Img/h_Questionnaire.jpg" alt="Questionnaire"border="0">
            </cfcase>
			<!--- ********************************************************************* --->   
		    <cfcase value="Project Overview">
				<img src="Img/h_ProjectOverview.jpg" alt="Project Overview" border="0">
		  	</cfcase>
			<!--- ********************************************************************* --->   
		    <cfcase value="Create Reports">
				<img src="Img/h_CreateReport.jpg" alt="Create Reports" border="0">
		  	</cfcase>   
			<!--- ********************************************************************* --->
		    <cfcase value="Report For Selected Projects">
				<img src="Img/h_Report.jpg" alt="Create Reports" border="0">
		  	</cfcase> 
			<!--- ********************************************************************* --->  
		    <cfcase value="E-Mail">
				<img src="Img/h_EMail.JPG" alt="E-Mail" border="0">
		  	</cfcase> 
			<!--- ********************************************************************* --->      
</cfswitch>
    

    
</cfif> 
