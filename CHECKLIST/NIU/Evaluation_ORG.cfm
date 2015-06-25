<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_populateSelect.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>

<cfwddx action="WDDX2CFML" input="#client.sprWDDX_PrjCheckList#"   output="spr_PrjCheckList">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_StrategicGoals#" output="spr_StrategicGoals">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_Questions#"      output="spr_Questions">

<script language="JavaScript">
of_browserSelection();
//******************************************************************************
<cfwddx action="CFML2JS" input="#spr_PrjCheckList#" toplevelvariable="tlv_PrjCheckList">

var rowsPrjCheckList = tlv_PrjCheckList.getRowCount();

function holdPrjCheckList (aPrjID, aPrjNum, aPrjTitle, aPrjFiscYear, aPrgrOffice,
						   aPrgrOfficer, aPrgrAgency, aNPAOfficer, aEVDB_Presence)
				{
					this.aPrjID = aPrjID;
					this.aPrjNum = aPrjNum;
					this.aPrjTitle = aPrjTitle;
					this.aPrjFiscYear = aPrjFiscYear;
					this.aPrgrOffice = aPrgrOffice;
					this.aPrgrOfficer = aPrgrOfficer;
					this.aPrgrAgency = aPrgrAgency;
					this.aNPAOfficer = aNPAOfficer;
					this.aEVDB_Presence = aEVDB_Presence;
					
				}

arrayPrjCheckList = new Array();
for (var i=0; i<rowsPrjCheckList; i++)
{
	arrayPrjCheckList[i] = new holdPrjCheckList 
	(
		tlv_PrjCheckList.prjid[i]
	   ,tlv_PrjCheckList.prjnum[i]
	   ,tlv_PrjCheckList.prjtitle[i]
	   ,tlv_PrjCheckList.prjfiscyear[i]
	   ,tlv_PrjCheckList.prgroffice[i]
	   ,tlv_PrjCheckList.prgrofficer[i]
	   ,tlv_PrjCheckList.prgragency[i]
	   ,tlv_PrjCheckList.npaofficer[i]
	   ,tlv_PrjCheckList.evdb_presence[i]
	)
}
//******************************************************************************
arrayPrjNum = new Array();
for (var i=0; i<rowsPrjCheckList; i++)
{
	arrayPrjNum[i] = arrayPrjCheckList[i].aPrjNum
}
arrayPrjNum.sort();
//******************************************************************************
<cfwddx action="CFML2JS" input="#spr_Questions#" toplevelvariable="tlv_Q">

var rowsQ = tlv_Q.getRowCount();

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
//******************************************************************************
function of_Answers(argQuestID)
{
	var vS = "";
	vS  = "<select>";
	/*
	vS += "<option value=\"-1\">-- Select your answer --</option>";
	vS += "<option value=1>bad problems/affected the overall program negatively</option>";
	vS += "<option value=2>some problems/less than satisfactory</option>";
	vS += "<option value=3>satisfactory/met basic requirements</option>";
	vS += "<option value=4>more than satusfactory/well done/affected the program positively</option>";
	vS += "<option value=5>exceptional/very positive impact on overall program/could be used as a model</option>";
	vS += "<option value=\"N\">indicates the element was not applicable in this project</option>";
	vS += "<option value=\"U\">indicates unknown, i.e., there was not enough information available on which to base a decision</option>";
	*/
	vS += "<option value=\"-1\">-- Select your answer --</option>";
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
function onChPrjNum(argPrjNum){with(self.document.forms[0]){
//alert(argPrjNum)
	for (var i=0; i<rowsPrjCheckList;i++)
	{
		if (arrayPrjCheckList[i].aPrjNum == argPrjNum)
		{
			of_innerHTML("idPrjNum",     	"'"+arrayPrjCheckList[i].aPrjNum+"'");
			of_innerHTML("idPrjTitle",   	"'"+arrayPrjCheckList[i].aPrjTitle+"'");
			of_innerHTML("idPrjFiscYear",	"'"+arrayPrjCheckList[i].aPrjFiscYear+"'");
			//of_innerHTML("idPrgrOffice", 	"'"+arrayPrjCheckList[i].aPrgrOffice+"'");
			//of_innerHTML("idPrgrOfficer",	"'"+arrayPrjCheckList[i].aPrgrOfficer+"'");
			of_innerHTML("idPrgrAgency", 	"'"+arrayPrjCheckList[i].aPrgrAgency+"'");
			of_innerHTML("idNPAOfficer", 	"'"+arrayPrjCheckList[i].aNPAOfficer+"'");
			of_innerHTML("idEVDB_Presence", "'"+arrayPrjCheckList[i].aEVDB_Presence+"'");
		}
	}

}}//end of with and function
//******************************************************************************
</script>
<!--- --------------------------------------------------------------------- --->
<table border="1">
<tr>
	<td>&nbsp;
		<select name="s_PrjSelector" onchange="onChPrjSelector(this.value);">
			<option value="All">All Available Projects</option>
			<option value="Eval_ASG">Evaluated&nbsp;&nbsp;----[All Strategic Goals)</option>
			<option value="PartEval_ASG">Partially Evaluated&nbsp;&nbsp;----[All Strategic Goals]</option>
			<option value="NotEval_ASG">Not Evaluated&nbsp;&nbsp;----[All Strategic Goals]</option> 
			<option value="Eval_SG">Evaluated&nbsp;&nbsp;----[Selected Strategic Goal]</option>
			<option value="PartEval_SG">Partially Evaluated&nbsp;&nbsp;----[Selected Strategic Goal]</option>
			<option value="NotEval_SG">Not Evaluated&nbsp;&nbsp;----[Selected Strategic Goal]</option> 
		</select>
	</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
	<td>&nbsp;</td>
</tr>
</table>


<!--- --------------------------------------------------------------------- --->
<table align="center" cellspacing="2" cellpadding="2" border="1"><!---   --->
<tr>
    <td width="33%">
		<select name="s_PrjNum" onchange="onChPrjNum(this.value)"></select>	
	</td>
    <td width="33%">
		<select name="s_StrGoals">
			<option value="-1">-- Select Strategic Goal --</option>
			<cfoutput query="spr_StrategicGoals">
			<option value="#strategic_goal_id#">#strategic_goal_nm#</option>
			</cfoutput>
		</select>	
	</td>
	<td width="33%" align="center">
		<input type="Submit" value="Get Answers"> 
	</td>
</tr>
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
		<!--- 
		<tr>
		    <td class="txtOutputTitle">Program Office:</td>
		    <td><span id="idPrgrOffice" class="txtOutputData"></span></td>
		</tr>
		<tr>
		    <td class="txtOutputTitle">DoS Officer:</td>
		    <td><span id="idPrgrOfficer" class="txtOutputData"></span></td>
		</tr>
		 --->
		<tr>
		    <td class="txtOutputTitle">Program Agency:</td>
		    <td><span id="idPrgrAgency" class="txtOutputData"></span></td>
		</tr>
		<tr>
		    <td class="txtOutputTitle">NPA Officer</td>
		    <td><span id="idNPAOfficer" class="txtOutputData"></span></td>
		</tr>
		<tr>
		    <td class="txtOutputTitle">IEMS</td>
		    <td><span id="idEVDB_Presence" class="txtOutputData"></span></td>
		</tr>
		</table>
	</td>
</tr>
</table>

<script language="JavaScript">
	//-- 1 ---------------------------------------------------------------------
	of_populateSelect("s_PrjNum", -1, "[-- Select Project Number --]", arrayPrjNum.length, "arrayPrjNum", "", "", "1D");
	//-- 2 ---------------------------------------------------------------------
	var vTemp = "<table align=\"center\" cellspacing=2 cellpadding=2"; 
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
					//vTemp += "<td>"+parseInt(i+1)+"_"+ii+"</td>";
					vTemp += "<td width=\"1%\">-</td>"
					vTemp += "<td class=\"textPlain\">"+arrayQ[ii].aDescr+"</td>";
					vTemp += "<td>"+of_Answers(arrayQ[ii].aIDs)+"</td>";
					vTemp += "</tr>";
				}
			}
			vTemp += "<td colspan=3><hr></td>";		
		}
	}
	vTemp += "</table>";
	
	document.write(vTemp);
	//--------------------------------------------------------------------------
	
</script>
