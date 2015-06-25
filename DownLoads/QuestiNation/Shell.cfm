<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<cfif isDefined("URL.urlFileToGoTo")>
	<cfset local.FileToGoTo = #URL.urlFileToGoTo#>
</cfif>
<cfif isDefined("URL.urlModuleName")>
	<cfset local.ModuleName = #URL.urlModuleName#>
</cfif>

<cfinclude template="Header.cfm">

<cfinclude template="#local.FileToGoTo#">

<cfinclude template="Copyright.cfm">

</html>
