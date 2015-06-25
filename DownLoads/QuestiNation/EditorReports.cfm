<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><cfoutput>#local.ModuleName#</cfoutput></title>

<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllPrjsForReport#" output="spr_AllPrjsForReport">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_AllPrjsForReport")> --->

<script language="JavaScript">
//------------------------------------------------------------------------------
//APFR - All Projects For Reports
<cfwddx action="CFML2JS" input="#spr_AllPrjsForReport#" toplevelvariable="tlv_APFR">
var rowsAPFR = tlv_APFR.getRowCount();
if ( rowsAPFR != 0)
{
	function holdAPFR (aPrjID, aPrjName, aActInact)
	{ this.aPrjID = aPrjID;  
	  this.aPrjName = aPrjName;  
	  this.aActInact = aActInact; 
	}
	arrayAPFR = new Array();
	
	for (var p=0; p<rowsAPFR; p++)
	{ arrayAPFR[p] = new holdAPFR
	                        (
	                            tlv_APFR.prjid[p],
	                            tlv_APFR.prjname[p],
	                            tlv_APFR.actinact[p]
	                         )
	}
}
//------------------------------------------------------------------------------
var vValidationPassed = "NO";
var vPrjsCounter = 0;
function of_Submit(){with(self.document.forms[0]){
	for (var p=0; p<s_Prjs.options.length; p++)
	{
		if (s_Prjs.options[p].selected == true)
		{
			vValidationPassed = "YES";
			break;
		}
		
	}


	if (vValidationPassed == "YES")
    {
        for (var p=0; p<s_Prjs.options.length; p++)
		{
			if (s_Prjs.options[p].selected == true)
			{
				vLoopCounter = 1;
				vPrjsCounter += vLoopCounter;
				h_PrjsCounter.value = vPrjsCounter;
			}
		}
		
		action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=Report For Selected Projects";
        submit();
    }
	else if (vValidationPassed == "NO")
	{
		alert("Illegal operation.  Request denied.\n\nPlease make a valid Project selection.");
	}

}}
//------------------------------------------------------------------------------
</script>
</head>
<body>
<br>
<form name="f_ER" method="post" >
<!--- ** Project(s) where Prj. Manager(s) and at least one participants answered ** --->
<table align="center" width="70%" cellspacing="2" cellpadding="2" border="0">
	<td class="Teal9">
		The following list consists of projects where at least 25% of people assigned  
		had fully answered the Questionnaire.  Among them, there must be at least 
		one manager and one participant.
		<br><br>
		(To select/de-select multiple rows - hold 'Ctrl' key) 
	</td>
	<td>&nbsp;</td>
</tr>

<tr>
	<td width="60%">
		<input type="Hidden" name="h_PrjsCounter" default="0"> 
		<select name="s_Prjs" multiple size="10">
			<option></option>
		</select>
	</td>
	<td width="40%" class="Brown8">
	<input type="Radio" name="rb_Comments" title="With" value="withComments">
	With or
	<input type="Radio" name="rb_Comments" title="Without" value="withoutComments" checked>
	Without Comments
	<br><br>
	<!--- Graph presentation style:<br>
	&nbsp;&nbsp;<input type="Radio" name="rb_GraphStyle" title="Graph presentation style" value="bar" checked>Bar
	
	<br>
	&nbsp;&nbsp;<input type="Radio" name="rb_GraphStyle" title="Graph presentation style" value="horizontalBar" checked>Horizontal Bar
	<br> 
	
	&nbsp;&nbsp;<input type="Radio" name="rb_GraphStyle" title="Graph presentation style" value="line" checked>Line
	
	<br>
	&nbsp;&nbsp;<input type="Radio" name="rb_GraphStyle" title="Graph presentation style" value="pie">Pie
	 --->
	<br><br>
	<cfinclude template="cb_Report.cfm">
	</td>
</tr>
</table>
<!--- ** Project(s) where Prj. Manager(s) and at least one participants answered ** --->

<!--- ************** Buttons ********************************************** --->
<table align="center" width="70%" cellspacing="2" cellpadding="2" border="0">
<tr>
    <td align="right">
        <table cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_Menu.cfm"></td>
			<td><cfinclude template="cb_Reset.cfm"></td>
        </tr>
        </table>
    </td>
</tr>
</table>
<!--- ************** Buttons ********************************************** --->
</form>
</body>
</html>
<script language="JavaScript">
//of_InitialValue ("s_Prjs", -1, "== Make Selection ==", 0);

if (rowsAPFR > 0)
{
	//of_InitialValue ("s_Prjs", -1, "== Make Selection ==", 0);
	
	//var rowNum = 1;
	for (var p=0; p<rowsAPFR; p++)
	{
		optionP = new Option;
        optionP.value = arrayAPFR[p].aPrjID;
        optionP.text  = arrayAPFR[p].aPrjName+'  '+arrayAPFR[p].aActInact;
		self.document.forms[0].s_Prjs.options[p] = optionP;
        //self.document.forms[0].s_Prjs.options[rowNum] = optionP;
        //rowNum++;
	}
}
else
{
	of_InitialValue ("s_Prjs", -1, "== No Avalable Projects ==", 0);
}
</script>
