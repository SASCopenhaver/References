<!--- OfficeInfo.cfm --->
<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>

<!--- --------------------------------------------------------------------- --->
<cfstoredproc procedure="PACK_EVAL.sp_getOfficeInfo" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getPrjsInOffice" maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_FiscalYears"  maxrows="-1" variable="IgnoreThis">
	
	<cfprocresult name="spr_getPrjsInOffice" resultset="1">
	<cfprocresult name="spr_FiscalYears" resultset="2">
</cfstoredproc>
<!--- --------------------------------------------------------------------- --->
<!--- Begin DECLARATION PART -------------------------------------------------->
<cfinclude template="JS/inc_VariablesForProjectsSummary.cfm">
<script language="JavaScript">
//
of_browserSelection();
//
</script>
<cfinclude template="JS/inc_PrjsInOffice.cfm">
<!--- End DECLARATION PART ---------------------------------------------------->
<!--- --------------------------------------------------------------------- --->
<table cellspacing="2" cellpadding="2" border="0">
<tr><td colspan="2">&nbsp;</td></tr>
<tr>
    <td class="txtOutputTitle" align="right" width="30%">&nbsp;<!--- List of Divisions: ---></td>
    <td width="70%">
		<select name="s_DivisionList" onchange="f_onChngDivisionList(this.value)"  style="width: 350px;">
			<option value="E/V">Office of International Visitors (E/V)</option><!--- (1013) --->
			<!--- <cfoutput query="spr_getListOfDivisions" startrow="1"> --->
			<!--- <option value="#uo_office_id#">#uo_office_symbol#&nbsp;&nbsp;&nbsp;(#uo_org_abbreviation#)&nbsp;&nbsp;(for debug:#uo_office_id#)</option> --->
			<!--- <option value="#uo_office_symbol#">#uo_office_symbol#&nbsp;&nbsp;&nbsp;(#uo_org_abbreviation#)&nbsp;&nbsp;(for debug:#uo_office_id#)</option> --->
			<!--- </cfoutput>  --->
		</select>
	</td>
</tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr>
	<td colspan="2">
		<cfinclude template="Include/inc_TableForProjectsSummary.cfm">
	</td>
</tr>
<!--- <tr><td colspan="2">&nbsp;</td></tr>
<tr>
	<td colspan="2" id="selectedBranchDetails">selectedBranchDetails</td>
</tr> --->
</table>
<!--- Begin ACTION PART ------------------------------------------------------->
<!--- <cfinclude template="JS/inc_ProjectsSummary.cfm"> --->
<script language="JavaScript">
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
function f_onChngDivisionList(argDivisionSymbol){with(self.document.forms[0])
{//alert(argDivisionSymbol)
	/* Functionality is based on the following:
		Determine the length of the string argDivisionSymbol:
		1. if it EQ to 3, means argument is passed to filter based on Entire Office Information (e.g. "E/V")
		2. if it EQ to 4, means argument is passed to filter based on Division in the Office (e.g. "E/VC")
	*/
	var vLengthOfSymbolName = argDivisionSymbol.length;//alert(vLengthOfSymbolName+"   "+argDivisionSymbol)
	//
	//1. Filter orgBufferPP based on argBranchID
	fBufferPP = new Array();
	fDistinctPOsInDos = new Array();
	var fp = 0;//-- filtered projects
	var dp = 0;//-- distinct projects
	//
	
	//
	for (var pp=0; pp<rowsPP; pp++)
	{
		//fBufferPP.length = 0;
		
		if ( argDivisionSymbol == orgBufferPP[pp].aPrjNum.substr(0,vLengthOfSymbolName) )
		{
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
				
			);
			fp++;
		}
	}// end of loop filtering based on Division Symbol
	//alert(fBufferPP.length)
	//
	
	//--------------------------------------------------------------------------
	//-- ACTIVE
	var vActNE_PrevFiscYear = 0;
	var vActPE_PrevFiscYear = 0;
	var vActE_PrevFiscYear = 0;
	var vActE_PrevFiscYearPercent = 0;
	var vActNE_CurrFiscYear = 0;
	var vActPE_CurrFiscYear = 0;
	var vActE_CurrFiscYear = 0;
	var vActE_CurrFiscYearPercent = 0;
	var vActE_TotalPercent = 0;
	//-- CLOSED
	var vCloNE_PrevFiscYear = 0;
	var vCloPE_PrevFiscYear = 0;
	var vCloE_PrevFiscYear = 0;
	var vCloE_PrevFiscYearPercent = 0;
	var vCloNE_CurrFiscYear = 0;
	var vCloPE_CurrFiscYear = 0;
	var vCloE_CurrFiscYear = 0;
	var vCloE_CurrFiscYearPercent = 0;
	var vCloE_TotalPercent = 0;
	//-- COMPLETED
	var vComNE_PrevFiscYear = 0;
	var vComPE_PrevFiscYear = 0;
	var vComE_PrevFiscYear = 0;
	var vComE_PrevFiscYearPercent = 0;
	var vComNE_CurrFiscYear = 0;
	var vComPE_CurrFiscYear = 0;
	var vComE_CurrFiscYear = 0;
	var vComE_CurrFiscYearPercent = 0;
	var vComE_TotalPercent = 0;
	//
	var vTotalPrjPrevFiscalYear = 0;
	var vTotalPrjCurrFiscalYear = 0;
	//--------------------------------------------------------------------------
	
	//
	//alert(fBufferPP.length)
	
	for (var i=0; i<fBufferPP.length; i++)
	{
		//alert(fBufferPP.length+"  "+i+"  "+fBufferPP[i].aPrjCurrentStatus)
		//
		if (fBufferPP[i].aPrjCurrentStatus == "ACT")
		{//alert(fBufferPP[i].aPrjCurrentStatus)
			if ( fBufferPP[i].aPrjFiscalYear == vPrevFiscalYear )
			{
				if ( fBufferPP[i].aEvalStatus == "NE" )
				{
					vActNE_PrevFiscYear++;
					//alert(vActNE_PrevFiscYear)
				}
				else if ( fBufferPP[i].aEvalStatus == "PE" )
				{
					vActPE_PrevFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "E" )
				{
					vActE_PrevFiscYear++;
				}
			}
			else if ( fBufferPP[i].aPrjFiscalYear == vCurrFiscalYear )
			{
				if ( fBufferPP[i].aEvalStatus == "NE" )
				{
					vActNE_CurrFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "PE" )
				{
					vActPE_CurrFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "E" )
				{
					vActE_CurrFiscYear++;
				}	
			}
		}
		else if (fBufferPP[i].aPrjCurrentStatus == "CLO")
		{
			if ( fBufferPP[i].aPrjFiscalYear == vPrevFiscalYear )
			{
				if ( fBufferPP[i].aEvalStatus == "NE" )
				{
					vCloNE_PrevFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "PE" )
				{
					vCloPE_PrevFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "E" )
				{
					vCloE_PrevFiscYear++;
				}
			}
			else if ( fBufferPP[i].aPrjFiscalYear == vCurrFiscalYear )
			{
				if ( fBufferPP[i].aEvalStatus == "NE" )
				{
					vCloNE_CurrFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "PE" )
				{
					vCloPE_CurrFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "E" )
				{
					vCloE_CurrFiscYear++;
				}	
			}
		}
		else if (fBufferPP[i].aPrjCurrentStatus == "COM")
		{
			if ( fBufferPP[i].aPrjFiscalYear == vPrevFiscalYear )
			{
				if ( fBufferPP[i].aEvalStatus == "NE" )
				{
					vComNE_PrevFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "PE" )
				{
					vComPE_PrevFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "E" )
				{
					vComE_PrevFiscYear++;
				}
			}
			else if ( fBufferPP[i].aPrjFiscalYear == vCurrFiscalYear )
			{
				if ( fBufferPP[i].aEvalStatus == "NE" )
				{
					vComNE_CurrFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "PE" )
				{
					vComPE_CurrFiscYear++;
				}
				else if ( fBufferPP[i].aEvalStatus == "E" )
				{
					vComE_CurrFiscYear++;
				}	
			}
		}
		//
		if ( fBufferPP[i].aPrjFiscalYear == vPrevFiscalYear )
		{
			vTotalPrjPrevFiscalYear++;
	
		}
		else if ( fBufferPP[i].aPrjFiscalYear == vCurrFiscalYear )
		{
			vTotalPrjCurrFiscalYear++;
		}
		//--------------------------------------------------------------
		
	}
	
	//alert(fBufferPP.length)
	
	//-----------------------------------------------------------------------------
	//function populateTable(){with(self.document.forms[0])
	//{//alert(vActNE_PrevFiscYear)
	//
	//-- Setting summary information about all applicable projects:
	of_innerHTML("idPrevFiscalYear", "'"+vPrevFiscalYear+"'");
	of_innerHTML("idCurrFiscalYear", "'"+vCurrFiscalYear+"'");
	//
	//------------------------------------------------------------------------------
	//ACT --------------------------------------------------------------------------
	//alert(vActNE_PrevFiscYear)
	of_innerHTML("idActNE_PrevFiscYear", "'"+vActNE_PrevFiscYear+"'");
	of_innerHTML("idActPE_PrevFiscYear", "'"+vActPE_PrevFiscYear+"'");
	of_innerHTML("idActE_PrevFiscYear", "'"+vActE_PrevFiscYear+"'");
	of_innerHTML("idActNE_CurrFiscYear", "'"+vActNE_CurrFiscYear+"'");
	of_innerHTML("idActPE_CurrFiscYear", "'"+vActPE_CurrFiscYear+"'");
	of_innerHTML("idActE_CurrFiscYear", "'"+vActE_CurrFiscYear+"'");
	//
	if( (parseInt(vActNE_PrevFiscYear)+parseInt(vActPE_PrevFiscYear)+parseInt(vActE_PrevFiscYear)) != 0 )
	{
		vActE_PrevFiscYearPercent = (parseInt(vActE_PrevFiscYear)*100)/(parseInt(vActNE_PrevFiscYear)+parseInt(vActPE_PrevFiscYear)+parseInt(vActE_PrevFiscYear))
		vActE_PrevFiscYearPercent = Math.round(vActE_PrevFiscYearPercent);
	}
	of_innerHTML("idActE_PrevFiscYearPercent", "'("+vActE_PrevFiscYearPercent+"%)'");
	//
	if ( (parseInt(vActNE_CurrFiscYear)+parseInt(vActPE_CurrFiscYear)+parseInt(vActE_CurrFiscYear)) != 0 )
	{
		vActE_CurrFiscYearPercent = (parseInt(vActE_CurrFiscYear)*100)/(parseInt(vActNE_CurrFiscYear)+parseInt(vActPE_CurrFiscYear)+parseInt(vActE_CurrFiscYear))
		vActE_CurrFiscYearPercent = Math.round(vActE_CurrFiscYearPercent);
	}
	of_innerHTML("idActE_CurrFiscYearPercent", "'("+vActE_CurrFiscYearPercent+"%)'");
	//
	of_innerHTML("idActNE_Total", "'"+parseInt(parseInt(vActNE_PrevFiscYear)+parseInt(vActNE_CurrFiscYear))+"'");
	of_innerHTML("idActPE_Total", "'"+parseInt(parseInt(vActPE_PrevFiscYear)+parseInt(vActPE_CurrFiscYear))+"'");
	of_innerHTML("idActE_Total", "'"+parseInt(parseInt(vActE_PrevFiscYear)+parseInt(vActE_CurrFiscYear))+"'");
	vActE_TotalPercent = parseInt(vActE_PrevFiscYearPercent + vActE_CurrFiscYearPercent);
	of_innerHTML("idActE_TotalPercent", "'("+vActE_TotalPercent+"%)'");
	//------------------------------------------------------------------------------
	//CLO
	of_innerHTML("idCloNE_PrevFiscYear", "'"+vCloNE_PrevFiscYear+"'");
	of_innerHTML("idCloPE_PrevFiscYear", "'"+vCloPE_PrevFiscYear+"'");
	of_innerHTML("idCloE_PrevFiscYear", "'"+vCloE_PrevFiscYear+"'");
	of_innerHTML("idCloNE_CurrFiscYear", "'"+vCloNE_CurrFiscYear+"'");
	of_innerHTML("idCloPE_CurrFiscYear", "'"+vCloPE_CurrFiscYear+"'");
	of_innerHTML("idCloE_CurrFiscYear", "'"+vCloE_CurrFiscYear+"'");
	//
	if( (parseInt(vCloNE_PrevFiscYear)+parseInt(vCloPE_PrevFiscYear)+parseInt(vCloE_PrevFiscYear)) != 0 )
	{
		vCloE_PrevFiscYearPercent = (parseInt(vCloE_PrevFiscYear)*100)/(parseInt(vCloNE_PrevFiscYear)+parseInt(vCloPE_PrevFiscYear)+parseInt(vCloE_PrevFiscYear))
		vCloE_PrevFiscYearPercent = Math.round(vCloE_PrevFiscYearPercent);
	}
	of_innerHTML("idCloE_PrevFiscYearPercent", "'("+vCloE_PrevFiscYearPercent+"%)'");
	//
	if ( (parseInt(vCloNE_CurrFiscYear)+parseInt(vCloPE_CurrFiscYear)+parseInt(vCloE_CurrFiscYear)) != 0 )
	{
		vCloE_CurrFiscYearPercent = (parseInt(vCloE_CurrFiscYear)*100)/(parseInt(vCloNE_CurrFiscYear)+parseInt(vCloPE_CurrFiscYear)+parseInt(vCloE_CurrFiscYear))
		vCloE_CurrFiscYearPercent = Math.round(vCloE_CurrFiscYearPercent);
	}
	of_innerHTML("idCloE_CurrFiscYearPercent", "'("+vCloE_CurrFiscYearPercent+"%)'");
	//
	of_innerHTML("idCloNE_Total", "'"+parseInt(parseInt(vCloNE_PrevFiscYear)+parseInt(vCloNE_CurrFiscYear))+"'");
	of_innerHTML("idCloPE_Total", "'"+parseInt(parseInt(vCloPE_PrevFiscYear)+parseInt(vCloPE_CurrFiscYear))+"'");
	of_innerHTML("idCloE_Total", "'"+parseInt(parseInt(vCloE_PrevFiscYear)+parseInt(vCloE_CurrFiscYear))+"'");
	vCloE_TotalPercent = parseInt(vCloE_PrevFiscYearPercent + vCloE_CurrFiscYearPercent);
	of_innerHTML("idCloE_TotalPercent", "'("+vCloE_TotalPercent+"%)'");
	//------------------------------------------------------------------------------
	//COM
	of_innerHTML("idComNE_PrevFiscYear", "'"+vComNE_PrevFiscYear+"'");
	of_innerHTML("idComPE_PrevFiscYear", "'"+vComPE_PrevFiscYear+"'");
	of_innerHTML("idComE_PrevFiscYear", "'"+vComE_PrevFiscYear+"'");
	of_innerHTML("idComNE_CurrFiscYear", "'"+vComNE_CurrFiscYear+"'");
	of_innerHTML("idComPE_CurrFiscYear", "'"+vComPE_CurrFiscYear+"'");
	of_innerHTML("idComE_CurrFiscYear", "'"+vComE_CurrFiscYear+"'");
	//
	if( (parseInt(vComNE_PrevFiscYear)+parseInt(vComPE_PrevFiscYear)+parseInt(vComE_PrevFiscYear)) != 0 )
	{
		vComE_PrevFiscYearPercent = (parseInt(vComE_PrevFiscYear)*100)/(parseInt(vComNE_PrevFiscYear)+parseInt(vComPE_PrevFiscYear)+parseInt(vComE_PrevFiscYear))
		vComE_PrevFiscYearPercent = Math.round(vComE_PrevFiscYearPercent );
	}
	of_innerHTML("idComE_PrevFiscYearPercent", "'("+vComE_PrevFiscYearPercent+"%)'");
	//
	if ( (parseInt(vComNE_CurrFiscYear)+parseInt(vComPE_CurrFiscYear)+parseInt(vComE_CurrFiscYear)) != 0 )
	{
		vComE_CurrFiscYearPercent = (parseInt(vComE_CurrFiscYear)*100)/(parseInt(vComNE_CurrFiscYear)+parseInt(vComPE_CurrFiscYear)+parseInt(vComE_CurrFiscYear))
		vComE_CurrFiscYearPercent = Math.round(vComE_CurrFiscYearPercent);
	}
	of_innerHTML("idComE_CurrFiscYearPercent", "'("+vComE_CurrFiscYearPercent+"%)'");
	//
	of_innerHTML("idComNE_Total", "'"+parseInt(parseInt(vComNE_PrevFiscYear)+parseInt(vComNE_CurrFiscYear))+"'");
	of_innerHTML("idComPE_Total", "'"+parseInt(parseInt(vComPE_PrevFiscYear)+parseInt(vComPE_CurrFiscYear))+"'");
	of_innerHTML("idComE_Total", "'"+parseInt(parseInt(vComE_PrevFiscYear)+parseInt(vComE_CurrFiscYear))+"'");
	vComE_TotalPercent = parseInt(vComE_PrevFiscYearPercent + vComE_CurrFiscYearPercent);
	of_innerHTML("idComE_TotalPercent", "'("+vComE_TotalPercent+"%)'");
	//
	of_innerHTML("idTotalPrjPrevFiscalYear", "'"+vTotalPrjPrevFiscalYear+"'");
	of_innerHTML("idTotalPrjCurrFiscalYear", "'"+vTotalPrjCurrFiscalYear+"'");
	//
	of_innerHTML("idTotal", "'"+parseInt(parseInt(vTotalPrjPrevFiscalYear)+parseInt(vTotalPrjCurrFiscalYear))+"'");
	//}}
	
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
f_onChngDivisionList("E/V")
//------------------------------------------------------------------------------
</script>
<!--- <cfinclude template="JS/inc_ProjectsSummary.cfm"> --->

<!--- End ACTION PART --------------------------------------------------------->