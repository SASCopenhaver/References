// JavaScript Document em_equip_transfer.js
//  /u00/oracle/product/10gias/pemars/script

// VARIABLE DECLARATION starts =========================================================================
var v_currentSite = currentSite;
var v_currentUser = currentUser;
//
var v_Out = "";
var v_EmptyStr = " ";
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

v_DestEquipPtr = 0;

//------------------------------------------------------------------------------------------------------

var objRegExp_Date = /^(?=\d)(?:(?:(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})|(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))|(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2}))($|\ (?=\d)))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
//
var objRegExp_onlyNumeric = /(^-?\d\d*$)/;

var objRegExp_onlyAlpha = /^([a-zA-Z_-]+)$/;

var objRegExp_onlyAlphaNumeric = /^([a-zA-Z0-9_-]+)$/;
//------------------------------------------------------------------------------------------------------
var NoteSpaser = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

var v_DefaultTextSite  = "___________ SITES _________________";

var v_SiteID = "";
var v_SubSiteID = "";
var v_Acronym = "";

//var v_EquipmentTransfered = "YES";
var v_RtnVal_CountEquipment = "";
var v_RtnVal_CountWorkOrders = "";

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
	//
	for (var i=0; i<eval(arg_CtrlName+".options.length"); i++)
	{
		if (eval(arg_CtrlName+".options["+i+"].value") == arg_Value)
		{
			//
			v_IsMatched = "YES";
			//
			eval(arg_CtrlName+".options["+i+"].selected=true");
			//
			break;
		}
	}
	//
	of_getCtrlProperties(arg_CtrlName);
	//
	if (v_IsMatched == "NO")
	{
		alert("Searched value of "+v_CtrlText+" ("+v_CtrlValue+") in "+v_CtrlAlt+" could not be found."+
			  "\nPlease record indicated value and report to the help desk\n"+
			  "about the problem.");
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
	  else if (v_CtrlType == "text")
	  {
		 v_CtrlValue = of_Trim(eval(v_CtrlName+".value"));
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
		  alert("System cannot process your request.\nDate in the field '"+v_CtrlAlt+"' has not been properly provided.");
		  v_RtnVal = "NO";
		  eval(v_CtrlName+".focus()");
	  }//1.4.1
	  //
	  //------------------------------------------------
	  if (v_RtnVal == "YES" && !of_isDateFormated(v_CtrlValue))
	  {//1.4.2
		  alert("System cannot process your request.\nDate in the field '"+v_CtrlAlt+"' has not been properly provided.");
		  v_RtnVal = "NO";
		  eval(v_CtrlName+".focus()");	
	  }//1.4.2
	  //----------------------------------------------- 
	  
	  return v_RtnVal;
			
}}
//-----------------------------------------------------------------------------------------
// GENERIC FUNCTIONS end ===================================================================
//
//==========================================================================================
// PAGE SPECIFIC FUNCTIONS start ===========================================================
//
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
	".c_PositionName{"+
				"font-weight:bold;"+
				"font-size:12px;"+
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
"</style>";
	document.write(v_Out);
}
f_PageStyle();
//==========================================================================================
function f_positionMainTbl()
{
	v_Out = 
"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+

	"<tr>"+
		"<td align=\"center\" id=\"td_Notes\" colspan=\"4\">"+
		"<br />"+
		"Equipment Transfer is a multi-step process; please follow the 'Steps' 1 through 9 in sequential order to maintain integrity."+
		"<br /><br />"+
		"</td>"+
	"</tr>"+	

	"<tr>"+
		"<td id=\"td_Source\" class=\"c_PositionName\" style=\"background-color:#B8B8B8;\">SOURCE</td>"+
		"<td id=\"td_Divider1\" style=\"color:#ffffff;\">&nbsp;</td>"+
		"<td id=\"td_Destination\" class=\"c_PositionName\" style=\"background-color:#B8B8B8;\">DESTINATION</td>"+
	"</tr>"+
	"<tr>"+
		"<td id=\"td_Site_Source\" class=\"c_CtrlName\" valign=\"top\">td_Site_Source</td>"+
		"<td id=\"td_Divider2\" style=\"color:#ffffff;\">td_Divider2</td>"+
		"<td id=\"td_Site_Destination\" class=\"c_CtrlName\" valign=\"top\">td_Site_Destination</td>"+
	"</tr>"+
	
	"<tr>"+
		"<td id=\"td_Equip_Source\" class=\"c_CtrlName\" valign=\"top\">td_Equip_Source</td>"+
		"<td id=\"td_Divider\" style=\"color:#ffffff;\">td_Divider</td>"+
		"<td id=\"td_Equip_Destination\"   class=\"c_CtrlName\" valign=\"top\">td_Equip_Destination</td>"+
	"</tr>"+
	
	"<tr>"+
		"<td align=\"center\" id=\"td_Navigation\" colspan=\"4\">td_Navigation</td>"+
	"</tr>"+	
"</table>";

	return v_Out;

}
//=========================================================================================
function f_positionSiteSource()
{
	v_Out = 
	"<div id=\"id_Title_Site_Source\"  class=\"c_CtrlName\">Step 1: Select site (list of active and inactive):</div>"+
	//"<br />"+
	"<select id=\"sel_SourceSites\" "+
			"name=\"sel_SourceSites\" "+
			"size=\"10\" "+
			"alt=\"List of source sites\" "+
			"tabindex=\"1\" "+
			"onChange=\"f_onChange(this.name)\" "+
			"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
			"selected=\"selected\"> "+

	"</select>";
	return v_Out;	
}
//=========================================================================================
function f_positionEquipSource()
{ 
	v_Out = 
	"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
		  "<tr>"+
				"<td>"+
					"<div id=\"id_Title_SourceSubSites\" class=\"c_CtrlName\">Step 2: Select subsite:</div>"+
					"<select id=\"sel_SourceSubsites\" "+
							"name=\"sel_SourceSubsites\" "+
							"size=\"4\" "+
							"alt=\"List of Source Subsites\" "+
							"tabindex=\"2\" "+
							"onChange=\"f_onChange(this.name)\" "+
							"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
						"selected=\"selected\"> "+
						"<option value=\"-1\">__SUBSITE RECORDS 0</option>"+
					"</select>"+
				"</td>"+
				"<td valign=\"bottom\">"+
					"<div id=\"id_Title_Equip_Source_1\"  class=\"c_CtrlName\">"+
						"Step 4: Available equipment:<br />"+
						"Class Code and Number<br />"+
						"(All equipment is<br /></div>"+
				"</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td valign=\"top\">"+
					"<div id=\"id_Title_SourceAcronyms\" class=\"c_CtrlName\">Step 3: Select acronym:</div>"+
					"<select id=\"sel_SourceAcronyms\" "+
							"name=\"sel_SourceAcronyms\" "+
							"size=\"14\" "+
							"alt=\"List of Source Acronyms\" "+
							"tabindex=\"3\" "+
							"onChange=\"f_onChange(this.name)\" "+
							"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\"> "+
						"<option value=\"-1\">Acronyms Records 0</option>"+
					"</select>"+								
				"</td>"+
				"<td valign=\"top\">"+
					"<div id=\"id_Title_Equip_Source_2\"  class=\"c_CtrlName\">\"Identified For Relocation\")"+
					"</div>"+
					"<select id=\"sel_SourceEquipment\" "+
							"name=\"sel_SourceEquipment\" "+
							"size=\"14\" "+
							"alt=\"List of Source Equipment\" "+
							"tabindex=\"4\" "+
							"onChange=\"f_onChange(this.name);\" "+
							"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
							"selected=\"selected\"> "+
						"<option value=\"-1\">__EQUIPMENT RECORDS 0__</option>"+
					"</select>"+				
				"</td>"+
		  "</tr>"+
	"</table>";

	return v_Out;	
}
//=========================================================================================
function f_positionSiteDestination()
{
	v_Out =
	"<div id=\"id_TitleSiteDestination\"  class=\"c_CtrlName\">Step 5:Destination sites (active sites only):</div>"+
	//"<br />"+
	"<select id=\"sel_DestinationSites\" "+
			"name=\"sel_DestinationSites\" "+
			"size=\"10\" "+
			"alt=\"List of destination sites\" "+
			"tabindex=\"5\" "+
			"onChange=\"f_onChange(this.name)\" "+
			"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
			"selected=\"selected\"> "+
	"</select>";
	return v_Out;	
}
//=========================================================================================
function f_positionDivider()
{
	v_Out = ">><br />>><br />>><br />>><br />>>";
	return v_Out;	
}
//=========================================================================================
function f_positionEquipDestination()
{ 
	v_Out = 
	"<table width=\"100%\" border=\"0\" style=\"background-color:#CCCCCC; border-style:none;\">"+
		  "<tr>"+
				"<td>"+
					"<div id=\"id_Title_DestinationSubSites\" class=\"c_CtrlName\">Step 6: Select subsite:</div>"+
					"<select id=\"sel_DestinationSubsites\" "+
							"name=\"sel_DestinationSubsites\" "+
							"size=\"4\" "+
							"alt=\"List of Destination Subsites\" "+
							"tabindex=\"6\" "+
							"onChange=\"f_onChange(this.name)\" "+
							"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
							"selected=\"selected\"> "+
						"<option value=\"-1\">__SUBSITE RECORDS 0</option>"+
					"</select>"+				
				"</td>"+
				"<td>"+
					"<div id=\"id_Title_DestinationFacilities\" class=\"c_CtrlName\">Step 7: Select facility:</div>"+
					"<select id=\"sel_WhepFacilityID\" "+
							"name=\"sel_WhepFacilityID\" "+
							"size=\"4\" "+
							"alt=\"List of Destination Facilities\" "+
							"tabindex=\"7\" "+
							"onChange=\"f_onChange(this.name)\" "+
							"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
							"selected=\"selected\"> "+
						"<option value=\"-1\">__FACILITY RECORDS 0</option>"+
					"</select>"+				
				"</td>"+
		  "</tr>"+
		  "<tr>"+
				"<td valign=\"top\">"+
					"<div id=\"id_Title_DestinationAcronyms\" class=\"c_CtrlName\">Step 8: Acronym:<br />(select from the list)</div>"+
					"<select id=\"sel_DestinationAcronyms\" "+
							"name=\"sel_DestinationAcronyms\" "+
							"size=\"8\" "+
							"alt=\"List of Destination Acronyms\" "+
							"tabindex=\"7\" "+
							"onChange=\"f_onChange(this.name)\" "+
							"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\"> "+
						"<option value=\"-1\">Acronyms Records 0</option>"+
					"</select>"+

					"<br /><br />"+

					"<div id=\"id_RenameEquipment\" class=\"c_CtrlName\">Step 9:<br />Equipment New Number</div>"+
					"<input id=\"txt_RenameEquipment\" "+
						   "name=\"txt_RenameEquipment\" "+
						   "size=\"25\" "+
						   "alt=\"Equipment New Number\" "+
						   "tabindex=\"8\" "+
						   "style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
						   "value=\"\" />"+				
					
				"</td>"+
				"<td>"+
					"<div id=\"id_Title_Equip_Destination\"  class=\"c_CtrlName\">Available equipment:<br />(for reference only)</div>"+
					"<select id=\"sel_DestinationEquipment\" "+
							"name=\"sel_DestinationEquipment\" "+
							"size=\"13\" "+
							"alt=\"List of Destination Equipment\" "+
							"tabindex=\"9\" "+
							"onChange=\"f_onChange(this.name);\" "+
							"style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
							"selected=\"selected\"> "+
						"<option value=\"-1\">__EQUIPMENT RECORDS 0</option>"+
					"</select>"+				
				"</td>"+
		  "</tr>"+
		  
//		  "<tr>"+
//				"<td colspan=\"2\">"+
//					"<div id=\"id_RenameEquipment\" class=\"c_CtrlName\">Step 9: Equipment New Number</div>"+
//					"<input id=\"txt_RenameEquipment\" "+
//						   "name=\"txt_RenameEquipment\" "+
//						   "size=\"20\" "+
//						   "alt=\"Equipment New Number\" "+
//						   "tabindex=\"8\" "+
//						   "style=\"font-family:'Courier New', Courier, monospace;  font-size:10px;\" "+
//						   "value=\"\" />"+				
//				"</td>"+
//		  "</tr>"+
		"</table>";

	return v_Out;	
}
//=========================================================================================
function f_positionNavigation()
{
	v_Out = 
	  "<input type=\"button\" name=\"cb_Transfer\" onclick=\"f_onClick(this.name)\" value=\"Transfer\" />"+
	  "&nbsp;&nbsp;&nbsp;&nbsp;"+"&nbsp;&nbsp;&nbsp;&nbsp;"+
	  "&nbsp;&nbsp;&nbsp;&nbsp;"+"&nbsp;&nbsp;&nbsp;&nbsp;"+
	  "<input type=\"button\" name=\"cb_Reset\" onclick=\"f_onClick(this.name)\" value=\"Reset\" />"+
	  "&nbsp;&nbsp;&nbsp;&nbsp;"+"&nbsp;&nbsp;&nbsp;&nbsp;"+
	  "&nbsp;&nbsp;&nbsp;&nbsp;"+"&nbsp;&nbsp;&nbsp;&nbsp;"+
	  "<input type=\"button\" name=\"cb_Exit\" onclick=\"f_onClick(this.name)\" value=\"&nbsp;&nbsp;Exit&nbsp;&nbsp;\" />"+
	  "&nbsp;&nbsp;&nbsp;&nbsp;"+"&nbsp;&nbsp;&nbsp;&nbsp;"+
	  "<!-----"+
	  "<input type=\"button\" name=\"cb_PTR7340\" onclick=\"f_onClick(this.name)\" value=\"&nbsp;TEST 7340&nbsp;\" />"+
	  "--->"+
	  "<br />";
	  
	return v_Out;
}
//========================================================================================
function f_onChange(arg_CtrlName){with(self.document.forms[0]) 
{ // sel_SourceSites sel_SourceSubsites sel_SourceAcronyms sel_SourceEquipment
  // sel_DestinationSites sel_DestinationSubsites sel_DestinationAcronyms sel_DestinationEquipment
	of_getCtrlProperties(arg_CtrlName);
	
	switch (arg_CtrlName)
	{
		// SOURCE ------------------------------------------------------------------------
		case "sel_SourceSites":
			f_getSubsites("Source");
			f_setSubsites("Source");
			of_selectRecord("sel_SourceSubsites", "-1");
			of_setSingleValue("sel_SourceAcronyms",  "-1", "__ACRONYM RECORDS 0",   "YES", 0);
			of_selectRecord("sel_SourceAcronyms", "-1");
			of_setSingleValue("sel_SourceEquipment", "-1", "__EQUIPMENT RECORDS 0", "YES", 0);
			of_selectRecord("sel_SourceEquipment", "-1");
		break;
		//
		case "sel_SourceSubsites":
			var v_SourceAcronym = document.getElementById('sel_SourceAcronyms').value;
			v_SiteID = document.getElementById('sel_SourceSites').value;
			v_SubSiteID = document.getElementById('sel_SourceSubsites').value;
			f_getAcronyms(v_SiteID, v_SubSiteID, "SOURCE", v_SourceAcronym);
			f_setAcronyms("sel_SourceAcronyms");
			of_selectRecord("sel_SourceAcronyms", "-1");
			of_setSingleValue("sel_SourceEquipment", "-1", "__EQUIPMENT RECORDS 0", "YES", 0);
			of_selectRecord("sel_SourceEquipment", "-1");
		break;
		//
		case "sel_SourceAcronyms":
			v_SiteID = document.getElementById('sel_SourceSites').value;
			v_SubSiteID = document.getElementById('sel_SourceSubsites').value;
			v_Acronym = document.getElementById('sel_SourceAcronyms').value;
			f_getSourceEquipment(v_SiteID, v_SubSiteID, v_Acronym);
			f_setSourceEquipment("sel_SourceEquipment");
			of_selectRecord("sel_SourceEquipment", "-1");
			//
			//of_selectRecord("sel_DestinationSubsites", "-1");
			//f_onChange("sel_DestinationSubsites");
			//
		break;
		//
		// DESTINATION ---------------------------------------------------------------------
		case "sel_DestinationSites":
			f_getSubsites("Destination");
			f_setSubsites("Destination");
			of_selectRecord("sel_DestinationSubsites", "-1");
			of_setSingleValue("sel_WhepFacilityID",  "-1", "__FACILITY RECORDS 0",   "YES", 0);
			of_selectRecord("sel_WhepFacilityID", "-1");
			of_setSingleValue("sel_DestinationAcronyms",  "-1", "__ACRONYM RECORDS 0",   "YES", 0);
			of_selectRecord("sel_DestinationAcronyms", "-1");			
			of_setSingleValue("sel_DestinationEquipment", "-1", "__EQUIPMENT RECORDS 0", "YES", 0);
			of_selectRecord("sel_DestinationEquipment", "-1");
			of_setSingleValue("txt_RenameEquipment", "''", "''", "''", 0);
		break;
		//
		case "sel_DestinationSubsites":
			var v_SourceAcronym = document.getElementById('sel_SourceAcronyms').value;
			
			v_SiteID = document.getElementById('sel_DestinationSites').value;
			v_SubSiteID = document.getElementById('sel_DestinationSubsites').value;
			
			f_getFacilities(v_SiteID, v_SubSiteID);
			f_setFacilities("sel_WhepFacilityID");
			of_selectRecord("sel_WhepFacilityID", "-1");
			
			of_setSingleValue("sel_DestinationAcronyms",  "-1", "__ACRONYM RECORDS 0",   "YES", 0);
			of_selectRecord("sel_DestinationAcronyms", "-1");			
			of_setSingleValue("sel_DestinationEquipment", "-1", "__EQUIPMENT RECORDS 0", "YES", 0);
			of_selectRecord("sel_DestinationEquipment", "-1");
			of_setSingleValue("txt_RenameEquipment", "''", "''", "''", 0);
			
		break;
		//
		case "sel_WhepFacilityID":
			of_getCtrlProperties(arg_CtrlName);
			
			var v_SourceAcronym = document.getElementById('sel_SourceAcronyms').value;
			v_SiteID = document.getElementById('sel_DestinationSites').value;
			v_SubSiteID = document.getElementById('sel_DestinationSubsites').value;
			
			f_getAcronyms(v_SiteID, v_SubSiteID, "DESTINATION", v_SourceAcronym);
			f_setAcronyms("sel_DestinationAcronyms");
			for (var d=0; d<sel_DestinationAcronyms.options.length; d++)
			{
				if 	(v_SourceAcronym == sel_DestinationAcronyms.options[d].value)
				{
					of_selectRecord("sel_DestinationAcronyms", v_SourceAcronym);
					break;
				}
				else if ( (d == sel_DestinationAcronyms.options.length - 1) && (v_SourceAcronym != sel_DestinationAcronyms.options[d].value)) 
				{
					alert("ALERT!!!\nSelected SOURCE acronym \""+v_SourceAcronym+"\" is not in the DESTINATION list of acronyms.\nPlease call \"Hepl Desk\".")
					of_selectRecord("sel_DestinationAcronyms", -1);
					break;
				}
			}
			
			f_onChange("sel_DestinationAcronyms");
			
		break;
		//
		case "sel_DestinationAcronyms":
			v_SiteID = document.getElementById('sel_DestinationSites').value;
			v_SubSiteID = document.getElementById('sel_DestinationSubsites').value;
			v_Acronym = document.getElementById('sel_DestinationAcronyms').value;
			f_getDestinationEquipment(v_SiteID, v_SubSiteID, v_Acronym);
			f_setDestinationEquipment("sel_DestinationEquipment");
			of_selectRecord("sel_DestinationEquipment", "-1");
			of_setSingleValue("txt_RenameEquipment", "''", "''", "''", 0);	
		//------------------------------------------------------------------------------------
	}
	
}}
//============================================================================================
orgBfr_SubSites = new Array();
function array_SubSites (a_subsite_id){this.a_subsite_id = a_subsite_id;}
//
function f_getSubsites(arg_SourceOrDestination){with(self.document.forms[0]) // arg_SourceOrDestination may have the following values: "Source", or "Destination"
{
	orgBfr_SubSites.length = 0;
	
	// This statement provides the following values: either - "sel_SourceSites", or - "sel_DestinationSites"
	v_CtrlName = "sel_"+arg_SourceOrDestination+"Sites";
	
	of_getCtrlProperties(v_CtrlName);
		
	objAJAX.load("EMAPP.EM_EQUIP_TRANSFER_S1.sp_getSubsites?p_SiteID="+v_CtrlValue);
	if (objAJAX.parsed)
	{//1.2
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length; //TEST: alert(v_NumberOfRecords)
		//
		for (var r=0; r<v_NumberOfRecords; r++)
		{//1.2.1
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			orgBfr_SubSites[r] = new array_SubSites( v_ArrayOfValuesInRecord[0].text ); //a_subsite_id
		}//1.2.1
	}//1.2

}}
//--------------------------------------------------------------------------------------------
function f_setSubsites(arg_SourceOrDestination){with(self.document.forms[0]) // arg_SourceOrDestination may have the following values: "Source", or "Destination"
{
	v_CtrlName = "sel_"+arg_SourceOrDestination+"Subsites";// This statement provides the following values: either - "sel_SourceSubsites", or - "sel_DestinationSubsites"
	
	of_setSingleValue(v_CtrlName, v_DefaultValue, "__SUBSITES RECORDS:"+orgBfr_SubSites.length, "YES", 0);
	for (var s=0; s<orgBfr_SubSites.length; s++)
	{
		of_setSingleValue(v_CtrlName, orgBfr_SubSites[s].a_subsite_id, orgBfr_SubSites[s].a_subsite_id, "NO", s+1);
	}

}}
//=========================================================================================
orgBfr_Facilities = new Array();
function array_Equipment(a_whep_fac_id, a_facility_name)
{
	this.a_whep_fac_id   = a_whep_fac_id;
	this.a_facility_name = a_facility_name;
}
//
function f_getFacilities(arg_SiteID, arg_SubSiteID)
{
	objAJAX.load("EMAPP.EM_EQUIP_TRANSFER_S1.sp_getFacilities?p_SiteID="+arg_SiteID+"&p_SubSiteID="+arg_SubSiteID);
	
	orgBfr_Facilities.length = 0;

	if (objAJAX.parsed)
	{//1.2
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length; //TEST: alert(v_NumberOfRecords)
		//
		for (var r=0; r<v_NumberOfRecords; r++)
		{//1.2.1
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			orgBfr_Facilities[r] = new array_Equipment( v_ArrayOfValuesInRecord[0].text,  //a_whep_fac_id
													    v_ArrayOfValuesInRecord[1].text.substr(0,20)   //a_facility_name
													  ); 
		}//1.2.1
	}//1.2	
}
//----------------------------------------------------------------------------------------
function f_setFacilities(arg_CtrlName)
{
	of_setSingleValue(arg_CtrlName, v_DefaultValue, "__FACILITY RECORDS:"+orgBfr_Facilities.length, "YES", 0);
	for (var s=0; s<orgBfr_Facilities.length; s++)
	{
		of_setSingleValue(arg_CtrlName, orgBfr_Facilities[s].a_whep_fac_id, orgBfr_Facilities[s].a_facility_name, "NO", s+1);
	}
}
//========================================================================================
orgBfr_Acronyms = new Array();
function array_Acronyms (a_acronym) { this.a_acronym = a_acronym; }
//
function f_getAcronyms(arg_SiteID, arg_SubSiteID, arg_SourceOrDestination, arg_SourceAcronym)
{
	//TEST: alert("Line 747:  "+arg_SiteID+"  "+arg_SubSiteID+"  "+arg_SourceOrDestination+"  "+arg_SourceAcronym)
	orgBfr_Acronyms.length = 0;
	
	objAJAX.load("EMAPP.EM_EQUIP_TRANSFER_S1.sp_getAcronyms?p_SiteID="+arg_SiteID+
													      "&p_SubSiteID="+arg_SubSiteID+
														  "&p_SourceOrDestination="+arg_SourceOrDestination+
														  "&p_SourceAcronym="+arg_SourceAcronym);
	if (objAJAX.parsed)
	{//1.2
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length; //TEST: alert(v_NumberOfRecords)
		//
		for (var r=0; r<v_NumberOfRecords; r++)
		{//1.2.1
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			orgBfr_Acronyms[r] = new array_Acronyms( v_ArrayOfValuesInRecord[0].text ); //a_acronym
		}//1.2.1
	}//1.2
	
	
	
}
//----------------------------------------------------------------------------------------
function f_setAcronyms(arg_CtrlName)
{
	of_setSingleValue(arg_CtrlName, v_DefaultValue, "__ACRONYM RECORDS:"+orgBfr_Acronyms.length, "YES", 0);
	
	for (var s=0; s<orgBfr_Acronyms.length; s++)
	{
		of_setSingleValue(arg_CtrlName, orgBfr_Acronyms[s].a_acronym, orgBfr_Acronyms[s].a_acronym, "NO", s+1);
	}
}
//========================================================================================
orgBfr_SourceEquipment = new Array();
function array_SourceEquipment (a_equipment_ptr, a_equip_no, a_class_code) 
{ 
	this.a_equipment_ptr = a_equipment_ptr;
	this.a_equip_no   = a_equip_no; 
	this.a_class_code = a_class_code; 
}
//
function f_getSourceEquipment(arg_SiteID, arg_SubSiteID, arg_Acronym)
{
	objAJAX.load("EMAPP.EM_EQUIP_TRANSFER_S1.sp_getSourceEquipment?p_SiteID="+arg_SiteID+"&p_SubSiteID="+arg_SubSiteID+"&p_Acronym="+arg_Acronym);
	
	orgBfr_SourceEquipment.length = 0;
	
	if (objAJAX.parsed)
	{//1.2
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length; //TEST: alert(v_NumberOfRecords)
		//
		for (var r=0; r<v_NumberOfRecords; r++)
		{//1.2.1
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			orgBfr_SourceEquipment[r] = new array_SourceEquipment( v_ArrayOfValuesInRecord[0].text,//a_equipment_ptr
																   v_ArrayOfValuesInRecord[1].text,//a_equip_no
																   v_ArrayOfValuesInRecord[2].text //a_class_code
																 ); 
			
		}//1.2.1
	}//1.2	
	
}
//----------------------------------------------------------------------------------------
orgBfr_DestinationEquipment = new Array();
function array_DestinationEquipment (a_equipment_ptr, a_equip_no, a_class_code) 
{ 
	this.a_equipment_ptr = a_equipment_ptr;
	this.a_equip_no   = a_equip_no; 
	this.a_class_code = a_class_code; 
}
//
function f_getDestinationEquipment(arg_SiteID, arg_SubSiteID, arg_Acronym)
{
	objAJAX.load("EMAPP.EM_EQUIP_TRANSFER_S1.sp_getDestinationEquipment?p_SiteID="+arg_SiteID+"&p_SubSiteID="+arg_SubSiteID+"&p_Acronym="+arg_Acronym);
	
	orgBfr_DestinationEquipment.length = 0;
	
	if (objAJAX.parsed)
	{//1.2
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length; //TEST: alert(v_NumberOfRecords)
		//
		for (var r=0; r<v_NumberOfRecords; r++)
		{//1.2.1
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			orgBfr_DestinationEquipment[r] = new array_SourceEquipment( v_ArrayOfValuesInRecord[0].text,//a_equipment_ptr
																		v_ArrayOfValuesInRecord[1].text,//a_equip_no
																		v_ArrayOfValuesInRecord[2].text //a_class_code
																	  ); 
		}//1.2.1
	}//1.2	
	
}
//----------------------------------------------------------------------------------------
function f_setSourceEquipment(arg_CtrlName)
{
	of_setSingleValue(arg_CtrlName, v_DefaultValue, "__EQUIPMENT RECORDS:"+orgBfr_SourceEquipment.length, "YES", 0);
	for (var s=0; s<orgBfr_SourceEquipment.length; s++)
	{
		of_setSingleValue(arg_CtrlName, 
						  orgBfr_SourceEquipment[s].a_equipment_ptr, 
						  orgBfr_SourceEquipment[s].a_class_code+":  "+orgBfr_SourceEquipment[s].a_equip_no, 
						  "NO", s+1);
	}
	
}
//----------------------------------------------------------------------------------------
function f_setDestinationEquipment(arg_CtrlName)
{
	of_setSingleValue(arg_CtrlName, v_DefaultValue, "__EQUIPMENT RECORDS:"+orgBfr_DestinationEquipment.length, "YES", 0);
	for (var s=0; s<orgBfr_DestinationEquipment.length; s++)
	{
		of_setSingleValue(arg_CtrlName, 
						  orgBfr_DestinationEquipment[s].a_equipment_ptr, 
						  orgBfr_DestinationEquipment[s].a_class_code+":  "+orgBfr_DestinationEquipment[s].a_equip_no, 
						  "NO", s+1);
	}
}
//========================================================================================
var arrayCtrlNames = new Array(  "sel_SourceSites",
								 //"sel_SourceSubsites",
								 //"sel_SourceAcronyms",
								 //"sel_SourceEquipment",
								 "sel_SourceEquipment",
								 //--------------------
								 "sel_DestinationSites",
								 "sel_DestinationSubsites",
								 "sel_WhepFacilityID",
								 "sel_DestinationAcronyms",
								 "txt_RenameEquipment"
								 //,"sel_DestinationEquipment"
								 );

function f_onClick(arg_CtrlName){with(self.document.forms[0])
{ 
	v_ValidationPassed = "YES";
	var v_Temp_RenameEquipment = "";
	//
	switch(arg_CtrlName)
	{
		case "cb_Transfer":	
			f_Validation_DataPresence();
			
// NOTE: After data is present in controls on the screen, below system validates some spesific data selection.
			if (v_ValidationPassed == "YES")
			{
				f_Validation_SiteDestination();	
			}
			//
			if (v_ValidationPassed == "YES")
			{
				f_Validation_AcronymDestination();
			}
			//
			if (v_ValidationPassed == "YES")
			{
				f_Validation_NewEquipmentNumber();
			}
			//
			if (v_ValidationPassed == "YES")
			{
				// getting the value of just about to be created "Equipment New Number":
				of_getCtrlProperties("txt_RenameEquipment"); 
				//--------------------------------------------------------------------------------------------
				// Table EMDBA.em_prop_tran_request may have duplicate records, or may not have needed records.  
				// Those records could be identified by values in columns "source_equip_cat_ptr" and "source_equipment_ptr".  
				// The following procedure tests above mentioned values and prevents execution of Equipment Transfer if condition is not met.
				// PTR = Property Transfer Request
				v_ValidationPassed = f_validate_PTR_Duplicates();
				//--------------------------------------------------------------------------------------------
				if (v_ValidationPassed == "YES")
				{
					  // TRANSFER:
					  f_transferEquipment();
					  //alert("910   "+v_DestEquipPtr)
					  //--------------------------------------------------------------------------------------
					  //if (v_EquipmentTransfered == "YES")
					  if (v_DestEquipPtr > 0 ) // It means that the record was created in the DB, so its value is > "0".
					  {
						  f_onChange("sel_SourceAcronyms");
						  
						  //v_Temp_RenameEquipment = txt_RenameEquipment.value.toUpperCase();
						  //alert(v_Temp_RenameEquipment)
						  
						  of_setSingleValue("txt_RenameEquipment", "''", "''", "''", 0);
						  
						  f_onChange("sel_DestinationAcronyms");
						  //value of v_CtrlValue is obtained a few lines above in of_getCtrlProperties("txt_RenameEquipment"); 
						  
						  //SAS   of_selectRecord("sel_DestinationEquipment", vTemp_RenameEquipment); 
						  of_selectRecord("sel_DestinationEquipment", v_DestEquipPtr); 
						  
						  alert("Equipment was transfered.\n"+
								"Number of Equipment records: "+v_RtnVal_CountEquipment+";\n"+
								"Number of Work Orders records: "+v_RtnVal_CountWorkOrders);
						  //
						  f_onChange("sel_SourceSites", "-1"); 
					  }
					  else if (v_EquipmentTransfered == "NO")
					  {
						  alert("An error occurred during the process of Equipment Transfer.\n"+
								"Please, record the screen information about \"SOURCE\" and \"DESTINATION\"\nand address this issue to the Help Desk.");	
					  }
					  //--------------------------------------------------------------------------------------
			    }
			}
		break;
		//
		case "cb_Reset":
			f_resetPage();
		break;
		//
		case "cb_Exit":	
			window.close();
		break;
		//
		case "cb_PTR7340":
			/*
			var v_PTR_pointer = sel_DestinationEquipment.options[sel_DestinationEquipment.options.selectedIndex].value;
			var urlStr=getServerPath();
	
	alert(urlStr+"!em_run_report?pApplication=EMARS"+
                                     "&pReportType=REPORT60"+
                              		 "&p_report=eqp011.rdf"+
                              	     "&p_PTR_pointer+"+v_PTR_pointer+
                              		 "&log=N"+
                              		 "&email=N"+
                              		 "&desformat=PDF");
									 
	window.open("!em_run_report?pApplication=EMARS"+
                                     "&pReportType=REPORT60"+
                              		 "&p_report=eqp011.rdf"+
                              	     "&p_PTR_pointer="+v_PTR_pointer+
                              		 "&log=N"+
                              		 "&email=N"+
                              		 "&desformat=PDF");
		*/
		break;
	}
}}
//========================================================================================
function f_validate_PTR_Duplicates(){with(self.document.forms[0])
{
	var v_RecordCount = 0;
	var v_RtnVal = "YES";
	
	of_getCtrlProperties("sel_SourceEquipment");
	
	var v_SP_Call = "EMAPP.EM_EQUIP_TRANSFER_S1.sp_validateDuplicates?p_Source_Equip_Ptr="+v_CtrlValue;
	
	objAJAX.load(v_SP_Call);
	
	v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
	v_NumberOfRecords = v_ArrayOfRecords.length; //TEST: alert("SAS  "+v_NumberOfRecords)
	//
	for (var r=0; r<v_NumberOfRecords; r++)
	{//1.2.1
		v_ArrayOfValuesInRecord  = v_ArrayOfRecords(r).childNodes;
		v_RecordCount = v_ArrayOfValuesInRecord[0].text;
	}//1.2.1
	//
	if (v_RecordCount == "0")
	{
		v_RtnVal = "NO";
		
		alert("ERROR:\n"+
			  "System cannot process your request.\n"+
			  "Call Help Desk letting them know that equipment with\n"+
			  "EquipmentID = "+v_CtrlValue+" does not have records in the table \"EMDBA.em_prop_tran_request\"."
			  );
			  
	}
	else if (v_RecordCount > 1)
	{
		v_RtnVal = "NO";
		alert("ERROR:\n"+
			  "System cannot process your request.\n"+
			  "Call Help Desk letting them know that equipment with EquipmentID = "+v_CtrlValue+"\n"+
			  "has duplicate records in the table \"EMDBA.em_prop_tran_request\".")
	}
	// The following part may be left since initial value of v_RtnVal = "YES".
	//else
	//{
	//	v_RtnVal = "YES";
	//}
	
	return v_RtnVal;
	
}}
//========================================================================================
//
function f_Validation_DataPresence()
{
// NOTE: arrayCtrlNames is defined above.
	  for (var c=0; c<arrayCtrlNames.length; c++) //c - for "control"
	  {
		  of_getCtrlProperties(arrayCtrlNames[c]);
		  if (
			   (v_CtrlType == "select-one" && v_CtrlValue == "-1" )
			   ||
			   (v_CtrlType == "text" && v_CtrlValue == "")
			 )
		  {
			  alert("System cannot process your request.\n"+"A value from the '"+v_CtrlAlt+"' has not been selected.");
			  v_ValidationPassed = "NO";
			  eval(v_CtrlName+".focus()");
			  break;
		  }
	  }
}	
//----------------------------------------------------------------------------------------
function f_Validation_SiteDestination(){with(self.document.forms[0])
{
	var v_CtrlName_Source  = "";
	var v_CtrlID_Source    = "";
	var v_CtrlValue_Source = "";
	var v_CtrlAlt_Source   = "";
	//
	var v_CtrlName_Destination = "";
	var v_CtrlID_Destination    = "";
	var v_CtrlValue_Destination = "";
	var v_CtrlAlt_Destination   = "";

	of_getCtrlProperties("sel_SourceSites");
	v_CtrlName_Source  = v_CtrlName;
	v_CtrlID_Source    = v_CtrlID;
	v_CtrlValue_Source = v_CtrlValue;
	v_CtrlAlt_Source   = v_CtrlAlt;
	
	of_getCtrlProperties("sel_DestinationSites");
	v_CtrlName_Destination  = v_CtrlName;
	v_CtrlID_Destination    = v_CtrlID;
	v_CtrlValue_Destination = v_CtrlValue;
	v_CtrlAlt_Destination   = v_CtrlAlt;
	
	if (v_CtrlValue_Source == v_CtrlValue_Destination)
	{
		alert("System cannot process your request.\n"+
			  "'Equipment Tansfer' is not permitted within the same site.");
	    v_ValidationPassed = "NO";
   	    eval(v_CtrlName_Destination+".focus()");
	}
}}
//----------------------------------------------------------------------------------------
function f_Validation_AcronymDestination(){with(self.document.forms[0])
{
	var v_CtrlName_Source  = "";
	var v_CtrlID_Source    = "";
	var v_CtrlValue_Source = "";
	var v_CtrlAlt_Source   = "";
	//
	var v_CtrlName_Destination = "";
	var v_CtrlID_Destination    = "";
	var v_CtrlValue_Destination = "";
	var v_CtrlAlt_Destination   = "";

	of_getCtrlProperties("sel_SourceAcronyms");
	v_CtrlName_Source  = v_CtrlName;
	v_CtrlID_Source    = v_CtrlID;
	v_CtrlValue_Source = v_CtrlValue;
	v_CtrlAlt_Source   = v_CtrlAlt;
	
	of_getCtrlProperties("sel_DestinationAcronyms");
	v_CtrlName_Destination  = v_CtrlName;
	v_CtrlID_Destination    = v_CtrlID;
	v_CtrlValue_Destination = v_CtrlValue;
	v_CtrlAlt_Destination   = v_CtrlAlt;
	
	if (v_CtrlValue_Source != v_CtrlValue_Destination)
	{
		alert("System cannot process your request.\n'"+
			  "Value from the '"+v_CtrlAlt_Source+"' ("+v_CtrlValue_Source+")\nand \n"+
			  "value to the '"+v_CtrlAlt_Destination+"' ("+v_CtrlValue_Destination+")\n"+
			  "do not match.");
	    v_ValidationPassed = "NO";
   	    eval(v_CtrlName_Destination+".focus()");
	}
}}
//----------------------------------------------------------------------------------------
function f_Validation_NewEquipmentNumber(){with(self.document.forms[0])
{
	var v_EquipNo = "";
	
	of_getCtrlProperties("txt_RenameEquipment"); // this function obtains a value of v_CtrlValue from "txt_RenameEquipment".
	
	for (var r=0; r<sel_DestinationEquipment.options.length; r++)
	{
		v_EquipNo = sel_DestinationEquipment.options[r].value;
		//
		if (v_EquipNo.toUpperCase() == v_CtrlValue.toUpperCase())
		{
			  alert("System cannot process your request.\n"+"Suggested value of 'Equipment New Number' has been used already.");
			  v_ValidationPassed = "NO";
			  eval(v_CtrlName+".focus()");
			  break;
		}
	}
}}
//========================================================================================
//
function f_transferEquipment()
{
	
	var v_SP_Call = "EMAPP.EM_EQUIP_TRANSFER_S1.sp_transferEquipment_2?p_currentUser="+v_currentUser+"&";
	var v_SP_Test = "EMAPP.EM_EQUIP_TRANSFER_S1.sp_transferEquipment_2?p_currentUser="+v_currentUser+"\n&";
	
	var v_Name = "";
	//------------------------------------------------------------------------------------
	
	
// NOTE: 1. arrayCtrlNames is defined above
//       2. "if" (1) statement was needed since "sel_SourceEquipment" had to have Class Code, that was not initially 
//           incorprated into the function
	for (var r=0; r<arrayCtrlNames.length; r++)
	{
		//v_Name removes the first 4 charecters from the control name, ex: "txt_Find_DateTo" becomes "Find_DateTo".
		v_Name = arrayCtrlNames[r].substr(4);
		
	   //v_SP_Call builds a list of parameters to be passed to the stored procedure adding "p_" to the v_Name,
	   // ex: "Find_DateTo" becomes "p_Find_DateTo&".
	   v_SP_Call = v_SP_Call+"p_"+v_Name+"="+document.getElementById(arrayCtrlNames[r]).value.toUpperCase()+"&";
			
	   v_SP_Test = v_SP_Test+"p_"+v_Name+"="+document.getElementById(arrayCtrlNames[r]).value.toUpperCase()+"\n"
	}
	//
	if ( confirm("Do you want to proceed with the transfer of the selected equipment?") )
    {
		v_SP_Call = v_SP_Call.substr(0,v_SP_Call.length-1); //Removing the last "&" from the value of v_SP_Call.
						 // ex: v_SP_Call = EMAPP.EM_EQUIP_TRANSFER_S1.sp_transferEquipment_2?p_currentUser=3748
						 //																	 &p_SourceSites=2
					     //                            									     &p_SourceEquipment=292806
						 //																     &p_DestinationSites=39
						 //																     &p_DestinationSubsutes=00
						 //																     &p_WhepFacilityID=238
						 //																     &p_DestinationAcronyms=AFCS
						 //																     &p_RenameEquipment=1
						//TEST: alert(v_SP_Test)
						//		alert(v_SP_Call)
		
		objAJAX.load(v_SP_Call);
		//
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length; //TEST: alert("SAS 1167:  "+v_NumberOfRecords)
		//
		for (var r=0; r<v_NumberOfRecords; r++)
		{//1.2.1
			v_ArrayOfValuesInRecord  = v_ArrayOfRecords(r).childNodes;
			v_DestEquipPtr			 = v_ArrayOfValuesInRecord[0].text;
			v_RtnVal_CountEquipment  = v_ArrayOfValuesInRecord[1].text;
			v_RtnVal_CountWorkOrders = v_ArrayOfValuesInRecord[2].text;
		}//1.2.1
		//
		/*
		if (objAJAX.parsed)
		{
			v_EquipmentTransfered = "YES";
		}
		else
		{
			v_EquipmentTransfered = "NO";	
		}
		*/
	}
}
//========================================================================================
//
orgBfr_AllSites = new Array();
orgBfr_ActiveSites = new Array();
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
			if (v_ArrayOfValuesInRecord[2].text == 'A')
			{
				v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
				orgBfr_ActiveSites[a] = new array_Sites( v_ArrayOfValuesInRecord[0].text, //a_site_id
													     v_ArrayOfValuesInRecord[1].text, //a_site_name_show
													     v_ArrayOfValuesInRecord[2].text  //a_site_status_code
													    );
				a++;
			}
		}//1.2.1
	}//1.2
}}
//-----------------------------------------------------------------------------------------
function f_setSites(){with(self.document.forms[0])
{
// 1. Set SOURCE sites:
	of_setSingleValue("sel_SourceSites", v_DefaultValue, v_DefaultTextSite+" Records:"+orgBfr_AllSites.length, "YES", 0);
	for (var s=0; s<orgBfr_AllSites.length; s++)
	{
		of_setSingleValue("sel_SourceSites", orgBfr_AllSites[s].a_site_id, "("+orgBfr_AllSites[s].a_site_status_code+")"+orgBfr_AllSites[s].a_site_name_show, "NO", s+1);
	}
	
	
// 2. Set DESTINATION sites:
	of_setSingleValue("sel_DestinationSites", v_DefaultValue, v_DefaultTextSite+" Records:"+orgBfr_ActiveSites.length, "YES", 0);
	for (var a=0; a<orgBfr_ActiveSites.length; a++)
	{
		of_setSingleValue("sel_DestinationSites", orgBfr_ActiveSites[a].a_site_id, orgBfr_ActiveSites[a].a_site_name_show, "NO", a+1);
	}
}}
//=========================================================================================
function f_resetPage(){with(self.document.forms[0])
{
// 1. SOURCE:
	of_selectRecord("sel_SourceSites", "-1");
	of_setSingleValue("sel_SourceSubsites",  "-1", "__SUBSITE RECORDS 0",   "YES", 0);
	of_selectRecord("sel_SourceSubsites", "-1");
	of_setSingleValue("sel_SourceAcronyms",  "-1", "__ACRONYM RECORDS 0",   "YES", 0);
	of_selectRecord("sel_SourceAcronyms", "-1");
	of_setSingleValue("sel_SourceEquipment", "-1", "__EQUIPMENT RECORDS 0", "YES", 0);
	of_selectRecord("sel_SourceEquipment", "-1");
	//
// 2. DESTINATION:
	of_selectRecord("sel_DestinationSites", "-1");
	of_setSingleValue("sel_DestinationSubsites",  "-1", "__SUBSITE RECORDS 0",   "YES", 0);
	of_selectRecord("sel_DestinationSubsites", "-1");
	of_setSingleValue("sel_WhepFacilityID",  "-1", "__FACILITY RECORDS 0",   "YES", 0);
	of_selectRecord("sel_WhepFacilityID", "-1");
	of_setSingleValue("sel_DestinationAcronyms",  "-1", "__ACRONYM RECORDS 0",   "YES", 0);
	of_selectRecord("sel_DestinationAcronyms", "-1");
	of_setSingleValue("sel_DestinationEquipment", "-1", "__EQUIPMENT RECORDS 0", "YES", 0);
	of_selectRecord("sel_DestinationEquipment", "-1");	
	of_setSingleValue("txt_RenameEquipment", "''", "''", "''", 0);
	

	
}}
//==========================================================================================
// Functions that initiate page output:
of_outPut('div_Ctrl',f_positionMainTbl());

of_outPut('td_Site_Source', f_positionSiteSource());
of_outPut('td_Equip_Source',f_positionEquipSource());

of_outPut('td_Divider',f_positionDivider());
of_outPut('td_Divider2',f_positionDivider());

of_outPut('td_Site_Destination',  f_positionSiteDestination());
of_outPut('td_Equip_Destination', f_positionEquipDestination());

of_outPut('td_Navigation', f_positionNavigation());

f_getAllSites();
f_setSites();

f_resetPage();

// / PAGE SPECIFIC FUNCTIONS end ===========================================================
//==========================================================================================

