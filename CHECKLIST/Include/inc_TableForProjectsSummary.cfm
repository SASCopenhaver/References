<!--- inc_TableForProjectsSummary.cfm --->
<!--- <cfoutput>#client.ModuleName##</cfoutput> --->
<cfif #client.ModuleName# EQ "Branch Information">
	<cfset local.classColor1 = "txtTableHeader">
	<cfset local.classColor2 = "txtTableCell">
<cfelseif #client.ModuleName# EQ "Personal Project Evaluation">
	<cfset local.classColor1 = "txtTableCell">
	<cfset local.classColor2 = "txtTableHeader">
<cfelseif #client.ModuleName# EQ "Division Information">
	<cfset local.classColor1 = "txtTableCell">
	<cfset local.classColor2 = "txtTableHeader">
<cfelseif #client.ModuleName# EQ "Office Information">
	<cfset local.classColor1 = "txtTableCell">
	<cfset local.classColor2 = "txtTableHeader">
</cfif>

<cfif #client.ModuleName# EQ "Branch Information" OR #client.ModuleName# EQ "Personal Project Evaluation">
<table>
<tr><td colspan="2" align="right" id="navigateBelow">&nbsp;<!--- <a name="SummaryOfPrjs"></a><a href="#Details">Check Details (below)</a> ---></td></tr>
</table>
</cfif>
 
<table bgcolor="#EEDDB2" cellspacing="4" cellpadding="1" border="0">
<tr><td colspan="8"><hr color="#800000" noshade></td></tr>
<tr><td colspan="8" class="<cfoutput>#local.classColor1#</cfoutput>">SUMMARY OF PROJECT EVALUATION</td></tr>
<tr>
    <td colspan="8"><hr color="#800000" noshade></td>
</tr>
<cfoutput>
<tr>
    <td rowspan="3" align="center" class="#local.classColor1#" width="14%"><br>Current Status</td>
    <td rowspan="3" align="center" class="#local.classColor1#" width="20%"><br>Evaluation Status</td>
    <td colspan="2" align="center" class="#local.classColor1#"  width="22%">Fiscal Year</td>
    <td colspan="2" align="center" class="#local.classColor1#"   width="22%">Fiscal Year</td>
    <td rowspan="3" colspan="2" align="center" class="#local.classColor1#" width="22%"><br>Total</td>
</tr>
</cfoutput>
<tr>
    <td colspan="2"><hr color="#800000" noshade></td>
	<td colspan="2"><hr color="#800000" noshade></td>
</tr>
<cfoutput>
<tr>
    <td colspan="2" align="center" class="#local.classColor1#"><span id="idPrevFiscalYear">&nbsp;</span></td>
    <td colspan="2" align="center" class="#local.classColor1#"><span id="idCurrFiscalYear">&nbsp;</span></td>
</tr>
</cfoutput>
<tr>
    <td colspan="8"><hr color="#800000" noshade></td>
</tr>
<cfoutput>
<tr>
    <td rowspan="3" class="#local.classColor1#">Active</td>
    <td class="#local.classColor1#">Not Evaluated</td>
    <td class="#local.classColor2#" align="center" width="11%"><span id="idActNE_PrevFiscYear">&nbsp;</span></td>
	<td class="#local.classColor2#" align="center" width="11%"><span id="">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center" width="11%"><span id="idActNE_CurrFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center" width="11%">&nbsp;</td>
    <td class="#local.classColor2#" align="center" width="11%"><span id="idActNE_Total">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center" width="11%">&nbsp;</td>
</tr>
<tr>
    <td class="#local.classColor1#">Partially Evaluated</td>
    <td class="#local.classColor2#" align="center"><span id="idActPE_PrevFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
    <td class="#local.classColor2#" align="center"><span id="idActPE_CurrFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
    <td class="#local.classColor2#" align="center"><span id="idActPE_Total">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="#local.classColor1#">Evaluated</td>
    <td class="#local.classColor2#" align="center"><span id="idActE_PrevFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idActE_PrevFiscYearPercent">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idActE_CurrFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idActE_CurrFiscYearPercent">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idActE_Total">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idActE_TotalPercent">&nbsp;</span></td>
</tr>
</cfoutput>
<tr>
    <td colspan="8"><hr color="#800000" noshade></td>
</tr>
<cfoutput>
<tr>
    <td rowspan="3" class="#local.classColor1#">Closed</td>
    <td class="#local.classColor1#">Not Evaluated</td>
    <td class="#local.classColor2#" align="center"><span id="idCloNE_PrevFiscYear">&nbsp;</span></td>
	<td class="#local.classColor2#" align="center"><span id="">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idCloNE_CurrFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
    <td class="#local.classColor2#" align="center"><span id="idCloNE_Total">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="#local.classColor1#">Partially Evaluated</td>
    <td class="#local.classColor2#" align="center"><span id="idCloPE_PrevFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
    <td class="#local.classColor2#" align="center"><span id="idCloPE_CurrFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
    <td class="#local.classColor2#" align="center"><span id="idCloPE_Total">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="#local.classColor1#">Evaluated</td>
    <td class="#local.classColor2#" align="center"><span id="idCloE_PrevFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idCloE_PrevFiscYearPercent">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idCloE_CurrFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idCloE_CurrFiscYearPercent">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idCloE_Total">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idCloE_TotalPercent">&nbsp;</span></td>
</tr>
</cfoutput>
<tr>
    <td colspan="8"><hr color="#800000" noshade></td>
</tr>
<cfoutput>
<tr>
    <td rowspan="3" class="#local.classColor1#">Completed</td>
    <td class="#local.classColor1#">Not Evaluated</td>
    <td class="#local.classColor2#" align="center"><span id="idComNE_PrevFiscYear">&nbsp;</span></td>
	<td class="#local.classColor2#" align="center"><span id="">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idComNE_CurrFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
    <td class="#local.classColor2#" align="center"><span id="idComNE_Total">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="#local.classColor1#">Partially Evaluated</td>
    <td class="#local.classColor2#" align="center"><span id="idComPE_PrevFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
    <td class="#local.classColor2#" align="center"><span id="idComPE_CurrFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
    <td class="#local.classColor2#" align="center"><span id="idComPE_Total">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center">&nbsp;</td>
</tr>
<tr>
    <td class="#local.classColor1#">Evaluated</td>
    <td class="#local.classColor2#" align="center"><span id="idComE_PrevFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idComE_PrevFiscYearPercent">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idComE_CurrFiscYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idComE_CurrFiscYearPercent">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idComE_Total">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idComE_TotalPercent">&nbsp;</span></td>
</tr>
</cfoutput>
<tr>
    <td colspan="8"><hr color="#800000" noshade></td>
</tr>
<cfoutput>
<tr>
    <!--- <td class="#local.classColor2#" align="center">&nbsp;</td> --->
    <td class="#local.classColor1#" align="right" colspan="2">TOTAL:</td>
    <td class="#local.classColor2#" align="center"><span id="idTotalPrjPrevFiscalYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idTotalPrjCurrFiscalYear">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="idTotal">&nbsp;</span></td>
    <td class="#local.classColor2#" align="center"><span id="">&nbsp;</span></td>
</tr>
</cfoutput>
<tr><td colspan="8"><hr color="#800000" noshade></td></tr>
<!--- <tr><td colspan="8">&nbsp;</td></tr> --->
</table>
