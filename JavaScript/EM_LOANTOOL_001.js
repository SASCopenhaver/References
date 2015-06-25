// Created by: Sergey Surikuv
// 03/2009
//EM_LOANTOOL_001.js
//
//Variable declaration:
var objChk = new ActiveXObject('microsoft.XMLDOM');
    objChk.async=false;
//
var vCalcLoan   = 0;
var vCalcReturn = 0;
//
//------------------------------------------------------------------------------------
function bodyOnLoad()
{
	f_getLoanReturnData();	
}// end of bodyOnLoad()
//
//-------------------------------------------------------------------------------------
function f_getLoanReturnData()
{
	 objChk.load('em_loantool_001_pkg.em_countLoanReturnItems?pSiteID='+currentSite);
	 //
	 var nodelist = objChk.getElementsByTagName('LOAN_RETURN');
	 // 0 - LOAN; 1 - RETURN;
	 if (objChk.parsed)
	 {
		 vCalcLoan   = nodelist(0).childNodes(0).text;
		 vCalcReturn = nodelist(0).childNodes(1).text;
	 }
	 //
	 f_button_EnableDisable(vCalcLoan,   "cb_Loan");
	 f_button_EnableDisable(vCalcReturn, "cb_Return");
} // end of f_getLoanReturnData()
//
//------------------------------------------------------------------------------------
function f_button_EnableDisable(arg_ItemCount, arg_ButtonName){with(self.document.forms[0])
{
	if (arg_ItemCount == 0)
	{
		eval(arg_ButtonName+".disabled=true");
	}
	else
	{
		eval(arg_ButtonName+".disabled=false");
	}
}} // end of f_button_EnableDisable() and with()
//
//-------------------------------------------------------------------------------------
//
function f_LoanTools()
{
	openSwilWin('EM_LOANTOOL_CATALOG');
}
//
//-------------------------------------------------------------------------------------
function f_Return()
{
	openSwilWin('EM_LOANTOOL_RETURN');
}
//
//-------------------------------------------------------------------------------------
function f_closeTool(){with(self.document.forms[0])
{
	self.close();
}}