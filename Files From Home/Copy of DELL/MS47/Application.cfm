<!--- Application.cfm --->
<cfapplication	name = "MS47"   
				clientManagement = "Yes"
				clientStorage = "MS47"    
				setClientCookies = "No"    
				sessionManagement = "Yes"
				setDomainCookies ="No">
<!--- ........................................... --->
<cflock scope="application" timeout="2" type="readonly">
<!--- ........................................... --->
	<cfset Application.rootPath =  ExpandPath("")><!--- "C:\CFusionMX\wwwroot" --->
	<cfset Application.rootPath =  "C:\Inetpub\wwwroot">

	<cfset Application.SubdirNM = "MS47">
	<cfset Application.SubdirUpload  = "AccessUploaded">
	<cfset Applicaton.SubdirArchive = "AccessArchive">
	<!--- <cfset Application.SubdirTemp = "AccessTemp"> --->
	
	<cfset Application.PathToUpload  = Application.rootPath&"\"&Application.SubdirNM&"\"&Application.SubdirUpload&"\">
	<cfset Application.PathToArchive = Application.rootPath&"\"&Application.SubdirNM&"\"&Applicaton.SubdirArchive&"\">
	<!--- <cfset Application.PathToTemp    = Application.rootPath&"\"&Application.SubdirNM&"\"&Application.SubdirTemp&"\"> --->
	
	<cfset request.dsn = "MS47">
	<cfset Application.PackName_SYS = "PACK_SYS"><!--- Collection of generic stored procedures --->
	<cfset Application.PackName_APP = "PACK_APP"><!--- Collection of Application specific stored procedures --->
	<!--- ........................................... --->
	<!--- <cfset application.vMailServerIP = "192.168.10.5"> --->
	<!--- ........................................... --->
	<cfset Application.siteDB = "ORACLE">
	<!--- ........................................... --->
	<cfset Application.developerName = "SquaredCircle, Inc.">
	<!--- ........................................... --->
	<cfset Application.appVer = "1.0">
<!--- ........................................... --->
</cflock>
<!--- ........................................... --->
	<cfset Application.AdminEMail = "Surikov.A.Sergey@usps.gov">
<cfif NOT isDefined("Application.vMailServerIP")>
	<!--- <cfset Application.vMailServerIP = "infocentral_relay:ctchellday@10.1.2.6"> --->
	<!--- <cfset Application.vMailServerIP = "10.1.2.6"> --->
</cfif>
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
<!--- 
<cfif isDefined("client.Permission") AND client.Permission EQ "NO">
	<cflocation url="_Controller.cfm?urlController=1001">
</cfif> --->
<!--- 
004100 = Dark Green Background.  Starting point

#007B41 - Green
#00529C - Blue
#52317B - Purple
#FF8320 - Orange
#F60000 - Red
#AC3931 - Brown
#007B83 - Magenta
#62CDD5 - Blue
#F66229 - Terracota
-----------------------
--- Pax River Settings ---
ADMINISTRATOR INFORMATION
http://ctc-dev.serveftp.com:81/cfide/administrator/index.cfm
password: patuxent

http://ctc-dev.serveftp.com:81/mepi_draft/thesite/


Data Source Name: MEPI
SID Name: ctctest
Server: 12.44.14.97
Username: mepi_user
Paswword: mepi_user44 
---------------------
TNS NAMES ENTRY

12_44_14_97 =
 (DESCRIPTION =
   (ADDRESS_LIST =
     (ADDRESS = (PROTOCOL = TCP)(HOST = 12.44.14.97)(PORT = 1521))
   )
   (CONNECT_DATA =
     (SERVICE_NAME = ctctest)
   )
 )

Schema Owner: MEPI/mepi447
Schema User: mepi_user/mepi_user44
------------------------
FTP INFORMATION
Host: ctc-dev.serverftp.com 
Port: 21
Servertype: FTP
User / Password: sasurikov / nov2006

 --->