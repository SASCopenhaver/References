//  JavaScript Document EM_BULLETIN_EDITOR.js
//  /u00/oracle/product/10gias/pemars/

// VARIABLE DECLARATION starts =========================================================================
var v_currentSite = currentSite;
var v_currentUser = currentUser;
//
var v_Out = "";
var v_EmptyStr = " ";
//
var v_Desh = "-";
//
var v_DefaultValue = "-1";
//
var v_ValidationPassed = "YES";
//
var objAJAX = new ActiveXObject("microsoft.XMLDOM");
    objAJAX.async=false;
var v_ArrayOfRecords = new Array();
var v_ArrayOfValuesInRecord = new Array();
var v_NumberOfRecords = 0;
//
var v_CtrlName  = "";
var v_CtrlID    = "";
var v_CtrlType  = "";
var v_CtrlValue = "";
var v_CtrlText  = "";
var v_CtrlAlt   = "";
var v_CtrlSize  = 0;

var v_CtrlValueLength = 0;
var v_Char      = "";
//
var v_NextCtrlName = "";
//
var v_VerbCode = "0";
var v_NounCode = "0";
var v_ActionCode_Default = "&nbsp;&nbsp;&nbsp;\"Action Code\" (3 characters) consists of \"Verb\" (1 character) and \"Noun\" (2 characters) codes.";
//
var v_ValidationPassed = "YES";
//------------------------------------------------------------------------------------------------------

var objRegExp_Date = /^(?=\d)(?:(?:(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})|(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))|(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2}))($|\ (?=\d)))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
//
var objRegExp_onlyNumeric = /(^-?\d\d*$)/;

var objRegExp_onlyAlpha = /^([a-zA-Z_-]+)$/;

var objRegExp_onlyAlphaNumeric = /^([a-zA-Z0-9_-]+)$/;
//------------------------------------------------------------------------------------------------------
var NoteSpaser = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
var v_Date = new Date;
var v_FiscalYr = v_Date.getFullYear();
	// This year is a calendar year and specified ONLY as a default value.
	// An actual Fiscal year is obtained in f_getFiscalYear();
//------------------------------------------------------------------------------------------------------
// Today's Date:	
var currentTime = new Date()
var month = currentTime.getMonth() + 1
var day = currentTime.getDate()
var year = currentTime.getFullYear()
var v_TodayDate = month + "/" + day + "/" + year;

var v_DefaultFind_DateFrom = v_TodayDate;
var v_DefaultFind_DateTo   = v_TodayDate;

var v_Bulletin_Ptr = 0;
//----------------------------------------------------------------------------------------------------
orgBfr_BulletinList = new Array();
function array_BulletinList ( a_bulletin_ptr,
							  a_modification_no,
							  a_date_issued,
							  a_date_due,
							  a_soft_ver,
							  a_wo_desc,
							  a_nsn,
							  a_acronym,
							  a_class_code,
							  a_wo_t_updated  )
{
	this.a_bulletin_ptr = a_bulletin_ptr;
	this.a_modification_no = a_modification_no;
	this.a_date_issued = a_date_issued;
	this.a_date_due = a_date_due;
	this.a_soft_ver = a_soft_ver;
	this.a_wo_desc = a_wo_desc;
	this.a_nsn = a_nsn;
	this.a_acronym = a_acronym;
	this.a_class_code = a_class_code;
	this.a_wo_t_updated = a_wo_t_updated;
}
//------------------------------------------------------------------------------------------------------
// VARIABLE DECLARATION ends ===========================================================================
//
// GENERIC FUNCTION starts =============================================================================

function of_Trim(s) {//***
  s = s.replace(/(^\s*)|(\s*$)/gi,"");
  s = s.replace(/[ ]{2,}/gi," ");
  s = s.replace(/\n /,"\n");
  return s;
}

function of_LPad(arg_StrToSize, arg_PadLength, arg_PadChar)
{
// Arguments:
// StrToSize - String to be Padded
// PadLength -Length of the string after padding
// PadChar - Character to be Padded if the String is length is lesser then PadLength

   var v_PaddedString=arg_StrToSize.toString();
   for(i=arg_StrToSize.length+1; i<=arg_PadLength; i++)
   {
	   v_PaddedString=arg_PadChar+v_PaddedString;
   }
   return v_PaddedString;
}
//-----------------------------------------------------------------------------------------------------
function of_RPad(arg_StrToSize, arg_Max_Str_Length, arg_PadChar)
{//alert(arg_StrToSize.length+"  "+arg_Max_Str_Length+"  "+arg_PadChar)
// Arguments:
// StrToSize - String to be Padded
// PadLength -Length of the string after padding
// PadChar - Character to be Padded if the String is length is lesser then PadLength

   var v_StrLength = parseInt(arg_Max_Str_Length);
   var v_PaddedString=arg_StrToSize.toString();

   for(i=0; i< parseInt(v_StrLength) - parseInt(arg_StrToSize.length); i++)
   {
	   v_PaddedString=v_PaddedString+arg_PadChar;
   }
   return v_PaddedString;
}
//---------------------------------------------------------------------------------------------------
function of_outPut(arg_WhereOutput, arg_WhatOutput){with(self.document.forms[0])
{//TEST: alert(arg_WhereOutput+" {} "+ arg_WhatOutput)
  	document.getElementById(arg_WhereOutput).innerHTML = arg_WhatOutput;
}}
//---------------------------------------------------------------------------------------------------
function of_setSingleValue(arg_CtrlName, arg_Value, arg_Text, arg_ZeroLength_YesNo, arg_Pos){with(self.document.forms[0])
{
  //TEST:
  //if ( arg_CtrlName==""){alert(arg_CtrlName+"  "+arg_Value+"  "+arg_Text+"  "+arg_ZeroLength_YesNo+"  "+arg_Pos)}
  //
///////////////////////////////////////////////////////////////////////////////
//
//  arg_CtrlName         - Control Name;
//  arg_Value            - Value (for "select-one" and "text")
//  arg_Text             - Text  (for "select-one")
//  arg_ZeroLength_YesNo - To set the length of the <options> to "0" (YES / NO)
//  arg_Pos              - Position in <options> (for "select-one")
//
///////////////////////////////////////////////////////////////////////////////
  //
  var v_CtrlType = "";
  //
  for (var e=0; e<elements.length; e++)
  {
	  if (elements[e].name == arg_CtrlName)
	  {
		  v_CtrlType = elements[e].type;
		  break;
	  }
  }
  //

  switch (v_CtrlType)
  {
	  //
	  case "select-one":
		  //
		  if (arg_ZeroLength_YesNo == "YES")
		  {
			  eval(arg_CtrlName+".options.length = 0");
		  }
		  //
		  optionX = new Option;
		  optionX.value = arg_Value;
		  //optionX.style = ""
		  //optionX.text  = "("+arg_Value+")  "+arg_Text;
		  optionX.text  = arg_Text;
		  eval(arg_CtrlName+".options["+arg_Pos+"] = optionX");
		  //
	  break;
	  //
	  case "text":
	  	  eval(arg_CtrlName+".value = "+arg_Value);
	  break;
	  //
	  case "textarea":
	      eval(arg_CtrlName+".value = "+arg_Value);
	  break;
	  //
  }
  //
}}
//-------------------------------------------------------------------------------------------------

function of_selectRecord(arg_CtrlName, arg_Value){with(self.document.forms[0])
{
  var v_IsMatched = "NO";
  var v_CtrlAlt = "";
  //
  for (var i=0; i<eval(arg_CtrlName+".options.length"); i++)
  {
	  if (eval(arg_CtrlName+".options["+i+"].value") == arg_Value)
	  {
		  //
		  eval(arg_CtrlName+".options["+i+"].selected=true");
		  //
		  v_IsMatched = "YES";
		  //
		  break;
	  }
  }
  //
  if (v_IsMatched == "NO")
  {
	  for (var e=0; e<elements.length; e++)
	  {
		  if (elements[e].name == arg_CtrlName)
		  {
			  v_CtrlAlt = elements[e].name.substr(6);
			  break;
		  }
	  }
	 //
	  alert("Searched value could not be found.\nPlease report to the help desk.")
  }
}}
//-----------------------------------------------------------------------------------------------
function of_getCtrlProperties(arg_CtrlName){with(self.document.forms[0])
{
	  v_CtrlName = arg_CtrlName;
	  v_CtrlID   = eval(v_CtrlName+".id");
	  v_CtrlType = eval(v_CtrlName+".type");
	  v_CtrlAlt  = eval(v_CtrlName+".alt");
	  v_CtrlSize = eval(v_CtrlName+".size");
	  
	  //
	  if (v_CtrlType == "select-one")
	  {
		 v_CtrlValue = eval(v_CtrlName+".options["+v_CtrlName+".options.selectedIndex].value");
		 v_CtrlText  = eval(v_CtrlName+".options["+v_CtrlName+".options.selectedIndex].text");
	  }
	  else if (v_CtrlType == "text" || v_CtrlType == "textarea")
	  {
		 v_CtrlValue = eval(v_CtrlName+".value");
		 
	  }
	  else
	  {
		  v_CtrlValue = "";
	  }
}}
//-----------------------------------------------------------------------------------------
function of_isDateFormated(arg_Date) {
//Function validates the following format: MM/DD/YYYY
   var re = /^\d{1,2}\/\d{1,2}\/\d{4}$/
   if (re.test(arg_Date)) {
      var dArr = arg_Date.split("/");
      var d = new Date(arg_Date);
      return d.getMonth() + 1 == dArr[0] && d.getDate() == dArr[1] && d.getFullYear() == dArr[2];
   }
   else {
      return false;
   }
}
//-----------------------------------------------------------------------------------------
function of_validateDate(v_CtrlName){with(self.document.forms[0])
{
	  var v_RtnVal = "YES";
	  
	  //------------------------------------------------
	  if (objRegExp_Date.test(v_CtrlValue) == false)	
	  {//1.4.1
		  alert("System cannot process your request.\nDate in the field '"+v_CtrlAlt+"' has not been properly formatted.");
		  v_RtnVal = "NO";
		  eval(v_CtrlName+".focus()");
	  }//1.4.1
	  //
	  //------------------------------------------------
	  if (v_RtnVal == "YES" && !of_isDateFormated(v_CtrlValue))
	  {//1.4.2
		  alert("System cannot process your request.\nDate in the field '"+v_CtrlAlt+"' has not been properly formatted.");
		  v_RtnVal = "NO";
		  eval(v_CtrlName+".focus()");	
	  }//1.4.2
	  //----------------------------------------------- 
	  
	  return v_RtnVal;
			
}}
//-----------------------------------------------------------------------------------------
function of_roundNumber(arg_NumToBeRounded, arg_DecimalLength) 
{ // Arguments: number to round, number of decimal places
   var v_RoundedNumber = Math.round(arg_NumToBeRounded*Math.pow(10,arg_DecimalLength))/Math.pow(10,arg_DecimalLength);
   
   return v_RoundedNumber;
 }
//-----------------------------------------------------------------------------------------
// GENERIC FUNCTIONS end ===================================================================
//
//
// PAGE SPECIFIC FUNCTIONS start ===========================================================
//==========================================================================================
//// OBTAINING, SETTING default values start:
//==========================================================================================
function f_PageStyle(){
	v_Out = 
"<style type=\"text/css\">"+
	//--------------------------------------------------------------------------------------
	".c_EditorSectionName{"+
				"font-weight:bold;"+
				"font-size:11px;"+
				"font-family:\"Verdana, Geneva, sans-serif\";"+	
	"}"+
	//--------------------------------------------------------------------------------------
	".c_CtrlName{"+
				"font-weight:normal;"+
				"font-size:10px;"+
				"font-family:\"Verdana, Geneva, sans-serif\";"+
	"}"+
	//--------------------------------------------------------------------------------------
	".c_CtrlValue{"+
				"font-weight:normal;"+
				"font-size:10px;"+
				"font-family:\"Courier New\",Courier, monospace\";"+
	"}"+
	//--------------------------------------------------------------------------------------
	".c_TblHeader{"+
				"font-weight:bold;"+
				"font-size:20px;"+
				"face:\"Courier New\",Courier, monospace\";"+
				//"color:#FFFFFF;"+
	"}"+
	//--------------------------------------------------------------------------------------
	".c_NoteText{"+
				"font-weight:normal;"+
				"font-size:10px;"+
				"font-family:\"Verdana, Geneva, sans-serif\";"+
	"}"+
	//--------------------------------------------------------------------------------------
	".c_NoteRed{ "+
				 "font-weight:normal;"+
				 "font-size:10px;"+
				 "font-family:Verdana, Geneva, sans-serif;"+
			 	 "color:#FF0000;"+
	"}"+
	//--------------------------------------------------------------------------------------
	"TABLE { background-color: #DFC184; border: 0px outset white; font-weight: bold; font-size: 12px; }"+
	//--------------------------------------------------------------------------------------
	//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	".emars_button {display:block;width:100px;height:20px;text-indent:-9999px;}"+
	".emars_button a {display:block;width:100%;height:100%;background:url('/emars-img/cb_eMARS_S.png') no-repeat top left;outline:none;}"+
	".emars_button a:hover {background-position:0 -20px;}"+
	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	//--------------------------------------------------------------------------------------
"</style>";
	document.write(v_Out);
}
f_PageStyle();
//==========================================================================================
function f_getFiscalYear()
{
	objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_getFiscalYear');
	
	if (objAJAX.parsed)
	{
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length;
		//TEST: alert(v_NumberOfRecords);
		
		for (var r=0; r<v_NumberOfRecords; r++)
        {//1.2.1
            v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
           
            v_FiscalYr = v_ArrayOfValuesInRecord[0].text; //CURRENT_FISCAL_YEAR
        }//1.2.1
	}
}
f_getFiscalYear();
//==========================================================================================
function f_getDefaultFindDates()
{
	objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_getDefaultDates');

	if (objAJAX.parsed)
	{
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length;
		//TEST: alert(v_NumberOfRecords);
		
		for (var r=0; r<v_NumberOfRecords; r++)
        {//1.2.1
            v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
           
            v_DefaultFind_DateFrom = v_ArrayOfValuesInRecord[0].text;
			v_DefaultFind_DateTo   = v_ArrayOfValuesInRecord[1].text;
			////TEST: alert("from:  "+v_DefaultFind_DateFrom+"  to: "+v_DefaultFind_DateTo)
		}//1.2.1
	}
}
f_getDefaultFindDates();
//==========================================================================================
//// OBTAINING, SETTING default values end.
//==========================================================================================
//==========================================================================================
//// SETTIN-UP PAGE CONTROL start:
//==========================================================================================
function f_positionMainTbl()
{
	v_Out = 
"<table width=\"880px\" border=\"0\">"+
	  "<tr>"+
			"<td id=\"td_Find\">"+f_positionFindCtrls()+"</td>"+
	  "</tr>"+
	  "<tr>"+
			"<td id=\"td_ListOfBulletins\">"+f_positionListBulletins()+"</td>"+
	  "</tr>"+
	  "<tr>"+
			"<td id=\"td_BulletinDetails\">"+f_positionBulletinsDetails()+"</td>"+
	  "</tr>"+
	  "<tr>"+
			"<td id=\"td_Navigation\">"+f_positionNavigation()+"</td>"+
	  "</tr>"+
"</table>";
  
  return v_Out;
  
}
//===================================================================================
function f_positionFindCtrls()
{
   
   v_Out = 
   		"<table width=\"100%\" border=\"1\" style=\"background-color:#CCCCCC; border-style:none;\">"+
			"<tr>"+
				"<td>"+
				     "FIND RECORD"+
				"</td>"+
				"<td align=\"right\">"+
					 "<font color=\"#FF0000\">**</font> - <font class=\"c_CtrlName\" >Mandatory fields for finding bulletin</font>"+
				"</td>"+
				"<td>&nbsp;</td>"+
			"</tr>"+
			"<tr>"+
				"<td width=\"50%\" colspan=\"2\" class=\"c_CtrlName\">"+ 
					 //.......................................................................
					 "<font color=\"#FF0000\">**</font>"+
					 "Find bulletin(s) where 'Issue Date' is between"+
					 //......................................................................
					 "<input id=\"txt_Find_DateFrom\" name=\"txt_Find_DateFrom\" alt=\"Issue Date for the list of Bulletins\" "+
							 "size=\"10\" maxlength=\"10\" class=\"c_CtrlValue\" tabindex=\"1\" value=\"\" />"+
					 //......................................................................
					 " and "+
					 //........................................................................
					 "<input id=\"txt_Find_DateTo\" name=\"txt_Find_DateTo\" alt=\"Due Date for the list of Bulletins\" "+
							 "size=\"10\" maxlength=\"10\" class=\"c_CtrlValue\"  tabindex=\"2\"  value=\"\" />"+
					 //........................................................................
					 "&nbsp;&nbsp;&nbsp;Format: MM/DD/YYYY (ex: 01/02/"+v_FiscalYr+")"+
					 //"<br />"+					
				"</td>"+
				"<td align=\"center\" >"+
					  //.......................................................................
				      "<input type=\"button\" "+
							  "id=\"cb_RefreshListOfBulletins\" "+
							  "name=\"cb_RefreshListOfBulletins\" "+
							  "onclick=\"f_onClick(this.name)\" "+
							  "tabindex=\"3\" "+
							  "value=\"GET BULLETINS\" />"+
					  //.......................................................................
				"</td>"+
			"</tr>"+
			"<tr>"+
				"<td colspan=\"2\" valign=\"middle\" >"+
					//.......................................................................
					"<font class=\"c_CtrlName\" >"+
						"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
						"Find bulletin based on its number:</font>"+
					//.................................................................
					"<select id=\"sel_FindBulletin_Type\" "+
							  "name=\"sel_FindBulletinType\" "+
							  "size=\"1\" "+
							  "alt=\"Type\" "+
							  "tabindex=\"4\" "+
							  "class=\"c_CtrlValue\" "+
							  "onChange=\"f_onChange(this.name)\" "+
							  ">"+
						  "<option value=\""+v_DefaultValue+"\">_______ Select Bulletin Type _______</option>"+
						  "<option value=\"MMO\">(MMO)&nbsp;..Maintenance Management Order</option>"+
						  "<option value=\"MSB\">(MSB)&nbsp;..Maintenance Service Bulletin</option>"+
						  "<option value=\"MWO\">(MWO)&nbsp;.......Modification Work Order</option>"+
						  "<option value=\"SMO\">(SMO)&nbsp;...Software Modification Order</option>"+
					"</select>"+
					 //.......................................................................
					"&nbsp;-&nbsp;"+
					//.......................................................................
					"<input id=\"txt_FindBulletin_Num_Seq\" name=\"txt_FindBulletin_Num_Seq\" alt=\"Bulletin: Sequencial Number\" "+
						   "size=\"3\" maxlength=\"3\" class=\"c_CtrlValue\" "+
						   "onkeyup=\"f_onKeyUp(this.name);\" tabindex=\"5\" value=\"\" />"+
					//.......................................................................
					"&nbsp;-&nbsp;"+
					//.......................................................................
					"<input id=\"txt_FindBulletin_Year\" name=\"txt_FindBulletin_Year\" alt=\"Bulletin: Fiscal Year\" "+
						   "size=\"2\" maxlength=\"2\" class=\"c_CtrlValue\" tabindex=\"6\" "+
						   "value=\"\" onkeyup=\"f_onKeyUp(this.name);\" />"+
					//....................................................................... 
				"</td>"+
				//"<td>&nbsp;</td>"+
				"<td><p class=\"emars_button\"><a href=\"#null\" onclick=\"alert(this.name)\">Click this button</a></p></td>"+
			"</tr>"+
		"</table>";
//NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW 
	  v_Out = v_Out+"<br />"+
		"<table width=\"100%\" border=\"1\">"+
			  "<tr>"+
					"<td colspan=\"3\">1</td>"+
			  "</tr>"+
			  "<tr>"+
				"<td rowspan=\"2\">"+
					"<select id=\"sel_SearchBy\" "+
							  "name=\"sel_SearchBy\" "+
							  "size=\"1\" "+
							  "alt=\"Type\" "+
							  "tabindex=\"4\" "+
							  "class=\"c_CtrlValue\" "+
							  "onChange=\"f_onChange(this.name)\" "+
							  ">"+
						  "<option value=\""+v_DefaultValue+"\">_______ Select Search By _______</option>"+
						  "<option value=\"MMO\">(MMO)&nbsp;..Maintenance Management Order</option>"+
						  "<option value=\"MSB\">(MSB)&nbsp;..Maintenance Service Bulletin</option>"+
						  "<option value=\"MWO\">(MWO)&nbsp;.......Modification Work Order</option>"+
						  "<option value=\"SMO\">(SMO)&nbsp;...Software Modification Order</option>"+
					"</select>"+				
				"</td>"+
					"<td>3</td>"+
					"<td rowspan=\"2\">4</td>"+
			  "</tr>"+
			  "<tr>"+
					"<td rowspan=\"2\">5</td>"+
			  "</tr>"+
		"</table>";

		
		
//NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW NEW 		
		

	return v_Out;
}
//====================================================================================
function f_positionListBulletins()
{
   v_Out = 
   		"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+	
			"<tr>"+
				"<td>"+
					"LIST OF BULLETINS"+
					"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Records retrieved:&nbsp;&nbsp;"+
					"<span id=\"span_NumOfBulletins\"></span>"+
				"</td>"+
			"</tr>"+
		"</table>"+
		//........................................................................
		"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+	
			"<tr bgcolor=\"#999999\">"+
				"<td width=\"8%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"MODIF. NUM"+ <!--- "1 10 1" --->
					"</font>"+
				"</td>"+	
				"<td width=\"10%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"ISSUE DATE"+
					"</font>"+ <!--- "10_|_" --->
				"</td>"+
				"<td width=\"16%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"SOFTWARE VER"+<!--- "12_|_" --->
					"</font>"+ <!--- "10_|_" --->
				"</td>"+
				"<td width=\"34%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"WORK ORDER DESCR"+<!--- "" --->
					"</font>"+ <!--- "10_|_" --->
				"</td>"+
				"<td width=\"14%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"NSN"+<!--- "" --->
					"</font>"+ <!--- "10_|_" --->
				"</td>"+
				"<td width=\"10%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"ACRONYM"+<!--- "" --->
					"</font>"+ <!--- "10_|_" --->
				"</td>"+
				"<td class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"CLASS CD"+<!--- "" --->
					"</font>"+ <!--- "10_|_" --->
				"</td>"+
			"</tr>"+
			"<tr>"+
				"<td colspan=\"7\">"+
					  "<select id=\"sel_listOfBulletins\" "+
							  "name=\"sel_listOfBulletins\" "+
							  "size=\"8\" "+
							  "alt=\"List of bulletins\" "+
							  "tabindex=\"7\" "+
							  "onChange=\"f_onChange(this.name)\" "+
							  "style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
							  "class=\"c_CtrlValue\" "+
							  "selected=\"selected\"> "+
					  "</select>"+
				"</td>"+
			"</tr>"+
			
		"</table>";
		//............................................................................
	return v_Out;
}
//====================================================================================
function f_setHeader(arg_CtrlName){with(self.document.forms[0])
{
    switch(arg_CtrlName)
    {
        case "sel_listOfBulletins":
		
          	 var v_NumOfIterations = 0;
			 //
			 v_Desh = "-"; // 113 is used to create proportional length of the record.
			 for (var i=0; i<113; i++){v_Desh = v_Desh+"-";}
			 of_setSingleValue("sel_listOfBulletins", v_DefaultValue, "----------"+"CREATE NEW RECORD"+v_Desh, "YES",  0); 
			 //
			 v_NumOfIterations = sel_listOfBulletins[0].text.length - " Records retrieved: ".length - 5;
			 v_Desh = "-";
			 for (var i=0; i<v_NumOfIterations; i++){v_Desh = v_Desh+"-";} 
			 of_setSingleValue("sel_listOfBulletins", "-2", v_Desh+" Records retrieved: "+"0", "NO",  1);             
        
        break;
	}
}}
//====================================================================================
function f_positionCtrl_1()
{
	v_Out =
	"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\" valign=\"top\" width=\"15%\">"+
					"<font color=\"#FF0000\" >*</font>"+
					  "Type and Number:"+
				"</td>"+
				"<td valign=\"top\" width=\"30%\">"+
					  "<select id=\"sel_ModOrder_Type\" "+
							  "name=\"sel_ModOrder_Type\" "+
							  "size=\"5\" "+
							  "alt=\"Bulletin Type\" "+
							  "tabindex=\"8\" "+
							  "class=\"c_CtrlValue\" "+
							  "onChange=\"f_onChange(this.name)\" "+
							  ">"+
						  "<option value=\""+v_DefaultValue+"\">Select Bulletin Type </option>"+
						  "<option value=\"MMO\">(MMO)&nbsp;..Maintenance Management Order</option>"+
						  "<option value=\"MSB\">(MSB)&nbsp;..Maintenance Service Bulletin</option>"+
						  "<option value=\"MWO\">(MWO)&nbsp;.......Modification Work Order</option>"+
						  "<option value=\"SMO\">(SMO)&nbsp;...Software Modification Order</option>"+
					  "</select>"+
				"</td>"+
				"<td valign=\"top\" class=\"c_CtrlName\">"+
						  "<input id=\"txt_ModOrder_Num_Seq\" name=\"txt_ModOrder_Num_Seq\" alt=\"Bulletin: Sequencial Number\" "+
								 "size=\"3\" maxlength=\"3\" class=\"c_CtrlValue\" "+
								 "onkeyup=\"f_onKeyUp(this.name);\" tabindex=\"9\" value=\"\" />"+
						  "&nbsp;-&nbsp;"+
						  "<input id=\"txt_ModOrder_Year\" name=\"txt_ModOrder_Year\" alt=\"Bulletin: Fiscal Year\" "+
								 "size=\"2\" maxlength=\"2\" class=\"c_CtrlValue\" tabindex=\"10\" "+
								 "value=\"\" onkeyup=\"f_onKeyUp(this.name);\" />"+
				"</td>"+
				"<td valign=\"top\" class=\"c_CtrlName\">"+
						  "Format: 3 digits which is a sequencial number within a specific group"+
						  "<br />"+
						  " of Bulletins and 2 digits which represents Fiscal Year - "+ String(v_FiscalYr).substr(2,2)+"."+
				"</td>"+
		  "</tr>"+
	"</table>"+
	//..............................................................................
	"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+	  
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\" width=\"15%\" >"+
					 "<font color=\"#FF0000\" >*</font>"+
					 "Issue Date:"+
				"</td>"+
				"<td valign=\"top\" class=\"c_CtrlName\">"+
					"<input id=\"txt_ModOrder_Date_Issued\" name=\"txt_ModOrder_Date_Issued\" alt=\"Issue Date\" "+
						   "size=\"10\" maxlength=\"10\" class=\"c_CtrlValue\" tabindex=\"11\" value=\"\" />"+
					"&nbsp;&nbsp;&nbsp;Format: MM/DD/YYYY (ex: 01/02/"+v_FiscalYr+")"+
				"</td>"+				
		  "</tr>"+
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\" width=\"15%\" >"+
					 "<font color=\"#FF0000\" >&amp;</font>"+
					 "&nbsp;&nbsp;"+
					 "<font color=\"#FF0000\" >*</font>"+
					 "Due Date:"+
				"</td>"+				
				"<td valign=\"top\" class=\"c_CtrlName\">"+
					"<input id=\"txt_ModOrder_Date_Due\" name=\"txt_ModOrder_Date_Due\" alt=\"Due Date\" "+
						   "size=\"10\" maxlength=\"10\" class=\"c_CtrlValue\"  tabindex=\"12\"  value=\"\" />"+
					"&nbsp;&nbsp;&nbsp;Format: MM/DD/YYYY (ex: 01/02/"+v_FiscalYr+")"+
				"</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\" width=\"15%\" >"+
					"<span id=\"span_SoftVer_Asterisk\"></span>"+
					"<font class=\"c_CtrlName\" >Software version:</font>"+
				"</td>"+				
				"<td valign=\"top\">"+
					"<input id=\"txt_ModOrder_SoftVer\" name=\"txt_ModOrder_SoftVer\" alt=\"Software Version\" "+
						   "size=\"16\" maxlength=\"16\" class=\"c_CtrlValue\" value=\"\" tabindex=\"13\"/>"+
					"<font class=\"c_CtrlName\" >(for SMO only)</font>"+
				"</td>"+
		  "</tr>"+
	"</table>";
	//..............................................................................

	return v_Out;
}
//==================================================================================
function f_positionCtrl_2()
{
	v_Out = 
	"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
		//..........................................................................
		"<tr>"+
			"<td align=\"right\" width=\"15%\" >"+
				  "<font color=\"#FF0000\" >*</font>"+
				  "<font class=\"c_CtrlName\">Brief description:</font>"+
			"</td>"+ 
			"<td>"+
				  "<input class=\"c_CtrlValue\" id=\"txt_ModOrder_Descr\" name=\"txt_ModOrder_Descr\" alt=\"Brief Description\" "+
				  	     "size=\"35\" maxlength=\"35\" tabindex=\"14\" value=\"\" onkeyup=\"f_onKeyUpDescr(this.name);\"  />"+
				  "<span class=\"c_CtrlName\">Symbol counter:&nbsp;</span>"+
				  "<span class=\"c_CtrlName\" id=\"span_ModOrderStrLengthCounter\" >35</span>"+
				  "<span class=\"c_CtrlName\">&nbsp;of 35 available.</span>"+
				  "<br />"+
			"</td>"+ 
		"</tr>"+
		//.......................................................................... 
		"<tr>"+
			"<td class=\"c_CtrlName\" align=\"right\" valign=\"top\" width=\"15%\">"+
				"<font color=\"#FF0000\" >*</font>"+
				"Comments:"+
			"</td>"+
			"<td >"+
				"<textarea id=\"txa_ModOrder_Comments\" class=\"c_CtrlValue\" name=\"txa_ModOrder_Comments\" "+
					      "cols=\"38\" rows=\"3\" tabindex=\"15\" alt=\"Comments\" ></textarea>"+
			"</td>"+
		"</tr>"+
		//..........................................................................
		"<tr>"+
			"<td class=\"c_CtrlName\" align=\"right\" valign=\"top\" width=\"15%\">"+
				"<font color=\"#FF0000\" >*</font>"+
				"Work Code:"+
			"</td>"+
			"<td >"+
				"<select id=\"sel_ModOrder_WorkCodes\" "+
				  	    "name=\"sel_ModOrder_WorkCodes\" "+
						"size=\"1\" "+
						"alt=\"Work Code\" "+
						"tabindex=\"16\" "+
						//"onChange=\"f_onChange(this.name)\" "+
						"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
						"class=\"c_CtrlValue\" "+
						"selected=\"selected\"> "+
				    //"<option value=\"-1\">---Select Work Code----------</option>"+
				"</select>"+
			"</td>"+
		"</tr>"+		
		//..........................................................................
	"</table>";
	
	return v_Out;
}

//==================================================================================
function f_positionCtrl_3()
{
	v_Out = 
	
	"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\" width=\"15%\">"+
					"<font color=\"#FF0000\" >*</font>"+
					"Action Code:"+
				"</td>"+ 
				"<td class=\"c_CtrlName\" colspan=\"2\" >"+
					"<input class=\"c_CtrlValue\" id=\"txt_ModOrder_ActionCode\" name=\"txt_ModOrder_ActionCode\" alt=\"Action Code\" "+
						   "size=\"5\" maxlength=\"3\" tabindex=\"17\" value=\"\" onkeyup=\"f_onKeyUpActionCode(this.name);\" />"+
					"<span id=\"span_ActionMsg\" class=\"c_CtrlName\">"+v_ActionCode_Default+"</span>"+
				"</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\">"+
					"<font color=\"#FF0000\" >*</font>"+
					"<font class=\"c_CtrlName\">Estimated hours:</font>"+
				"</td>"+
				"<td class=\"c_CtrlName\" >"+
					"<input class=\"c_CtrlValue\" id=\"txt_ModOrder_EstHours\" name=\"txt_ModOrder_EstHours\" alt=\"Estimated Hours\" "+
						   "size=\"5\" maxlength=\"5\" tabindex=\"18\" value=\"\" />"+
					"&nbsp;&nbsp;&nbsp;Must be in HOURS (ex: '00:20 min' is '.33 hours')."+
				"</td>"+
				////
				"<td class=\"c_CtrlName\" bgcolor=\"#999999\" align=\"right\">"+
					"To convert to decimal use calculator:"+
					"&nbsp;&nbsp;&nbsp;"+
					"Hours:"+
					"<input class=\"c_CtrlValue\" "+
						   "id=\"txt_Hours\" "+
						   "name=\"txt_Hours\" "+
						   "alt=\"Hours\" "+
						   "size=\"2\" maxlength=\"2\" tabindex=\"19\" value=\"\" />"+
					"&nbsp;"+
					"Minutes:"+
				    "<input class=\"c_CtrlValue\" "+
						   "id=\"txt_Minutes\" "+
						   "name=\"txt_Minutes\" "+
						   "alt=\"Minutes\" "+
						   "size=\"2\" maxlength=\"2\" tabindex=\"20\" value=\"\" />"+
					"&nbsp;&nbsp;&nbsp;"+
					"<input type=\"button\" "+
						   "name=\"cb_CalcHours\" "+
						   "onclick=\"f_onClick(this.name)\" "+
						   "value=\"&nbsp;=&nbsp;\" "+
						   "tabindex=\"21\" />"+
				"</td>"+
				//// txt_Hours txt_Minutes cb_CalcHours
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\" width=\"15%\">"+
					"<font class=\"c_CtrlName\">NSN:</font>"+
				"</td>"+ 
				"<td colspan=\"2\" >"+
					"<input class=\"c_CtrlValue\" type=\"text\" id=\"txt_NSN_1_4\" name=\"txt_NSN_1_4\" alt=\"National Stock Number - 4 digits\" "+
						   "size=\"4\" maxlength=\"4\" tabindex=\"22\" value=\"\" onkeyup=\"f_onKeyUpNSN(this.name)\" />"+
					//
					"&nbsp;-&nbsp;"+
					//
					"<input class=\"c_CtrlValue\" type=\"text\" id=\"txt_NSN_2_2\" name=\"txt_NSN_2_2\" alt=\"National Stock Number - 2 digits\" "+
						   "size=\"2\" maxlength=\"2\" tabindex=\"23\" value=\"\" onkeyup=\"f_onKeyUpNSN(this.name)\" />"+
					//
					"&nbsp;-&nbsp;"+
					//
					"<input class=\"c_CtrlValue\" type=\"text\" id=\"txt_NSN_3_3\" name=\"txt_NSN_3_3\" alt=\"National Stock Number - 3 digits\" "+
						   "size=\"3\" maxlength=\"3\" tabindex=\"24\" value=\"\" onkeyup=\"f_onKeyUpNSN(this.name)\" />"+
					//
					"&nbsp;-&nbsp;"+
					//
					"<input class=\"c_CtrlValue\" type=\"text\" id=\"txt_NSN_4_4\" name=\"txt_NSN_4_4\" alt=\"National Stock Number - 4 digits\" "+
						   "size=\"4\" maxlength=\"4\" tabindex=\"25\" value=\"\" onkeyup=\"f_onKeyUpNSN(this.name)\" />"+
					//
					"<font class=\"c_CtrlName\">&nbsp;&nbsp;&nbsp;(National Stock Number if applicable)</font>"+
					//
				"</td>"+
		  "</tr>"+
	"</table>";

	return v_Out;	
}
//==================================================================================
function f_positionCtrl_4()
{
	v_Out = 
	"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\" width=\"15%\">"+
					"<font color=\"#FF0000\" >*</font>"+
					"Acronym:"+
				"</td>"+ 
				"<td>"+
					"<input id=\"txt_ModOrder_Acronym\" name=\"txt_ModOrder_Acronym\" alt=\"Acronym\" "+
						   "size=\"15\" maxlength=\"12\" tabindex=\"26\" value=\"\" class=\"c_CtrlValue\" onkeyup=\"f_onKeyUp_4(this.name)\" />"+
					"&nbsp;&nbsp;"+
					
				"</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\">"+
					"<font color=\"#FF0000\" >*</font>"+
					"<font class=\"c_CtrlName\">Class Code:</font>"+
				"</td>"+
				"<td>"+
					"<input id=\"txt_ModOrder_ClassCode\" name=\"txt_ModOrder_ClassCode\" alt=\"Class Code\" "+
						   "size=\"15\" maxlength=\"2\" tabindex=\"27\" value=\"\" class=\"c_CtrlValue\" onkeyup=\"f_onKeyUp_4(this.name)\" />"+
				"</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td class=\"c_CtrlName\" align=\"right\" valign=\"top\">"+
					"<font color=\"#FF0000\" >*</font>"+
					"<font class=\"c_CtrlName\">Work Order:</font>"+
				"</td>"+
				"<td>"+
					"<input id=\"txt_ModOrder_WorkOrder\" name=\"txt_ModOrder_WorkOrder\" alt=\"Work Order\" "+
						   "size=\"15\" maxlength=\"11\" tabindex=\"28\" value=\"\" class=\"c_CtrlValue\" onkeyup=\"f_onKeyUp_4(this.name)\" />"+
				"</td>"+
		  "</tr>"+
	"</table>";

	return v_Out;
	
}
//====================================================================================
function f_positionNavigation()
{
	v_Out = 
	"<table align=\"center\" style=\"background-color:#CCCCCC; border-style:none;\" width=\"100%\" border=\"0\" cellspacing=\"2\" cellpadding=\"2\">"+
			"<tr>"+
					"<td align=\"center\">"+
						"&nbsp;&nbsp;&nbsp;&nbsp;"+
						"<input type=\"button\" name=\"cb_Save\" onclick=\"f_onClick(this.name)\" value=\"Save\" />"+
						"&nbsp;&nbsp;&nbsp;&nbsp;"+"&nbsp;&nbsp;&nbsp;&nbsp;"+
						"<input type=\"button\" name=\"cb_Reset\" onclick=\"f_onClick(this.name)\" value=\"Reset\" />"+
						"&nbsp;&nbsp;&nbsp;&nbsp;"+"&nbsp;&nbsp;&nbsp;&nbsp;"+
						"<input type=\"button\" name=\"cb_Exit\" onclick=\"f_onClick(this.name)\" value=\"&nbsp;&nbsp;Exit&nbsp;&nbsp;\" />"+
						"&nbsp;&nbsp;&nbsp;&nbsp;"+
					"</td>"+
			"</tr>"+
	"</table>";

	return v_Out;
}
//==================================================================================
function f_positionBulletinsDetails()
{
	v_Out = 
	"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
		  "<tr>"+
				"<td width=\"30%\">BULLETIN DETAILS</td>"+
				"<td align=\"center\" class=\"c_CtrlName\"><font color=\"#FF0000\" >*</font>&shy; - Mandatory fields for creating bulletin</td>"+
				"<td align=\"center\" class=\"c_CtrlName\"><font color=\"#FF0000\" >&amp;</font>&shy; - Updatable fields</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td colspan=\"3\">"+f_positionCtrl_1()+"</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td colspan=\"3\">"+f_positionCtrl_2()+"</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td colspan=\"3\">"+f_positionCtrl_3()+"</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td colspan=\"3\">"+f_positionCtrl_4()+"</td>"+
		  "</tr>"+
  "</table>";
	
	return v_Out;
}
//==========================================================================================
//// SETTIN-UP PAGE CONTROL end.
//==========================================================================================
//==========================================================================================
//// ACTION function start:
//==========================================================================================

//-----------------------------------------------------------------------------------------
function f_getBulletinList(arg_ModOrder_DateFrom, arg_ModOrder_DateTo){with(self.document.forms[0])
{
	var v_BulletinValue = "";
	var v_BulletinText  = "";
	
	var v_bulletin_ptr = "";
	var v_modification_no = "";
	var v_date_issued = "";
	var v_date_due = "";
	var v_soft_ver = "";
	var v_wo_desc = "";
	var v_nsn = "";
	var v_acronym = "";
	var v_class_code = "";
	var v_wo_t_updated = "";
	
	var v_NumOfIterations = 0;
	
	objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_getBulletinList?p_Issue_DateFrom='+arg_ModOrder_DateFrom+
															 '&p_Issue_DateTo='+arg_ModOrder_DateTo+
															 '&p_BulletinType='+document.getElementById('sel_FindBulletinType').value+
															 '&p_Bulletin_Num_Seq='+document.getElementById('txt_FindBulletin_Num_Seq').value+
															 '&p_Bulletin_Year='+document.getElementById('txt_FindBulletin_Year').value+
															 '&p_CalcOrData=GET_DATA');
	if (objAJAX.parsed)
	{
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length;
		//// TEST: alert(v_NumberOfRecords)
		//.....................................................................................................
			 v_Desh = "-"; // 113 is used to create proportional length of the record.
			 for (var i=0; i<113; i++){v_Desh = v_Desh+"-";}
			 of_setSingleValue("sel_listOfBulletins", v_DefaultValue, "----------"+"CREATE NEW RECORD"+v_Desh, "YES",  0); 
			 //
			 of_outPut("span_NumOfBulletins", v_NumberOfRecords);
		//....................................................................................................
		if (v_NumberOfRecords == 0)
		{
			 v_Desh = "-"; // 101 is used to create proportional length of the record.
			 for (var i=0; i<101; i++){v_Desh = v_Desh+"-"; }
			 of_setSingleValue("sel_listOfBulletins", v_DefaultValue-1, "NO RECORDS AVAILABLE FOR SELECTED DATES"+v_Desh, "NO", 1); 
		}
		else if (v_NumberOfRecords != 0)
		{
				for (var r=0; r<v_NumberOfRecords; r++)
				{//1.2.1
					v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
					
					v_BulletinValue = v_ArrayOfValuesInRecord[0].text; // bulletin_ptr
					
					// All numbers that are used below are based on the empirical calculation to make output looks well and do not have any meaningful value.
					v_bulletin_ptr    = v_ArrayOfValuesInRecord[0].text;
					v_modification_no = of_RPad(v_ArrayOfValuesInRecord[1].text, 12, " "); 
					v_date_issued 	  = of_RPad(v_ArrayOfValuesInRecord[2].text, 15, " "); 
					v_date_due	      = v_ArrayOfValuesInRecord[3].text
					v_soft_ver 		  = of_RPad(v_ArrayOfValuesInRecord[4].text, 23, " "); 
					v_wo_desc 		  = v_ArrayOfValuesInRecord[5].text.substr(0, 47);
					v_wo_desc 		  = of_RPad(v_wo_desc, 49, " ");
					v_nsn 			  = of_RPad(v_ArrayOfValuesInRecord[6].text, 21, " ");
					v_acronym 		  = of_RPad(v_ArrayOfValuesInRecord[7].text, 15, " ");
					v_class_code 	  = v_ArrayOfValuesInRecord[8].text;
					v_wo_t_updated	  = v_ArrayOfValuesInRecord[9].text;
					//----------------------------------------------------------------------
					orgBfr_BulletinList[r] = new array_BulletinList ( v_bulletin_ptr, 
																	  v_modification_no,
																	  v_date_issued,
																	  v_date_due,
																	  v_soft_ver,
																	  v_wo_desc,
																	  v_nsn,
																	  v_acronym,
																	  v_class_code,
																	  v_wo_t_updated  );
					//----------------------------------------------------------------------
					v_BulletinText =v_modification_no+v_date_issued+v_soft_ver+v_wo_desc+v_nsn+v_acronym+v_class_code;
									 
					of_setSingleValue("sel_listOfBulletins", v_BulletinValue, v_BulletinText, "NO", r+1)
					
				}//1.2.1		
		}
	}
}}
//==========================================================================================
function f_onChange(arg_CtrlName){with(self.document.forms[0])
{
	of_getCtrlProperties(arg_CtrlName);
	//
	switch(arg_CtrlName)
    {
		//..................................................................................
		case "sel_ModOrder_Type":
			if (v_CtrlValue == "SMO")
			{
				// Setting visual indicator that Software version is mandatory field.
				of_outPut("span_SoftVer_Asterisk", "<font color=\"#FF0000\" >*</font>"); 
			}
			else 
			{
				// Removing visual indicator that Software version is mandatory field.
				of_outPut("span_SoftVer_Asterisk", "");
			}
			//
			if (v_CtrlValue == v_DefaultValue)//"-1"
			{
				f_resetPage("FULL_PAGE");
			}
		break;	
		//................................................................................
		case "sel_listOfBulletins":
			if (v_CtrlValue <= v_DefaultValue)//v_DefaultValue="-1"
			{
				f_resetPage("BULLETIN_LIST_DETAILS");
			}
			else
			{
				f_getset_BulletinRecordDetails(v_CtrlValue);
			}
		break;
		//................................................................................
	}
}}
//========================================================================================
function f_getsetWorkCodes() 
{ 
	objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_getsetWorkCodes');
	if (objAJAX.parsed)
	{
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
	    v_NumberOfRecords = v_ArrayOfRecords.length;
		// TEST: alert(v_NumberOfRecords)
		
		of_setSingleValue("sel_ModOrder_WorkCodes", v_DefaultValue, "---Select Work Code----------", "YES",  0);  
		
		for (var r=0; r<v_NumberOfRecords; r++)
		{
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			
			of_setSingleValue("sel_ModOrder_WorkCodes", v_ArrayOfValuesInRecord[0].text, v_ArrayOfValuesInRecord[0].text+" - "+v_ArrayOfValuesInRecord[1].text, "NO",  r+1);  
			
		}
	}
}
//f_getsetWorkCodes();
//========================================================================================
function f_getset_BulletinRecordDetails(arg_CtrlValue){with(self.document.forms[0])
{ 
	objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_getBulletinRecordDetails?p_Bulletin_Ptr='+arg_CtrlValue);
	if (objAJAX.parsed)
	{
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length;
		//// TEST: 
		for (var r=0; r<v_NumberOfRecords; r++)
        {//1.2.1
            v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
  			////of_selectRecord( "sel_listOfBulletins", v_ArrayOfValuesInRecord[0].text); v_ArrayOfValuesInRecord[0].text
			of_selectRecord(  "sel_ModOrder_Type",            v_ArrayOfValuesInRecord[1].text);
			of_setSingleValue("txt_ModOrder_Num_Seq", "'"+    v_ArrayOfValuesInRecord[2].text+ "'" , "", "", 0);
			of_setSingleValue("txt_ModOrder_Year", "'"+       v_ArrayOfValuesInRecord[3].text+ "'" , "", "", 0);
			of_setSingleValue("txt_ModOrder_Date_Issued", "'"+v_ArrayOfValuesInRecord[4].text+ "'" , "", "", 0);
			of_setSingleValue("txt_ModOrder_Date_Due", "'"+   v_ArrayOfValuesInRecord[5].text+ "'" , "", "", 0);
			of_setSingleValue("txt_ModOrder_SoftVer", "'"+    v_ArrayOfValuesInRecord[6].text+ "'" , "", "", 0);
			of_setSingleValue("txt_ModOrder_Descr", "'"+      v_ArrayOfValuesInRecord[7].text+ "'" , "", "", 0);
			of_setSingleValue("txa_ModOrder_Comments", "'"+   v_ArrayOfValuesInRecord[8].text+ "'" , "", "", 0);
			of_selectRecord(  "sel_ModOrder_WorkCodes",       v_ArrayOfValuesInRecord[9].text);
			of_setSingleValue("txt_ModOrder_ActionCode", "'"+ v_ArrayOfValuesInRecord[10].text+ "'" , "", "", 0);
			of_outPut(        "span_ActionMsg", "");	
			of_setSingleValue("txt_ModOrder_EstHours", "'"+   v_ArrayOfValuesInRecord[11].text+"'" , "", "", 0);
			of_setSingleValue("txt_Hours",   "''" , "", "", 0);
			of_setSingleValue("txt_Minutes", "''" , "", "", 0);
			of_setSingleValue("txt_NSN_1_4", "'"+   		  v_ArrayOfValuesInRecord[12].text+"'" , "", "", 0);
			of_setSingleValue("txt_NSN_2_2", "'"+   		  v_ArrayOfValuesInRecord[13].text+"'" , "", "", 0);
			of_setSingleValue("txt_NSN_3_3", "'"+   		  v_ArrayOfValuesInRecord[14].text+"'" , "", "", 0);
			of_setSingleValue("txt_NSN_4_4", "'"+   		  v_ArrayOfValuesInRecord[15].text+"'" , "", "", 0);
			of_setSingleValue("txt_ModOrder_Acronym", "'"+    v_ArrayOfValuesInRecord[16].text+"'" , "", "", 0);
			of_setSingleValue("txt_ModOrder_ClassCode", "'"+  v_ArrayOfValuesInRecord[17].text+"'" , "", "", 0);
			of_setSingleValue("txt_ModOrder_WorkOrder", "'"+  v_ArrayOfValuesInRecord[18].text+"'" , "", "", 0);
			//
			if (v_ArrayOfValuesInRecord[1].text == "SMO")
			{
				of_outPut("span_SoftVer_Asterisk", "<font color=\"#FF0000\" >*</font>");
			}
			else
			{
				of_outPut("span_SoftVer_Asterisk", "");
			}
			//
			f_get_setActionCodeDescr(v_ArrayOfValuesInRecord[10].text);// <--- Action Code
		
		}//1.2.1		
	}
}}
//========================================================================================
function f_get_setActionCodeDescr(arg_VerbNounCode){with(self.document.forms[0])
{ 
	 objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_validateActionCode?p_ActionCode='+arg_VerbNounCode);
	 if (objAJAX.parsed)
	 {
		  v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		  v_NumberOfRecords = v_ArrayOfRecords.length;
		  //// TEST: alert(v_NumberOfRecords)
		  //........................................................
		  for (var r=0; r<v_NumberOfRecords; r++)
		  {//1.
			  v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			  
			  v_VerbCode = v_ArrayOfValuesInRecord[0].text;
			  v_NounCode = v_ArrayOfValuesInRecord[1].text;
		  }//1.		
		  //
		  // Return values of v_VerbCode or v_NounCode: either "0" - means code is not validated,
		   //										       or actual code with its definition in the following format: "A - Aaaaa Aaaaaa".
		   if (v_VerbCode == "0" || v_NounCode == '0')
		   {
				 if (v_VerbCode == "0") { v_VerbCode = "Provided \"Verb\" code does not exist."; }
				 else {v_VerbCode = "Verb Code: "+v_VerbCode}
				 //
				 if (v_NounCode == "0") { v_NounCode = "Provided \"Noun\" code does not exist."; }
				 else {v_NounCode = "Noun Code: "+v_NounCode}
				 //
				 alert("Data entry ERROR!!!\n"+
					   "Validation of \"Action Code\" against database brought the following results:\n"+
					   "\t"+v_VerbCode+";\n"+
					   "\t"+v_NounCode+";\n"+
					   "It would not be possible to process entered values.\nPlease reconsider your data entry.");
				 of_setSingleValue("txt_ModOrder_ActionCode", "''" , "", "", 0);
				 txt_ModOrder_ActionCode.focus();
				 of_outPut("span_ActionMsg", v_ActionCode_Default);
		   }
		   else if (v_VerbCode != "0" && v_NounCode != '0')
		   {
			  v_VerbCode = "\"Verb\" Code: "+v_VerbCode;
			  v_NounCode = "\"Noun\" Code: "+v_NounCode
			  of_outPut("span_ActionMsg", v_VerbCode+";    "+v_NounCode+";");
			  //eval(v_NextCtrlName+".focus();");
		   }
	 }
}}
//========================================================================================
function f_onKeyUpDescr(arg_CtrlName){with(self.document.forms[0])
{ 
	//var v_CharLeft = 38;
	//------------------------------------------------------------------------------------
	of_getCtrlProperties(arg_CtrlName);
	
	v_CtrlValueLength = eval(v_CtrlName+".value.length");
	
	//v_CharLeft = 38 - v_CtrlValueLength;
	
	of_outPut("span_ModOrderStrLengthCounter", v_CtrlValueLength);
	
}}
//========================================================================================
function f_resetPage(arg_Scope){with(self.document.forms[0])
{
	////arg_Scope could be:"FULL_PAGE", "BULLETIN_LIST_DETAILS"
	var arrayCtrlNames = new Array();
	
	if (arg_Scope == "FULL_PAGE")
	{
		arrayCtrlNames = new Array(
								  //// FIND RECORD:
								  "txt_Find_DateFrom","txt_Find_DateTo",
								  "sel_FindBulletinType", "txt_FindBulletin_Num_Seq", "txt_FindBulletin_Year",
								  //// LIST OF BULLETINS:
								  "sel_listOfBulletins",
								  //// BULLETIN DETAILS:
								  "sel_ModOrder_Type", "txt_ModOrder_Num_Seq", "txt_ModOrder_Year",
								  "txt_ModOrder_Date_Issued", 
								  "txt_ModOrder_Date_Due",
								  "span_SoftVer_Asterisk", "txt_ModOrder_SoftVer",
								  "txt_ModOrder_Descr",
								  "txa_ModOrder_Comments",
								  "sel_ModOrder_WorkCodes",
								  "txt_ModOrder_ActionCode", 
								  "span_ActionMsg",
								  "txt_ModOrder_EstHours",
								  "txt_Hours", 
								  "txt_Minutes",
								  "txt_NSN_1_4", "txt_NSN_2_2", "txt_NSN_3_3", "txt_NSN_4_4",
								  "txt_ModOrder_Acronym",
								  "txt_ModOrder_ClassCode", 
								  "txt_ModOrder_WorkOrder"
								  );
	}
	else if (arg_Scope == "BULLETIN_LIST_DETAILS")
	{
		arrayCtrlNames = new Array(   
								  //// FIND RECORD:
								  //"txt_Find_DateFrom","txt_Find_DateTo",
								  //"sel_FindBulletinType", "txt_FindBulletin_Num_Seq", "txt_FindBulletin_Year",
								  //// LIST OF BULLETINS:
								  "sel_listOfBulletins",
								  //// BULLETIN DETAILS:
								  "sel_ModOrder_Type", "txt_ModOrder_Num_Seq", "txt_ModOrder_Year",
								  "txt_ModOrder_Date_Issued", 
								  "txt_ModOrder_Date_Due",
								  "span_SoftVer_Asterisk", "txt_ModOrder_SoftVer",
								  "txt_ModOrder_Descr",
								  "txa_ModOrder_Comments",
								  "sel_ModOrder_WorkCodes",
								  "txt_ModOrder_ActionCode", 
								  "span_ActionMsg",
								  "txt_ModOrder_EstHours",
								  "txt_Hours", 
								  "txt_Minutes",
								  "txt_NSN_1_4", "txt_NSN_2_2", "txt_NSN_3_3", "txt_NSN_4_4",
								  "txt_ModOrder_Acronym",
								  "txt_ModOrder_ClassCode", 
								  "txt_ModOrder_WorkOrder"
								  );
	}
	// Loop through the "arrayCtrlNames"
	
	for (var r=0; r<arrayCtrlNames.length; r++)
	{
		//// FIND RECORD:
		if (arrayCtrlNames[r] == "txt_Find_DateFrom" )
		{
			of_setSingleValue("txt_Find_DateFrom", "'"+v_DefaultFind_DateFrom+"'" , "", "", 0);
		}
		else if (arrayCtrlNames[r] == "txt_Find_DateTo" )
		{
			of_setSingleValue("txt_Find_DateTo", "'"+v_DefaultFind_DateTo+"'" , "", "", 0);
		}
		else if (arrayCtrlNames[r] == "txt_ModOrder_Year")
		{
			of_setSingleValue("txt_ModOrder_Year", String(v_FiscalYr).substr(2,2), "", "", 0);
		}
		else if (arrayCtrlNames[r] == "sel_FindBulletinType")
		{
			of_selectRecord(arrayCtrlNames[r], v_DefaultValue);
		}
		else if ( arrayCtrlNames[r] == "txt_FindBulletin_Num_Seq" || 
				  arrayCtrlNames[r] == "txt_FindBulletin_Year" )
		{
			of_setSingleValue(arrayCtrlNames[r], "''" , "", "", 0);
		}
		//// LIST OF BULLETINS:
		else if (arrayCtrlNames[r] == "sel_listOfBulletins")
		{
			f_getBulletinList(document.getElementById("txt_Find_DateFrom").value, v_DefaultFind_DateTo);
			
			of_selectRecord(arrayCtrlNames[r], v_DefaultValue);
		}
		//// BULLETIN DETAILS:
		else if ( arrayCtrlNames[r] == "sel_ModOrder_Type")
		{
			of_selectRecord(arrayCtrlNames[r], v_DefaultValue);
		}
		else if ( arrayCtrlNames[r] == "span_SoftVer_Asterisk")
		{
			of_outPut("span_SoftVer_Asterisk", "");
		}
		else if (arrayCtrlNames[r] == "span_ActionMsg")
		{
			of_outPut("span_ActionMsg", v_ActionCode_Default);	
		}
		else if ( arrayCtrlNames[r] == "sel_ModOrder_WorkCodes")
		{
			if (sel_ModOrder_WorkCodes.options.length == 0)
			{
				f_getsetWorkCodes();
			}
			of_selectRecord(arrayCtrlNames[r], v_DefaultValue);
		}
		else
		{
			of_setSingleValue(arrayCtrlNames[r], "''" , "", "", 0);
		}
	}
}}
//=========================================================================================
function f_onClick(arg_CtrlName){with(self.document.forms[0]) 
{ 
	v_ValidationPassed = "YES";
	//
	switch(arg_CtrlName)
	{
		case "cb_Save":	
////// FIND RECORD:
//"txt_Find_DateFrom","txt_Find_DateTo",
//"sel_FindBulletinType", "txt_FindBulletin_Num_Seq", "txt_FindBulletin_Year",
////// LIST OF BULLETINS:
//"sel_listOfBulletins",
////// BULLETIN DETAILS:
//"sel_ModOrder_Type", "txt_ModOrder_Num_Seq", "txt_ModOrder_Year",
//"txt_ModOrder_Date_Issued", 
//"txt_ModOrder_Date_Due",
//"txt_ModOrder_SoftVer",
//"txt_ModOrder_Descr",
//"txa_ModOrder_Comments",
//"sel_ModOrder_WorkCodes"
//"txt_ModOrder_ActionCode", 
//"txt_ModOrder_EstHours",
//"txt_NSN_1_4", "txt_NSN_2_2", "txt_NSN_3_3", "txt_NSN_4_4",
//"txt_ModOrder_Acronym",
//"txt_ModOrder_ClassCode", 
//"txt_ModOrder_WorkOrder"
			//............................................................................
			v_ValidationPassed = f_isThisANewRecord();
			//............................................................................
			//// Applicable to: "sel_ModOrder_Type", "txt_ModOrder_Num_Seq", "txt_ModOrder_Year"
			if (v_ValidationPassed == "YES")
			{
				v_ValidationPassed = f_validateTypeAndNumber();
			}
			//............................................................................
			//// Applicable to: "txt_ModOrder_Date_Issued", "txt_ModOrder_Date_Due",
			if (v_ValidationPassed == "YES")
			{
				v_ValidationPassed = f_validateIssueAndDueDates();
			}
			//............................................................................
			//// Applicable to: "txt_ModOrder_SoftVer"
			if (v_ValidationPassed == "YES")
			{
				v_ValidationPassed = f_validateSoftwareVersion();
			}
			//............................................................................
			//// Applicable to "txt_ModOrder_Descr", "txa_ModOrder_Comments", "txt_ModOrder_ActionCode",  "txt_ModOrder_EstHours", 
			//// "txt_ModOrder_Acronym", "txt_ModOrder_ClassCode", "txt_ModOrder_WorkOrder"
			if (v_ValidationPassed == "YES")
			{
				v_ValidationPassed = f_validate_txt_DataPresence();
			}
			//............................................................................
			//// Applicable to: "sel_ModOrder_WorkCodes"
			if (v_ValidationPassed == "YES")
			{
				v_ValidationPassed = f_validateWorkCode("sel_ModOrder_WorkCodes");
			}
			//............................................................................
			///// Applicable to "txt_NSN_1_4", "txt_NSN_2_2", "txt_NSN_3_3", "txt_NSN_4_4",
			if (v_ValidationPassed == "YES")
			{
				v_ValidationPassed = f_validateNSN();
			}
			//............................................................................
			//// 
			if (v_ValidationPassed == "YES")
			{
				v_ValidationPassed = f_validateAcronymAndClassCode();
			}
			//
			if ( v_ValidationPassed == "YES")
			{
				f_Save();
			}
			//............................................................................
		break;
		//--------------------------------------------------------------------------------
		case "cb_RefreshListOfBulletins":
			
			var arrayCtrlNames = new Array( "txt_Find_DateFrom", "txt_Find_DateTo" );
			//
			v_ValidationPassed = "YES";
			//
			//............................................................................
			//// 1. Check if dates were entered in a proper format:
			for (var r=0; r<arrayCtrlNames.length; r++)
			{
				of_getCtrlProperties(arrayCtrlNames[r]);
				
				v_ValidationPassed = of_validateDate(v_CtrlName);
				
				if (v_ValidationPassed == "NO")
				{
					break;	
				}
			}
			//...........................................................................
			//// 2. If dates were properly formated, check if "Date From" is set earlier than "Date To"
			if (v_ValidationPassed == "YES")
			{
				objAJAX.load("EMAPP.EM_BULLTN_EDITOR_01.sp_validateDates?p_ModOrder_Date_Issued="+document.getElementById('txt_Find_DateFrom').value+
						 												  "&p_ModOrder_Date_Due="+document.getElementById('txt_Find_DateTo').value);
				if (objAJAX.parsed)
				{//1.5.1
					v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
					v_NumberOfRecords = v_ArrayOfRecords.length;
					//TEST: alert(v_NumberOfRecords);
					for (var r=0; r<v_NumberOfRecords; r++)
					{//1.5.1.1
						v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
						
						//v_IssueDateBack  = v_ArrayOfValuesInRecord[0].text;
						v_IssueDueDtDiff = v_ArrayOfValuesInRecord[1].text;
						//v_SysDate 		 = v_ArrayOfValuesInRecord[2].text;
						
					}//1.5.1.1
					
					if (v_IssueDueDtDiff < 1)
					{
						v_ValidationPassed = "NO";
						alert("System cannot process your request.\nPeriod to search records is not properly defined."+
							  "\n'From' date must precedes 'To' date.");
						txt_Find_DateFrom.focus();
					}
				}
			}
			//............................................................................
			//
			// Get Bulletin records from the database: ...................................
			if (v_ValidationPassed == "YES")
			{
				f_resetPage("BULLETIN_LIST_DETAILS");
				////
//// TEST:
//				alert('EMAPP.EM_BULLTN_EDITOR_01.sp_getBulletinList?\np_Issue_DateFrom='+document.getElementById('txt_Find_DateFrom').value+
//																		 '\n&p_Issue_DateTo='+document.getElementById('txt_Find_DateTo').value+
//																		 '\n&p_BulletinType='+document.getElementById('sel_FindBulletinType').value+
//																		 '\n&p_Bulletin_Num_Seq='+document.getElementById('txt_FindBulletin_Num_Seq').value+
//																		 '\n&p_Bulletin_Year='+document.getElementById('txt_FindBulletin_Year').value+
//																		 '\n&p_CalcOrData=CALC_RECORDS');
				////
				objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_getBulletinList?p_Issue_DateFrom='+document.getElementById('txt_Find_DateFrom').value+
																		 '&p_Issue_DateTo='+document.getElementById('txt_Find_DateTo').value+
																		 '&p_BulletinType='+document.getElementById('sel_FindBulletinType').value+
																		 '&p_Bulletin_Num_Seq='+document.getElementById('txt_FindBulletin_Num_Seq').value+
																		 '&p_Bulletin_Year='+document.getElementById('txt_FindBulletin_Year').value+
																		 '&p_CalcOrData=CALC_RECORDS');
				
				if (objAJAX.parsed)
				{
					v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
					v_NumberOfRecords = v_ArrayOfRecords.length;
					//
					if (v_NumberOfRecords >= 200)
					{
						v_ValidationPassed == "NO";
						alert("Based on provided search conditions, system identified "+v_NumberOfRecords+" records."+
							  "\n200 records or less is a recommended set of data for the viewing or editing."+
						      "\nThis record output is too large for this editor."+
							  "\nPlease redefine condition by changing:"+
							  "\n\t- search dates and / or "+
							  "\n\t-by providing more specific Bulletin Number.");
					}
				}
				//........................................................................................................
				if (v_ValidationPassed == "YES")
				{
//// TEST:
//				alert('EMAPP.EM_BULLTN_EDITOR_01.sp_getBulletinList?\np_Issue_DateFrom='+document.getElementById('txt_Find_DateFrom').value+
//																		 '\n&p_Issue_DateTo='+document.getElementById('txt_Find_DateTo').value+
//																		 '\n&p_BulletinType='+document.getElementById('sel_FindBulletinType').value+
//																		 '\n&p_Bulletin_Num_Seq='+document.getElementById('txt_FindBulletin_Num_Seq').value+
//																		 '\n&p_Bulletin_Year='+document.getElementById('txt_FindBulletin_Year').value+
//																		 '\n&p_CalcOrData=CALC_RECORDS');
////					
					
					objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_getBulletinList?p_Issue_DateFrom='+document.getElementById('txt_Find_DateFrom').value+
																			 '&p_Issue_DateTo='+document.getElementById('txt_Find_DateTo').value+
																			 '&p_BulletinType='+document.getElementById('sel_FindBulletinType').value+
																			 '&p_Bulletin_Num_Seq='+document.getElementById('txt_FindBulletin_Num_Seq').value+
																			 '&p_Bulletin_Year='+document.getElementById('txt_FindBulletin_Year').value+
																			 '&p_CalcOrData=GET_DATA');
					  //........................................................................................................
					  if (objAJAX.parsed)
					  {
						  v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
						  v_NumberOfRecords = v_ArrayOfRecords.length;
						  //// TEST: alert(v_NumberOfRecords)
						  //.....................................................................................................
							   
							   //
							   var v_Desh = "-"; // 113 is used to create proportional length of the record.
							   for (var i=0; i<113; i++){v_Desh = v_Desh+"-";}
							   of_setSingleValue("sel_listOfBulletins", v_DefaultValue, "----------"+"CREATE NEW RECORD"+v_Desh, "YES",  0); 
							   //
							   of_outPut("span_NumOfBulletins", v_NumberOfRecords);
							   //v_NumOfIterations = sel_listOfBulletins[0].text.length - " Records retrieved: ".length - 5;
							   //v_Desh = "-";
							   //for (var i=0; i<v_NumOfIterations; i++){v_Desh = v_Desh+"-";} 
							   //of_setSingleValue("sel_listOfBulletins", "-2", v_Desh+" Records retrieved: "+v_NumberOfRecords, "NO",  1);             
							   
						  //....................................................................................................
						  for (var r=0; r<v_NumberOfRecords; r++)
						  {//1.2.1
							  v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
							  
							  v_BulletinValue = v_ArrayOfValuesInRecord[0].text; // bulletin_ptr
							  
							  // All numbers that are used below are based on the empirical calculation to make outpup look well and do not have any meaningful value.
							  v_bulletin_ptr    = v_ArrayOfValuesInRecord[0].text;
							  v_modification_no = of_RPad(v_ArrayOfValuesInRecord[1].text, 12, " "); 
							  v_date_issued 	= of_RPad(v_ArrayOfValuesInRecord[2].text, 15, " "); 
							  v_date_due		= v_ArrayOfValuesInRecord[3].text
							  v_soft_ver 		= of_RPad(v_ArrayOfValuesInRecord[4].text, 23, " "); 
							  v_wo_desc 		= v_ArrayOfValuesInRecord[5].text.substr(0, 47);
							  v_wo_desc 		= of_RPad(v_wo_desc, 49, " ");
							  v_nsn 			= of_RPad(v_ArrayOfValuesInRecord[6].text, 21, " ");
							  v_acronym 		= of_RPad(v_ArrayOfValuesInRecord[7].text, 15, " ");
							  v_class_code 	    = v_ArrayOfValuesInRecord[8].text;	
							  v_wo_t_updated	= v_ArrayOfValuesInRecord[9].text;
		  
 		  					  //----------------------------------------------------------------------
					          orgBfr_BulletinList[r] = new array_BulletinList ( v_bulletin_ptr, 
																				v_modification_no,
																				v_date_issued,
																				v_date_due,
																				v_soft_ver,
																				v_wo_desc,
																				v_nsn,
																				v_acronym,
																				v_class_code,
																				v_wo_t_updated  );
							  //----------------------------------------------------------------------
							  
							  v_BulletinText = v_modification_no+v_date_issued+v_soft_ver+v_wo_desc+v_nsn+v_acronym+v_class_code;
											   
							  of_setSingleValue("sel_listOfBulletins", v_BulletinValue, v_BulletinText, "NO", r+1)
							  
						  }//1.2.1	
						  //
						  of_selectRecord("sel_listOfBulletins", v_DefaultValue);
						  //	
					  }
					  //.......................................................................................................................
				}
			}
			//............................................................................
		break;
		//--------------------------------------------------------------------------------
		case "cb_Reset":
			f_resetPage("FULL_PAGE");
		break;
		//--------------------------------------------------------------------------------
		case "cb_Exit":	
			window.close();
		break;
		//--------------------------------------------------------------------------------
		case "cb_CalcHours": //txt_Hours txt_Minutes cb_CalcHours
			var v_Hours   = document.getElementById('txt_Hours').value; 
			var v_Minutes = document.getElementById('txt_Minutes').value;
			var v_CalcHours = 0;
			//.............................................................................
			if  (v_Hours   == ""){v_Hours   = 0;}
			//
			if (v_Minutes == ""){v_Minutes = 0;}
			else{ v_Minutes = parseInt(v_Minutes,10)/60 }
			//
			if (isNaN(v_Hours)) //|| (!isNaN(v_Minutes)))
			{
				alert("Calculation is not possible since \"Hours\" is not a numeric value.");
				txt_Hours.focus();
			}
			else if (isNaN(v_Minutes)) //|| (!isNaN(v_Minutes)))
			{
				alert("Calculation is not possible since \"Minutes\" is not a numeric value.");
				txt_Minutes.focus();
			}
			else
			{
				v_CalcHours = parseFloat(v_Hours,10) + parseFloat(v_Minutes,10);
				v_CalcHours = of_roundNumber(v_CalcHours, 2);
				of_setSingleValue("txt_ModOrder_EstHours", "'"+v_CalcHours+ "'" , "", "", 0);
			}
			//.............................................................................
		break;
		//--------------------------------------------------------------------------------
	}
}}
//========================================================================================
function f_isThisANewRecord(){with(self.document.forms[0])
{
	var v_RtnYESorNO = "YES";
	var v_WasThisRecordLinkedToWO = "YES"; //<-- was this record linked to work orders?
	var v_DueDate = "";
	var v_ConfirmationMsg = "ATTENTION!!!\n\n"+
							"\"Due Date\" is changed.\n"+
							"Do you want to update selected bulletin record?"+
							"\n\nOnly fields marked by the sign \"&\" are updatable.\n";
	
	of_getCtrlProperties("sel_listOfBulletins");
	//
	
	if (v_CtrlValue == -1) // <-- New record
	{
		v_RtnYESorNO = "YES";
	}
	else // <-- Existing record
	{
		for (var r=0; r<orgBfr_BulletinList.length; r++)
		{
			if (v_CtrlValue == orgBfr_BulletinList[r].a_bulletin_ptr)
			{
				v_WasThisRecordLinkedToWO = orgBfr_BulletinList[r].a_wo_t_updated;
				
				if (v_WasThisRecordLinkedToWO == "N") //<--- means that Bulletin was not linked to Work Orders
				{
					v_RtnYESorNO = "YES"; //<-- This value permits further validation.
					break;
				}
				else //v_WasThisRecordLinkedToWO = "Y"
				{
					of_getCtrlProperties("txt_ModOrder_Date_Due");
					v_DueDate = orgBfr_BulletinList[r].a_date_due;
					break;
				}
			}
		}
		//
		// In the following "if", v_CtrlValue has a Due Date value obtained from the screen,
		// v_DueDate has a value that was saved in the database.
		//Comparisson of variables v_DueDate and v_CtrlValue determines wether "Due Date" was changed, or not.
		
		
		if (v_WasThisRecordLinkedToWO == "Y" && (v_CtrlValue != v_DueDate))
		{
			if (confirm(v_ConfirmationMsg))
			{
				v_RtnYESorNO = "YES";	
			}
		}
		else if (v_WasThisRecordLinkedToWO == "Y" && (v_CtrlValue == v_DueDate))
		{
			v_RtnYESorNO = "NO";
			alert("Illigal request!!!\nSystem will not be able to update this record.\n"+
				  "\n\nOnly fields marked by the sign \"&\" are updatable.");
		}
		
	}
	
	return v_RtnYESorNO;
	
}} 
//========================================================================================
function f_onKeyUp(arg_CtrlName){with(self.document.forms[0])
{ 
	//// Get proprty values for the control name:
	of_getCtrlProperties(arg_CtrlName);
	
	//// Determine the length of the entered value:
	v_CtrlValueLength = eval(v_CtrlName+".value.length");
	//
	//// Loop through the the value in the control, evaluating each character:
	for (var i=0; i<v_CtrlValue.length; i++)
	{//2
		v_Char = v_CtrlValue.substr(i,1);
		//v_Char = parseInt(v_Char);
		//
		if (objRegExp_onlyNumeric.test(v_Char) == false)
		{
			alert("Special charecters, white spaces, and alpha values are not allowed in this field."+
			     "\nTo populate this field, please use only "+v_CtrlSize+" numeric values.");
			//Removing "unauthorised" charecter, set value without it:
			eval(v_CtrlName+".value=\""+v_CtrlValue.substr(0,i)+v_CtrlValue.substr(i+1, v_CtrlValue.length)+"\"");
			eval(v_CtrlName+".focus();");
			break;
		}
	}//2
	//
	v_CtrlValueLength = eval(v_CtrlName+".value.length");
	//// If required conditions are met, place focus tothe next field.
	if (v_CtrlName == "txt_FindBulletin_Num_Seq" && v_CtrlValueLength == v_CtrlSize) { txt_FindBulletin_Year.focus(); }
	if (v_CtrlName == "txt_FindBulletin_Year"    && v_CtrlValueLength == v_CtrlSize) { sel_listOfBulletins.focus(); }
	//
	if (v_CtrlName == "txt_ModOrder_Num_Seq" && v_CtrlValueLength == v_CtrlSize) { txt_ModOrder_Year.focus(); }
	if (v_CtrlName == "txt_ModOrder_Year"    && v_CtrlValueLength == v_CtrlSize) { txt_ModOrder_Date_Issued.focus(); }

}}
//========================================================================================
//========================================================================================
function f_onKeyUpActionCode(arg_CtrlName){with(self.document.forms[0])
{ 
	of_getCtrlProperties(arg_CtrlName);
	
	v_CtrlValueLength = eval(v_CtrlName+".value.length");
	
	// Validate data-entry of Action Code starts:---------------------------------------- 
	for (var i=0; i<v_CtrlValueLength; i++)
	{//1
		v_Char = v_CtrlValue.substr(i,1);
		//
		if (i == 0)
		{//1.1
			if (objRegExp_onlyAlphaNumeric.test(v_Char) == false)
			{
				alert("Special charecters, and white spaces are not allowed in the first position of this field.\n"+
					  "To populate the first position of '"+v_CtrlAlt+"', please use only alpha-numeric values.");
				//Removing "unauthorised" charecter, set value without it:
				eval(v_CtrlName+".value=\""+v_CtrlValue.substr(0,i)+v_CtrlValue.substr(i+1, v_CtrlValue.length)+"\"");
				v_CtrlValueLength = eval(v_CtrlName+".value.length");
				eval(v_CtrlName+".focus();");
				break;
			}
		}//1.1
		else if (i != 0)
		{//1.2
			if (objRegExp_onlyAlpha.test(v_Char) == false)
			{
				alert("Special charecters, white spaces, and numeric values are not allowed in the second and the third positions of this field.\n"+
					  "To populate the second and the third position of '"+v_CtrlAlt+"', please use only alpha values.");
				//Removing "unauthorised" charecter, set value without it:
				eval(v_CtrlName+".value=\""+v_CtrlValue.substr(0,i)+v_CtrlValue.substr(i+1, v_CtrlValue.length)+"\"");
				v_CtrlValueLength = eval(v_CtrlName+".value.length");
				eval(v_CtrlName+".focus();");
				break;
			}
		}//1.2
	}//1
	// Validate data-entry of Action Code ends.---------------------------------------- 
	if (v_CtrlValueLength == 3)
	{//3
//"span_ActionMsg" alert('EMAPP.EM_BULLTN_EDITOR_01.sp_validateActionCode?p_ActionCode='+v_CtrlValue.toUpperCase());

		 objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_validateActionCode?p_ActionCode='+v_CtrlValue.toUpperCase());
		 //
		 if (objAJAX.parsed)
    	 {
			  v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
			  v_NumberOfRecords = v_ArrayOfRecords.length;
			  //// TEST: alert(v_NumberOfRecords)
			  //........................................................
			  for (var r=0; r<v_NumberOfRecords; r++)
			  {//1.
				  v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
				  
				  v_VerbCode = v_ArrayOfValuesInRecord[0].text;
				  v_NounCode = v_ArrayOfValuesInRecord[1].text;
				  
			  }//1.		
		 }
		 // Return values of v_VerbCode or v_NounCode: either "0" - means code is not validated,
		 //										       or actual code with its definition in the following format: "A - Aaaaa Aaaaaa".
		 if (v_VerbCode == "0" || v_NounCode == '0')
		 {
			   if (v_VerbCode == "0") { v_VerbCode = "Provided \"Verb\" code does not exist."; }
			   else {v_VerbCode = "Verb Code: "+v_VerbCode}
			   //
			   if (v_NounCode == "0") { v_NounCode = "Provided \"Noun\" code does not exist."; }
			   else {v_NounCode = "Noun Code: "+v_NounCode}
			   //
			   alert("Data entry ERROR!!!\n"+
			   		 "Validation of \"Action Code\" against database brought the following results:\n"+
			   		 "\t"+v_VerbCode+";\n"+
					 "\t"+v_NounCode+";\n"+
					 "It would not be possible to process entered values.\nPlease reconsider your data entry.");
			   of_setSingleValue(v_CtrlName, "''" , "", "", 0);
			   eval(v_CtrlName+".focus();");
			   of_outPut("span_ActionMsg", v_ActionCode_Default);
		 }
		 else if (v_VerbCode != "0" && v_NounCode != '0')
		 {
			  v_VerbCode = "\"Verb\" Code: "+v_VerbCode;
			  v_NounCode = "\"Noun\" Code: "+v_NounCode
			  of_outPut("span_ActionMsg", v_VerbCode+";    "+v_NounCode+";");
			  // Determine name of the control where cursor should be placed: -------------------
			  for (var e=0; e<elements.length; e++)
			  {
				  if (arg_CtrlName == elements[e].name)
				  { 
					  v_NextCtrlName = elements[e+1].name;
					  break; 
				  }
			  }
			  //
			  eval(v_NextCtrlName+".focus();");
		 }
	}//3
	//
}}
//==================================================================================
function f_onKeyUpNSN(arg_CtrlName){with(self.document.forms[0])//DONE
{
	var v_isNumeric = "YES";
	//
	of_getCtrlProperties(arg_CtrlName);
	//
	for (var i=0; i<v_CtrlValue.length; i++)
	{//1
		
		v_Char = v_CtrlValue.substr(i,1);
		//v_Char = parseInt(v_Char);
		//
		if (objRegExp_onlyNumeric.test(v_Char) == false)
		{//1.1
			alert("Special charecters, white spaces, and alpha values are not allowed in '"+v_CtrlAlt+"' field.\n"+
				  "To populate this field, please use only numeric values.");
			v_isNumeric = "NO";
			//Removing "unauthorised" charecter, set value without it:
			eval(v_CtrlName+".value=\""+v_CtrlValue.substr(0,i)+v_CtrlValue.substr(i+1, v_CtrlValue.length)+"\"");
			eval(v_CtrlName+".focus();");
			break;
		}//1.1
	}//1
	//
	if (v_isNumeric == "YES")
	{//2
		for (var e=0; e<elements.length; e++)
		{//2.1
			if (arg_CtrlName == elements[e].name)
			{ //2.1.1
				v_NextCtrlName = elements[e+1].name;
				break; 
			}//2.1.1
		}//2.1
		//
		// The following "moves" focus to the next field after appropriate length of the value is entered.
		v_CtrlValueLength = eval(v_CtrlName+".value.length");
		
		if (parseInt(v_CtrlValueLength) == parseInt(v_CtrlName.substr(v_CtrlName.length-1)))
		{//2.2
			eval(v_NextCtrlName+".focus();");
		}//2.2
	}//2
}}
//========================================================================================
function f_onKeyUp_4(arg_CtrlName){with(self.document.forms[0])
{
	of_getCtrlProperties(arg_CtrlName);
	//
	for (var e=0; e<elements.length; e++)
	{//1
		if (arg_CtrlName == elements[e].name)
		{//1.1
			
			v_CtrlValueLength = eval(v_CtrlName+".value.length");
			
			for (var i=0; i<v_CtrlValueLength; i++)
			{//1.1.1
				v_Char = v_CtrlValue.substr(i,1);
				
				
				if (arg_CtrlName == "txt_ModOrder_Acronym")
				{
					if (objRegExp_onlyAlphaNumeric.test(v_Char) == false) 
					{
						alert("Special charecters and white spaces are not allowed in '"+v_CtrlAlt+"'.\n"+
							  "To populate this field, please use only alpha-numeric values.");
						//Removing "unauthorised" charecter, set value without it:
						eval(v_CtrlName+".value=\""+v_CtrlValue.substr(0,i)+v_CtrlValue.substr(i+1, v_CtrlValue.length)+"\"");
						eval(v_CtrlName+".focus();");
						break;
					}
				}
				
				
				if (arg_CtrlName == "txt_ModOrder_ClassCode")
				{//1.1.1.1
					if (objRegExp_onlyAlpha.test(v_Char) == false)
					{
						alert("Special charecters, white spaces, and numeric values are not allowed in '"+v_CtrlAlt+"'.\n"+
							  "To populate this field, please use only alpha values.");
						//Removing "unauthorised" charecter, set value without it:
						eval(v_CtrlName+".value=\""+v_CtrlValue.substr(0,i)+v_CtrlValue.substr(i+1, v_CtrlValue.length)+"\"");
						eval(v_CtrlName+".focus();");
						break;
					}
				}//1.1.1.1
				//
				if (arg_CtrlName == "txt_ModOrder_WorkOrder")
				{//1.1.1.2
					if (objRegExp_onlyNumeric.test(v_Char) == false)
					{
						alert("Special charecters, white spaces, and alpha values are not allowed in '"+v_CtrlAlt+"'.\n"+
							  "To populate this field, please use only numeric values.");
						//Removing "unauthorised" charecter, set value without it:
						eval(v_CtrlName+".value=\""+v_CtrlValue.substr(0,i)+v_CtrlValue.substr(i+1, v_CtrlValue.length)+"\"");
						eval(v_CtrlName+".focus();");
						break;
					}
				}//1.1.1.2
			}//1.1.1
		}//1.1
	}//1
}}
//========================================================================================
function f_Save(){with(self.document.forms[0])
{
	//--------------------------------------------------------------------------------------------
	
	var v_SP_Call      = "EMAPP.EM_BULLTN_EDITOR_01.sp_saveBulletin?p_currentUser="+v_currentUser+"&";
	var v_SP_Call_Test = "EMAPP.EM_BULLTN_EDITOR_01.sp_saveBulletin?\np_currentUser="+v_currentUser+"\n&"; 
	// Variable "v_SP_Call_Test" does not have any functional meaning and should be used for validation/evaluation values passed to the database
	var v_ConfirmationMsg = "ATTENTION!!!\n"+
							"This is the last confirmation before database record is created or updated in the repository of bulletins.  "+
							//"and Work Order (WO) is assigned to the sites with applicable equipment.\n\n"+
							"Please, responsibly review data you just provided since the correction "+
							"of the mistake is a complex and time consuming process.\n\n";
							
	var v_BulletinPointer_BeforeSave = "-1"; // <--- Default value represents a request to create a new record.
	
	var v_Name = ""; 
	var arrayCtrlNames = new Array( ////// FIND RECORD:
									//"txt_Find_DateFrom","txt_Find_DateTo",
									//"sel_FindBulletinType", "txt_FindBulletin_Num_Seq", "txt_FindBulletin_Year",
									//// LIST OF BULLETINS:
									/////						// Position Number in the array:
									"sel_listOfBulletins",		// 0
									//// BULLETIN DETAILS:
									"sel_ModOrder_Type", 		// 1
									"txt_ModOrder_Num_Seq", 	// 2
									"txt_ModOrder_Year",		// 3
									//  
									"txt_ModOrder_Date_Issued",	// 4
									"txt_ModOrder_Date_Due",	// 5
									//
									"txt_ModOrder_SoftVer",		// 6
									"txt_ModOrder_Descr",		// 7
									"txa_ModOrder_Comments",	// 8
									"sel_ModOrder_WorkCodes",	// 9 
									"txt_ModOrder_ActionCode", 	// 10
									"txt_ModOrder_EstHours",	// 11
									//
									"txt_NSN_1_4", 				// 12
									"txt_NSN_2_2", 				// 13
									"txt_NSN_3_3", 				// 14
									"txt_NSN_4_4",				// 15 
									//
									"txt_ModOrder_Acronym",		// 16
									"txt_ModOrder_ClassCode", 	// 17
									"txt_ModOrder_WorkOrder"	// 18
 								  );
	//-----------------------------------------------------------------------------------------------
	
	of_getCtrlProperties("sel_listOfBulletins");
	
	// Collect entered data from the screen:
	for (var r=0; r<arrayCtrlNames.length; r++)
	{
		//v_Name removes the first 4 charecters from the control name, ex: "txt_Find_DateTo" becomes "Find_DateTo".
		v_Name = arrayCtrlNames[r].substr(4);
		//v_SP_Call builds a list of parameters to be passed to the stored procedure adding "p_" to the v_Name,
		// ex: "Find_DateTo" becomes "p_Find_DateTo&".
		v_SP_Call = v_SP_Call+"p_"+v_Name+"="+document.getElementById(arrayCtrlNames[r]).value+"&";
		v_SP_Call_Test = v_SP_Call_Test+"p_"+v_Name+"="+document.getElementById(arrayCtrlNames[r]).value+"\n&";
	}
	v_SP_Call = v_SP_Call.substr(0,v_SP_Call.length-1); //Removing the last "&" from the value of v_SP_Call.
	v_SP_Call_Test = v_SP_Call_Test.substr(0,v_SP_Call_Test.length-1); //Removing the last "&" from the value of v_SP_Call.
	//
	// TEST: alert(v_SP_Call_Test)
	// 
	v_ConfirmationMsg = v_ConfirmationMsg+"\tBulletin Number: ...."+document.getElementById(arrayCtrlNames[1]).value+"-"+
														            document.getElementById(arrayCtrlNames[2]).value+"-"+
														            document.getElementById(arrayCtrlNames[3]).value+";\n";
	v_ConfirmationMsg = v_ConfirmationMsg+"\tIssue Date: ..............."+document.getElementById(arrayCtrlNames[4]).value+";\n";
	v_ConfirmationMsg = v_ConfirmationMsg+"\tDue Date: ................."+document.getElementById(arrayCtrlNames[5]).value+";\n";
	if (document.getElementById(arrayCtrlNames[1]).value == "SMO")
	{
		v_ConfirmationMsg = v_ConfirmationMsg+"\tSoftware version: ...."+document.getElementById(arrayCtrlNames[6]).value.toUpperCase()+";\n";
	}
	v_ConfirmationMsg = v_ConfirmationMsg+"\tBrief description: ....."+document.getElementById(arrayCtrlNames[7]).value.toUpperCase()+";\n";
	v_ConfirmationMsg = v_ConfirmationMsg+"\tComments: .............."+document.getElementById(arrayCtrlNames[8]).value.toUpperCase()+";\n";
	v_ConfirmationMsg = v_ConfirmationMsg+"\tWork Code: .............."+document.getElementById(arrayCtrlNames[9]).value+";\n";
	v_ConfirmationMsg = v_ConfirmationMsg+"\tAction Code: ..........."+document.getElementById(arrayCtrlNames[10]).value.toUpperCase()+";\n";
	v_ConfirmationMsg = v_ConfirmationMsg+"\tEstimated hours: ....."+document.getElementById(arrayCtrlNames[11]).value+";\n";
	if (document.getElementById(arrayCtrlNames[12]).value+"-"+
	    document.getElementById(arrayCtrlNames[13]).value+"-"+
	    document.getElementById(arrayCtrlNames[14]).value+"-"+
	    document.getElementById(arrayCtrlNames[15]).value != "---")
	{	
		v_ConfirmationMsg = v_ConfirmationMsg+"\tNSN: ........................."+document.getElementById(arrayCtrlNames[12]).value+"-"+
																				 document.getElementById(arrayCtrlNames[13]).value+"-"+
																				 document.getElementById(arrayCtrlNames[14]).value+"-"+
																				 document.getElementById(arrayCtrlNames[15]).value+";\n";
	}
	v_ConfirmationMsg = v_ConfirmationMsg+"\tAcronym: ................."+document.getElementById(arrayCtrlNames[16]).value.toUpperCase()+";\n";
	v_ConfirmationMsg = v_ConfirmationMsg+"\tClass code: .............."+document.getElementById(arrayCtrlNames[17]).value.toUpperCase()+";\n";
	v_ConfirmationMsg = v_ConfirmationMsg+"\tWork order: .............."+document.getElementById(arrayCtrlNames[18]).value+".";
	
	v_ConfirmationMsg = v_ConfirmationMsg+"\n\nIf reviewed data is confirmed and you would like to proceed,\n"+
										  "click \"OK\" button.\n"+
										  "If any changes are required,"+
										  "click \"Cancel\".";
	if (confirm(v_ConfirmationMsg))
	{
		v_BulletinPointer_BeforeSave = document.getElementById(arrayCtrlNames[0]).value; //<--- A value in the control "sel_listOfBulletins";
		
		// TEST:  alert(v_SP_Call_Test);
		
		objAJAX.load(v_SP_Call);
		//
		if (objAJAX.parsed)
		{
			v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
			v_NumberOfRecords = v_ArrayOfRecords.length;
			
			for (var r=0; r<v_NumberOfRecords; r++)
			{//1.2.1
				v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			   
			    v_Bulletin_Ptr = v_ArrayOfValuesInRecord[0].text; 
			}//1.2.1
		}
		//
		f_onClick("cb_RefreshListOfBulletins");// <--- Retrieves records within dates specified in "txt_Find_DateFrom","txt_Find_DateTo".
		//
		of_selectRecord("sel_listOfBulletins", v_Bulletin_Ptr); // <--- Highlights newly created record where ID = v_Bulletin_Ptr
		//
		f_onChange("sel_listOfBulletins"); // <--- Retrieves details of the record where ID = v_Bulletin_Ptr
		//
		if (v_BulletinPointer_BeforeSave == "-1")
		{
			alert("A new record is created in the repository of Bulletins.\n"+
				  "To finish the process of Order Management, please proceed to the next step called \"Bulletin Step 2\", "+
				  "otherwise newly created bulletin will not be applied to the equipment in the site(s).");
		}
		else //v_BulletinPointer_BeforeSave != "-1"
		{
			alert("An existing record is updated in the repository of Bulletins.\n"+
				  "To finish the process of Order Management, please proceed to the next step called \"Bulletin Step 2\", "+
				  "otherwise changes in updated bulletin will not be applied to the equipment in the site(s).");
		}
		//
	}
	else
	{
		cb_Save.focus();
	}
}}
//========================================================================================
//// ACTIUON functions end.
//========================================================================================
//========================================================================================
//// VALIDATION function start:
//========================================================================================
function f_validateTypeAndNumber(){with(self.document.forms[0])
{//"sel_ModOrder_Type", "txt_ModOrder_Num_Seq", "txt_ModOrder_Year"

	var v_RtnYESorNO = "YES";
	var arrayCtrlNames = new Array( "sel_ModOrder_Type", "txt_ModOrder_Num_Seq", "txt_ModOrder_Year");
	//...........................................................................
	for (var c=0; c<arrayCtrlNames.length; c++)
	{
		of_getCtrlProperties(arrayCtrlNames[c]);
		
		if (v_CtrlName == "sel_ModOrder_Type" && v_CtrlValue == v_DefaultValue)
		{
			v_RtnYESorNO = "NO";
			sel_ModOrder_Type.focus();
			alert("System cannot process your request.\n'"+v_CtrlAlt+"' has not been selected.");
			
		}
		else if ( v_RtnYESorNO == "YES" && v_CtrlName == "txt_ModOrder_Num_Seq" && v_CtrlValue.length < 3)
		{
			v_RtnYESorNO = "NO";
			txt_ModOrder_Num_Seq.focus();
			alert("System cannot process your request.\n'"+v_CtrlAlt+"' must have 3 digits.");
			
		}
		else if ( v_RtnYESorNO == "YES" && v_CtrlName == "txt_ModOrder_Year" && v_CtrlValue.length < 2)
		{
			v_RtnYESorNO = "NO";
			txt_ModOrder_Year.focus();
			alert("System cannot process your request.\n'"+v_CtrlAlt+"' must have 2 digits.");
		}
	}	
	
	return v_RtnYESorNO;
}}
//========================================================================================

function f_validateIssueAndDueDates(){with(self.document.forms[0])
{//"txt_ModOrder_Date_Issued", "txt_ModOrder_Date_Due"
		
		var v_RtnYESorNO = "YES";
		var arrayCtrlNames = new Array( "txt_ModOrder_Date_Issued", "txt_ModOrder_Date_Due" );
		
		//// 1. Check if dates were entered in a proper format:
		for (var r=0; r<arrayCtrlNames.length; r++)
		{
			of_getCtrlProperties(arrayCtrlNames[r]);
			v_RtnYESorNO = of_validateDate(v_CtrlName);
			
			if (v_RtnYESorNO == "NO")
			{
				break;	
			}
		}
		//...........................................................................
		//// 2. If dates were properly formated, check if "Issue Date" is set earlier than "Due Date"
		if (v_RtnYESorNO == "YES")
		{
				objAJAX.load("EMAPP.EM_BULLTN_EDITOR_01.sp_validateDates?p_ModOrder_Date_Issued="+document.getElementById('txt_ModOrder_Date_Issued').value+
																	   "&p_ModOrder_Date_Due="+document.getElementById('txt_ModOrder_Date_Due').value);
				if (objAJAX.parsed)
				{//1.5.1
					v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
					v_NumberOfRecords = v_ArrayOfRecords.length;
					//TEST: alert(v_NumberOfRecords);
					for (var r=0; r<v_NumberOfRecords; r++)
					{//1.5.1.1
						v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
						
						//v_IssueDateBack  = v_ArrayOfValuesInRecord[0].text;
						v_IssueDueDtDiff = v_ArrayOfValuesInRecord[1].text;
						//v_SysDate 		 = v_ArrayOfValuesInRecord[2].text;
						
					}//1.5.1.1
					
					if (v_IssueDueDtDiff < 1)
					{
						v_RtnYESorNO = "NO";
						alert("System cannot process your request."+
							  "\nDates used to create 'Issue Date' and 'Due Date' are not properly defined."+
							  "\n'Issue Date' must precedes 'Due Date'.");
						txt_ModOrder_Date_Issued.focus();
					}
				}
		}
		
		return v_RtnYESorNO;
}}
//========================================================================================
function f_validateSoftwareVersion(){with(self.document.forms[0])
{ ////"txt_ModOrder_SoftVer", "sel_ModOrder_Type"
	var v_RtnYESorNO = "YES";
	
	of_getCtrlProperties("sel_ModOrder_Type");
	if ( v_CtrlValue == "SMO" )
	{
		of_getCtrlProperties("txt_ModOrder_SoftVer");
		if ( v_CtrlValue == "")
		{
			v_RtnYESorNO = "NO";
			alert( "System cannot process your request."+
				   "\nSoftware version must be provided if 'SMO' is selected in control 'Type and Number'." );
			txt_ModOrder_SoftVer.focus();
		}
	}
	
	return v_RtnYESorNO;
	
}}
//========================================================================================
function f_validate_txt_DataPresence(){with(self.document.forms[0])
{
	var v_RtnYESorNO = "YES";
	var arrayCtrlNames = new Array( "txt_ModOrder_Descr", 
									"txa_ModOrder_Comments",
									"txt_ModOrder_ActionCode",  
									"txt_ModOrder_EstHours", 
									//"txt_NSN_1_4", "txt_NSN_2_2", "txt_NSN_3_3", "txt_NSN_4_4", 
									"txt_ModOrder_Acronym", 
									"txt_ModOrder_ClassCode", 
									"txt_ModOrder_WorkOrder" );
	//// Validate data presence in mandatory fields:
	for (var r=0; r<arrayCtrlNames.length; r++)
	{
		of_getCtrlProperties(arrayCtrlNames[r]);
		
		if (of_Trim(v_CtrlValue) == "")
		{
			// TEST: alert(v_CtrlName+"   "+v_CtrlValue);
			
			v_RtnYESorNO = "NO";
			alert("System cannot process your request.\n"+
				  "'"+v_CtrlAlt+"' is a mandatory field. Value must be provided.")
			eval(v_CtrlName+".focus()");
			break;
		}
		
	}
	
	return v_RtnYESorNO;
}}
//========================================================================================
////"txt_NSN_1_4", "txt_NSN_2_2", "txt_NSN_3_3", "txt_NSN_4_4",
function f_validateNSN(){with(self.document.forms[0])
{
	var v_RtnYESorNO = "YES";
	var arrayCtrlNames = new Array( "txt_NSN_1_4", "txt_NSN_2_2", "txt_NSN_3_3", "txt_NSN_4_4");
	var v_NSN_1_4_Length = txt_NSN_1_4.value.length;
	var v_NSN_2_2_Length = txt_NSN_2_2.value.length;
	var v_NSN_3_3_Length = txt_NSN_3_3.value.length;
	var v_NSN_4_4_Length = txt_NSN_4_4.value.length;
	
	var v_Msg = "System cannot process your request.\n'NSN' (National Stock Number) is not properly provided.";
	//-----------------------------------------------------------------------------------
	if ( 
		 (v_NSN_1_4_Length + v_NSN_2_2_Length + v_NSN_3_3_Length + v_NSN_4_4_Length > 0) 
		  &&
		 (v_NSN_1_4_Length + v_NSN_2_2_Length + v_NSN_3_3_Length + v_NSN_4_4_Length < 13) 
		)
	{
			for (var r=0; r<arrayCtrlNames.length; r++)
			{
				of_getCtrlProperties(arrayCtrlNames[r]);
				
				if ( arrayCtrlNames[r] == "txt_NSN_1_4" && v_NSN_1_4_Length != 4 )
				{
					v_RtnYESorNO = "NO";
					alert(v_Msg)
					eval(v_CtrlName+".focus()");
					break;
				}
				else if (v_RtnYESorNO == "YES" && arrayCtrlNames[r] == "txt_NSN_2_2" && v_NSN_2_2_Length != 2)
				{
					v_RtnYESorNO = "NO";
					alert(v_Msg)
					eval(v_CtrlName+".focus()");
					break;	
				}
				else if (v_RtnYESorNO == "YES" && arrayCtrlNames[r] == "txt_NSN_3_3" && v_NSN_3_3_Length != 3)
				{
					v_RtnYESorNO = "NO";
					alert(v_Msg)
					eval(v_CtrlName+".focus()");
					break;	
				}
				else if (v_RtnYESorNO == "YES" && arrayCtrlNames[r] == "txt_NSN_4_4" && v_NSN_4_4_Length != 4)
				{
					v_RtnYESorNO = "NO";
					alert(v_Msg)
					eval(v_CtrlName+".focus()");
					break;	
				}
			}
	}
	
	return v_RtnYESorNO;
	
}}
//========================================================================================
function f_validateAcronymAndClassCode(){with(self.document.forms[0])
{
	var v_RtnYESorNO = "YES";
	
	objAJAX.load("EMAPP.EM_BULLTN_EDITOR_01.sp_validateAcronymClassCode?p_Acronym="+document.getElementById("txt_ModOrder_Acronym").value+
																      "&p_ClassCode="+document.getElementById("txt_ModOrder_ClassCode").value);
	if (objAJAX.parsed)
	{
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length;
		//TEST: alert("v_NumberOfRecords  "+v_NumberOfRecords);
		
		for (var r=0; r<v_NumberOfRecords; r++)
        {//1.2.1
            v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
            v_RtnYESorNO = v_ArrayOfValuesInRecord[0].text; 
		}//1.2.1
	}
	//
	if (v_RtnYESorNO == 0)
	{
		v_RtnYESorNO = "NO";
		
		alert("System cannot process your request.\n"+
			  "Provided combination of \"Acronym\" and \"Class Code\" does not match any database record.\n"+
			  "Please reconsider your entry.");
		
		txt_ModOrder_Acronym.focus();
	}
	else if (v_RtnYESorNO > 0)
	{
		v_RtnYESorNO = "YES";
	}
	
	return v_RtnYESorNO;
}}
//========================================================================================
function f_validateWorkCode(arg_CtrlName){with(self.document.forms[0])
{ 
	var v_RtnYESorNO = "YES";
	
	of_getCtrlProperties(arg_CtrlName);
	
	if (v_CtrlValue == "-1")
	{
		v_RtnYESorNO = "NO";
		alert("System cannot process your request.\n"+
				  "'"+v_CtrlAlt+"' is a mandatory field. Value must be provided.")
		eval(v_CtrlName+".focus()");
	}
	
	return v_RtnYESorNO;
}}
//========================================================================================
//// VALIDATION functions end.
//========================================================================================

//========================================================================================
// PAGE SPECIFIC FUNCTIONS end
//========================================================================================
// INITIAL ACTIONS:
// Create and position all control on the screen:
of_outPut('div_Bltn1', f_positionMainTbl() );
////
f_getBulletinList(v_DefaultFind_DateFrom, v_DefaultFind_DateTo);
////
f_resetPage("FULL_PAGE");
//////of_setSingleValue("txt_ModOrder_Year", String(v_FiscalYr).substr(2,2), "", "", 0);
//=================================================================================
