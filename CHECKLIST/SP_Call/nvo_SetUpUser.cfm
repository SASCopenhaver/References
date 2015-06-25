<!--- nvo_SetUpUser.cfm --->

<cfset strUser = StructNew()>
<cfset strUser.UserID = #URL.urlUserIDFromPB#>
<!--- <cfoutput>#strUser.UserID#</cfoutput><cfabort> --->
<!--- ********************************************************************* --->
<cfstoredproc procedure="PACK_EVAL.sp_getUserProfile" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="In"  cfsqltype="CF_SQL_VARCHAR"   variable="argUserID" value="#strUser.UserID#"  null="No">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getUserProfile"   maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getCountPersonalProjects" maxrows="-1" variable="IgnoreThis">
		
	<cfprocresult name="spr_getUserProfile" resultset="1">
	<cfprocresult name="spr_getCountPersonalProjects" resultset="2">
</cfstoredproc>

<cfset strUser.UserID           = #URL.urlUserIDFromPB#>
<cfset strUser.PersonID         = #spr_getUserProfile.PersonID#>
<cfset strUser.UserFullName     = #spr_getUserProfile.PerSortName#>
<cfset strUser.UserOfficeID     = #spr_getUserProfile.OfficeID#>
<cfset strUser.UserOfficeName   = #spr_getUserProfile.OrgAbbr#>
<cfset strUser.SecurityUserRole = #spr_getUserProfile.SecurityUserRole#>
<cfset strUser.UserEmail 	    = #spr_getUserProfile.PerEmail#>
<cfset strUser.CountPersonalPrjs= #spr_getCountPersonalProjects.NumOfPeronalPrjs#>

<!--- <cfoutput>#strUser.CountPersonalPrjs#</cfoutput><cfabort> --->

<cfwddx action="CFML2WDDX" input="#strUser#" output="client.strWDDXUser">
<!--- ********************************************************************* --->
<!---
<cfoutput>
#strUser.UserID#<br>
#strUser.PersonID#<br>
#strUser.UserFullName#<br>
#strUser.UserOfficeID#<br>
#strUser.UserOfficeName#<br>
#strUser.SecurityUserRole#<br>
#strUser.UserEmail#<br>
</cfoutput><cfabort>
 --->
<!--- ********************************************************************* --->
