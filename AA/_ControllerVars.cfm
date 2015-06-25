<!--- _ControllerVars.cfm --->
<cfswitch expression=#client.ControllerVars#>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="setAnonymusUser">
		<cfset client.Usr_CD = "0">
		<cfset client.Usr_Prx = "">
		<cfset client.Usr_FName = "Anonymous">
		<cfset client.Usr_MI = "A">
		<cfset client.Usr_LName = "Anonymous">
		<!--- <cfset client.Usr_Sfx = ""> --->
		<cfset client.Usr_Role_CD = "0">
		<!--- <cfset client.Usr_Role = "ANONYM"> --->
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="SetAppUserVars">
		<cfset client.Usr_CD = spr_AuthenticateUser.usr_cd>
		<cfset client.Usr_Prx = spr_AuthenticateUser.usr_pfx>
		<cfset client.Usr_FName = spr_AuthenticateUser.usr_fname>
		<cfset client.Usr_MI = spr_AuthenticateUser.usr_mi>
		<cfset client.Usr_LName = spr_AuthenticateUser.usr_lname>
		<cfset client.Usr_Phone = spr_AuthenticateUser.usr_phone>
		<cfset client.Usr_Ext = spr_AuthenticateUser.usr_ext>
		<cfset client.Usr_Email = spr_AuthenticateUser.usr_email>
		<cfset client.Usr_UName = spr_AuthenticateUser.usr_uname>
		<cfset client.Usr_Pass = spr_AuthenticateUser.usr_pass>
		<cfset client.Usr_Role_CD = spr_AuthenticateUser.usr_role_cd>
		<cfset client.Usr_Is_Act = spr_AuthenticateUser.usr_is_act>
		<cfset client.Usr_Depart_Dt = spr_AuthenticateUser.usr_est_depart_dt>
		<cfset client.Usr_AuthAgent_ID = spr_AuthenticateUser.usr_auth_agent_id>
		<!--- This var is going to be used in CS-Custom Search --->
		<cfset client.CS_SetDefault = "YES">
		
		<!---
		<cfoutput>#client.Usr_CD#<br>#client.Usr_FName#<br>#client.Usr_MI#<br>#client.Usr_LName#<br>#client.Usr_Phone#<br>
							#client.Usr_Ext#<br>#client.Usr_Email#<br>#client.Usr_UName#<br>#client.Usr_Pass#<br>#client.Usr_Role_CD#<br>#client.Usr_Is_Act#
							#client.Usr_Depart_Dt#<br>#client.Usr_AuthAgent_ID#</cfoutput><cfabort> --->
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="set_NUR_DefaultVars">
	
		<cfset client.NUR_Usr_ID = "0">
		<cfset client.NUR_Usr_Prfx = "-1">
		<cfset client.NUR_Usr_FName = "">
		<cfset client.NUR_Usr_MI = "">
		<cfset client.NUR_Usr_LName = "">
		<cfset client.NUR_Usr_Phone = "">
		<cfset client.NUR_Usr_Ext = "">
		<cfset client.NUR_Usr_Email = FORM.txt_NUR_Usr_Email>
		<cfif client.NUR_Usr_Email EQ "">
			<cfset client.NUR_Usr_UserName = "">
		<cfelse>
			<cfset local.PosOfAt = Find("@",client.NUR_Usr_Email)>
			<cfset client.NUR_Usr_UserName = Left(client.NUR_Usr_Email, (local.PosOfAt-1))>
		</cfif>
		<cfset client.NUR_Usr_Pass = "">
		<cfset client.NUR_Usr_Confrm_Pass = "">
		<!--- ... --->
		<cfset client.NUR_Usr_SecQ = "-1"><!--- ddlb_NUR_SecQ --->
		<cfset client.NUR_Usr_Answer = ""> <!--- txt_NUR_Answer --->
		<!--- ... --->
		<cfset client.NUR_Usr_RoleCD = "-1">
		<cfset client.NUR_Usr_IsAct = "">
		<cfset client.NUR_Usr_Depart_Dt = "">
		       
		<cfset client.NUR_Usr_CountryOfAssignmt_CD = "-1">
		<cfset client.NUR_Usr_CityPostOfAssignmt_NM = "-1">
		<cfset client.NUR_Usr_NewCityPostOfAssignmt = "">
		<!--- --- --->
		<cfset client.NUR_Usr_AddnlCountry_CD = "-1">
		<cfset client.NUR_Usr_AddnlCountries_NM = "">
		<!--- --- --->
		<cfset client.NUR_DOS_OfficeCode_CD = "-1">
		<!--- --- --->
		<cfset client.NUR_Usr_IsAct = "">
		<!--- <cfset client.NUR_Usr_AuthAgent_ID = "0"> --->
		<!--- --- --->
		<cfset client.NUR_Usr_Comments = "">
		<!--- --- --->
		<cfset client.NUR_AuthAgnt_ID = 0>
		<!--- --- --->
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="get_NUR_Usr_PreReg">
	
	<!--- <cfoutput>#spr_NUR_Usr_PreReg.usr_fname#</cfoutput><cfabort> --->
	
		<cfset client.NUR_Usr_ID = spr_NUR_Usr_PreReg.usr_cd>
		<cfset client.NUR_Usr_Prfx = spr_NUR_Usr_PreReg.usr_pfx>
		<cfset client.NUR_Usr_FName = spr_NUR_Usr_PreReg.usr_fname>
		<cfset client.NUR_Usr_MI = spr_NUR_Usr_PreReg.usr_mi>
		<cfset client.NUR_Usr_LName = spr_NUR_Usr_PreReg.usr_lname>
		<cfset client.NUR_Usr_Phone = spr_NUR_Usr_PreReg.usr_phone>
		<cfset client.NUR_Usr_Ext = spr_NUR_Usr_PreReg.usr_ext>
		<cfset client.NUR_Usr_Email = spr_NUR_Usr_PreReg.usr_email>
		<cfset client.NUR_Usr_UserName = spr_NUR_Usr_PreReg.usr_uname>
		<!--- <cfset client.NUR_Usr_Pass = spr_NUR_Usr_PreReg.usr_pass> --->
		<cfset client.NUR_Usr_Pass = "">
		<cfset client.NUR_Usr_Confrm_Pass = "">
		<!--- ... --->
		<cfset client.NUR_Usr_SecQ = "-1"><!--- ddlb_NUR_SecQ --->
		<cfset client.NUR_Usr_SecQ_Txt = "">
		<cfset client.NUR_Usr_Answer = ""> <!--- txt_NUR_Answer --->
		<!--- ... --->
		<cfset client.NUR_Usr_RoleCD = spr_NUR_Usr_PreReg.usr_role_cd>
		<!--- <cfset client.NUR_Usr_RoleAllCntryAccss = ""> --->
		<cfset client.NUR_Usr_IsAct = spr_NUR_Usr_PreReg.usr_is_act>
		<cfset client.NUR_Usr_Depart_Dt = spr_NUR_Usr_PreReg.usr_est_depart_dt>
		<cfset client.NUR_Usr_CountryOfAssignmt_CD = spr_NUR_Usr_PreReg.usr_cntry_cntry_cd>
		<cfset client.NUR_Usr_CityPostOfAssignmt_NM = spr_NUR_Usr_PreReg.usr_cntry_city_post_nm>
		<cfset client.NUR_Usr_NewCityPostOfAssignmt = "">
		<!--- --- --->
		<cfset client.NUR_Usr_AddnlCountry_CD = "-1">
		<cfset client.NUR_Usr_AddnlCountries_NM = "">
		<!--- --- --->
		<cfset client.NUR_DOS_OfficeCode_CD = "-1">
		<!--- --- --->
		<cfset client.NUR_Usr_IsAct = spr_NUR_Usr_PreReg.usr_is_act>
		<!--- --- --->
		<!--- <cfset client.NUR_Usr_AuthAgent_ID = "0"> --->
		<!--- --- --->
		<cfset client.NUR_Usr_Comments = "">
		<!--- --- --->
		<cfset client.NUR_AuthAgnt_ID = 0>
		<!--- --- --->
		
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getAuthAgent">
				<cfset client.NUR_Usr_ID = FORM.h_NUR_Usr_ID>
				<cfset client.NUR_Usr_Prfx = FORM.ddlb_NUR_Usr_Prfx>
				<cfset client.NUR_Usr_FName =UCase(FORM.txt_NUR_Usr_FName)>
				<cfset client.NUR_Usr_MI = UCase(FORM.txt_NUR_Usr_MI)>
				<cfset client.NUR_Usr_LName = UCase(FORM.txt_NUR_Usr_LName)>
				<cfset client.NUR_Usr_Phone = FORM.txt_NUR_Usr_Phone>
				<cfset client.NUR_Usr_Ext = FORM.txt_NUR_Usr_Ext>
				<cfset client.NUR_Usr_Email = LCase(FORM.txt_NUR_Usr_Email)>
				<cfset client.NUR_Usr_UserName = LCase(FORM.txt_NUR_Usr_UserName)>
				<cfset client.NUR_Usr_Pass = FORM.txt_NUR_Usr_Pass>
				<cfset client.NUR_Usr_Confrm_Pass = FORM.txt_NUR_Usr_Confrm_Pass>
				<!--- ... --->
				<cfset client.NUR_Usr_SecQ = FORM.ddlb_NUR_SecQ>
				<cfset client.NUR_Usr_SecQ_Txt = FORM.h_Item_Desc>
				<cfset client.NUR_Usr_Answer = FORM.txt_NUR_Answer>
				<!--- ... --->
				<cfset client.NUR_Usr_RoleCD = FORM.ddlb_NUR_Usr_AlumniArchiveRole_ID>
				<!--- ... --->
				<cfset client.NUR_Usr_Depart_Dt = FORM.txt_h_NUR_Depart_Dt>
				<!--- ... --->
				<cfset client.NUR_Usr_CountryOfAssignmt_CD = FORM.ddlb_NUR_Usr_CountryOfAssignmt_CD>
				<cfset client.NUR_Usr_CountryOfAssignmt_NM = FORM.h_NUR_Usr_CountryOfAssignmt_NM>
				<cfset client.NUR_Usr_CityPostOfAssignmt_NM = FORM.ddlb_NUR_Usr_CityPostOfAssignmt_NM>
				<cfset client.NUR_Usr_NewCityPostOfAssignmt = Trim(FORM.txt_h_NUR_NewPostCity)>
				<cfset client.NUR_Usr_AddnlCountry_CD = FORM.ddlbm_NUR_Usr_AddnlCountry>
				<cfset client.NUR_Usr_AddnlCountries_NM = FORM.h_showSelection>
				<cfset client.NUR_DOS_OfficeCode_CD = FORM.ddlb_NUR_Usr_DOS_OfficeCode_CD>
				
				
				
 	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="setAuthAgentVars">
		 <cfset client.NUR_AuthAgnt_ID = spr_getAuthAgent.usr_cd>
		 <cfset client.NUR_AuthAgnt_FullName = spr_getAuthAgent.usr_full_nm>
		 <cfset client.NUR_AuthAgnt_Phone = spr_getAuthAgent.usr_phone>
		 <cfset client.NUR_AuthAgnt_Ext = spr_getAuthAgent.usr_ext>
		 <cfset client.NUR_AuthAgnt_Email = spr_getAuthAgent.usr_email>
		 <cfset client.NUR_AuthAgnt_Role_Nm = spr_getAuthAgent.app_role_nm>
		 
		 <cfset client.NUR_InactAuthAgnt_ID = spr_getInactiveAuthAgent.usr_cd>
		 <cfset client.NUR_InactAuthAgnt_FullName = spr_getInactiveAuthAgent.usr_full_nm>
		 <cfset client.NUR_InactAuthAgnt_Phone = spr_getInactiveAuthAgent.usr_phone>
		 <cfset client.NUR_InactAuthAgnt_Ext = spr_getInactiveAuthAgent.usr_ext>
		 <cfset client.NUR_InactAuthAgnt_Email = spr_getInactiveAuthAgent.usr_email>
		 <cfset client.NUR_InactAuthAgnt_Role_Nm = spr_getInactiveAuthAgent.app_role_nm>
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="get_USR_Pass">
		<cfset client.PASS_Email = FORM.txt_PASS_Email>
		<cfset client.PASS_SecQ = FORM.ddlb_PASS_SecQ>
		<cfset client.PASS_Answer = FORM.txt_PASS_Answer>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="InsUpdNewUserRegistration">
		<cfset client.NUR_Usr_Comments = FORM.txta_NUR_Usr_Comments>
		<cfset client.NUR_Usr_Confrm_Pass = "">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

<!--- ----------------------------------------------------------------------------------------------------------------- --->	
	<cfcase value="get_NUR_UserDataRetrieved">
		<!--- USER INFORMATION --->
		<cfset client.NUR_Usr_ID = spr_get_NUR_User.usr_cd>
		<cfset client.NUR_Usr_Prfx = spr_get_NUR_User.usr_pfx>
		<cfset client.NUR_Usr_FName = spr_get_NUR_User.usr_fname>
		<cfset client.NUR_Usr_MI = spr_get_NUR_User.usr_mi>
		<cfset client.NUR_Usr_LName = spr_get_NUR_User.usr_lname>
		<cfset client.NUR_Usr_Phone = spr_get_NUR_User.usr_phone>
		<cfset client.NUR_Usr_Ext = spr_get_NUR_User.usr_ext>
		<cfset client.NUR_Usr_Email = spr_get_NUR_User.usr_email>
		<cfset client.NUR_Usr_UserName = spr_get_NUR_User.usr_uname>
		<cfset client.NUR_Usr_Pass = spr_get_NUR_User.usr_pass>
		<cfset client.NUR_Usr_AlumniArchiveRole_ID = spr_get_NUR_User.usr_role_cd>
		<cfset client.NUR_Usr_IsAct = spr_get_NUR_User.usr_is_act>
		<cfset client.NUR_Usr_Depart_Dt = spr_get_NUR_User.usr_est_depart_dt>
		<cfset client.NUR_AuthAgnt_ID = spr_get_NUR_User.usr_auth_agent_id>
		
		<!--- USER COMMENTS --->
		<cfset client.NUR_Comnt_Txt = spr_get_NUR_Comment.usr_comnt_comnt_txt>
		
		<!--- USER-COUNTRY INFORMATION --->
	   	<!--- <cfoutput>#spr_get_NUR_User_Cntry.recordCount#</cfoutput><cfabort> --->
		<cfset local.PrevCntryCD = "">
		<cfloop query="spr_get_NUR_User_Cntry" startrow="1" endrow="#spr_get_NUR_User_Cntry.recordCount#">
			
			<cfif #usr_cntry_is_prmry# EQ "Y">
				<cfset client.NUR_Usr_Regn_CD = spr_get_NUR_User_Cntry.usr_cntry_regn_cd>
				<cfset client.NUR_Usr_CountryOfAssignmt_CD = spr_get_NUR_User_Cntry.usr_cntry_cntry_cd>
				<cfset client.NUR_Usr_CityPostOfAssignmt_NM = spr_get_NUR_User_Cntry.usr_cntry_city_post_nm>
				<cfset client.NUR_DOS_OfficeCode_CD = spr_get_NUR_User_Cntry.usr_cntry_ofc_abbr>
			
			<cfelseif #usr_cntry_is_prmry# EQ "N" 
					  AND 
					  #client.NUR_Usr_CountryOfAssignmt_CD# NEQ #spr_get_NUR_User_Cntry.usr_cntry_cntry_cd#
					  AND
					  #local.PrevCntryCD# NEQ  #spr_get_NUR_User_Cntry.usr_cntry_cntry_cd#>
					  
				<cfset local.PrevCntryCD = spr_get_NUR_User_Cntry.usr_cntry_cntry_cd>
				<cfset local.NUR_Usr_AddnlCountry_CD = spr_get_NUR_User_Cntry.usr_cntry_cntry_cd>
				
				<cfset client.NUR_Usr_AddnlCountry_CD = local.NUR_Usr_AddnlCountry_CD&",">
			</cfif>
		</cfloop>
		
		<cfset local.IfComa = Right(client.NUR_Usr_AddnlCountry_CD,1)>
		<cfif #local.IfComa# EQ ",">
			<cfset client.NUR_Usr_AddnlCountry_CD = Left(client.NUR_Usr_AddnlCountry_CD, Len(client.NUR_Usr_AddnlCountry_CD)-1)>
		</cfif><!--- <cfoutput>#client.NUR_Usr_AddnlCountry_CD#</cfoutput><cfabort> --->
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="setQSVars">
		<cfset client.QS_Done = "NO">
		<cfset client.QS_Cntry_CD = "-1">
		<cfset client.QS_Role_ID = "-1">
		<cfset client.QS_LName = "">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="defineVarsForCustSearch">
		<!--- Basic: --->
		<cfset client.CS_Search_ID = "0">
		<cfset client.CS_Search_Nm = "">
		<!--- ... --->
		<cfset client.CS_First_Nm = "">
		<cfset client.CS_Last_Nm = "">
		<cfset client.CS_Gender = "-1">
		<!--- ... --->
		<cfset client.CS_From_Cntry = "-1">
		<cfset client.CS_To_Cntry = "-1">
		<!--- ... --->
		<cfset client.CS_Pgm_Type = "-1">
		<!--- ... --->
		<cfset client.CS_Year_Type = "-1">
		<cfset client.CS_Year = "-1">
		<!--- ... --->
		<cfset client.CS_SearchCriteria = "">
		<cfset client.CS_Citznsp_Cntry_CD = "-1">
		<cfset client.CS_Resdnc_Cntry_CD = "-1">
		<cfset client.ShowHideSavedSearches = "HIDE">
		<!--- ... --->
		<!--- ADVANCED FIELDS --->
		<cfset client.CS_Field_Stdy_Nm = "">
		<cfset client.CS_Citznsp_Cntry_CD = "-1">
		<cfset client.CS_Resdnc_Cntry_CD = "-1">
		<cfset client.CS_Resdnc_City_Nm = "">
		<cfset client.CS_Host_Instn_Nm ="">
		<cfset client.CS_Visit_City_Nm = "">
		<!--- Prominent --->
		<cfset client.CS_Prominent_CD = "-1">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="doCustomSearch">
		
		<cfset client.AnyChanges = FORM.h_AnyChanges>
		<!--- Could be 0 for new search or some number if custom search is selected --->
		<cfset client.CS_Search_ID = FORM.h_CS_Search_ID>
		<!--- Could be "empty string", if not ,than custom search is selected --->
		<!--- <cfset client.CS_Search_Nm = "">
		<cfif client.AnyChanges EQ "NO"> --->
			<cfset client.CS_Search_Nm = FORM.txt_CS_Search_Nm>
		<!--- </cfif> --->
		<!--- ... --->
		<cfset client.CS_First_Nm = Trim(FORM.txt_CS_Frst_Nm)>
		<cfset client.CS_Last_Nm = Trim(FORM.txt_CS_Last_Nm)>
		<cfset client.CS_Gender = FORM.ddlb_CS_Gender>
		<!--- ... --->
		<cfset client.CS_From_Cntry = FORM.ddlbm_CS_From_Cntry>
		<cfset local.MinusOne = Left(client.CS_From_Cntry, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_From_Cntry)# GT 2>
			<cfset client.CS_From_Cntry = Mid(client.CS_From_Cntry,4,Len(client.CS_From_Cntry))>
		</cfif>
		<cfset client.h_CS_From_Cntry = FORM.h_CS_From_Cntry>
		<!--- ... --->
		<cfset client.CS_To_Cntry = FORM.ddlbm_CS_To_Cntry>
		<cfset local.MinusOne = Left(client.CS_To_Cntry, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_To_Cntry)# GT 2>
			<cfset client.CS_To_Cntry = Mid(client.CS_To_Cntry,4,Len(client.CS_To_Cntry))>
		</cfif>
		<cfset client.h_CS_To_Cntry = FORM.h_CS_To_Cntry>
		<!--- ... --->
		<cfset client.CS_Pgm_Type = FORM.ddlbm_CS_Pgm_Type>
		<cfset local.MinusOne = Left(client.CS_Pgm_Type, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_Pgm_Type)# GT 2>
			<cfset client.CS_Pgm_Type = Mid(client.CS_Pgm_Type,4,Len(client.CS_Pgm_Type))>
		</cfif>
		<!--- ... --->
		<cfset client.CS_Year_Type = FORM.ddlb_CS_Year_Type>
		<cfset client.CS_Year = FORM.ddlb_CS_Year>
		<cfset local.MinusOne = Left(client.CS_Year, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_Year)# GT 2>
			<cfset client.CS_Year = Trim(Mid(client.CS_Year,4,Len(client.CS_Year)))>
		</cfif>
		<!--- ... --->
		<cfset client.CS_SearchCriteria = FORM.h_SearchCriteria>
		<cfset client.CS_Citznsp_Cntry_CD = FORM.ddlb_CS_Citznsp_Cntry_CD>
		<cfset client.CS_Resdnc_Cntry_CD = FORM.ddlb_CS_Resdnc_Cntry_CD>
		<!--- <cfset client.CS_Prominent_CD = FORM.ddlb_CS_ALMN_PROMINENT_CD> --->
		<cfset client.ShowHideSavedSearches = FORM.h_ShowHideSavedSearches>
		<!--- ... --->
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="setValsFromSreen">
		<!--- Could be 0 for new search or some number if custom search is selected --->
		<cfset client.CS_Search_ID = FORM.h_CS_Search_ID>
		<!--- Could be "empty string", if not ,than custom search is selected --->
		<cfset client.CS_Search_Nm = FORM.txt_CS_Search_Nm>
		<!--- ... --->
		<cfset client.CS_First_Nm = Trim(FORM.txt_CS_Frst_Nm)>
		<cfset client.CS_Last_Nm = Trim(FORM.txt_CS_Last_Nm)>
		<cfset client.CS_Gender = FORM.ddlb_CS_Gender>
		<!--- ... --->
		
		
		<cfset client.CS_From_Cntry = FORM.ddlbm_CS_From_Cntry>
		<cfset local.MinusOne = Left(client.CS_From_Cntry, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_From_Cntry)# GT 2>
			<cfset client.CS_From_Cntry = Mid(client.CS_From_Cntry,4,Len(client.CS_From_Cntry))>
		</cfif>
		<cfset client.h_CS_From_Cntry = FORM.h_CS_From_Cntry>
		<!--- ... --->
		<cfset client.CS_To_Cntry = FORM.ddlbm_CS_To_Cntry>
		<cfset local.MinusOne = Left(client.CS_To_Cntry, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_To_Cntry)# GT 2>
			<cfset client.CS_To_Cntry = Mid(client.CS_To_Cntry,4,Len(client.CS_To_Cntry))>
		</cfif>
		<cfset client.h_CS_To_Cntry = FORM.h_CS_To_Cntry>
				
		<cfset client.CS_Pgm_Type = FORM.ddlbm_CS_Pgm_Type>
		<cfset local.MinusOne = Left(client.CS_Pgm_Type, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_Pgm_Type)# GT 2>
			<cfset client.CS_Pgm_Type = Mid(client.CS_Pgm_Type,4,Len(client.CS_Pgm_Type))>
		</cfif>
		<!--- ... --->
		<cfset client.CS_Year_Type = FORM.ddlb_CS_Year_Type>
		<cfset client.CS_Year = FORM.ddlb_CS_Year>
		<cfset local.MinusOne = Left(client.CS_Year, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_Year)# GT 2>
			<cfset client.CS_Year = Trim(Mid(client.CS_Year,4,Len(client.CS_Year)))>
		</cfif>
		<!--- ... --->
		<cfset client.CS_SearchCriteria = FORM.h_SearchCriteria>
		<cfset client.ShowHideSavedSearches = FORM.h_ShowHideSavedSearches>
		<!--- ADVANCED FIELDS --->
		<cfset client.CS_Field_Stdy_Nm = FORM.txt_CS_Field_Stdy_Nm>

		<cfif local.Controller EQ "doStatReport"><!--- ALLA --->
			<cfset client.CS_Prominent_CD = FORM.ddlb_CS_ALMN_PROMINENT_CD>
		</cfif>

		<cfset client.CS_Citznsp_Cntry_CD = FORM.ddlb_CS_Citznsp_Cntry_CD>
		<cfset client.CS_Resdnc_Cntry_CD = FORM.ddlb_CS_Resdnc_Cntry_CD>
		<cfset client.CS_Resdnc_City_Nm = FORM.txt_CS_Resdnc_City_Nm>
		<cfset client.CS_Host_Instn_Nm = FORM.txt_CS_Host_Instn_Nm>
		<cfset client.CS_Visit_City_Nm = FORM.txt_CS_Visit_City_Nm>
		<!---  <cfoutput>#client.CS_Prominent_CD#</cfoutput><cfabort> ---> 
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="updateVars">
		<cfoutput query="spr_getCustomSearch">
			<cfset client.CS_Search_ID = #cust_search_id#>
			<cfset client.CS_Search_Nm = #cust_search_nm#>
			<cfset client.CS_First_Nm = #cust_search_frst_nm#>
			<cfset client.CS_Last_Nm = #cust_search_last_nm#>
			<cfset client.CS_Gender = #cust_search_gender_cd#>
			
			<cfset client.CS_From_Cntry = #cust_search_from_cntry_cd#>
			<cfset client.CS_To_Cntry = #cust_search_to_cntry_cd#>
			<cfset client.CS_Pgm_Type = #cust_search_pgm_type_cd#>
			<cfset client.CS_Year_Type = #cust_search_yr_type#>
			<cfset client.CS_Year = #cust_search_yr#>
			<!--- Begin Advanced --->
			<cfset client.CS_Field_Stdy_Nm = #cust_search_field_stdy_nm#>
			<!--- <cfset client.CS_Prominent_CD = #CUST_SEARCH_PROMINENT_CD#> --->
			
			<cfset client.CS_Citznsp_Cntry_CD = #cust_search_ctznsp_cntry_cd#>

			<cfset client.CS_Resdnc_Cntry_CD = #cust_search_resdnc_cntry_cd#>
			<cfset client.CS_Resdnc_City_Nm = #cust_search_resdnc_city_nm#>
			<cfset client.CS_Host_Instn_Nm = #cust_search_host_inst_nm#>
			<cfset client.CS_Visit_City_Nm = #cust_search_city_visit_nm#>
			<!--- End of Advanced --->
		</cfoutput>
	</cfcase>
	
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="setVarsFofDynamicSQL">
	
		<cfset local.col_Counter = 0>
				<!--- ....................................... --->
				<cfset local.PGM_FROM_CNTRY_CD = "">
				<cfset local.col_CntryFrom = "">
				<cfif IsDefined("FORM.cbx_AH_Cntry_From")>
					<cfset local.PGM_FROM_CNTRY_CD = "Chr(60) || 'td' || Chr(62) || pack_alumni_archive.f_getCntryNM(pgm_from_cntry_cd)|| Chr(60) || '/td' || Chr(62)||  ">
					<cfset local.col_CntryFrom = "<th>Country From</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_TO_CNTRY_CD = "">
				<cfset local.col_CntryTo = "">
				<cfif IsDefined("FORM.cbx_AH_Cntry_To")>
					<cfset local.PGM_TO_CNTRY_CD = " Chr(60) || 'td' || Chr(62) ||  pack_alumni_archive.f_getCntryNM(pgm_to_cntry_cd) || Chr(60) || '/td' || Chr(62)|| ">	
					<cfset local.col_CntryTo = "<th>Country To</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_TYPE_CD = "">
				<cfset local.col_PgmType = "">
				<cfif IsDefined("FORM.cbx_AH_Pgm_Type")>
					<cfset local.PGM_TYPE_CD = " Chr(60) || 'td' || Chr(62) || pgm_type.pgm_type_nm || Chr(60) || '/td' || Chr(62)||  ">
					<cfset local.col_PgmType = "<th>Program Type</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_FIELD_STDY_CD = ""> 
				<cfset local.col_FieldStd = ""> 
				<cfif IsDefined("FORM.cbx_AH_Field_Stdy")>
					<cfset local.PGM_FIELD_STDY_CD = "  Chr(60) || 'td' || Chr(62) || field_stdy.field_stdy_nm || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_FieldStd = "<th>Field of Study/Project Subject</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<!--- ....................................... --->
				<cfset local.PGM_FY_DT = ""> 
				<cfset local.col_FY = ""> 
				<cfif IsDefined("FORM.cbx_AH_Pgm_Fy")>	
					<cfset local.PGM_FY_DT = "  Chr(60) || 'td' || Chr(62) ||  pgm.pgm_fy_dt || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_FY = "<th>Fiscal Year</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_YR_DT = ""> 
				<cfset local.col_PgmYear = ""> 
				<cfif IsDefined("FORM.cbx_AH_Pgm_Yr")>
					<cfset local.PGM_YR_DT = "  Chr(60) || 'td' || Chr(62) || pgm.pgm_yr_dt || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_PgmYear =  "<th>Program Year</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_START_DT = "">
				<cfset local.col_PGMStartDt = "">
				<cfif IsDefined("FORM.cbx_AH_Pgm_Start_Dt")>
					<cfset local.PGM_START_DT = "  Chr(60) || 'td' || Chr(62) || pgm.pgm_start_dt || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_PGMStartDt = "<th>Program Start Date</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_END_DT = "">
				<cfset local.col_PGMEndDt = "">
				<cfif IsDefined("FORM.cbx_AH_Pgm_End_Dt")>
					<cfset local.PGM_END_DT = " Chr(60) || 'td' || Chr(62) || pgm.pgm_end_dt|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_PGMEndDt = "<th>Program End Date</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<!--- ....................................... --->
				<cfset local.PLACE_VISIT_HOST_INST_NM = ""> 
				<cfset local.col_HostInst = ""> 
				<cfif IsDefined("FORM.cbx_AH_Host_Inst") AND #FORM.txt_CS_Host_Instn_Nm# NEQ "">
					<cfset local.PLACE_VISIT_HOST_INST_NM = "  Chr(60) || 'td' || Chr(62) || pack_alumni_archive.f_getHostInst(pgm.pgm_id, pgm.pgm_almn_id, '#FORM.txt_CS_Host_Instn_Nm#', '#FORM.ddlbm_CS_To_Cntry#') || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_HostInst = "<th>Host Institution</th>"> 
					<cfset local.col_Counter = local.col_Counter + 1>
				<cfelseif IsDefined("FORM.cbx_AH_Host_Inst") AND #FORM.txt_CS_Host_Instn_Nm# EQ "">
					<!--- if host inst is not search criteria --->
					<cfset local.PLACE_VISIT_HOST_INST_NM = "  Chr(60) || 'td' || Chr(62) || pack_alumni_archive.f_getHostInst(pgm.pgm_id, pgm.pgm_almn_id)|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_HostInst = "<th>Host Institution(s)</th>"> 
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				
				<cfset local.PLACE_VISIT_CITY_NM = ""> 		
				<cfset local.col_CityVisited = ""> 
				<cfif IsDefined("FORM.cbx_AH_City_Visited") AND #FORM.txt_CS_Visit_City_Nm# NEQ "">
					<cfset local.PLACE_VISIT_CITY_NM = "  Chr(60) || 'td' || Chr(62) || pack_alumni_archive.f_getCityVisited(pgm.pgm_id, pgm.pgm_almn_id, '#FORM.txt_CS_Visit_City_Nm#','#FORM.ddlbm_CS_To_Cntry#') || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_CityVisited = "<th>City Visited</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				<cfelseif IsDefined("FORM.cbx_AH_City_Visited") AND #FORM.txt_CS_Visit_City_Nm# EQ "">
					<!--- if city visited is not search criteria --->
					<cfset local.PLACE_VISIT_CITY_NM = "  Chr(60) || 'td' || Chr(62) || pack_alumni_archive.f_getCityVisited(pgm.pgm_id, pgm.pgm_almn_id) || Chr(60) || '/td' || Chr(62)||  ">
					<cfset local.col_CityVisited = "<th>City(ies) Visited</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_AGCY_NM = "">
				<cfset local.col_PGMAgncy = "">
				<cfif IsDefined("FORM.cbx_AH_Agcy_Nm")>
					<cfset local.PGM_AGCY_NM = "  Chr(60) || 'td' || Chr(62) ||  pgm.pgm_agcy_nm || Chr(60) || '/td' || Chr(62)||  ">
					<cfset local.col_PGMAgncy = "<th>Program Agency</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_PLCMNT_ORG_NM = "">
				<cfset local.col_PGMPlacement = "">
				<cfif IsDefined("FORM.cbx_AH_Plcmnt_Org_Nm")>
					<cfset local.PGM_PLCMNT_ORG_NM = "  Chr(60) || 'td' || Chr(62) ||  pgm.pgm_plcmnt_org_nm || Chr(60) || '/td' || Chr(62)||">
					<cfset local.col_PGMPlacement = "<th>Placement Org</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<!--- ....................................... --->
				<cfset local.PGM_NMTNG_ORG_NM = ""> 
				<cfset local.col_PGM_NMTNG = "">
				<cfif IsDefined("FORM.cbx_AH_Nmtng_Org_Nm")>
					<cfset local.PGM_NMTNG_ORG_NM = "  Chr(60) || 'td' || Chr(62) || pgm.pgm_nmtng_org_nm || Chr(60) || '/td' || Chr(62)||">
					<cfset local.col_PGM_NMTNG = "<th>Nominating Org</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_SUB_CTGRY_TXT = ""> 
				<cfset local.col_SubCat = "">
				<cfif IsDefined("FORM.cbx_AH_Sub_Ctgry")>
					<cfset local.PGM_SUB_CTGRY_TXT = "  Chr(60) || 'td' || Chr(62) || pgm.pgm_sub_ctgry_txt|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_SubCat = "<th>Sub Category</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_TOPIC_TXT = ""> 
				<cfset local.col_Topic = "">
				<cfif IsDefined("FORM.cbx_AH_Topic")>
					<cfset local.PGM_TOPIC_TXT = "  Chr(60) || 'td' || Chr(62) || pgm.pgm_topic_txt|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_Topic = "<th>Program Sub-Topic</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_STRTGC_GOAL_TXT = ""> 
				<cfset local.col_StratGoal = "">
				<cfif IsDefined("FORM.cbx_AH_Strtgc_Goal")>
					<cfset local.PGM_STRTGC_GOAL_TXT = " Chr(60) || 'td' || Chr(62) || pgm.pgm_strtgc_goal_txt || Chr(60) || '/td' || Chr(62)||">
					<cfset local.col_StratGoal = "<th>Strategic Goal</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.PGM_SPCL_AWARD_TXT = ""> 
				<cfset local.col_SpecAward = "">
				<cfif IsDefined("FORM.cbx_AH_Spcl_Award")>
					<cfset local.PGM_SPCL_AWARD_TXT = " Chr(60) || 'td' || Chr(62) || pgm.pgm_spcl_award_txt|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_SpecAward = "<th>Special Award</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<!--- ....................................... --->
				
				<cfset local.ALMN_PFX_DSC = ""> 
				<cfset local.col_Prefix = "">
				<cfif IsDefined("FORM.cbx_AH_Prfx")>
					<cfset local.ALMN_PFX_DSC = "Chr(60) || 'td' || Chr(62) || Initcap(decode(nvl(almn.almn_pfx_dsc,''),'-1','','','',almn.almn_pfx_dsc||' ')) || Chr(60) || '/td' || Chr(62)||">
					<cfset local.col_Prefix = "<th>Prefix</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				
				<cfset local.ALMN_FRST_NM = ""> 
				<cfset local.col_FName = "">
				<cfif IsDefined("FORM.cbx_AH_FNm")>
					<cfset local.ALMN_FRST_NM = " Chr(60) || 'td' || Chr(62) || Initcap(decode(nvl(almn.almn_frst_nm,''),'','',almn.almn_frst_nm||' '))|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_FName = "<th>First Name</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_MIDL_NM = ""> 
				<cfset local.col_MName = "">
				<cfif IsDefined("FORM.cbx_AH_MI")>
					<cfset local.ALMN_MIDL_NM = " Chr(60) || 'td' || Chr(62) || Initcap(decode(nvl(almn.almn_midl_nm,''),'','',almn.almn_midl_nm||' '))|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_MName = "<th>Middle Name</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_LAST_NM = ""> 
				<cfset local.col_LName = "">
				<cfif IsDefined("FORM.cbx_AH_LNm")>
					<cfset local.ALMN_LAST_NM = " Chr(60) || 'td' || Chr(62) || Initcap(almn.almn_last_nm)|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_LName = "<th>Last Name</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_LAST_NM2 = ""> 
				<cfset local.col_LName2 = "">
				<cfif IsDefined("FORM.cbx_AH_LNm2")>
					<cfset local.ALMN_LAST_NM2 = " Chr(60) || 'td' || Chr(62) ||  Initcap(decode(nvl(almn.almn_last_nm2,''),'','',' '||almn.almn_last_nm2))|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_LName2 = "<th>Second Last Name</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_SFX_DSC = ""> 
				<cfset local.col_Sfx = "">
				<cfif IsDefined("FORM.cbx_AH_Sfx")>
					<cfset local.ALMN_SFX_DSC = " Chr(60) || 'td' || Chr(62) ||  Initcap(decode(nvl(almn.almn_sfx_dsc,''),'','',' '||almn.almn_sfx_dsc))|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_Sfx = "<th>Suffix</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<!--- ....................................... --->
				<cfset local.ALMN_SEX_IND = "">
				<cfset local.col_Sex = "">
				<cfif IsDefined("FORM.cbx_AH_Sex")>
					<cfset local.ALMN_SEX_IND = " Chr(60) || 'td' || Chr(62) ||  almn.almn_sex_ind || Chr(60) || '/td' || Chr(62)||">
					<cfset local.col_Sex = "<th>Gender</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_DOB_DT = ""> 
				<cfset local.col_DOB = "">
				<cfif IsDefined("FORM.cbx_AH_Dob")>
					<cfset local.ALMN_DOB_DT = " Chr(60) || 'td' || Chr(62) ||  almn.almn_dob_dt|| Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_DOB = "<th>Date of Birth</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_CTZNSP_CNTRY_CD = ""> 
				<cfset local.col_Ctzn = "">
				<cfif IsDefined("FORM.cbx_AH_Cntry_Ctznsp")>
					<cfset local.ALMN_CTZNSP_CNTRY_CD = " Chr(60) || 'td' || Chr(62) ||  pack_alumni_archive.f_getCntryNM(almn_ctznsp_cntry_cd) || Chr(60) || '/td' || Chr(62)||  ">
					<cfset local.col_Ctzn = "<th>Cntry of Citizenship</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_CTZNSP_CNTRY_CD2 = ""> 
				<cfset local.col_Ctzn2 = "">
				<cfif IsDefined("FORM.cbx_AH_Cntry_Ctznsp2")>
					<cfset local.ALMN_CTZNSP_CNTRY_CD2 = " Chr(60) || 'td' || Chr(62) ||  pack_alumni_archive.f_getCntryNM(almn_ctznsp_cntry_cd2)|| Chr(60) || '/td' || Chr(62)||  ">
					<cfset local.col_Ctzn2 = "<th>Second Cntry of Citizenship</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<!--- ....................................... --->
				<cfset local.ALMN_CNTCT_IND = ""> 
				<cfset local.col_Contact = "">
				<cfif IsDefined("FORM.cbx_AH_Cntct")>
					<cfset local.ALMN_CNTCT_IND = " Chr(60) || 'td' || Chr(62) ||   almn.almn_cntct_ind || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_Contact = "<th>Contact Indicator</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_DCSD_IND = ""> 
				<cfset local.col_DCSD = "">
				<cfif IsDefined("FORM.cbx_AH_Dcsd")>
					<cfset local.ALMN_DCSD_IND = " Chr(60) || 'td' || Chr(62) ||  almn.almn_dcsd_ind|| Chr(60) || '/td' || Chr(62)||  ">
					<cfset local.col_DCSD = "<th>Deceased</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_DSABLD_IND = ""> 
				<cfset local.col_Dsabld = "">
				<cfif IsDefined("FORM.cbx_AH_Dsabld")>
					<cfset local.ALMN_DSABLD_IND = " Chr(60) || 'td' || Chr(62) || almn.almn_dsabld_ind || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_Dsabld = "<th>Disabled</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.INTRST_NM = ""> 
				<cfset local.col_Intrst = "">
				<cfif IsDefined("FORM.cbx_AH_Intrst")>
					<cfset local.INTRST_NM = " Chr(60) || 'td' || Chr(62) || pack_alumni_archive.f_getInterests(almn.almn_id)|| Chr(60) || '/td' || Chr(62)||  ">
					<cfset local.col_Intrst = "<th>Interest(s)</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<!---Prominent  --->
				<cfset local.PROMINENT_CD = ""> 
				<cfset local.col_Prominent = "">
				<cfif IsDefined("FORM.cbx_AH_Prominent")>
					<cfset local.PROMINENT_CD = " Chr(60) || 'td' || Chr(62) ||pack_alumni_archive.f_getProminentNM(almn.almn_prominent_cd)|| Chr(60) || '/td' || Chr(62)||  ">
					<cfset local.col_Prominent = "<th>Prominent Catefory</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<!---  --->
				<!--- ....................................... --->
				<cfset local.JOB_TITLE_TXT = ""> 
				<cfset local.col_Prof = "">
				<cfif IsDefined("FORM.cbx_AH_Title")>
					<cfset local.JOB_TITLE_TXT = " Chr(60) || 'td' || Chr(62) || pack_alumni_archive.f_getJobs(almn.almn_id) || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_Prof = "<th>Profession</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_ELP_SPEAK_FSI_LEVEL_NUM = ""> 
				<cfset local.col_ELPSpeak = "">
				<cfif IsDefined("FORM.cbx_AH_ELP_Speak")>
					<cfset local.ALMN_ELP_SPEAK_FSI_LEVEL_NUM = " Chr(60) || 'td' || Chr(62) || almn.almn_elp_speak_fsi_level_num || Chr(60) || '/td' || Chr(62)|| ">
					<cfset local.col_ELPSpeak = "<th>ELP Speak</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_ELP_READ_FSI_LEVEL_NUM = ""> 
				<cfset local.col_ELPRead = "">
				<cfif IsDefined("FORM.cbx_AH_ELP_Read")>
					<cfset local.ALMN_ELP_READ_FSI_LEVEL_NUM = " Chr(60) || 'td' || Chr(62) ||  almn.almn_elp_read_fsi_level_num || Chr(60) || '/td' || Chr(62)||">
					<cfset local.col_ELPRead = "<th>ELP Read</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.ALMN_ELP_COMP_FSI_LEVEL_NUM = ""> 
				<cfset local.col_ELPComp = "">
				<cfif IsDefined("FORM.cbx_AH_ELP_Comp")>
					<cfset local.ALMN_ELP_COMP_FSI_LEVEL_NUM = " Chr(60) || 'td' || Chr(62) || almn.almn_elp_comp_fsi_level_num || Chr(60) || '/td' || Chr(62)||">
					<cfset local.col_ELPComp = "<th>ELP Comprehension</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<cfset local.USR_COMNT_COMNT_TXT = ""> 
				<cfset local.col_Comm= "">
				<cfif IsDefined("FORM.cbx_AH_Comments")>
					<cfset local.USR_COMNT_COMNT_TXT = " Chr(60) || 'td' || Chr(62) || almn.almn_notes_txt || Chr(60) || '/td' || Chr(62)||">
					<cfset local.col_Comm = "<th>Comments</th>">
					<cfset local.col_Counter = local.col_Counter + 1>
				</cfif>
				<!--- ....................................... --->
				 
				<cfset local.ALMN_BSNS_NM = "">
				<cfset local.col_BSNS_NM = "">

				<cfset local.ALMN_BSNS_ADRS_TXT = "">
				<cfset local.col_BSNS_ADRS_TXT = "">
				<cfset local.ALMN_BSNS_CITY_NM = "">
				<cfset local.col_BSNS_CITY_NM = "">
				<cfset local.ALMN_BSNS_STATE_PRVNC_NM = "">
				<cfset local.col_BSNS_STATE_PRVNC_NM = "">
				<cfset local.ALMN_BSNS_POSTL_CD = "">
				<cfset local.col_BSNS_POSTL_CD = "">
				<cfset local.ALMN_BSNS_CNTRY_CD = "">
				<cfset local.col_BSNS_CNTRY_CD = "">
				
				<cfset local.ALMN_RESDNC_ADRS_TXT = "">
				<cfset local.col_RESDNC_ADRS_TXT = "">
				<cfset local.ALMN_RESDNC_CITY_NM = "">
				<cfset local.col_RESDNC_CITY_NM = "">
				<cfset local.ALMN_RESDNC_STATE_PRVNC_NM = "">
				<cfset local.col_RESDNC_STATE_PRVNC_NM = "">
				<cfset local.ALMN_RESDNC_POSTL_CD = "">
				<cfset local.col_RESDNC_POSTL_CD = "">
				<cfset local.ALMN_RESDNC_CNTRY_CD = "">
				<cfset local.col_RESDNC_CNTRY_CD = "">
				
				<cfif IsDefined("FORM.cbx_AH_BusAddr")>
						<cfset local.ALMN_BSNS_NM = " Chr(60) || 'td' || Chr(62) || almn.almn_bsns_nm || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_BSNS_NM = "<th>Business Name</th>">
						<cfset local.ALMN_BSNS_ADRS_TXT = " Chr(60) || 'td' || Chr(62) || almn.almn_bsns_adrs_txt || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_BSNS_ADRS_TXT = "<th>Business Address</th>">
						<cfset local.ALMN_BSNS_CITY_NM = " Chr(60) || 'td' || Chr(62) || almn.almn_bsns_city_nm || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_BSNS_CITY_NM = "<th>Business City</th>">
						<cfset local.ALMN_BSNS_STATE_PRVNC_NM = " Chr(60) || 'td' || Chr(62) || almn.almn_bsns_state_prvnc_nm || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_BSNS_STATE_PRVNC_NM = "<th>Business State/Ppovince</th>">
						<cfset local.ALMN_BSNS_POSTL_CD = " Chr(60) || 'td' || Chr(62) || almn.almn_bsns_postl_cd || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_BSNS_POSTL_CD = "<th>Business Postal Code</th>">
						<cfset local.ALMN_BSNS_CNTRY_CD = " Chr(60) || 'td' || Chr(62) || pack_alumni_archive.f_getCntryNM(almn.almn_bsns_cntry_cd) || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_BSNS_CNTRY_CD = "<th>Business Country</th>">
						
						<cfset local.col_Counter = #local.col_Counter# + 6>
				</cfif>
				
				<cfif IsDefined("FORM.cbx_AH_HomeAddr")>
						<cfset local.ALMN_RESDNC_ADRS_TXT = " Chr(60) || 'td' || Chr(62) || almn.almn_resdnc_adrs_txt || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_RESDNC_ADRS_TXT = "<td>Residence Address</td>">
						<cfset local.ALMN_RESDNC_CITY_NM = " Chr(60) || 'td' || Chr(62) || almn.almn_resdnc_city_nm || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_RESDNC_CITY_NM = "<td>Residence City</td>">
						<cfset local.ALMN_RESDNC_STATE_PRVNC_NM = " Chr(60) || 'td' || Chr(62) || almn.almn_resdnc_state_prvnc_nm || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_RESDNC_STATE_PRVNC_NM = "<td>Residence State/Ppovince</td>">
						<cfset local.ALMN_RESDNC_POSTL_CD = " Chr(60) || 'td' || Chr(62) || almn.almn_resdnc_postl_cd || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_RESDNC_POSTL_CD = "<td>Residence Postal Code</td>">
						<cfset local.ALMN_RESDNC_CNTRY_CD = " Chr(60) || 'td' || Chr(62) || pack_alumni_archive.f_getCntryNM(almn.almn_resdnc_cntry_cd) || Chr(60) || '/td' || Chr(62)||">
						<cfset local.col_RESDNC_CNTRY_CD = "<td>Residence Country</td>">
						
						<cfset local.col_Counter = #local.col_Counter# + 5>
				</cfif>
				<!--- ....................................... --->
				<cfset local.col_null = "">
				<cfset local.vTo = 40 - local.col_Counter>
				<cfloop from="1" index="i" to="#local.vTo#" >
					<cfset local.col_null = local.col_null & " , null" >
				</cfloop>
	
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
		
	<cfcase value="getMergeVals">
				<!--- inc_MergeDups_NAME.cfm: --->
				<cfset local.Mrg_ALMN_ID = "#client.AP_AlmnID#">
				
				<cfset local.ALMN_ALL_IDs = FORM.h_almn_id>
				<cfset local.ALMN_Loop_Counter = FORM.h_loop_counter>
								
				<cfset local.ALMN_PFX_DSC = FORM.ddlb_PRFX>
				<cfset local.ALMN_FRST_NM = FORM.txt_FNME>
				<cfset local.ALMN_MIDL_NM = FORM.txt_MINT>
				<cfset local.ALMN_LAST_NM = FORM.txt_LNME>
				<cfset local.ALMN_LAST_NM2 = FORM.txt_LNM2>
				<cfset local.ALMN_SFX_DSC = FORM.txt_SUFX>
				
				<!--- inc_MergeDups_Sex_DOB.cfm: --->
				<cfset local.ALMN_SEX_IND = FORM.ddlb_SEXI>
				<cfset local.ALMN_DOB_DT = FORM.txt_ADOB>
				
				<!--- inc_MergeDups_DCSD_DESBL.cfm: --->
				<cfset local.ALMN_DCSD_IND = FORM.ddlb_DEAD>
				<cfset local.ALMN_DSABLD_IND = FORM.ddlb_DSBL>
								
				<!--- inc_MergeDups_CTZNSP.cfm: --->
				<!--- CNTRY OF Citizenship --->
				<cfset local.ALMN_CTZNSP_CNTRY_CD = FORM.ddlb_CTZP>
				<!--- CNTRY OF Citizenship 2 --->
				<cfset local.ALMN_CTZNSP_CNTRY_CD2 = FORM.ddlb_CTZ2>
				
				<!--- inc_MergeDups_RES_ADDR.cfm: --->
				<cfset local.ALMN_RESDNC_ADRS_TXT = FORM.txt_RADD>
				<cfset local.ALMN_RESDNC_CITY_NM = FORM.txt_RCTY>
				<cfset local.ALMN_RESDNC_STATE_PRVNC_NM = FORM.txt_RSPR>
				<cfset local.ALMN_RESDNC_POSTL_CD = FORM.txt_RZIP>
				<cfset local.ALMN_RESDNC_CNTRY_CD = FORM.ddlb_RCRY>
				
				<!--- inc_MergeDups_BUS_ADDR.cfm: --->
				<cfset local.ALMN_BSNS_ADRS_TXT = FORM.txt_BADD>
				<cfset local.ALMN_BSNS_NM = FORM.txt_BNME>
				<cfset local.ALMN_BSNS_CITY_NM = FORM.txt_BCTY>
				<cfset local.ALMN_BSNS_STATE_PRVNC_NM = FORM.txt_BSPR>
				<cfset local.ALMN_BSNS_POSTL_CD = FORM.txt_BZIP>
				<cfset local.ALMN_BSNS_CNTRY_CD = FORM.ddlb_BCRY>
				
				<!--- inc_MergeDups_PRFRD_ADDR.cfm: --->
				<cfset local.ALMN_PREFRD_ADRS_IND = FORM.ddlb_PADD>
				
				<!--- inc_MergeDups_PHONE.cfm --->
				<cfset local.ALMN_RESDNC_PHONE_NUM = FORM.txt_RPHN>
				<cfset local.ALMN_BSNS_PHONE_NUM = FORM.txt_BPHN>
				<cfset local.ALMN_CELL_NUM = FORM.txt_CPHN>
				<cfset local.ALMN_OTHR_PHONE_NUM = FORM.txt_OPHN>
				
				<!--- inc_MergeDups_FAX.cfm --->
				<cfset local.ALMN_FAX_NUM = FORM.txt_FNUM>
				
				<!--- inc_MergeDups_PRFRD_PHONE.cfm: ---><!--- ## --->
				<cfset local.ALMN_PREFRD_PHONE_NUM_IND = FORM.ddlb_PPHN>
				
				<!--- inc_MergeDups_EMAIL.cfm: --->
				<cfset local.ALMN_EMAIL1_TXT = FORM.txt_EMAL>
				<cfset local.ALMN_EMAIL2_TXT = FORM.txt_EML2>
				
				<!--- inc_MergeDups_PRFRD_EMAIL.cfm --->
				<cfset local.ALMN_PREFRD_EMAIL_IND = FORM.ddlb_PEML>
				
				<!--- inc_MergeDups_CONTACT.cfm --->
				<cfset local.ALMN_CNTCT_IND = FORM.ddlb_CNCT>
				
				<!--- inc_MergeDups_ELP.cfm --->
				<cfset local.ALMN_ELP_SPEAK_FSI_LEVEL_NUM = FORM.ddlb_ELPS>
				<cfset local.ALMN_ELP_READ_FSI_LEVEL_NUM = FORM.ddlb_ELPR>
				<cfset local.ALMN_ELP_COMP_FSI_LEVEL_NUM = FORM.ddlb_ELPC>
							
				<!--- inc_MergeDups_COMMENTS.cfm --->
				<cfset local.ALMN_NOTES_TXT = FORM.txt_NOTS>
	
	
	</cfcase>
<!--- -------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="TOPIC_UPDATE">
				<cfset local.topic_id = FORM.h_topic_id>
				<cfset local.topic_title = FORM.h_topic_title>
				<cfset local.topic_txt = FORM.h_topic_txt>
				<cfset local.topic_seq_on_page = FORM.h_topic_seq_on_page>
				<cfset local.topic_is_active = FORM.h_topic_is_active>
				<cfset local.topic_exprtn_dt = FORM.h_topic_exprtn_dt>
				<cfset local.Elmt_ID_Val = FORM.h_Elmt_ID_Val>
				<cfset local.NumOfLoops = FORM.h_NumOfLoops>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

<!--- ----------------------------------------------------------------------------------------------------------------- --->

<!--- ----------------------------------------------------------------------------------------------------------------- --->



	
	<cfcase value="getValsFromPage_ADV">
		<!--- Could be 0 for new search or some number if custom search is selected --->
		<cfset client.CS_Search_ID = FORM.h_CS_Search_ID>
		
		<!--- Could be "empty string", if not ,than custom search is selected --->
		<cfset client.CS_Search_Nm = FORM.txt_CS_Search_Nm>
		
		<!--- <cfset client.CS_Search_Type = "BSC"> --->
		
		<!--- Could be "empty string" --->
		<cfset client.CS_First_Nm = Trim(FORM.txt_CS_Frst_Nm)>
				
		<!--- Could be "empty string" --->
		<cfset client.CS_Last_Nm = Trim(FORM.txt_CS_Last_Nm)>
		
		<!--- Could be "-1" - Gender is not selected or some value, gender is selected --->
		<cfset client.CS_Gender = FORM.ddlb_CS_Gender>
		
		<cfset client.CS_From_Cntry = FORM.ddlbm_CS_From_Cntry>
		<cfset local.MinusOne = Left(client.CS_From_Cntry, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_From_Cntry)# GT 2>
			<cfset client.CS_From_Cntry = Mid(client.CS_From_Cntry,4,Len(client.CS_From_Cntry))>
		</cfif>
		
		<cfset client.CS_To_Cntry = FORM.ddlbm_CS_To_Cntry>
		<cfset local.MinusOne = Left(client.CS_To_Cntry, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_To_Cntry)# GT 2>
			<cfset client.CS_To_Cntry = Mid(client.CS_To_Cntry,4,Len(client.CS_To_Cntry))>
		</cfif>
				
		<cfset client.CS_Pgm_Type = FORM.ddlbm_CS_Pgm_Type>
		<cfset local.MinusOne = Left(client.CS_Pgm_Type, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_Pgm_Type)# GT 2>
			<cfset client.CS_Pgm_Type = Mid(client.CS_Pgm_Type,4,Len(client.CS_Pgm_Type))>
		</cfif>
				
		<cfset client.CS_Year_Type = FORM.ddlb_CS_Year_Type>
		<cfset client.CS_Year = FORM.ddlb_CS_Year>
		<cfset local.MinusOne = Left(client.CS_Year, 2)>
		<cfif local.MinusOne EQ "-1" AND #Len(client.CS_Year)# GT 2>
			<cfset client.CS_Year = Mid(client.CS_Year,4,Len(client.CS_Year))>
		</cfif>
		<!--- End of Basic --->
		<!--- Begin Advanced --->
		<cfset client.CS_Field_Stdy_Nm = FORM.txt_CS_Field_Stdy_Nm>
		<cfset client.CS_Citznsp_Cntry_CD = FORM.ddlb_CS_Citznsp_Cntry_CD>
		<cfset client.CS_Resdnc_Cntry_CD = FORM.ddlb_CS_Resdnc_Cntry_CD>
		<cfset client.CS_Resdnc_City_Nm = FORM.txt_CS_Resdnc_City_Nm>
		<cfset client.CS_Host_Instn_Nm = FORM.txt_CS_Host_Instn_Nm>
		<cfset client.CS_Visit_City_Nm = FORM.txt_CS_Visit_City_Nm>
		<!--- End of Advanced --->
		<cfset client.CS_SearchCriteria = FORM.h_SearchCriteria>
		
		<cfoutput>
		client.CS_Field_Stdy_Nm = #client.CS_Field_Stdy_Nm#<br>
		client.CS_Citznsp_Cntry_CD = #client.CS_Citznsp_Cntry_CD#<br>
		client.CS_Resdnc_Cntry_CD = #client.CS_Resdnc_Cntry_CD#<br>
		client.CS_Resdnc_City_Nm = #client.CS_Resdnc_City_Nm#<br>
		client.CS_Host_Instn_Nm = #client.CS_Host_Instn_Nm#<br>
		client.CS_Visit_City_Nm = #client.CS_Visit_City_Nm#<br>
		</cfoutput><cfabort>
		
	</cfcase>
<!---  ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="mergePgm_and_PV">
	
			<!--- ------------------------------------- --->
			<cfset local.PgmID_AlmnID_Checked = FORM.h_PgmID_AlmnID_Checked>
			<!--- ------------------------------------- --->
			<!--- <cfset local. = FORM.---pgm_id> --->
			<cfset local.pgm_type_nm = FORM.ddlb_mrgd_pgm_type_nm>
			<cfset local.pgm_fy_dt   = FORM.txt_mrgd_pgm_fy_dt>
			<cfset local.pgm_yr_dt   = FORM.txt_mrgd_pgm_yr_dt>
			<cfset local.pgm_from_cntry_nm = FORM.ddlb_mrgd_pgm_from_cntry_nm>
			<cfset local.pgm_to_cntry_nm   = FORM.ddlb_mrgd_pgm_to_cntry_nm>
			<cfset local.pgm_start_dt      = FORM.txt_mrgd_pgm_start_dt>
			<cfset local.pgm_end_dt        = FORM.txt_mrgd_pgm_end_dt>
			<cfset local.pgm_field_stdy_nm = FORM.ddlb_mrgd_pgm_field_stdy_nm>
			<!--- for local.pgm_field_stdy_nm to prevent DB error reassign "" value to "-1" --->
			<cfif local.pgm_field_stdy_nm EQ "">
				<cfset local.pgm_field_stdy_nm = "-1">
			</cfif>
			<cfset local.pgm_agcy_nm       = FORM.txt_mrgd_pgm_agcy_nm>
			<cfset local.pgm_plcmnt_org_nm = FORM.txt_mrgd_pgm_plcmnt_org_nm>
			<cfset local.pgm_nmtng_org_nm  = FORM.txt_mrgd_pgm_nmtng_org_nm>
			<cfset local.pgm_sub_ctgry_txt = FORM.txt_mrgd_pgm_sub_ctgry_txt>
			<cfset local.pgm_topic_txt     = FORM.txt_mrgd_pgm_topic_txt>
			<cfset local.pgm_strtgc_goal_txt = FORM.txt_mrgd_pgm_strtgc_goal_txt>
			<cfset local.pgm_spcl_award_txt  = FORM.txt_mrgd_pgm_spcl_award_txt>
			<cfset local.pgm_updt_dt         = FORM.txt_mrgd_pgm_updt_dt>
			<cfset local.pgm_updt_id 		 = FORM.txt_mrgd_pgm_updt_id>
			<!--- <cfset local. = FORM.---pgm_src_nm> --->
			<!--- ------------------------------------- --->
			<cfset local.PlaceVisited_Checked = FORM.h_PlaceVisited_Checked>
			<!--- ------------------------------------- --->
			
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
</cfswitch>