<!--- 65.113.70.42 
<cfapplication	name="CheckList" 
				clientmanagement="Yes"
				clientstorage="CheckList"
				sessionmanagement="No"
				setclientcookies="No"
				setdomaincookies="No">
--->				
<!--- LOCAL --->
<cfapplication	name="CheckList" 
				clientmanagement="Yes"
				clientstorage="Calendar_Local"
				sessionmanagement="No"
				setclientcookies="No"
				setdomaincookies="No">

				
<cfif isdefined("cookie.cfid")>
	<CFCOOKIE NAME="CFID" EXPIRES="NOW">
</cfif>
<cfif isdefined("cookie.cftoken")>
	<CFCOOKIE NAME="CFTOKEN" EXPIRES="NOW">
</cfif>
 
<!--- <style> --->
<cfinclude template="Style/Style.css">
<!--- </style> --->

<!--- DATASOURCES --->
<!--- 65.113.70.42 
<cfset client.DSN = "CheckList">
--->
<!--- LOCAL --->
<cfset client.DSN = "Calendar_Local">

<!--- <cfset client.AppName = "CheckList"> --->
<!--- <cfset client.UserName = "breed"> --->
<cfsetting showdebugoutput="no">

<!--- 
var vColor_1 = "F3E8CC"; //Light Brown
var vColor_2 = "DCC294"; //Dark Brown
var vColor_3 = "CCE";//LightBlue
var vColor_4 = "557";//Dark Blue
var vColor_5 = "EFD6AB"//Light brown in the middle vColor_1 and vColor_2
var vColor_6 = "FDF8EF"// background color

Branch Chieff:	tblatt / peace in table USIA.PER_ORG_ROLE: BC PersonID = 1843
Progr Officer:	ewilkess / milagro (BC)
				breed PersonID = 1311

DC - Division Chief
BC - Branch Chief
PO - Program Officer

--->