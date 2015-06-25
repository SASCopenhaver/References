<cfset strAppUser = StructNew()>
<cfset strAppUser.UserID       = #FORM.h_UserID#>
<cfset strAppUser.UserFName    = #FORM.h_UserFName#>
<cfset strAppUser.UserLName    = #FORM.h_UserLName#>
<cfset strAppUser.UserPass     = #FORM.h_UserPass#>
<cfset strAppUser.UserEmail    = #FORM.h_UserEmail#>
<cfset strAppUser.UserActInact = #FORM.h_UserActInact#>
<cfset strAppUser.UserOrgID    = #FORM.h_UserOrgID#>
<!--- 
<cfoutput>#isDefined("client.strWDDXAppUser")#</cfoutput>
<br>
 --->
<!---  
<cfif isDefined("client.strWDDXAppUser")>
    <cfset temp = DeleteClientVariable("strWDDXAppUser")>
</cfif>
 --->
<cfwddx action="CFML2WDDX" input="#strAppUser#" output="client.strWDDXAppUser">

<!---
<cfoutput>#temp#</cfoutput>
<br>
<cfoutput>#client.strWDDXAppUser#</cfoutput>
<cfabort> --->

<!---
<cfoutput>
TEST:<br>
#strAppUser.UserID#<br>
#strAppUser.UserFName#<br>
#strAppUser.UserLName#<br>
#strAppUser.UserPass#<br>
#strAppUser.UserEmail#<br>
#strAppUser.UserActInact#<br>
#strAppUser.UserOrgID#
</cfoutput><cfabort>
 --->