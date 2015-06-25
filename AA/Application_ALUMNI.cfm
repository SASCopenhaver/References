<cfapplication	name = "Alumni Archive"   
				clientManagement = "Yes"
				clientStorage = "ALUMNI"    
				setClientCookies = "No"    
				sessionManagement = "Yes"
				setDomainCookies ="No">
<!--- ........................................... --->
<cfset request.dsn = "ALUMNI">
<!--- ........................................... --->
<!--- <cfif NOT IsDefined("Application.siteName")> --->
	<cfset Application.siteName = "Alumni Archive">
<!--- </cfif> --->
<!--- ........................................... --->
<!--- <cfif NOT IsDefined("Application.siteDataBase")> --->
	<cfset Application.siteDBtype = "ORACLE"><!--- ORACLE --->
<!--- </cfif> --->
<!--- ........................................... --->
<!--- <cfif NOT IsDefined("Application.orgName")> --->
	<cfset Application.orgName = "U.S. Department of State">
<!--- </cfif> --->
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