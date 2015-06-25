<cfset strInsUpdUser = StructNew()>
<cfset strInsUpdUser.UserID       = #FORM.h_InsUpdID#>
<cfset strInsUpdUser.UserFName    = #FORM.h_InsUpdFName#>
<cfset strInsUpdUser.UserLName    = #FORM.h_InsUpdLName#>
<cfset strInsUpdUser.UserPass     = #FORM.h_InsUpdPass#>
<cfset strInsUpdUser.UserEmail    = #FORM.h_InsUpdEmail#>
<cfset strInsUpdUser.UserActInact = #FORM.h_InsUpdActInact#>
<cfset strInsUpdUser.UserOrgID    = #FORM.h_InsUpdOrgID#>


<cfwddx action="CFML2WDDX" input="#strInsUpdUser#" output="client.strWDDXInsUpdUser">
<!---
<cfoutput>
TEST:<br>
UserID=#strInsUpdUser.UserID#<br>
UserFName=#strInsUpdUser.UserFName#<br>
UserLName=#strInsUpdUser.UserLName#<br>
UserPass=#strInsUpdUser.UserPass#<br>
UserEmail=#strInsUpdUser.UserEmail#<br>
UserActInact=#strInsUpdUser.UserActInact#<br>
UserOrgID=#strInsUpdUser.UserOrgID#
</cfoutput><cfabort>
 --->