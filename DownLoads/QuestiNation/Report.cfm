<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="JavaScript">
function of_ExpandOrColapse(argObjID, argOpener)
{
	if (argObjID.style.display == 'none')
	{
		// Show text
		argObjID.style.display = '';
		argOpener.innerHTML = 'Close';
	}
	else
	{
		// Hide text
		argObjID.style.display = 'none';
		argOpener.innerHTML = 'Open';
	}
}
</script>
<html>
<head>
<title><cfoutput>#local.ModuleName#</cfoutput></title>

<cfwddx action="WDDX2CFML" input="#client.sprWDDX_Report_Mngrs_VS_Parts#" output="spr_Report_Mngrs_VS_Parts">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_Report_Average#" output="spr_Report_Average">
<cfif #client.WithWithoutCommnts# EQ "withComments">
	<cfwddx action="WDDX2CFML" input="#client.sprWDDX_getComments#" output="spr_getComments">
</cfif>
<!--- <cfset temp = DeleteClientVariable("sprWDDX_Report")> --->

<script language="JavaScript">
/*
'OPP'- Organizational/Personal Pride
'PE' - Performance/Excelence
'TC' - Teamwork/Communication
'LS' - Leadership/Supervision
'PCE'- Profitability/Cost Effectiveness
'CAR'- Colleague/Associate Relations
'CCR'- Customer/Client Relations
'IC' - Innovativeness/Creativity
'TD' - Training/Development
'CO' - Candor/Openness
*/
function of_OpenPrintWin(argMngrVSPart_OR_Avrg, argPrjID, argWithWithoutCommnts)
{
	//alert(argMngrVSPart_OR_Avrg+"  "+argPrjID+"  "+argWithWithoutCommnts)
	var popupPage = "popupReportPrint.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlMngrVSPart_OR_Avrg="+argMngrVSPart_OR_Avrg+"&urlPrjID="+argPrjID+"&urlWithWithoutCommnts="+argWithWithoutCommnts;
	var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=550,height=230','yes');
	if ((document.window != null) && (!popupWin.opener))
    {
		popupWin.opener = document.window;
    }
}
</script>


</head>

<body>

<form name="f_Report" method="post">


<table align="center" border="0" width="80%">
	<tr>
		<td class="Teal10" align="center">
			<strong>Average Manager(s) VS Average Participants</strong>
		</td>
	</tr>
	
<cfloop index = "iPrjID" list = #client.ListOfPrjIDs# delimiterS = ",">
	<tr>
		<!--- Graph for Managers VS Participants --->
		<td align="center">
		<cfloop query = "spr_Report_Mngrs_VS_Parts">
			<cfif #iPrjID# EQ #PrjID#>
				<cfinclude template="graphBar_Mngrs_VS_Parts.cfm"><br>
			</cfif>
	    </cfloop>
		</td>
	</tr>
	<tr>
		<td align="right">
			<cfinclude template="cb_PrintPreviewMP.cfm">
		</td>
	</tr>
	<tr>
		<td class="Teal10" align="center">
			<hr width="70%" color="Teal" size="1">
		</td>
	</tr>
	<!--- Graph for Average ---------------- --->
	<tr>
		<td class="Teal10" align="center">
			<strong>Average for the group</strong>
		</td>
	</tr>
	<tr>
		<td align="center">
		<cfloop query = "spr_Report_Average">
			<cfif #iPrjID# EQ #PrjID#>
				<cfinclude template="graphBar_Average.cfm"><br>
			</cfif>
		</cfloop>
		</td>
		
	</tr>
	<tr>
		<td align="right">
			<cfinclude template="cb_PrintPreviewA.cfm">
		</td>
	</tr>

	<cfif #client.WithWithoutCommnts# EQ "withComments">
	<tr>
		<td width="50%" align="right">
		<table border="0">
			<tr>
			<td>
				<font class="Teal8">Click to <strong><span id="idOpener<cfoutput>#iPrjID#</cfoutput>">Open</span></strong> Comments</font>
				<a href="javascript: of_ExpandOrColapse(instr<cfoutput>#iPrjID#</cfoutput>, idOpener<cfoutput>#iPrjID#</cfoutput>);">
				<img src="Img/cb_Notes_I.JPG" 
				     name="imgn"
					 border="0"
					 alt="Notes. Click on picture" 
					 title="Notes. Click on picture">
				</a>
			</td>
			<td>
				<cfinclude template="cb_PrintPreviewC.cfm">
			</td>
			</tr>		
		</table>
		
			
			
		</td>
	</tr>
	<tr id="instr<cfoutput>#iPrjID#</cfoutput>" style="display = 'none';">
		<td align="left" colspan="2">
			<table border="0" width="70%">
			<cfloop query = "spr_getComments">
				<cfif #iPrjID# EQ #PrjID#>
				<tr class="Brown9">
					<td>
					<cfoutput>#NormDescr#</cfoutput>
					</td>
				</tr>
				</cfif>
			</cfloop>
			</table>
		</td>
	</tr>
	</cfif>
	
	<tr>
		<td colspan="2">
			<hr color="#A52A2A" size="2" width="70%">
		</td>
	</tr>
	
</cfloop> 
</table>

<!--- ************** Buttons ********************************************** --->
<table align="center" width="70%" cellspacing="2" cellpadding="2" border="0">
<tr>
    <td align="right">
        <table cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_Menu.cfm"></td>
			<td><cfinclude template="cb_Back.cfm"></td>
		</tr>
        </table>
    </td>
</tr>
</table>
<!--- ************** Buttons ********************************************** --->
</form>
</body>
</html>
