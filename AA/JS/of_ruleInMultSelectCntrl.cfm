<!--- of_ruleInMultSelectCntrl.cfm --->
<script language="javascript1.4" type="text/javascript">
function of_ruleInMultSelectCntrl(argCntrlName){with(self.document.forms[0])
{
	var vSelectedID = "";
	var vSelectedTxt = "";
	var vCountSelected = 0;
	var vCtrlName = argCntrlName;
	
	for ( var e=0; e<eval(vCtrlName+".options.length"); e++ )
	{
		if ( eval(vCtrlName+".options["+e+"].selected"))
		{
			vCountSelected++;
		}
		if (vCountSelected >= 2)
		{
			break;
		}
	}
	///
	for ( var e=0; e<eval(vCtrlName+".options.length"); e++ )
	{
		if ( eval(vCtrlName+".options["+e+"].selected") )
		{
			vSelectedID = eval(vCtrlName+".options["+e+"].value");
			if ( (vSelectedID == -1) && (vCountSelected > 1) )
			{
				eval(vCtrlName+".options["+0+"].selected = false");
			}
			else 
			{
				vSelectedTxt += eval(vCtrlName+".options["+e+"].text")+"; ";
			}
		}
	}
}}
</script>
