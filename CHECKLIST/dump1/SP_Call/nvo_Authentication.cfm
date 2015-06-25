
<!--- <cfoutput>#URL.urlUserIDFromPB#</cfoutput><cfabort> --->

<CFQUERY name="q_AuthenticateUser"  dbtype="DYNAMIC" 
ConnectString="Driver={MERANT 3.70 ColdFusion OEM 32-BIT Oracle8};SRVR=SCAXIOM;UID=#FORM.UserID#;PWD=#FORM.UserPass#">
    select	su_userid, su_role 
	 from usia.security_user
	 where su_userid = '#URL.urlUserIDFromPB#' and su_status = 'A'
</CFQUERY>





<cfset strUser = StructNew()>
 <!---
<cfset strUser.UserID = "breed">
<cfset strUser.UserRole = "PO">
 --->
<cfset strUser.UserID = #URL.urlUserIDFromPB#>
<cfset strUser.UserRole = "BC">

<!---  
<cfset strUser.UserID = "econnol">
<cfset strUser.UserRole = "BC">
 ---> 
 
 
<cfwddx action="CFML2WDDX" input="#strUser#" output="client.strWDDXUser">
