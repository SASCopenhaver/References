<!--- 
<cfoutput>
#HTTP_HOST#<br>
#SERVER_NAME#</cfoutput>
 --->

<cfapplication	name="Q42" 
				clientmanagement="Yes"
				clientstorage="EVDB"
				sessionmanagement="No"
				setclientcookies="No"
				setdomaincookies="No">

<cfif isdefined("cookie.cfid")>
	<CFCOOKIE NAME="CFID" EXPIRES="NOW">
</cfif>
<cfif isdefined("cookie.cftoken")>
	<CFCOOKIE NAME="CFTOKEN" EXPIRES="NOW">
</cfif>

<style>
<cfinclude template="Style/QN_Style.css">
</style>

<cfset client.DSN = "EVDB"> 
<cfset client.AppName = "Q42">

<!--- 
strAppUser - structure that holds info about the user who went through the authentication process
             and currently connected to the application.

USERS:
3 types of users:
--->
