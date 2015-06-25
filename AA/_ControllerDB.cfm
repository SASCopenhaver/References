<!--- _ControllerDB.cfm --->
<!--- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --->
<!--- <cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_" value="" null="no"> --->
<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_" value="" null="no"> --->
<!--- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --->


<cfswitch expression="#client.ControllerDB#">
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getNavigation">
	<!--- <cfoutput>#client.Usr_Role_CD#</cfoutput><cfabort> --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getNavigation" returncode="no">
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="argUsr_Role_ID" value="#client.Usr_Role_CD#" null="no">
				
				<cfprocresult name="spr_getNavigation" resultset="1">
				
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getNavigation#" output="client.sprWDDX_getNavigation">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getAllNavigationItems">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getAllNavigationItems" returncode="no">
				<cfprocresult name="spr_getAllNavigationItems" resultset="1">
				<cfprocresult name="spr_getUserRole_NavigItem" resultset="2">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getAllNavigationItems#" output="client.sprWDDX_getAllNavigationItems">
		<cfwddx action="cfml2wddx" input="#spr_getUserRole_NavigItem#" output="client.sprWDDX_getUserRole_NavigItem">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getSecretQuestions">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getSecretQuestions" returncode="no">
				<cfprocresult name="spr_getSecretQuestions" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="AuthenticateUser">
		<!--- ....................................... --->
		<cfset client.Usr_UName = "#FORM.txt_Usr_UName#">
		<cfset client.Usr_Pass  = "#FORM.txt_Usr_Pass#"><!--- <cfoutput>#client.Usr_UName#  #client.Usr_Pass#</cfoutput><cfabort> --->
		
		<!--- ....................................... --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_AuthenticateUser" returncode="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_Usr_UName" value="#client.Usr_UName#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_Usr_Pass"  value="#client.Usr_Pass#" null="no">
				
				<cfprocresult name="spr_AuthenticateUser" resultset="1">
				
		</cfstoredproc>
		<cfset local.vAuthenticateRecordCount = spr_AuthenticateUser.recordCount>
		
				<cfif #local.vAuthenticateRecordCount# EQ "0">
					<!--- -------------------------------------- --->
					<cflocation url="_Controller.cfm?urlController=UserIsNotAuthenticated" addtoken="yes">
					<!--- -------------------------------------- --->
				<cfelseif local.vAuthenticateRecordCount EQ "1">
					<!--- -------------------------------------- --->
					<cfset client.ControllerVars = "SetAppUserVars">
					<cfinclude template="_ControllerVars.cfm">
					<!--- -------------------------------------- --->
				</cfif>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!---  
	<cfcase value="getEditUser">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getEditUser" returncode="no">
				<cfprocresult name="spr_getEditUser" resultset="1">
				<cfprocresult name="spr_getRoles" resultset="2">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getEditUser#" output="client.sprWDDX_getEditUser">
		<cfwddx action="cfml2wddx" input="#spr_getRoles#" output="client.sprWDDX_getRoles">
		
		<!--- <cfoutput>#spr_getEditUser.recordCount#<br>#spr_getRoles.recordCount#</cfoutput><cfabort> --->
	</cfcase>
 --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getTopics">
		<!--- <cfoutput>#client.CallPageID#</cfoutput><cfabort> --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getTopics" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="argCallPageID" value="#client.CallPageID#" null="no">
			<!--- Advertisement; Feature; Story; Capsule Story; --->
				<cfprocresult name="spr_getAdvertisement" resultset="1">
				<cfprocresult name="spr_getFeature" resultset="2">
				<cfprocresult name="spr_getStory" resultset="3">
				<cfprocresult name="spr_getCapsuleStory" resultset="4">
				<cfprocresult name="spr_getNews" resultset="5">
		</cfstoredproc>
	</cfcase> 
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getHelpTopics">
		<!--- <cfoutput>#client.CallPageID#</cfoutput><cfabort> --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getHelpTopics" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_TopicTitleID" value="#client.CallPageID#" null="no">
			<cfprocresult name="spr_getHelpTopics" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<!--- 
	<cfcase value="getHSandCV">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getHSandCV" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CntryToCD" value="#local.CS_CntryToCD#" null="no">
			<cfprocresult name="spr_getHostInst" resultset="1">
			<cfprocresult name="spr_getCityVisit" resultset="2">
		</cfstoredproc>
	</cfcase>
	 --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getPrefix">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getPrefix" returncode="no">
			<cfprocresult name="spr_getPrefix" resultset="1">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getPrefix#" output="client.sprWDDX_getPrefix">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getSuffix">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getSuffix" returncode="no">
			<cfprocresult name="spr_getSuffix" resultset="1">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getSuffix#" output="client.sprWDDX_getSuffix">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="getAppRoles">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getAppRoles" returncode="no">
			<cfprocresult name="spr_getAppRoles" resultset="1">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getAppRoles#" output="client.sprWDDX_getAppRoles">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getCountryCityPost">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getCountryCityPost" returncode="no">
			<cfprocresult name="spr_getCountry" resultset="1">
			<cfprocresult name="spr_getCityPost" resultset="2">
			<cfprocresult name="spr_getAdditionalCountry" resultset="3">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getCountry#" output="client.sprWDDX_getCountry">
		<cfwddx action="cfml2wddx" input="#spr_getCityPost#" output="client.sprWDDX_getCityPost">
		<cfwddx action="cfml2wddx" input="#spr_getAdditionalCountry#" output="client.sprWDDX_getAdditionalCountry"><!--- <cfoutput>#spr_getAdditionalCountry.recordCount#</cfoutput> --->
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="get_DOS_OfficeCode">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_get_DOS_OfficeCode" returncode="no">
			<cfprocresult name="spr_get_DOS_OfficeCode" resultset="1">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_get_DOS_OfficeCode#" output="client.sprWDDX_get_DOS_OfficeCode">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->


	<cfcase value="InsUpdRole">
		<cfset local.num_of_loops = ListLen(local.ValsFromRadioButtons, ";")> 
		<!---
		<cfoutput>
		#local.app_role_id#<br>
		#local.app_role_nm#<br>
		#local.app_role_desc#<br>
		#local.app_role_super_id#<br>
		#local.app_role_super_id#<br>
		#local.ValsFromRadioButtons#<br>
		#local.num_of_loops#
		</cfoutput><cfabort>
		 --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_InsUpdRole" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_app_role_id" value="#local.app_role_id#" null="no">
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_app_role_cd"  value="#local.app_role_cd#" null="no"> --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_app_role_nm"  value="#local.app_role_nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_app_role_desc"  value="#local.app_role_desc#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_app_role_super_id" value="#local.app_role_super_id#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ValsFromRadioButtons"  value="#local.ValsFromRadioButtons#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_num_of_loops" value="#local.num_of_loops#" null="no">
			
			<cfprocresult name="spr_getAppRoleID" resultset="1">
			
		</cfstoredproc>
		<cfset client.app_role_id = spr_getAppRoleID.app_role_id>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="DELETE_ROLE">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_DeleteRole" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_app_role_id" value="#client.app_role_id#" null="no">
		</cfstoredproc>
		<cfset client.app_role_id = "0">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="InsUpdNewuserRegistration">
	
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_InsUpdNewUserRegistration" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_NUR_Usr_ID" value="#client.NUR_Usr_ID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_Prfx" value="#client.NUR_Usr_Prfx#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_FName" value="#client.NUR_Usr_FName#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_MI" value="#client.NUR_Usr_MI#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_LName" value="#client.NUR_Usr_LName#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_Phone" value="#client.NUR_Usr_Phone#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_Ext" value="#client.NUR_Usr_Ext#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_Email" value="#client.NUR_Usr_Email#" null="no">
			<!--- .................................................................................................................. --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_UserName" value="#client.NUR_Usr_UserName#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_Pass" value="#client.NUR_Usr_Pass#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_NUR_Usr_AARole_ID" value="#client.NUR_Usr_RoleCD#" null="no">
			<!--- .................................................................................................................. --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_SecQ" value="#client.NUR_Usr_SecQ#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_Answer" value="#client.NUR_Usr_Answer#" null="no">
			<!--- .................................................................................................................. --->
			<cfif #client.NUR_Usr_Depart_Dt# NEQ "">
				<cfset local.NUR_Usr_Depart_Dt = UCASE(DateFormat(client.NUR_Usr_Depart_Dt, "dd-MMM-yyyy"))>
			<cfelse>
				<cfset local.NUR_Usr_Depart_Dt = "">
			</cfif>
			<!--- .................................................................................................................. --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_Depart_Dt" value="#local.NUR_Usr_Depart_Dt#" null="no">
			<!--- .................................................................................................................. --->
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_NUR_AuthAgent_ID" value="#client.NUR_AuthAgnt_ID#" null="no">
			<!--- .................................................................................................................. --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_CntryOfAssignmt_CD" value="#client.NUR_Usr_CountryOfAssignmt_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_DOS_OfficeCode_CD" value="#client.NUR_DOS_OfficeCode_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_CityPostOfAss_NM" value="#client.NUR_Usr_CityPostOfAssignmt_NM#" null="no">
			<!--- .................................................................................................................. --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_AddnlCountry_CD" value="#client.NUR_Usr_AddnlCountry_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_NUR_NumOfLoops" value="#ListLen(client.NUR_Usr_AddnlCountry_CD ,",") - 1#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_Comments" value="#client.NUR_Usr_Comments#" null="no">
			<!--- ....................................................................................................... --->
	
			<cfprocresult name="spr_getUserID" resultset="1">
		</cfstoredproc>
		<cfset client.NUR_Usr_ID = spr_getUserID.usr_cd>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	 <cfcase value="UpdUserProfileByAuthAgent"> 
	<!---
	<cfoutput>
	CountryOfAssignmt_C #FORM.ddlb_UP_Usr_CountryOfAssignmt_CD#<br>
	CityPostOfAssignmt_NM #FORM.ddlb_UP_Usr_CityPostOfAssignmt_NM#<br>
	AddnlCountry #FORM.ddlbm_UP_Usr_AddnlCountry#<br>
	DOS_OfficeCode_CD #FORM.ddlb_UP_Usr_DOS_OfficeCode_CD#<br>
	Numberofcomas #ListLen(FORM.ddlbm_UP_Usr_AddnlCountry ,",")#<br>
	newpost #FORM.txt_UP_NewPostCity#
		
	Check if New City is inserted tointo the City Table and set as Post of Assignment
	
	</cfoutput><cfabort> 
	 --->
	
	
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_UpdUserProfileByAuthAgent" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_UP_Usr_ID" value="#FORM.h_UP_Usr_ID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Prfx" value="#FORM.ddlb_UP_Usr_Prfx#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_FName" value="#FORM.txt_UP_Usr_FName#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_MI" value="#FORM.txt_UP_Usr_MI#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_LName" value="#FORM.txt_UP_Usr_LName#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Phone" value="#FORM.txt_UP_Usr_Phone#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Ext" value="#FORM.txt_UP_Usr_Ext#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Email" value="#FORM.txt_UP_Usr_Email#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_UserName" value="#FORM.txt_UP_Usr_UserName#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Pass" value="#FORM.txt_UP_Usr_Pass#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Status_CD" value="#FORM.ddlb_UP_Usr_Status_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_UP_Usr_AArchiveRole_ID" value="#FORM.ddlb_UP_Usr_AlumniArchiveRole_ID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Est_Depart" value="#FORM.txt_UP_Usr_Est_Depart#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_CntryOfAss_CD" value="#FORM.ddlb_UP_Usr_CountryOfAssignmt_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_CityPostOfAss_NM" value="#FORM.ddlb_UP_Usr_CityPostOfAssignmt_NM#" null="no">
			<!--- ... --->
			<cfset local.UP_NewPostCity = FORM.txt_UP_NewPostCity>
			<cfif #local.UP_NewPostCity# IS "">
				<cfset local.UP_NewPostCity = "NOCITY">
			</cfif>
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_NewPostCity" value="#local.UP_NewPostCity#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_AddnlCountry" value="#FORM.ddlbm_UP_Usr_AddnlCountry#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_DOS_OfficeCode_CD" value="#FORM.ddlb_UP_Usr_DOS_OfficeCode_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_UP_NumOfLoops" value="#ListLen(FORM.ddlbm_UP_Usr_AddnlCountry ,",")#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	 <cfcase value="SelfUpdUsrProfile">
	 		 <!--- ................................................. --->
			 <cfset local.txta_Comnts = "nocomments">
			 <cfset local.h_ValReqChgs = "nocomments">
			 
			 <cfif #FORM.txta_Comnts# NEQ "">
				<cfset local.txta_Comnts = FORM.txta_Comnts>
			 </cfif>
			 
			 <cfif #FORM.h_ValReqChgs# NEQ "">
				<cfset local.h_ValReqChgs = FORM.h_ValReqChgs>
			 </cfif>
	 		 <!--- ................................................. --->
	 
	 		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_SelfUpdUsrProfile" returncode="no">
				<!--- ................................................................................................................... --->
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_UP_Usr_ID" value="#FORM.h_UP_Usr_ID#" null="no">
				<!--- ... --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Prfx" value="#FORM.ddlb_UP_Usr_Prfx#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_FName" value="#FORM.txt_UP_Usr_FName#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_MI" value="#FORM.txt_UP_Usr_MI#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_LName" value="#FORM.txt_UP_Usr_LName#" null="no">
				<!--- ... --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Phone" value="#FORM.txt_UP_Usr_Phone#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Ext" value="#FORM.txt_UP_Usr_Ext#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Email" value="#FORM.txt_UP_Usr_Email#" null="no">
				<!--- ... --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_UserName" value="#FORM.txt_UP_Usr_UserName#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Pass" value="#FORM.txt_UP_Usr_Pass#" null="no">
				<!--- ................................................................................................................... --->
				<!--- ...
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_UP_Usr_AArchiveRole_ID" value="#FORM.ddlb_UP_Usr_AlumniArchiveRole_ID#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_Est_Depart" value="#FORM.txt_UP_Usr_Est_Depart#" null="no">
				
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_CntryOfAss_CD" value="#FORM.ddlb_UP_Usr_CountryOfAssignmt_CD#" null="no">
				 <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_CityPostOfAss_NM" value="#FORM.ddlb_UP_Usr_CityPostOfAssignmt_NM#" null="no">
				<cfset local.UP_NewPostCity = FORM.txt_UP_NewPostCity>
				<cfif #local.UP_NewPostCity# IS "">
					<cfset local.UP_NewPostCity = "nocity">
				</cfif>
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_NewPostCity" value="#local.UP_NewPostCity#" null="no">
				
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_AddnlCountry" value="#FORM.ddlbm_UP_Usr_AddnlCountry#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Usr_DOS_OfficeCode_CD" value="#FORM.ddlb_UP_Usr_DOS_OfficeCode_CD#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_UP_NumOfLoops" value="#ListLen(FORM.ddlbm_UP_Usr_AddnlCountry ,",")#" null="no">
				 --->
				
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_Comments" value="#local.txta_Comnts#" null="no">
				
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_ValReqChgs" value="#local.h_ValReqChgs#" null="no">
				
			</cfstoredproc>
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getNewCityRequest">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getNewCityRequest" returncode="no">
			<cfprocresult name="spr_getNewCityRequest" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getAuthAgent">
<!--- 	
<cfoutput>#client.NUR_Usr_CountryOfAssignmt_CD#<br>#client.NUR_Usr_CityPostOfAssignmt_NM#<br>#client.NUR_Usr_NewCityPostOfAssignmt#<br>#client.NUR_DOS_OfficeCode_CD#
</cfoutput>	
<cfabort>	
	
 --->	
	
	
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getAuthAgent" returncode="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_CntryOfAssignmt_CD" value="#client.NUR_Usr_CountryOfAssignmt_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_CityPostOfAss_NM" value="#client.NUR_Usr_CityPostOfAssignmt_NM#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_NewCityPostOfAss" value="#client.NUR_Usr_NewCityPostOfAssignmt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_DOS_OfficeCode_CD" value="#client.NUR_DOS_OfficeCode_CD#" null="no">
			
			<cfprocresult name="spr_getAuthAgent" resultset="1"><!--- returns active PAO or DOS office dir; if no active auth agent exists, then Admin ID returns --->
			<cfprocresult name="spr_getInactiveAuthAgent" resultset="2"><!--- returns inactive PAO or DOS office dir or '0' if auth agent is active (will be used for the email text send after registration complete)--->
		</cfstoredproc>
		<!--- <cfoutput>#spr_getInactiveAuthAgent.recordCount#</cfoutput><cfabort> --->
		<!--- <cfwddx action="cfml2wddx" input="#spr_getAuthAgent#" output="client.sprWDDX_getAuthAgent"> --->
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="get_USR_Pass">
		<!--- <cfoutput>#client.PASS_Email#<br>#client.PASS_SecQ#<br>#client.PASS_Answer#</cfoutput><cfabort> --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_get_USR_Pass" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_PASS_Email" value="#client.PASS_Email#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_PASS_SecQ" value="#client.PASS_SecQ#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_PASS_Answer" value="#client.PASS_Answer#" null="no">
			
			<cfprocresult name="spr_get_USR_Pass" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="get_NUR_User_FaxInfo">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_get_NUR_User_FaxInfo" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_NUR_Usr_ID" value="#URL.url_NUR_Usr_ID#" null="no">
			
			<cfprocresult name="spr_get_NUR_User_FaxInfo" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="get_NUR_UserIDAndStatus">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.get_NUR_UserIDAndStatus" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_Email" value="#client.NUR_Usr_Email#" null="no">
		
			<cfprocresult name="spr_NUR_UserIDAndStatus" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="get_NUR_Usr_PreReg">
		<!--- <cfoutput>#client.NUR_Usr_ID# #client.NUR_Usr_IsAct#</cfoutput><cfabort> --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_get_NUR_Usr_PreReg" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_NUR_Usr_ID" value="#client.NUR_Usr_ID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_NUR_Usr_IsAct" value="#client.NUR_Usr_IsAct#" null="no">
			
			<!--- <cfprocresult name="spr_NUR_PAO_Posts" resultset="1">  --->
			<cfprocresult name="spr_NUR_Usr_PreReg" resultset="1">
		
		</cfstoredproc>
		<!--- <cfoutput>#spr_NUR_Usr_PreReg.usr_fname#</cfoutput><cfabort> ---> 
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getListOfUsers">
			<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getListOfUsers" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no"><!--- This is CD(or ID) of the one who's running application --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_RequestedUsrType" value="#local.RequestedUsrType#" null="no">
			
			<cfprocresult name="spr_getListOfUsers" resultset="1">
			<cfprocresult name="spr_getUsrComment" resultset="2">
			<cfprocresult name="spr_getAlphaSearch" resultset="3">
			<!--- <cfprocresult name="spr_getDistinctCntryList" resultset="4"> --->
			
		</cfstoredproc>
	
		<cfwddx action="cfml2wddx" input="#spr_getAlphaSearch#" output="client.sprWDDX_getAlphaSearch">
		
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	
	
	<cfcase value="getCountUsrsByStatus">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getCountUsrsByStatus" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocresult name="spr_getListOfUsers_StatN" resultset="1">
			<cfprocresult name="spr_getListOfUsers_StatH" resultset="2">
			<cfprocresult name="spr_getListOfUsers_StatA" resultset="3">
			<cfprocresult name="spr_getListOfUsers_StatI" resultset="4">
		</cfstoredproc>
		<!--- <cfoutput>#spr_getListOfUsers_StatN.recordCount#<br>
#spr_getListOfUsers_StatH.recordCount#<br>
#spr_getListOfUsers_StatA.recordCount#<br>
#spr_getListOfUsers_StatI.recordCount#<br>
</cfoutput><cfabort> --->
	</cfcase>
	
	
	
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	
	<cfcase value="getGA_Usr">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getGA_Usr" returncode="no">
			<!--- client.GA_UsrID is declared and gets value in Controller.cfm, ubder: <cfcase value="UserProfile"> --->
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_GA_UsrID" value="#client.GA_UsrID#" null="no">
			
			<cfprocresult name="spr_getUP_Usr" resultset="1">
			<cfprocresult name="spr_getGA_UsrCntry" resultset="2">
		</cfstoredproc>
	</cfcase>
	
	
	
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	
	<cfcase value="getSelfData">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getSelfData" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			
			<cfprocresult name="spr_getSelfData" resultset="1">
			<cfprocresult name="spr_getAddlCntries" resultset="2">
		</cfstoredproc>
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getUsrStatus">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getUsrStatus" returncode="no">
			<cfprocresult name="spr_getUsrStatus" resultset="1">
		</cfstoredproc>
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="RemoveUsr">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_RemoveUsr" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_GA_UsrID" value="#local.UsrID#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="putUsrOnHold">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_putUsrOnHold" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_GA_UsrID" value="#local.UsrID#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="ApprvUsr">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_ApprvUsr" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_GA_UsrID" value="#local.UsrID#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="UpdUsrInfo">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_UpdUserData" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_UP_UsrID" value="#local.UP_UsrID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrPrfx" value="#local.UP_UsrPrfx#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrFName" value="#local.UP_UsrFName#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrMI" value="#local.UP_UsrMI#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrLName" value="#local.UP_UsrLName#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrPhone" value="#local.UP_UsrPhone#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrExt" value="#local.UP_UsrExt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrEmail" value="#local.UP_UsrEmail#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrName" value="#local.UP_UsrName#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrPass" value="#local.UP_UsrPass#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_UP_UsrRoleID" value="#local.UP_UsrRoleID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrIsAct" value="#local.UP_UsrIsAct#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrDepartDT" value="#local.UP_UsrDepartDT#" null="no">
			<!--- .............................................................................................................. --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrCntryOfAssgnCD" value="#local.UP_UsrCntryOfAssgnCD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrCityPostNM" value="#local.UP_UsrCityPostNM#" null="no">
			<!--- .............................................................................................................. --->
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrOfficeCodeCD" value="#local.UP_UsrOfficeCodeCD#" null="no"> --->
			<!--- .............................................................................................................. --->
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrAddnlCntryCD" value="#local.UP_UsrAddnlCntryCD#" null="no"> --->
			<!--- .............................................................................................................. --->
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_UP_UsrComments" value="#local.UP_UsrComments#" null="no"> --->
				
		</cfstoredproc>
		<!--- <cfoutput>#local.UP_UsrDepartDT#</cfoutput><cfabort> --->
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getCustomSearches">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getCustomSearches" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_SC_Search_Type" value="#client.CS_Search_Type#" null="no">
			
			<cfprocresult name="spr_getCustomSearches" resultset="1">
			
		</cfstoredproc>
		<!---
		<cfloop query="spr_getCustomSearches" startrow="1" endrow="#spr_getCustomSearches.recordCount#">
			<cfoutput>#cust_search_id# -- #cust_search_frst_nm#-- #cust_search_last_nm#<br></cfoutput>
		</cfloop><cfabort>
		 <cfwddx action="cfml2wddx" input="#spr_getCustomSearches#" output="client.sprWDDX_getCustomSearches">
		 --->
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getCountries">
		<!--- <cfoutput>#client.Usr_CD#</cfoutput><cfabort> --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getCountries" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocresult name="spr_getCntryFrom" resultset="1">
			<cfprocresult name="spr_getCntryTo" resultset="2">
		</cfstoredproc>
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- 	
	<cfcase value="getCntryFrom">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getCntryFrom" returncode="no">
			<cfprocresult name="spr_getCntryFrom" resultset="1">
		</cfstoredproc>
	</cfcase>
 --->	
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- 
	<cfcase value="getCntryTo">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getCntryTo" returncode="no">
			<cfprocresult name="spr_getCntryTo" resultset="1">
		</cfstoredproc>
	</cfcase>
 --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getPrograms">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getPrograms" returncode="no">
			<cfprocresult name="spr_getPrograms" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getPgmFiscalYr"> 
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getPgmFiscalYr" returncode="no">
			<cfprocresult name="spr_getPgmFiscalYr" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getPgmStartYr"> 
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getPgmStartYr" returncode="no">
			<cfprocresult name="spr_getPgmStartYr" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="InsUpdCustomSearch">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_InsUpdCustomSearch" returncode="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_CS_Search_ID" value="#client.CS_Search_ID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Search_Nm" value="#client.CS_Search_Nm#" null="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_First_Nm" value="#client.CS_First_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Last_Nm" value="#client.CS_Last_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Gender" value="#client.CS_Gender#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_From_Cntry" value="#client.CS_From_Cntry#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_To_Cntry" value="#client.CS_To_Cntry#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Pgm_Type" value="#client.CS_Pgm_Type#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Year_Type" value="#client.CS_Year_Type#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Year" value="#client.CS_Year#" null="no">
			
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Field_Stdy_Nm" value="#client.CS_Field_Stdy_Nm#" null="no"> --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Citznsp_Cntry_CD" value="#client.CS_Citznsp_Cntry_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Resdnc_Cntry_CD" value="#client.CS_Resdnc_Cntry_CD#" null="no">
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Resdnc_City_Nm" value="#client.CS_Resdnc_City_Nm#" null="no"> --->
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Host_Instn_Nm" value="#client.CS_Host_Instn_Nm#" null="no"> --->
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Visit_City_Nm" value="#client.CS_Visit_City_Nm#" null="no"> --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_SC_Search_Type" value="#client.CS_Search_Type#" null="no">
			
			<cfprocresult name="spr_CustomSearchID" resultset="1">
			
		</cfstoredproc>
		<!--- <cfoutput query="spr_CustomSearchID"> #cust_search_id# </cfoutput><cfabort> --->
	</cfcase> 
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="InsUpdAdvCustomSearch">
	 		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_InsUpdAdvCustomSearch" returncode="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_CS_Search_ID" value="#client.CS_Search_ID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Search_Nm" value="#client.CS_Search_Nm#" null="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_First_Nm" value="#client.CS_First_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Last_Nm" value="#client.CS_Last_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Gender" value="#client.CS_Gender#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_From_Cntry" value="#client.CS_From_Cntry#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_To_Cntry" value="#client.CS_To_Cntry#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Pgm_Type" value="#client.CS_Pgm_Type#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Year_Type" value="#client.CS_Year_Type#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Year" value="#client.CS_Year#" null="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Field_Stdy_Nm" value="#client.CS_Field_Stdy_Nm#" null="no">
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_ALMN_PROMINENT_CD" value="#client.CS_ALMN_PROMINENT_CD#" null="no"> --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Citznsp_Cntry_CD" value="#client.CS_Citznsp_Cntry_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Resdnc_Cntry_CD" value="#client.CS_Resdnc_Cntry_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Resdnc_City_Nm" value="#client.CS_Resdnc_City_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Host_Instn_Nm" value="#client.CS_Host_Instn_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CS_Visit_City_Nm" value="#client.CS_Visit_City_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_SC_Search_Type" value="#client.CS_Search_Type#" null="no">
			
			<cfprocresult name="spr_CustomSearchID" resultset="1">
			
		</cfstoredproc>
		<!--- <cfoutput query="spr_CustomSearchID"> #cust_search_id# </cfoutput><cfabort> --->
	</cfcase> 
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="delCustomSearch">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_deleteCustomSearch" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_CS_Search_ID" value="#client.CS_Search_ID#" null="no">
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no"> --->
		</cfstoredproc>
	</cfcase> 
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getCustomSearch">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getCustomSearch" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_CS_Search_ID" value="#client.CS_Search_ID#" null="no">
			
			<cfprocresult name="spr_getCustomSearch" resultset="1">
		
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="execSQL_SelectCount">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_execSQL_SelectCount" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_execSQL_SelectCount" value="#client.SelectCount#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			
			<cfprocresult name="spr_execSQL_SelectCount" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="execSQL">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_execSQL" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_execSQL" value="#client.basicCS_SQLstatement#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="execSQL_RPT">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_execSQL_RPT" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_execSQL" value="#client.RPT_SQLstatement#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="execSQL_StatRPT">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_execSQL_StatRPT" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_execSQL" value="#client.RPT_SQLstatement#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="countSearchedRecords">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_countSearchedRecords" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			
			<cfprocresult name="spr_countSearchedRecords" resultset="1">
			
		</cfstoredproc>
		
	</cfcase>
<!--- --------------------------------------------------------------------- --->
	<cfcase value="getSearchedRecords">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getSearchedRecords" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<!--- 
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="argSelectedRecordFrom" value="#client.SelectedRecordFrom#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="argIncrement" value="#client.Increment#" null="no">
			 --->
			<cfprocresult name="spr_getSearchedRecords" resultset="1">
			<cfprocresult name="spr_countSearchedAlumni" resultset="2">
		
		</cfstoredproc>
		<!--- <cfoutput>#spr_countSearchedAlumni.countAlumni#</cfoutput>		<cfabort> --->
		
		<cfwddx action="cfml2wddx" input="#spr_getSearchedRecords#"  output="client.sprWDDX_getSearchedRecords">
		<cfwddx action="cfml2wddx" input="#spr_countSearchedAlumni#" output="client.sprWDDX_countSearchedAlumni">
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getRprtRecords">
		
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getRprtRecords" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_Rpt_Type" value="#client.Rpt_Type#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_Doc_Type" value="#local.DocType#" null="no">
			<cfprocresult name="spr_getRptSearchedRecords" resultset="1">
		
		</cfstoredproc>
		<!--- <cfwddx action="cfml2wddx" input="#spr_getSearchedRecords#" output="client.sprWDDX_getSearchedRecords"> --->
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="deleteSearchedRecords">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_deleteSearchedRecords" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
		</cfstoredproc>
	
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getAlnmProfile">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getAlnmProfile" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AP_AlmnID" value="#client.AP_AlmnID#" null="no">
			
			<cfprocresult name="spr_getAlnmProfile" resultset="1"> 
			<cfprocresult name="spr_getPgm" resultset="2">
			<cfprocresult name="spr_getJob" resultset="3">
	
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="sp_getProminent_Categories">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getProminent_Categories" returncode="no">
						
			<cfprocresult name="spr_getProminent_Categories" resultset="1">
		</cfstoredproc>

	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="UpdateAlmnRecord">
	<!--- <cfinclude template="TestVar.cfm"><cfabort> --->
	<!---<cfoutput>#FORM.ddlb_AP_ALMN_PROMINENT_CD#</cfoutput><cfabort> --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_UpdateAlmnRecord" returncode="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AP_AlmnID"   value="#client.AP_AlmnID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Pfx"      value="#FORM.ddlb_AP_Pfx#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Frst_Nm"  value="#FORM.txt_AP_Frst_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Midl_Nm"  value="#FORM.txt_AP_Midl_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Last_Nm"  value="#FORM.txt_AP_Last_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Last_Nm2" value="#FORM.txt_AP_Last_Nm2#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Sfx"      value="#FORM.txt_AP_Sfx#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Sex" value="#FORM.ddlb_AP_Sex#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_DOB" value="#FORM.txt_AP_DOB#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Ctznsp_Cd" value="#FORM.ddlb_AP_Ctznsp_Cd#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Ctznsp_Cd2" value="#FORM.ddlb_AP_Ctznsp_Cd2#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Cntct_Ind" value="#FORM.h_AP_Cntct_Ind#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Dcsd" value="#FORM.h_AP_Dcsd#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Dsabld" value="#FORM.h_AP_Dsabld#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Resdnc_Adrs_Txt" value="#FORM.txta_AP_Resdnc_Adrs_Txt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Resdnc_City_Nm" value="#FORM.txt_AP_Resdnc_City_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Resdnc_State_Prvnc_Nm" value="#FORM.txt_AP_Resdnc_State_Prvnc_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Resdnc_Postl_CD" value="#FORM.txt_AP_Resdnc_Postl_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Resdnc_Cntry_Cd" value="#FORM.ddlb_AP_Resdnc_Cntry_Cd#" null="no">
			<!--- ... --->
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_legal_state_cd" value="-1" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AP_cngrtsnl_dstrct_num" value="-1" null="no">
			<!--- ... --->
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Bsns_Nm" value="#FORM.txt_AP_Bsns_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Bsns_Adrs_Txt" value="#FORM.txta_AP_Bsns_Adrs_Txt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Bsns_City_Nm" value="#FORM.txt_AP_Bsns_City_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Bsns_State_Prvnc_Nm" value="#FORM.txt_AP_Bsns_State_Prvnc_Nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Bsns_Postl_CD" value="#FORM.txt_AP_Bsns_Postl_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Bsns_Cntry_Cd" value="#FORM.ddlb_AP_Bsns_Cntry_Cd#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Prfrd_Adrs_ind" value="#FORM.ddlb_AP_Prfrd_Adrs_ind#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Resdnc_Phone_Num" value="#FORM.txt_AP_Resdnc_Phone_Num#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Bsns_Phone_Num" value="#FORM.txt_AP_Bsns_Phone_Num#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Cell_Num" value="#FORM.txt_AP_Cell_Num#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Othr_Phone_Num" value="#FORM.txt_AP_Othr_Phone_Num#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Prfrd_Phone_Num_Ind" value="#FORM.ddlb_AP_Prfrd_Phone_Num_Ind#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Fax_Num" value="#FORM.txt_AP_Fax_Num#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Email1_txt" value="#FORM.txt_AP_Email1_txt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Email2_txt" value="#FORM.txt_AP_Email2_txt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Prfrd_Email_Num_Ind" value="#FORM.ddlb_AP_Prfrd_Email_Num_Ind#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AP_Intrst" value="#FORM.ddlb_AP_Intrst#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AP_speak_level" value="#FORM.ddlb_AP_speak_level#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AP_read_level" value="#FORM.ddlb_AP_read_level#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AP_comp_level" value="#FORM.ddlb_AP_comp_level#" null="no">
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_Notes_Txt" value="#FORM.txta_AP_Notes_Txt#" null="no">
			<!--- ... --->
			<!--- <cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no"> --->
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_New_title_txt" value="#FORM.txt_AP_New_title_txt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_NumOfLoops" value="#FORM.h_NumOfLoops#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_New_instn_nm" value="#FORM.txt_AP_New_instn_nm#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_checked_cbx" value="#FORM.h_checked_cbx#" null="no">
			<!-- code for Remove? cbx -->
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Remove_NumOfLoops" value="#FORM.h_Remove_NumOfLoops#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_Remove_checked_cbx" value="#FORM.h_remove_checked_cbx#" null="no">
			<!--- ... --->
			<!--- ... --->
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_AP_ALMN_PROMINENT_CD" value="#FORM.ddlb_AP_ALMN_PROMINENT_CD#" null="no">
			<!--- ... --->
		</cfstoredproc>
	</cfcase>
	
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getInterests">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getInterests" returncode="no">
			<cfprocresult name="spr_getInterests" resultset="1">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getInterests#" output="client.sprWDDX_getInterests">
	</cfcase>
	
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getTopicTypes">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getTopicTypes" returncode="no">
			<cfprocresult name="spr_getTopicTypes" resultset="1">
		</cfstoredproc>
	</cfcase>
	 
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getCtrlHelp">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getCtrlHelp" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_HelpItemID" value="#local.HelpItemId#" null="no">
			<cfprocresult name="spr_getCtrlHelp" resultset="1">
		</cfstoredproc>
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="getTopicsToEdit">
	<!---
	<cfoutput>#client.TE_PageID#<br>#client.TE_PageNm#<br>#client.TE_TxtType#</cfoutput><cfabort>
	 --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getTopicsToEdit" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_TEPageID" value="#client.TE_PageID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_TETxtType" value="#client.TE_TxtType#" null="no">
			
			<cfprocresult name="spr_getTopicsToEdit" resultset="1">
		</cfstoredproc>
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="TOPIC_DELETE">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_TOPIC_DELETE" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_TopicID" value="#local.topic_id#" null="no">
			
		</cfstoredproc>
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="TOPIC_UPDATE">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_TOPIC_UPDATE" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_TopicID" value="#local.topic_id#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_topic_title" value="#local.topic_title#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_topic_txt" value="#local.topic_txt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_topic_seq_on_page" value="#local.topic_seq_on_page#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_topic_is_active" value="#local.topic_is_active#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_topic_exprtn_dt" value="#local.topic_exprtn_dt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_Elmt_ID_Val" value="#local.Elmt_ID_Val#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_NumOfLoops" value="#local.NumOfLoops#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="TOPIC_INSERT">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_TOPIC_INSERT" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_TopicID" value="#local.topic_id#" null="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_topic_security_tree_id" value="#local.topic_security_tree_id#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_topic_navigation_cd" value="#local.topic_navigation_cd#" null="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_topic_title" value="#local.topic_title#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_topic_txt" value="#local.topic_txt#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_topic_seq_on_page" value="#local.topic_seq_on_page#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_topic_is_active" value="#local.topic_is_active#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_topic_exprtn_dt" value="#local.topic_exprtn_dt#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="getFilterCriteria">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getFilterCriteria" returncode="no">
			<cfprocresult name="spr_getFilterCriteria" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="checkDups">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_checkDups" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AlmnID" value="#client.AP_AlmnID#" null="no">
		
			<cfprocresult name="spr_checkDups" resultset="1">
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="getRecordsToMerge">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getRecordsToMerge" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ListOfIDsToMerge" value="#local.ListOfIDsToMerge#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_NumOfLoops" value="#local.NumOfLoops#" null="no">
			
			<cfprocresult name="spr_getRecordsToMerge" resultset="1">
		</cfstoredproc>
		
		<cfwddx action="cfml2wddx" input="#spr_getRecordsToMerge#" output="client.sprWDDX_getRecordsToMerge">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="moveOrgAlmnRecds">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_moveOrgAlmnRecds" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_ALL_IDs" value="#local.ALMN_ALL_IDs#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AlmnID" value="#client.AP_AlmnID#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_ALMN_Loop_Counter" value="#local.ALMN_Loop_Counter#" null="no">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="getPgmRecds">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getPgmRecds" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AlmnID" value="#client.AP_AlmnID#" null="no">
			
			<cfprocresult name="spr_getPgmRecds" resultset="1">
			<cfprocresult name="spr_getAlmnName" resultset="2">
		</cfstoredproc>
		
		<cfwddx action="cfml2wddx" input="#spr_getPgmRecds#" output="client.sprWDDX_getPgmRecds">
		<cfwddx action="cfml2wddx" input="#spr_getAlmnName#" output="client.sprWDDX_getAlmnName">
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="updMergedRecds">
	<!--- <cfoutput>"#client.AP_AlmnID#"</cfoutput><cfabort> --->
	<!--- <cfinclude template="TestVars2.cfm"> --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_updMergedRecds" returncode="no">
				<!--- ---------------------- --->
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
				<!--- ---------------------- --->
				<!--- <cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_AlmnID" value="#client.AP_AlmnID#" null="no"> --->
				<!--- inc_MergeDups_NAME.cfm: --->
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_MRG_ALMN_ID" value="#client.AP_AlmnID#" null="no">
				<!--- local.Mrg_ALMN_ID has a value of client.AP_AlmnID, which is an ID of the record "clicked" on page SEARCHED RESULTS --->
				<!--- ---------------------- --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_PFX_DSC" value="#local.ALMN_PFX_DSC#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_FRST_NM" value="#local.ALMN_FRST_NM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_MIDL_NM" value="#local.ALMN_MIDL_NM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_LAST_NM" value="#local.ALMN_LAST_NM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_LAST_NM2" value="#local.ALMN_LAST_NM2#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_SFX_DSC" value="#local.ALMN_SFX_DSC#" null="no">

				<!--- inc_MergeDups_Sex_DOB.cfm: --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_SEX_IND" value="#local.ALMN_SEX_IND#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_DOB_DT" value="#local.ALMN_DOB_DT#" null="no">
				
				<!--- inc_MergeDups_DCSD_DESBL.cfm: --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_DCSD_IND" value="#local.ALMN_DCSD_IND#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_DSABLD_IND" value="#local.ALMN_DSABLD_IND#" null="no">
												
				<!--- inc_MergeDups_CTZNSP.cfm: --->
				<!--- CNTRY OF Citizenship --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_CTZNSP_CNTRY_CD" value="#local.ALMN_CTZNSP_CNTRY_CD#" null="no">
				<!--- CNTRY OF Citizenship 2 --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_CTZNSP_CNTRY_CD2" value="#local.ALMN_CTZNSP_CNTRY_CD2#" null="no">
				
				<!--- inc_MergeDups_RES_ADDR.cfm: --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_RESDNC_ADRS_TXT" value="#local.ALMN_RESDNC_ADRS_TXT#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_RESDNC_CITY_NM" value="#local.ALMN_RESDNC_CITY_NM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_RESDNC_STATE_PRVNC_NM" value="#local.ALMN_RESDNC_STATE_PRVNC_NM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_RESDNC_CNTRY_CD" value="#local.ALMN_RESDNC_CNTRY_CD#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_almn_resdnc_postl_cd" value="#local.ALMN_RESDNC_POSTL_CD#" null="no">

				
				<!--- inc_MergeDups_BUS_ADDR.cfm: --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_almn_bsns_nm" value="#local.ALMN_BSNS_NM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_BSNS_ADRS_TXT" value="#local.ALMN_BSNS_ADRS_TXT#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_BSNS_CITY_NM" value="#local.ALMN_BSNS_CITY_NM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_BSNS_STATE_PRVNC_NM" value="#local.ALMN_BSNS_STATE_PRVNC_NM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_BSNS_CNTRY_CD" value="#local.ALMN_BSNS_CNTRY_CD#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_almn_bsns_postl_cd" value="#local.ALMN_BSNS_POSTL_CD#" null="no">
				

<!--- From ln.805 _ControllerVars.cfm
				<cfset local.ALMN_RESDNC_POSTL_CD = FORM.txt_RZIP>
				<cfset local.ALMN_RESDNC_CNTRY_CD = FORM.ddlb_RCRY>
				
				<!--- inc_MergeDups_BUS_ADDR.cfm: --->
				<cfset local.ALMN_BSNS_ADRS_TXT = FORM.txt_BADD>
				<cfset local.ALMN_BSNS_NM = FORM.txt_BNME>
				<cfset local.ALMN_BSNS_CITY_NM = FORM.txt_BCTY>
				<cfset local.ALMN_BSNS_STATE_PRVNC_NM = FORM.txt_BSPR>
				<cfset local.ALMN_BSNS_POSTL_CD = FORM.txt_BZIP>
--->

								
				<!--- inc_MergeDups_PRFRD_ADDR.cfm: --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_PREFRD_ADRS_IND" value="#local.ALMN_PREFRD_ADRS_IND#" null="no">
				
				<!--- inc_MergeDups_PHONE.cfm --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_RESDNC_PHONE_NUM" value="#local.ALMN_RESDNC_PHONE_NUM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_BSNS_PHONE_NUM" value="#local.ALMN_BSNS_PHONE_NUM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_CELL_NUM" value="#local.ALMN_CELL_NUM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_OTHR_PHONE_NUM" value="#local.ALMN_OTHR_PHONE_NUM#" null="no">
				
				<!--- inc_MergeDups_FAX.cfm --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_FAX_NUM" value="#local.ALMN_FAX_NUM#" null="no">
				
				<!--- inc_MergeDups_PRFRD_PHONE.cfm: --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_PREFRD_PHONE_NUM_IND" value="#local.ALMN_PREFRD_PHONE_NUM_IND#" null="no">
				
				<!--- inc_MergeDups_EMAIL.cfm: --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_EMAIL1_TXT" value="#local.ALMN_EMAIL1_TXT#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_EMAIL2_TXT" value="#local.ALMN_EMAIL2_TXT#" null="no">
				
				<!--- inc_MergeDups_PRFRD_EMAIL.cfm --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_PREFRD_EMAIL_IND" value="#local.ALMN_PREFRD_EMAIL_IND#" null="no">
				
				<!--- inc_MergeDups_CONTACT.cfm --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_CNTCT_IND" value="#local.ALMN_CNTCT_IND#" null="no">
				
				<!--- inc_MergeDups_ELP.cfm --->
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_ALMN_ELP_SPEAK_FSI_NUM" value="#local.ALMN_ELP_SPEAK_FSI_LEVEL_NUM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_ALMN_ELP_READ_FSI_NUM" value="#local.ALMN_ELP_READ_FSI_LEVEL_NUM#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_ALMN_ELP_COMP_FSI_NUM" value="#local.ALMN_ELP_COMP_FSI_LEVEL_NUM#" null="no">
				
				<!--- inc_MergeDups_COMMENTS.cfm --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_ALMN_NOTES_TXT" value="#local.ALMN_NOTES_TXT#" null="no">
		
		</cfstoredproc>
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="countJobs">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_countJobs" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_MRG_ALMN_ID" value="#client.AP_AlmnID#" null="no">
			
			<cfprocresult name="spr_countJobs" resultset="1">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="getListOfPrograms">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getListOfPrograms" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_MRG_ALMN_ID" value="#client.AP_AlmnID#" null="no">
			
			<cfprocresult name="spr_getListOfPrograms" resultset="1">
			<cfprocresult name="spr_getListOfPlaceVisit" resultset="2">
			
		</cfstoredproc>
		
		<cfwddx action="cfml2wddx" input="#spr_getListOfPrograms#" output="client.sprWDDX_getListOfPrograms">
		<cfwddx action="cfml2wddx" input="#spr_getListOfPlaceVisit#" output="client.sprWDDX_getListOfPlaceVisit">
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="getListOfJobs">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getListOfJobs" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_MRG_ALMN_ID" value="#client.AP_AlmnID#" null="no">
			
			<cfprocresult name="spr_getListOfJobs" resultset="1">
			
		</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="saveOrgRecords">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_saveOrgRecords" returncode="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_MRG_ALMN_ID" value="#client.AP_AlmnID#" null="no">
		</cfstoredproc>
	
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="mergeJobRecords">
			
			<!--- <cfoutput>#i_JobRecords#</cfoutput><cfabort> --->
			
			<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_mergeJobRecords" returncode="no">
			
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_MergeJobRecds" value="#local.MergeJobRecds#" null="no">
			
		</cfstoredproc>
		
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	
	<cfcase value="completeJobMerge">
			<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_completeJobMerge" returncode="no">
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_MRG_ALMN_ID" value="#client.AP_AlmnID#" null="no">
			</cfstoredproc>
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getPgmType">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getPgmType" returncode="no">
			<cfprocresult name="spr_getPgmType" resultset="1">
			
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getPgmType#" output="client.sprWDDX_getPgmType">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->

	<cfcase value="mergePgm_and_PV">
	<!---
	local.PgmID_AlmnID_Checked = #local.PgmID_AlmnID_Checked#<br>
	<!--- ------------------------------------- --->
	<!--- <cfset local. = FORM.---pgm_id> --->
	 <cfoutput>
	local.pgm_type_nm = #local.pgm_type_nm#<br>
	local.pgm_fy_dt = #local.pgm_fy_dt#<br>
	local.pgm_yr_dt = #local.pgm_yr_dt#<br>
	local.pgm_from_cntry_nm = #local.pgm_from_cntry_nm#<br>
	local.pgm_to_cntry_nm = #local.pgm_to_cntry_nm#<br>
	local.pgm_start_dt = #local.pgm_start_dt#<br>
	local.pgm_end_dt = #local.pgm_end_dt#<br>
	local.pgm_field_stdy_nm = #local.pgm_field_stdy_nm#<br>
	local.pgm_agcy_nm = #local.pgm_agcy_nm#<br>
	local.pgm_plcmnt_org_nm = #local.pgm_plcmnt_org_nm#<br>
	local.pgm_nmtng_org_nm = #local.pgm_nmtng_org_nm#<br>
	local.pgm_sub_ctgry_txt = #local.pgm_sub_ctgry_txt#<br>
	local.pgm_topic_txt = #local.pgm_topic_txt#<br>
	local.pgm_strtgc_goal_txt = #local.pgm_strtgc_goal_txt#<br>
	local.pgm_spcl_award_txt = #local.pgm_spcl_award_txt#<br>
	local.pgm_updt_dt = #local.pgm_updt_dt#<br>
	local.pgm_updt_id = #local.pgm_updt_id#<br>
	<!--- <cfset local. = FORM.---pgm_src_nm> --->
	local.PlaceVisited_Checked = #local.PlaceVisited_Checked#
	
	
	</cfoutput><cfabort> --->
<!---  <cfoutput>
	#local.PgmID_AlmnID_Checked#<br>
	#local.pgm_type_nm#<br>
	#local.pgm_fy_dt#<br>
	#local.pgm_yr_dt#<br>
	#local.pgm_from_cntry_nm#<br>
	#local.pgm_to_cntry_nm#<br>
	#local.pgm_start_dt#<br>
	#local.pgm_end_dt#<br>
	#local.pgm_field_stdy_nm#<br>
	#local.pgm_agcy_nm#<br>
	#local.pgm_plcmnt_org_nm#<br>
	#local.pgm_nmtng_org_nm#<br>
	#local.pgm_sub_ctgry_txt#<br>
	#local.pgm_topic_txt#<br>
	#local.pgm_strtgc_goal_txt#<br>
	#local.pgm_spcl_award_txt#<br>
	#local.pgm_updt_dt#<br>
	#local.pgm_updt_id#<br>
	#local.PlaceVisited_Checked#
	
	
	</cfoutput><cfabort>
	 --->
	
	
			<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_mergePgm_and_PV" returncode="no">
				<!--- ----- --->
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_MRG_ALMN_ID" value="#client.AP_AlmnID#" null="no">
				<!--- ----- --->
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_PgmID_AlmnID_Checked" value="#local.PgmID_AlmnID_Checked#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_pgm_type_nm" value="#local.pgm_type_nm#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_fy_dt" value="#local.pgm_fy_dt#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_yr_dt" value="#local.pgm_yr_dt#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_from_cntry_nm" value="#local.pgm_from_cntry_nm#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_to_cntry_nm" value="#local.pgm_to_cntry_nm#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_start_dt" value="#local.pgm_start_dt#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_end_dt" value="#local.pgm_end_dt#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_pgm_field_stdy_nm" value="#local.pgm_field_stdy_nm#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_agcy_nm" value="#local.pgm_agcy_nm#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_plcmnt_org_nm" value="#local.pgm_plcmnt_org_nm#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_nmtng_org_nm" value="#local.pgm_nmtng_org_nm#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_sub_ctgry_txt" value="#local.pgm_sub_ctgry_txt#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_topic_txt" value="#local.pgm_topic_txt#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_strtgc_goal_txt" value="#local.pgm_strtgc_goal_txt#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_pgm_spcl_award_txt" value="#local.pgm_spcl_award_txt#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_PlaceVisited_Checked" value="#local.PlaceVisited_Checked#" null="no">
				
				<cfprocresult name="spr_continue" resultset="1">
				
			</cfstoredproc>
	</cfcase>
	
<!--- ----------------------------------------------------------------------------------------------------------------- --->


<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getFieldOfStudy">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getFieldOfStudy" returncode="no">
			<cfprocresult name="spr_getFieldOfStudy" resultset="1">
			
		</cfstoredproc>
		
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="DelPendingMergedRecds">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_DelPendingMergedRecds" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
		</cfstoredproc>
		
	</cfcase>




</cfswitch>





			<!--- --- --->