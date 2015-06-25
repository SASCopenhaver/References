// EM_EQUIP_EDITOR.js
//  /u00/oracle/product/10gias/pemars/script

//===================================================================================
// GENERIC VARIABLE DECLARATION variables and functions from the file "JS_GENERIC.js"
//------------------------------------------------------------------------------
//var v_currentSite = currentSite;
var v_currentUser = currentUser;
//------------------------------------------------------------------------------
var v_ValidationPassed = "YES";
//------------------------------------------------------------------------------
var v_DefaultValue = "-1";
//------------------------------------------------------------------------------
var v_CtrlName  = "";
var v_CtrlID    = "";
var v_CtrlType  = "";
var v_CtrlValue = "";
var v_CtrlText  = "";
var v_CtrlAlt   = "";
var v_CtrlSize  = 0;

//------------------------------------------------------------------------------
var objAJAX = new ActiveXObject("microsoft.XMLDOM");
    objAJAX.async=false;
var v_ArrayOfRecords = new Array();
var v_ArrayOfValuesInRecord = new Array();
var v_NumberOfRecords = 0;
//------------------------------------------------------------------------------
var objRegExp_Date = /^(?=\d)(?:(?:(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})|(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))|(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2}))($|\ (?=\d)))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
//
var objRegExp_onlyNumeric = /(^-?\d\d*$)/;

var objRegExp_onlyAlpha = /^([a-zA-Z_-]+)$/;

var objRegExp_onlyAlphaNumeric = /^([a-zA-Z0-9_-]+)$/;

//-----------------------------------------------------------------------------
var v_OutPut = "";
//
var v_Date = new Date();
var v_CurrentYear = v_Date.getFullYear();
//
var v_Default_Search = "___Search results will be listed here_____";
//------------------------------------------------------------------------------
//var v_DefaultSearchCriteria = "Is not defined.";
var v_DefaultEquipmentOutput = "<br />To see a List of Equipment:  select Area-District-Site-Equipment Group-Acronym<br /><br />";
//var v_SearchLocation = "";
//------------------------------------------------------------------------------
var arrayCtrlNames = new Array();
	arrayCtrlNames = new Array(  "sel_Area"
								,"sel_Dist"
								,"sel_Site"
								,"sel_EquipGroup"
							  );
//------------------------------------------------------------------------------
var v_NumberOfEquipRecords = 0;
//------------------------------------------------------------------------------
orgBfr_ClassCode = new Array();
function array_ClassCode ( a_class_code )
{
	this.a_class_code = a_class_code;
}
//------------------------------------------------------------------------------
orgBfr_AcronymsForEdit = new Array();
function array_AcronymsForEdit(a_acronym, a_acronym_desc, a_class_code, a_is_selected)
{
	this.a_acronym      = a_acronym;
	this.a_acronym_desc = a_acronym_desc;
	this.a_class_code   = a_class_code;
	this.a_is_selected	= a_is_selected;
}
//------------------------------------------------------------------------------
orgBfr_Acronyms = new Array();
function array_Acronyms ( a_option_value,a_option_text, a_change_acronym  )
{
	this.a_option_value   = a_option_value;
	this.a_option_text    = a_option_text;
	this.a_change_acronym = a_change_acronym;
}
//------------------------------------------------------------------------------
var v_IteratedSelectName  = "";
var v_IteratedSelectValue = "";

var v_IteratedTextName  = "";
var v_IteratedTextValue  = "";

var v_IteratedHiddenName  = "";
var v_IteratedHiddenValue = "";
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// VARIABLE DECLARATION ends ===================================================
//
// GENERIC FUNCTION starts =====================================================

function of_outPut(arg_WhereOutput, arg_WhatOutput){with(self.document.forms[0])
{
    //TEST: alert(arg_WhereOutput+"  "+ arg_WhatOutput)
    document.getElementById(arg_WhereOutput).innerHTML = arg_WhatOutput;
}}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
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
    //alert(v_CtrlType)

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
		case "hidden":
            eval(arg_CtrlName+".value = "+arg_Value);
        break;
		//
		case "textarea":
	    	eval(arg_CtrlName+".value = "+arg_Value);
	  	break;
    }
}}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
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
      else if (v_CtrlType == "text" || v_CtrlType == "hidden")
      {
         v_CtrlValue = of_Trim(eval(v_CtrlName+".value"));
      }
      else
      {
          v_CtrlValue = "";
      }
}}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function of_roundNumber(arg_Number, arg_Decimal) 
{
    var v_RtnVal = Math.round(arg_Number*Math.pow(10,arg_Decimal))/Math.pow(10,arg_Decimal);
    return v_RtnVal;
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function of_Trim(s) 
{//***
  s = s.replace(/(^\s*)|(\s*$)/gi,"");
  s = s.replace(/[ ]{2,}/gi," ");
  s = s.replace(/\n /,"\n");
  return s;
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function of_isDateFormated(arg_Date) 
{
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
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function of_Validation_DataPresence(arg_CtrlName)
{
// NOTE: arrayCtrlNames is defined above.

    v_ValidationPassed = "YES";

          of_getCtrlProperties(arg_CtrlName);

          if (
                   (v_CtrlType == "select-one" && v_CtrlValue <0 )
                   ||
                   (v_CtrlType == "text" && v_CtrlValue == "")
				   ||
				   (v_CtrlType == "textarea" && v_CtrlValue == "")
               )
          {
              alert("System cannot process your request.\n"+"A value from the field ''"+v_CtrlAlt+"'' has not been provided.");
              v_ValidationPassed = "NO";
              //eval(v_CtrlName+".focus()");
          }
    return v_ValidationPassed;
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//function of_compareNumbers ( arg_Str1, arg_Str2 )
//{
//  if ( arg_Str1 < arg_Str2 ) { return -1; }
//  if ( arg_Str1 > arg_Str2 ) { return  1; }
//  
//  return 0; 
//}



//------------------------------------------------------------------------------
// GENERIC FUNCTIONS end =======================================================
//==============================================================================
// Page specific VARIABLE DECLARATION begins ===================================


// Page specific VARIABLE DECLARATION ends =====================================
//==============================================================================
function f_positionStyle()
{
	v_OutPut = 
"<style type=\"text/css\">"+
	//--------------------------------------------------------------------------------------
	".c_EditorSectionName{"+
				"font-weight:bold;"+
				"font-size:11px;"+
				"font-family:\"Verdana, Geneva, sans-serif\";"+	
	"}"+
	//--------------------------------------------------------------------------------------
	".c_CtrlName{"+
				"font-weight:bold;"+
				"font-size:10px;"+
				"font-family:\"Verdana, Geneva, sans-serif\";"+
				"color:#644436;"+
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
				"color:#274257;"+
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
	"BODY { background-color: #DFC184;}"+
	"TABLE { background-color: #DFC184; border: 0px outset white; font-weight: bold; font-size: 12px; }"+  
	//--------------------------------------------------------------------------------------
	".c_Save {display:block;width:100px;height:20px;text-indent:-9999px;}"+
	".c_Save a {display:block;width:100%;height:100%;background:url(\"/emars-img/cb_SAVE.png\") no-repeat top left;outline:none;}"+
	".c_Save a:hover {background-position:0 -20px;}"+
	
	".c_RESET {display:block;width:100px;height:20px;text-indent:-9999px;}"+
	".c_RESET a {display:block;width:100%;height:100%;background:url('/emars-img/cb_RESET.png') no-repeat top left;outline:none;}"+
	".c_RESET a:hover {background-position:0 -20px;}"+
	
	".c_EXIT {display:block;width:100px;height:20px;text-indent:-9999px;}"+
	".c_EXIT a {display:block;width:100%;height:100%;background:url('/emars-img/cb_EXIT.png') no-repeat top left;outline:none;}"+
	".c_EXIT a:hover {background-position:0 -20px;}"+

	//--------------------------------------------------------------------------------------
"</style>";
	document.write(v_OutPut);
}
//
//==============================================================================
function f_set_jQuery(){
	
	v_OutPut = "<script language='text/javascript' src='jquery-1.9.1.min.js'></script>";
	
	document.write(v_OutPut);
}
//
function f_jQuery(){
	/*v_OutPut = "<script language='text/javascript'>$('document').ready(function(){alert('SAS');});</script>";*/
	//alert(document.location.pathname);
	v_OutPut = "<script language=\"text/javascript\">alert(1)</script>";
	document.write(v_OutPut);	
}
f_jQuery();
//
//==============================================================================
// Page specific FUNCTION DECLARATION begins ===================================
//------------------------------------------------------------------------------
function f_positionHeader()
{
	v_OutPut = '<table width="100%" border="0" summary="Equipment Renumbering">'+
					  '<tr>'+
							'<td valign="top" class="tblBG_Color2" width="50%">'+f_positionNADS()+'</td>'+
					  '</tr>'+
					  '<tr>'+
							'<td valign="top" >'+f_positionSelectedCriteria()+'</td>'+
					  '</tr>'+
			     '</table>';

	return v_OutPut;
}
//------------------------------------------------------------------------------
function f_positionBody()
{
	v_OutPut = '<table width="100%" border="0" summary="Equipment Renumbering"  >'+
					  '<tr>'+
							'<td align="left" valign="top" >'+//id="div_EqupOutput" 
								'<div id="div_EqupOutput" >'+
									v_DefaultEquipmentOutput+
								'</div>'+
							'</td>'+
					  '</tr>'+
			     '</table>';

	return v_OutPut;
}
//------------------------------------------------------------------------------
function f_positionFooter()
{
	v_OutPut = '<table width="100%" border="0" summary="xxEquipment Renumbering" >'+
					  '<tr>'+
							'<td valign="top" >'+f_positionNavigation()+'</td>'+
					  '</tr>'+
			     '</table>';

	return v_OutPut;
}
//------------------------------------------------------------------------------
function f_positionNADS()
{
	v_OutPut = "<table width='100%' border='0' class='tblBG_Color1'>"+
				  "<tr>"+
					  "<td colspan='4' align='left'>"+
					  	"<font class='c_TblHeader'>Hierarchical presentation of National/Areas - Districts - Sites relations</font><br />"+
					  	"<font class='c_TblHeader'>ID for the references is shown in \"()\" </font>"+
						//"<br /><br />"+
					  "</td>"+
				  "</tr>"+
				  "<tr>"+
					  "<td><font class='c_CtrlName'>List of National/Areas</font></td>"+	//Ctrl_Title_10_Bold
					  "<td><font class='c_CtrlName'>List of Districts</font></td>"+
					  "<td><font class='c_CtrlName'>List of Sites</font></td>"+
					  "<td><font class='c_CtrlName'>Equipment Groups for the Selected Site</font></td>"+
				  "</tr>"+
				  "<tr>"+
					  "<td valign='top' width='33%'>"+
						  "<select id='sel_Area' "+
								  "name='sel_Area' "+ 
								  "alt='List of National/Areas' "+
								  "size='12' "+
								  "tabindex='1' "+
								  "onchange='f_onChange(this.name)' "+
								  "class='c_CtrlValue'></select> "+
					  "</td>"+
					  "<td valign='top' width='33%'>"+
						  "<select id='sel_Dist' "+
								  "name='sel_Dist' "+ 

								  "alt='List of Districts' "+
								  "size='12' "+
								  "tabindex='2' "+
								  "onchange='f_onChange(this.name)' "+
								  "class='c_CtrlValue'></select> "+
					  "</td>"+
					  "<td valign='top' width='33%'>"+
						  "<select id='sel_Site' "+
								  "name='sel_Site' "+ 
								  "alt='List of Sites' "+
								  "size='12' "+
								  "tabindex='3' "+
								  "onchange='f_onChange(this.name)' "+
								  "class='c_CtrlValue'></select> "+
					  "</td>"+
					  "<td valign='top' width='33%'>"+
						  "<select id='sel_EquipGroup' "+
								  "name='sel_EquipGroup' "+ 
								  "alt='Equipment Group' "+
								  "size='4' "+
								  "tabindex='4' "+
								  "onchange='f_onChange(this.name)' "+
								  "class='c_CtrlValue'></select> "+
						  "<br />"+
						  "<font class='c_CtrlName'>List of Acronyms with Class Codes</font>"+
						  "<br />"+
						  "<select id='sel_Acronym' "+
								  "name='sel_Acronym' "+ 
								  "alt='Acronym List' "+
								  "size='7' "+
								  "tabindex='5' "+
								  "onchange='f_onChange(this.name)' "+
								  "class='c_CtrlValue'></select> "+
						 
					  "</td>"+
				  "</tr>"+
			   "</table>";
	return v_OutPut;
} 
//------------------------------------------------------------------------------
function f_positionSelectedCriteria()
{
	v_OutPut = "<table width='100%' align='center' border='0' class='tblBG_Color1'>"+ 
					"<tr>"+
						"<td width='10%' align='left'>"+ //
							"<font class='Ctrl_Title_12_Bold'>Selected location:</font>"+
							
						"</td>"+
						"<td width='45%'>"+
							"<div id='id_NADS_SearchCriteria' class='Data_12_Navy_Bold'></div>"+
							"<input type='hidden' id='hdn_LocationType' name='hdn_LocationType' value=''/>"+
							"<input type='hidden' id='hdn_LocationID'   name='hdn_LocationID'   value=''/>"+
						"</td>"+
						"<td width='10%' align='right'>"+
							"Edit Field:"+
						"</td>"+
						"<td width='15%' align='right'>"+
							 "<select id='sel_EditField' "+
									  "name='sel_EditField' "+ 
									  "alt='Edit Field' "+
									  "size='1' "+
									  "tabindex='6' "+
									  "onchange='f_onChange(this.name)' "+
									  "class='c_CtrlValue'>"+
									"<option value='-1'>=== Select One ===</option>"+
							 "</select> "+
						"</td>"+
						"<td width='12%' align='right'>"+
							"Records retreived:"+
						"</td>"+
						"<td width='8%'>"+
							"<div id='div_NumberOfRecords'>0</div>"+
						"</td>"+
					"</tr>"+
			   "</table>";
	
	return v_OutPut;	
}

//------------------------------------------------------------------------------
function f_positionNavigation()
{
	v_OutPut = "<table width='100%' align='center' border='0' class='tblBG_Color1'>"+
					  "<tr valign='top'>"+
					  	  "<td width='30%'>&nbsp;</td>"+
						  "<td width='10%' align='center'>"+
						  
//							  "<input name='cb_Save' "+
//									 "id='cb_Save' "+
//									 "onclick='f_onClick(this.name);' "+
//									 "type='button' "+
//									 "tabindex='8' "+
//									 "value='&nbsp;&nbsp;&nbsp;SAVE&nbsp;&nbsp;&nbsp;'/>"+

							   //"<p class=\"c_Save\"><a href=\"#null\">Click Save button</a></p>"+
							     "<p class=\"c_Save\"><a href=\"#null\" "+
														"id=\"cb_Save\" "+
														"name=\"cb_Save\" "+
														"tabindex='' "+
														"onclick=\"f_onClick(this.name);\">"+
															 "Click Reset button"+
													  "</a>"+
								 "</p>"+							   
//							   "<input type='hidden' id='h_Random_Num' name='h_Random_Num' value='' />"+
						  "</td>"+
						  "<td width='10%' align='center'>"+
						  
//							  "<input name='cb_Reset1' "+
//									 "id='cb_Reset1' "+
//									 "onclick='f_onClick(this.name);' "+
//									 "type='button' "+
//									 "tabindex='9' "+
//									 "value='&nbsp;&nbsp;&nbsp;RESET&nbsp;&nbsp;&nbsp;'/>"+
							     "<p class=\"c_Reset\"><a href=\"#null\" "+
													     "id=\"cb_Reset1\" "+
														 "name=\"cb_Reset1\" "+
														 "tabindex='' "+
														 "onclick=\"f_onClick(this.name);\">"+
															 "Click Reset button"+
													  "</a>"+
								 "</p>"+
									 
						  "</td>"+						  
						  "<td width='10%' align='center'>"+
						  
//							  "<input name='cb_Exit1' "+
//									 "id='cb_Exit1' "+
//									 "onclick='f_onClick(this.name);' "+
//									 "type='button' "+
//									 "tabindex='11' "+
//									 "value='&nbsp;&nbsp;&nbsp;EXIT&nbsp;&nbsp;&nbsp;'/>"+
								 
								 "<p class=\"c_Exit\"><a href=\"#null\" "+
														"id=\"cb_Exit1\" "+
														"name=\"cb_Exit1\" "+
														"tabindex='' "+
														"onclick=\"f_onClick(this.name);\">"+
															"Click Exit button"+
													 "</a>"+
								 "</p>"+
									 
						  "</td>"+
						  "<td width='30%'>&nbsp;</td>"+
					  "</tr>"+
				"</table>";
	
	return v_OutPut;
}
//------------------------------------------------------------------------------
function f_onClick(arg_CtrlName)
{
	switch(arg_CtrlName)
	{
		case "cb_Save":
			
			v_ValidationPassed = "YES";
			v_ValidationPassed = f_Validation();
			if (v_ValidationPassed == "YES")
			{
				f_updateEquipment();
			}
			
		break;
		//
		case "cb_Reset1":
			f_resetScreen();
		break;	
		//
        case "cb_Exit1":
            self.close()
        break;
        //
	}
}
//------------------------------------------------------------------------------
function f_updateEquipment(){with(self.document.forms[0])
{
	// Final format of the variables: v_Str_CLASS_CD  "CLASS_CD|23456:AA/AB;98745:AA/AE".  
	//		CLASS_CD - field to be updated
	// 		"|" delimiter after update type
	//		":" delimiter after equipment_ptr
	//		"/" delimiter between retrieved and changed values
	//		";" delimiter sepatates equipment in the string
	//		23456 is Equipment Pointer
	//		AA an retrieved Class_Code
	//		AB a  changed Class_ Code
	//	
	var v_EQUIP_PTR = "";
	
	var v_msgUpdateWhat = "";
	var v_ValuesForEdit = "";
	
	var v_StringStoredProc = "";
	
	var v_RtnUpdWhat = "";
	var v_RtnMsg = "";
	//..........................................................................
	of_getCtrlProperties("sel_EditField");
	
	switch (v_CtrlValue) 
	{
		//___________________________________________________________
		case "ACRONYM":
				
				v_ValuesForEdit = "ACRONYM|"; 
				
				for (var e=0; e<elements.length; e++)
				{// loop "ACRONYM" starts:
					if (elements[e].type == "select-one" && elements[e].name.substr(0,19) == "sel_AcronymForEdit_") //// 19 because of the length of the control name
					{
						v_IteratedSelectName  = elements[e].name;  
						v_IteratedSelectValue = elements[e].value; // Changed value
						//
						v_IteratedHiddenName  = elements[e+1].name; 
						v_IteratedHiddenValue = elements[e+1].value; // Retrieved value
						//.............................................................
						if (v_IteratedSelectValue != v_IteratedHiddenValue)
						{
							  v_EQUIP_PTR = v_IteratedSelectName.substr(21);
							  
							  v_ValuesForEdit += v_EQUIP_PTR+":"+v_IteratedHiddenValue+"/"+v_IteratedSelectValue+";";
							  // Final v_ValuesForEdit format example: "ACRONYM|12345:DBCS_CB/DBCS_CD;67891:DBCS_CB/DBCS_CJ;
							  // It reads: Update 2 pieces of 
							  // equipment where equipment_ptr=12345 by replacing ACRONYM "DBCS" and Class_Code "CB" with "DBCS" and Class_Code "CD" and
							  // equipment where equipment_ptr=67891 by replacing ACRONYM "DBCS" and Class_Code "CB" with "DBCS" and Class_Code "CJ"
						}
					}
				}// loop "ACRONYM" ends.
				//
				v_msgUpdateWhat = "Equipment(s) ACRONYM";				
		break;
		//____________________________________________________________
		case "CLASS_CD": //............................................
		
				v_ValuesForEdit = "CLASS_CD|"; 
				
				for (var e=0; e<elements.length; e++)
				{//loop "CLASS_CD" starts
					  if (elements[e].type == "select-one" && elements[e].name.substr(0,21) == "sel_ClassCodeForEdit_") // 21 because of the length of the control name
					  { 
						  v_IteratedSelectName = elements[e].name;
						  v_IteratedSelectValue = elements[e].value; // Changed value
						  // TEST: alert(v_IteratedSelectName+" = "+v_IteratedSelectValue)
						  v_IteratedHiddenName = elements[e+1].name; 
						  v_IteratedHiddenValue = elements[e+1].value; // Retrieved value
						  // TEST: alert(v_IteratedHiddenName+" = "+v_IteratedHiddenValue)
						  
						  if (v_IteratedSelectValue != v_IteratedHiddenValue)
						  {
								v_EQUIP_PTR = v_IteratedSelectName.substr(21);
								
								v_ValuesForEdit += v_EQUIP_PTR+":"+v_IteratedHiddenValue+"/"+v_IteratedSelectValue+";";
								// Final v_ValuesForEdit format example: "CLASS_CD|12345:AA/AB;67891:AA/AD;
								// It reads: Update 2 pieces of 
								// equipment where equipment_ptr=12345 by replacing current(retrieved) class_code AA, with AB and
								// equipment where equipment_ptr=67891 by replacing current(retrieved) class_code AA, with AD
						  }
					  }						  
				}//loop "CLASS_CD" ends
				//
				v_msgUpdateWhat = "Equipment CLASS CODE";
		break;
		//____________________________________________________________
		case "EQUIP_NUM": //..........................................
				v_ValuesForEdit = "EQUIP_NUM|";
				
				for (var e=0; e<elements.length; e++)
				{//loop "EQUIP_NUM" starts
					  if (elements[e].type == "text" && elements[e].name.substr(0,20) == "txt_EquipNumForEdit_") // 20 because of the length of the control name
					  { 
						  v_IteratedSelectName = elements[e].name.toUpperCase();
						  v_IteratedSelectValue = elements[e].value.toUpperCase();
						  // TEST: alert(v_IteratedSelectName+" = "+v_IteratedSelectValue)
						  v_IteratedHiddenName = elements[e+1].name.toUpperCase(); 
						  v_IteratedHiddenValue = elements[e+1].value.toUpperCase();
						  // TEST: alert(v_IteratedHiddenName+" = "+v_IteratedHiddenValue)
						  
						  if (v_IteratedSelectValue != v_IteratedHiddenValue)
						  {
								v_EQUIP_PTR = v_IteratedSelectName.substr(20);
								
								v_ValuesForEdit += v_EQUIP_PTR+":"+v_IteratedHiddenValue+"/"+v_IteratedSelectValue+";";
								// Final v_ValuesForEdit format example: "EQUIP_NUM|12345:1/111;67891:5/555;
								// It reads: Update 2 pieces of 
								// equipment where equipment_ptr=12345 by replacing current(retrieved) equipment_num is 1, with 111 and
								// equipment where equipment_ptr=67891 by replacing current(retrieved) equipment_num is 5, with 555
						  }
					  }						  
				}//loop "EQUIP_NUM" ends
				//
				v_msgUpdateWhat = "Equipment EQUIPMENT NUMBER";
		break;//......................................................
		//____________________________________________________________
		case "SERIAL_NUM": //.........................................
				v_ValuesForEdit = "SERIAL_NUM|";
				for (var e=0; e<elements.length; e++)
				{//loop "SERIAL_NUM" starts
					  if (elements[e].type == "text" && elements[e].name.substr(0,21) == "txt_SerialNumForEdit_") // 21 because of the length of the control name
					  { 
						  v_IteratedSelectName = elements[e].name.toUpperCase();
						  v_IteratedSelectValue = elements[e].value.toUpperCase();
						  // TEST: alert(v_IteratedSelectName+" = "+v_IteratedSelectValue)
						  v_IteratedHiddenName = elements[e+1].name.toUpperCase(); 
						  v_IteratedHiddenValue = elements[e+1].value.toUpperCase();
						  // TEST: alert(v_IteratedHiddenName+" = "+v_IteratedHiddenValue)
						  
						  if (v_IteratedSelectValue != v_IteratedHiddenValue)
						  {
								v_EQUIP_PTR = v_IteratedSelectName.substr(21);
								
								v_ValuesForEdit += v_EQUIP_PTR+":"+v_IteratedHiddenValue+"/"+v_IteratedSelectValue+";";
								// Final v_ValuesForEdit format example: "SERIAL_NUM|12345:1/111;67891:5/555;
								// It reads: Update 2 pieces of 
								// equipment where equipment_ptr=12345 by replacing current(retrieved) serial_num is 1, with 111 and
								// equipment where equipment_ptr=67891 by replacing current(retrieved) serial_num is 5, with 555

						  }
					  }						  
				}//loop "SERIAL_NUM" ends
				//
				v_msgUpdateWhat = "Equipment SERIAL NUMBER";
		break;//......................................................
	}
	//________________________________________________________________
	if (confirm("ATTENTION!!!\n\nYou are just about to update "+v_msgUpdateWhat+" \nShould we continue?"))
	{
				v_StringStoredProc = "EMAPP.EM_EQUIP_EDITOR.sp_updateEquipment";
				
				of_getCtrlProperties("sel_Site");
				v_StringStoredProc = v_StringStoredProc+"?p_SiteID="+v_CtrlValue;	// v_CtrlValue is Site_ID
				
				v_StringStoredProc = v_StringStoredProc+"&p_currentUser="+v_currentUser;
				
				of_getCtrlProperties("sel_Acronym");
				v_StringStoredProc = v_StringStoredProc+"&p_SelectedEquip_Cat_Ptr="+v_CtrlValue;
				
				v_StringStoredProc = v_StringStoredProc+"&p_ValuesForEdit="+v_ValuesForEdit;
				
				// Ex: v_StringStoredProc = EMAPP.EM_EQUIP_EDITOR.sp_updateEquipment
				//						                          ?p_SiteID=24
				//												  &p_currentUser=987
				//												  &p_SelectedEquip_Cat_Ptr=123456
				//						  						  &p_ValuesForEdit=ACRONYM|12345:DBCS_CB/DBCS_CD;67891:DBCS_CB/DBCS_CJ;
				
		alert("1  "+v_StringStoredProc);
		objAJAX.load(v_StringStoredProc);
		//
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length;//TEST: alert(v_NumberOfRecords);

		for (var r=0; r<v_NumberOfRecords; r++)
		{
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			
			v_RtnUpdWhat = v_ArrayOfValuesInRecord[0].text;
			v_RtnMsg     = v_ArrayOfValuesInRecord[1].text;
		}
		//
		alert("2  "+v_RtnMsg);
		//
		switch (v_RtnUpdWhat) 
		{
			//___________________________________________________________
			case "ACRONYM":
				
				
			break;
			//___________________________________________________________
			//___________________________________________________________
			case "CLASS_CD":
				
			break;
			//___________________________________________________________
			//___________________________________________________________
			case "EQUIP_NUM":
				f_onChange("sel_Acronym");
			break;
			//___________________________________________________________
			//___________________________________________________________
			case "SERIAL_NUM":
				f_onChange("sel_Acronym");
			break;
			//___________________________________________________________
		}
		
		
		
		
	}
	
}}
//------------------------------------------------------------------------------
function f_Validation(){with(self.document.forms[0])
{
	var v_ValueHasChanged = "NO";
	
	var v_ListOfVaues = "";
	
	var ary_ListOfValues = new Array();
	var ary_Counter = 0;
	
	var v_DuplicateValue = "";
	//..........................................................................
	
	v_ValidationPassed = "YES";
	
	of_getCtrlProperties("sel_EditField");
	
	// Validation: Was anything edited
	if (v_CtrlValue == "-1")
	{
		alert("SYSTEM CANNOT PROCESS YOUR REQUEST."+
			  "\nField that has to be edited is unknown."+
			  "\nPlease make selection in the control called \"Edit Field\".");
		document.getElementById("sel_EditField").focus();
		v_ValidationPassed = "NO";
	}
	else
	{
		switch (v_CtrlValue) 
		{
			case "ACRONYM": //....................................................
					for (var e=0; e<elements.length; e++)
					{// loop "ACRONYM" starts:
						if (elements[e].type == "select-one" && elements[e].name.substr(0,19) == "sel_AcronymForEdit_") //// 19 because of the length of the control name
						{
							  v_IteratedSelectName = elements[e].name;
							  v_IteratedSelectValue = elements[e].value;
							  // TEST: alert(v_IteratedSelectName+" = "+v_IteratedSelectValue)
							  v_IteratedHiddenName = elements[e+1].name; 
							  v_IteratedHiddenValue = elements[e+1].value;
							  // TEST: alert(v_IteratedHiddenName+" = "+v_IteratedHiddenValue)
							  
							  if (v_IteratedSelectValue != v_IteratedHiddenValue)
							  {
									v_ValueHasChanged = "YES";
									break;
							  }							
						}
						
					} // loop "ACRONYM" ends.
										if (v_ValueHasChanged == "NO")
					{
						v_ValidationPassed = "NO";
						alert("SYSTEM CANNOT PROCESS YOUR REQUEST."+
			  				  "\nThere are no changes in the column \"ACRONYM\".");
					}
					
			break;
			//____________________________________________________________________
			case "CLASS_CD": //...................................................
					for (var e=0; e<elements.length; e++)
					{//loop "CLASS_CD" starts
						  if (elements[e].type == "select-one" && elements[e].name.substr(0,21) == "sel_ClassCodeForEdit_") // 21 because of the length of the control name
						  { 
							  v_IteratedSelectName = elements[e].name;
							  v_IteratedSelectValue = elements[e].value;
							  // TEST: alert(v_IteratedSelectName+" = "+v_IteratedSelectValue)
							  v_IteratedHiddenName = elements[e+1].name; 
							  v_IteratedHiddenValue = elements[e+1].value;
							  // TEST: alert(v_IteratedHiddenName+" = "+v_IteratedHiddenValue)
							  
							  if (v_IteratedSelectValue != v_IteratedHiddenValue)
							  {
									v_ValueHasChanged = "YES";
									break;
							  }
						  }//						  //

					}//loop "CLASS_CD" ends
					//
					if (v_ValueHasChanged == "NO")
					{
						v_ValidationPassed = "NO";
						alert("SYSTEM CANNOT PROCESS YOUR REQUEST."+
			  				  "\nThere are no changes in the column \"CLASS CODE\".");
					}
					
			break;
			//____________________________________________________________
			case "EQUIP_NUM": //..........................................
					
					v_ValueHasChanged = "NO";
					
					for (var e=0; e<elements.length; e++)
					{//loop "EQUIP_NUM" starts					
						if (elements[e].type == "text" && elements[e].name.substr(0,20) == "txt_EquipNumForEdit_") // 13 because of the length of the control name
						{
							  v_IteratedTextName = elements[e].name.toUpperCase();
							  v_IteratedTextValue = elements[e].value.toUpperCase();
							  // TEST: alert(v_IteratedSelectName+" = "+v_IteratedSelectValue)
							  v_IteratedHiddenName = elements[e+1].name.toUpperCase(); 
							  v_IteratedHiddenValue = elements[e+1].value.toUpperCase();
							  // TEST: alert(v_IteratedHiddenName+" = "+v_IteratedHiddenValue)
							   
							  if (v_IteratedTextValue != v_IteratedHiddenValue)
							  {
								  v_ValueHasChanged = "YES";
							  }
							   
							  ary_ListOfValues[ary_Counter] = v_IteratedTextValue;
							  ary_Counter++;
							   
							  v_ListOfVaues += v_IteratedTextValue+",";
							   
						}
					}//loop "EQUIP_NUM" ends
					//
					if ( v_ValueHasChanged == "NO")
					{
						v_ValidationPassed = "NO";
						alert("SYSTEM CANNOT PROCESS YOUR REQUEST."+
			  				  "\nThere are no changes in the column \"EQUIP. NUM\".");						
					}
					else if (v_ValueHasChanged == "YES")
					{
						  v_ListOfVaues = v_ListOfVaues.substr(0,v_ListOfVaues.length-1);
						  ary_ListOfValues = ary_ListOfValues.sort();
						  
						  v_DuplicateValue = "";
						  for (a=0; a<ary_ListOfValues.length-1; a++)
						  {
								  if (ary_ListOfValues[a+1] == ary_ListOfValues[a])
								  {
									  v_DuplicateValue = ary_ListOfValues[a];
									  break;
								  }
						  }
						  if (v_DuplicateValue != "")
						  {
							  v_ValidationPassed = "NO";
							  
							  alert("SYSTEM CANNOT PROCESS YOUR REQUEST."+
									"\nColumn \"EQUIP. NUM\" has a value "+v_DuplicateValue+" that is repeated at least twice.\n"+
									"Please review values in the column.");	
						  }
					}
			break;//......................................................
			//____________________________________________________________
			case "SERIAL_NUM": //.........................................
			
					v_ValueHasChanged = "NO";
					
					for (var e=0; e<elements.length; e++)
					{//loop "SERIAL_NUM" starts					
						if (elements[e].type == "text" && elements[e].name.substr(0,21) == "txt_SerialNumForEdit_") // 14 because of the length of the control name
						{
							  v_IteratedTextName = elements[e].name.toUpperCase();
							  v_IteratedTextValue = elements[e].value.toUpperCase();
							  // TEST: alert(v_IteratedSelectName+" = "+v_IteratedSelectValue)
							  v_IteratedHiddenName = elements[e+1].name.toUpperCase(); 
							  v_IteratedHiddenValue = elements[e+1].value.toUpperCase();
							  // TEST: alert(v_IteratedHiddenName+" = "+v_IteratedHiddenValue)
							   
							  if (v_IteratedTextValue != v_IteratedHiddenValue)
							  {
								  v_ValueHasChanged = "YES";
							  }
							   
							  ary_ListOfValues[ary_Counter] = v_IteratedTextValue;
							  ary_Counter++;
							   
							  v_ListOfVaues += v_IteratedTextValue+",";
							   
						}
					}//loop "SERIAL_NUM" ends
					//
					if ( v_ValueHasChanged == "NO")
					{
						v_ValidationPassed = "NO";
						alert("SYSTEM CANNOT PROCESS YOUR REQUEST."+
			  				  "\nThere are no changes in the column \"SERIAL NUM\".");						
					}
					else if (v_ValueHasChanged == "YES")
					{
						  v_ListOfVaues = v_ListOfVaues.substr(0,v_ListOfVaues.length-1);
						  ary_ListOfValues = ary_ListOfValues.sort();
						  
						  v_DuplicateValue = "";
						  for (a=0; a<ary_ListOfValues.length-1; a++)
						  {
								  if (ary_ListOfValues[a+1] == ary_ListOfValues[a])
								  {
									  v_DuplicateValue = ary_ListOfValues[a];
									  break;
								  }
						  }
						  if (v_DuplicateValue != "")
						  {
							  v_ValidationPassed = "NO";
							  
							  alert("SYSTEM CANNOT PROCESS YOUR REQUEST."+
									"\nColumn \"SERIAL NUM\" has a value "+v_DuplicateValue+" that is repeated at least twice.\n"+
									"Please review values in the column.");	
						  }
					}
			break;//......................................................
		}
	}
	return v_ValidationPassed

}}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------ f_onChange("sel_Area")
function f_onChange(arg_CtrlName) 
{
	switch(arg_CtrlName)
	{
		case "sel_Area":
			f_getsetNADS("DIST");
			f_getsetNADS("SITE");
			f_getsetSiteEqupmentGroup();
			f_getsetAcronymList();
			f_outputSearchCriteria_Location();
			f_resetEditFieldList();
			f_getEquipmentList();
			
		break;
		//
		case "sel_Dist":
			f_getsetNADS("SITE");
			f_getsetSiteEqupmentGroup();
			f_getsetAcronymList();
			f_outputSearchCriteria_Location();
			f_resetEditFieldList();
			f_getEquipmentList();
			
		break;
		//
		case "sel_Site":
			f_getsetSiteEqupmentGroup();
			f_getsetAcronymList();
			f_outputSearchCriteria_Location();
			f_resetEditFieldList();
			f_getEquipmentList();
			
		break;
		//
		case "sel_EquipGroup":
			f_getsetAcronymList();
			f_resetEditFieldList();
			f_getEquipmentList();
		break;
		//
		case "sel_Acronym":
			f_resetEditFieldList();
			f_getEquipmentList();
		//
		case "sel_EditField":
			of_getCtrlProperties("sel_Acronym");
			if(v_CtrlValue != "-1")
			{
				f_getEquipmentList();
			}
			f_enable_desableControls();
		break;
		//
	} // end of switch
}
//------------------------------------------------------------------------------
function f_onChangeAcronymForEdit(arg_CtrlName){with(self.document.forms[0])
{// Format of "arg_CtrlName" is sel_AcronymForEdit_12345
	
	var v_SelectedEquipPtrForEdit = "";
	var v_SelectedClassCode       = "";
	//..........................................................................
	of_getCtrlProperties(arg_CtrlName);
	v_SelectedEquipPtrForEdit = v_CtrlName.substr(19); // ex: 12345
	v_SelectedClassCode = v_CtrlValue.substr(v_CtrlValue.length - 2); // ex: v_CtrlValue = "DBCS_CJ"; v_SelectedClassCode = "CJ"
	
	of_setSingleValue("txt_ClassCodeForEdit_"+v_SelectedEquipPtrForEdit, "'"+v_SelectedClassCode+"'", "", "", 0);
}}
//------------------------------------------------------------------------------
function f_enable_desableControls(){with(self.document.forms[0])
{
	of_getCtrlProperties("sel_EditField");
	
	if ( v_CtrlValue == "-1" ) 
	{//1
		  for (var e=0; e<elements.length; e++)
		  {//1.1
			  // ACRONYM:
			  if(elements[e].type == "select-one" && elements[e].id.substr(0,19) == "sel_AcronymForEdit_")
			  {
				  	v_IteratedSelectName = elements[e].name;
				  	document.getElementById(v_IteratedSelectName).disabled=true;
			  }
			  // CLASS CODE:
			  if (elements[e].type == "select-one" && elements[e].id.substr(0,21) == "sel_ClassCodeForEdit_") //
			  {
				      v_IteratedSelectName = elements[e].name;
					  document.getElementById(v_IteratedSelectName).disabled=true;
			  }
			  // EQUIPMENT NUMBER:
			  if (elements[e].type == "text" && elements[e].id.substr(0,20) == "txt_EquipNumForEdit_")
			  {
					  v_IteratedTextName = elements[e].name;
					  document.getElementById(v_IteratedTextName).disabled=true;
			  }
			  //....................................................................
			  // SERIAL NUMBER:
			  if (elements[e].type == "text" && elements[e].id.substr(0,21) == "txt_SerialNumForEdit_")
			  {
					  v_IteratedTextName = elements[e].name;
					  document.getElementById(v_IteratedTextName).disabled=true;						
			  }					
		  }	//1.1	
	} //1
	else if (v_CtrlValue == "ACRONYM")
	{
		for (var e=0; e<elements.length; e++)
		{//2.1
			// ACRONYM:
			if (elements[e].type == "select-one" && elements[e].id.substr(0,19) == "sel_AcronymForEdit_") //
			{
				  	v_IteratedSelectName = elements[e].name;
				  	document.getElementById(v_IteratedSelectName).disabled=false;
			}
			// CLASS CODE:
			if (elements[e].type == "select-one" && elements[e].id.substr(0,21) == "sel_ClassCodeForEdit_") //
			{
				  	v_IteratedSelectName = elements[e].name;
				  	document.getElementById(v_IteratedSelectName).disabled=true;
			}
			// EQUIPMENT NUMBER:
			if (elements[e].type == "text" && elements[e].id.substr(0,20) == "txt_EquipNumForEdit_")
			{
					v_IteratedTextName = elements[e].name;
					document.getElementById(v_IteratedTextName).disabled=true;
			}
			//....................................................................
			// SERIAL NUMBER:
			if (elements[e].type == "text" && elements[e].id.substr(0,21) == "txt_SerialNumForEdit_")
			{
					v_IteratedTextName = elements[e].name;
					document.getElementById(v_IteratedTextName).disabled=true;						
			}	
		}//2.1
			
	}
	//
	else if (v_CtrlValue == "CLASS_CD")
	{//2
		for (var e=0; e<elements.length; e++)
		{//2.1
			// ACRONYM:
			if (elements[e].type == "select-one" && elements[e].id.substr(0,19) == "sel_AcronymForEdit_") //
			{
					v_IteratedSelectName = elements[e].name;
				  	document.getElementById(v_IteratedSelectName).disabled=true;
			}
			// CLASS CODE:
			if (elements[e].type == "select-one" && elements[e].id.substr(0,21) == "sel_ClassCodeForEdit_") //
			{
				  	v_IteratedSelectName = elements[e].name;
				  	document.getElementById(v_IteratedSelectName).disabled=false;
			}
			// EQUIPMENT NUMBER:
			if (elements[e].type == "text" && elements[e].id.substr(0,20) == "txt_EquipNumForEdit_")
			{
					v_IteratedTextName = elements[e].name;
					document.getElementById(v_IteratedTextName).disabled=true;
			}
			//....................................................................
			// SERIAL NUMBER:
			if (elements[e].type == "text" && elements[e].id.substr(0,21) == "txt_SerialNumForEdit_")
			{
					v_IteratedTextName = elements[e].name;
					document.getElementById(v_IteratedTextName).disabled=true;						
			}	
		}//2.1
	}//2
	else if (v_CtrlValue == "EQUIP_NUM")
	{//3
		for (var e=0; e<elements.length; e++)
		{//3.1
			// ACRONYM:
			if (elements[e].type == "select-one" && elements[e].id.substr(0,19) == "sel_AcronymForEdit_") //
			{
					v_IteratedSelectName = elements[e].name;
				  	document.getElementById(v_IteratedSelectName).disabled=true;
			}
			// CLASS CODE:
			if (elements[e].type == "select-one" && elements[e].id.substr(0,21) == "sel_ClassCodeForEdit_") //
			{
				  	v_IteratedSelectName = elements[e].name;
				  	document.getElementById(v_IteratedSelectName).disabled=true;
			}
			// EQUIPMENT NUMBER:
			if (elements[e].type == "text" && elements[e].id.substr(0,20) == "txt_EquipNumForEdit_")
			{
					v_IteratedTextName = elements[e].name;
					document.getElementById(v_IteratedTextName).disabled=false;
			}
			//....................................................................
			// SERIAL NUMBER:
			if (elements[e].type == "text" && elements[e].id.substr(0,21) == "txt_SerialNumForEdit_")
			{
					v_IteratedTextName = elements[e].name;
					document.getElementById(v_IteratedTextName).disabled=true;						
			}	
		}//3.1		
	}//3
	else if (v_CtrlValue == "SERIAL_NUM")
	{//4
		for (var e=0; e<elements.length; e++)
		{//4.1
			// ACRONYM:
			if (elements[e].type == "select-one" && elements[e].id.substr(0,19) == "sel_AcronymForEdit_") //
			{
					v_IteratedSelectName = elements[e].name;
				  	document.getElementById(v_IteratedSelectName).disabled=true;
			}
			// CLASS CODE:
			if (elements[e].type == "select-one" && elements[e].id.substr(0,21) == "sel_ClassCodeForEdit_") //
			{
				  	v_IteratedSelectName = elements[e].name;
				  	document.getElementById(v_IteratedSelectName).disabled=true;
			}
			// EQUIPMENT NUMBER:
			if (elements[e].type == "text" && elements[e].id.substr(0,20) == "txt_EquipNumForEdit_")
			{
					v_IteratedTextName = elements[e].name;
					document.getElementById(v_IteratedTextName).disabled=true;
			}
			//....................................................................
			// SERIAL NUMBER:
			if (elements[e].type == "text" && elements[e].id.substr(0,21) == "txt_SerialNumForEdit_")
			{
					v_IteratedTextName = elements[e].name;
					document.getElementById(v_IteratedTextName).disabled=false;						
			}	
		}//4.1		
	}//4
}}
//------------------------------------------------------------------------------
function f_getsetNADS(arg_NADS_Type)
{
	v_Option_Value = "";
	v_Option_Text  = "";
	
	var v_AreaCD = "";
	var v_DistCD = "";
	var v_SiteID = "";
	// .........................................................................
	if (arg_NADS_Type == "AREA") 
	{
			objAJAX.load("EMAPP.EM_EQUIP_EDITOR.sp_getNADS?p_NADS_Type="+arg_NADS_Type+
															  "&p_ID=''");
			v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
			v_NumberOfRecords = v_ArrayOfRecords.length;//TEST: alert(v_NumberOfRecords);
		
			for (var r=0; r<v_NumberOfRecords; r++)
			{
				v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
				v_Option_Value = v_ArrayOfValuesInRecord[0].text;
				v_Option_Text  = v_ArrayOfValuesInRecord[1].text;
				
				if (arg_NADS_Type == "AREA")
				{
					if (v_Option_Value == "NTNL")
					{
						of_setSingleValue("sel_Area", v_Option_Value, v_Option_Text, "NO", r);
					}
					else
					{
						of_setSingleValue("sel_Area", v_Option_Value, of_RPad("("+v_Option_Value+")",8,'.'  ) +v_Option_Text, "NO", r);
					}
				}
			}
			//
			of_selectRecord("sel_Area", "NTNL"); //<-- Highligths the first record in control "sel_Area".
	}// end of "else if"
	// 2.2 ......................................................................
	else if (arg_NADS_Type == "DIST") 
	{
			var v_AreaCD = "";
			var v_NumOfSelectedDist = "0";
			
			of_getCtrlProperties("sel_Area");
			v_AreaCD = v_CtrlValue;
			
			if (v_AreaCD == "NTNL")
			{
				of_setSingleValue("sel_Dist", v_DefaultValue, "== Selected Area Districts: "+v_NumOfSelectedDist+" ==", "YES", 0);
			}
			else if(v_AreaCD != "NTNL")
			{
				objAJAX.load("EMAPP.EM_EQUIP_EDITOR.sp_getNADS?p_NADS_Type="+arg_NADS_Type+
																  "&p_ID="+v_AreaCD);
				v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
				v_NumberOfRecords = v_ArrayOfRecords.length;//TEST: alert(v_NumberOfRecords);		
				
				v_NumOfSelectedDist = v_NumberOfRecords;
				of_setSingleValue("sel_Dist", v_DefaultValue, "== Selected Area Districts: "+v_NumOfSelectedDist+" ==", "YES", 0);
				
				for (var r=0; r<v_NumberOfRecords; r++)
				{
					v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
					v_Option_Value = v_ArrayOfValuesInRecord[0].text;
					v_Option_Text  = v_ArrayOfValuesInRecord[1].text;
					
					of_setSingleValue("sel_Dist", v_Option_Value, of_RPad("("+v_Option_Value+")",8,'.')+v_Option_Text, "NO", r+1);
				}
			}
			//
			of_selectRecord("sel_Dist", v_DefaultValue); //<-- Highligths the first record in control "sel_Dist".
	}// end of "else if"
	// 2.3 .....................................................................
	else if (arg_NADS_Type == "SITE")
	{
			var v_DistCD = "";
			var v_NumOfSelectedSites = "0";
			
			of_getCtrlProperties("sel_Dist");
			v_DistCD = v_CtrlValue;
			
			if (v_DistCD == v_DefaultValue)
			{
				of_setSingleValue("sel_Site", v_DefaultValue, "== Selected District Sites: "+v_NumOfSelectedSites+" ==", "YES", 0);
			}
			else if (v_DistCD != v_DefaultValue)
			{
				
				objAJAX.load("EMAPP.EM_EQUIP_EDITOR.sp_getNADS?p_NADS_Type="+arg_NADS_Type+
															 "&p_ID="+v_DistCD);
				v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
				v_NumberOfRecords = v_ArrayOfRecords.length;//TEST: alert(v_NumberOfRecords);	
				
				v_NumOfSelectedSites = v_NumberOfRecords;
				of_setSingleValue("sel_Site", v_DefaultValue, "== Selected District Sites: "+v_NumOfSelectedSites+" ==", "YES", 0);
				
				for (var r=0; r<v_NumberOfRecords; r++)
				{
					v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
					v_Option_Value = v_ArrayOfValuesInRecord[0].text;
					v_Option_Text  = v_ArrayOfValuesInRecord[1].text;
					
					of_setSingleValue("sel_Site", v_Option_Value, of_RPad("("+v_Option_Value+")",8,'.')+v_Option_Text, "NO", r+1);	
				}
			}
			
			of_selectRecord("sel_Site", v_DefaultValue); //<-- Highligths the first record in control "sel_Site".
	}// end of "else if"
}
//------------------------------------------------------------------------------
function f_getsetSiteEqupmentGroup()
{
	var v_Option_Value = "";
	var v_Option_Text  = "";
	
	var v_SiteID = "";
	//..........................................................................
	of_getCtrlProperties("sel_Site");
	v_SiteID = v_CtrlValue;
	if(v_SiteID == v_DefaultValue)
	{
		of_setSingleValue("sel_EquipGroup", v_DefaultValue, "== Selected Equipment Group: 0 ==", "YES", 0);
	}
	else
	{
			// 1. Retrieve data:
			objAJAX.load("EMAPP.EM_EQUIP_EDITOR.sp_getEqupmentGroup?p_SiteID="+v_SiteID);
			
			// 2. Populate retrieved data:
			v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
			v_NumberOfRecords = v_ArrayOfRecords.length;//TEST: alert(v_NumberOfRecords);
			// 2.1 ..................................................................... 
			of_setSingleValue("sel_EquipGroup", v_DefaultValue, "== Selected Equipment Group: "+v_NumberOfRecords+" ==", "YES", 0);
			
			for (var r=0; r<v_NumberOfRecords; r++)
			{
				v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
				v_Option_Value = v_ArrayOfValuesInRecord[0].text;
				v_Option_Text  = v_ArrayOfValuesInRecord[1].text;
				
				of_setSingleValue("sel_EquipGroup", v_Option_Value, of_RPad("("+v_Option_Value+")",8,'.')+v_Option_Text, "NO", r+1);	
			}
			
	}
	of_selectRecord("sel_EquipGroup", v_DefaultValue);
}
//------------------------------------------------------------------------------

function f_getsetAcronymList(){with(self.document.forms[0])
{
	var v_SelectedSiteID     = "";
	var v_SelectedEquipGroup = "";
	
	var v_NumOfAcronymRecords = "0";
	
	var v_Change_Acronym = "";
	//..........................................................................
	
	of_getCtrlProperties("sel_Site");
	v_SelectedSiteID = v_CtrlValue;
	
	of_getCtrlProperties("sel_EquipGroup");
	v_SelectedEquipGroup = v_CtrlValue;
	
	
	if (v_SelectedEquipGroup == v_DefaultValue)
	{
		of_setSingleValue("sel_Acronym", v_DefaultValue, "==== Selected Acronym: "+v_NumOfAcronymRecords+" ===== ", "YES", 0);
	}
	else
	{	
		// 1. Retrieve data:
		objAJAX.load("EMAPP.EM_EQUIP_EDITOR.sp_getAcronymList?p_SiteID="+v_SelectedSiteID+
																 "&p_EquipGroup="+v_SelectedEquipGroup);
		// 2. Populate retrieved data:
		
		orgBfr_Acronyms.length = 0;
		
		v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
		v_NumberOfRecords = v_ArrayOfRecords.length;//TEST: alert(v_NumberOfRecords);															 
		
		v_NumOfAcronymRecords = v_NumberOfRecords;
		
		of_setSingleValue("sel_Acronym", v_DefaultValue, "==== Selected Acronym: "+v_NumOfAcronymRecords+" ===== ", "YES", 0);
	
		for (var r=0; r<v_NumberOfRecords; r++)
		{
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			
			v_Option_Value   = v_ArrayOfValuesInRecord[0].text;
			v_Option_Text    = v_ArrayOfValuesInRecord[1].text;
			v_Change_Acronym = v_ArrayOfValuesInRecord[2].text;
			//TEST: alert(v_Option_Value+"   "+ v_Option_Text+"  "+v_Change_Acronym);
						
			orgBfr_Acronyms[r] = new array_Acronyms(v_Option_Value, v_Option_Text, v_Change_Acronym);
			
			of_setSingleValue("sel_Acronym", v_Option_Value, v_ArrayOfValuesInRecord[0].text+"  "+v_Option_Text, "NO", r+1);	
		}
	}
	
	of_selectRecord("sel_Acronym", v_DefaultValue);
}}
//-----------------------------------------------------------------------------
function f_resetEditFieldList(){with(self.document.forms[0])
{
	var v_SelectedEquipCatPtr = "";
	var v_SelectedChangeAcronym = "NO";
	//.........................................................................
	of_getCtrlProperties("sel_Acronym");
	v_SelectedEquipCatPtr = v_CtrlValue;
	
	if (v_SelectedEquipCatPtr == -1)
	{
		of_setSingleValue("sel_EditField", v_DefaultValue, "=== Select One ===", "YES", 0);
		//of_selectRecord("sel_EditField", v_DefaultValue);
	}
	else
	{
		for (var a=0; a<orgBfr_Acronyms.length; a++)
		{
			if (v_SelectedEquipCatPtr == orgBfr_Acronyms[a].a_option_value)
			{
				v_SelectedChangeAcronym = orgBfr_Acronyms[a].a_change_acronym
				//
				if (v_SelectedChangeAcronym == "YES")
				{
					of_setSingleValue("sel_EditField", v_DefaultValue, "=== Select One ===", "YES", 0);
					of_setSingleValue("sel_EditField", "ACRONYM",      "Acronym and Class Code","NO",  1);
					//of_setSingleValue("sel_EditField", "CLASS_CD",     "Class Code", 		 "NO",  4);
					of_setSingleValue("sel_EditField", "EQUIP_NUM",    "Equipment Number",   "NO",  2);
					of_setSingleValue("sel_EditField", "SERIAL_NUM",   "Serial Number", 	 "NO",  3);
					
				}
				else if ( v_SelectedChangeAcronym == "NO")
				{
					of_setSingleValue("sel_EditField", v_DefaultValue, "=== Select One ===", "YES", 0);
					of_setSingleValue("sel_EditField", "CLASS_CD",     "Class Code", 	     "NO",  1);
					of_setSingleValue("sel_EditField", "EQUIP_NUM",    "Equipment Number",   "NO",  2);
					of_setSingleValue("sel_EditField", "SERIAL_NUM",   "Serial Number", 	 "NO",  3);						
				}
				//
				//of_selectRecord("sel_EditField", v_DefaultValue);
				//
				break;	
			}
		}
	}
	//
	of_selectRecord("sel_EditField", v_DefaultValue);
}}
//-----------------------------------------------------------------------------

function f_getEquipmentList(){with(self.document.forms[0])
{
	var v_SelectedSiteID = "";
	var v_SelectedEquipGroup = "";
	var v_SelectedEquipCatPtr = "";
	var v_SelectedChangeAcronym = "";

	var v_OutputTblOpenTag = "<table wodth='100%' align='left' border='0'>"+
						   		"<tr>"+
									  "<th width='10%'>SUBSITE</th>"+
									  "<th width='55%'>ACRONYM</th>"+
									  "<th width='12%'>CLASS CODE</th>"+
									  "<th width='15%'>EQUIP. NUM</th>"+
									  "<th width='18%'>SERIAL NUM</th>"+
								"</tr>";
	var v_OutputRow  = "";
	var v_OutputRows = "";
	var v_OutputTblCloseTag = "</table>";
	
	var v_EQUIP_PTR     = "";
	var v_SUBSITE    	= "";
	var v_ACRONYM       = "";
	var v_ACRONYM_DESCR = "";
	var v_CLASS_CODE 	= "";
	var v_EQUIP_NUM  	= "";
	var v_SERIAL_NUM 	= "";
	//
	v_IteratedSelectName  = "";
	v_IteratedSelectValue = "";
	
	v_IteratedTextName  = "";
	v_IteratedTextValue  = "";
	
	v_IteratedHiddenName  = "";
	v_IteratedHiddenValue = "";
	//.........................................................................	
	of_getCtrlProperties("sel_Site");
	v_SelectedSiteID = v_CtrlValue;
	
	of_getCtrlProperties("sel_EquipGroup");
	v_SelectedEquipGroup = v_CtrlValue;
	
	of_getCtrlProperties("sel_Acronym");
	v_SelectedEquipCatPtr = v_CtrlValue; // Variable has the value of Equipment Category Pointer
	//.........................................................................
	//v_SelectedChangeAcronym 
	for (var a=0; a<orgBfr_Acronyms.length; a++)
	{
		if (v_SelectedEquipCatPtr == orgBfr_Acronyms[a].a_option_value)
		{
			v_SelectedChangeAcronym = orgBfr_Acronyms[a].a_change_acronym
			//TEST expected result: "YES" / "NO":	alert(v_SelectedChangeAcronym)
			break;
		}
	}
	//.........................................................................
	// Resetting the following DIVs.
	of_outPut("div_EqupOutput", v_DefaultEquipmentOutput); 
	of_outPut("div_NumberOfRecords", "0");
	//.........................................................................	

						if (v_SelectedEquipCatPtr != v_DefaultValue)
						{
							//...................................................................
							//ACRONYM:
							if (v_SelectedChangeAcronym == "YES")
							{
								objAJAX.load("EMAPP.EM_EQUIP_EDITOR.sp_getAcronymForEdit?p_EquipCatPtr="+v_SelectedEquipCatPtr);
								 
								orgBfr_AcronymsForEdit.length = 0;
								 
							    if (objAJAX.parsed)
								{
									v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
									v_NumberOfRecords = v_ArrayOfRecords.length;
									//
									for (r=0; r<v_NumberOfRecords; r++)
									{
										v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
										orgBfr_AcronymsForEdit[r] = new array_AcronymsForEdit(v_ArrayOfValuesInRecord[0].text, // a_acronym
																							  v_ArrayOfValuesInRecord[1].text, // a_acronym_desc
																							  v_ArrayOfValuesInRecord[2].text,// a_class_code
																							  v_ArrayOfValuesInRecord[3].text);// a_is_selected
									}
								}
							}
							//....................................................................
							// CLASS CODES:
							objAJAX.load("EMAPP.EM_EQUIP_EDITOR.sp_getClassCodeForEdit?p_EquipCatPtr="+v_SelectedEquipCatPtr);
							// "orgBfr_ClassCode" is declared in Variable Declaration section
							
							orgBfr_ClassCode.length = 0;
							
							if (objAJAX.parsed)
							{//1.2
								v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
								v_NumberOfRecords = v_ArrayOfRecords.length; //TEST: alert(v_NumberOfRecords)
								//
								for (var r=0; r<v_NumberOfRecords; r++)
								{//1.2.1
									v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
									orgBfr_ClassCode[r] = new array_ClassCode( v_ArrayOfValuesInRecord[0].text ); //class_code
								}//1.2.1
							}//1.2
							//
							//....................................................................
							//
							objAJAX.load("EMAPP.EM_EQUIP_EDITOR.sp_getEquipmentForEdit?p_SiteID="+v_SelectedSiteID+
																				  "&p_EquipGroup="+v_SelectedEquipGroup+
																				  "&p_EquipCatPtr="+v_SelectedEquipCatPtr);
							v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
							v_NumberOfRecords = v_ArrayOfRecords.length;
							//TEST: alert(v_NumberOfRecords+"\n"+v_SelectedSiteID+"  "+v_SelectedEquipGroup+"   "+v_SelectedEquipCatPtr);
							//
							v_NumberOfEquipRecords = v_NumberOfRecords;		
							of_outPut("div_NumberOfRecords", v_NumberOfEquipRecords);
							//
							//............................................................................
					
							if (v_NumberOfRecords == 0) //1
							{
								of_outPut("div_EqupOutput", "No Records Available");
							}
							else //1F
							{
									of_outPut("div_EqupOutput", "");
									//				
									for (var r=0; r<v_NumberOfRecords; r++)
									{
										v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
										
										v_EQUIP_PTR     = v_ArrayOfValuesInRecord[0].text;
										v_SUBSITE    	= v_ArrayOfValuesInRecord[1].text;
										v_ACRONYM    	= v_ArrayOfValuesInRecord[2].text;
										v_ACRONYM_DESCR = v_ArrayOfValuesInRecord[3].text;
										v_CLASS_CODE 	= v_ArrayOfValuesInRecord[4].text;
										v_EQUIP_NUM  	= v_ArrayOfValuesInRecord[5].text;
										v_SERIAL_NUM 	= v_ArrayOfValuesInRecord[6].text;
										//...............................................................
										v_OutputRow = "<tr>"+
										// COLUMN "SUBSITE":
															"<td>"+v_SUBSITE+"</td>";
										//
										// COLUMN "ACRONYM":
										if (v_SelectedChangeAcronym == "NO")
										{				
											v_OutputRow += "<td>"+v_EQUIP_PTR+"  "+v_ACRONYM+" - "+v_ACRONYM_DESCR+"</td>";
										}
										else if (v_SelectedChangeAcronym == "YES")
										{
											v_OutputRow += "<td>"+
																"<div id=\"div_AcronymForEdit\">";
													v_OutputRow += /*"sel_AcronymForEdit_"+*/v_EQUIP_PTR;
													v_OutputRow += "<select id='sel_AcronymForEdit_"+v_EQUIP_PTR+"' "+
																				"name='sel_AcronymForEdit_"+v_EQUIP_PTR+"' "+
																				"size='1' "+
																				"alt='Acronym for Edit "+v_ACRONYM+"' "+
																				"tabindex='"+v_EQUIP_PTR+"' "+
																				"onChange='f_onChangeAcronymForEdit(this.name);' "+
																				"class='c_CtrlValue'> "+
																	"</select>"+
																   "<input type='hidden' id='hdn_AcronymForEdit_"+v_EQUIP_PTR+
																		"' name='hdn_AcronymForEdit_"+v_EQUIP_PTR+"' value='"+v_ACRONYM+"_"+v_CLASS_CODE+"' />"+
																"</div>";
															"</td>";
										}
										//...............................................................
										// COLUMN "CLASS CODE":
										if (v_SelectedChangeAcronym == "NO")
										{
											v_OutputRow += "<td>"+
																  "<div id=\"div_ClassCode\">"+
																	  //"sel_ClassCodeForEdit_"+v_EQUIP_PTR+
																	  "<select id='sel_ClassCodeForEdit_"+v_EQUIP_PTR+"' "+
																			  "name='sel_ClassCodeForEdit_"+v_EQUIP_PTR+"' "+
																			  "size='1' "+
																			  "alt='Class Code for "+v_ACRONYM+"' "+
																			  "tabindex='"+v_EQUIP_PTR+"' "+
																			  "onChange='f_onChange(this.name);' "+
																			  "class='c_CtrlValue'> "+
																	  "</select>"+
																	  "<input type='hidden' id='hdn_ClassCodeForEdit_"+v_EQUIP_PTR+
																			"' name='hdn_ClassCodeForEdit_"+v_EQUIP_PTR+"' value='"+v_CLASS_CODE+"' />"+
																  "</div>"+
															"</td>";
										}
										else if (v_SelectedChangeAcronym == "YES")
										{
											v_OutputRow += "<td>"+
																  "<input type='text' id='txt_ClassCodeForEdit_"+v_EQUIP_PTR+
																			"' name='txt_ClassCodeForEdit_"+v_EQUIP_PTR+"' value='"+v_CLASS_CODE+"' />"+
																   "<input type='hidden' id='hdn_ClassCodeForEdit_"+v_EQUIP_PTR+
																			"' name='hdn_ClassCodeForEdit_"+v_EQUIP_PTR+"' value='"+v_CLASS_CODE+"' />"+
																  "</div>"+
															"</td>";
										}
										//...............................................................
										// COLUMN "EQUIP NUM":
										v_OutputRow += 		"<td>"+
																  "<input type='text' id='txt_EquipNumForEdit_"+v_EQUIP_PTR+
																  		"' name='txt_EquipNumForEdit_"+v_EQUIP_PTR+"' size='10' value='"+v_EQUIP_NUM+"' />"+
																  "<input type='hidden' id='hdn_EquipNumForEdit_"+v_EQUIP_PTR+
																  		"' name='hdn_EquipNumForEdit_"+v_EQUIP_PTR+"' value='"+v_EQUIP_NUM+"' />"+
															"</td>"+
										// COLUMN "SERIAL NUM":
															"<td>"+
																  "<input type='text'   id='txt_SerialNumForEdit_"+v_EQUIP_PTR+
																  		"' name='txt_SerialNumForEdit_"+v_EQUIP_PTR+"' size='10' value='"+v_SERIAL_NUM+"' />"+
																  "<input type='hidden' id='hdn_SerialNumForEdit_"+v_EQUIP_PTR+
																  		"' name='hdn_SerialNumForEdit_"+v_EQUIP_PTR+"' value='"+v_SERIAL_NUM+"' />"+										
															"</td>"+
													 "</tr>";	
													  
										v_OutputRows = v_OutputRows+v_OutputRow;
									}
									
									of_outPut("div_EqupOutput", v_OutputTblOpenTag +
																v_OutputRows +
																v_OutputTblCloseTag);
									//.........................................................................
									// POPULATING CONTROLS WITH DATA:
									for (var e=0; e<elements.length; e++)
									{
										//....................................................................
										// ACRONYM:
										if (v_SelectedChangeAcronym == "YES" &&
											elements[e].type == "select-one" && elements[e].id.substr(0,19) == "sel_AcronymForEdit_" )
										{
											 v_IteratedSelectName = elements[e].name;
											 //v_IteratedSelectName.options.length = 0;
											 //alert(v_IteratedSelectName)
											 for (var r=0; r<orgBfr_AcronymsForEdit.length; r++)
											 {
												of_setSingleValue(v_IteratedSelectName, 
																  orgBfr_AcronymsForEdit[r].a_acronym+"_"+orgBfr_AcronymsForEdit[r].a_class_code, 
																  "("+orgBfr_AcronymsForEdit[r].a_acronym+" "+orgBfr_AcronymsForEdit[r].a_class_code+")  "+
																  orgBfr_AcronymsForEdit[r].a_acronym_desc, "NO", r);
												
												if (orgBfr_AcronymsForEdit[r].a_is_selected = "selected")
												{
													v_Iterated_IsSelected_Acro_ClassCd = orgBfr_AcronymsForEdit[r].a_acronym+"_"+orgBfr_AcronymsForEdit[r].a_class_code 
												}
												
											 }
											 //
											 v_IteratedHiddenName = "hdn"+v_IteratedSelectName.substr(3);
											 of_getCtrlProperties(v_IteratedHiddenName);
											 v_IteratedHiddenValue = v_CtrlValue;
											 of_selectRecord(v_IteratedSelectName, v_IteratedHiddenValue);	
											 document.getElementById(v_IteratedSelectName).disabled=true;
										}
										//....................................................................
										// CLASS CODE:
										if (v_SelectedChangeAcronym == "NO")
										{
											  if (elements[e].type == "select-one" && elements[e].id.substr(0,21) == "sel_ClassCodeForEdit_") //
											  {
													v_IteratedSelectName = elements[e].name;
													//v_IteratedSelectName.options.length = 0;
													
													for (var cc=0; cc<orgBfr_ClassCode.length; cc++) // cc stands for Class Code
													{
														of_setSingleValue(v_IteratedSelectName, orgBfr_ClassCode[cc].a_class_code,
																								orgBfr_ClassCode[cc].a_class_code, "NO", cc);
													}
													
													v_IteratedHiddenName = "hdn"+v_IteratedSelectName.substr(3);
													//TEST: alert(v_IteratedHiddenName)
													of_getCtrlProperties(v_IteratedHiddenName);
													v_IteratedHiddenValue = v_CtrlValue;

													of_selectRecord(v_IteratedSelectName, v_IteratedHiddenValue);
													document.getElementById(v_IteratedSelectName).disabled=true;
											  }
									    }
										else if (v_SelectedChangeAcronym == "YES")
										{
											  if (elements[e].type == "text" && elements[e].id.substr(0,21) == "txt_ClassCodeForEdit_")
											  {
													v_IteratedTextName = elements[e].name;
													document.getElementById(v_IteratedTextName).disabled=true;
											  }
										}
										//....................................................................
										// EQUIPMENT NUMBER:
										if (elements[e].type == "text" && elements[e].id.substr(0,20) == "txt_EquipNumForEdit_")
										{
												v_IteratedTextName = elements[e].name;
												document.getElementById(v_IteratedTextName).disabled=true;
										}
										//....................................................................
										// SERIAL NUMBER:
										if (elements[e].type == "text" && elements[e].id.substr(0,21) == "txt_SerialNumForEdit_")
										{
												v_IteratedTextName = elements[e].name;
												document.getElementById(v_IteratedTextName).disabled=true;						
										}					
									}
									//.........................................................................
							}// end of 1
						}
//	}
}}
//------------------------------------------------------------------------------
function f_resetScreen()
{
	of_selectRecord("sel_Area", "NTNL");
	f_onChange("sel_Area");
}
//------------------------------------------------------------------------------
function f_outputSearchCriteria_Location(){with(self.document.forms[0])
{
	//..........................................................................
	of_getCtrlProperties("sel_Area");
	var v_Area = v_CtrlValue;
	
	of_getCtrlProperties("sel_Dist");
	var v_Dist = v_CtrlValue;
	
	of_getCtrlProperties("sel_Site");
	var v_Site = v_CtrlValue;
	
	var v_SearchLocation = "";
	//..........................................................................
	if (v_Site < 0)
	{
		if (v_Dist <0)
		{
			of_getCtrlProperties("sel_Area");
			v_SearchLocation = v_CtrlText;
			if (v_CtrlValue == "NTNL")
			{
				v_SearchLocation = v_CtrlText;
				of_setSingleValue("hdn_LocationType", "'"+v_CtrlValue+"'", "", "", 0);
				of_setSingleValue("hdn_LocationID",   "'"+v_CtrlValue+"'", "", "", 0);
			}
			else 
			{ 
				v_SearchLocation = "AREA - "+v_CtrlText;
				of_setSingleValue("hdn_LocationType", "'AREA'", "", "", 0);
				of_setSingleValue("hdn_LocationID",   "'"+v_CtrlValue+"'", "", "", 0); 
			}
		}
		else
		{
			of_getCtrlProperties("sel_Dist");
			v_SearchLocation = "DISTRICT - "+v_CtrlText;
			of_setSingleValue("hdn_LocationType", "'DIST'", "", "", 0);
			of_setSingleValue("hdn_LocationID",   "'"+v_CtrlValue+"'", "", "", 0); 
		}
	}
	else
	{
		of_getCtrlProperties("sel_Site");
		v_SearchLocation = "SITE - "+v_CtrlText;
		of_setSingleValue("hdn_LocationType", "'SITE'", "", "", 0);
		of_setSingleValue("hdn_LocationID",   "'"+v_CtrlValue+"'", "", "", 0); 
	}
	
	of_outPut("id_NADS_SearchCriteria", v_SearchLocation);
	
	//..........................................................................
	// 2. Fiscal Year / Period:
}}
//------------------------------------------------------------------------------
// Page specific FUNCTION DECLARATION ends =====================================
//==============================================================================
//==============================================================================
// INITIAL ACTIONS:
f_positionStyle();
f_set_jQuery();
//
of_outPut("div_Header", f_positionHeader());
//
of_outPut("div_Body", f_positionBody());
//
of_outPut("div_Footer", f_positionFooter());
//
f_getsetNADS("AREA");
//
f_getsetNADS("DIST");
//
f_getsetNADS("SITE");
//
f_getsetSiteEqupmentGroup();
//
f_getsetAcronymList();
//
of_selectRecord("sel_EditField", v_DefaultValue);

//


