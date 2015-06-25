<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_browserSelection.js" type="text/javascript"></script>
<script src="JS/of_innerHTML.js" type="text/javascript"></script>


<cfwddx action="WDDX2CFML" input="#client.sprWDDX_getBranchProfile#" output="spr_getBranchProfile">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_getBranchPOStat#" output="spr_getBranchPOStat">

<table class="txtInfo" border="0" >
<tr><td colspan="3"><hr></td></tr>
<tr>
	<td colspan="3">Number of ...</td>
</tr>
<tr>
	<td width="40%">&nbsp;&nbsp;Program Officers:</td>
	<td width="5%" align="right">
		<cfoutput>#spr_getBranchProfile.NumOfPO#</cfoutput>
	</td>
	<td width="55%">&nbsp;</td>
</tr>

<tr>
	<td width="40%">&nbsp;&nbsp;Projects in your branch:</td>
	<td width="5%" align="right">
		<cfoutput>#spr_getBranchProfile.NumOfPrj#</cfoutput>
	</td>
	<td width="55%">&nbsp;</td>
</tr>

<tr>
	<td>&nbsp;&nbsp;Evaluated Projects:</td>
	<td width="5%" align="right">
		<cfoutput>#spr_getBranchProfile.NumOfE#</cfoutput>
	</td>
	<td width="55%">&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;&nbsp;Partially Evaluated Projects:</td>
	<td width="5%" align="right">
		<cfoutput>#spr_getBranchProfile.NumOfPE#</cfoutput>
	</td>
	<td width="55%">&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;&nbsp;Not Evaluated Projects:</td>
	<td width="5%" align="right">
		<cfoutput>#spr_getBranchProfile.NumOfNE#</cfoutput>
	</td>
	<td width="55%">&nbsp;</td>
</tr>
<!--- <tr><td colspan="3"><hr></td></tr> --->
</table>

<br><br>

<table cellspacing="2" cellpadding="2" border="1">
<tr><td colspan="5"><hr color="#800000" noshade></td></tr>
<tr class="txtTableHeader">
    <td  colspan="2" rowspan="3" align="center" width="40%">Program Officer Name</td>
    <td colspan="3" align="center" width="60%">Number of Projects</td>
</tr>
<tr>
    <td colspan="3"><hr color="#800000" noshade></td>
</tr>
<tr class="txtTableHeader">
    <td align="center" width="20%">Evaluated</td>
    <td align="center" width="20%">Partially Evaluated</td>
    <td align="center" width="20%">Not Evaluated</td>
</tr>
<tr>
    <td colspan="5"><hr color="#800000" noshade></td>
</tr>
<cfoutput query="spr_getBranchPOStat">
<tr class="txtTableCell">
	<td align="center" width="10%"><input type="Checkbox" value="0" name="cbx_#PO_ID#"></td>
	<!--- <td align="left" width="30%"><a href="mailto:#PO_EMail#" style="text-decoration: underline; color: ##990000;">#PO_Name#</a></td> --->
    <td align="left" width="30%" style="color: ##990000;">#PO_Name#</td>
	<td align="center" width="20%">#PO_E#</td>
    <td align="center" width="20%">#PO_PE#</td>
    <td align="center" width="20%">#PO_NE#</td>
</tr>
</cfoutput>
<tr><td colspan="5"><hr color="#800000" noshade></td></tr>
<tr class="txtTableHeader"><td colspan="5">
	<input type="Button" name="cb_Select" value="Select" onclick="selectForEMail(this.value);">&nbsp;&nbsp;
	<span id="idSelectForEMail">Click on button to SELECT all for E-Mail</span>
	<br><br>
	<input type="Button" name="cb_sendEMail" value="E-Mail" onclick="sendEMail();">&nbsp;&nbsp;
</td></tr>
</table>
<script language="JavaScript">
//------------------------------------------------------------------------------
of_browserSelection();
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

function sendEMail(){with(self.document.forms[0]){
	alert("send E-Mail")

}}
</script>