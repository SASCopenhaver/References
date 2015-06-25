<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--- <cfoutput>#urlMngrVSPart_OR_Avrg#<br>#urlPrjID#<br>#urlWithWithoutCommnts#</cfoutput> --->
<html>
<head>
<title></title>
<cfset client.UUID = CreateUUID()> 
<cfset client.ListOfPrjIDs = #urlPrjID#>

<!--- GRAPH --->
<cfif #urlMngrVSPart_OR_Avrg# EQ "MP">
	<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_Report_Mngrs_VS_Parts" datasource="#client.DSN#" returncode="No">
	  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varUUID"  value="#client.UUID#"  null="No"> 
	  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPrjIDs"  value="#client.ListOfPrjIDs#"  null="No">
	  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_Report_Mngrs_VS_Parts" maxrows="-1" variable="IgnoreThis">
	  <cfprocresult name="spr_Report_Mngrs_VS_Parts" resultset="1">
	</cfstoredproc>
<cfelseif #urlMngrVSPart_OR_Avrg# EQ "A">
	<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_Report_Average" datasource="#client.DSN#" returncode="No">
	  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varUUID"  value="#client.UUID#"  null="No"> 
	  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPrjIDs"  value="#client.ListOfPrjIDs#"  null="No">
	  <!--- <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varWithWithoutCommnts" value="#client.WithWithoutCommnts#" null="No"> --->
	  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_Report_Average" maxrows="-1" variable="IgnoreThis">
	  <cfprocresult name="spr_Report_Average" resultset="1">
	</cfstoredproc>
</cfif>
<!--- GRAPH --->
<!--- Comments --->
<cfif #urlWithWithoutCommnts# EQ "withComments">
	<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_getComments" datasource="#client.DSN#" returncode="No">
	  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varUUID"  value="#client.UUID#"  null="No"> 
	  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPrjIDs"  value="#client.ListOfPrjIDs#"  null="No">
	  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getComments" maxrows="-1" variable="IgnoreThis">
	  <cfprocresult name="spr_getComments" resultset="1">
	</cfstoredproc>
</cfif>
<!--- Comments --->

<script language="JavaScript1.1">
//------------------------------------------------------------------------------
function of_CloseWin()
{
	window.close();
}
//------------------------------------------------------------------------------
function of_Print()
{
	window.print();
}
//------------------------------------------------------------------------------
</script>
<body>
<table>
<tr>
	<td align="left">
	<input type="Button" value="Print" onclick="of_Print();">
	&nbsp;&nbsp;&nbsp;
	<input type="Button" value="Close" onclick="of_CloseWin();">
	</td>
</tr>
<tr class="Brown9">
	<td>
<cfif #urlMngrVSPart_OR_Avrg# EQ "MP">
	<cfloop query = "spr_Report_Mngrs_VS_Parts">
		<cfinclude template="graphBar_Mngrs_VS_Parts.cfm"><br>
	</cfloop>
<cfelseif #urlMngrVSPart_OR_Avrg# EQ "A">
	<cfloop query = "spr_Report_Average">
		<cfinclude template="graphBar_Average.cfm"><br>
	</cfloop>
</cfif>
	</td>
</tr>

<cfif #urlWithWithoutCommnts# EQ "withComments">
<cfloop query = "spr_getComments">
<tr class="Brown9">
	<td>
		<cfoutput>#NormDescr#</cfoutput>
	</td>
</tr>
</cfloop>
</cfif>
<tr>
	<td align="left">
	<input type="Button" value="Print" onclick="of_Print();">
	&nbsp;&nbsp;&nbsp;
	<input type="Button" value="Close" onclick="of_CloseWin();">
	</td>
</tr>

</table>

</body>
</html>
