<!--- BranchInfo.cfm --->
<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>


<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">
<!--- <cfoutput>#strUser.PersonID#</cfoutput><cfabort> ---> 
<cfstoredproc procedure="PHONEBOOK.PACK_EVAL.sp_getBranchProfile" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC"  variable="argPersonID" value="#strUser.PersonID#"  null="No">

	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getBranchProfile"   maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_FiscalYears"  maxrows="-1" variable="IgnoreThis">
		
	<cfprocresult name="spr_getBranchProfile" resultset="1">
	<cfprocresult name="spr_FiscalYears"  resultset="2">
</cfstoredproc>

<!--- <cfoutput>#spr_getBranchProfile.recordCount#</cfoutput><cfabort> --->

<!--- Begin DECLARATION PART -------------------------------------------------->
<script language="JavaScript">
//------------------------------------------------------------------------------
var vPrjTotal = 0;     //Total Number of projects
var vPrjNE = 0;        //Not Evaluated projects
var vPrjPE = 0;        //Partially Evaluated projects
var vPrjE = 0;         //EvaluatedProjects
var vPerOfEval = 0;    //Percent of Evaluated projects
var vPrjActive = 0;    //Number of Active projects
var vPrjClosed = 0;    //Number of Closed projects
var vPrjCompleted = 0; //Number of Completed projects
var vPrjCLO_COM = 0;   //Number of Closed and Completed projects
//
of_browserSelection();
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//
</script>
<cfinclude template="JS/inc_BranchProfile.cfm">
<!--- End DECLARATION PART ---------------------------------------------------->

<table cellspacing="2" cellpadding="2" border="0">
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
<tr>
    <td width="50%"><cfinclude template="Include/inc_BranchProjectsSummary.cfm"></td>
    <td width="50%">&nbsp;</td>
</tr>
<tr><td colspan="2"><hr></td></tr>
</table>

<!--- Begin ACTION PART ------------------------------------------------------->
<script language="JavaScript">
//-- Setting summary information about all applicable projects:
of_innerHTML("idPrjTotal", "'"+vPrjTotal+"'");
//
of_innerHTML("idPrjActive", "'"+vPrjActive+"'");
of_innerHTML("idPrjClosed", "'"+vPrjClosed+"'");
of_innerHTML("idPrjCompleted", "'"+vPrjCompleted+"'");
//
of_innerHTML("idPrj_CLO_COM", "'"+vPrjCLO_COM+"'");
of_innerHTML("idPrjNE", "'"+vPrjNE+"'");
of_innerHTML("idPrjPE", "'"+vPrjPE+"'");
of_innerHTML("idPrjE", "'"+vPrjE+"'");
of_innerHTML("idPerOfEval", "'"+vPerOfEval+"'");
</script>
<!--- End ACTION PART --------------------------------------------------------->