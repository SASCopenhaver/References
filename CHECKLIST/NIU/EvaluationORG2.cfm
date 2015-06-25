<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_populateSelect.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>
<script src="JS/showMsg.js" type="text/javascript"></script>

<cfwddx action="WDDX2CFML" input="#client.sprWDDX_getUserProjects#" output="spr_getUserProjects">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_StrategicGoals#"  output="spr_StrategicGoals">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_Questions#"       output="spr_Questions">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_PrjPrgrAgents#"   output="spr_PrjPrgrAgents">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_getAnswers#"      output="spr_getAnswers">

<!---<cfoutput>#spr_Questions.recordCount#</cfoutput><cfabort> --->

<script language="JavaScript">
var pageStatus = "Loading";
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

	<cfwddx action="CFML2JS" input="#spr_PrjPrgrAgents#" toplevelvariable="tlv_PPA">
	
	var rowsPPA = tlv_PPA.getRowCount();
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
							   ,tlv_PPA.personorgid[i]
							);
	}
//******************************************************************************
	<cfwddx action="CFML2JS" input="#spr_getAnswers#" toplevelvariable="tlv_A">
	var rowsA = tlv_A.getRowCount();
	
	function holdA ( aUserID, aPrjID, 
					 aQ_101, aQ_102, aQ_103, aQ_104, aQ_105, aQ_106, aQ_107, aQ_108, aQ_109, 
					 aQ_110, aQ_111, aQ_112, aQ_113, aQ_114, aQ_115, aQ_116, aQ_117, aQ_118, 
					 aQ_119, aQ_120, aQ_121, aQ_122, aQ_123, aQ_124, aQ_125, aQ_126, aQ_127,
					 aStatus )
	{
		this.aUserID = aUserID;	this.aPrjID = aPrjID;
		this.aQ_101 = aQ_101;	this.aQ_102 = aQ_102;	this.aQ_103 = aQ_103;	this.aQ_104 = aQ_104;
		this.aQ_105 = aQ_105;	this.aQ_106 = aQ_106;	this.aQ_107 = aQ_107;	this.aQ_108 = aQ_108;
		this.aQ_109 = aQ_109;	this.aQ_110 = aQ_110;	this.aQ_111 = aQ_111;	this.aQ_112 = aQ_112;
		this.aQ_113 = aQ_113;	this.aQ_114 = aQ_114;	this.aQ_115 = aQ_115;	this.aQ_116 = aQ_116;
		this.aQ_117 = aQ_117;	this.aQ_118 = aQ_118;	this.aQ_119 = aQ_119;	this.aQ_120 = aQ_120;	
		this.aQ_121 = aQ_121;	this.aQ_122 = aQ_122;	this.aQ_123 = aQ_123;	this.aQ_124 = aQ_124;
		this.aQ_125 = aQ_125;	this.aQ_126 = aQ_126;	this.aQ_127 = aQ_127;	
		this.aStatus = aStatus;
	}
	
	arrayA = new Array();
	
	for (var i=0; i<rowsA; i++)
	{
		arrayA[i] = new holdA(
			tlv_A.eval_userid[i],	tlv_A.eval_prjid[i],
			tlv_A.q_101[i],	tlv_A.q_102[i],	tlv_A.q_103[i],	tlv_A.q_104[i],	tlv_A.q_105[i],
			tlv_A.q_106[i],	tlv_A.q_107[i],	tlv_A.q_108[i],	tlv_A.q_109[i],	tlv_A.q_110[i],
			tlv_A.q_111[i],	tlv_A.q_112[i],	tlv_A.q_113[i],	tlv_A.q_114[i],	tlv_A.q_115[i],
			tlv_A.q_116[i],	tlv_A.q_117[i],	tlv_A.q_118[i],	tlv_A.q_119[i],	tlv_A.q_120[i],
			tlv_A.q_121[i],	tlv_A.q_122[i],	tlv_A.q_123[i],	tlv_A.q_124[i],	tlv_A.q_125[i],
			tlv_A.q_126[i],	tlv_A.q_127[i],
			tlv_A.eval_status[i]	
		);
	}
	//alert(arrayA.length)
	/*
	arrayA[parseInt(arrayA.length)] = new holdA(
	-1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
	-1, -1, -1, -1,-1, -1, -1, 
	-1);
	*/
	//alert(arrayA.length)
//******************************************************************************
	
	function of_Answers(argQuestID)
	{//alert(argQuestID)
		var vS = "";
		vTemp = "aQ_"+argQuestID;
		//alert(vTemp)
		//vS  = "<select name='aQ_'"+argQuestID+">";
		vS  = "<select name="+vTemp+">";
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
		//----------------------------------------------------------------------
		return vS;
	}

//******************************************************************************
	function onChEvalStat(argEvalStat){with(self.document.forms[0]){//alert("onChEvalStat   "+argEvalStat)
		if (argEvalStat == -1)
		{
			of_populateSelect("s_PrjNum", -1, "[-- No Projects Available for this status -----------------------]", 0, "", "", "", "1D");
		}
		else
		{
			var p = 0;
			arrayTemp.length = 0;
		
			for (var i=0; i<rowsUP; i++)//--------------------------------------
			{
				if (arrayUP[i].aPrjStatus == argEvalStat)
				{
					arrayTemp[p] = new holdUP (
						 arrayUP[i].aPrjID
						,arrayUP[i].aPrjNum
					);	
					p++;
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
			setAnswers(-1);
			//------------------------------------------------------------------
		}
		//
		//----------------------------------------------------------------------
		onChPrjNum(s_PrjNum.options[s_PrjNum.options.selectedIndex].value);
		//
		//----------------------------------------------------------------------
	}}// end of function

//******************************************************************************
/*
	function of_arraySortPrjNum(a,b)
	{
		a = a.aPrjNum.toUpperCase();
		b = b.aPrjNum.toUpperCase();
		return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );
	}
*/
//******************************************************************************

	function onChPrjNum(argPrjID){with(self.document.forms[0]){//alert("onChPrjNum   "+argPrjID)
		
		if (argPrjID == -1)
		{
			//
			//-- 1 -- Summary Information:
			of_innerHTML("idPrjNum",     	"''");
			of_innerHTML("idPrjTitle",   	"''");
			of_innerHTML("idPrjFiscYear",	"''");
			of_innerHTML("idPrgrAgency", 	"''");
			of_innerHTML("idNPAOfficer", 	"''");
			of_innerHTML("idStrGoalName", 	"''");
			of_innerHTML("idEVDB_Presence", "''");
		}
		else// when argPrjID is an actual Project ID 
		{
			//-- 1 -- Summary Information --
			for (var i=0; i<rowsUP; i++)
			{
				if (arrayUP[i].aPrjID == argPrjID)
				{
					//
					//-- 1a -- NPA Officer (Project Program Agency)
					vSnpaOfficer = arrayUP[i].aNPAOfficerName;
					if (arrayUP[i].aNPAOfficerID == 0)
					{
						vSnpaOfficer = of_buildSelect("strNPAOfficer");
					}
					//
					//----------------------------------------------------------
					//-- 1b -- Strategic Goal
					vSgoal = arrayUP[i].aStrGoalName;
					if (arrayUP[i].aStrGoalName == "No Data Found")
					{
						vSgoal = of_buildSelect("strGoal");
					}
					//	
					//----------------------------------------------------------
					of_innerHTML("idPrjNum",     	"'"+arrayUP[i].aPrjNum+"'");
					of_innerHTML("idPrjTitle",   	"'"+arrayUP[i].aPrjTitle+"'");
					of_innerHTML("idPrjFiscYear",	"'"+arrayUP[i].aPrjFiscYear+"'");
					of_innerHTML("idPrgrAgency", 	"'"+arrayUP[i].aPrgrAgency+"'");
					of_innerHTML("idNPAOfficer", 	"'"+vSnpaOfficer+"'");
					of_innerHTML("idStrGoalName", 	"'"+vSgoal+"'");
					of_innerHTML("idEVDB_Presence", "'"+arrayUP[i].aEVDB_Presence+"'");
					break;
				}
			}
			
			
		}
		//
		//----------------------------------------------------------------------
		if ( pageStatus == "LoadingFinished" )
		{
			setAnswers(s_PrjNum.options[s_PrjNum.options.selectedIndex].value);
		}
	
	}}
	

//******************************************************************************

	function setAnswers(argPrjID){with(self.document.forms[0]){//alert("setAnswers  "+argPrjID);
	
		if(argPrjID == -1)
		{
			for (var ii=101; ii<128; ii++ )
			{
				eval( "aQ_"+ii+".options["+0+"].selected = true"  );
			}
		}
	
		else
		{
		
			for (var i=0; i<arrayA.length; i++)
			{
				if (argPrjID == arrayA[i].aPrjID)
				{//alert(arrayA[i].aQ_105)
					var pos;
					for (var ii=101; ii<128; ii++ )
					{//alert(eval("arrayA["+i+"].aQ_"+ii))
						
						if (eval("arrayA["+i+"].aQ_"+ii) == -1) {pos = 0;}
						else { pos = eval("arrayA["+i+"].aQ_"+ii) }
						
						eval( "aQ_"+ii+".options["+pos+"].selected = true"  );
					}
				
					break;
				}
			}
		}
		//
		//----------------------------------------------------------------------
	
	}}
	
//******************************************************************************

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
			for ( var i=0; i<rowsUP; i++ )
			{
				if (vS == arrayUP[i].aPrjID)
				{
					vS = arrayUP[i].aPrgrAgencyID;
					break;
				}
			}
			//
			//
			var ii = -1;
			arrayTemp.length = 0;
			for (var i=0; i<rowsPPA; i++)
			{
				if(vS == arrayPPA[i].aPersonOrgID)
				{
					ii++;
					arrayTemp[ii] = new holdPPA
							(
								tlv_PPA.personid[i]
							   ,tlv_PPA.personfullname[i]
							   ,tlv_PPA.personorgid[i]
							);
				}
			}
			//
			vS = "<select name=\"s_PPA_Officer\" style=\"width: 350px;\">";
			vS += "<option value=-1>[---------- Select Program Agency Officer ---------------------]</option>";
			for (var i=0; i<arrayTemp.length; i++)
			{
				vS += "<option value="+arrayTemp[i].aPersonID+">"+arrayTemp[i].aPersonFullName+"</option>";
			}
			vS += "</select>";
			//------------------------------------------------------------------
		}
		
		return vS;
		
	}}
	
//******************************************************************************
	
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
		<select name="s_EvalStat" onChange="onChEvalStat(this.value);" style="width: 350px;">
			<option value="-1">[---------- Select Evaluation Status --------------------------------]</option>
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
		<select name="s_PrjNum" onchange="onChPrjNum(this.value)" style="width: 350px;" ></select><!--- --->
	</cfif>
	</td>
</tr>
<tr>
	<td align="right">&nbsp;</td>
	<td align="center">
	<cfif #strUser.UserPrjCounter# EQ 0>
		&nbsp;
	<cfelse>
		<input type="Button" class="" name="cb_SaveEval" value="Save Evaluation" title="Save Evaluation" ><!--- onclick="Validate(); " --->
	</cfif><!--- of_Submit('SaveEval') --->
	</td>
</tr>
</table>
<!--- --------------------------------------------------------------------- --->
<table align="center" cellspacing="2" cellpadding="2" ><!---  border="1" --->
<tr><td colspan="3"><hr></td></tr>
<tr>
	<td colspan="3">
		<table cellspacing="2" cellpadding="2"   ><!---border="1" --->
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
		    <td class="txtOutputTitle">Strategic Goal:</td>
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
	//
	//-- 1 ---------------------------------------------------------------------
	onChEvalStat(-1);
	//
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
	//
	//--------------------------------------------------------------------------
	vTemp += "<tr><td colspan=3 class='textQTitle'>Comments</td></tr>";
	vTemp += "<tr><td colspan=3><textarea name='txta_Comments' rows=10 cols=92  onfocus=this.value='';>Please provide your comments ...</textarea></td></tr>";
	vTemp += "</table>";
	//
	//--------------------------------------------------------------------------
	document.write(vTemp);
	//
	//--------------------------------------------------------------------------
	
	//
	//--------------------------------------------------------------------------
	pageStatus = "LoadingFinished";
</script>
