
<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_IfUserHasComments" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID"  value="#client.PrjID#"         null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varUserID" value="#strAppUser.UserID#"   null="No">
    
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_IfUserHasComments" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_IfUserHasComments" resultset="1">
    
</cfstoredproc>

<cfset client.IUHCrecordCount = #spr_IfUserHasComments.recordCount#>

<cfif isDefined("client.sprWDDX_IfUserHasComments")>
    <cfset temp = DeleteClientVariable("sprWDDX_IfUserHasComments")>
</cfif>

<!--- <cfif #client.IUHCrecordCount# GT 0> --->
	<cfwddx action="CFML2WDDX" input="#spr_IfUserHasComments#" output="client.sprWDDX_IfUserHasComments">
<!--- </cfif> --->