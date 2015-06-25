<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_populateSelect.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>
<script src="JS/showMsg.js" type="text/javascript"></script>
<script src="JS/of_Validate.js" type="text/javascript"></script>
<!--- ===================================================================== --->
<!--- <cfif isDefined("client.sprWDDX_getPersonalProjects")> --->
	<cfwddx action="WDDX2CFML" input="#client.sprWDDX_getPersonalProjects#" output="spr_getPersonalProjects">
<!--- </cfif> --->
<!--- <cfif isDefined("client.sprWDDX_getAnswers")> --->
	<cfwddx action="WDDX2CFML" input="#client.sprWDDX_getAnswers#"      output="spr_getAnswers">
<!--- </cfif> --->
<!--- <cfif isDefined("client.sprWDDX_StrategicGoals")> --->
	<cfwddx action="WDDX2CFML" input="#client.sprWDDX_StrategicGoals#"  output="spr_StrategicGoals">
<!--- </cfif> --->
<!--- <cfif isDefined("client.sprWDDX_Questions")> --->
	<cfwddx action="WDDX2CFML" input="#client.sprWDDX_Questions#"       output="spr_Questions">
<!--- </cfif> --->
<!--- <cfif isDefined("client.sprWDDX_PrjPrgrAgents")> --->
	<cfwddx action="WDDX2CFML" input="#client.sprWDDX_NPA_PrgrOfficers#"   output="spr_NPA_PrgrOfficers">
<!--- </cfif> --->
<!--- ===================================================================== --->

<!--- Begin DECLARATION PART -------------------------------------------------->
<script language="JavaScript">
vValidationPassed = "YES";
//
arrayTemp = new Array();
primaryBuffer = new Array();
//
var vTemp;
//
//-- In the file Include/inc_declarePersonalProjects.cfm the following vars 
//   will receive an actual values.
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
	vS += "<option value=4>4 - More than satusfactory (positive effect)</option>";
	vS += "<option value=5>5 - Exceptional (very positive impact)</option>";
	vS += "<option value=6>N - Not applicable</option>";
	vS += "<option value=7>U - Unknown (not enough information)</option>";
	vS += "</select>";
	//
	return vS;
}
//------------------------------------------------------------------------------
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
<tr><td></td></tr>
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
	<td rowspan="2">&nbsp;
		<cfinclude template="Include/inc_PersonalProjectsSummary.cfm">
	</td>
</tr>
<!--- <tr><td>&nbsp;</td><td>&nbsp;</td></tr> --->
<tr>
	<td  class="textFormTitle">
		Project List:
		<select name="s_PrjNum" onchange="onChPrjNum(this.value)" style="width: 350px;" size="11"></select>
	</td>
	
</tr>
<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
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
<script language="JavaScript">
//---  --------------------------------------------------------------
//onChEvalStat(-1);
//
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
//
buildTblQuestions();
//
onChEvalStat(-1);
//
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function onChEvalStat(argEvalStat){with(self.document.forms[0]){//alert("onChEvalStat   "+argEvalStat)
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
		SubmitPage('InsUpdUserPrjEval');
	}
	
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
			vListOfAnsewrsTemp = eval( "aQ_"+q+".options[aQ_"+q+".options.selectedIndex].text")+vTemp;
			if (vListOfAnsewrsTemp == "-- Select your answer --," || vListOfAnsewrsTemp == "-- Select your answer --")
			{
				vListOfAnsewrsTemp = "No Answer Selected,";
			}
			vListOfAnsewrs = vListOfAnsewrs + vListOfAnsewrsTemp
		}
		//
		//alert(vListOfAnsewrs)
		//
		var popupPage = "popupPrintPreview.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>"+
						"&urlPrjTotal="+vPrjTotal+
						"&urlPrjActive="+vPrjActive+
						"&urlPrjClosed="+vPrjClosed+
						"&urlPrjCompleted="+vPrjCompleted+
						"&urlPrjCLO_COM="+vPrjCLO_COM+
						"&urlPrjNE="+vPrjNE+
						"&urlPrjPE="+vPrjPE+
						"&urlPrjE="+vPrjE+
						"&urlPerOfEval="+vPerOfEval+
						"&urlPrjNum="+idPrjNum.innerText+
						"&urlPrjTitle="+idPrjTitle.innerText+
						"&urlPrjFiscYear="+idPrjFiscYear.innerText+
						"&urlPrgrAgency="+idPrgrAgency.innerText+
						"&urlNPAOfficer="+vNPAOfficer+
						"&urlStrGoalName="+vStrategigGoal+
						"&urlCurrentStatus="+idCurrentStatus.innerText+
						"&urlEVDB_Presence="+idEVDB_Presence.innerText+
						"&urlAnswers="+vListOfAnsewrs+
						"&urlComments="+txta_Comments.value
						;
		//
		var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,titlebar=no,resizable=yes,top=0,left=0,copyhistory=no,width=800,height=600','yes');
		if ((document.window != null) && (!popupWin.opener))
		{
			popupWin.opener = document.window;
		}
		
	}
}}


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