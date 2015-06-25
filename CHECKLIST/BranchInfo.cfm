<!--- BranchInfo.cfm --->
<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>
<script src="JS/of_Style.js" type="text/javascript"></script>
<!--- <cfoutput>#strUser.PersonID#</cfoutput><cfabort> ---> 
<cfstoredproc procedure="PACK_EVAL.sp_getBranchInfo" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getListOfBranches" maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getPrjsInOffice" maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_FiscalYears"  maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_DistinctListOfPOsInDoS"  maxrows="-1" variable="IgnoreThis">
	
	
	<cfprocresult name="spr_getListOfBranches" 		resultset="1">
	<cfprocresult name="spr_getPrjsInOffice" 		resultset="2">
	<cfprocresult name="spr_FiscalYears" 			resultset="3">
	<cfprocresult name="spr_DistinctListOfPOsInDoS" resultset="4">
	
</cfstoredproc>

<!--- Begin DECLARATION PART -------------------------------------------------->
<cfinclude template="JS/inc_VariablesForProjectsSummary.cfm">
<script language="JavaScript">
//
of_browserSelection();
//
//f_VariablesForProjectsSummary();
//

</script>
<cfinclude template="JS/inc_PrjsInOffice.cfm">
<cfinclude template="JS/inc_DistinctListOfPOs.cfm">
<!--- --------------------------------------------------------------------- --->
<table cellspacing="2" cellpadding="2" border="0">
<tr><td colspan="2" align="right" id="navigateBelow">&nbsp;<!--- <a name="SummaryOfPrjs"></a><a href="#Details">Check Details (below)</a> ---></td></tr>
<tr>
    <td class="txtOutputTitle" align="right" width="30%">List of Branches:</td>
    <td width="70%">
		<select name="s_BranchList" onchange="of_onChngBranchList(this.value)"  style="width: 350px;">
			<option value="-1">[------------------ Select Branch from the List ------------------]</option>
			<cfoutput query="spr_getListOfBranches" startrow="1">
			<!--- <option value="#uo_office_id#">#uo_office_symbol#&nbsp;&nbsp;&nbsp;(#uo_org_abbreviation#)&nbsp;&nbsp;(for debug:#uo_office_id#)</option> --->
			<option value="#uo_office_symbol#">#UO_ORG_ABBREVIATION#&nbsp;&nbsp;&nbsp;(#uo_office_symbol#)</option><!--- &nbsp;&nbsp;(for debug:#uo_office_id#) --->
			</cfoutput> 
		</select>
	</td>
</tr>
<!--- <tr><td colspan="2">&nbsp;</td></tr> --->
<!--- <tr>
	<td colspan="2">
		<cfinclude template="Include/inc_TableForProjectsSummary.cfm">
	</td>
</tr> --->
<!--- <tr><td colspan="2" align="right" id="navigateTop">&nbsp;<!--- <a name="Details"></a><a href="#SummaryOfPrjs">Back to Summary (top)</a> ---></td></tr> --->
<!--- <tr>
	<td  colspan="2" id="selectedBranchDetails">&nbsp;</td>
</tr> --->
</table>
<!--- --------------------------------------------------------------------- --->
<cfinclude template="JS/of_set_0_InVarsFoPrjSummary.cfm">
<cfinclude template="JS/of_setVarsForPrjSummary.cfm">
<cfinclude template="JS/of_populatePrjsSummary.cfm">

<!--- End DECLARATION PART ---------------------------------------------------->
<cfinclude template="Include/inc_TableForProjectsSummary.cfm">

<div id="id_TableListOfPOs"></div>

<div id="id_EMail">
<table align="center">
<tr class="txtTableHeader">
	<td colspan="5">
		<input type="Button" name="cb_Select" value="Select" onclick="selectForEMail(this.value);">&nbsp;&nbsp;
		<span id="idSelectForEMail">Click on button to SELECT all for E-Mail</span>
		<br><br>
		<input type="Button" name="cb_sendEMail" value="E-Mail" onclick="sendEMail();">&nbsp;&nbsp;
		<input type="Hidden" name="h_EMailAddr" value="">
	</td>
</tr>
<tr>
	<td colspan=5>
		<hr color="#800000" noshade>
 	</td>
</tr>
</table>
</div>

<!--- <cfinclude template="Include/inc_TableListOfDoSPOs.cfm"> --->

<!--- Begin ACTION PART ------------------------------------------------------->
<script language="JavaScript">
//


function of_onChngBranchList(argOrgSymbol){with(self.document.forms[0])
{//alert(argOrgSymbol)
	
	if (argOrgSymbol == -1)
	{
		of_set_0_InVarsFoPrjSummary();
		of_populatePrjsSummary();
		of_buildTableListOfPOs(argOrgSymbol);
		of_Style("id_EMail", "visibility", "hidden");
	}
	else
	{//alert(argOrgSymbol)
		of_filterPrjsInOffice(argOrgSymbol);
		of_set_0_InVarsFoPrjSummary();
		of_setVarsForPrjSummary();
		of_populatePrjsSummary();
		of_filterListOfPOs(argOrgSymbol);
		of_buildTableListOfPOs(argOrgSymbol);
		of_Style("id_EMail", "visibility", "visible");
		cb_Select.value = "Select";
		of_innerHTML("idSelectForEMail", "'Click on button to SELECT all for E-Mail'");
		h_EMailAddr.value = "";
	}
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_filterListOfPOs(argOrgSymbol){//alert(argOrgSymbol)
	//DoSPrgramOffiserID, DoSProgramOfficerName, DosProgramOfficerEMail, DoSOfficeSymbol, DOSOfficeID
	fBufferDLP = new Array();
	fp = 0;
	var vArgOrgSymbol_Length = argOrgSymbol.length;
	for (var dlp=0; dlp<rowsDLP; dlp++ )//rowsDLP is taken from the file inc_DistinctListOfPOs.cfm
	{
		if ( argOrgSymbol == orgBufferDLP[dlp].aDoSOfficeSymbol.substr(0,vArgOrgSymbol_Length) )
		{
			fBufferDLP[fp] = new arrayDPL(
											orgBufferDLP[dlp].aDoSPrgramOffiserID,
											orgBufferDLP[dlp].aDoSProgramOfficerName,
											orgBufferDLP[dlp].aDosProgramOfficerEMail,
											orgBufferDLP[dlp].aDoSOfficeSymbol,
											orgBufferDLP[dlp].aDOSOfficeID
										 );
			fp++;
		}
	
	}
}//end of function of_filterListOfPOs
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------


function of_buildTableListOfPOs(argOrgSymbol){with(self.document.forms[0]){//alert(argOrgSymbol)
	var vTableListOfPOs = "";
	if (argOrgSymbol == -1)
	{
		vTableListOfPOs = "&nbsp;";
	}
	else
	{
		// This table should be used if there is a need for links taking to TOP or DOWN
		/*
		vTableListOfPOs += "<table>";
		vTableListOfPOs += "<tr>";
		vTableListOfPOs += "<td colspan=2 align=\"right\" id=\"navigateTop\">";
		vTableListOfPOs += "&nbsp;";//<a name="Details"></a><a href="#SummaryOfPrjs">Back to Summary (top)</a>
		vTableListOfPOs += "</td>";
		vTableListOfPOs += "</tr>";
		vTableListOfPOs += "</table>";
		*/
		vTableListOfPOs += "<table cellspacing=2 cellpadding=2 border=0>";
		vTableListOfPOs += "<tr>";
			vTableListOfPOs += "<td colspan=5>";
			vTableListOfPOs += "<hr color=\"#800000\" noshade>";
			vTableListOfPOs += "</td>";
		vTableListOfPOs += "</tr>";
		vTableListOfPOs += "<tr>";
			vTableListOfPOs += "<td rowspan=2 align=\"center\" width=\"10%\" class=\"txtTableHeader\">";
			vTableListOfPOs += "E-Mail Selection";
			vTableListOfPOs += "</td>";
			vTableListOfPOs += "<td colspan=2 align=\"left\" width=\"50%\" class=\"txtTableHeader\">";
			vTableListOfPOs += "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DoS Program Officer";
			vTableListOfPOs += "</td>";
			vTableListOfPOs += "<td colspan=2 align=\"center\" width=\"40%\" class=\"txtTableHeader\">";
			vTableListOfPOs += "COMPLETED and CLOSED<br>EVALUATED Projects for the Fiscal Year";
			vTableListOfPOs += "</td>";
		vTableListOfPOs += "</tr>";
		
		vTableListOfPOs += "<tr>";
			vTableListOfPOs += "<td>&nbsp;</td>";
			vTableListOfPOs += "<td>&nbsp;</td>";
			vTableListOfPOs += "<td align=\"center\" width=\"20%\" class=\"txtTableHeader\">";
			vTableListOfPOs += vPrevFiscalYear;
			vTableListOfPOs += "</td>";
			vTableListOfPOs += "<td align=\"center\" width=\"20%\" class=\"txtTableHeader\">";
			vTableListOfPOs += vCurrFiscalYear;
			vTableListOfPOs += "</td>";
		vTableListOfPOs += "</tr>";
		vTableListOfPOs += "<tr>";
			vTableListOfPOs += "<td colspan=5>";
			vTableListOfPOs += "<hr color=\"#800000\" noshade>";
			vTableListOfPOs += "</td>";
		vTableListOfPOs += "</tr>";
		//--
		for (var fp=0; fp<fBufferDLP.length; fp++)
		{//alert()
			vTableListOfPOs += "<tr>";
				vTableListOfPOs += "<td align=\"center\" width=\"10%\" class=\"txtTableCellNormal\">";
				if (fBufferDLP[fp].aDosProgramOfficerEMail != "no_email")
				{
					vTableListOfPOs += "<input type=\"Checkbox\" value=0 name=\"cbx_"+fBufferDLP[fp].aDoSPrgramOffiserID+"\">";
					//vTableListOfPOs += "cbx_"+fBufferDLP[fp].aDoSPrgramOffiserID;
				}
				else
				{
					vTableListOfPOs += "E-Mail<br>is not<br>available";
				}
				vTableListOfPOs += "</td>";
				//
				vTableListOfPOs += "<td align=\"left\" width=\"30%\" class=\"txtTableCell\">";
				vTableListOfPOs += fBufferDLP[fp].aDoSProgramOfficerName;
				vTableListOfPOs += "</td>";
				//
				vTableListOfPOs += "<td align=\"center\" width=\"20%\" class=\"txtTableCell\">";
				vTableListOfPOs += "<a href=\"javascript: of_detailsOpenClose("+fBufferDLP[fp].aDoSPrgramOffiserID+")\"><span id=\"idDetalsOpenClose_"+fBufferDLP[fp].aDoSPrgramOffiserID+"\">Open details</span></a>";
				vTableListOfPOs += "</td>";
				//
				vTableListOfPOs += "<td align=\"center\" width=\"20%\" class=\"txtTableCell\">";
				//==============================================================
				vTableListOfPOs += "<span id=\"idEvalPrevFiscYear_"+fBufferDLP[fp].aDoSPrgramOffiserID+"\">";
				vTableListOfPOs += of_NumOfEvalPrjs(vPrevFiscalYear, fBufferDLP[fp].aDoSPrgramOffiserID, "idEvalPrevFiscYear_"+fBufferDLP[fp].aDoSPrgramOffiserID);
				vTableListOfPOs += "</span>"
				//==============================================================
				vTableListOfPOs += "</td>";
				//
				vTableListOfPOs += "<td align=\"center\" width=\"20%\" class=\"txtTableCell\">";
				//==============================================================
				vTableListOfPOs += "<span id=\"idEvalPrevFiscYear_"+fBufferDLP[fp].aDoSPrgramOffiserID+"\">";
				vTableListOfPOs += of_NumOfEvalPrjs(vCurrFiscalYear, fBufferDLP[fp].aDoSPrgramOffiserID, "idEvalPrevFiscYear_"+fBufferDLP[fp].aDoSPrgramOffiserID);
				vTableListOfPOs += "</span>"
				//==============================================================
				//
			vTableListOfPOs += "</tr>";
			vTableListOfPOs += "<tr>";
				vTableListOfPOs += "<td colspan=5 id=\"idPO_"+fBufferDLP[fp].aDoSPrgramOffiserID+"\">&nbsp;</td>";
			vTableListOfPOs += "</tr>";
			vTableListOfPOs += "<tr>";
				vTableListOfPOs += "<td colspan=5>";
				vTableListOfPOs += "<hr color=\"#800000\" noshade>";
				vTableListOfPOs += "</td>";
			vTableListOfPOs += "</tr>";
		}
		
		vTableListOfPOs += "</table>";
		
	}
	//
	of_innerHTML("id_TableListOfPOs", "'"+vTableListOfPOs+"'");

	
}}//end of function of_buildTableListOfPOs
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_NumOfEvalPrjs(argFiscalYear,argDoSPrgramOffiserID, argSpanID)
{//alert (argFiscalYear+"   "+argDoSPrgramOffiserID+"   "+argSpanID)//alert(fBufferPP.length)
	
	var vPrjCountForSelectedYear = 0;
	var vPrjCount_Evaluated = 0;
	var vCounterPercent = 0; 
	for (var fp=0; fp<fBufferPP.length; fp++)
	{
	
		if ( fBufferPP[fp].aPrjFiscalYear == argFiscalYear 
			 && 
		     fBufferPP[fp].aDoSPrgramOffiserID == argDoSPrgramOffiserID
			 &&
			 fBufferPP[fp].aPrjCurrentStatus != "ACT"
		   )
		{
	
			vPrjCountForSelectedYear++;
			
			if(	fBufferPP[fp].aEvalStatus == "E" )
			
			{
//alert (fBufferPP[fp].aPrjFiscalYear+"   "+fBufferPP[fp].aDoSProgramOfficerName+"   "+argSpanID)
				vPrjCount_Evaluated++;
			}
			
		}
	}  
	//
	if ( vPrjCountForSelectedYear != 0 )
	{
		vCounterPercent = Math.round((parseInt(vPrjCount_Evaluated)*100)/parseInt(vPrjCountForSelectedYear)) ;
	}
	//alert("'"+vPrjCount_Evaluated+" out of "+vPrjCountForSelectedYear+" ("+vCounterPercent+"%)"+"'")
	return vPrjCount_Evaluated+" out of "+vPrjCountForSelectedYear+" ("+vCounterPercent+"%)";
	//of_innerHTML(argSpanID, "'"+vPrjCount_Evaluated+" out of "+vPrjCountForSelectedYear+" ("+vCounterPercent+"%)"+"'");

}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function selectForEMail(argValue){with(self.document.forms[0]){
	if (cb_Select.value == "Select")
	{
		for (var i=0; i<elements.length; i++)
		{
			if (elements[i].type == "checkbox")
			{
				elements[i].checked = true;
			}
		}
		cb_Select.value = "Unselect";
		of_innerHTML("idSelectForEMail", "'Click on button to UNSELECT all for e-mail'");
		
	}
	else // cb_Select.value == "Unselect"
	{
		for (var i=0; i<elements.length; i++)
		{
			if (elements[i].type == "checkbox")
			{
				elements[i].checked = false;
			}
		}
		cb_Select.value = "Select";
		of_innerHTML("idSelectForEMail", "'Click on button to SELECT all for e-mail'");
	}
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------


function sendEMail(){with(self.document.forms[0]){//alert("Sorry... Under Construction.")
	//var vEMail = "";
	h_EMailAddr.value = "";
	
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].type == "checkbox" && elements[e].checked == true )
		{
			for (var fp=0; fp<fBufferDLP.length; fp++)
			{	
				if (elements[e].name.substr(4) == fBufferDLP[fp].aDoSPrgramOffiserID)
				{//alert(elements[e].name.substr(4)+"   "+fBufferDLP[p].aDOSOfficeID+"   "+fBufferDLP[p].aDosProgramOfficerEMail)
					h_EMailAddr.value += fBufferDLP[fp].aDosProgramOfficerEMail+",";
					break;
				}
			}
		}
	}
	//
	if (h_EMailAddr.value == "")
	{
		alert("Sorry, request cannot be processed.\nPlease select DoS officer first.")
	}
	else 
	{//alert(h_EMailAddr.value.substr(0, parseInt(h_EMailAddr.value.length)-1));
	
	
		var popupPage = "Send_EMail.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlEMailList="+h_EMailAddr.value.substr(0, parseInt(h_EMailAddr.value.length)-1);
		//var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=no,resizable=yes,top=0,left=0,copyhistory=no,width=810,height=1000','yes');
		var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,titlebar=yes,resizable=yes,top=0,left=0,copyhistory=no,width=800,height=600','yes');
		
		if ((document.window != null) && (!popupWin.opener))
		{
			popupWin.opener = document.window;
		}
	}
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_filterPrjsInOffice(argOrgSymbol){//alert(orgBufferPP.length)

	fBufferPP = new Array();
	var fp = 0;//-- filtered projects
	var vArgOrgSymbol_Length = argOrgSymbol.length;//alert(vArgOrgSymbol_Length)
	
	for (var pp=0; pp<orgBufferPP.length; pp++)
	{
	//alert(argOrgSymbol+"   "+orgBufferPP[pp].aPrjNum.substr(0,5) )
	
		if ( argOrgSymbol == orgBufferPP[pp].aPrjNum.substr(0,vArgOrgSymbol_Length) )
		{
   //alert(argOrgSymbol+"   "+orgBufferPP[pp].aPrjNum.substr(0,vArgOrgSymbol_Length)+"  "+ orgBufferPP[pp].aPrjNum)
			
			fBufferPP[fp] = new arrayPP(
						   orgBufferPP[pp].aDoSPrgramOffiserID
						  ,orgBufferPP[pp].aDoSProgramOfficerName
						  ,orgBufferPP[pp].aDosProgramOfficerEMail
						  ,orgBufferPP[pp].aPrjID
						  ,orgBufferPP[pp].aPrjNum
						  ,orgBufferPP[pp].aPrjTitle
						  ,orgBufferPP[pp].aPrjFiscalYear
						  ,orgBufferPP[pp].aPrgrAgency
						  ,orgBufferPP[pp].aPrgrAgencyID
						  ,orgBufferPP[pp].aNPAOfficerID
						  ,orgBufferPP[pp].aNPAOfficerName
						  ,orgBufferPP[pp].aEVDB_Presence
						  ,orgBufferPP[pp].aStrGoalID
						  ,orgBufferPP[pp].aStrGoalName
						  ,orgBufferPP[pp].aPrjComments
						  ,orgBufferPP[pp].aEvalStatus
						  ,orgBufferPP[pp].aPrjCurrentStatus
				
				)
		//alert(fp+"  "+fBufferPP[fp].aDoSProgramOfficerName+"  "+fBufferPP[fp].aPrjTitle)
			fp++;
		
			
		}
	}
	//alert(fBufferPP.length)

}//end of function of_filterPrjsInOffice()
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_detailsOpenClose(argDoSPrgramOffiserID){with(self.document.forms[0]){
	//alert("idDetalsOpenClose_"+argDoSPrgramOffiserID)
	//	
	function of_arraySort(a,b)
	{
		a = a.aPrjID;//a.aPrjTitle.toUpperCase();
	 	b = b.aPrjID;//b.aPrjTitle.toUpperCase();
		return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );
	}
	orgBufferPP.sort(of_arraySort);	
	//
	var vInnerText = "";
	var vTable = "";
	vInnerText = eval("idDetalsOpenClose_"+argDoSPrgramOffiserID+".innerText");
	var vPrjPrevFiscYearOutput = "";
	var vPrjPrevFiscYearOutput_E  = "";
	var vPrjPrevFiscYearOutput_PE = "";
	var vPrjPrevFiscYearOutput_NE = "";
	//
	var vPrjCurrFiscYearOutput = "";
	var vPrjCurrFiscYearOutput_E  = "";
	var vPrjCurrFiscYearOutput_PE = "";
	var vPrjCurrFiscYearOutput_NE = "";
	//
	var vPrjOutput = "";
	//
	if (vInnerText == "Open details")
	{
		vTable += "<table cellspacing=1 cellpadding=1 border=1 width=\"100%\" bgcolor=\"#F6FAE1\">";
			vTable += "<tr>";
			    vTable += "<td  colspan=2 class=\"txtTableHeader\">Applies to COMPLETED and CLOSED projects</td>";
			vTable += "</tr>";
			vTable += "<tr>";
			    vTable += "<td align=\"center\" width=\"50%\" class=\"txtTableHeader\">"+vPrevFiscalYear+"</td>";
			    vTable += "<td align=\"center\" width=\"50%\" class=\"txtTableHeader\">"+vCurrFiscalYear+"</td>";
			vTable += "</tr>";
			//
			for (var p=0; p<rowsPP; p++)
			{
				
				//Filter records for selected OfficerID: COMPLETED and CLOSED:
				if (argDoSPrgramOffiserID == orgBufferPP[p].aDoSPrgramOffiserID 
			 		&&
			 		orgBufferPP[p].aPrjCurrentStatus != "ACT"
					)
				{
					//-- Records are devided by FiscalYear (Previous):-----------------
					if (orgBufferPP[p].aPrjFiscalYear == vPrevFiscalYear)
					{
						//**************************************************
						if ( orgBufferPP[p].aEvalStatus == "E" )
						{
							vPrjPrevFiscYearOutput_E += orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
						}
						else if ( orgBufferPP[p].aEvalStatus == "PE" )
						{
							vPrjPrevFiscYearOutput_PE += orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
						}
						else if ( orgBufferPP[p].aEvalStatus == "NE" )
						{
							vPrjPrevFiscYearOutput_NE += orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
						}
						//**************************************************
					}
					//-- Records are devided by FiscalYear (Current): -----------------
					else if (orgBufferPP[p].aPrjFiscalYear == vCurrFiscalYear)
					{
						//**************************************************
						if ( orgBufferPP[p].aEvalStatus == "E" )
						{
							vPrjCurrFiscYearOutput_E += orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
						}
						else if ( orgBufferPP[p].aEvalStatus == "PE" )
						{
							vPrjCurrFiscYearOutput_PE += orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
						}
						else if ( orgBufferPP[p].aEvalStatus == "NE" )
						{
							vPrjCurrFiscYearOutput_NE += orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
						}
						//**************************************************
					}
				}// END of filtering records for selected OfficerID: COMPLETED and CLOSED:
			}//-- END of loop
			//
			//vPrjPrevFiscYearOutput += vPrjPrevFiscYearOutput_E+vPrjPrevFiscYearOutput_PE+vPrjPrevFiscYearOutput_NE;
			//vPrjCurrFiscYearOutput += vPrjCurrFiscYearOutput_E+vPrjCurrFiscYearOutput_PE+vPrjCurrFiscYearOutput_NE;
			//******************************************************************
			//-- Building Table to output filtered data: -----------------------
			
			if (vPrjPrevFiscYearOutput_E  == ""){vPrjPrevFiscYearOutput_E = "No records"}
			if (vPrjPrevFiscYearOutput_PE == ""){vPrjPrevFiscYearOutput_PE = "No records"}
			if (vPrjPrevFiscYearOutput_NE == ""){vPrjPrevFiscYearOutput_NE = "No records"}
			//
			if (vPrjCurrFiscYearOutput_E  == ""){vPrjCurrFiscYearOutput_E = "No records"}
			if (vPrjCurrFiscYearOutput_PE == ""){vPrjCurrFiscYearOutput_PE = "No records"}
			if (vPrjCurrFiscYearOutput_NE == ""){vPrjCurrFiscYearOutput_NE = "No records"}
			
			//******************************************************************
			//
			//if (vPrjPrevFiscYearOutput == ""){vPrjPrevFiscYearOutput = "&nbsp;"}
			//if (vPrjCurrFiscYearOutput == ""){vPrjCurrFiscYearOutput = "&nbsp;"}
			//------------------------------------------------------------------
			vPrjOutput += "<table width=\"100%\" cellspacing=1 cellpadding=1 border=0>";
				vPrjOutput += "<th colspan=4 class=\"c_Green_Header\">Evaluated</th>";
				vPrjOutput += "<tr>";
					vPrjOutput += "<td width=\"1%\">&nbsp;</td>";
					vPrjOutput += "<td width=\"44%\" class=\"c_Green_Text\">"+vPrjPrevFiscYearOutput_E+"</td>";
					vPrjOutput += "<td width=\"1%\">&nbsp;</td>";
					vPrjOutput += "<td width=\"44%\" class=\"c_Green_Text\">"+vPrjCurrFiscYearOutput_E+"</td>";
				vPrjOutput += "</tr>";
				vPrjOutput += "<th colspan=4 class=\"c_Yellow_Header\">Partially Evaluated</th>";
				vPrjOutput += "<tr>";
					vPrjOutput += "<td width=\"1%\">&nbsp;</td>";
					vPrjOutput += "<td width=\"44%\" class=\"c_Yellow_Text\">"+vPrjPrevFiscYearOutput_PE+"</td>";
					vPrjOutput += "<td width=\"1%\">&nbsp;</td>";
					vPrjOutput += "<td width=\"44%\" class=\"c_Yellow_Text\">"+vPrjCurrFiscYearOutput_PE+"</td>";
				vPrjOutput += "</tr>";
				vPrjOutput += "<th colspan=4 class=\"c_Red_Header\">Not Evaluated</th>";
				vPrjOutput += "<tr>";
					vPrjOutput += "<td width=\"1%\">&nbsp;</td>";
					vPrjOutput += "<td width=\"44%\" class=\"c_Red_Text\">"+vPrjPrevFiscYearOutput_NE+"</td>";
					vPrjOutput += "<td width=\"1%\">&nbsp;</td>";
					vPrjOutput += "<td width=\"44%\" class=\"c_Red_Text\">"+vPrjCurrFiscYearOutput_NE+"</td>";
				vPrjOutput += "</tr>";
			vPrjOutput += "</table>";
			//---
			vTable += "<tr>";
			vTable += "<td colspan=2>"+vPrjOutput+"</td>"	
				//vTable += "<td class=\"<cfoutput>#local.classColor2#</cfoutput>\">"+vPrjPrevFiscYearOutput+"</td>";
			    //vTable += "<td class=\"<cfoutput>#local.classColor2#</cfoutput>\">"+vPrjCurrFiscYearOutput+"</td>";
			vTable += "</tr>";
			//---
		vTable += "</table>";

		//alert(vTable)
		
		of_innerHTML("idDetalsOpenClose_"+argDoSPrgramOffiserID, "'Close details'");
		of_innerHTML("idPO_"+argDoSPrgramOffiserID, "'"+vTable+"'");
	}
	
	else if (vInnerText == "Close details")
	{
		of_innerHTML("idDetalsOpenClose_"+argDoSPrgramOffiserID, "'Open details'");
		of_innerHTML("idPO_"+argDoSPrgramOffiserID, "'&nbsp;'");
	}
	
	
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

</script>
<cfinclude template="JS/inc_ProjectsSummary.cfm">
<script language="JavaScript">
	of_Style("id_EMail", "visibility", "hidden");
</script>
<!--- End ACTION PART --------------------------------------------------------->