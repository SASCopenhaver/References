<!--- _Controller.cfm  --->
<!--- <cfoutput>#URL.urlController#</cfoutput><cfabort> --->
<cfset local.Controller = #URL.urlController#>
<cfset local.Is_Numeric = IsNumeric(local.Controller)><!--- Answers: YES or NO --->

<cfswitch expression="#local.Is_Numeric#">
	<cfcase value="NO"><!--- local.Is_Numeric = NO --->
		<cfswitch expression="#local.Controller#">
		<!--- ........................................................................................................................... --->
			<cfcase value="InitialSetUp">
				<!--- ------------------------------- --->
				<cfset client.ControllerVars = "setAnonymusUser">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ------------------------------- --->
				<cfset client.ControllerDB = "getNavigation">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ------------------------------- --->
				<cfset client.CallPageID = 101>
				<cfinclude template="CFFunction/f_getCallFile.cfm">
				<!--- <cfoutput>#client.PageName# = #client.CallFile#</cfoutput><cfabort> --->
			</cfcase>
			<!--- ........................................................................................................................... --->
			<cfcase value="AuthenticateUser">
				<!--- ------------------------------- --->
				<cfset client.ControllerVars = "AuthenticateUser">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ------------------------------- --->
				<cfset client.ControllerDB = "AuthenticateUser">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ------------------------------- --->
				<cfif #local.vRecordCount# EQ "1">
					<cfset client.ControllerVars = "AuthenticatedUser">
					<cfinclude template="_ControllerVars.cfm">
					<!--- ------------------------------- --->
					<cfset client.ControllerDB = "getNavigation">
					<cfinclude template="_ControllerDB.cfm">
					<!--- ------------------------------- --->
					<cfset client.CallPageID = 101>
					<cfinclude template="CFFunction/f_getCallFile.cfm">
				<cfelse>
							<cfset client.MsgType = "ERROR">
							<cfset client.Msg = "Sorry,<br>Provided Name and Password were not authenticated.<br>Click 'OK' and try again.">
							<cfset client.CaseToCall = "LogIn"> 
							<cfset client.ModuleName = "Message">
							<cfset client.FileToGoTo = "ShowMsg.cfm">
					
					
				</cfif>
				
				
			
			</cfcase>
			<!--- ........................................................................................................................... --->
			<!--- ........................................................................................................................... --->
			<!--- ........................................................................................................................... --->
			<!--- ........................................................................................................................... --->
			<!--- ........................................................................................................................... --->
			<!--- ........................................................................................................................... --->
			<cfdefaultcase></cfdefaultcase>
		<!--- ........................................................................................................................... --->
		</cfswitch><!--- End local.Controller --->
	 
	</cfcase><!--- local.Is_Numeric = NO --->
	<!--- ------------------------------------------------------------------------------------------------ --->
	<!--- ------------------------------------------------------------------------------------------------ --->
	<!--- The following part is when Security Tree Item ID is passed --->
	<cfcase value="YES">
		<!--- ------------------------------- --->
		<cfif #local.Controller# EQ "1001">
			<cfset client.ControllerVars = "setAnonymusUser">
			<cfinclude template="_ControllerVars.cfm">
		</cfif>
		<!--- ------------------------------- --->
		<cfset client.ControllerDB = "getNavigation">
		<cfinclude template="_ControllerDB.cfm">
		<!--- ------------------------------- --->
		<cfset client.CallPageID = #local.Controller#>
		<cfinclude template="CFFunction/f_getCallFile.cfm">
		<!--- ------------------------------- --->
		<!--- <cfset local.CallFile = #Left(client.CallFile,4)#> --->
		<cfswitch expression="#client.CallFile#">
			<cfcase value="EditUSER.cfm">
				<cfset client.ControllerDB = "getEditUser">
				<cfinclude template="_ControllerDB.cfm">
			</cfcase>
			<cfcase value="EditROLE.cfm">
				<cfset client.ControllerDB = "getEditRole">
				<cfinclude template="_ControllerDB.cfm">
			</cfcase>
		
			<cfdefaultcase>
			
			</cfdefaultcase>
		</cfswitch>
		<!--- ------------------------------- --->
		<!--- <cfoutput>#client.CallFile#</cfoutput><cfabort> --->
	</cfcase>
	<!--- ------------------------------------------------------------------------------------------------ --->
	<!--- ------------------------------------------------------------------------------------------------ --->
	<cfdefaultcase></cfdefaultcase>
</cfswitch>
<cflocation url="#client.CallFile#">