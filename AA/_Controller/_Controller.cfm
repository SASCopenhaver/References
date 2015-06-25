<!--- _Controller.cfm  --->
<!--- <cfoutput>#URL.urlController#</cfoutput><cfabort> --->

<cfset local.Controller = URL.urlController>
<cfset local.Is_Numeric = IsNumeric(local.Controller)><!--- Answers: YES or NO --->

<cfif local.Is_Numeric EQ "NO">
		<!--- ------------------------------------- --->
		<cfif local.Controller EQ "AuthenticateUser">
			<cfset client.ControllerDB = "AuthenticateUser">
			<cfinclude template="_ControllerDB.cfm">
			<!--- --- --->
			<cfif client.Usr_Is_Act EQ "A" OR client.Usr_Is_Act EQ "H"><!--- Active User --->
				<cflocation url="_Controller.cfm?urlController=101" addtoken="yes">
			</cfif>
		
		<!--- ------------------------------------- --->
		
		
		<cfelseif local.Controller EQ "index_cfm">
			
			<cfinclude template="inc/inc_DeleteClientVariable.cfm">
			<cflocation url="index.cfm" addtoken="no">
		
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "EDIT_ROLE">
			<cfset client.app_role_id = FORM.h_app_role_id>
			<cfset client.CallFile = "EditROLE_p2.cfm">
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "InsUpdRole">
			<cfset local.app_role_id = FORM.h_app_role_id>
			<cfset local.app_role_nm = FORM.txt_app_role_nm> 
			<cfset local.app_role_desc = FORM.txt_app_role_desc> 
			<cfset local.app_role_super_id = FORM.ddlb_app_role_super_id>
			<cfset local.ValsFromRadioButtons = FORM.h_ValsFromRadioButtons>
			<!--- --- --->
			<cfset client.ControllerDB = "InsUpdRole">
			<cfinclude template="_ControllerDB.cfm">
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "ADD_NEW_ROLE">
			<cfset client.app_role_id = FORM.h_app_role_id>
			<cfset client.CallFile = "EditROLE_p2.cfm">
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "DELETE_ROLE">
			<cfset client.app_role_id = FORM.h_app_role_id>
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
			<cfset local.vRecordCount = spr_get_USR_Pass.recordCount>
			<!--- <cfoutput>#local.vRecordCount#</cfoutput><cfabort> --->
			<!--- ... --->
			<cfif local.vRecordCount EQ 0>
				<cfset client.MsgTxt = "Sorry, system could not identify you based on provided information.<br>Please try again or contact Database Administrator by sending e-mail to<br>AlumniArchive@state.gov">
				<cfset client.ValForButton = "1003">
				<cfset client.PageName = "Error">
				<cfset client.CallFile = "ShowMsg.cfm">
			<cfelse>
				<cfset local.SendTo = spr_get_USR_Pass.usr_email>
				<cfset local.SendFrom = "AlumniArchive@state.gov;">
				<cfset local.Subject = "Alumni Archive password request">
				<cfset local.Msg = "Dear #spr_get_USR_Pass.usr_pfx# #spr_get_USR_Pass.usr_fname# #spr_get_USR_Pass.usr_mi# #spr_get_USR_Pass.usr_lname#.  
The following is your password: #spr_get_USR_Pass.usr_pass#">
				<cfinclude template="SendMail.cfm">
				<cfset client.MsgTxt = "Your request is processed.<br>Please check your e-mail.<br>Password will be received shortly.">
				<cfset client.ValForButton = "1001">
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			</cfif>
			
			
		<!--- ------------------------------------- --->
		<cfelseif local.Controller EQ "get_NUR_User">
		
		
		<!--- <cfinclude template="SendMail.cfm"> --->
		
			<cfset client.NUR_Usr_Email = FORM.txt_NUR_Usr_Email>
			<!--- ... --->
			<cfset client.ControllerDB = "get_NUR_UserIdAndStatus">
			<cfinclude template="_ControllerDB.cfm">
			<!--- ... --->
			<!---  <cfoutput>#spr_NUR_UserIDAndStatus.recordCount#</cfoutput><cfabort> --->
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
				 <cfset client.NUR_Usr_ID = spr_NUR_UserIDAndStatus.usr_cd>
				 <cfset client.NUR_Usr_IsAct = spr_NUR_UserIDAndStatus.usr_is_act>
				
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
						  client.NUR_Usr_IsAct EQ "W"
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
				<!--- ... --->
				<!--- <cfset client.NUR_Usr_Pass = "">
				<cfset client.NUR_Usr_Confrm_Pass = ""> --->
				<!--- ... --->
				<cfset client.vSubmitted = "YES">
				<!--- ... --->
				<cfif #client.NUR_Usr_Depart_Dt# NEQ "">
						<cfset local.NUR_Usr_Depart_Dt = UCASE(DateFormat(client.NUR_Usr_Depart_Dt, "dd-MMM-yyyy"))>
				<cfelse>
						<cfset local.NUR_Usr_Depart_Dt = "">
				</cfif>
				<cfset local.NUR_Usr_Prfx = "">
				<!---<cfif #client.NUR_Usr_Prfx# NEQ "-1">
					<cfset local.NUR_Usr_Prfx = client.NUR_Usr_Prfx>
				<cfelse>
					<cfset local.NUR_Usr_Prfx = "">
				</cfif>--->

				<cfif #client.NUR_Usr_Prfx# EQ "-1">
					<cfset local.NUR_Usr_Prfx = "">
				<cfelse>
					<cfset local.NUR_Usr_Prfx = client.NUR_Usr_Prfx>
				</cfif>
				<cfset local.NUR_DOS_OfficeCode_CD = "">
				<cfif #client.NUR_DOS_OfficeCode_CD# EQ "-1">
						<cfset local.NUR_DOS_OfficeCode_CD = "">
				<cfelse>
				       	<cfset local.NUR_DOS_OfficeCode_CD = client.NUR_DOS_OfficeCode_CD>
				</cfif>

				<!--- E-Mail received by NewUser --->
				<cfset local.SendTo = client.NUR_Usr_Email>
				<cfset local.SendFrom = "AlumniArchive@state.gov;">
				<cfset local.Subject = "Alumni Archive registration confirmation">
				<cfset local.Msg = "Dear #local.NUR_Usr_Prfx# #client.NUR_Usr_FName# #client.NUR_Usr_MI# #client.NUR_Usr_LName#,
Thank you for submitting the following information to be registered on Alumni Archive website: 
								   	
Prefix: #local.NUR_Usr_Prfx#
First Name: #client.NUR_Usr_FName#
Middle Name: #client.NUR_Usr_MI#
Last Name: #client.NUR_Usr_LName#
Phone: #client.NUR_Usr_Phone#
Ext.: #client.NUR_Usr_Ext#
Email: #client.NUR_Usr_Email#
Login Name: #client.NUR_Usr_UserName#
Password: #client.NUR_Usr_Pass#
Role: #client.NUR_Usr_AlumniArchiveRole_NM#	
Question: #client.NUR_Usr_SecQ_Txt#
Answer: #client.NUR_Usr_Answer#
Estimated Departure Date: #local.NUR_Usr_Depart_Dt#
Country of Assignment: #client.NUR_Usr_CountryOfAssignmt_NM#
Post: #client.NUR_Usr_CityPostOfAssignmt_NM#	
Office: #local.NUR_DOS_OfficeCode_CD#
Additional Countries: #client.NUR_Usr_AddnlCountries_NM#
Comments: #client.NUR_Usr_Comments#

Within 2 business days you should receive an e-mail on your OpenNet account notifying about the status of your registration.
				
Please contact your Authorizing Agent #client.NUR_AuthAgnt_FullName# in case of any delay:
Phone: #client.NUR_AuthAgnt_Phone# 
Ext:   #client.NUR_AuthAgnt_Ext# 
Email: #client.NUR_AuthAgnt_Email#.">
				
				<cfinclude template="SendMail.cfm">

				<!--- ... --->
				<!---  
				'0' -active auth agent exists; 
				'-1' - neither active nor inactive auth agent exists; 
				'ID' - no active auth agent exists, only inactive one
 				--->
				<cfif client.NUR_InactAuthAgnt_ID EQ "0">
						<!--- no email to the inactive auth agent needed because auth agent is active--->
						<!--- E-Mail received by active Auth Agent --->
						<cfset local.SendTo = client.NUR_AuthAgnt_Email>
						<cfset local.SendFrom = "AlumniArchive@state.gov;">
						<cfset local.Subject = "Alumni Archive access request">
						<cfset local.Msg = "Dear #client.NUR_InactAuthAgnt_FullName#,

#local.NUR_Usr_Prfx# #client.NUR_Usr_FName# #client.NUR_Usr_MI# #client.NUR_Usr_LName# has requested an access to the ECA Alumni Archive.  Only PAOs or Office Directors can approve access to the Archive.  In order to approve, deny or place on hold #client.NUR_Usr_Prfx# #client.NUR_Usr_LName#'s request, please go to alumniarchive.state.gov via an OpenNet computer and click on and click on ADMIN/ Verify and Change Users. If you need assistance please contact us at alumniarchive.state.gov. Thank you for understanding that we must follow these clearance processes as the Archive contains personal information.

Best Regards,

Alla Surikov 
Data Manager 
Office of Policy and Evaluation 
Bureau of Educational and Cultural Affairs 
U.S. Department of State 
E-mail: SurikovAX@state.gov 
Tel: 202.453.8796 
Fax: 202.453.8821">
						<cfinclude template="SendMail.cfm">
						<!--- ... --->

				
				<cfelseif client.NUR_InactAuthAgnt_ID GT "0">
				
				
				
						<!--- E-Mail received by  Admin--->
						<cfset local.SendTo = client.NUR_AuthAgnt_Email>
						<cfset local.SendFrom = "AlumniArchive@state.gov;">
						<cfset local.Subject = "Alumni Archive access request">
<cfset local.Msg = "#local.NUR_Usr_Prfx# #client.NUR_Usr_FName# #client.NUR_Usr_MI# #client.NUR_Usr_LName#	has requested an access to Alumni Archive.

Country of Assignment: #client.NUR_Usr_CountryOfAssignmt_NM#
Post: #client.NUR_Usr_CityPostOfAssignmt_NM#	
Office: #local.NUR_DOS_OfficeCode_CD#
Additional Countries: #client.NUR_Usr_AddnlCountries_NM#
Comments: #client.NUR_Usr_Comments#

#client.NUR_InactAuthAgnt_Role_Nm# #client.NUR_InactAuthAgnt_FullName# is pre-registered and has to be contacted to approve the user.
#client.NUR_InactAuthAgnt_Phone# Ext. #client.NUR_InactAuthAgnt_Ext# 
#client.NUR_InactAuthAgnt_Email#">
						<cfinclude template="SendMail.cfm">
						<!--- ... --->
				
			
						<!--- E-Mail received by inactive Auth Agent --->
						<cfset local.SendTo = client.NUR_InactAuthAgnt_Email>
						<cfset local.SendFrom = "AlumniArchive@state.gov;">
						<cfset local.Subject = "Alumni Archive access request">
						<cfset client.PathAndAttachment = "ATTACH">
<cfset local.Msg = "Dear #client.NUR_InactAuthAgnt_FullName#,
	
#local.NUR_Usr_Prfx# #client.NUR_Usr_FName# #client.NUR_Usr_MI# #client.NUR_Usr_LName# has requested an access to the ECA Alumni Archive.  Only PAOs or Office Directors can approve access to the Archive.  In order to approve, deny or place on hold #client.NUR_Usr_Prfx# #client.NUR_Usr_LName#'s request, please go to alumniarchive.state.gov via an OpenNet computer and click on New User Registration and follow the prompts to register yourself.  Within 24 hours you will be approved and will then be able to go the Admin section of the Archive to approve deny or place on hold #client.NUR_Usr_Prfx# #client.NUR_Usr_LName#'s request.  If you need assistance please contact us at alumniarchive.state.gov. Thank you for understanding that we must follow these clearance processes as the Archive contains personal information.

Best Regards,

Alla Surikov 
Data Manager 
Office of Policy and Evaluation 
Bureau of Educational and Cultural Affairs 
U.S. Department of State 
E-mail: SurikovAX@state.gov 
Tel: 202.453.8796
Fax: 202.453.8821">
						
						
						<cfinclude template="SendMail.cfm">
						<!--- ... --->

				
				<cfelseif client.NUR_InactAuthAgnt_ID EQ "-1">
						<!--- E-Mail received by  --->
						<cfset local.SendTo = client.NUR_AuthAgnt_Email>
						<cfset local.SendFrom = "AlumniArchive@state.gov;">
						<cfset local.Subject = "Alumni Archive access request">
<cfset local.Msg = 
"#client.NUR_Usr_Prfx# #client.NUR_Usr_FName# #client.NUR_Usr_MI# #client.NUR_Usr_LName# has requested an access to Alumni Archive.
						
NO #client.NUR_InactAuthAgnt_Role_Nm# FOUND!!!!!">
	
						<cfinclude template="SendMail.cfm">
						<!--- ... --->
						<!--- no email to the inactive auth agent can be sent becouse none exists --->
				
				</cfif>
				
				
				<!--- <cfset client.MsgTxt = "Thank you for submitting your information.<br>Your account will be activated shortly.<br>Check your e-mail for update."> --->
				<cfset client.MsgTxt = "Thank you for submitting your information.<br>Within 2 business days you should receive an email on your OpenNet account notifying you that your database registration has been activated.">
				<cfset client.ValForButton = "1001">
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">



			<!--- ------------------------------------- --->
			
			<cfelseif local.Controller EQ "UpdUserProfileByAuthAgent">
				<!--- ... --->
				<cfset client.ControllerDB = "UpdUserProfileByAuthAgent">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ... --->
				<cfset local.SendTo = FORM.h_SendEMailTo>
				<cfset local.SendFrom = "AlumniArchive@state.gov;">
				<cfset local.Subject = "Alumni Archive access">
				<cfset local.Msg = FORM.h_EMailMsg>
				<cfinclude template="SendMail.cfm">
				<!--- ... --->
				
				<cflocation url="_Controller.cfm?urlController=#client.ListType#">
			
			<!--- ------------------------------------- --->
			
			<cfelseif local.Controller EQ "SelfUpdUsrProfile">
				<!--- ... --->
				<cfset client.ControllerDB = "SelfUpdUsrProfile">
				<cfinclude template="_ControllerDB.cfm">
				
				<!--- ... --->
				<cfif #FORM.h_ValReqChgs# EQ "">
					<cfset local.Temp = "Everybody says Hi">
				<cfelse>
					<cfset local.SendTo = FORM.txt_UP_Usr_Email>
					<cfset local.SendFrom = "AlumniArchive@state.gov;">
					<cfset local.Subject = "Request for changes">
					<cfset local.Msg = FORM.h_ValReqChgs>
					<cfinclude template="SendMail.cfm">
					<!--- ... --->
					<cfset local.SendTo = FORM.h_usr_auth_agent_email>
					<cfset local.SendFrom = "AlumniArchive@state.gov;">
					<cfset local.Subject = "Request for changes">
					<cfset local.Msg = FORM.h_ValReqChgs>
					<cfinclude template="SendMail.cfm">
				</cfif>
				<!--- ...  --->
				<cflocation url="_Controller.cfm?urlController=208">
				<!--- <cflocation url="_Controller.cfm?urlController=#client.ListType#"> --->
			
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "UserIsNotAuthenticated">
				<cfset client.MsgTxt = "Sorry, provided 'User Name' and  'Password' were not authenticated by the system.<br>Click on button 'OK' and try again<br>or contact Administrator at SurikovAX@state.gov.">
				<cfset client.ValForButton = "1001">
				<cfset client.PageName = "Error">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			
			<cfelseif local.Controller EQ "UserProfile">
				<!--- GA - Grant Access --->
				<cfset client.GA_UsrID = FORM.h_GA_UsrID>
				<cfset client.ListType = FORM.h_ListType>
				<!--- ... --->
				
				<cfset client.UsrAddCntryCD = Trim(FORM.h_UsrAddCntryCD)>
				<cfset client.UsrAddCntryCD = Replace(client.UsrAddCntryCD, " ", "" , "All")>
				<!--- <cfoutput>|#client.UsrAddCntryCD1#|    |#client.UsrAddCntryCD2#|</cfoutput><cfabort> --->
				
				<cfset client.UsrAddCntryNM = FORM.h_UsrAddCntryNM>
				<!--- ... --->
				<cfset client.PageName = "User Profile">
				<cfset client.CallFile = "UserProfile_p1.cfm">
				
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "RemoveUsr">
				<!--- ... --->
				<cfset local.UsrID = FORM.h_GA_UsrID>
				<cfset local.h_GA_UsrFullNm = FORM.h_GA_UsrFullNm>
				<cfset local.h_GA_UsrEMail = FORM.h_GA_UsrEMail>
				<cfset local.h_GA_UsrRole = FORM.h_GA_UsrRole>
				<!--- ... --->
				<cfset client.ControllerDB = "RemoveUsr">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ... --->
				<cfset local.SendTo = local.h_GA_UsrEMail>
				<cfset local.SendFrom = "AlumniArchive@state.gov;">
				<cfset local.Subject = "Alumni Archive access status">
				<cfset local.Msg = "Dear #local.h_GA_UsrFullNm#,
Unfortunately, your access to Alumni Archive had been denied 
by Authorizing Agent #client.Usr_FName# #client.Usr_MI# #client.Usr_LName#.">
				<cfinclude template="SendMail.cfm">
				<!--- ... --->
				<cfset client.MsgTxt = "Selected user was permanently removed from the system.">
				<cfset client.ValForButton = client.CallPageID>
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			
			
			<cfelseif local.Controller EQ "ApprvUsr">
				
				
				<cfset local.UsrID = FORM.h_GA_UsrID>
				<cfset client.ControllerDB = "ApprvUsr">
				<cfinclude template="_ControllerDB.cfm">
				
				
				<cfset local.h_GA_UsrFullNm = FORM.h_GA_UsrFullNm>
				<cfset local.h_GA_UsrEMail  = FORM.h_GA_UsrEMail>
				<cfset local.h_GA_UsrRole   = FORM.h_GA_UsrRole>
				
				<cfset local.SendTo = local.h_GA_UsrEMail>
				<cfset local.SendFrom = "AlumniArchive@state.gov;">
				<cfset local.Subject = "Alumni Archive user approval confirmation">
				
				<cfif local.h_GA_UsrRole EQ "242"
					  OR
					  local.h_GA_UsrRole EQ "306">
					<cfset local.Msg = "Dear #local.h_GA_UsrFullNm#,
Your request to receive an access to Alumni Archive had been approved.
You may check Admin section of the Alumni Archive website for the users waiting for approval.">  
				<cfelse>	  
					<cfset local.Msg = "Dear #local.h_GA_UsrFullNm#,
Your request to receive an access to Alumni Archive had been approved.">
				</cfif>
				
				<cfinclude template="SendMail.cfm">
				<!--- ... --->
				<cfset client.MsgTxt = "Selected user is approved.">
				<cfset client.ValForButton = client.CallPageID>
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
				
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "putUsrOnHold">
				<cfset local.UsrID = FORM.h_GA_UsrID>
				<cfset client.ControllerDB = "putUsrOnHold">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ... --->
				<!--- ... --->
				<cfset client.MsgTxt = "Selected user is placed 'on hold'.">
				<cfset client.ValForButton = client.CallPageID>
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "Upd_H">
				<cfset local.UP_UsrIsAct = "H">
				<cfset local.UP_UsrID = FORM.h_GA_UsrID>
				<cfset local.UP_UsrPrfx = FORM.ddlb_GA_Usr_Prfx>
				<cfset local.UP_UsrFName = FORM.txt_GA_Usr_FName>
				<cfset local.UP_UsrMI = FORM.txt_GA_Usr_MI>
				<cfset local.UP_UsrLName = FORM.txt_GA_Usr_LName>
				<cfset local.UP_UsrPhone = FORM.txt_GA_Usr_Phone>
				<cfset local.UP_UsrExt = FORM.txt_GA_Usr_Ext>
				<cfset local.UP_UsrEmail = FORM.txt_GA_Usr_Email>
				<cfset local.UP_UsrName = FORM.txt_GA_Usr_UserName>
				<cfset local.UP_UsrPass = FORM.txt_GA_Usr_Pass>
				<cfset local.UP_UsrRoleID = FORM.ddlb_GA_Usr_AlumniArchiveRole_ID>
				
				 <cfif local.UP_UsrRoleID EQ "242" OR local.UP_UsrRoleID EQ "306">
					 <cfset local.UP_UsrDepartDT = UCASE(DateFormat(FORM.txt_h_GA_Depart_Dt, "d-MMM-yyyy"))>
				 <cfelse>
					 <cfset local.UP_UsrDepartDT = "">
				 </cfif>
				 
				<cfset local.UP_UsrCntryOfAssgnCD = FORM.ddlb_GA_Usr_CountryOfAssignmt_CD>
				<cfset local.UP_UsrCityPostNM = FORM.ddlb_GA_Usr_CityPostOfAssignmt>
				<!--- ...................... --->
				<cfif local.UP_UsrCntryOfAssgnCD EQ "US">
					<cfset local.UP_UsrOfficeCodeCD = FORM.ddlb_GA_Usr_DOS_OfficeCode_CD>
				<cfelse>
					<cfset local.UP_UsrOfficeCodeCD = "">
				</cfif>
				<!--- ...................... --->
				<cfif local.UP_UsrCntryOfAssgnCD NEQ "US">
					<cfset local.UP_UsrAddnlCntryCD = FORM.ddlbm_GA_Usr_AddnlCountry>
				<cfelse>
					<cfset local.UP_UsrAddnlCntryCD = "*">
				</cfif>
				<!--- ...................... --->
				<cfset local.UP_UsrComments = FORM.txta_GA_Usr_Comments>

				
				<cfset client.ControllerDB = "UpdUsrInfo">
				<cfinclude template="_ControllerDB.cfm">
				
				<!--- ------------------------------- --->
				<cfset client.MsgTxt = "User information is updated.">
				<cfset client.ValForButton = client.CallPageID>
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			<!--- ------------------------------------- --->
			
			
			<cfelseif local.Controller EQ "InsUpdCustomSearch">
				<cfset client.CS_Search_Nm = FORM.txt_CS_Search_Nm> 
				<cfset client.CS_Search_ID = FORM.h_CS_Search_ID>
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
			
			
			<cfelseif local.Controller EQ "InsUpdAdvCustomSearch">
				<cfset client.CS_Search_Nm = FORM.txt_CS_Search_Nm> 
				<cfset client.CS_Search_ID = FORM.h_CS_Search_ID>
				
				<cfset client.ControllerDB = "InsUpdAdvCustomSearch">
				<cfinclude template="_ControllerDB.cfm">
				
				<!--- ------------------------------- --->
				<cfset client.ControllerDB = "getCustomSearch">
				<cfinclude template="_ControllerDB.cfm">
				
				<!--- ------------------------------- --->
				<cfset client.ControllerVars = "updateVars">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ------------------------------- --->
				
				<cfset client.MsgTxt = "Custom Search had been saved.">
				<cfif #client.CS_Search_Type# EQ "UPD">
					<cfset client.ValForButton = "102">
				<cfelseif #client.CS_Search_Type# EQ "MAIL">
					<cfset client.ValForButton = "209">
				<cfelseif #client.CS_Search_Type# EQ "CONT">
					<cfset client.ValForButton = "210">
				<cfelseif #client.CS_Search_Type# EQ "STAT">
					<cfset client.ValForButton = "211">
				</cfif>
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
			
			
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "delCustomSearch">
				<!--- 
				<cfset client.ControllerVars = "getValsFromPage_BSC">
				<cfinclude template="_ControllerVars.cfm">
				------------------------------- --->
				<cfset client.CS_Search_ID = FORM.h_CS_Search_ID>
				<cfset client.ControllerDB = "delCustomSearch">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ------------------------------- --->
				<cfset client.ControllerVars = "defineVarsForCustSearch">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ------------------------------- --->
				<cfset client.MsgTxt = "Custom Search had been deleted.">
				<cfif #client.CS_Search_Type# EQ "UPD">
					<cfset client.ValForButton = "102">
				<cfelseif #client.CS_Search_Type# EQ "MAIL">
					<cfset client.ValForButton = "209">
				<cfelseif #client.CS_Search_Type# EQ "CONT">
					<cfset client.ValForButton = "210">
				<cfelseif #client.CS_Search_Type# EQ "STAT">
					<cfset client.ValForButton = "211">
				</cfif>
				<cfset client.PageName = "Information">
				<cfset client.CallFile = "ShowMsg.cfm">
				<!--- ------------------------------------- --->
<!--- /////////////////////////////////////////////////////////////////////////////////// --->			
			<cfelseif local.Controller EQ "doCustomSearch">

				<!--- ---- --->
				<cfset client.ControllerVars = "doCustomSearch">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ---- --->
				<cfinclude template="inc/inc_createSQLstatment.cfm">
				<!--- ---- --->
				<cfset client.ControllerDB = "execSQL_SelectCount">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ---- --->
				<cfset client.SelectCount = spr_execSQL_SelectCount.csrc_counter>
				<!--- <cfoutput>#client.SelectCount#</cfoutput><cfabort>  --->
				<!--- ---- --->
						<cfif #client.SelectCount# EQ "0"><!--- client.SelectCount is created in inc_createSQLstatment.cfm --->
								<cfset client.MsgTxt = "Sorry, this search brings "&#client.SelectCount#&" records.<br>Please refine your search criteria.">
								<!--- <cfset client.ValForButton = "203"> --->
								<cfset client.ValForButton = "backToSearchCriteria">
								<cfset client.PageName = "Information">
								<cfset client.CallFile = "ShowMsg.cfm">
						
						<cfelseif #client.SelectCount# GT "1000">
								<cfset client.MsgTxt = "Sorry, this search brings "&#client.SelectCount#&" records.<br>When results of a search bring back more than 1000 Alumni Records - please select additional fields to narrow your search so that updating may be done in smaller groupings.<br>To see lists of over 1000 Alumni returned, please visit the Create and Print section where these types of lists may be run for reporting purposes.">
								<!--- <cfset client.ValForButton = "102"> --->
								<cfset client.ValForButton = "backToSearchCriteria">
								<cfset client.PageName = "Information">
								<cfset client.CallFile = "ShowMsg.cfm">
						
						<cfelseif #client.SelectCount# GT "0" AND #client.SelectCount# LT "1000">
								<!--- --- --->
								<!--- <cfoutput>#client.basicCS_SQLstatement#</cfoutput><cfabort> --->
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

						</cfif>
						<!--- <cfset local.delClientVar = DeleteClientVariable("SelectCount")>  --->
					<!--- ---- --->
<!--- /////////////////////////////////////////////////////////////////////////////////// --->			
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "doMailingLables">
				<cfset local.DocType = FORM.h_DocType>
				<!--- ---- --->
				<cfset client.ControllerVars = "setValsFromSreen">
				<cfinclude template="_ControllerVars.cfm">
				<!--- --- --->
				<cfinclude template="inc/inc_createMail_SQLstatment.cfm">
				<!--- --- --->
				<cfset client.ControllerDB = "execSQL_SelectCount">
				<cfinclude template="_ControllerDB.cfm">
				
				<!--- spr_execSQL_SelectCount --->
				<!--- --- --->
				
				<cfset client.ControllerDB = "execSQL_RPT">
				<cfinclude template="_ControllerDB.cfm">
				
				<!--- --- --->
				<cfset client.ControllerDB = "getRprtRecords">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ---
				<script language="javascript" type="text/javascript">
					alert("auto")
					//document.body.style.cursor = "auto";
				</script>
				 --->
				<cfif #spr_getRptSearchedRecords.recordCount# EQ 0>
					<cfset client.MsgTxt = "Sorry, this Mailing Labels search brings "&#spr_getRptSearchedRecords.recordCount#&" address records found to create mailing labels.<br>Please refine your search criteria and try again.">
					<cfset client.ValForButton = "209">
					<cfset client.PageName = "Information">
					<cfset client.CallFile = "ShowMsg.cfm">
				
				
				<cfelse>
					<cfheader name="Content-Disposition" value="attachment; filename=MailingLabels.xls">
					<cfcontent type="application/msexcel"> 
					
					
					<table title="Mailing Labels"  border="1" cellspacing="0">
     					<thead>
								<th>Prefix</th>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Suffix</th>
								<th>Business Name</th>
								<th>Street Address</th>
								<th>City</th>
								<th>State / Province</th>
								<th>Postal Code</th>
								<th>Country</th>
  						</thead>
	  					<tbody>
        				<cfoutput query="spr_getRptSearchedRecords">
          					#mail_data#
        				</cfoutput>
      					</tbody>
					</table>
					
					<cfabort>
					
					
					
					
					<!--- ---
					<cfset client.MsgTxt = "Your search brings "&#spr_getSearchedRecords.recordCount#&" records.<br>Search results in the Mailing label format is saved on your C drive.<br>File name is MailingLables.doc">
					<cfset client.ValForButton = "209">
					<cfset client.PageName = "Information">
					<cfset client.CallFile = "ShowMsg.cfm"> --->
				</cfif>
				
			<!--- ------------------------------------- --->
			
			
			
			<cfelseif local.Controller EQ "doContactList">
				<cfset local.DocType = FORM.h_DocType>
				<!--- ---- --->
				<!--- <script language="javascript" type="text/javascript">
					document.body.style.cursor = "wait";
				</script> --->
				<!--- ---- --->
				<cfset client.ControllerVars = "setValsFromSreen">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ---- --->
				<cfinclude template="inc/inc_createCont_SQLstatment.cfm">
				
				<!--- --- --->
				
				<cfset client.ControllerDB = "execSQL_SelectCount">
				<cfinclude template="_ControllerDB.cfm">
				<!--- spr_execSQL_SelectCount --->
				<!--- --- --->
				
				<cfset client.ControllerDB = "execSQL_RPT">
				<cfinclude template="_ControllerDB.cfm">
				
				<!--- --- --->
				<cfset client.ControllerDB = "getRprtRecords">
				<cfinclude template="_ControllerDB.cfm">
				<!--- --- --->
				<cfif spr_getRptSearchedRecords.recordCount EQ 0>
					<cfset client.MsgTxt = "Sorry, this search brings "&#spr_getRptSearchedRecords.recordCount#&" records.<br>Please refine your search criteria and try again.">
					<cfset client.ValForButton = "210">
					<cfset client.PageName = "Information">
					<cfset client.CallFile = "ShowMsg.cfm">
				<cfelse>
					
					<cfheader name="Content-Disposition" value="attachment; filename=ContactList.xls">
					<cfcontent type="application/msexcel"> 
					
					
					<table title="Contact List" border="1" cellspacing="0">
     					<thead>
								<th>Prefix</th>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Suffix</th>
								<th>Business Name</th>
								<th>Street Address</th>
								<th>City</th>
								<th>State / Province</th>
								<th>Postal Code</th>
								<th>Country</th>
								<th>Phone</th>
								<th>E-Mail</th>
  						</thead>
	  					<tbody>
        				<cfoutput query="spr_getRptSearchedRecords">
          					#cont_data#
        				</cfoutput>
      					</tbody>
					</table>
					<cfabort>
				</cfif>
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "doDistributionList">
				<cfset local.DocType = FORM.h_DocType>
				<!--- ---- --->
				<cfset client.ControllerVars = "setValsFromSreen">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ---- --->
				<cfinclude template="inc/inc_createDistrib_SQLstatment.cfm">
				<!--- --- --->
				
				<cfset client.ControllerDB = "execSQL_SelectCount">
				<cfinclude template="_ControllerDB.cfm">
				<!--- spr_execSQL_SelectCount --->
				
				<cfset client.ControllerDB = "execSQL_RPT">
				<cfinclude template="_ControllerDB.cfm">
				
				<!--- --- --->
				<cfset client.ControllerDB = "getRprtRecords">
				<cfinclude template="_ControllerDB.cfm">
				<!--- --- --->
				<cfif #spr_getRptSearchedRecords.recordCount# EQ 0>
					<cfset client.MsgTxt = "Sorry, this E-mail Distribution List search brings "&#spr_getRptSearchedRecords.recordCount#&" e-mail records found.<br>Please refine your search criteria and try again.">
					<cfset client.ValForButton = "213">
					<cfset client.PageName = "Information">
					<cfset client.CallFile = "ShowMsg.cfm">
				<cfelse>
					
					<cfheader name="Content-Disposition" value="attachment; filename=EmailDistributionList.xls">
					<cfcontent type="application/msexcel"> 
					
					
					<table title="Email Distribution List" border="1" cellspacing="0">
     					<thead>
								<th>Name</th>
								<th>E-Mail</th>
  						</thead>
	  					<tbody>
        				<cfoutput query="spr_getRptSearchedRecords">
          					#dist_data#
        				</cfoutput>
      					</tbody>
					</table>
					
					<cfabort>
					
				</cfif>
				
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "doStatReport">
				<cfset local.DocType = FORM.h_DocType>
				<!--- ---- --->

				<cfset client.ControllerVars = "setValsFromSreen">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ---- --->

				<cfset client.ControllerVars = "setVarsFofDynamicSQL">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ---- --->
				<cfinclude template="inc/inc_createStat_SQLstatment.cfm">
				<!--- --- 
				<cfquery name="q_execSQL" datasource="#request.dsn#">
					#client.RPT_SQLstatement#
				</cfquery>--->
				<!--- --- --->
				<!--- ======================= --->
				<cfset client.ControllerDB = "execSQL_SelectCount">
				<cfinclude template="_ControllerDB.cfm">
				<!--- --- --->
				<cfset client.ControllerDB = "execSQL_StatRPT">
				<cfinclude template="_ControllerDB.cfm">
				<!--- --- --->
				<cfset client.ControllerDB = "getRprtRecords">
				<cfinclude template="_ControllerDB.cfm">
				<!--- --- --->
				<cfif #spr_getRptSearchedRecords.recordCount# EQ 0>
					<cfset client.MsgTxt = "Sorry, this search brings "&#spr_getRptSearchedRecords.recordCount#&" records.<br>Please refine your search criteria.">
					<cfset client.ValForButton = "211">
					<cfset client.PageName = "Information">
					<cfset client.CallFile = "ShowMsg.cfm">
				<cfelse>
					
					<cfheader name="Content-Disposition" value="attachment; filename=AdhocReport.xls">
					<cfcontent type="application/msexcel"> 
					<table title="Adhoc Report" border="1" cellspacing="0">
     					<thead>
								<cfoutput>
								#local.col_Prefix#
								#local.col_FName#
								#local.col_MName#
								#local.col_LName#
								#local.col_LName2#
								#local.col_Sfx#
								#local.col_Sex#
								#local.col_DOB#
								#local.col_Ctzn#
								#local.col_Ctzn2#
								#local.col_CntryFrom#
								#local.col_CntryTo#
								#local.col_PgmType#
								#local.col_FieldStd#
								#local.col_FY#
								#local.col_PgmYear#
								#local.col_PGMStartDt#
								#local.col_PGMEndDt#
								#local.col_HostInst#
								#local.col_CityVisited#
								#local.col_PGMAgncy#
								#local.col_PGMPlacement#
								#local.col_PGM_NMTNG#
								#local.col_SubCat#
								#local.col_Topic#
								#local.col_StratGoal#
								#local.col_SpecAward#
								#local.col_Contact#
								#local.col_DCSD#
								#local.col_Dsabld#
								#local.col_Intrst#
								#local.col_Prominent#
								#local.col_Prof#
								#local.col_ELPSpeak#
								#local.col_ELPRead#
								#local.col_ELPComp#
								#local.col_Comm#
								#local.col_BSNS_NM#
								#local.col_BSNS_ADRS_TXT#
								#local.col_BSNS_CITY_NM#
								#local.col_BSNS_STATE_PRVNC_NM#
								#local.col_BSNS_POSTL_CD#
								#local.col_BSNS_CNTRY_CD#
								#local.col_RESDNC_ADRS_TXT#
								#local.col_RESDNC_CITY_NM#
								#local.col_RESDNC_STATE_PRVNC_NM#
								#local.col_RESDNC_POSTL_CD#
								#local.col_RESDNC_CNTRY_CD#
								</cfoutput>
  						</thead>
	  					<tbody>
        				<cfoutput query="spr_getRptSearchedRecords">
          					#fie1d1#
        				</cfoutput>
      					</tbody>
					</table>
					
					<cfabort>
				</cfif>
				
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
				<!--- --- --->
				<cfset client.AP_AlmnID = FORM.h_AlmnID>
				<!--- --- --->
				<cfif #client.Usr_Role_CD# EQ "1" OR #client.Usr_Role_CD# EQ "304">
						<!--- Check if duplicate exist --->
							<cfset client.ControllerDB = "checkDups">
							<cfinclude template="_ControllerDB.cfm">
							<!--- --- --->
							<cfif #spr_checkDups.dupsCounter# EQ "1">
									<cfset client.PageName = "Alumni Profile">
									<cfset client.CallFile = "AlumniRecord_p1.cfm">
							<cfelseif #spr_checkDups.dupsCounter# GT "1">
									<cfset client.MsgTxt = "Attention, system determined "&#spr_checkDups.dupsCounter#&" identical records.<br>Please click 'Merge' if you want to review and merge duplicates<br>and click 'Continue' if you want to update selected record.">
									<!--- <cfset client.ValForButton1 = "getRecordsToMerge"> --->
									<cfset client.ValForButton1 = "getPgmRecds">
									<cfset client.ValForButton2 = "continueGetAlmnRecord">
									<cfset client.PageName = "Information">
									<cfset client.CallFile = "ShowMsg_2_Buttons.cfm">
							</cfif>
				<cfelse>
							<cfset client.PageName = "Alumni Profile">
							<cfset client.CallFile = "AlumniRecord_p1.cfm">
				</cfif>
				
			
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "getPgmRecds">
					<!--- --- --->
					<cfset client.ControllerDB = "getPgmRecds">
					<cfinclude template="_ControllerDB.cfm">
					<!--- --- --->
					<cfset client.PageName = "Program Comparison">
					<cfset client.CallFile = "ProgramComparison_p1.cfm">
			
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "getRecordsToMerge">
					<cfset local.ListOfIDsToMerge = FORM.h_ListOfIDsToMerge>
					<cfset local.NumOfLoops = FORM.h_Counter>
					<!--- --- --->
					<cfset client.ControllerDB = "getRecordsToMerge">
					<cfinclude template="_ControllerDB.cfm">
					<!--- --- --->
					<cfset client.PageName = "Merge Duplicates">
					<cfset client.CallFile = "MergeDuplicates_p4.cfm">
			
					<!--- SELECT records 
					<cfif #spr_getRecordsToMerge.recordCount# EQ "0">
						<cfset client.MsgTxt = "Sorry, unknown error.<br>Please report to database administrator in Washington DC.">
						<cfset client.ValForButton = "getAlumniRecord">
						<cfset client.PageName = "Error">
						<cfset client.CallFile = "ShowMsg.cfm">
					<cfelse>
						<cfset client.PageName = "Merge Duplicates">
						<cfset client.CallFile = "MergeDuplicates_p4.cfm">
					</cfif>
					--- --->
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "continueGetAlmnRecord">
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
					<cfset client.MsgTxt = "Sorry, this search brings 0 records.<br>Please refine your search criteria.">
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
			<cfelseif local.Controller EQ "UpdateAlmnRecord_BackToSearchReslt">
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
				<cfset client.TE_PageID = FORM.h_PageID>  
				<cfset client.TE_PageNm = FORM.h_PageNm>
				<cfset client.TE_TxtType = FORM.ddlb_TextType><!--- <cfoutput>#client.TE_PageID#<br>#client.TE_PageNm#<br>#client.TE_TxtType#</cfoutput><cfabort> --->
				<!--- --- --->
				<cfset client.PageName = "Text Editor">
				<cfset client.CallFile = "EditText_p2.cfm">
				<!--- --- --->
			<!--- ------------------------------------- --->
			
			<cfelseif local.Controller EQ "TOPIC_DELETE">
				<!--- --- --->
				<cfset local.topic_id = "#FORM.h_topic_id#">
				<!--- --- --->
				<cfset client.ControllerDB = "TOPIC_DELETE">
				<cfinclude template="_ControllerDB.cfm">
				<!--- --- --->
				<cfset client.CallFile = "EditText_p1.cfm">
				<!--- --- --->
		   <!--- ------------------------------------- --->
		   
		   <cfelseif local.Controller EQ "TOPIC_UPDATE">
		   		<cfset client.ControllerVars = "TOPIC_UPDATE">
				<cfinclude template="_ControllerVars.cfm">
				<!--- --- --->
				<cfset client.ControllerDB = "TOPIC_UPDATE">
				<cfinclude template="_ControllerDB.cfm">
				<!--- --- --->
				<cfset client.CallFile = "EditText_p1.cfm">
				<!--- --- --->
		   <!--- ------------------------------------- --->
		   
		   <cfelseif local.Controller EQ "TOPIC_INSERT">
				<!--- --- --->
				<cfset local.topic_id = FORM.h_topic_id>
				<cfset local.topic_security_tree_id = client.TE_PageID>
				<cfset local.topic_navigation_cd = client.TE_TxtType>
				<cfset local.topic_title = FORM.h_topic_title>
				<cfset local.topic_txt = FORM.h_topic_txt>
				<cfset local.topic_seq_on_page = FORM.h_topic_seq_on_page>
				<cfset local.topic_is_active = FORM.h_topic_is_active>
				<cfset local.topic_exprtn_dt = FORM.h_topic_exprtn_dt>
				<cfif #local.topic_exprtn_dt# EQ "">
					<cfset local.topic_exprtn_dt = "no_val">
				</cfif>
				<!--- 
				<cfoutput>
				#local.topic_id#<br>
				#local.topic_security_tree_id#<br>
				#local.topic_navigation_cd#<br>
				#local.topic_title#<br>
				#local.topic_txt#<br>
				#local.topic_seq_on_page#<br>
				#local.topic_is_active#<br>
				#local.topic_exprtn_dt#<br>
				</cfoutput><cfabort> --->
				
				<!--- --- --->
				<cfset client.ControllerDB = "TOPIC_INSERT">
				<cfinclude template="_ControllerDB.cfm">
				<!--- --- --->
				<cfset client.CallFile = "EditText_p1.cfm">
				<!--- --- --->
		   <!--- ------------------------------------- --->
		   <cfelseif local.Controller EQ "getMergeVals">
				<!--- ------------------------------------- --->
				<cfset client.ControllerVars = "getMergeVals">
				<cfinclude template="_ControllerVars.cfm">
				<!--- ------------------------------------- --->
				<!--- Moving ORG ALMN records to tbl ALNM_MERGE and updates show_almn_ind = 'N' --->
				<cfset client.ControllerDB = "moveOrgAlmnRecds">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ------------------------------------- --->
				
				<cfset client.ControllerDB = "updMergedRecds">
				<cfinclude template="_ControllerDB.cfm">
				<!--- ------------------------------------- --->
				
				<cfset client.ControllerDB = "countJobs">
				<cfinclude template="_ControllerDB.cfm">
				
				<cfif #spr_countJobs.JobCounter# EQ 0>
					<cfset client.PageName = "List of Programs">
					<cfset client.CallFile = "ListPrograms_p1.cfm">
				<cfelse>
					<cfset client.PageName = "List of Jobs">
					<cfset client.CallFile = "ListJobRecords_p1.cfm">
				</cfif>
				<!--- ------------------------------------- --->
				<!--- ------------------------------------- --->
				
			<!--- ------------------------------------- --->
			<cfelseif local.Controller EQ "mergeJobRecords">
					<!--- ------------------------------------- --->
					<cfset local.MergeJobRecds = FORM.h_mergeJobRecds>
					<cfset local.LoopNum = FORM.h_LoopNum>
					<!--- ------------------------------------- --->
					<cfset client.ControllerDB = "saveOrgRecords">
					<cfinclude template="_ControllerDB.cfm">
					<!--- ------------------------------------- --->
					<cfloop index = "i_JobRecords"	
							list = "#local.MergeJobRecds#"	
							delimiters = ";">
							
							<cfset local.MergeJobRecds = #i_JobRecords#>
							<cfset client.ControllerDB = "mergeJobRecords">
							<cfinclude template="_ControllerDB.cfm">
									
					</cfloop>
					<!--- ------------------------------------- --->
					<cfset client.ControllerDB = "completeJobMerge">
					<cfinclude template="_ControllerDB.cfm">
					
					<!--- ------------------------------------- --->
					<cfset client.PageName = "List of Programs">
					<cfset client.CallFile = "ListPrograms_p1.cfm">
					<!--- ------------------------------------- --->
					<!--- _Controller.cfm: Line 1096. Next ,call PGM merging.<cfabort> --->
				<!--- ------------------------------------- --->
		
		<cfelseif local.Controller EQ "mergePgm_and_PV">
			<!--- ------------------------------------- --->
			<cfset client.ControllerVars = "mergePgm_and_PV">
			<cfinclude template="_ControllerVars.cfm">
			<!--- ------------------------------------- --->
			<cfset client.ControllerDB = "mergePgm_and_PV">
			<cfinclude template="_ControllerDB.cfm">
			<cfset local.vCount = #spr_continue.vCount#>
			<!--- -------------------------------------- --->
			<cfif local.vCount EQ "0"> <!--- means merging is finished since all pgms are merged  --->
					<!--- <cflocation url="_Controller.cfm?urlController=backToSearchCriteria" addtoken="yes"> --->
					<!--- ------------------------------------- --->
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
					<!--- ------------------------------------- --->
			<cfelse><!--- "local.vCount > 0" some PGMs remain, let's review them --->
					<!--- ------------------------------------- --->
					<cfset client.PageName = "List of Programs">
					<cfset client.CallFile = "ListPrograms_p1.cfm">
					<!--- ------------------------------------- --->
					
				
			</cfif>
			<!--- ------------------------------------- --->
		   
	   </cfif>


<cfelseif local.Is_Numeric EQ "YES">
		<!--- ------------------------------- --->
		<cfset client.DelPendingMergedRecds = "YES">
		<!--- ------------------------------- --->
		<cfif local.Controller GT "1000">
			<!--- ... 
			<cfif local.Controller EQ "1001">
				<cfset client.Permission = "YES">
			</cfif>--->
			<!--- ... --->
			<cfset client.ControllerVars = "setAnonymusUser">
			<cfinclude template="_ControllerVars.cfm">
		</cfif>
		<!--- ------------------------------- --->
		<cfif local.Controller EQ "102" OR
			  local.Controller EQ "209" OR
			  local.Controller EQ "210" OR
			  local.Controller EQ "211" >
			<cfset client.CS_SetDefault = "YES">
			
		</cfif>
		
		<!--- ------------------------------- --->
		<cfset client.ControllerDB = "getNavigation">
		<cfinclude template="_ControllerDB.cfm">
		<!--- ------------------------------- --->
		<cfset client.CallPageID = local.Controller>
		<cfinclude template="CFFunction/f_getCallFile.cfm">
		<!--- ------------------------------- --->
		
</cfif>

<!--- <cfoutput>#client.CallFile#</cfoutput><cfabort> --->
<cflocation url="#client.CallFile#" addtoken="yes">