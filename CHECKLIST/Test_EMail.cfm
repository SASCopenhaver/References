<!--- Send_EMail.cfm --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Send E-Mail</title>
</head>
<body>

<cfset local.EMailList = "EARLH@pd.state.gov,EARLH@pd.state.gov,EARLH@pd.state.gov">
<cfloop index="Email_To" list="#local.EMailList#" delimiters=",">
<cfmail to="#Email_To#" 
		from="EARLH@pd.state.gov" 
		subject="Partially Evaluated and Not Evaluated projects" 
		server="127.0.0.1">
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Please review the list of your Partially Evaluated and Not Evaluated Projects.
Evaluation has to be completed ASAP.

Thank you.

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
</cfmail>

</cfloop>

<!--- Confirmation to the Sender  
<cfset local.EMailList = #REPLACE(local.EMailList, ",", "<BR>" , "ALL")#>
<cfmail to="#strUser.UserEmail#" 
		from="#strUser.UserEmail#" 
		subject="Reminder to evaluate Partially Evaluated and Not Evaluated projects">
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	Reminder to evaluate Partially Evaluated and Not Evaluated projects was sent to:
	
	<cfoutput>#local.EMailList#</cfoutput>
	
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
</cfloop>
________________________________________________________________________________
</cfmail>
--->
</body>
</html>
<!--- <script language="JavaScript">window.close();</script> --->