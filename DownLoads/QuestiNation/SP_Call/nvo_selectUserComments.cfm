<!--- client.PrjID is created in AppFlow.cfm in <cfcase value="ProjectRequested"> --->
<cfif isDefined("client.PrjID")>
    <cfset local.PrjID = #client.PrjID#>
<!---     <cfset temp = DeleteClientVariable("PrjID")> --->
</cfif>
<!--- 
<cfoutput>
#local.PrjID#<br>
#strAppUser.UserID#<br>
#URL.urlQNum#
</cfoutput><cfabort>
 --->
<cfstoredproc procedure="PACK_SELECT_ALL.sp_UserComments" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID"  value="#local.PrjID#"         null="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varUserID" value="#strAppUser.UserID#"   null="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varQNum" value="#URL.urlQNum#"   null="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_UserComments" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_UC" resultset="1"><!--- UC = User Comments --->
    
</cfstoredproc>

<cfif isDefined("client.sprWDDX_UC")>
    <cfset temp = DeleteClientVariable("sprWDDX_UC")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_UC#" output="client.sprWDDX_UC">

