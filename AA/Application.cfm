<cfapplication	name = "Alumni Archive"   
				clientManagement = "Yes"
				clientStorage = "ALUMNI"    
				setClientCookies = "No"    
				sessionManagement = "Yes"
				setDomainCookies ="No">
<!--- ........................................... --->
<cflock scope="application" timeout="2" type="readonly">
	<!--- ........................................... --->
	<cfif NOT isDefined("request.dsn")>
		<cfset request.dsn = "ALUMNI">
	</cfif>
	<!--- ........................................... --->
	<!--- in Department of State --->
	<cfif NOT isDefined("Application.vMailServerIP")>
		<cfset Application.vMailServerIP = "192.168.10.13">
	</cfif>
	<!--- ........................................... --->
	<cfif NOT isDefined("Application.siteName")>
		<cfset Application.siteName = "ECA Alumni Archive">
	</cfif>
	<!--- ........................................... --->
	<cfif NOT isDefined("Application.siteDBtype")>
		<cfset Application.siteDBtype = "ORACLE">
	</cfif>
	<!--- ........................................... --->
	<cfif NOT isDefined("Application.orgName")>
		<cfset Application.orgName = "U.S. Department of State">
	</cfif>
	<cfif NOT isDefined("Application.appVer")>
		<cfset Application.appVer = "1.1">
	</cfif>
	<!--- ........................................... --->
</cflock>

<!--- ........................................... --->
<cfif isdefined("cookie.cfid")>
	<CFCOOKIE NAME="CFID" EXPIRES="NOW">
</cfif>
<cfif isdefined("cookie.cftoken")>
	<CFCOOKIE NAME="CFTOKEN" EXPIRES="NOW">
</cfif>
<!--- .............................................................................................................................................. --->
<!--- <cferror mailto="ssurikov@usa-ctc.com" type="EXCEPTION" template="Errors/errorCatch.cfm"> --->
<!--- .............................................................................................................................................. --->
<cfsetting showdebugoutput="no">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1-transitional.dtd">
