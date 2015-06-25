<cfset client.UUID = CreateUUID()> 
<cfset client.ListOfPrjIDs = #FORM.s_Prjs#>
<cfset client.WithWithoutCommnts = #FORM.rb_Comments#>
<!--- <cfset client.GraphStyle = #FORM.rb_GraphStyle#> --->
<cfset client.PrjsCounter = #FORM.h_PrjsCounter#>

<!--- 
<cfoutput>#client.UUID#<br>#client.PrjIDs#<br>#client.WithWithoutCommnts#<br>#client.GraphStyle#<br>#client.PrjsCounter#</cfoutput>
<cfabort>
 --->

<!--- --------------------------Graph:------------------------------------- --->
<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_Report_Mngrs_VS_Parts" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varUUID"  value="#client.UUID#"  null="No"> 
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPrjIDs"  value="#client.ListOfPrjIDs#"  null="No">
  <!--- <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varWithWithoutCommnts" value="#client.WithWithoutCommnts#" null="No"> --->
  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_Report_Mngrs_VS_Parts" maxrows="-1" variable="IgnoreThis">
  <cfprocresult name="spr_Report_Mngrs_VS_Parts" resultset="1">
</cfstoredproc>
<!--- <cfoutput>#spr_Report_Mngrs_VS_Parts.recordCount#</cfoutput><cfabort> --->

<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_Report_Average" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varUUID"  value="#client.UUID#"  null="No"> 
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPrjIDs"  value="#client.ListOfPrjIDs#"  null="No">
  <!--- <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varWithWithoutCommnts" value="#client.WithWithoutCommnts#" null="No"> --->
  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_Report_Average" maxrows="-1" variable="IgnoreThis">
  <cfprocresult name="spr_Report_Average" resultset="1">
</cfstoredproc>

<cfif isDefined("client.sprWDDX_Report_Mngrs_VS_Parts")>
    <cfset temp = DeleteClientVariable("sprWDDX_Report_Mngrs_VS_Parts")>
</cfif>
<cfwddx action="CFML2WDDX" input="#spr_Report_Mngrs_VS_Parts#" output="client.sprWDDX_Report_Mngrs_VS_Parts">

<cfif isDefined("client.sprWDDX_Report_Average")>
    <cfset temp = DeleteClientVariable("sprWDDX_Report_Average")>
</cfif>
<cfwddx action="CFML2WDDX" input="#spr_Report_Average#" output="client.sprWDDX_Report_Average">
<!--- --------------------------Graph ------------------------------------- --->

<!--- Comments: --->
<cfif #client.WithWithoutCommnts# EQ "withComments">
	<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_getComments" datasource="#client.DSN#" returncode="No">
	  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varUUID"  value="#client.UUID#"  null="No"> 
	  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPrjIDs"  value="#client.ListOfPrjIDs#"  null="No">
	  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getComments" maxrows="-1" variable="IgnoreThis">
	  <cfprocresult name="spr_getComments" resultset="1">
	</cfstoredproc>

	<cfif isDefined("client.sprWDDX_getComments")>
	    <cfset temp = DeleteClientVariable("sprWDDX_getComments")>
	</cfif>
	<cfwddx action="CFML2WDDX" input="#spr_getComments#" output="client.sprWDDX_getComments">
</cfif>
<!--- Comments --->

