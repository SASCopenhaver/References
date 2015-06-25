<!--- ********************************************************************* --->
<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">
<!--- --------------------------------------------------------------------- --->
<cfstoredproc procedure="PACK_EVAL.sp_getGenericInfo" datasource="#client.DSN#" returncode="No">
	<!--- --- --->
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_StrategicGoals"  maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_Questions"       maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_NPA_PrgrOfficers"  maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_FiscalYears"  maxrows="-1" variable="IgnoreThis">
	<!--- --- --->
	<cfprocresult name="spr_StrategicGoals"  resultset="1">
	<cfprocresult name="spr_Questions"       resultset="2">
	<cfprocresult name="spr_NPA_PrgrOfficers"  resultset="3">
	<cfprocresult name="spr_FiscalYears"  resultset="4">
	<!--- --- --->
</cfstoredproc>
<!--- 
<cfwddx action="CFML2WDDX" input="#spr_StrategicGoals#"  output="client.sprWDDX_StrategicGoals">
<cfwddx action="CFML2WDDX" input="#spr_Questions#"       output="client.sprWDDX_Questions">
<cfwddx action="CFML2WDDX" input="#spr_NPA_PrgrOfficers#"   output="client.sprWDDX_NPA_PrgrOfficers">
<cfwddx action="CFML2WDDX" input="#spr_FiscalYears#"   output="client.sprWDDX_FiscalYears">
 --->
<!--- --------------------------------------------------------------------- --->
<!--- <cfoutput>#strUser.PersonID#</cfoutput><cfabort> --->
<cfstoredproc procedure="PACK_EVAL.sp_getPersonalProjects" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="In"  cfsqltype="CF_SQL_NUMERIC" variable="argPersonID" value="#strUser.PersonID#"  null="No">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getPersonalProjects" maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getAnswers"          maxrows="-1" variable="IgnoreThis">
		
	<cfprocresult name="spr_getPersonalProjects" resultset="1">
	<cfprocresult name="spr_getAnswers"          resultset="2">
</cfstoredproc>
<!--- 	
<cfwddx action="CFML2WDDX" input="#spr_getPersonalProjects#" output="client.sprWDDX_getPersonalProjects">
<cfwddx action="CFML2WDDX" input="#spr_getAnswers#"          output="client.sprWDDX_getAnswers">
 --->
<!--- ********************************************************************* --->
<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_populateSelect.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>
<script src="JS/showMsg.js" type="text/javascript"></script>
<script src="JS/of_Validate.js" type="text/javascript"></script>
<script src="JS/of_Style.js" type="text/javascript"></script>

<!--- Begin DECLARATION PART -------------------------------------------------->
<cfinclude template="JS/inc_VariablesForProjectsSummary.cfm">
<script language="JavaScript">
//
//f_VariablesForProjectsSummary();
//
vValidationPassed = "YES";
//
arrayTemp = new Array();
primaryBuffer = new Array();
//
var vTemp;
//

/*
//-- Set of OLD variables:
var vPrjTotal = 0;     //Total Number of projects
var vPrjNE = 0;        //Not Evaluated projects
var vPrjPE = 0;        //Partially Evaluated projects
var vPrjE = 0;         //EvaluatedProjects
var vPerOfEval = 0;    //Percent of Evaluated projects
var vPrjActive = 0;    //Number of Active projects
var vPrjClosed = 0;    //Number of Closed projects
var vPrjCompleted = 0; //Number of Completed projects
var vPrjCLO_COM = 0;   //Number of Closed and Completed projects
*/
//
of_browserSelection();
//
//------------------------------------------------------------------------------
function buildTblQuestions(){with(self.document.forms[0]){
	var vTemp = "<table align=\"center\" cellspacing=2 cellpadding=2 >"; //border=1
	vTemp += "<td colspan=3 ><hr></td>";
	for (var i=0; i<rowsQ; i++)
	{
		if (arrayQ[i].aIDs == arrayQ[i].aSuperID)
		{
			vTemp += "<tr>";
			vTemp += "<td colspan=3 class=\"textQTitle\">"+arrayQ[i].aIDs+"  "+arrayQ[i].aDescr+"</td>";
			vTemp += "</tr>";
			for (var ii=0; ii<rowsQ; ii++)
			{
				if (arrayQ[i].aIDs == arrayQ[ii].aSuperID && arrayQ[i].aIDs != arrayQ[ii].aIDs)
				{//alert(arrayQ[i].aIDs +"  "+ arrayQ[ii].aSuperID)
					vTemp += "<tr>";
					//vTemp += "<td>"+parseInt(i+1)+"-"+ii+"</td>";
					vTemp += "<td width=\"1%\">-</td>"
					vTemp += "<td class=\"textPlain\">"+arrayQ[ii].aDescr+"</td>";
					vTemp += "<td>"+of_Answers(arrayQ[ii].aIDs)+"</td>";
					vTemp += "</tr>";
				}
			}
			vTemp += "<tr><td colspan=3><hr></td></tr>";		
			
		}
	}
	//
	vTemp += "<tr><td colspan=3 class='textQTitle'>Comments</td></tr>";
	vTemp += "<tr><td colspan=3><textarea name='txta_Comments' rows=10 cols=92  onfocus= 'setPrimaryBuffer();'>To provide comments, select project first.</textarea></td></tr>";
	//
	vTemp += "<tr><td colspan=3>&nbsp;</td></tr>";
	//
	vTemp += "<tr><td align=\"right\" colspan=3>";
	vTemp += "<input title=\"Print Preview\" type=\"Button\" value=\"Print Preview\" onclick=\"printPreview();\">";
	vTemp += "&nbsp;&nbsp;&nbsp;";
	vTemp += "<input type=\"Button\" name=\"cb_SaveEval\" value=\"Save Evaluation\" title=\"Save Evaluation\"  onclick=\"Validate(); \" >";
	vTemp += "</td></tr>";
	//
	vTemp += "</table>";
	//
	document.write(vTemp);
}}//end of fumction buildTblQuestions()
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_Answers(argQuestID)
{//alert(argQuestID)
	var vS = "";
	vTemp = "aQ_"+argQuestID;
	//alert(vTemp)
	//vS  = "<select name='aQ_'"+argQuestID+">";
	vS  = "<select name="+vTemp+" onchange=\"setPrimaryBuffer();\">";
	vS += "<option value=-1>-- Select your answer --</option>";
	vS += "<option value=1>1 - Bad problems (negative impact)</option>";
	vS += "<option value=2>2 - Some problems (less than satisfactory)</option>";
	vS += "<option value=3>3 - Satisfactory (met basic requirements)</option>";
	vS += "<option value=4>4 - More than satisfactory (positive effect)</option>";
	vS += "<option value=5>5 - Exceptional (very positive impact)</option>";
	vS += "<option value=6>N - Not applicable</option>";
	vS += "<option value=7>U - Unknown (not enough information)</option>";
	vS += "</select>";
	//
	return vS;
}
//------------------------------------------------------------------------------
//
function f_TableForProjectsSummary(){with(self.document.forms[0]){
	var vCommand = id_Command.innerText.substr(0,4);
	//alert(vCommand.substr(0,4))//Show SUMMARY OF PROJECT EVALUATION
	if (vCommand == "Show")
	{
		var vShowHideProjectsSummary =  f_ShowHideProjectsSummary();//alert(vShowHideProjectsSummary)	
		//
		of_innerHTML("id_Command", "'<a href=\"javascript: f_TableForProjectsSummary()\">Hide SUMMARY OF PROJECT EVALUATION</a>'");
		of_Style("id_TableForProjectsSummary", "visibility", "visible");
		of_innerHTML("id_TableForProjectsSummary","'"+vShowHideProjectsSummary+"'");
		//
		of_Style("navigateTop", "visibility", "visible");
		
		
	}
	else//"Hide"
	{
		
		of_innerHTML("id_Command", "'<a href=\"javascript: f_TableForProjectsSummary()\">Show SUMMARY OF PROJECT EVALUATION</a>'");
		of_innerHTML("id_TableForProjectsSummary","'&nbsp;'");
		of_Style("id_TableForProjectsSummary", "visibility", "hidden");
		//
		of_Style("navigateTop", "visibility", "hidden");
	}

}}
//
//------------------------------------------------------------------------------
//This function replaces "hard coded" file inc_TableForProjectsSummary.cfm
function f_ShowHideProjectsSummary(){with(self.document.forms[0]){
	var vRtn = "";
	//
	vRtn += "<table>";
	vRtn += "<tr>";
	vRtn += "<td colspan=2 align=\"right\" id=\"navigateBelow\">";
	vRtn += "<a name=\"SummaryOfPrjs\"></a>";
	vRtn += "<a href=\"#Details\">Check Details (below)</a>";
	vRtn += "</td>";
	vRtn += "</tr>";
	vRtn += "</table>";
	//
	vRtn += "<table bgcolor=\"#EEDDB2\" cellspacing=4 cellpadding=1 border=0>"; 
	vRtn += "<tr><td colspan=8><hr color=\"#800000\" noshade></td></tr>"; 
	vRtn += "<tr><td colspan=8 class=\"txtTableCell\">SUMMARY OF PROJECT EVALUATION</td></tr>"; 
	vRtn += "<tr><td colspan=8><hr color=\"#800000\" noshade></td></tr>"; 
	//
	vRtn += "<tr>";
	vRtn += "<td rowspan=3 align=\"center\" class=\"txtTableCell\" width=\"14%\"><br>Current Status</td>";
	vRtn += "<td rowspan=3 align=\"center\" class=\"txtTableCell\" width=\"20%\"><br>Evaluation Status</td>";
	vRtn += "<td colspan=2 align=\"center\" class=\"txtTableCell\" width=\"22%\">Fiscal Year</td>";
	vRtn += "<td colspan=2 align=\"center\" class=\"txtTableCell\" width=\"22%\">Fiscal Year</td>";
	vRtn += "<td rowspan=3 colspan=2 align=\"center\" class=\"txtTableCell\" width=\"22%\"><br>Total</td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td colspan=2><hr color=\"#800000\" noshade></td>";
	vRtn += "<td colspan=2><hr color=\"#800000\" noshade></td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td colspan=2 align=\"center\" class=\"txtTableCell\">"+vPrevFiscalYear+"</td>";
	vRtn += "<td colspan=2 align=\"center\" class=\"txtTableCell\">"+vCurrFiscalYear+"</td>";
	vRtn += "</tr>";
	//--------------------------------------------------------------------------
	vRtn += "<tr>";
	vRtn += "<td colspan=8><hr color=\"#800000\" noshade></td>";
	vRtn += "</tr>";
	//--------------------------------------------------------------------------
	vRtn += "<tr>";
	vRtn += "<td rowspan=3 class=\"txtTableCell\">Active</td>";
	vRtn += "<td class=\"txtTableCell\">Not Evaluated</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\" width=\"11%\">"+vActNE_PrevFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\" width=\"11%\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\" width=\"11%\">"+vActNE_CurrFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\" width=\"11%\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\" width=\"11%\">"+parseInt(parseInt(vActNE_PrevFiscYear)+parseInt(vActNE_CurrFiscYear))+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\" width=\"11%\">&nbsp;</td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td class=\"txtTableCell\">Partially Evaluated</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vActPE_PrevFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vActPE_CurrFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+parseInt(parseInt(vActPE_PrevFiscYear)+parseInt(vActPE_CurrFiscYear))+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td class=\"txtTableCell\">Evaluated</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vActE_PrevFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">("+vActE_PrevFiscYearPercent+"%)</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vActE_CurrFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">("+vActE_CurrFiscYearPercent+"%)</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+parseInt(parseInt(vActE_PrevFiscYear)+parseInt(vActE_CurrFiscYear))+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">("+vActE_TotalPercent+"%)</td>";
	vRtn += "</tr>";
	//--------------------------------------------------------------------------
	vRtn += "<tr>";
	vRtn += "<td colspan=8><hr color=\"#800000\" noshade></td>";
	vRtn += "</tr>";
	//--------------------------------------------------------------------------
	//--------------------------------------------------------------------------
	vRtn += "<tr>";
	vRtn += "<td rowspan=3 class=\"txtTableCell\">Closed</td>";
	vRtn += "<td class=\"txtTableCell\">Not Evaluated</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vCloNE_PrevFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vCloNE_CurrFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+parseInt(parseInt(vCloNE_PrevFiscYear)+parseInt(vCloNE_CurrFiscYear))+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td class=\"txtTableCell\">Partially Evaluated</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vCloPE_PrevFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vCloPE_CurrFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+parseInt(parseInt(vCloPE_PrevFiscYear)+parseInt(vCloPE_CurrFiscYear))+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td class=\"txtTableCell\">Evaluated</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vCloE_PrevFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">("+vCloE_PrevFiscYearPercent+"%)</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vCloE_CurrFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">("+vCloE_CurrFiscYearPercent+"%)</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+parseInt(parseInt(vCloE_PrevFiscYear)+parseInt(vCloE_CurrFiscYear))+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">("+vCloE_TotalPercent+"%)</td>";
    vRtn += "</tr>";
	//--------------------------------------------------------------------------
	//--------------------------------------------------------------------------
	vRtn += "<tr>";
	vRtn += "<td colspan=8><hr color=\"#800000\" noshade></td>";
	vRtn += "</tr>";
	//--------------------------------------------------------------------------
	vRtn += "<tr>";
	vRtn += "<td rowspan=3 class=\"txtTableCell\">Completed</td>";
	vRtn += "<td class=\"txtTableCell\">Not Evaluated</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vComNE_PrevFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vComNE_CurrFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+parseInt(parseInt(vComNE_PrevFiscYear)+parseInt(vComNE_CurrFiscYear))+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td class=\"txtTableCell\">Partially Evaluated</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vComPE_PrevFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vComPE_CurrFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+parseInt(parseInt(vComPE_PrevFiscYear)+parseInt(vComPE_CurrFiscYear))+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td class=\"txtTableCell\">Evaluated</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vComE_PrevFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">("+vComE_PrevFiscYearPercent+"%)</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vComE_CurrFiscYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">("+vComE_CurrFiscYearPercent+"%)</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+parseInt(parseInt(vComE_PrevFiscYear)+parseInt(vComE_CurrFiscYear))+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">("+vComE_TotalPercent+"%)</td>";
	vRtn += "</tr>";
	
	//
	vRtn += "<tr>";
	vRtn += "<td colspan=8><hr color=\"#800000\" noshade></td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td class=\"txtTableCell\" align=\"right\" colspan=2>TOTAL:</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vTotalPrjPrevFiscalYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vTotalPrjCurrFiscalYear+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">"+vPrjTotal+"</td>";
	vRtn += "<td class=\"txtTableHeader\" align=\"center\">&nbsp;</td>";
	vRtn += "</tr>";
	//
	vRtn += "<tr>";
	vRtn += "<td colspan=8><hr color=\"#800000\" noshade></td>";
	vRtn += "</tr>";
	//	////////////////////////////////////////////////////////////////////////////////
	vRtn += "</table>";
	//
	return vRtn;
}}			
//
</script>
<cfinclude template="JS/inc_PersonalProjects.cfm">
<cfinclude template="JS/inc_Answers.cfm">
<!--- <cfinclude template="Include/inc_StrategicGoals.cfm"> --->
<cfinclude template="JS/inc_Questions.cfm">
<cfinclude template="JS/inc_NPA_ProgramOfficers.cfm">

<!--- End DECLARATION PART ---------------------------------------------------->

<input type="Hidden" name="h_DataModifiedAnswers">
<!--- --------------------------------------------------------------------- --->
<table cellpadding="2" cellspacing="2" border="0">
<tr>
	<td colspan="2">
		<div id="id_Command">
			<a href="javascript: f_TableForProjectsSummary()">Hide SUMMARY OF PROJECT EVALUATION</a>
		</div>
		<div id="id_TableForProjectsSummary">
			<cfinclude template="Include/inc_TableForProjectsSummary.cfm">
		</div>
		
	</td>
</tr>
<tr>
	<td colspan="2" align="right" id="navigateTop">
		<a name="Details"></a><a href="#SummaryOfPrjs">Back to Summary (top)</a>
	</td>
</tr>
<tr >
	<td width="50%" class="textFormTitle">
		Evaluation Status:<br>
		<cfif isDefined("client.EvalStatus")>
			<cfif #client.EvalStatus# EQ "NE">
				<cfset local.Selected_1  = "">
				<cfset local.Selected_NE = "selected">
				<cfset local.Selected_PE = "">
				<cfset local.Selected_E  = "">
			<cfelseif #client.EvalStatus# EQ "PE">
				<cfset local.Selected_1  = "">
				<cfset local.Selected_NE = "">
				<cfset local.Selected_PE = "selected">
				<cfset local.Selected_E  = "">
			<cfelseif #client.EvalStatus# EQ "E">
				<cfset local.Selected_1  = "">
				<cfset local.Selected_NE = "">
				<cfset local.Selected_PE = "">
				<cfset local.Selected_E  = "selected">
			</cfif>
		<cfelse>
			<cfset local.Selected_1  = "selected">
			<cfset local.Selected_NE = "">
			<cfset local.Selected_PE = "">
			<cfset local.Selected_E  = "">
		</cfif>
		<cfoutput>
		<select name="s_EvalStat" onChange="onChEvalStat(this.value);" style="width: 350px;">
			<option value="-1" #local.Selected_1#  >[---------- Select Evaluation Status --------------------------------]</option>
			<option value="NE" #local.Selected_NE# >Not Evaluated</option>
			<option value="PE" #local.Selected_PE# >Partially Evaluated</option>
			<option value="E"  #local.Selected_E#  >Evaluated</option>
		</select>
		</cfoutput>
	</td>
	<td class="textFormTitle">&nbsp;
		Project List:
		<select name="s_PrjNum" onchange="onChPrjNum(this.value)" style="width: 350px;" size="7"></select>
	</td>
</tr>
<!--- <tr><td>&nbsp;</td><td>&nbsp;</td></tr> 
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>--->
</table>
<table align="center" cellspacing="2" cellpadding="2" border="0">
<tr><td colspan="3"><hr></td></tr>
<tr>
	<td colspan="3">
		<cfinclude template="Include/inc_SelectedProjectSummary.cfm">
	</td>
</tr>
</table>

<!--- Begin ACTION PART ------------------------------------------------------->
<cfinclude template="JS/inc_ProjectsSummary.cfm">
<script language="JavaScript">
//
buildTblQuestions();
//
onChEvalStat(-1);
//
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function onChEvalStat(argEvalStat){with(self.document.forms[0]){//alert("onChEvalStat   "+argEvalStat)
	//
	function of_arraySort(a,b)
	{
		a = a.aPrjID;//a.aPrjTitle.toUpperCase();
	 	b = b.aPrjID;//b.aPrjTitle.toUpperCase();
		return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );
	}
	orgBufferPP.sort(of_arraySort);	
	//
	if (argEvalStat == -1)
	{
		of_populateSelect("s_PrjNum", -1, "[---------- Select Evaluation Status --------------------------------]", 0, "", "", "", "1D");
		of_innerHTML("idPrjNum",     	"''");
		of_innerHTML("idPrjTitle",   	"''");
		of_innerHTML("idPrjFiscYear",	"''");
		of_innerHTML("idPrgrAgency", 	"''");
		of_innerHTML("idNPAOfficer", 	"''");
		of_innerHTML("idStrGoalName", 	"''");
		of_innerHTML("idCurrentStatus", "''");
		of_innerHTML("idEVDB_Presence", "''");
		txta_Comments.value = "To provide comments, select project first.";
	}
	//
	else
	{//alert(argEvalStat)
		
		var pp = 0;
		arrayTemp.length = 0;
	
		for (var p=0; p<rowsPP; p++)//--------------------------------------
		{
			if (orgBufferPP[p].aEvalStatus == argEvalStat)
			{
				arrayTemp[pp] = new arrayPP (
											 orgBufferPP[p].aPrjID
											,orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle
											);	
				pp++;
			}
		}// end of for loop ------------------------------------------------
		//
		//------------------------------------------------------------------
		if (arrayTemp.length == 0)	
		{
			of_populateSelect("s_PrjNum", -1, "[---------- No Projects Available for this status ---------------]", 0, "", "", "", "1D");
		}
		else
		{
			of_populateSelect("s_PrjNum", -1, "[---------- Select Project Number ------------------------------------------]",
							  arrayTemp.length, "arrayTemp", "aPrjID", "aPrjNum", "2D");
			arrayTemp.length = 0;
		}
		//
		//setAnswers(-1);
		//------------------------------------------------------------------
	}
	//
	//-- Since s_PrjNum has property "multiple", the focus should be set explicitly,
	//   so validation could work.  Focus is set on the first (default) row.
	s_PrjNum.focus();
	s_PrjNum.options[0].selected = true;
	//
	setAnswers(-1);
	//alert(s_PrjNum.options[s_PrjNum.options.selectedIndex].value)
	//onChPrjNum(s_PrjNum.options[s_PrjNum.options.selectedIndex].value);
	//
	//----------------------------------------------------------------------
}}// end of function
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

function onChPrjNum(argPrjID){with(self.document.forms[0]){//alert("onChPrjNum   "+argPrjID)

	if (argPrjID == -1)
	{
		of_innerHTML("idPrjNum",     	"''");
		of_innerHTML("idPrjTitle",   	"''");
		of_innerHTML("idPrjFiscYear",	"''");
		of_innerHTML("idPrgrAgency", 	"''");
		of_innerHTML("idNPAOfficer", 	"''");
		of_innerHTML("idStrGoalName", 	"''");
		of_innerHTML("idCurrentStatus", "''");
		of_innerHTML("idEVDB_Presence", "''");
		txta_Comments.value = "To provide comments, select project first.";
	}
	else// when argPrjID is an actual Project ID 
	{//alert("onChPrjNum   "+argPrjID)
		
		
		for (var p=0; p<rowsPP; p++)
		{
			if (orgBufferPP[p].aPrjID == argPrjID)
			{//
				
				//-- 1a -- NPA Officer (Project Program Agency)
				vSnpaOfficer = orgBufferPP[p].aNPAOfficerName;
				if (orgBufferPP[p].aNPAOfficerID == 0)
				{//alert(orgBufferPP[p].aNPAOfficerID)
					vSnpaOfficer = of_buildSelect("strNPAOfficer");
				}
				//--------------------------------------------------------------
				//-- 1b -- Strategic Goal
				vSgoal = orgBufferPP[p].aStrGoalName;
				if (orgBufferPP[p].aStrGoalName == "No Data Found")
				{
					vSgoal = of_buildSelect("strGoal");
				}
				//--------------------------------------------------------------
				of_innerHTML("idPrjNum",     	"'"+orgBufferPP[p].aPrjNum+"'");
				of_innerHTML("idPrjTitle",   	"'"+orgBufferPP[p].aPrjTitle+"'");
				of_innerHTML("idPrjFiscYear",	"'"+orgBufferPP[p].aPrjFiscalYear+"'");
				of_innerHTML("idPrgrAgency", 	"'"+orgBufferPP[p].aPrgrAgency+"'");
				of_innerHTML("idNPAOfficer", 	"'"+vSnpaOfficer+"'");
				of_innerHTML("idStrGoalName", 	"'"+vSgoal+"'");
				     if (orgBufferPP[p].aPrjCurrentStatus == "ACT"){vCurrStat = "Active"}
				else if (orgBufferPP[p].aPrjCurrentStatus == "CLO"){vCurrStat = "Closed"}
				else if (orgBufferPP[p].aPrjCurrentStatus == "COM"){vCurrStat = "Completed"}
				of_innerHTML("idCurrentStatus", "'"+vCurrStat+"'");
				of_innerHTML("idEVDB_Presence", "'"+orgBufferPP[p].aEVDB_Presence+"'");
				txta_Comments.value = orgBufferPP[p].aPrjComments;
				//--------------------------------------------------------------
				break;
			}
		}
		
		
		
	}
	setAnswers(s_PrjNum.options[s_PrjNum.options.selectedIndex].value);
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_buildSelect(argCtrlName){with(self.document.forms[0])
{//alert(argCtrlName)

	var vS = "";
	if (argCtrlName == "strGoal")
	{
		
		vS += "<select name=\"s_StrGoals\" style=\"width: 350px;\">";
		vS += "<option value=-1>[---------- Select Strategic Goal ------------------------------------]</option>";
		vS += "<cfoutput query='spr_StrategicGoals'>";
		vS += "<option value=\"#strategic_goal_id#\">#strategic_goal_nm#</option>";
		vS += "</cfoutput>";
		vS += "</select>";
	}
	else if (argCtrlName == "strNPAOfficer")
	{
		//------------------------------------------------------------------
		//
		vS = s_PrjNum.options[s_PrjNum.options.selectedIndex].value;
		//
		for ( var o=0; o<rowsNPA_PO; o++ )
		{
			if (vS == orgBufferPP[o].aPrjID)
			{
				vS = orgBufferPP[o].aPrgrAgencyID;
				break;
			}
		}
		//
		//
		var oo = -1;
		arrayTemp.length = 0;
		for (var o=0; o<rowsNPA_PO; o++)
		{
			if(vS == orgBufferNPA_PO[o].aPersonOrgID)
			{
				oo++;
				arrayTemp[oo] = new arrayNPA_PO (
													tlv_NPA_PO.personid[o]
												   ,tlv_NPA_PO.personfullname[o]
												   ,tlv_NPA_PO.personorgid[o]
												);
			}
		}
		//
		vS = "<select name=\"s_NPA_Officer\" style=\"width: 350px;\">";
		vS += "<option value=-1>[---------- Select Program Agency Officer ---------------------]</option>";
		for (var o=0; o<arrayTemp.length; o++)
		{
			vS += "<option value="+arrayTemp[o].aPersonID+">"+arrayTemp[o].aPersonFullName+"</option>";
		}
		vS += "</select>";
		//------------------------------------------------------------------
	}
	
	return vS;

}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function Validate(){with(self.document.forms[0])
{
	vValidationPassed = "YES";
	
	for (e=0; e<5; e++ )//e means element.
						//Runs 4 loops, since validation applies to the max first 4 elements (controls)
	{
		if (elements[e].name == "s_EvalStat" && elements[e].value == -1)
		{
			alert("Sorry, request cannot be processed.\nPlease select \"Evaluation Status\" first.");
			eval(elements[e].name+".focus()"); 
			vValidationPassed = "NO";
			break;
		}
		else if (elements[e].name == "s_PrjNum" && elements[e].value == -1)
		{
			alert("Sorry, request cannot be processed.\nPlease select Project Number from \"Project List\".");
			eval(elements[e].name+".focus()"); 
			eval(elements[e].name+".options[0].selected = true"); 
			vValidationPassed = "NO";
			break;
		}
		else if (elements[e].name == "s_StrGoals" && elements[e].value == -1)
		{
			alert("Sorry, request cannot be processed.\nPlease select Strategic Goal.");
			eval(elements[e].name+".focus()"); 
			vValidationPassed = "NO";
			break;
		}
		else if (elements[e].name == "s_NPA_Officer" && elements[e].value == -1)
		{
			alert("Sorry, request cannot be processed.\nPlease select NPA Officer.");
			eval(elements[e].name+".focus()"); 
			vValidationPassed = "NO";
			break;
		}
	}
	//
	
	if (vValidationPassed == "YES")
	{
		if (confirm ( "You are just about to update this record.\n\n"+
				  "Would you like to proceed?" )
			)
		{
			SubmitPage('InsUpdUserPrjEval');
		
		}
	}
	
	/* OLD SCRIPT:
	if (vValidationPassed == "YES")
	{
		
		SubmitPage('InsUpdUserPrjEval');
	}
	*/
	
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function SubmitPage(argController){with(self.document.forms[0]){//alert(vValidationPassed)
	setPrimaryBuffer();
	h_DataModifiedAnswers.value = "";
	vTemp = ",";
	for (var i=101; i<128; i++ )
	{
		if (i == 127){vTemp = ""}
		h_DataModifiedAnswers.value += eval("primaryBuffer[0].aQ_"+i)+vTemp;
	}
	
	action = "_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController="+argController;
	submit();
	
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function setAnswers(argPrjID){with(self.document.forms[0]){//alert("setAnswers  "+argPrjID);
	
	if(argPrjID == -1)//-- Setting default in Question select boxes value "-1" and text "Select Your answer"
	{
		for (var q=101; q<128; q++ )
		{
			eval( "aQ_"+q+".options["+0+"].selected = true"  );
		}
	}

	else //setting the answers in Question select boxes that belong to a selected ProjectID
	{
		var vRowNum_In_orgBufferA = -1;
		for (var a=0; a<orgBufferA.length; a++)
		{
			if (argPrjID == orgBufferA[a].aPrjID)
			{
				vRowNum_In_orgBufferA = a;
				break;
			}
		}
		
		if (vRowNum_In_orgBufferA == -1)
		{
			setAnswers(vRowNum_In_orgBufferA);
		}
		else
		{//alert(vRowNum_In_orgBufferA);
		
			for (var a=101; a<128; a++ )
			{
				eval( "aQ_"+a+".value = orgBufferA["+vRowNum_In_orgBufferA+"].aQ_"+a);
			}
			
		}
	}
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
//-- Create Prime Buffer ---------------------------------------------------
function setPrimaryBuffer(){with(self.document.forms[0]){
	//primaryBuffer = new Array();
	var vPersonID = <cfoutput>#strUser.PersonID#</cfoutput>;
	var vPrjID    = s_PrjNum.options[s_PrjNum.options.selectedIndex].value;
	
	primaryBuffer.lenght = 0;
	primaryBuffer[0] = new arrayA (
									vPersonID, vPrjID,
									aQ_101.options[aQ_101.options.selectedIndex].value, 
									aQ_102.options[aQ_102.options.selectedIndex].value, 
									aQ_103.options[aQ_103.options.selectedIndex].value, 
									aQ_104.options[aQ_104.options.selectedIndex].value, 
									aQ_105.options[aQ_105.options.selectedIndex].value, 
									aQ_106.options[aQ_106.options.selectedIndex].value, 
									aQ_107.options[aQ_107.options.selectedIndex].value, 
									aQ_108.options[aQ_108.options.selectedIndex].value, 
									aQ_109.options[aQ_109.options.selectedIndex].value, 
									aQ_110.options[aQ_110.options.selectedIndex].value, 
									aQ_111.options[aQ_111.options.selectedIndex].value, 
									aQ_112.options[aQ_112.options.selectedIndex].value, 
									aQ_113.options[aQ_113.options.selectedIndex].value, 
									aQ_114.options[aQ_114.options.selectedIndex].value, 
									aQ_115.options[aQ_115.options.selectedIndex].value, 
									aQ_116.options[aQ_116.options.selectedIndex].value, 
									aQ_117.options[aQ_117.options.selectedIndex].value, 
									aQ_118.options[aQ_118.options.selectedIndex].value, 
									aQ_119.options[aQ_119.options.selectedIndex].value, 
									aQ_120.options[aQ_120.options.selectedIndex].value, 
									aQ_121.options[aQ_121.options.selectedIndex].value, 
									aQ_122.options[aQ_122.options.selectedIndex].value, 
									aQ_123.options[aQ_123.options.selectedIndex].value, 
									aQ_124.options[aQ_124.options.selectedIndex].value, 
									aQ_125.options[aQ_125.options.selectedIndex].value, 
									aQ_126.options[aQ_126.options.selectedIndex].value, 
									aQ_127.options[aQ_127.options.selectedIndex].value,
									"DataModified"
						         );

}}
//
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function printPreview(){with(self.document.forms[0])
{
	
	var vEvalStatus = s_EvalStat.options[s_EvalStat.options.selectedIndex].value;
	var vPrjID = s_PrjNum.options[s_PrjNum.options.selectedIndex].value;
	var vNPAOfficer;
	
	if (vEvalStatus == -1 || vPrjID == -1)
	{
		alert("Sorry, your request could not be processed.\n\"Evaluation Status\" and Project from \n have to be selected first.");
	}
	else if (vEvalStatus != -1 && vPrjID != -1)
	{
		
		for (var p=0; p<rowsPP; p++)
		{
			if (orgBufferPP[p].aPrjID == vPrjID)
			{
				//--- NPA Officer
				vNPAOfficer = orgBufferPP[p].aNPAOfficerID;
				if (vNPAOfficer == 0)//means that NPA Officer was not selected previously
									 // and oficer's name is not stored in the database.
									 // Select box appears on the screen.
				{
					vNPAOfficer = s_NPA_Officer.options[s_NPA_Officer.options.selectedIndex].value;
					if (vNPAOfficer == -1)
					{
						vNPAOfficer = "Not provided"
					}
					else
					{
						vNPAOfficer = s_NPA_Officer.options[s_NPA_Officer.options.selectedIndex].text;
					}
				}
				else
				{
					vNPAOfficer = idNPAOfficer.innerText;
				}
				//
				//--- Strategic Goal
				vStrategigGoal = orgBufferPP[p].aStrGoalID;
				if (vStrategigGoal = 0)
				{
					vStrategigGoal = s_StrGoals.options[s_StrGoals.options.selectedIndex].value;
					if (vStrategigGoal == -1)
					{
						vStrategigGoal = "Not Provided"
					}
					else
					{
						vStrategigGoal = s_StrGoals.options[s_StrGoals.options.selectedIndex].text;
					}
				}
				else
				{
					vStrategigGoal = idStrGoalName.innerText;
				}
				//
				break;
			}
		}
		//
		var vListOfAnsewrs = "";
		var vListOfAnsewrsTemp = "";
		vTemp = ",";
		for (var q=101; q<128; q++ )
		{
			if (q == 127){vTemp = ""}
			vListOfAnsewrsTemp = eval( "aQ_"+q+".options[aQ_"+q+".options.selectedIndex].value")+vTemp;
			vListOfAnsewrs = vListOfAnsewrs + vListOfAnsewrsTemp;
		}
		
		/*
		for (var q=101; q<128; q++ )
		{
			if (q == 127){vTemp = ""}
			vListOfAnsewrsTemp = eval( "aQ_"+q+".options[aQ_"+q+".options.selectedIndex].text")+vTemp;
			if (vListOfAnsewrsTemp == "-- Select your answer --," || vListOfAnsewrsTemp == "-- Select your answer --")
			{
				vListOfAnsewrsTemp = "No Answer Selected,";
			}
			vListOfAnsewrs = vListOfAnsewrs + vListOfAnsewrsTemp;
		}
		//alert("1   "+vListOfAnsewrs.substr( (parseInt(vListOfAnsewrs.length) - 1), 1))
		if ( vListOfAnsewrs.substr( (parseInt(vListOfAnsewrs.length) - 1), 1) == "," )
		{
			vListOfAnsewrs = vListOfAnsewrs.substr(0, (parseInt(vListOfAnsewrs.length) - 1) )
		}
		//alert("2   "+vListOfAnsewrs)
		*/
		
		
		
		//----------------------------------------------------------------------
		var popupPage = "popupPrintPreview.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>"+
						//GENERAL INFORMATION
						"&urlPrevFiscalYear="+vPrevFiscalYear+ 
						"&urlCurrFiscalYear="+vCurrFiscalYear+
						"&urlTotal="+vPrjTotal+
						//ACTIVE
						"&urlActNE_PrevFiscYear="+vActNE_PrevFiscYear+
						"&urlActPE_PrevFiscYear="+vActPE_PrevFiscYear+
						"&urlActE_PrevFiscYear="+vActE_PrevFiscYear+
						"&urlActE_PrevFiscYearPercent="+vActE_PrevFiscYearPercent+
						"&urlActNE_CurrFiscYear="+vActNE_CurrFiscYear+
						"&urlActPE_CurrFiscYear="+vActPE_CurrFiscYear+
						"&urlActE_CurrFiscYear="+vActE_CurrFiscYear+
						"&urlActE_CurrFiscYearPercent="+vActE_CurrFiscYearPercent+
						"&urlActE_TotalPercent="+vActE_TotalPercent+
						//-- CLOSED
						"&urlCloNE_PrevFiscYear="+vCloNE_PrevFiscYear+
						"&urlCloPE_PrevFiscYear="+vCloPE_PrevFiscYear+
						"&urlCloE_PrevFiscYear="+vCloE_PrevFiscYear+
						"&urlCloE_PrevFiscYearPercent="+vCloE_PrevFiscYearPercent+
						"&urlCloNE_CurrFiscYear="+vCloNE_CurrFiscYear+
						"&urlCloPE_CurrFiscYear="+vCloPE_CurrFiscYear+
						"&urlCloE_CurrFiscYear="+vCloE_CurrFiscYear+
						"&urlCloE_CurrFiscYearPercent="+vCloE_CurrFiscYearPercent+
						"&urlCloE_TotalPercent="+vCloE_TotalPercent+
						//-- COMPLETED
						"&urlComNE_PrevFiscYear="+vComNE_PrevFiscYear+
						"&urlComPE_PrevFiscYear="+vComPE_PrevFiscYear+
						"&urlComE_PrevFiscYear="+vComE_PrevFiscYear+
						"&urlComE_PrevFiscYearPercent="+vComE_PrevFiscYearPercent+
						"&urlComNE_CurrFiscYear="+vComNE_CurrFiscYear+
						"&urlComPE_CurrFiscYear="+vComPE_CurrFiscYear+
						"&urlComE_CurrFiscYear="+vComE_CurrFiscYear+
						"&urlComE_CurrFiscYearPercent="+vComE_CurrFiscYearPercent+
						"&urlComE_TotalPercent="+vComE_TotalPercent+
						//
						"&urlTotalPrjPrevFiscalYear="+vTotalPrjPrevFiscalYear+
						"&urlTotalPrjCurrFiscalYear="+vTotalPrjCurrFiscalYear+
						//
						"&urlPrjNum="+idPrjNum.innerText+
						"&urlPrjTitle="+idPrjTitle.innerText+
						"&urlPrjFiscYear="+idPrjFiscYear.innerText+
						"&urlPrgrAgency="+idPrgrAgency.innerText+
						"&urlNPAOfficer="+vNPAOfficer+
						"&urlStrGoalName="+vStrategigGoal+
						"&urlCurrentStatus="+idCurrentStatus.innerText+
						"&urlEVDB_Presence="+idEVDB_Presence.innerText+
						"&urlAnswers="+vListOfAnsewrs+
						"&urlComments="+txta_Comments.value;
		
		//alert(txta_Comments.value)
		//alert(popupPage)
		
		var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,titlebar=no,resizable=yes,top=0,left=0,copyhistory=no,width=800,height=600','yes');
		if ((document.window != null) && (!popupWin.opener))
		{
			popupWin.opener = document.window;
		}
		
	}
}}
//
f_TableForProjectsSummary();
//
</script>
<cfif isDefined("client.EvalStatus")>
	<script language="JavaScript">
		
		onChEvalStat("<cfoutput>#client.EvalStatus#</cfoutput>");
		self.document.forms[0].s_PrjNum.value = <cfoutput>#client.PrjID#</cfoutput>;
		onChPrjNum(<cfoutput>#client.PrjID#</cfoutput>);
	</script>
	<cfset temp = DeleteClientVariable("EvalStatus")>
	<cfset temp = DeleteClientVariable("PrjID")>
</cfif>
<!--- End ACTION PART --------------------------------------------------------->