<!--- _ControllerDB.cfm --->
<cfswitch expression="#client.ControllerDB#">
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getNavigation">
		<cfstoredproc datasource="#request.dsn#" procedure="PACK_BASE.sp_getNavigation" returncode="no">
				<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="argUsr_Role_ID" value="#client.Usr_Role_CD#" null="no">
				
				<cfprocresult name="spr_getNavigation" resultset="1">
				
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getNavigation#" output="client.sprWDDX_getNavigation">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="AuthenticateUser">
		<cfstoredproc datasource="#request.dsn#" procedure="PACK_BASE.sp_AuthenticateUser" returncode="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="argUsr_UName" value="#client.Usr_UName#" null="no">
				<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="argUsr_Pass" value="#client.Usr_Pass#" null="no">
				
				<cfprocresult name="spr_getUsr" resultset="1">
				
		</cfstoredproc>
		<cfset local.vRecordCount = #spr_getUsr.recordCount#>
		<!--- <cfwddx action="cfml2wddx" input="#spr_getNavigation#" output="client.sprWDDX_getNavigation"> --->
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="getEditUser">
		<cfstoredproc datasource="#request.dsn#" procedure="PACK_BASE.sp_getEditUser" returncode="no">
				<cfprocresult name="spr_getEditUser" resultset="1">
				<cfprocresult name="spr_getRoles" resultset="2">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getEditUser#" output="client.sprWDDX_getEditUser">
		<cfwddx action="cfml2wddx" input="#spr_getRoles#" output="client.sprWDDX_getRoles">
		
		<!--- <cfoutput>#spr_getEditUser.recordCount#<br>#spr_getRoles.recordCount#</cfoutput><cfabort> --->
	</cfcase>


<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->

</cfswitch>