<script language="JavaScript">
//
//------------------------------------------------------------------------------
function of_NumOfEvalPrjs(argFiscalYear,argDoSPrgramOffiserID, argSpanID)
{//alert (argFiscalYear+"   "+argDoSPrgramOffiserID+"   "+argSpanID)
	
	var vPrjCountForSelectedYear = 0;
	var vPrjCount_Evaluated = 0;
	var vCounterPercent = 0; 
	for (var p=0; p<rowsPP; p++)
	{
		if ( orgBufferPP[p].aPrjFiscalYear == argFiscalYear 
			 && 
		     orgBufferPP[p].aDoSPrgramOffiserID == argDoSPrgramOffiserID
			 &&
			 orgBufferPP[p].aPrjCurrentStatus != "ACT"
		   )
		{
			
			vPrjCountForSelectedYear++;
			
			if(	orgBufferPP[p].aEvalStatus == "E" )
			
			{
				vPrjCount_Evaluated++;
			}
			
		}
	}  
	//
	if ( vPrjCountForSelectedYear != 0 )
	{
		vCounterPercent = Math.round((parseInt(vPrjCount_Evaluated)*100)/parseInt(vPrjCountForSelectedYear)) ;
	}
	//
	of_innerHTML(argSpanID, "'"+vPrjCount_Evaluated+" out of "+vPrjCountForSelectedYear+" ("+vCounterPercent+"%)"+"'");
}
//
//------------------------------------------------------------------------------

</script>


<cfif #client.ModuleName# EQ "Branch Information">
	<cfset local.classColor1 = "txtTableHeader">
	<cfset local.classColor2 = "txtTableCell">
<cfelseif #client.ModuleName# EQ "Personal Project Evaluation">
	<cfset local.classColor1 = "txtTableCell">
	<cfset local.classColor2 = "txtTableHeader">
<cfelseif #client.ModuleName# EQ "Division Information">
	<cfset local.classColor1 = "txtTableCell">
	<cfset local.classColor2 = "txtTableHeader">
</cfif>
<table width="100%">
<tr><td colspan="2" align="right" id="navigateTop"><a name="Details"></a><a href="#SummaryOfPrjs">Back to Summary (top)</a></td></tr>
</table>
<table cellspacing="2" cellpadding="2" border="0">
<tr>
    <td colspan="5"><hr color="#800000" noshade></td>
</tr>
<cfoutput>
<tr>
    <td rowspan="2" align="center" width="10%" class="#local.classColor1#">E-Mail Selection</td>
    <td colspan="2" align="left" width="50%" class="#local.classColor1#"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DoS Program Officer</td>
    <td colspan="2" align="center" width="40%" class="#local.classColor1#">COMPLETED and CLOSED<br>Evaluated Projects for the Fiscal Year</td>
</tr>
</cfoutput>
<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
	<cfoutput>
    <td align="center" width="20%" class="#local.classColor1#"><span id="idPrevFiscalYear2">&nbsp;</span></td>
    <td align="center" width="20%" class="#local.classColor1#"><span id="idCurrFiscalYear2">&nbsp;</span></td>
	</cfoutput>
</tr>
<tr>
    <td colspan="5"><hr color="#800000" noshade></td>
</tr>
<cfoutput query="spr_DistinctListOfPOsInDoS">
<!--- DoSPrgramOffiserID, DoSProgramOfficerName, DosProgramOfficerEMail --->
<tr>
    <td align="center" width="10%" class="#local.classColor2#"><input type="Checkbox" value="0" name="cbx_#DoSPrgramOffiserID#"></td>
    <td align="left"   width="30%" class="#local.classColor2#">#DoSProgramOfficerName# &nbsp;&nbsp;(#DoSPrgramOffiserID#) </td>																	<!--- idDetalsOpenClose_#DoSPrgramOffiserID#,  --->
    <td align="center" width="20%" class="#local.classColor2#"><a href="javascript: of_detailsOpenClose(#DoSPrgramOffiserID#)"><span id="idDetalsOpenClose_#DoSPrgramOffiserID#">Open details</span></a></td>
    <td align="center" width="20%" class="#local.classColor2#">
		<span id="idEvalPrevFiscYear_#DoSPrgramOffiserID#">&nbsp;</span>
		<script language="JavaScript">
			of_NumOfEvalPrjs(vPrevFiscalYear, #DoSPrgramOffiserID#, "idEvalPrevFiscYear_"+#DoSPrgramOffiserID#)
		</script>
		
	</td>
    <td align="center" width="20%" class="#local.classColor2#">
		<span id="idEvalCurrFiscYear_#DoSPrgramOffiserID#"></span>
		<script language="JavaScript">
			of_NumOfEvalPrjs(vCurrFiscalYear, #DoSPrgramOffiserID#, "idEvalCurrFiscYear_"+#DoSPrgramOffiserID#)
		</script>
	</td>
</tr>
<tr>
    <td colspan="5" id="idPO_#DoSPrgramOffiserID#">&nbsp;</td>
</tr>
</cfoutput>
<tr>
    <td colspan="5"><hr color="#800000" noshade></td>
</tr>
<tr class="txtTableHeader"><td colspan="5">
	<input type="Button" name="cb_Select" value="Select" onclick="selectForEMail(this.value);">&nbsp;&nbsp;
	<span id="idSelectForEMail">Click on button to SELECT all for E-Mail</span>
	<br><br>
	<input type="Button" name="cb_sendEMail" value="E-Mail" onclick="sendEMail();">&nbsp;&nbsp;
</td></tr>

<tr>
    <td colspan="5"><hr color="#800000" noshade></td>
</tr>
</table>

<!--- Begin ACTION PART ------------------------------------------------------->
<script language="JavaScript">
//
of_innerHTML("idPrevFiscalYear2", "'"+vPrevFiscalYear+"'");
//of_innerHTML("idPrevFiscalYear3", "'"+vPrevFiscalYear+"'");
of_innerHTML("idCurrFiscalYear2", "'"+vCurrFiscalYear+"'");
//of_innerHTML("idCurrFiscalYear3", "'"+vCurrFiscalYear+"'");
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_detailsOpenClose(argDoSPrgramOffiserID){with(self.document.forms[0]){
	//alert("idDetalsOpenClose_"+argDoSPrgramOffiserID)
	
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
			//fa - filtered Array
			//fa_PrjPrevFiscYearOutput = new Array();
			//fa_PrjPrevCurrYearOutput = new Array();
	
	
	if (vInnerText == "Open details")
	{
		vTable += "<table cellspacing=1 cellpadding=1 border=5 width=\"100%\" bgcolor=\"#F6FAE1\">";
			//vTable += "<tr><td colspan=2><hr color=\"Navy\"></td></tr>";
			vTable += "<tr>";
							   //style=\"border-top-color: Navy; border-top-style: solid; border-top-width: thin;\"
			    vTable += "<td  colspan=2 class=\"<cfoutput>#local.classColor1#</cfoutput>\">Applies to COMPLETED and CLOSED projects</td>";
			vTable += "</tr>";
			//vTable += "<tr><td colspan=2><hr color=\"Navy\"></td></tr>";
			vTable += "<tr>";
			    vTable += "<td align=\"center\" colspan=2 class=\"<cfoutput>#local.classColor1#</cfoutput>\">List of NOT EVALUATED and PARTIALLY EVALUATED projects</td>";
			vTable += "</tr>";
			//vTable += "<tr><td colspan=2><hr color=\"Navy\"></td></tr>";
			vTable += "<tr>";
			    vTable += "<td align=\"center\" width=\"50%\" class=\"<cfoutput>#local.classColor1#</cfoutput>\"><cfoutput>#spr_FiscalYears.PrevFiscalYear#</cfoutput></td>";
			    vTable += "<td align=\"center\" width=\"50%\" class=\"<cfoutput>#local.classColor1#</cfoutput>\"><cfoutput>#spr_FiscalYears.CurrFiscalYear#</cfoutput></td>";
			vTable += "</tr>";
			//vTable += "<tr><td colspan=2><hr color=\"Navy\"></td></tr>";
			
			for (var p=0; p<rowsPP; p++)
			{
				if (argDoSPrgramOffiserID == orgBufferPP[p].aDoSPrgramOffiserID 
			 		&&
			 		orgBufferPP[p].aPrjCurrentStatus != "ACT"
					)
					{
						//-- Records are devided by FiscalYear:-----------------
						if (orgBufferPP[p].aPrjFiscalYear == <cfoutput>#spr_FiscalYears.PrevFiscalYear#</cfoutput>)
						{
							//**************************************************
							if ( orgBufferPP[p].aEvalStatus == "E" )
							{
								vPrjPrevFiscYearOutput_E += orgBufferPP[p].aEvalStatus+" --- "+orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
							}
							else if ( orgBufferPP[p].aEvalStatus == "PE" )
							{
								vPrjPrevFiscYearOutput_PE +=  orgBufferPP[p].aEvalStatus+" --- "+orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
							}
							else if ( orgBufferPP[p].aEvalStatus == "NE" )
							{
								vPrjPrevFiscYearOutput_NE +=  orgBufferPP[p].aEvalStatus+" --- "+orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
							}
							
							vPrjPrevFiscYearOutput += vPrjPrevFiscYearOutput_E+vPrjPrevFiscYearOutput_PE+vPrjPrevFiscYearOutput_NE
							//**************************************************
							
							//vPrjPrevFiscYearOutput += orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
							
						}
						
						else if (orgBufferPP[p].aPrjFiscalYear == <cfoutput>#spr_FiscalYears.CurrFiscalYear#</cfoutput>)
						{
							vPrjCurrFiscYearOutput += orgBufferPP[p].aPrjNum+" -- "+orgBufferPP[p].aPrjTitle+"<br>";
						}
						//-- Records are devided by FiscalYear:-----------------
					}
			}
			if (vPrjPrevFiscYearOutput == ""){vPrjPrevFiscYearOutput = "&nbsp;"}
			if (vPrjCurrFiscYearOutput == ""){vPrjPrevCurrYearOutput = "&nbsp;"}
			//---
							/*
							vPrjPrevFiscYearOutput += "<table cellspacing=2 cellpadding=2 border=1>";
							vPrjPrevFiscYearOutput += "<tr>";
							vPrjPrevFiscYearOutput += 	<td colspan="2">Not Evaluated</td>
							vPrjPrevFiscYearOutput += "</tr>";
							vPrjPrevFiscYearOutput += "<tr>";
							vPrjPrevFiscYearOutput += "<td width=\"5%\">&nbsp;</td>";
							vPrjPrevFiscYearOutput += 							"<td>&nbsp;</td>";
							vPrjPrevFiscYearOutput += "</tr>";
							vPrjPrevFiscYearOutput += "<tr>";
							vPrjPrevFiscYearOutput += <td colspan="2">Partially Evaluated</td>
							vPrjPrevFiscYearOutput += "</tr>";
							vPrjPrevFiscYearOutput += "<tr>";
							vPrjPrevFiscYearOutput += "<td width=\"5%\">&nbsp;</td>";
							vPrjPrevFiscYearOutput += 							"<td>&nbsp;</td>";
							vPrjPrevFiscYearOutput += "</tr>";
							vPrjPrevFiscYearOutput += "<tr>";
							vPrjPrevFiscYearOutput += <td colspan="2">Not Evaluated</td>
							vPrjPrevFiscYearOutput += "</tr>";
							vPrjPrevFiscYearOutput += "<tr>";
							vPrjPrevFiscYearOutput += "<td width=\"5%\">&nbsp;</td>";
							vPrjPrevFiscYearOutput += 							"<td>&nbsp;</td>";
							vPrjPrevFiscYearOutput += "</tr>";
							vPrjPrevFiscYearOutput += "</table>";
							*/
			//---
			vTable += "<tr>";
				vTable += "<td class=\"<cfoutput>#local.classColor2#</cfoutput>\">"+vPrjPrevFiscYearOutput+"</td>";
			    vTable += "<td class=\"<cfoutput>#local.classColor2#</cfoutput>\">"+vPrjPrevCurrYearOutput+"</td>";
			vTable += "</tr>";
			//---
			//vTable += "<tr><td colspan=2><hr color=\"Navy\"></td></tr>";
			/*
			vTable += "<tr>";
			    vTable += "<td>TOTAL:&nbsp;</td>";
			    vTable += "<td>TOTAL:&nbsp;</td>";
			vTable += "</tr>";
			*/
			//vTable += "<tr><td colspan=2><hr color=\"Navy\"></td></tr>";
		vTable += "</table>";

		
		
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
function sendEMail(){
	alert("Sorry... Under Construction.")

}
</script>
<!--- End ACTION PART --------------------------------------------------------->