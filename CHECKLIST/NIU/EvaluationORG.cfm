<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_populateSelect.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>

<!--- <cfwddx action="WDDX2CFML" input="#client.sprWDDX_PrjCheckList#"   output="spr_PrjCheckList"> --->
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_getUserProjects#" output="spr_getUserProjects">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_StrategicGoals#"  output="spr_StrategicGoals">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_Questions#"       output="spr_Questions">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_PrjPrgrAgents#"   output="spr_PrjPrgrAgents">
<!--- <cfoutput>#spr_Questions.recordCount#</cfoutput><cfabort> --->
<script language="JavaScript">
var vTemp;
of_browserSelection();
//******************************************************************************
//-- getUserProjects:
if ( "<cfoutput>#strUser.UserPrjCounter#</cfoutput>" != 0 )
{
//******************************************************************************
//PrjID PrjNum PrjTitle PrjFiscYear PrgrAgency NPAOfficer EVDB_Presence StrGoalID StrGoalName 	

	// -- UP - UserProjects
	<cfwddx action="CFML2JS" input="#spr_getUserProjects#" toplevelvariable="tlv_UP">
	
	var rowsUP = tlv_UP.getRowCount();
	
	function holdUP (aPrjID, aPrjNum, aPrjTitle, aPrjFiscYear, aPrgrAgency, aPrgrAgencyID, 
					 aNPAOfficerID, aNPAOfficerName, aEVDB_Presence, aStrGoalID, aStrGoalName, aPrjStatus )
					{
						this.aPrjID 		 = aPrjID;
						this.aPrjNum 		 = aPrjNum;
						this.aPrjTitle 		 = aPrjTitle;
						this.aPrjFiscYear 	 = aPrjFiscYear;
						this.aPrgrAgency 	 = aPrgrAgency;
						this.aPrgrAgencyID	 = aPrgrAgencyID;
						this.aNPAOfficerID   = aNPAOfficerID;
						this.aNPAOfficerName = aNPAOfficerName;
						this.aEVDB_Presence  = aEVDB_Presence;
						this.aStrGoalID      = aStrGoalID;
						this.aStrGoalName    = aStrGoalName;
						this.aPrjStatus 	 = aPrjStatus;
						
					}
	
	arrayUP = new Array();
	for (var i=0; i<rowsUP; i++)
	{
		arrayUP[i] = new holdUP
		(
			tlv_UP.prjid[i]
		   ,tlv_UP.prjnum[i]
		   ,tlv_UP.prjtitle[i]
		   ,tlv_UP.prjfiscyear[i]
		   ,tlv_UP.prgragency[i]
		   ,tlv_UP.prgragencyid[i]
		   ,tlv_UP.npaofficerid[i]
		   ,tlv_UP.npaofficername[i]
		   ,tlv_UP.evdb_presence[i]
		   ,tlv_UP.strgoalid[i]
		   ,tlv_UP.strgoalname[i]
		   ,tlv_UP.prjstatus[i]
		)
	}
//******************************************************************************	
	arrayTemp = new Array();
//******************************************************************************
	//-- Q means Question
	
	<cfwddx action="CFML2JS" input="#spr_Questions#" toplevelvariable="tlv_Q">

	var rowsQ = tlv_Q.getRowCount();
	//alert(rowsQ)
	function holdQ (aIDs, aDescr, aSuperID)
					{
						this.aIDs = aIDs;
						this.aDescr = aDescr;
						this.aSuperID = aSuperID;
					}
	
	arrayQ = new Array();
	for (var i=0; i<rowsQ; i++)
	{
		arrayQ[i] = new holdQ 
							(
								tlv_Q.ids[i]
							   ,tlv_Q.descr[i]
							   ,tlv_Q.superid[i]
							);
	}
	//alert(rowsQ)
//******************************************************************************
/*
	<cfwddx action="CFML2JS" input="#spr_PrjPrgrAgents#" toplevelvariable="tlv_PPA">
	
	var rowsPPA = tlv_PPA.getRowCount();
	alert(rowsPPA)
	function holdPPA (aPersonID, aPersonFullName, aPersonOrgID)
					{
						this.aPersonID       = aPersonID;
						this.aPersonFullName = aPersonFullName;
						this.aPersonOrgID    = aPersonOrgID;
					}
	
	arrayPPA = new Array();
	
	for (var i=0; i<rowsPPA; i++)
	{
		arrayPPA[i] = new holdPPA
							(
								tlv_PPA.personid[i]
							   ,tlv_PPA.personfullname[i]
							   ,tlv_PPA.personOrgid[i]
							);
	}
*/
//alert(arrayPPA.length)	
//******************************************************************************
	
	function of_Answers(argQuestID)
	{//alert(argQuestID)
		var vS = "";
		vS  = "<select name='s_A_'"+argQuestID+">";
		vS += "<option value=-1>-- Select your answer --</option>";
		vS += "<option value=1>1 - Bad problems (negative impact)</option>";
		vS += "<option value=2>2 - Some problems (less than satisfactory)</option>";
		vS += "<option value=3>3 - Satisfactory (met basic requirements)</option>";
		vS += "<option value=4>4 - More than satusfactory (positive effect)</option>";
		vS += "<option value=5>5 - Exceptional (very positive impact)</option>";
		vS += "<option value=6>N - Not applicable</option>";
		vS += "<option value=7>U - Unknown (not enough information)</option>";
		vS += "</select>";
		
		return vS;
	}
//******************************************************************************
	function onChEvalStat(argEvalStat){with(self.document.forms[0]){
		
		onChPrjNum(-1);
		
		var p = 0;
		arrayTemp.length = 0;
		if (argEvalStat == -1)
		{
			of_populateSelect("s_PrjNum", -1, "[-- No Projects Available for this status -----------------------]", 0, "", "", "", "1D");
			//alert("s_PrjNum")
		}
		else
		{
			for (var i=0; i<rowsUP; i++)
			{
				if (arrayUP[i].aPrjStatus == argEvalStat)
				{
					arrayTemp[p] = arrayUP[p].aPrjNum;
					p++;
				}
				
			}// end of for loop
		}// end of else
		
		if (arrayTemp.length >0)
		{
			arrayTemp.sort();
			of_populateSelect("s_PrjNum", -1, "[-- Select Project Number ------------------------------------------]", arrayTemp.length, "arrayTemp", "", "", "1D");
		}
		else
		{
			of_populateSelect("s_PrjNum", -1, "[-- No Projects Available for this status -----------------------]", 0, "", "", "", "1D");
		}
		
		
	}}// end of function
	
	
	
//******************************************************************************
	
	function onChPrjNum(argPrjNum){with(self.document.forms[0]){
	//alert(argPrjNum)
	var vSgoal, cSnpaOfficer;
		if (argPrjNum == -1)
		{
			of_innerHTML("idPrjNum",     	"''");
			of_innerHTML("idPrjTitle",   	"''");
			of_innerHTML("idPrjFiscYear",	"''");
			of_innerHTML("idPrgrAgency", 	"''");
			of_innerHTML("idNPAOfficer", 	"''");
			of_innerHTML("idStrGoalName", 	"''");
			of_innerHTML("idEVDB_Presence", "''");
		}
		else
		{
			for (var i=0; i<rowsUP;i++)
			{
				if (arrayUP[i].aPrjNum == argPrjNum)
				{
					//
					//----------------------------------------------------------
					if (arrayUP[i].aStrGoalName == "No Data Found")
					{
						vSgoal = of_buildSelect("strGoal");
					}
					else
					{
						vSgoal = arrayUP[i].aStrGoalName;
					}
					//
					//----------------------------------------------------------
					//
					if (arrayUP[i].aNPAOfficerID == 0 )
					{
						vSnpaOfficer = of_buildSelect("strNPAOfficer");
					}
					else
					{
						vSnpaOfficer = arrayUP[i].aNPAOfficerName;
					}
					//----------------------------------------------------------
					//
					of_innerHTML("idPrjNum",     	"'"+arrayUP[i].aPrjNum+"'");
					of_innerHTML("idPrjTitle",   	"'"+arrayUP[i].aPrjTitle+"'");
					of_innerHTML("idPrjFiscYear",	"'"+arrayUP[i].aPrjFiscYear+"'");
					of_innerHTML("idPrgrAgency", 	"'"+arrayUP[i].aPrgrAgency+"'");
					
					of_innerHTML("idNPAOfficer", 	"'"+vSnpaOfficer+"'");
					
					of_innerHTML("idStrGoalName", 	"'"+vSgoal+"'");
					//of_innerHTML("idStrGoalName", "'"+arrayUP[i].aStrGoalName+"'");
					of_innerHTML("idEVDB_Presence", "'"+arrayUP[i].aEVDB_Presence+"'");
				}
				
			}
		}
	
	}}//end of with and function
//******************************************************************************
	function of_buildSelect(argCtrlName)with(self.document.forms[0])
	{//alert(argCtrlName)
		var vS = "";
		if (argCtrlName == "strGoal")
		{
			
			vS += "<select name=\"s_StrGoals\">";
			vS += "<option value=-1>[----- Select Strategic Goal -------------]</option>";
			vS += "<cfoutput query='spr_StrategicGoals'>";
			vS += "<option value=\"#strategic_goal_id#\">#strategic_goal_nm#</option>";
			vS += "</cfoutput>";
			vS += "</select>";
		}
		else if (argCtrlName == "strNPAOfficer")
		{
			//------------------------------------------------------------------
			//
			vS += "<select name=\"s_StrGoals\">";
			vS += "<option value=-1>[----- Select Strategic Goal -------------]</option>";
			vS += "<cfoutput query='spr_StrategicGoals'>";
			vS += "<option value=\"#strategic_goal_id#\">#strategic_goal_nm#</option>";
			vS += "</cfoutput>";
			vS += "</select>";
			
			
			//vS = s_PrjNum.options[s_PrjNum.options.selectedIndex].value;
			//alert(vS)
			/*
			for ( var i=0; i<rowsUP; i++ )
			{
				if (vS == arrayUP[i].aPrjNum)
				{
					vS = arrayUP[i].aPrgrAgencyID;
					break;
				}
			}
			//
			//
			var ii = 0;
			arrayTemp.length = 0;
			for (var i=0; i<rowsPPA; i++)
			{
				if(vS == arrayPPA[i].aPersonOrgID)
				{
					arrayTemp[ii] = new holdPPA
									{
										arrayPPA[i].aPersonID;
										arrayPPA[i].aPersonFullName;
										arrayPPA[i].aPersonOrgID;
									}
					ii++;
				}
			}
			*/
			//
			//
			//arrayTemp.sort(of_arraySort);
			//
			//
			//vS = "<select name='s_PPA_Officer'>";
			//vS += "</select>";
			//
			//of_populateSelect("s_PPA_Officer", -1, "[----- Select NPA Officer ---------------]", arrayTemp.length, "arrayTemp", 
			//				  "aPersonID", "aPersonFullName", "2D");
			
			//
			//
			//------ HERE
			//
			//
			//------------------------------------------------------------------
		}
		
		return vS;
	}
//******************************************************************************
	/*
	function of_arraySort(a,b)
	{
		a = a.aPersonFullName.toLowerCase();
		b = b.aPersonFullName.toLowerCase();
		return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );
	}
	*/
//******************************************************************************
	function Validate(){with(self.document.forms[0])
	{//alert(s_StrGoals.options[s_StrGoals.options.selectedIndex].value)
		//-- Validation 1 --
		vTemp = s_PrjNum.options[s_PrjNum.options.selectedIndex].value;
		if (vTemp == -1)
		{
			alert("Project was not selected or changed.\nNo new information will be saved.");
		}
		else
		{
			for (var i=0; i<rowsUP; i++)
			{
				if (vTemp == arrayUP[i].aPrjNum)
				{
					vTemp = arrayUP[i].aStrGoalID;
					//alert(vTemp)
					break;
				}
			}
			
			if (vTemp == 0)
			{
				vTemp = s_StrGoals.options[s_StrGoals.options.selectedIndex].value;
				//alert(vTemp)
				if (vTemp == -1)
				{
					alert("Please select Stratigic Goal.")
					s_StrGoals.options.focus();
				}
				else
				{//alert() of_Submit("SaveEval");
					//----------------------------------------------------------
					{alert("INFORMATION WILL BE SAVED")
	 					//action = "_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=InsUpdUserPrjEval";
	 					//submit();
					}
					//----------------------------------------------------------
				}
			}
			
		}
		//if ()
	}}
//******************************************************************************
}
</script>
<!--- --------------------------------------------------------------------- --->
<table cellpadding="2" cellspacing="2" ><!---  border="1"  --->
<tr >
	<td width="50%" class="textFormTitle">
	<cfif #strUser.UserPrjCounter# EQ 0>
		&nbsp;
	<cfelse>
		Evaluation Status:<br>
		<select name="s_EvalStat" onChange="onChEvalStat(this.value);">
			<option value="All_ALL">[---------- Select Evaluation Status --------------------------------]</option>
			<option value="E">Evaluated</option>
			<option value="PE">Partially Evaluated</option>
			<option value="NE">Not Evaluated</option> 
		</select>
	</cfif>
	</td>
	<td rowspan="2">
		<table class="txtInfo" ><!--- border="1"  --->
		<tr>
			<td width="50%">Total Number of projects:</td>
			<td width="5%" align="right"><cfoutput>#strUser.UserPrjCounter#</cfoutput>;</td>
			<td width="45%">&nbsp;</td>
		</tr>
		<tr>
			<td>Evaluated:</td>
			<td align="right"><cfoutput>#strUser.UserPrjCounter_E#</cfoutput>;</td>
			<td width="45%">&nbsp;</td>
		</tr>
		<tr>
			<td>Partially Evaluated:</td>
			<td align="right"><cfoutput>#strUser.UserPrjCounter_PE#</cfoutput>;</td>
			<td width="45%">&nbsp;</td>
		</tr>
		<tr>
			<td>Not Evaluated:</td>
			<td align="right"><cfoutput>#strUser.UserPrjCounter_NE#</cfoutput>.</td>
			<td width="45%">&nbsp;</td>
		</tr>
		</table>
	</td>
</tr>
<!--- <tr><td>&nbsp;</td><td>&nbsp;</td></tr> --->
<tr>
	<td  class="textFormTitle">
	<cfif #strUser.UserPrjCounter# EQ 0>
		&nbsp;
	<cfelse>
		Project List:
		<select name="s_PrjNum" onchange="onChPrjNum(this.value)" style="width: 350px;" ></select>
	</cfif>
	</td>
</tr>
<tr>
	<td align="right">&nbsp;</td>
	<td align="center">
	<cfif #strUser.UserPrjCounter# EQ 0>
		&nbsp;
	<cfelse>
		<input type="Button" class="" name="cb_SaveEval" value="Save Evaluation" title="Save Evaluation" onclick="Validate(); ">
	</cfif><!--- of_Submit('SaveEval') --->
	</td>
</tr>
</table>
<!--- --------------------------------------------------------------------- --->
<table align="center" cellspacing="2" cellpadding="2" ><!--- border="1"  --->
<tr><td colspan="3"><hr></td></tr>
<tr>
	<td colspan="3">
		<table cellspacing="2" cellpadding="2"  ><!--- border="1" --->
		<tr>
		    <td class="txtOutputTitle">Project Number:</td>
		    <td><span id="idPrjNum" class="txtOutputData"></span></td>
		</tr>
		<tr>
		    <td class="txtOutputTitle">Project Title:</td>
		    <td><span id="idPrjTitle" class="txtOutputData"></span></td>
		</tr>
		<tr>
		    <td class="txtOutputTitle">Fiscal Year:</td>
		    <td><span id="idPrjFiscYear" class="txtOutputData"></span></td>
		</tr>
		<tr>
		    <td class="txtOutputTitle">Program Agency:</td>
		    <td><span id="idPrgrAgency" class="txtOutputData"></span></td>
		</tr>
		<tr>
		    <td class="txtOutputTitle">NPA Officer:</td>
		    <td><span id="idNPAOfficer" class="txtOutputData"></span></td>
		</tr>
		<tr>
		    <td class="txtOutputTitle">Stratigic Goal:</td>
		    <td><span id="idStrGoalName" class="txtOutputData"></span></td>
		</tr>
		<tr>
		    <td class="txtOutputTitle">IEMS:</td>
		    <td><span id="idEVDB_Presence" class="txtOutputData"></span></td>
		</tr>
		</table>
	</td>
</tr>
</table>
<script language="JavaScript">
	//-- 1 ---------------------------------------------------------------------
	
	
	onChEvalStat(-1);
	//-- 2 ---------------------------------------------------------------------
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
	vTemp += "<tr><td colspan=3 class='textQTitle'>Comments</td></tr>";
	vTemp += "<tr><td colspan=3><textarea name='txta_Comments' rows=10 cols=92  onfocus=this.value='';>Please provide your comments ...</textarea></td></tr>";
	vTemp += "</table>";
	
	document.write(vTemp);
	//--------------------------------------------------------------------------
	
</script>
