<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--- popupPrintPreview.cfm --->
<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>

<cfquery name="spr_Questions" datasource="#client.DSN#">
	select ids, descr, superid 
     from eval_questions
     order by ids
</cfquery>

<!--- 
<cfoutput>#URL.urlComments#</cfoutput><cfabort>  --->
<cfset local.Comments = #Replace(URL.urlComments,"'","\'", "ALL")#>

<script language="JavaScript">
arrayA = new Array();
//
var vAnswers = new String("<cfoutput>#urlAnswers#</cfoutput>"+",");
//
of_browserSelection();
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function buildTblQuestions(){with(self.document.forms[0]){
	var vQuestCounter = 0;
	var vTemp = "<table align=\"center\" cellspacing=2 cellpadding=2  width=\"760\" border=0>"; 
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
					vQuestCounter++;
					vTemp += "<tr>";
					//vTemp += "<td>"+parseInt(i+1)+"-"+ii+"</td>";
					vTemp += "<td width=\"1%\">-</td>"
					vTemp += "<td width=\"60%\" class=\"textPlain\">"+arrayQ[ii].aDescr+"</td>";
					vTemp += "<td width=\"39%\" class=\"txtTableCell\" id=\"idQ_\""+vQuestCounter+">"+ /*"idQ_"+vQuestCounter*/ arrayAnswers(setAnswersForPrint(vQuestCounter)) +"</td>";
					vTemp += "</tr>";
				
					
				}
			}
			vTemp += "<tr><td colspan=3><hr></td></tr>";		
		}
	}
	//
	//
	vTemp += "<tr><td colspan=3 class='textQTitle'>Comments</td></tr>";
	vTemp += "<tr><td colspan=3>"+"<cfoutput>#local.Comments#</cfoutput>"+"</td></tr>";
	//
	vTemp += "<tr><td colspan=3>&nbsp;</td></tr>";
	//
	vTemp += "</table>";
	//
	//
	vTemp += "</table>";
	//
	document.write(vTemp);
}}//end of fumction buildTblQuestions()
//------------------------------------------------------------------------------
//

</script>
        

<html>
<head>
	<title>Selected Project Prinr Preview</title>
</head>

<body>
<table align="center" cellspacing="2" cellpadding="2" border="0">
<tr>
	<td>&nbsp;</td>
	
	<td id="tdAppName"><img src="Img/AppLogo.jpg" width="760" height="93" alt="" border="0"  title="CheckList"></td>
	
	<td>&nbsp;</td>
<tr>
	<td>&nbsp;</td>
	<td id="tdMenu">
		&nbsp;&nbsp;<font color="Navy">|</font>&nbsp;&nbsp;
		<a href="JavaScript: printWindow();">Print</a>
		&nbsp;&nbsp;<font color="Navy">|</font>&nbsp;&nbsp;
		<a href="JavaScript: window.close();">Close</a>&nbsp;&nbsp;
		
	</td>
	<td>&nbsp;</td>
</tr>
</tr>
	<td>&nbsp;</td>
	<td>
<form name="f_PrintPreview" method="post">
<!--- 
<cfoutput>

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

#URL.urlPrjTotal#<br>
#URL.urlPrjActive#<br>
#URL.urlPrjClosed#<br>
#URL.urlPrjCompleted#<br>
#URL.urlPrjCLO_COM#<br>
#URL.urlPrjNE#<br>
#URL.urlPrjPE#<br>
#URL.urlPrjE#<br>
#URL.urlPerOfEval#<br>
#URL.urlPrjNum#<br>
#URL.urlPrjTitle#<br>
#URL.urlPrjFiscYear#<br>
#URL.urlPrgrAgency#<br>
#URL.urlNPAOfficer#<br>
#URL.urlStrGoalName#<br>
#URL.urlCurrentStatus#<br>
#URL.urlEVDB_Presence#<br>
#URL.urlComments#<br>
</cfoutput>
 --->
<cfoutput> 

<table cellspacing="4" cellpadding="1" border="0">
<tr><td colspan="8"><hr color="##800000" noshade></td></tr>
<tr><td colspan="8" class="textFormTitle">SUMMARY OF PROJECT EVALUATION</td></tr>
<tr>
    <td colspan="8"><hr color="##800000" noshade></td>
</tr>
<tr>
    <td rowspan="3" align="center" class="txtTableHeader" width="14%"><br>Current Status</td>
    <td rowspan="3" align="center" class="txtTableHeader" width="20%"><br>Evaluation Status</td>
    <td colspan="2" align="center" class="txtTableHeader"  width="22%">Fiscal Year</td>
    <td colspan="2" align="center" class="txtTableHeader"   width="22%">Fiscal Year</td>
    <td rowspan="3" colspan="2" align="center" class="txtTableHeader" width="22%"><br>Total</td>
</tr>
<tr>
    <td colspan="2"><hr color="##800000" noshade></td>
	<td colspan="2"><hr color="##800000" noshade></td>
</tr>
<tr>
    <td colspan="2" align="center" class="txtTableHeader"><span id="idPrevFiscalYear">#URL.urlPrevFiscalYear#</span></td>
    <td colspan="2" align="center" class="txtTableHeader"><span id="idCurrFiscalYear">#URL.urlCurrFiscalYear#</span></td>
</tr>
<tr>
    <td colspan="8"><hr color="##800000" noshade></td>
</tr>


<tr>
    <td rowspan="3" class="txtTableHeader">Active</td>
    <td class="txtTableHeader">Not Evaluated</td>
    <td class="txtTableCell" align="center" width="11%"><span id="idActNE_PrevFiscYear">#URL.urlActNE_PrevFiscYear#</span></td>
	<td class="txtTableCell" align="center" width="11%">&nbsp;</td>
    <td class="txtTableCell" align="center" width="11%"><span id="idActNE_CurrFiscYear">#URL.urlActNE_CurrFiscYear#</span></td>
    <td class="txtTableCell" align="center" width="11%">&nbsp;</td>
    <td class="txtTableCell" align="center" width="11%"><span id="idActNE_Total">idActNE_Total</span></td>
    <td class="txtTableCell" align="center" width="11%">&nbsp;</td>
	
</tr>
<tr>
    <td class="txtTableHeader">Partially Evaluated</td>
    <td class="txtTableCell" align="center"><span id="idActPE_PrevFiscYear">#URL.urlActPE_PrevFiscYear#</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
    <td class="txtTableCell" align="center"><span id="idActPE_CurrFiscYear">#URL.urlActPE_CurrFiscYear#</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
    <td class="txtTableCell" align="center"><span id="idActPE_Total">idActPE_Total</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="txtTableHeader">Evaluated</td>
    <td class="txtTableCell" align="center"><span id="idActE_PrevFiscYear">#URL.urlActE_PrevFiscYear#</span></td>
    <td class="txtTableCell" align="center"><span id="idActE_PrevFiscYearPercent">(#URL.urlActE_PrevFiscYearPercent#%)</span></td>
    <td class="txtTableCell" align="center"><span id="idActE_CurrFiscYear">#URL.urlActE_CurrFiscYear#</span></td>
    <td class="txtTableCell" align="center"><span id="idActE_CurrFiscYearPercent">(#URL.urlActE_CurrFiscYearPercent#%)</span></td>
    <td class="txtTableCell" align="center"><span id="idActE_Total">idActE_Total</span></td>
    <td class="txtTableCell" align="center"><span id="idActE_TotalPercent">(#URL.urlActE_TotalPercent#%)</span></td>
</tr>
<tr>
    <td colspan="8"><hr color="##800000" noshade></td>
</tr>

<tr>
    <td rowspan="3" class="txtTableHeader">Closed</td>
    <td class="txtTableHeader">Not Evaluated</td>
    <td class="txtTableCell" align="center"><span id="idCloNE_PrevFiscYear">#URL.urlCloNE_PrevFiscYear#</span></td>
	<td class="txtTableCell" align="center"><span id="">&nbsp;</span></td>
    <td class="txtTableCell" align="center"><span id="idCloNE_CurrFiscYear">#URL.urlCloNE_CurrFiscYear#</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
    <td class="txtTableCell" align="center"><span id="idCloNE_Total">idCloNE_Total</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="txtTableHeader">Partially Evaluated</td>
    <td class="txtTableCell" align="center"><span id="idCloPE_PrevFiscYear">#URL.urlCloPE_PrevFiscYear#</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
    <td class="txtTableCell" align="center"><span id="idCloPE_CurrFiscYear">#URL.urlCloPE_CurrFiscYear#</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
    <td class="txtTableCell" align="center"><span id="idCloPE_Total">idCloPE_Total</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="txtTableHeader">Evaluated</td>
    <td class="txtTableCell" align="center"><span id="idCloE_PrevFiscYear">#URL.urlCloE_PrevFiscYear#</span></td>
    <td class="txtTableCell" align="center"><span id="idCloE_PrevFiscYearPercent">(#urlCloE_PrevFiscYearPercent#%)</span></td>
    <td class="txtTableCell" align="center"><span id="idCloE_CurrFiscYear">#URL.urlCloE_CurrFiscYear#</span></td>
    <td class="txtTableCell" align="center"><span id="idCloE_CurrFiscYearPercent">(#URL.urlCloE_PrevFiscYearPercent#%)</span></td>
    <td class="txtTableCell" align="center"><span id="idCloE_Total">#URL.urlCloE_TotalPercent#</span></td>
    <td class="txtTableCell" align="center"><span id="idCloE_TotalPercent">(#URL.urlCloE_TotalPercent#%)</span></td>
</tr>
<tr>
    <td colspan="8"><hr color="##800000" noshade></td>
</tr>
<tr>
    <td rowspan="3" class="txtTableHeader">Completed</td>
    <td class="txtTableHeader">Not Evaluated</td>
    <td class="txtTableCell" align="center"><span id="idComNE_PrevFiscYear">#URL.urlComNE_PrevFiscYear#</span></td>
	<td class="txtTableCell" align="center"><span id="">&nbsp;</span></td>
    <td class="txtTableCell" align="center"><span id="idComNE_CurrFiscYear">#URL.urlComNE_CurrFiscYear#</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
    <td class="txtTableCell" align="center"><span id="idComNE_Total">idComNE_Total</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="txtTableHeader">Partially Evaluated</td>
    <td class="txtTableCell" align="center"><span id="idComPE_PrevFiscYear">#URL.urlComPE_PrevFiscYear#</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
    <td class="txtTableCell" align="center"><span id="idComPE_CurrFiscYear">#URL.urlComPE_CurrFiscYear#</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
    <td class="txtTableCell" align="center"><span id="idComPE_Total">idComPE_Total</span></td>
    <td class="txtTableCell" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="txtTableHeader">Evaluated</td>
    <td class="txtTableCell" align="center"><span id="idComE_PrevFiscYear">#URL.urlComE_PrevFiscYear#</span></td>
    <td class="txtTableCell" align="center"><span id="idComE_PrevFiscYearPercent">(#URL.urlComE_PrevFiscYearPercent#%)</span></td>
    <td class="txtTableCell" align="center"><span id="idComE_CurrFiscYear">#URL.urlComE_CurrFiscYear#</span></td>
    <td class="txtTableCell" align="center"><span id="idComE_CurrFiscYearPercent">(#URL.urlComE_CurrFiscYearPercent#%)</span></td>
    <td class="txtTableCell" align="center"><span id="idComE_Total">idComE_Total</span></td>
    <td class="txtTableCell" align="center"><span id="idComE_TotalPercent">(#URL.urlComE_TotalPercent#%)</span></td>
</tr>
<tr>
    <td colspan="8"><hr color="##800000" noshade></td>
</tr>
<tr>
    <!--- <td class="txtTableCell" align="center">&nbsp;</td> --->
    <td class="txtTableHeader" align="right" colspan="2">TOTAL:</td>
    <td class="txtTableCell" align="center"><span id="idTotalPrjPrevFiscalYear">#URL.urlTotalPrjPrevFiscalYear#</span></td>
    <td class="txtTableCell" align="center"><span id="">&nbsp;</span></td>
    <td class="txtTableCell" align="center"><span id="idTotalPrjCurrFiscalYear">#URL.urlTotalPrjCurrFiscalYear#</span></td>
    <td class="txtTableCell" align="center"><span id="">&nbsp;</span></td>
    <td class="txtTableCell" align="center"><span id="idTotal">#URL.urlTotal#</span></td>
    <td class="txtTableCell" align="center"><span id="">&nbsp;</span></td>
</tr>
<tr><td colspan="8"><hr color="##800000" noshade></td></tr>
<tr><td colspan="8">&nbsp;</td></tr>
</table>




<table width="760px" border="0">
	<tr>
		<td width="49%">&nbsp;
			<table cellspacing="1" cellpadding="1" border="0">
			<tr>
			    <td class="txtOutputTitlePrint">Project Number:</td>
			    <td><span id="idPrjNum" class="txtOutputDataPrint">#URL.urlPrjNum#</span></td>
			</tr>
			<tr>
			    <td class="txtOutputTitlePrint">Project Title:</td>
			    <td><span id="idPrjTitle" class="txtOutputDataPrint">#URL.urlPrjTitle#</span></td>
			</tr>
			<tr>
			    <td class="txtOutputTitlePrint">Fiscal Year:</td>
			    <td><span id="idPrjFiscYear" class="txtOutputDataPrint">#URL.urlPrjFiscYear#</span></td>
			</tr>
			<tr>
			    <td class="txtOutputTitlePrint">Program Agency:</td>
			    <td><span id="idPrgrAgency" class="txtOutputDataPrint">#URL.urlPrgrAgency#</span></td>
			</tr>
			<tr>
			    <td class="txtOutputTitlePrint">NPA Program Officer:</td>
			    <td><span id="idNPAOfficer" class="txtOutputDataPrint">#URL.urlNPAOfficer#</span></td>
			</tr>
			<tr>
			    <td class="txtOutputTitlePrint">Strategic Goal:</td>
			    <td><span id="idStrGoalName" class="txtOutputDataPrint">#URL.urlStrGoalName#</span></td>
			</tr>
			<tr>
			    <td class="txtOutputTitlePrint">Current Status:</td>
			    <td><span id="idCurrentStatus" class="txtOutputDataPrint">#URL.urlCurrentStatus#</span></td>
			</tr>
			<tr>
			    <td class="txtOutputTitlePrint">IEMS:</td>
			    <td><span id="idEVDB_Presence" class="txtOutputDataPrint">#URL.urlEVDB_Presence#</span></td>
			</tr>
			</table>
		</td>
		<td width="2%">&nbsp;</td>
		<td width="49%">&nbsp;
			<!--- 
			
			 --->
		</td>
		
	</tr>
	<!--- <tr><td colspan="3"><hr></td></tr> --->
</table>
</cfoutput>
 <br>
 
<!---  <cfoutput>#urlAnswers#</cfoutput> --->
 
</body>
<script language="JavaScript">
//------------------------------------------------------------------------------
buildTblQuestions();
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
var vActNE_Total = parseInt(parseInt(<cfoutput>#URL.urlActNE_PrevFiscYear#</cfoutput>)+parseInt(<cfoutput>#URL.urlActNE_CurrFiscYear#</cfoutput>));
of_innerHTML("idActNE_Total", "'"+vActNE_Total+"'");
//
var vActPE_Total = parseInt(parseInt(<cfoutput>#URL.urlActPE_PrevFiscYear#</cfoutput>)+parseInt(<cfoutput>#URL.urlActPE_CurrFiscYear#</cfoutput>));
of_innerHTML("idActPE_Total", "'"+vActPE_Total+"'");
// 
var vActE_Total = parseInt(parseInt(<cfoutput>#URL.urlActE_PrevFiscYear#</cfoutput>)+parseInt(<cfoutput>#URL.urlActE_CurrFiscYear#</cfoutput>));
of_innerHTML("idActE_Total", "'"+vActE_Total+"'");
//
var vCloNE_Total = parseInt(parseInt(<cfoutput>#URL.urlCloNE_PrevFiscYear#</cfoutput>)+parseInt(<cfoutput>#URL.urlCloNE_CurrFiscYear#</cfoutput>));
of_innerHTML("idCloNE_Total", "'"+vCloNE_Total+"'");
//
var vCloPE_Total = parseInt(parseInt(<cfoutput>#URL.urlCloPE_PrevFiscYear#</cfoutput>)+parseInt(<cfoutput>#URL.urlCloPE_CurrFiscYear#</cfoutput>));
of_innerHTML("idCloPE_Total", "'"+vCloPE_Total+"'");
//
var vComNE_Total = parseInt(parseInt(<cfoutput>#URL.urlComNE_PrevFiscYear#</cfoutput>)+parseInt(<cfoutput>#URL.urlComNE_CurrFiscYear#</cfoutput>));
of_innerHTML("idComNE_Total", "'"+vComNE_Total+"'");
//
var vComPE_Total = parseInt(parseInt(<cfoutput>#URL.urlComPE_PrevFiscYear#</cfoutput>)+parseInt(<cfoutput>#URL.urlComPE_CurrFiscYear#</cfoutput>));
of_innerHTML("idComPE_Total", "'"+vComPE_Total+"'");
//
var vComE_Total = parseInt(parseInt(<cfoutput>#URL.urlComE_PrevFiscYear#</cfoutput>)+parseInt(<cfoutput>#URL.urlComE_CurrFiscYear#</cfoutput>));
of_innerHTML("idComE_Total", "'"+vComE_Total+"'");
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function setAnswersForPrint(argQuestNum){with(self.document.forms[0]){//alert(vAnswers)
		
	var vAnswersTemp;
	var vComaPos = vAnswers.indexOf(",");
	
	vAnswersTemp = vAnswers.substr(0,vComaPos);
	
	vAnswers = vAnswers.substr(vComaPos+1,  vAnswers.length)
	
	return vAnswersTemp;
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function arrayAnswers(argAnswerValue){

	if (argAnswerValue == -1){argAnswerValue = 0}
	
	arrayA[0] = "NO ANSWER SELECTED";
	arrayA[1] = "1 - Bad problems (negative impact)";
	arrayA[2] = "2 - Some problems (less than satisfactory)";
	arrayA[3] = "3 - Satisfactory (met basic requirements)";
	arrayA[4] = "4 - More than satisfactory (positive effect)";
	arrayA[5] = "5 - Exceptional (very positive impact)";
	arrayA[6] = "N - Not applicable";
	arrayA[7] = "U - Unknown (not enough information)";
	
	return arrayA[argAnswerValue];
}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function printWindow(){with(self.document.forms[0]){
	var vMenu = "";
	of_innerHTML("tdMenu", "'"+vMenu+"'");
	window.print();
	var vMenu = "&nbsp;&nbsp;<font color=\"Navy\">|</font>&nbsp;&nbsp;";
	vMenu += "<a href=\"JavaScript: printWindow();\">Print</a>";
	vMenu += "&nbsp;&nbsp;<font color=\"Navy\">|</font>&nbsp;&nbsp;";
	vMenu += "<a href=\"JavaScript: window.close();\">Close</a>&nbsp;&nbsp;";
	of_innerHTML("tdMenu", "'"+vMenu+"'");
	
}}
//------------------------------------------------------------------------------

</script>
</form>
</td>
<td>&nbsp;</td>
</table>
</html>
