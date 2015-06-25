<!--- DivisionInfo.cfm --->
<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>
<!--- --------------------------------------------------------------------- --->
<cfstoredproc procedure="PACK_EVAL.sp_getDivisionInfo" datasource="#client.DSN#" returncode="No">
	<!--- <cfprocparam type="In"  cfsqltype="CF_SQL_NUMERIC" variable="argDivisionID" value="#strUser.UserOfficeID#"  null="No"> --->
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getListOfDivisions" maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getPrjsInOffice" maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_FiscalYears"  maxrows="-1" variable="IgnoreThis">
	
	<cfprocresult name="spr_getListOfDivisions" resultset="1">
	<cfprocresult name="spr_getPrjsInOffice" resultset="2">
	<cfprocresult name="spr_FiscalYears" resultset="3">
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
<!--- 
<table cellspacing="2" cellpadding="2" border="0">
<tr>
    <td><a name="SummaryOfPrjs"></a><a href="#Details">Check Details (below)</a></td>
</tr>
</table>
 --->
<!--- --------------------------------------------------------------------- --->
<table cellspacing="2" cellpadding="2" border="0">
<tr><td colspan="2" align="right" id="navigateBelow">&nbsp;<!--- <a name="SummaryOfPrjs"></a><a href="#Details">Check Details (below)</a> ---></td></tr>
<tr>
    <td class="txtOutputTitle" align="right" width="30%">List of Divisions:</td>
    <td width="70%">
		<select name="s_BranchList" onchange="of_onChngDivisionList(this.value)"  style="width: 350px;">
			<option value="-1">[------------------ Select Division from the List ------------------]</option>
			<cfoutput query="spr_getListOfDivisions" startrow="1">
			<!--- <option value="#uo_office_id#">#uo_office_symbol#&nbsp;&nbsp;&nbsp;(#uo_org_abbreviation#)&nbsp;&nbsp;(for debug:#uo_office_id#)</option> --->
			<option value="#uo_office_symbol#">#UO_ORG_ABBREVIATION#&nbsp;&nbsp;&nbsp;(#uo_office_symbol#)</option><!--- &nbsp;&nbsp;(for debug:#uo_office_id#) --->
			</cfoutput> 
		</select>
	</td>
</tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr>
	<td colspan="2">
		<cfinclude template="Include/inc_TableForProjectsSummary.cfm">
	</td>
</tr>
<tr><td colspan="2" align="right" id="navigateTop">&nbsp;<!--- <a name="Details"></a><a href="#SummaryOfPrjs">Back to Summary (top)</a> ---></td></tr>
<tr>
	<td  colspan="2" id="selectedBranchDetails">&nbsp;</td>
</tr>
</table>
<!--- Begin ACTION PART ------------------------------------------------------->
<script language="JavaScript">
//
function of_onChngDivisionList(argOrgSymbol){with(self.document.forms[0])
{//alert(argOrgSymbol)
	
	if (argOrgSymbol == -1)
	{
		of_set_0_InVarsFoPrjSummary();
		of_populatePrjsSummary();
		
	}
	else
	{//alert(argOrgSymbol)
		of_filterPrjsInOffice(argOrgSymbol);
		of_set_0_InVarsFoPrjSummary();
		of_setVarsForPrjSummary();
		of_populatePrjsSummary();
	}
	
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_filterPrjsInOffice(argOrgSymbol){//alert(argOrgSymbol)

	fBufferPP = new Array();
	var fp = 0;//-- filtered projects
	for (var pp=0; pp<rowsPP; pp++)
	{//alert(argBranchSymbol+"   "+orgBufferPP[pp].aPrjNum.substr(0,5) )
		if ( argOrgSymbol == orgBufferPP[pp].aPrjNum.substr(0,4) )
		{//alert(argOrgSymbol+"   "+orgBufferPP[pp].aPrjNum )
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
			fp++;
			
			
		}
	}
	//alert(fBufferPP.length)
}//end of function of_filterPrjsInOffice()
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_setVarsForPrjSummary(){
	for (var fp=0; fp<fBufferPP.length; fp++)
	{
		if (fBufferPP[fp].aPrjCurrentStatus == "ACT")
		{
			if ( fBufferPP[fp].aPrjFiscalYear == vPrevFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vActNE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vActPE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vActE_PrevFiscYear++;
				}
			}
			else if ( fBufferPP[fp].aPrjFiscalYear == vCurrFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vActNE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vActPE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vActE_CurrFiscYear++;
				}	
			}
		}
		
		else if (fBufferPP[fp].aPrjCurrentStatus == "CLO")
		{
			if ( fBufferPP[fp].aPrjFiscalYear == vPrevFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vCloNE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vCloPE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vCloE_PrevFiscYear++;
				}
			}
			else if ( fBufferPP[fp].aPrjFiscalYear == vCurrFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vCloNE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vCloPE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vCloE_CurrFiscYear++;
				}	
			}
		}
		
		else if (fBufferPP[fp].aPrjCurrentStatus == "COM")
		{
			if ( fBufferPP[fp].aPrjFiscalYear == vPrevFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vComNE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vComPE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vComE_PrevFiscYear++;
				}
			}
			
			else if ( fBufferPP[fp].aPrjFiscalYear == vCurrFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vComNE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vComPE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vComE_CurrFiscYear++;
				}	
			}
			
		}
		//
		if ( fBufferPP[fp].aPrjFiscalYear == vPrevFiscalYear )
		{
			vTotalPrjPrevFiscalYear++;
	
		}
		else if ( fBufferPP[fp].aPrjFiscalYear == vCurrFiscalYear )
		{
			vTotalPrjCurrFiscalYear++;
		}
		
		//----------------------------------------------------------------------
	}//end of loop
}// end of function 
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_set_0_InVarsFoPrjSummary()
{
	//-- ACTIVE
	vActNE_PrevFiscYear = 0;
	vActPE_PrevFiscYear = 0;
	vActE_PrevFiscYear = 0;
	vActE_PrevFiscYearPercent = 0;
	vActNE_CurrFiscYear = 0;
	vActPE_CurrFiscYear = 0;
	vActE_CurrFiscYear = 0;
	vActE_CurrFiscYearPercent = 0;
	vActE_TotalPercent = 0;
	//-- CLOSED
	vCloNE_PrevFiscYear = 0;
	vCloPE_PrevFiscYear = 0;
	vCloE_PrevFiscYear = 0;
	vCloE_PrevFiscYearPercent = 0;
	vCloNE_CurrFiscYear = 0;
	vCloPE_CurrFiscYear = 0;
	vCloE_CurrFiscYear = 0;
	vCloE_CurrFiscYearPercent = 0;
	vCloE_TotalPercent = 0;
	//-- COMPLETED
	vComNE_PrevFiscYear = 0;
	vComPE_PrevFiscYear = 0;
	vComE_PrevFiscYear = 0;
	vComE_PrevFiscYearPercent = 0;
	vComNE_CurrFiscYear = 0;
	vComPE_CurrFiscYear = 0;
	vComE_CurrFiscYear = 0;
	vComE_CurrFiscYearPercent = 0;
	vComE_TotalPercent = 0;
	//
	vTotalPrjPrevFiscalYear = 0;
	vTotalPrjCurrFiscalYear = 0;
}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function of_populatePrjsSummary(){with(self.document.forms[0])
{
	//-- Setting summary information about all applicable projects:
	//of_innerHTML("idPrevFiscalYear", "'"+vPrevFiscalYear+"'");
	//of_innerHTML("idCurrFiscalYear", "'"+vCurrFiscalYear+"'");
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
	vPrjTotal = parseInt(vTotalPrjPrevFiscalYear) + parseInt(vTotalPrjCurrFiscalYear)
	of_innerHTML("idTotal", "'"+vPrjTotal+"'");
	//}
	
}}
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
</script>
<cfinclude template="JS/inc_ProjectsSummary.cfm">

<!--- End ACTION PART --------------------------------------------------------->