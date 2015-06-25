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
{//TEST: alert(arg_WhereOutput+"  "+ arg_WhatOutput)
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
	//"TABLE { background-color: #336699; border: 10px outset white; font-weight: bold; font-size: 12px; }"+

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
	//alert(v_FiscalYr)
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
"<table width=\"920px\" border=\"0\">"+
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
			"<td id=\"td_Navigation\" colspan=\"3\">"+f_positionNavigation()+"</td>"+
	  "</tr>"+
"</table>";
  
  return v_Out;
  
}
//===================================================================================
function f_positionFindCtrls()
{
   
   v_Out = 
   		"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
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
				"<td>&nbsp;</td>"+
			"</tr>"+
		"</table>";

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
						"MODIF. NUM"+ 
					"</font>"+
				"</td>"+	
				"<td width=\"9%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"ISSUE DATE"+
					"</font>"+ 
				"</td>"+
				"<td width=\"14%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"SOFTWARE VER"+
					"</font>"+ 
				"</td>"+
				"<td width=\"32%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"WORK ORDER DESCR"+
					"</font>"+ 
				"</td>"+
				"<td width=\"13%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"NSN"+
					"</font>"+ 
				"</td>"+
				"<td width=\"9%\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"ACRONYM"+
					"</font>"+ 
				"</td>"+
				"<td width=\"5\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"CLASS CD"+
					"</font>"+ 
				"</td>"+
				"<td width=\"12\" class=\"c_TblHeader\" align=\"center\">"+
					"<font style=\"font-family:'Courier New', Courier, monospace; color:#FFF; font-weight:bold; font-size:11px;\">"+
						"<font color=\"#FF0000\">&aelig;</font>"+
						"LINKED TO W.ORDER"+
					"</font>"+ 
				"</td>"+
			"</tr>"+
			"<tr>"+
				"<td colspan=\"8\">"+
					  "<select id=\"sel_listOfBulletins\" "+
							  "name=\"sel_listOfBulletins\" "+
							  "size=\"12\" "+
							  "alt=\"LIST OF BULLETINS\" "+
							  "tabindex=\"7\" "+
							  "onChange=\"f_onChange(this.name)\" "+
							  "style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
							  "class=\"c_CtrlValue\" "+
							  "selected=\"selected\"> "+
					  "</select>"+
				"</td>"+
			"</tr>"+
			"<tr>"+
				"<td colspan=\"8\">"+
					"<font color=\"#FF0000\">&aelig;</font> - <font class=\"c_CtrlName\" >How to read values available in column \"LINKED TO WORK ORDER\":</font>"+
					"<li>"+
					"<font class=\"c_CtrlName\" >YES - Bulletin was created and applied to the relevant Work Orders.</font>"+
					"</li>"+
					"<li>"+
					"<font class=\"c_CtrlName\" >NO - Bulletin was created but was NOT applied to the relevant Work Orders.</font>"+
					"</li>"+
					"<li>"+
					"<font class=\"c_CtrlName\" >CHANGED - Bulletin was previously applied to Work Orders, "+
														  "but the bulletin was changed and changes were not reflected on Work Orders.</font>"+
					"</li>"+
				"</td>"+
			"</tr>"+
			
		"</table>";
		//............................................................................
	return v_Out;
}
//====================================================================================
function f_positionBulletinsDetails()
{
	v_Out = 
	"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
		  "<tr>"+
				"<td width=\"38%\">LIST OF SOURCE SITES</td>"+
				"<td width=\"24%\">NOTES:</td>"+
				"<td width=\"38%\">LIST OF APPLIED SITES</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td width=\"38%\" align=\"center\"> "+
					  "<select id=\"sel_SourceSites\" "+
							  "name=\"sel_SourceSites\" "+
							  "size=\"19\" "+
							  "alt=\"List of source sites\" "+
							  "tabindex=\"\" "+
							  "onChange=\"f_onChange(this.name)\" "+
							  "style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" > "+
					  "</select>"+				
				"</td>"+ 
				"<td width=\"24%\" align=\"center\">"+
					 "<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
						  "<tr align=\"left\">"+
								"<td><font class=\"c_CtrlName\" >1. To apply a particular bulletin, to the<br />"+
															  "<strong>entire list</strong> of the sites, just highlight<br />"+
					  										  "the very first row: \"ALL APPLICABLE SITES\",<br />"+
															  "and click button \"->\".</font>"+
									 "<br />"+
									 "<font class=\"c_CtrlName\" >2. To apply a particular bulletin, to the<br />"+
									 						   "<strong>selected site</strong>, just highlight that site,<br />"+
															   "and click button \"->\".</font>"+
									 "<br /><br />"+
								"</td>"+
						  "</tr>"+
						  "<tr align=\"center\">"+
								"<td>"+
									"<input type=\"button\" name=\"cb_MoveToApplied\" onclick=\"f_onClick(this.name)\" value=\"--->\" />"+
									"<br /><br />"+
			  					    "<input type=\"button\" name=\"cb_MoveToSource\" onclick=\"f_onClick(this.name)\" value=\"<---\" />"+
					            "</td>"+
						  "</tr>"+
						  "<tr align=\"left\">"+
							    "<td><font class=\"c_CtrlName\" >3. To remove the <strong>entire list</strong> of sites from the<br />"+
															  "\"LIST OF APPLIED SITES\", highlight the very first row<br />"+
															  "and click button \"<-\".</font>"+
									 "<br />"+
									 "<font class=\"c_CtrlName\" >3. To remove a <strong>particular site</strong> from the<br />"+
															  "\"LIST OF APPLIED SITES\", highlight that site<br />"+
															  "and click button \"<-\".</font>"+
								"</td>"+
						  "</tr>"+
					 "</table>"+
				"</td>"+
				"<td width=\"38%\" align=\"center\">"+
						"<select id=\"sel_AppliedSites\" "+
								"name=\"sel_AppliedSites\" "+
								"size=\"19\" "+
								"alt=\"List of applied sites\" "+
								"tabindex=\"\" "+
								"onChange=\"f_onChange(this.name)\" "+
								"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" > "+
						"</select>";
				"</td>"+ 				
		  "</tr>"+
  "</table>";
	
	return v_Out;
}//====================================================================================
function f_positionNavigation()
{//width=\"100%\"
	v_Out = "<br />"+
	"<table  align=\"center\" style=\"background-color:#CCCCCC; border-style:none;\"  border=\"0\" cellspacing=\"2\" cellpadding=\"2\">"+
			"<tr>"+
					"<td align=\"center\">"+
						  "&nbsp;&nbsp;&nbsp;&nbsp;"+
						  "<input type=\"button\" name=\"cb_Save\" onclick=\"f_onClick(this.name)\" value=\"Save\" />"+
						  "&nbsp;&nbsp;&nbsp;&nbsp;"+"&nbsp;&nbsp;&nbsp;&nbsp;"+
						  "<input type=\"button\" name=\"cb_Reset\" onclick=\"f_onClick(this.name)\" value=\"Reset\" />"+
						  "&nbsp;&nbsp;&nbsp;&nbsp;"+
						  "<input type=\"button\" name=\"cb_Exit\" onclick=\"f_onClick(this.name)\" value=\"&nbsp;&nbsp;Exit&nbsp;&nbsp;\" />"+
					"</td>"+
			"</tr>"+
	"</table>";

	return v_Out;
}
//==========================================================================================
//// SETTIN-UP PAGE CONTROL end.
//==========================================================================================

////"txt_Find_DateFrom","txt_Find_DateTo",
////"sel_FindBulletinType", "txt_FindBulletin_Num_Seq", "txt_FindBulletin_Year",
////// LIST OF BULLETINS:
///////						// Position Number in the array:
//"sel_listOfBulletins",		// 0
//==========================================================================================
//// ACTION function start:
//==========================================================================================
var v_DefaultTextSite  = "All applicable sites _______";

orgBfr_AllSites = new Array();
orgBfr_AppliedSites = new Array();
fltrBfr_AppliedSites = new Array();

var a = 0; //Counter for Active sites
function array_Sites ( a_site_id, a_site_name_show, a_site_status_code )
{
	this.a_site_id          = a_site_id;
	this.a_site_name_show   = a_site_name_show;
	this.a_site_status_code = a_site_status_code;
}
//---------------------------------------------------------------------------------
function f_getAllSites(){with(self.document.forms[0])
{
	objAJAX.load('EMAPP.EM_EQUIP_TRANSFER_S1.em_getAllSites');
	if (objAJAX.parsed)
	{//1.2
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length; //TEST: alert(v_NumberOfRecords)
		//
		for (var r=0; r<v_NumberOfRecords; r++)
		{//1.2.1
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			orgBfr_AllSites[r] = new array_Sites( v_ArrayOfValuesInRecord[0].text, //a_site_id
  											      v_ArrayOfValuesInRecord[1].text, //a_site_name_show
												  v_ArrayOfValuesInRecord[2].text  //a_site_status_code
											     );
// IF the list of Active sites is needed:
//			if (v_ArrayOfValuesInRecord[2].text == 'A')
//			{
//				v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
//				orgBfr_ActiveSites[a] = new array_Sites( v_ArrayOfValuesInRecord[0].text, //a_site_id
//													     v_ArrayOfValuesInRecord[1].text, //a_site_name_show
//													     v_ArrayOfValuesInRecord[2].text  //a_site_status_code
//													    );
//				a++;
//			}
		}//1.2.1
	}//1.2
}}
//---------------------------------------------------------------------------------
function f_setSourceSites(){with(self.document.forms[0])
{
	of_setSingleValue("sel_SourceSites", v_DefaultValue, v_DefaultTextSite+" Records:"+orgBfr_AllSites.length, "YES", 0);
	for (var s=0; s<orgBfr_AllSites.length; s++)
	{
		of_setSingleValue("sel_SourceSites", orgBfr_AllSites[s].a_site_id, "("+orgBfr_AllSites[s].a_site_status_code+")"+orgBfr_AllSites[s].a_site_name_show, "NO", s+1);
	}
	//
	of_selectRecord("sel_SourceSites", v_DefaultValue);  //<--- Highlights the first record which value is "-1".
}}
//---------------------------------------------------------------------------------
function f_getset_ListOfAppliedSites(){with(self.document.forms[0])
{ 
	//.............................................................................
	
	v_NumberOfRecords = 0;
	
	orgBfr_AppliedSites.length = 0;
	of_getCtrlProperties("sel_listOfBulletins");
	//
	objAJAX.load('EMAPP.EM_BULLTN_EDITOR_01.sp_getAppliedSites?p_Bulletin_Ptr='+v_CtrlValue);
	if (objAJAX.parsed)
	{
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length;
		// TEST: alert("772   "+v_NumberOfRecords)
		
		if (v_NumberOfRecords == "0")
		{
			of_setSingleValue("sel_AppliedSites", v_DefaultValue, "List of applied sites ____________ Records: "+v_NumberOfRecords, "YES", 0);
			
			orgBfr_AppliedSites[0] = new array_Sites( v_DefaultValue, 													//a_site_id
													  "List of applied sites ____________ Records: "+v_NumberOfRecords, //a_site_name_show
													  ""  																//a_site_status_code
													);
		}	
		else		  
		{
			of_setSingleValue("sel_AppliedSites", v_DefaultValue, "List of applied sites ____________ Records: "+v_NumberOfRecords, "YES", 0);
			
			for (var r=0; r<v_NumberOfRecords; r++)
			{
				v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
				
				orgBfr_AppliedSites[r] = new array_Sites( v_ArrayOfValuesInRecord[0].text, //a_site_id
														  v_ArrayOfValuesInRecord[1].text, //a_site_name_show
														  v_ArrayOfValuesInRecord[2].text  //a_site_status_code
														 );
				of_setSingleValue("sel_AppliedSites", v_ArrayOfValuesInRecord[0].text, "("+v_ArrayOfValuesInRecord[2].text+")"+v_ArrayOfValuesInRecord[1].text, "NO", r+1);
			}
		}
	}
	//
	of_selectRecord("sel_AppliedSites", v_DefaultValue);  // v_DefaultValue = "-1"
	//
}}
//---------------------------------------------------------------------------------
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
	var v_em_wo_t_updated = "";
	
	var v_NumOdIterations = 0;
	
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
			 v_Desh = "-"; // 118 is used to create proportional length of the record to make output looks well.
			 for (var i=0; i<118; i++){v_Desh = v_Desh+"-";}
			 of_setSingleValue("sel_listOfBulletins", v_DefaultValue, "----------"+"CREATE NEW RECORD"+v_Desh, "YES",  0); 
			 //
			 of_outPut("span_NumOfBulletins", v_NumberOfRecords);
		//....................................................................................................
		if (v_NumberOfRecords == 0)
		{
			 v_Desh = "-"; // 113 is used to create proportional length of the record.
			 for (var i=0; i<118; i++){v_Desh = v_Desh+"-"; }
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
					v_soft_ver 		  = of_RPad(v_ArrayOfValuesInRecord[4].text, 20, " "); 
					
					v_wo_desc 		  = v_ArrayOfValuesInRecord[5].text.substr(0, 45);
					v_wo_desc 		  = of_RPad(v_wo_desc, 49, " ");
					
					v_nsn 			  = of_RPad(v_ArrayOfValuesInRecord[6].text, 18, " ");
					v_acronym 		  = of_RPad(v_ArrayOfValuesInRecord[7].text, 15, " ");
					v_class_code 	  = of_RPad(v_ArrayOfValuesInRecord[8].text, 10, " "); 
					v_wo_t_updated	  = v_ArrayOfValuesInRecord[9].text;
					
					if      (v_ArrayOfValuesInRecord[9].text == "Y"){ v_em_wo_t_updated = "YES"; }
					else if (v_ArrayOfValuesInRecord[9].text == "N"){ v_em_wo_t_updated = "NO"; }
					else if (v_ArrayOfValuesInRecord[9].text == "C"){ v_em_wo_t_updated = "CHANGED"; }
					v_em_wo_t_updated = of_RPad(v_em_wo_t_updated, 7, " ");
					
					v_BulletinText =v_modification_no+v_date_issued+v_soft_ver+v_wo_desc+v_nsn+v_acronym+v_class_code+v_em_wo_t_updated;
					
//					//// TEST:
//					alert("v_modification_no="+v_modification_no.length*100/160+"\n  "+
//						  "v_date_issued="+v_date_issued.length*100/160+"\n  "+
//						  "v_soft_ver="+v_soft_ver.length*100/160+"\n  "+
//						  "v_wo_desc="+v_wo_desc.length*100/160+"\n  "+
//						  "v_nsn="+v_nsn.length*100/160+"\n  "+
//						  "v_acronym="+v_acronym.length*100/160+"\n  "+
//						  "v_class_code="+v_class_code.length*100/160+"\n  "+
//						  "v_em_wo_t_updated = 12  \n"+
//						  "160"
//						  );
//					//// TEST
									 
					of_setSingleValue("sel_listOfBulletins", v_BulletinValue, v_BulletinText, "NO", r+1)
					
				}//1.2.1		
		}
	}
}}
//----------------------------------------------------------------------------------------
function f_onChange(arg_CtrlName){with(self.document.forms[0]) sel_listOfBulletins
{
	of_getCtrlProperties(arg_CtrlName);
	//
	switch(arg_CtrlName)
    {
		//................................................................................
		case "sel_listOfBulletins":
			of_selectRecord("sel_SourceSites", v_DefaultValue);  // v_DefaultValue = "-1"
			//
			f_getset_ListOfAppliedSites();
		break;
		//................................................................................
	}
}}
//----------------------------------------------------------------------------------------
function f_resetPage(arg_Scope){with(self.document.forms[0])
{//of_selectRecord("sel_SourceSites", v_DefaultValue);  // v_DefaultValue = "-1"
	////arg_Scope could be:"FULL_PAGE", "BULLETIN_SOURCE_APPLIED_LISTS"
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
								  "sel_SourceSites", 
								  "sel_AppliedSites"
								  );
	}
	else if (arg_Scope == "BULLETIN_SOURCE_APPLIED_LISTS")
	{
		arrayCtrlNames = new Array(   
								  //// FIND RECORD:
								  //"txt_Find_DateFrom","txt_Find_DateTo",
								  //"sel_FindBulletinType", "txt_FindBulletin_Num_Seq", "txt_FindBulletin_Year",
								  //// LIST OF BULLETINS:
								  "sel_listOfBulletins",
								  //// BULLETIN DETAILS:
								  "sel_SourceSites", 
								  "sel_AppliedSites"
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
		//// SOURCE and APPLIED site lists:
		else if (arrayCtrlNames[r] == "sel_SourceSites")
		{	
			of_selectRecord("sel_SourceSites", v_DefaultValue);  //<--- Highlights the first record which value is "-1".
		}
		else if (arrayCtrlNames[r] == "sel_AppliedSites")
		{	
			f_getset_ListOfAppliedSites();
			//of_setSingleValue("sel_AppliedSites", v_DefaultValue, "List of applied sites ____________ Records: "+v_NumberOfRecords, "YES", 0);
			//of_selectRecord("sel_AppliedSites", v_DefaultValue);  //<--- Highlights the first record which value is "-1".
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
			v_ValidationPassed = f_validateListOfBulletins();
			//
			if (v_ValidationPassed == "YES")
			{
				v_ValidationPassed = f_validateListOfAppliedSites();	
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
				f_resetPage("BULLETIN_SOURCE_APPLIED_LISTS");
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
							   var v_Desh = "-"; // 118 is used to create proportional length of the record.
							   for (var i=0; i<118; i++){v_Desh = v_Desh+"-";}
							   of_setSingleValue("sel_listOfBulletins", v_DefaultValue, "----------"+"CREATE NEW RECORD"+v_Desh, "YES",  0); 
							   //
							   of_outPut("span_NumOfBulletins", v_NumberOfRecords);
							   //v_NumOdIterations = sel_listOfBulletins[0].text.length - " Records retrieved: ".length - 5;
							   //v_Desh = "-";
							   //for (var i=0; i<v_NumOdIterations; i++){v_Desh = v_Desh+"-";} 
							   //of_setSingleValue("sel_listOfBulletins", "-2", v_Desh+" Records retrieved: "+v_NumberOfRecords, "NO",  1);             
						  //....................................................................................................
						  for (var r=0; r<v_NumberOfRecords; r++)
						  {//1.2.1
							  v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
							  
							  v_BulletinValue = v_ArrayOfValuesInRecord[0].text; // bulletin_ptr
							  
							  // All numbers that are used below are based on the empirical calculation to make output looks well and do not have any meaningful value.
							  v_modification_no = of_RPad(v_ArrayOfValuesInRecord[1].text, 12, " "); 
							  v_date_issued 	= of_RPad(v_ArrayOfValuesInRecord[2].text, 15, " "); 
							  v_soft_ver 		= of_RPad(v_ArrayOfValuesInRecord[4].text, 20, " "); 
							  
							  v_wo_desc 		= v_ArrayOfValuesInRecord[5].text.substr(0, 45);
							  v_wo_desc 		= of_RPad(v_wo_desc, 49, " ");
							  
							  v_nsn 			= of_RPad(v_ArrayOfValuesInRecord[6].text, 18, " ");
							  v_acronym 		= of_RPad(v_ArrayOfValuesInRecord[7].text, 15, " ");
							  v_class_code 	    = of_RPad(v_ArrayOfValuesInRecord[8].text, 10, " "); 
							  
							  if      (v_ArrayOfValuesInRecord[9].text == "Y"){ v_em_wo_t_updated = "YES"; }
							  else if (v_ArrayOfValuesInRecord[9].text == "N"){ v_em_wo_t_updated = "NO"; }
							  else if (v_ArrayOfValuesInRecord[9].text == "C"){ v_em_wo_t_updated = "CHANGED"; }
							  v_em_wo_t_updated = of_RPad(v_em_wo_t_updated, 7, " ");
							  
							  v_BulletinText =v_modification_no+v_date_issued+v_soft_ver+v_wo_desc+v_nsn+v_acronym+v_class_code+v_em_wo_t_updated;
											   
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
		case "cb_MoveToApplied":
			
			v_ValidationPassed = f_validateMoveToApplied();
		
			if (v_ValidationPassed == "YES")
			{
				f_moveFromSourceToApplied();
			}
		break;
		//--------------------------------------------------------------------------------
		case "cb_MoveToSource":
			f_moveFromAppliedToSource();
		break;
	}
}}
//========================================================================================



function f_moveFromAppliedToSource(){with(self.document.forms[0])
{ 
	var v_ConfirmationMsg = "Do you really want to remove ";
	var v_BulletinNum     = -1;
	var v_AppliedSiteID   = -1;
	var f = 0;
	//
	//1.
	of_getCtrlProperties("sel_AppliedSites");
	if (v_CtrlValue == "-1"){ v_ConfirmationMsg = v_ConfirmationMsg+"all records from the "+v_CtrlAlt+"?" }
	else 
	{ 
		v_ConfirmationMsg = v_ConfirmationMsg+" \n"+v_CtrlText+"\n from the "+v_CtrlAlt+"?" ;
		v_AppliedSiteID = v_CtrlValue;
	}
	//
	// 2.
	if (confirm(v_ConfirmationMsg))
	{
		if (v_CtrlValue == "-1")
		{// 2.1
			of_getCtrlProperties("sel_listOfBulletins");
			v_BulletinNum = v_CtrlValue;
			//
			of_selectRecord("sel_listOfBulletins", v_DefaultValue);
			
			f_onChange("sel_listOfBulletins");
			
			of_selectRecord("sel_listOfBulletins", v_BulletinNum);
		}//2.1
		else // v_CtrlValue != "-1"
		{// 2.2
			fltrBfr_AppliedSites.length = 0;
			
			
			for (var a=0; a<sel_AppliedSites.options.length; a++)
			{
				if ( sel_AppliedSites.options[a].value != "-1" && sel_AppliedSites.options[a].value != v_AppliedSiteID )
				{
					 for (var s=0; s<orgBfr_AllSites.length; s++) 
				  	 {
						   if ( orgBfr_AllSites[s].a_site_status_code == "A" 
								 && 
								orgBfr_AllSites[s].a_site_id == sel_AppliedSites.options[a].value )
						   {
							  //alert(sel_AppliedSites.options[a].value)
							   
							   //alert(fltrBfr_AppliedSites.length+ "   "+f+"   "+orgBfr_AllSites[s].a_site_id +"   "+ sel_AppliedSites.options[a].value)
							   fltrBfr_AppliedSites[f] = new array_Sites( orgBfr_AllSites[s].a_site_id,
																          orgBfr_AllSites[s].a_site_name_show,
																	      orgBfr_AllSites[s].a_site_status_code
																         );
								f++;
//							    
						   }
					 }
//					 //
				}
			}
			//
			of_setSingleValue("sel_AppliedSites", v_DefaultValue, v_DefaultTextSite+" Records:"+fltrBfr_AppliedSites.length, "YES", 0);	
		    for (var r=0; r<fltrBfr_AppliedSites.length; r++)
		    {
			    of_setSingleValue("sel_AppliedSites", fltrBfr_AppliedSites[r].a_site_id, 
  												  "("+fltrBfr_AppliedSites[r].a_site_status_code+")"+fltrBfr_AppliedSites[r].a_site_name_show, "NO", r+1);
		    }
			//
			of_selectRecord("sel_AppliedSites", v_DefaultValue);
		}// 2.2
	}// 2.

	
}}// end of f_moveFromAppliedToSource
//
//========================================================================================

function f_validateMoveToApplied(){with(self.document.forms[0])
{ 
	v_ValidationPassed = "YES";
	 
	arrayCtrlNames = new Array(  //// FIND RECORD:
								 //"txt_Find_DateFrom","txt_Find_DateTo",
								 //"sel_FindBulletinType", "txt_FindBulletin_Num_Seq", "txt_FindBulletin_Year",
								 //// LIST OF BULLETINS:
								 "sel_listOfBulletins"
								 //// BULLETIN DETAILS:
								 //,"sel_SourceSites" 
								 //,"sel_AppliedSites"
						      );
	 
	 for (var r=0; r<arrayCtrlNames.length; r++)
	 {
			of_getCtrlProperties(arrayCtrlNames[r]);
			
			if (v_CtrlValue == "-1")
			{
				v_ValidationPassed = "NO";
				alert("System cannot process your request.\nValue in the control \""+v_CtrlAlt+"\" is not selected.");
				eval(v_CtrlName+".focus()");
				break;
			}
	 }
	 //
	 return v_ValidationPassed;
}}
//---------------------------------------------------------------------------------------
function f_moveFromSourceToApplied(){with(self.document.forms[0])//DONE
{ 
	var f = 0; //<--- f - means filtered records
	var v_AppliedNumOfRecords = 0;
	var v_AppliedSiteID = "";
	//.............................................................................
	of_getCtrlProperties("sel_SourceSites");
	//// as a result of triggering the function above, variable v_CtrlValue receives a value of a highlighted record.
	//.............................................................................
	fltrBfr_AppliedSites.length = 0; //<--- This buffer will be used as an intermidiate record "holder".
	//.............................................................................
	if (v_CtrlValue == "-1") // <--- Means the entire list of active sites must be used 
	// 1
	{
		  for (var a=0; a<orgBfr_AllSites.length; a++) // <--- a- means "ALL SITES"
		  {
			  if (orgBfr_AllSites[a].a_site_status_code == "A")
			  {
				  fltrBfr_AppliedSites[f] = new array_Sites( orgBfr_AllSites[a].a_site_id,
															 orgBfr_AllSites[a].a_site_name_show,
															 orgBfr_AllSites[a].a_site_status_code
														   );
				  f++;
			  }
		  }
		  //.........................................................................
		  of_setSingleValue("sel_AppliedSites", v_DefaultValue, v_DefaultTextSite+" Records:"+fltrBfr_AppliedSites.length, "YES", 0);	
		  for (var f=0; f<fltrBfr_AppliedSites.length; f++)
		  {
			  of_setSingleValue("sel_AppliedSites", fltrBfr_AppliedSites[f].a_site_id, 
													"("+fltrBfr_AppliedSites[f].a_site_status_code+")"+fltrBfr_AppliedSites[f].a_site_name_show, "NO", f+1);
		  }
		  //
		  of_selectRecord("sel_AppliedSites", v_DefaultValue);  //<--- Highlights the first record which value is "-1".
	}// 1
	else if (v_CtrlValue != "-1") //<--- Means that a particular site is selected.
	{
		// 1. Determine if the selected site is active:
		for (var a=0; a<orgBfr_AllSites.length; a++) // <--- a- means "ALL SITES"
		{
			if (orgBfr_AllSites[a].a_site_id == v_CtrlValue && orgBfr_AllSites[a].a_site_status_code == "I")
			{
				v_ValidationPassed = "NO";
				alert("System cannot process your request.\nSelected site in the \""+v_CtrlAlt+"\" is \"INACTIVE\".");
				break;	
			}
		}// end of 1.
		//..........................................................................
		// 2. Determine if the selected site is already placed in "sel_AppliedSites".
		//
		if (v_ValidationPassed == "YES")
		{
			v_AppliedNumOfRecords = sel_AppliedSites.options.length;
			//
			for (var a=0; a<v_AppliedNumOfRecords; a++)
			{// 2.1
				// Reminder: v_CtrlValue has a value of the selected record in the LIST OF SOURCE SITES.
				if (v_CtrlValue == sel_AppliedSites.options[a].value) //<--- Site is in the list
				{//2.1.1
					v_ValidationPassed = "NO";
					of_selectRecord("sel_AppliedSites", v_CtrlValue);
					alert("Selected site \n"+v_CtrlText+"\n is in the \"LIST OF APPLIED SITES\" already.\nThere is no needed to move this site twice.");
					eval(v_CtrlName+".focus()");
					break;
				}// end of 2.1.1
			}// end of 2.1
		}// end of 2.
		//..........................................................................
		// 3. Selected site is not in the list in "sel_AppliedSites", so add it to the list:
		if (v_ValidationPassed == "YES")
		{
			  v_AppliedNumOfRecords = sel_AppliedSites.options.length;
			  f = 0;
			  //
			  // 3.1
			  if (v_AppliedNumOfRecords == 1) //<-- Means no sites applied yet.
			  {
				  for (var a=0; a<orgBfr_AllSites.length; a++)
				  {	
					  if (orgBfr_AllSites[a].a_site_id == v_CtrlValue) 
					  {
						  f++;
						  fltrBfr_AppliedSites[f] = new array_Sites( orgBfr_AllSites[a].a_site_id,
																	 orgBfr_AllSites[a].a_site_name_show,
																	 orgBfr_AllSites[a].a_site_status_code
																   );
						  break;
					  }
				  }
				  fltrBfr_AppliedSites[0] = new array_Sites( v_DefaultValue,
														 "List of applied sites ____________ Records: "+v_AppliedNumOfRecords,
														 "-1" // "-1" in this case is a symbolic value assigned to the very first record to populate "sel_AppliedSites"
														);
			  }// 3.1
			  // 
			  // 3.2
			  else if (v_AppliedNumOfRecords > 1) //<--- Means some sites applied already.
			  {

				  f = 0;
				  // Collect the very first record into the "fltrBfr_AppliedSites".  This record is what user selected from the "SOURCE SITE".
				  // This record must take the second place in the array, leaving the first place for the general message (the one with number of records)
				  // 3.2.1
				  for (var s=0; s<orgBfr_AllSites.length; s++) 
				  {
				   		if ( orgBfr_AllSites[s].a_site_status_code == "A" && orgBfr_AllSites[s].a_site_id == v_CtrlValue )
						{
							f++;
							fltrBfr_AppliedSites[f] = new array_Sites( orgBfr_AllSites[s].a_site_id,
																	   orgBfr_AllSites[s].a_site_name_show,
																	   orgBfr_AllSites[s].a_site_status_code
																      );
							break;
						}
				  }// 3.2.1
				  //
				  // 3.2.2
				  // Collect in to the "fltrBfr_AppliedSites" a list of the sites from the "sel_AppliedSites".
				  // Existing records must be placed in the array starting from the third position, 
				  // Itteration in "sel_AppliedSites" must be started from the second row, ignoring the general message.
				  for (var a=1; a<sel_AppliedSites.options.length; a++)
				  {
					  for (var s=0; s<orgBfr_AllSites.length; s++) 
				  	  {
							if ( orgBfr_AllSites[s].a_site_status_code == "A" && orgBfr_AllSites[s].a_site_id == sel_AppliedSites.options[a].value )
							{
								f++;
								fltrBfr_AppliedSites[f] = new array_Sites( orgBfr_AllSites[s].a_site_id,
																	       orgBfr_AllSites[s].a_site_name_show,
																	       orgBfr_AllSites[s].a_site_status_code
																          );
								
							}
					  }
					  
					  
				  }	
				  //
				  // 3.2.3
				  // Create the first record in the array
				  fltrBfr_AppliedSites[0] = new array_Sites( v_DefaultValue,
														     "List of applied sites ____________ Records: "+f,
														     "-1" // "-1" in this case is a symbolic value assigned to the very first record to populate "sel_AppliedSites"
														   );
			  } // 3.2
			  //
			  // 3.3
			  for (var f=0; f<fltrBfr_AppliedSites.length; f++)
			  {  
			  		of_setSingleValue("sel_AppliedSites", fltrBfr_AppliedSites[f].a_site_id, 
													      fltrBfr_AppliedSites[f].a_site_name_show, "NO", f);
			  }
			  //
			  //3.4
			  of_selectRecord("sel_AppliedSites", v_CtrlValue);
													  

		}// end of 3.
		//..........................................................................
	}
}}
//---------------------------------------------------------------------------------------
function f_onKeyUp(arg_CtrlName){with(self.document.forms[0])//DONE
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
}}
//========================================================================================
function f_Save(){with(self.document.forms[0])
{
	//------------------------------------------------------------------------------------
	var v_sp_Call = "EMAPP.EM_BULLTN_EDITOR_01.sp_applyBulletin?p_currentUser="+v_currentUser;
	var v_Bulletin_Ptr = "-1";
	var v_AppliedSites = "";
	var vNumOfSites = parseInt(sel_AppliedSites.options.length - 1);
	var v_ConfirmationMsg = "ATTENTION!!!\n"+
							"This is the last confirmation before database record is updated,\n"+
							"and Work Order (WO) is assigned to the sites with applicable equipment.\n\n"+
							"Please, responsibly review data you just provided since the correction\n"+
							"of the mistake is a complex and time consuming process."+
							"\n\nIf reviewed data is confirmed and you would like to proceed,\n"+
							"click \"OK\" button.\n"+
							"If any changes are required,"+
							"click \"Cancel\"."+
							"\n\nWARNING!!!"+
							"\nBefore Work Order(s) created system iterates through  the list"+
							"\nof "+vNumOfSites+" sites identifying presence of the appropriate equipment,"+
							"\nso please be very patient and wait for the results."+
							"\nIt may take up to a several minutes to complete the process.";
	var v_RtnVal = "DEFAULT";
	//-------------------------------------------------------------------------------------
	// 1.
	of_getCtrlProperties("sel_listOfBulletins");
	v_Bulletin_Ptr = v_CtrlValue;
	v_sp_Call = v_sp_Call+"&p_Bulletin_Ptr="+v_Bulletin_Ptr;
	//-------------------------------------------------------------------------------------
	// 2.
	for (var a=1; a<sel_AppliedSites.options.length; a++)
	{
		v_AppliedSites = v_AppliedSites+sel_AppliedSites.options[a].value+",";
	}
	
	v_AppliedSites = v_AppliedSites.substr(0,v_AppliedSites.length-1);
	//-------------------------------------------------------------------------------------
	// 3.
	v_sp_Call = v_sp_Call+"&p_Applicable_Site_ID="+v_AppliedSites;
	//-------------------------------------------------------------------------------------
	// 4.
	if (confirm(v_ConfirmationMsg))
	{
		// TEST: alert(v_sp_Call)
		objAJAX.load(v_sp_Call);
		if (objAJAX.parsed)
		{
			v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
			v_NumberOfRecords = v_ArrayOfRecords.length;
			
			for (var r=0; r<v_NumberOfRecords; r++)
			{//1.2.1
				v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
				v_RtnVal = v_ArrayOfValuesInRecord[0].text; 
			}//1.2.1
			
			if (v_RtnVal == "DEFAULT" || v_RtnVal == "ERROR")
			{
				alert("ERROR!!!\nSystem encountered an error.\nCall the Help Desk and ask them to check table \"ms47.ms47_sp_error_log\" for details.");
			}
			else
			{
				f_getBulletinList(txt_Find_DateFrom.value, txt_Find_DateTo.value);
				of_selectRecord("sel_listOfBulletins", v_Bulletin_Ptr);
				
				f_getset_ListOfAppliedSites();
				alert("System successfully created Work Orders.\n\n"+
					  "ATTENTION!!!\nControl \"LIST OF APPLIED SITES\" shows sites where Work Orders were just applied.")
			}
		}
	}
}}
//========================================================================================
//// ACTIUON functions end.
//========================================================================================
//========================================================================================
//// VALIDATION function start:
//========================================================================================
function f_validateListOfBulletins(){with(self.document.forms[0])
{
	of_getCtrlProperties("sel_listOfBulletins");
	if (v_CtrlValue == "-1")
	{
		v_ValidationPassed = "NO";
		alert("System cannot process your request.\nModification Number is not selected.");
		of_selectRecord("sel_listOfBulletins", v_DefaultValue);
		eval(v_CtrlName+".focus()");
	}
	
	return v_ValidationPassed;
	
}}
//----------------------------------------------------------------------------------------
function f_validateListOfAppliedSites(){with(self.document.forms[0])
{
	of_getCtrlProperties("sel_AppliedSites");
	if (sel_AppliedSites.options.length == 1 && v_CtrlValue == "-1")
	{
		v_ValidationPassed = "NO";
		alert("System cannot process your request.\n\"LIST OF APPLIED SITES\" is empty.");
		of_selectRecord("sel_AppliedSites", v_DefaultValue);
		eval(v_CtrlName+".focus()");	
	}
	
	return v_ValidationPassed;
}}

//========================================================================================
//// VALIDATION functions end.
//========================================================================================

//========================================================================================
// PAGE SPECIFIC FUNCTIONS end
//========================================================================================
// INITIAL ACTIONS:
// Create and position all control on the screen:
of_outPut('div_Ctrl', f_positionMainTbl() );
//
f_getBulletinList(v_DefaultFind_DateFrom, v_DefaultFind_DateTo);
of_selectRecord("sel_listOfBulletins", v_DefaultValue);  //<--- Highlights the first record which value is "-1".
//
f_getAllSites();
f_setSourceSites();
of_selectRecord("sel_SourceSites", v_DefaultValue);  //<--- Highlights the first record which value is "-1".
//
//f_getset_ListOfAppliedSites(); //<--- This function is called within f_resetPage("FULL_PAGE");
//
f_resetPage("FULL_PAGE");
//=================================================================================