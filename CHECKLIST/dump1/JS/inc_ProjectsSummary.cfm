<!--- inc_ProjectsSummary.cfm --->
<script language="JavaScript">
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
vPrjTotal = parseInt(vTotalPrjPrevFiscalYear) + parseInt(vTotalPrjCurrFiscalYear)
of_innerHTML("idTotal", "'"+vPrjTotal+"'");
//}}
</script>