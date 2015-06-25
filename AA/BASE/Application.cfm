<cfapplication	name = "BASE"   
				clientManagement = "Yes"
				clientStorage = "BASE"    
				setClientCookies = "No"    
				sessionManagement = "Yes"
				setDomainCookies ="No">
<!--- ........................................... --->
<cfset request.dsn = "BASE">
<!--- ........................................... --->
<!--- <cfif NOT IsDefined("Application.siteName")> --->
	<cfset Application.siteName = "BASE">
<!--- </cfif> --->
<!--- ........................................... --->
<!--- <cfif NOT IsDefined("Application.siteDataBase")> --->
	<cfset Application.siteDBtype = "ORACLE"><!--- ORACLE --->
<!--- </cfif> --->
<!--- ........................................... --->
<!--- <cfif NOT IsDefined("Application.orgName")> --->
	<cfset Application.orgName = "SquaredCircle, Inc.">
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