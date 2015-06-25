<!--- SendPass.cfm  --->
<cfmail server="#application.vMailServerIP#"  
		from="#local.SendFrom#" 
		to="#local.SendTo#" 
		bcc="AlumniArchive@state.gov;"
		subject="#local.Subject#" >#local.Msg#
<cfif isDefined("client.PathAndAttachment")>
	<cfif client.PathAndAttachment EQ "ATTACH">
			<cfset client.PathAndAttachment = "#Mid(CGI.CF_TEMPLATE_PATH, 1 ,   Len(CGI.CF_TEMPLATE_PATH)  -  Len(GetFileFromPath(CGI.CF_TEMPLATE_PATH)) )#Img/ALUMNIARCHIVEGettingStarted_2000_PAO.pdf">
			<cfmailparam file="#client.PathAndAttachment#">
			<cfset local.vDeleteClientVariable = DeleteClientVariable("PathAndAttachment")>
	</cfif>
</cfif> 
</cfmail>

<!--- 
<cfoutput>
CGI.PATH_INFO = #CGI.PATH_INFO#<br>
CGI.PATH_TRANSLATED = #CGI.PATH_TRANSLATED#<br>
CGI.CF_TEMPLATE_PATH = #CGI.CF_TEMPLATE_PATH#
</cfoutput>
<cfoutput>
CGI.PATH_INFO = #CGI.PATH_INFO#<br>
CGI.PATH_TRANSLATED = #CGI.PATH_TRANSLATED#<br>
CGI.CF_TEMPLATE_PATH = #Mid(CGI.PATH_TRANSLATED, 1 ,   Len(CGI.PATH_TRANSLATED)  -  Len(GetFileFromPath(CGI.PATH_TRANSLATED)) )#<br>
</cfoutput>
 --->