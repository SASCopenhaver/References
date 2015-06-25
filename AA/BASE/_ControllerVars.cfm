<!--- _ControllerVars.cfm --->
<cfswitch expression=#client.ControllerVars#>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="setAnonymusUser">
		<cfset client.Usr_CD = "0">
		<cfset client.Usr_Prx = "">
		<cfset client.Usr_FName = "Anonymous">
		<cfset client.Usr_MI = "A">
		<cfset client.Usr_LName = "Anonymous">
		<cfset client.Usr_Sfx = "">
		<cfset client.Usr_Role_CD = "0">
		<!--- <cfset client.Usr_Role = "ANONYM"> --->
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="AuthenticateUser">
		<cfset client.Usr_UName = "#FORM.txt_Usr_UName#">
		<cfset client.Usr_Pass  = "#FORM.txt_Usr_Pass#">
	</cfcase>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
	<cfcase value="AuthenticatedUser">
		<cfset client.Usr_CD 	  = "#spr_getUsr.usr_id#">
		<cfset client.Usr_Prx 	  = "#spr_getUsr.usr_prx#">
		<cfset client.Usr_FName   = "#spr_getUsr.usr_fname#">
		<cfset client.Usr_MI      = "#spr_getUsr.usr_mi#">
		<cfset client.Usr_LName   = "#spr_getUsr.usr_lname#">
		<cfset client.Usr_Sfx 	  = "#spr_getUsr.usr_sfx#">
		<cfset client.Usr_Role_CD = "#spr_getUsr.usr_role#">
		<cfset client.Usr_FullName = "">
	</cfcase>

<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<!--- ----------------------------------------------------------------------------------------------------------------- --->

</cfswitch>