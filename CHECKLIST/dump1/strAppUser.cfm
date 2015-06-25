<cfset client.AppUserPass = #FORM.AppUserPass#>

<cfset strAppUser = StructNew()>
<cfset strAppUser.AppUserID = "">
<cfset strAppUser.AppUserName = #FORM.AppUserName#>
<cfset strAppUser.AppUserID = "">
<cfset strAppUser.AppUserRole = "">
<!--- 
<cfoutput>#isDefined("client.strWDDXAppUser")#</cfoutput>
<br>
 --->
<!---  
<cfif isDefined("client.strWDDXAppUser")>
    <cfset temp = DeleteClientVariable("strWDDXAppUser")>
</cfif>
 --->
<!--- <cfwddx action="CFML2WDDX" input="#strAppUser#" output="client.strWDDXAppUser"> --->