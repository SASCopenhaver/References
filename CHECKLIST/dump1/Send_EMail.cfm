<!--- Send_EMail.cfm --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Send E-Mail</title>
</head>
<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">
<body>
<!--- <cfoutput>#strUser.UserFullName#</cfoutput><cfabort> --->
<cfset local.EMailList = #URL.urlEMailList#>
<!--- <cfset local.EMailList = "sasurikov@erols.com,sasurikov@erols.com,sasurikov@erols.com"> --->
<!--- TEST: <cfoutput>#local.EMailList#</cfoutput><cfabort> --->

<cfloop index="Email_To" list="#local.EMailList#" delimiters=",">
<!--- <cfmail to="#Email_To#" 
		from="#strUser.UserEmail#" 
		subject="Partially Evaluated and Not Evaluated projects" 
		server="127.0.0.1"> --->
<cfmail to="#Email_To#" 
		from="#strUser.UserEmail#" 
		subject="Partially Evaluated and Not Evaluated projects" >
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Please review the list of your Partially Evaluated and Not Evaluated Projects.
Evaluation has to be completed ASAP.

Thank you.
#strUser.UserFullName#

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
</cfmail>
<!--- <script language="JavaScript">alert("E-Mail is sent to:\n<cfoutput>#Email_To#</cfoutput>")</script> --->
</cfloop>
<!--- <script language="JavaScript">alert("<cfoutput>#local.EMailList#</cfoutput>")</script> --->
<!--- Confirmation to the Sender #strUser.UserEmail#---> 
<cfset local.EMailList = #REPLACE(local.EMailList, ",", "<BR>" , "ALL")#>
<cfmail to="sasurikov@erols.com" 
		from="#strUser.UserEmail#" 
		subject="Reminder to evaluate Partially Evaluated and Not Evaluated projects">
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	Reminder to evaluate Partially Evaluated and Not Evaluated projects was sent to:
	
	#local.EMailList#
	
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
</cfmail>

</body>
</html>
<script language="JavaScript">window.close();</script>