<!--- _Controller.cfm  --->
<!--- <cfoutput>#URL.urlController#</cfoutput><cfabort> --->
<cfset local.Controller = #URL.urlController#>
<cfset local.Is_Numeric = #IsNumeric(local.Controller)#><!--- Answers: YES or NO --->

<cfif local.Is_Numeric EQ "NO">
		<!--- ------------------------------------- --->
		<cfif local.Controller EQ "AuthenticateUser">
			<cfset client.ControllerDB = "AuthenticateUser">
			<cfinclude template="_ControllerDB.cfm">
			<!--- --- --->
			<cfif client.Usr_Is_Act EQ "A"><!--- Active User --->
				<cflocation url="_Controller.cfm?urlController=101" addtoken="yes">
			</cfif>
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "EDIT_ROLE">
			<cfset client.app_role_id = #FORM.h_app_role_id#>
			<cfset client.CallFile = "EditROLE_p2.cfm">
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "InsUpdRole">
			<cfset local.app_role_id = #FORM.h_app_role_id#>
			<cfset local.app_role_nm = #FORM.txt_app_role_nm#> 
			<cfset local.app_role_desc = #FORM.txt_app_role_desc#> 
			<cfset local.app_role_super_id = #FORM.ddlb_app_role_super_id#>
			<cfset local.ValsFromRadioButtons = #FORM.h_ValsFromRadioButtons#>
			<!--- --- --->
			<cfset client.ControllerDB = "InsUpdRole">
			<cfinclude template="_ControllerDB.cfm">
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "ADD_NEW_ROLE">
			<cfset client.app_role_id = #FORM.h_app_role_id#>
			<cfset client.CallFile = "EditROLE_p2.cfm">
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "DELETE_ROLE">
			<cfset client.app_role_id = #FORM.h_app_role_id#>
			<!--- ... --->
			<cfset client.ControllerDB = "DELETE_ROLE">
			<cfinclude template="_ControllerDB.cfm">
			<!--- ... --->
			<cflocation url="_Controller.cfm?urlController=302">
		<!--- ------------------------------------- --->
		
		<cfelseif local.Controller EQ "getAuthAgent"> 
		
			<cfset client.ControllerVars = "getAuthAgent">
			<cfinclude template="_ControllerVars.cfm">
			<!--- ... --->
			<cfset client.ControllerDB = "getAuthAgent">
			<cfinclude template="_ControllerDB.cfm">
			<!--- ... --->
			<cfset client.ControllerVars = "setAuthAgentVars">
			<cfinclude template="_ControllerVars.cfm">
			<!--- ... --->
			<cfset client.PageName = "New User Registration">
			<cfset client.CallFile = "NewUserRegistration_p3.cfm">
		
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "BackToNewUserRegistration">
			<cfset client.vBack = "Back">
			<cfset client.PageName = "New User Registration">
			<cfset client.CallFile = "NewUserRegistration_p2.cfm">
		
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "get_USR_Pass">
			<cfset client.ControllerVars = "get_USR_Pass">
			<cfinclude template="_ControllerVars.cfm">
			<!--- ... --->
			<cfset client.ControllerDB = "get_USR_Pass">
			<cfinclude template="_ControllerDB.cfm">
			<!--- ... --->
			<cfset local.vRecordCount = #spr_get_USR_Pass.recordCount#>
			<!--- <cfoutput>#local.vRecordCount#</cfoutput><cfabort> --->
			<!--- ... --->
			<cfif local.vRecordCount EQ 0>
				<cfset client.MsgTxt = "Sorry, system could not identify you based on provided information.<br>Please try again.">
				<cfset client.ValForButton = "1003">
				<cfset client.PageName = "Error">
				<cfset client.CallFile = "ShowMsg.cfm">
			<cfelse>
				<cfinclude template="SendPass.cfm">
				<cfset client.MsgTxt = "Your request is processed.<br>Please check your e-mail.<br>Password will be received shortly.">
				<cfset client.ValForButton = "1001">
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			</cfif>
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "get_NUR_User">
			<cfset client.NUR_Usr_Email = #FORM.txt_NUR_Usr_Email#>
			<!--- ... --->
			<cfset client.ControllerDB = "get_NUR_UserIdAndStatus">
			<cfinclude template="_ControllerDB.cfm">
			<!--- ... --->
			<!--- <cfoutput>#spr_NUR_UserIDAndStatus.recordCount#</cfoutput><cfabort> --->
			<cfif spr_NUR_UserIDAndStatus.recordCount EQ "0">
				<!--- ... --->
				<cfset client.ControllerVars = "set_NUR_DefaultVars">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ... --->
				<cfset client.PageName = "New User Registration">
				<cfset client.CallFile = "NewUserRegistration_p2.cfm">
				<!--- ... --->
			<cfelse>
				 <!--- <cfoutput>#spr_NUR_UserIDAndStatus.recordCount#</cfoutput><cfabort> --->
				 <cfset client.NUR_Usr_ID = #spr_NUR_UserIDAndStatus.usr_cd#>
				 <cfset client.NUR_Usr_IsAct = #spr_NUR_UserIDAndStatus.usr_is_act#>
				
				 <!--- <cfoutput>#client.NUR_Usr_ID#  #client.NUR_Usr_IsAct#</cfoutput><cfabort>  --->
				
				 <!--- ... --->
				 <cfif client.NUR_Usr_IsAct EQ "I">
					<!--- ... --->
					<cfset client.ControllerDB = "get_NUR_Usr_PreReg">
					<cfinclude template="_ControllerDB.cfm">
					<!--- ... --->
					<cfset client.ControllerVars = "get_NUR_Usr_PreReg">
					<cfinclude template="_ControllerVars.cfm">
					<!--- ... --->
					<cfset client.PageName = "New User Registration">
					<cfset client.CallFile = "NewUserRegistration_p2.cfm">
					<!--- ... --->
				<cfelseif client.NUR_Usr_IsAct EQ "H"
						  OR
						  client.NUR_Usr_IsAct EQ "A"
						  OR
						  client.NUR_Usr_IsAct EQ "N">
					<cfset client.MsgTxt = "Your name is in the system.  Registration process cannot be repeated twice.<br>Your authorization will be sent via e-mail shortly.">
					<cfset client.ValForButton = "1001">
					<cfset client.PageName = "Information">
					<cfset client.CallFile = "ShowMsg.cfm">
				</cfif>
			</cfif>
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "InsUpdNewUserRegistration">
				<cfset client.ControllerVars = "InsUpdNewUserRegistration">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ... --->
				<cfset client.ControllerDB = "InsUpdNewUserRegistration">
				<cfinclude template="_ControllerDB.cfm">
				<cfset client.NUR_Usr_Pass = "">
				<cfset client.NUR_Usr_Confrm_Pass = "">
				<!--- ... --->
				<cfset client.vSubmitted = "YES">
				<!--- ... --->
				<!--- <cfset client.MsgTxt = "Thank you for submitting your information.<br>Your account will be activated shortly.<br>Check your e-mail for update."> --->
				<cfset client.MsgTxt = "Thank you for submitting your information.<br>Within 2 business days you should receive an email on your OpenNet account notifying you that your database registration has been activated.">
				
				<cfset client.ValForButton = "1001">
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "UserIsNotAuthenticated">
				<cfset client.MsgTxt = "Sorry, provided 'User Name' and  'Password' were not authenticated by the system.<br>Click on button 'OK' and try again<br>or contact Administrator at SurikovAX@state.gov.">
				<cfset client.ValForButton = "1001">
				<cfset client.PageName = "Error">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "UserProfile">
				<!--- GA - Grant Access --->
				<cfset client.GA_UsrID = #FORM.h_GA_UsrID#>
				<cfset client.ListType = #FORM.h_ListType#>
				<!--- ... --->
				<cfset client.PageName = "User Profile">
				<cfset client.CallFile = "UserProfile_p1.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "RemoveUsr">
				<cfset local.UsrID = #FORM.h_GA_UsrID#>
				<cfset client.ControllerDB = "RemoveUsr">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ... --->
				<cfset client.MsgTxt = "Selected user was permanently removed from the system.">
				<cfset client.ValForButton = "202">
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "ApprvUsr">
				<cfset local.UsrID = #FORM.h_GA_UsrID#>
				<cfset client.ControllerDB = "ApprvUsr">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ... --->
				<cfset client.MsgTxt = "Selected user is approved.">
				<cfset client.ValForButton = #client.CallPageID#>
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "Upd_H">
				<cfset local.UP_UsrIsAct = "H">
				<cfset local.UP_UsrID = #FORM.h_GA_UsrID#>
				<cfset local.UP_UsrPrfx = #FORM.ddlb_GA_Usr_Prfx#>
				<cfset local.UP_UsrFName = #FORM.txt_GA_Usr_FName#>
				<cfset local.UP_UsrMI = #FORM.txt_GA_Usr_MI#>
				<cfset local.UP_UsrLName = #FORM.txt_GA_Usr_LName#>
				<cfset local.UP_UsrPhone = #FORM.txt_GA_Usr_Phone#>
				<cfset local.UP_UsrExt = #FORM.txt_GA_Usr_Ext#>
				<cfset local.UP_UsrEmail = #FORM.txt_GA_Usr_Email#>
				<cfset local.UP_UsrName = #FORM.txt_GA_Usr_UserName#>
				<cfset local.UP_UsrPass = #FORM.txt_GA_Usr_Pass#>
				<cfset local.UP_UsrRoleID = #FORM.ddlb_GA_Usr_AlumniArchiveRole_ID#>
				
				 <cfif local.UP_UsrRoleID EQ "242" OR local.UP_UsrRoleID EQ "306">
					 <cfset local.UP_UsrDepartDT = #UCASE(DateFormat(FORM.txt_h_GA_Depart_Dt, "d-MMM-yyyy"))#>
				 <cfelse>
					 <cfset local.UP_UsrDepartDT = "">
				 </cfif>
				 
				<cfset local.UP_UsrCntryOfAssgnCD = #FORM.ddlb_GA_Usr_CountryOfAssignmt_CD#>
				<cfset local.UP_UsrCityPostNM = #FORM.ddlb_GA_Usr_CityPostOfAssignmt#>
				<!--- ...................... --->
				<cfif local.UP_UsrCntryOfAssgnCD EQ "US">
					<cfset local.UP_UsrOfficeCodeCD = #FORM.ddlb_GA_Usr_DOS_OfficeCode_CD#>
				<cfelse>
					<cfset local.UP_UsrOfficeCodeCD = "">
				</cfif>
				<!--- ...................... --->
				<cfif local.UP_UsrCntryOfAssgnCD NEQ "US">
					<cfset local.UP_UsrAddnlCntryCD = #FORM.ddlbm_GA_Usr_AddnlCountry#>
				<cfelse>
					<cfset local.UP_UsrAddnlCntryCD = "*">
				</cfif>
				<!--- ...................... --->
				<cfset local.UP_UsrComments = #FORM.txta_GA_Usr_Comments#>

				
				<cfset client.ControllerDB = "UpdUsrInfo">
				<cfinclude template="_ControllerDB.cfm">
				
				<!--- ------------------------------- --->
				<cfset client.MsgTxt = "User information is updated.">
				<cfset client.ValForButton = #client.CallPageID#>
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "InsUpdCustomSearch">
				<cfset client.CS_Search_Nm = #FORM.txt_CS_Search_Nm#> 
				<cfset client.CS_Search_ID = #FORM.h_CS_Search_ID#>
				<cfset client.ControllerDB = "InsUpdCustomSearch">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ------------------------------- --->
				<cfset client.ControllerDB = "getCustomSearch">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ------------------------------- --->
				<cfset client.ControllerVars = "updateVars">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ------------------------------- --->
				<cfset client.MsgTxt = "Custom Search had been saved.">
				<cfset client.ValForButton = "203">
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "delCustomSearch">
				<!--- 
				<cfset client.ControllerVars = "getValsFromPage_BSC">
				<cfinclude template="_ControllerVars.cfm">
				------------------------------- --->
				<cfset client.CS_Search_ID = #FORM.h_CS_Search_ID#>
				<cfset client.ControllerDB = "delCustomSearch">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ------------------------------- --->
				<cfset client.ControllerVars = "defineVarsForCustSearch">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ------------------------------- --->
				<cfset client.MsgTxt = "Custom Search had been deleted.">
				<cfset client.ValForButton = "102">
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "doCustomSearch">
				<!--- ---- --->
				<cfset client.ControllerVars = "doCustomSearch">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ---- --->
				<cfinclude template="inc/inc_createSQLstatment.cfm">
				<!--- ---- --->
						<cfset client.ControllerDB = "execSQL_SelectCount">
						<cfinclude template="_ControllerDB.cfm">
						
						<cfset client.SelectCount = #spr_execSQL_SelectCount.csrc_counter#>
						<!--- <cfoutput>#client.SelectCount#</cfoutput><cfabort> --->

						<cfif #client.SelectCount# EQ "0"><!--- client.SelectCount is created in inc_createSQLstatment.cfm --->
							<cfset client.MsgTxt = "Sorry, this search brings "&#client.SelectCount#&" records.<br>Please re-define your search criteria.">
							<!--- <cfset client.ValForButton = "203"> --->
							<cfset client.ValForButton = "backToSearchCriteria">
							<cfset client.PageName = "Information">
							<cfset client.CallFile = "ShowMsg.cfm">
						
						<cfelseif #client.SelectCount# GT "500">
							<cfset client.MsgTxt = "Sorry, this search brings "&#client.SelectCount#&" records.<br>Please re-define your search criteria.">
							<!--- <cfset client.ValForButton = "102"> --->
							<cfset client.ValForButton = "backToSearchCriteria">
							<cfset client.PageName = "Information">
							<cfset client.CallFile = "ShowMsg.cfm">
						
						<cfelseif #client.SelectCount# GT "0" AND #client.SelectCount# LT "500">
							<!--- --- --->
							<cfset client.ControllerDB = "execSQL">
							<cfinclude template="_ControllerDB.cfm">
							 <!--- --- --->
							<cfset client.RecordsFound = "0">
							<cfset client.SelectedRecordFrom = "1">
							<cfset client.Increment = "24">
							<cfset client.RecordsShownOnPage = "25">
							<!--- --- --->
							<cfset client.PageName = "Search Results">
							<cfset client.CallFile = "SearchResults_p1.cfm">
							<!--- --- --->
						</cfif>
						<!--- <cfset local.delClientVar = DeleteClientVariable("SelectCount")>  --->
					<!--- ---- --->
			<!--- ------------------------------------- --->
			
			
			<cfelseif local.Controller EQ "backToSearchCriteria">
				<cfset client.CS_SetDefault = "NO">
				<cfset client.ShowHideSavedSearches = "SHOW">
				<!--- <cflocation url="_Controller.cfm?urlController=203" addtoken="yes"> --->
				<!--- --- --->
				<cfset client.PageName = "UPDATE ALUMNI INFO">
				<cfset client.CallFile = "Search_p1.cfm">
				<!--- --- --->
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "getAlumniRecord">
				<cfset client.AP_AlmnID = #FORM.h_AlmnID#>
				<!--- --- --->
				<cfset client.PageName = "Alumni Profile">
				<cfset client.CallFile = "AlumniRecord_p1.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "backToSearchResults">
				<!--- --- --->
				<cfset client.ControllerDB = "execSQL">
				<cfinclude template="_ControllerDB.cfm">
				 <!--- --- --->
				<cfset client.RecordsFound = "0">
				<cfset client.SelectedRecordFrom = "1">
				<cfset client.Increment = "24">
				<cfset client.RecordsShownOnPage = "25">
				<!--- --- --->
				<cfset client.PageName = "Search Results">
				<cfset client.CallFile = "SearchResults_p1.cfm">
				<!--- --- --->
			<!--- ------------------------------------- --->
			<!--- 
			<cfelseif local.Controller EQ "basicCustomSearchFromAlmnProfile">
				<cfif #client.SelectCount# EQ "0">
					<cfset client.MsgTxt = "Sorry, this search brings 0 records.<br>Please re-define your search criteria.">
					<cfset client.ValForButton = "203">
					<cfset client.PageName = "Information">
					<cfset client.CallFile = "ShowMsg.cfm">
				<cfelseif #client.SelectCount# GT "501">
					<cfset client.MsgTxt = "Sorry, this search brings "&#client.SelectCount#&" records.<br>Please re-define your search criteria.">
					<cfset client.ValForButton = "203">
					<cfset client.PageName = "Information">
					<cfset client.CallFile = "ShowMsg.cfm">
				<cfelseif #client.SelectCount# GT "0" AND #client.SelectCount# LT "501">
					<cfoutput>#client.basicCS_SQLstatement#</cfoutput><cfabort>
					<cfset client.ControllerDB = "execSQL">
					<cfinclude template="_ControllerDB.cfm">
					
					<cfset client.RecordsFound = "0">
					<cfset client.SelectedRecordFrom = "1">
					<cfset client.Increment = "24">
					<cfset client.RecordsShownOnPage = "25">
					
					<cfset client.PageName = "Search Results">
					<cfset client.CallFile = "SearchResults_p1.cfm">
				</cfif>
			--->
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "UpdateAlmnRecord">
				<!--- ... --->
				<cfset client.ControllerDB = "UpdateAlmnRecord">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ... --->
				<cfset client.PageName = "Alumni Profile">
				<cfset client.CallFile = "AlumniRecord_p1.cfm">
				<!--- ... --->
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "UpdAlmnRec_BackToSearchReslt">
				<!--- ... --->
				<cfset client.ControllerDB = "UpdateAlmnRecord">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ... 
				backToSearchResults
				 ... --->
				<!--- --- --->
				<cfset client.ControllerDB = "execSQL">
				<cfinclude template="_ControllerDB.cfm">
				 <!--- --- --->
				<cfset client.RecordsFound = "0">
				<cfset client.SelectedRecordFrom = "1">
				<cfset client.Increment = "24">
				<cfset client.RecordsShownOnPage = "25">
				<!--- --- --->
				<cfset client.PageName = "Search Results">
				<cfset client.CallFile = "SearchResults_p1.cfm">
				<!--- --- --->
				<!--- ... --->
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "getTextEditor">
				<cfset client.TE_PageID = #FORM.h_PageID#>  
				<cfset client.TE_PageNm = #FORM.h_PageNm#>
				<cfset client.TE_TxtType = #FORM.ddlb_TextType#><!--- <cfoutput>#client.TE_PageID#<br>#client.TE_PageNm#<br>#client.TE_TxtType#</cfoutput><cfabort> --->
				<!--- --- --->
				<cfset client.PageName = "Text Editor">
				<cfset client.CallFile = "EditText_p2.cfm">
				<!--- --- --->
			
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "getAdvancedSearch">
				<!--- --- --->
				<cfset local.SearchForPageId  = #FORM.h_PageId#>
				<cfset local.SearchForPageNm  = #FORM.h_PageNm#>
				<cfset local.SearchForFile    = #FORM.h_PageFileNm#>
				<!--- --- --->
				<cfset client.PageName = "Search To "&#local.SearchForPageNm#>
				<cfset client.CallFile = "AdvancedSearch_p1.cfm">
				<!--- --- --->
		
			<!--- ------------------------------------- --->
		    </cfif>


<cfelseif local.Is_Numeric EQ "YES">
		<!--- ------------------------------- --->
		<cfif local.Controller GT "1000"><!--- <cfif #local.Controller# EQ "1001" OR #local.Controller# EQ "1002"> --->
			<cfset client.ControllerVars = "setAnonymusUser">
			<cfinclude template="_ControllerVars.cfm">
		</cfif>
		<!--- ------------------------------- --->
		<cfif local.Controller EQ "102">
			<cfset client.CS_SetDefault = "YES">
		</cfif>
		<!--- ------------------------------- --->
		<cfset client.ControllerDB = "getNavigation">
		<cfinclude template="_ControllerDB.cfm">
		<!--- ------------------------------- --->
		<cfset client.CallPageID = #local.Controller#>
		<cfinclude template="CFFunction/f_getCallFile.cfm">
		<!--- ------------------------------- --->
		
		
</cfif>
<!--- <cfoutput>#client.CallFile#</cfoutput><cfabort> --->
<cflocation url="#client.CallFile#" addtoken="yes">