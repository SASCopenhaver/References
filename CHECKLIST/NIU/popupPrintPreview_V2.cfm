<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--- popupPrintPreview.cfm --->
<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>

<cfquery name="spr_Questions" datasource="#client.DSN#">
	select ids, descr, superid 
     from phonebook.eval_questions
     order by ids
</cfquery>

<cfset local.Comments = #Replace(URL.urlComments,"'","\'", "ALL")#>

<script language="JavaScript">
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
	var vTemp = "<table align=\"center\" cellspacing=2 cellpadding=2  width=\"760\">"; //border=1
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
					vTemp += "<td class=\"textPlain\">"+arrayQ[ii].aDescr+"</td>";
					vTemp += "<td id=\"idQ_\""+vQuestCounter+">"+ /*"idQ_"+vQuestCounter*/ setAnswersForPrint(vQuestCounter) +"</td>";
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
		<td width="49%">
			<table class="txtInfo" border="0">
			<tr>
				<td width="70%">Total Number of projects:</td>
				<td width="15%" align="right"><span id="idPrjTotal">#URL.urlPrjTotal#</span></td>
				<td width="15%">&nbsp;</td>
			</tr>
			<tr><td><hr></td><td>&nbsp;</td><td>&nbsp;</td></tr>
			<tr>
				<td>Active:</td>
				<td align="right"><span id="idPrjActive">#URL.urlPrjActive#</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Closed:</td>
				<td align="right"><span id="idPrjClosed">#URL.urlPrjClosed#</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Completed:</td>
				<td align="right"><span id="idPrjCompleted">#URL.urlPrjCompleted#</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="3"><hr></td></tr>
			<!--- <tr><td colspan="3"><hr style=""></td></tr> --->
			<tr>
				<td>Number of Closed and Completed Only:</td>
				<td align="right"><span id="idPrj_CLO_COM">#URL.urlPrjCLO_COM#</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr><td><hr></td><td>&nbsp;</td><td>&nbsp;</td></tr>
			<tr><td>Among CLOSED and COMPLETED:</td><td>&nbsp;</td><td>&nbsp;</td></tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Not Evaluated:</td>
				<td align="right"><span id="idPrjNE">#URL.urlPrjNE#</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Partially Evaluated:</td>
				<td align="right"><span id="idPrjPE">#URL.urlPrjPE#</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Evaluated:</td>
				<td align="right"><span id="idPrjE">#URL.urlPrjE#</span></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;Percent of Evaluated:</td>
				<td align="right"><span id="idPerOfEval">#URL.urlPerOfEval#%</span>%</td>
				<td>&nbsp;</td>
			</tr>
			
			</table>
		
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
