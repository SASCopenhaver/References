CREATE OR REPLACE PACKAGE BODY NM_EQUIP_MODS
IS
--=================================================================
--=================================================================
PROCEDURE em_criteria
IS
-------------------------------------------------------------------
--v_SiteName_MaxLength  NUMBER DEFAULT 24;
--v_DistrName_MaxLength NUMBER DEFAULT 22;
--v_AreaName_MaxLength  NUMBER DEFAULT 13;
-------------------------------------------------------------------
----------------------------------------------------------------
BEGIN
nm_main.htp_header(TRUE);

htp.p('
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Modification Tracking</title>
<script language="javascript" type="text/javascript">
//===================================================
// GENERIC FUNCTION starts:
//---------------------------------------------------
  var v_CtrlName  = "";
  var v_CtrlID    = "";
  var v_CtrlType  = "";
  var v_CtrlValue = "";
  var v_CtrlText  = "";
//---------------------------------------------------
var objAJAX = new ActiveXObject("microsoft.XMLDOM");
    objAJAX.async=false;
var v_ArrayOfRecords = new Array();
var v_ArrayOfValuesInRecord = new Array();
var v_NumberOfRecords = 0;
//---------------------------------------------------

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
//---------------------------------------------------

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
//---------------------------------------------------

function of_outPut(arg_WhereOutput, arg_WhatOutput){with(self.document.forms[0])
{
    //alert(arg_WhereOutput+"  "+ arg_WhatOutput)
    document.getElementById(arg_WhereOutput).innerHTML = arg_WhatOutput;
}}
//---------------------------------------------------

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
    }
    //
}}
//---------------------------------------------------
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
    //
}}
//
function of_getCtrlProperties(arg_CtrlName){with(self.document.forms[0])
{
  v_CtrlName  = arg_CtrlName;
  v_CtrlID    = eval(v_CtrlName+".id");
  v_CtrlType  = eval(v_CtrlName+".type");
  //TEST: alert(v_CtrlName+"  "+v_CtrlID+"  "+v_CtrlType)
  //
  if (v_CtrlType == "select-one")
  {
     v_CtrlValue = eval(v_CtrlName+".options["+v_CtrlName+".options.selectedIndex].value");
     v_CtrlText  = eval(v_CtrlName+".options["+v_CtrlName+".options.selectedIndex].text");
  }
  else if (v_CtrlType == "text")
  {
     v_CtrlValue = eval(v_CtrlName+".value");
  }
  else
  {
      v_CtrlValue = "";
  }
}}
//
function of_Trim(arg_Value)
{
    var v_Temp = arg_Value;
    var obj = /^(\s*)([\W\w]*)(\b\s*$)/;
    if (obj.test(v_Temp)) { v_Temp = v_Temp.replace(obj, ''$2''); }
    var obj = / +/g;
    v_Temp = v_Temp.replace(obj, " ");
    if (v_Temp == " ") { v_Temp = ""; }
    return v_Temp;
}
//---------------------------------------------------
// GENERIC FUNCTIONS ends.
//===================================================
');
htp.p('
//===================================================
// PAGE RELATED FUNCTIONS starts:

//---------------------------------------------------
var RegExPattern_Date = /^(?=\d)(?:(?:(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})|(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))|(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2}))($|\ (?=\d)))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
var v_ValidationPassed = "YES";

var v_Asterisk = "<font color=\"Red\" face=\"Arial, Helvetica, sans-serif\"><strong>*</strong></font>";

//---------------------------------------------------
var v_SearchFirstRec = "_NATIONAL_________________________________";
//---------------------------------------------------
var objAJAX = new ActiveXObject("microsoft.XMLDOM");
    objAJAX.async=false;
var v_ArrayOfRecords = new Array();
var v_ArrayOfValuesInRecord = new Array();
var v_NumberOfRecords = 0;
//--------------------------------------------------
var v_SysdateMinus60 = "";
if (v_SysdateMinus60 == "")
{
    objAJAX.load("NMARS.NM_EQUIP_MODS.sp_getSYSDATEminus60");
    //
    if (objAJAX.parsed)
    {//1
        v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
        v_NumberOfRecords = v_ArrayOfRecords.length;
        //TEST: alert(v_NumberOfRecords);
        //
        for (var r=0; r<v_NumberOfRecords; r++)
        {
            v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
            v_SysdateMinus60 = v_ArrayOfValuesInRecord[0].text;
        }
        //
    }//1
}
//--------------------------------------------------
    var v_Now = new Date();
    var dd = v_Now.getDate();
        if(dd<10){dd=''0''+dd}
    var mm = v_Now.getMonth()+1;//January is 0!
        if(mm<10){mm=''0''+mm}
    var yyyy = v_Now.getFullYear();
    //
    var v_Today_Date = mm+''/''+dd+''/''+yyyy;
    var v_Default_Date = "";
    //
    var v_RequestedValue = "";
    var v_SearchedValue  = "";
//--------------------------------------------------
function set_form_state() {} // This function does not do anything. It is needed to prevent JavaScript error.
//---------------------------------------------------

function f_Exit(arg_CtrlID){ go_home(arg_CtrlID)}
//---------------------------------------------------
');
htp.p('
function f_onChange(arg_CtrlName){with(self.document.forms[0])
{
    switch(arg_CtrlName)//v_CtrlName
    {
        //-------------------------------------------------------------------------------
        case "sel_Acronyms":
              f_selection_In_Multiple_Select("sel_Acronyms");
              f_onChangeAcronyms();
        break;
        //-------------------------------------------------------------------------------
        case "sel_BulletinStatus":
             of_getCtrlProperties("sel_BulletinStatus");

              if (v_CtrlValue == "OPEN_COMPLETED")
              {
                 of_outPut("id_start_date", v_Asterisk);
                 of_outPut("id_due_date", "");
                 of_outPut("id_end_date", "");
                 //
                 v_Default_Date = mm+''/''+dd+''/''+yyyy;
                 of_setSingleValue("pi_s_start_date", "''"+v_SysdateMinus60+"''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_due_date", "''''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_end_date", "''''", "''''", "''''", 0);

              }
              //
              else if (v_CtrlValue == "OPEN")
              {
                 of_outPut("id_start_date", v_Asterisk);
                 of_outPut("id_due_date", "");
                 of_outPut("id_end_date", "");
                 //
                 v_Default_Date = mm+''/''+dd+''/''+yyyy;
                 of_setSingleValue("pi_s_start_date", "''"+v_SysdateMinus60+"''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_due_date", "''''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_end_date", "''''", "''''", "''''", 0);
              }
              //
              else if (v_CtrlValue == "COMPLETED")
              {
                 of_outPut("id_start_date", v_Asterisk);
                 of_outPut("id_due_date", "");
                 of_outPut("id_end_date", v_Asterisk);
                 //
                 v_Default_Date = mm+''/''+dd+''/''+yyyy;
                 of_setSingleValue("pi_s_start_date", "''"+v_SysdateMinus60+"''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_due_date", "''''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_end_date", "''"+v_Today_Date+"''", "''''", "''''", 0);
              }
              //
              else if (v_CtrlValue == "PAST_DUE")
              {
                 of_outPut("id_start_date", v_Asterisk);
                 of_outPut("id_due_date", v_Asterisk);
                 of_outPut("id_end_date", "");
                 //
                 v_Default_Date = mm+''/''+dd+''/''+yyyy;
                 of_setSingleValue("pi_s_start_date", "''"+v_SysdateMinus60+"''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_due_date", "''"+v_Today_Date+"''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_end_date", "''''", "''''", "''''", 0);
              }
              //
              else if (v_CtrlValue == "OPEN_PASTDUE")
              {
                 of_outPut("id_start_date", v_Asterisk);
                 of_outPut("id_due_date", v_Asterisk);
                 of_outPut("id_end_date", "");
                 //
                 v_Default_Date = mm+''/''+dd+''/''+yyyy;
                 of_setSingleValue("pi_s_start_date", "''"+v_SysdateMinus60+"''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_due_date", "''"+v_Today_Date+"''", "''''", "''''", 0);
                 of_setSingleValue("pi_s_end_date", "''''", "''''", "''''", 0);
              }
              //
        break;
        //-------------------------------------------------------------------------------
        case "sel_NADSsearch":
             of_getCtrlProperties(arg_CtrlName);
             //
             if (v_CtrlValue == "NTNL")
             {  v_RequestedValue = v_CtrlValue }
             else
             {
                for (var i=0; i<bfrSearchVal.length; i++)
                {
                    if (v_CtrlValue == bfrSearchVal[i].a_option_value)
                    {
                       v_RequestedValue = v_CtrlValue+"_"+bfrSearchVal[i].a_based_on;
                       break;
                    }
                }
             }
             //
             for (var i=0; i<sel_NADS.options.length; i++)
             {
                 if (v_RequestedValue == sel_NADS.options[i].value)
                 {
                    v_SearchedValue = sel_NADS.options[i].value;
                    break;
                 }
             }
             //
             of_selectRecord("sel_NADS", v_SearchedValue);
             //
        break;
        //-------------------------------------------------------------------------------
    }
}}
//---------------------------------------------------
');
htp.p('
//---------------------------------------------------
function f_onChangeAcronyms(){with(self.document.forms[0])
{
    v_SelectedValue = "";
    //
    of_outPut("id_selectedAconyms", "");
    //
    for (var o=0; o<sel_Acronyms.options.length; o++)
    {
         if (sel_Acronyms.options[o].selected)
         {
            v_SelectedValue += sel_Acronyms.options[o].value+"<br />";
         }
    }
    //
    if (v_SelectedValue == "ALL_ACRONYMS<br />"){v_SelectedValue = "All Acronyms"}
    //
    of_outPut("id_selectedAconyms", v_SelectedValue);
}}
//---------------------------------------------------
');
htp.p('
function f_selection_In_Multiple_Select(arg_CtrlName){with(self.document.forms[0])
{
        var v_Counter = 0;
        //----------------------------------------------------------------------
        for (var i=0; i<eval(arg_CtrlName+".options.length"); i++)
        {
            if ( eval(arg_CtrlName+".options[i].selected") )
            {
                v_Counter++;
            }
        }
        if (v_Counter>1)
        {
            eval(arg_CtrlName+".options[0].selected = false");
        }
        //----------------------------------------------------------------------
}}
');
htp.p('
//---------------------------------------------------
function f_getsetAllAcronyms(){with(self.document.forms[0])
{
//------------------------------------------------------------------------------
// "Line 1" and "Line 2" are needed to "cheat" the code; otherwise MULTIPLE SELECT will not function.
// Probably it is because value of the property of the SELECT box is in conflict with other imbedded functions.
//------------------------------------------------------------------------------
   objAJAX.load("NMARS.NM_EQUIP_MODS.sp_getsetAllAcronyms");
   //
   if (objAJAX.parsed)
   {//1
        v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
        v_NumberOfRecords = v_ArrayOfRecords.length;
        //TEST: alert(v_NumberOfRecords);
        //
        document.getElementById("sel_Acronyms").multiple=false;
        //
        of_setSingleValue("sel_Acronyms","ALL_ACRONYMS","All Acronyms ("+v_NumberOfRecords+" recds.)", "YES", 0)
        //
        for (var r=0; r<v_NumberOfRecords; r++)
        {
            v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
            of_setSingleValue("sel_Acronyms", v_ArrayOfValuesInRecord[0].text, v_ArrayOfValuesInRecord[1].text, "NO", r+1);
        }
        //
        document.getElementById("sel_Acronyms").multiple=true;
   }//1
}}
//----------------------------------------------------
');
htp.p('
function f_onClick(arg_CtrlName){with(self.document.forms[0])
{
     switch(arg_CtrlName)
     {
        case "cb_Submit":
             f_Submit();
        break;
        //
        case "cb_Refresh":
             f_ResetScreen();
        break;
        //
        case "site_menu_button":
             f_Exit(arg_CtrlName);
        break;
        //
        case "cb_NADSsearch":
             f_NADSsearch();
        break;
     }
}}
//---------------------------------------------------------------------------------------
');
htp.p('
//---------------------------------------------------------------------------------------

bfrSearchVal = new Array();

function arraySearchVal(a_option_value, a_option_text, a_based_on)
{
    this.a_option_value = a_option_value;
    this.a_option_text  = a_option_text;
    this.a_based_on     = a_based_on;
}

function f_NADSsearch(){with(self.document.forms[0])
{
     of_getCtrlProperties("txt_NADSsearch");
     //---------------------------------------------

     objAJAX.load("NMARS.NM_EQUIP_MODS.sp_NADSsearch?arg_NADSsearch="+v_CtrlValue);
     //
     bfrSearchVal.length = 0;
     //
     if(objAJAX.parsed)
     {
          v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
          v_NumberOfRecords = v_ArrayOfRecords.length;
          //
          //TEST: alert(v_NumberOfRecords);
          //
          for (var r=0; r<v_NumberOfRecords; r++)
          {
              v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;

              bfrSearchVal[r] = new arraySearchVal( v_ArrayOfValuesInRecord[0].text, //a_option_value
                                                    v_ArrayOfValuesInRecord[1].text, //a_option_text
                                                    v_ArrayOfValuesInRecord[2].text  //a_based_on
                                                  );
          }
     }
     //
     f_outputSearchResults();
     //
}}
//---------------------------------------------------------------------------------------
');
htp.p('
function f_outputSearchResults(){with(self.document.forms[0])
{
    //
    if (bfrSearchVal.length == 0)
    {
       alert("Requested search did not bring any results.\nReview your search criteria.");
       //
       of_setSingleValue("txt_NADSsearch", "''''", "''''", "''''", 0);
       //
       of_setSingleValue("sel_NADSsearch", "NTNL", v_SearchFirstRec, "YES", 0);
       //
       of_selectRecord("sel_NADS", sel_NADS.options[0].value);
       //
       txt_NADSsearch.focus();
    }
    else
    {
       of_setSingleValue("sel_NADSsearch", "NTNL", "Found "+bfrSearchVal.length+" record(s). Select needed one.", "YES", 0);
       for (var i=0; i<bfrSearchVal.length; i++)
       {
           of_setSingleValue("sel_NADSsearch", bfrSearchVal[i].a_option_value,
                                               bfrSearchVal[i].a_based_on+
                                               of_LPad(bfrSearchVal[i].a_option_value, 6, ".")+
                                               "..."+bfrSearchVal[i].a_option_text.substr(0,20),
                                               "NO", i+1);
       }
       sel_NADSsearch.focus();
    }
    //
    of_selectRecord("sel_NADSsearch", sel_NADSsearch.options[0].value);
}}
');
htp.p('
//---------------------------------------------------------------------------------------
function f_Submit(){with(self.document.forms[0])
{
     v_ValidationPassed = "YES";
     //
     v_ValidationPassed = f_Validate();
     //
     if (v_ValidationPassed == "YES")
     {
         f_getHTML_Output();
     }
}}
//---------------------------------------------------------------------------------------
');
htp.p('
//
function f_Validate(){with(self.document.forms[0])
{
    //
    var v_Value_StartDate = pi_s_start_date.value;
    var v_Value_DueDate   = pi_s_due_date.value;
    var v_Value_EndDate   = pi_s_end_date.value;
// TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
//alert(v_Value_StartDate+"|  |"+v_Value_DueDate+"|  |"+v_Value_EndDate)
//TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
    //
    var v_Msg = "";
    var v_CtrlName = "";
    //
    //The following 12 lines convert "Issue Date", "Due Date", and "Close Date"
    //into integer (miliseconds). It is done for easier comparison of entered values
    //
    var v_dtStart = parseInt(v_Value_StartDate.substr(v_Value_StartDate.indexOf("/",0)+1,v_Value_StartDate.lastIndexOf("/")),10);
    var v_monStart = parseInt(v_Value_StartDate.substr(0,v_Value_StartDate.indexOf("/",0)),10) - 1;
    var v_yrStart  = parseInt(v_Value_StartDate.substr(v_Value_StartDate.lastIndexOf("/")+1),10);
    var v_dateStart_Millsec = new Date(v_yrStart, v_monStart, v_dtStart ).getTime();

    var v_dtDue  = parseInt(v_Value_DueDate.substr(v_Value_DueDate.indexOf("/",0)+1,v_Value_DueDate.lastIndexOf("/")),10);
    var v_monDue = parseInt(v_Value_DueDate.substr(0,v_Value_DueDate.indexOf("/",0)),10) - 1;
    var v_yrDue  = parseInt(v_Value_DueDate.substr(v_Value_DueDate.lastIndexOf("/")+1),10);
    var v_dateDue_Millsec = new Date(v_yrDue, v_monDue, v_dtDue).getTime();

    var v_dtEnd = parseInt(v_Value_EndDate.substr(v_Value_EndDate.indexOf("/",0)+1,v_Value_EndDate.lastIndexOf("/")),10);
    var v_monEnd  = parseInt(v_Value_EndDate.substr(0,v_Value_EndDate.indexOf("/",0)),10) - 1;
    var v_yrEnd  = parseInt(v_Value_EndDate.substr(v_Value_EndDate.lastIndexOf("/")+1),10);
    var v_dateEnd_Millsec = new Date(v_yrEnd, v_monEnd, v_dtEnd).getTime();

// TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
// IMPORTANT TEST VERIFICATION:
// To see an actual entered date, not in miliseconds use the following:
//   v_dateStart_Millsec = new Date(v_yrStart, v_monStart, v_dtStart);
// ignoring function ".getTime()"
//
//alert(v_dtStart+"  "+v_monStart+"  "+v_yrStart+"   "+v_dateStart_Millsec+"\n"+
//      v_dtDue+"  "  +v_monDue+"  "  +v_yrDue+"   "  +v_dateDue_Millsec+  "\n"+
//      v_dtEnd+"  "  +v_monEnd+"  "  +v_yrEnd+"   "  +v_dateEnd_Millsec)
//TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT

    //
    var v_BulletinStatus = sel_BulletinStatus.options[sel_BulletinStatus.options.selectedIndex].value;
    //
    var RegExPattern_Date = /^(?=\d)(?:(?:(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})|(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))|(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2}))($|\ (?=\d)))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
    //
// TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
//    alert(v_BulletinStatus+"\n"+v_dateStart_Millsec+"\n"+v_dateDue_Millsec+"\n"+v_dateEnd_Millsec);
//TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
    //-----------------------------------------------------------------------------------
    // 1. "OPEN_COMPLETED"
    // Validate data presence and format:
    if ( v_ValidationPassed == "YES"
         &&
         v_BulletinStatus == "OPEN_COMPLETED"
         &&
         v_Value_StartDate.match(RegExPattern_Date) == null)
    {
            v_ValidationPassed = "NO";
          v_Msg = "Sorry, field ''Start Date'' has not passed validation rule."+
                  "\n\nValidation rule: Value is required and it must have the following format: MM/DD/YYYY."
          v_CtrlName = "pi_s_start_date";
    }
    //-----------------------------------------------------------------------------------
    else if ( v_ValidationPassed == "YES"
         &&
         v_BulletinStatus == "OPEN"
         &&
         v_Value_StartDate.match(RegExPattern_Date) == null)
    {
            v_ValidationPassed = "NO";
          v_Msg = "Sorry, field ''Start Date'' has not passed validation rule."+
                  "\n\nValidation rule: Value is required and it must have the following format: MM/DD/YYYY."
          v_CtrlName = "pi_s_start_date";
    }
    //-----------------------------------------------------------------------------------
    else if ( v_ValidationPassed == "YES"
         &&
         v_BulletinStatus == "COMPLETED"
         &&
         v_Value_StartDate.match(RegExPattern_Date) == null)
    {
            v_ValidationPassed = "NO";
          v_Msg = "Sorry, field ''Start Date'' has not passed validation rule."+
                  "\n\nValidation rule: Value is required and it must have the following format: MM/DD/YYYY."
          v_CtrlName = "pi_s_start_date";
    }
    //-----------------------------------------------------------------------------------
    else if ( v_ValidationPassed == "YES"
         &&
         v_BulletinStatus == "COMPLETED"
         &&
         v_Value_EndDate.match(RegExPattern_Date) == null)
    {
            v_ValidationPassed = "NO";
          v_Msg = "Sorry, field ''Completed Date'' has not passed validation rule."+
                  "\n\nValidation rule: Value is required and it must have the following format: MM/DD/YYYY."
          v_CtrlName = "pi_s_end_date";
    }
    //-----------------------------------------------------------------------------------
    else if ( v_ValidationPassed == "YES"
         &&
         v_BulletinStatus == "COMPLETED"
         &&
         (v_dateStart_Millsec - v_dateEnd_Millsec) > 0 )
    {
          v_ValidationPassed = "NO";
          v_Msg = "Sorry, fields ''Issue Date'' and ''Completed Date'' have not passed validation rule."+
                  "\n\nValidation rule: ''Issue Date'' must precedes ''End Date''."
          v_CtrlName = "pi_s_end_date";
    }
    //-----------------------------------------------------------------------------------
    else if ( v_ValidationPassed == "YES"
         &&
         v_BulletinStatus == "PAST_DUE"
         &&
         v_Value_StartDate.match(RegExPattern_Date) == null)
    {
            v_ValidationPassed = "NO";
          v_Msg = "Sorry, field ''Start Date'' has not passed validation rule."+
                  "\n\nValidation rule: Value is required and it must have the following format: MM/DD/YYYY."
          v_CtrlName = "pi_s_end_date";
    }
    //-----------------------------------------------------------------------------------
    else if ( v_ValidationPassed == "YES"
         &&
         v_BulletinStatus == "PAST_DUE"
         &&
         v_Value_DueDate.match(RegExPattern_Date) == null)
    {
            v_ValidationPassed = "NO";
          v_Msg = "Sorry, field ''Due Date'' has not passed validation rule."+
                  "\n\nValidation rule: Value is required and it must have the following format: MM/DD/YYYY."
          v_CtrlName = "pi_s_due_date";
    }
    //-----------------------------------------------------------------------------------
    else if ( v_ValidationPassed == "YES"
         &&
         v_BulletinStatus == "PAST_DUE"
         &&
         (v_dateStart_Millsec - v_dateDue_Millsec) > 0 )
    {
          v_ValidationPassed = "NO";
          v_Msg = "Sorry, fields ''Issue Date'' and ''Due Date'' have not passed validation rule."+
                  "\n\nValidation rule: ''Issue Date'' must precedes ''Due Date''."
          v_CtrlName = "pi_s_due_date";
    }
    //-----------------------------------------------------------------------------------

     if (v_ValidationPassed == "NO")
     {
       alert(v_Msg);
       eval(v_CtrlName+".focus()");
     }
     //----------------------------------------------------------------------------------
     return v_ValidationPassed;
    //---------------------------------------------------------------------

}}
');
htp.p('
function f_getHTML_Output(){with(self.document.forms[0])
{

    //
    var v_CtrlVal = sel_NADS.options[sel_NADS.options.selectedIndex].value;
    var v_NADS_value = "";
    var v_NADS_Scope = "";
        for (i=0; i<bfrNADS.length; i++)
        {
            if (bfrNADS[i].a_option_value == v_CtrlVal)
            {
               if (v_CtrlVal.indexOf("_") == -1)
               {
                  v_NADS_value = bfrNADS[i].a_option_value; // applies to "NTNL" only
               }
               else
               {
                   v_NADS_value = bfrNADS[i].a_option_value.substr(0,v_CtrlVal.indexOf("_"));
               }
               //
               v_NADS_Scope = bfrNADS[i].a_based_on;
               //
               break;
            }
        }
    //

    var v_IssueDate      = pi_s_start_date.value;
    var v_DueDate        = pi_s_due_date.value;
    var v_CloseDate      = pi_s_end_date.value;
    var v_BulletinStatus = sel_BulletinStatus.options[sel_BulletinStatus.options.selectedIndex].value;
    var v_BulletinType   = sel_Bulletins.options[sel_Bulletins.options.selectedIndex].value;
    var v_BulletinNum_3  = txt_BulletinNum_3.value;
    var v_BulletinNum_2  = txt_BulletinNum_2.value;
    var v_ListOfAcronyms = "";
        for (var o=0; o<sel_Acronyms.options.length; o++)
        {
            if (sel_Acronyms.options[o].selected)
            {
               v_ListOfAcronyms += sel_Acronyms.options[o].value+",";
            }
        }
        v_ListOfAcronyms = v_ListOfAcronyms.substr(0,v_ListOfAcronyms.length-1);
    //

/*
// TEST: TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
//    alert("NMARS.NM_EQUIP_MODS.sp_getHTML_Output?arg_NADS_value="+v_NADS_value+
//                                             "\n&arg_NADS_Scope="+v_NADS_Scope+
//                                             "\n&arg_IssueDate="+v_IssueDate+
//                                             "\n&arg_DueDate="+v_DueDate+
//                                            "\n&arg_CloseDate="+v_CloseDate+
//                                             "\n&arg_BulletinStatus="+v_BulletinStatus+
//                                             "\n&arg_BulletinType="+v_BulletinType+
//                                             "\n&arg_BulletinNum_3="+v_BulletinNum_3+
//                                             "\n&arg_BulletinNum_2="+v_BulletinNum_2+
//                                             "\n&arg_ListOfAcronyms="+v_ListOfAcronyms);
//TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
*/
open_wdw("NMARS.NM_EQUIP_MODS.sp_getHTML_Output?aV="+v_NADS_value+
                                               "&aSp="+v_NADS_Scope+
                                               "&aIDt="+v_IssueDate+
                                               "&aDDt="+v_DueDate+
                                               "&aCDt="+v_CloseDate+
                                               "&aBSt="+v_BulletinStatus+
                                               "&aBT="+v_BulletinType+
                                               "&aB3="+v_BulletinNum_3+
                                               "&aB2="+v_BulletinNum_2+
                                               "&aLA="+v_ListOfAcronyms);

}}
');
htp.p('
function f_ResetScreen(){with(self.document.forms[0])
{
    //-------------------------------------------------
    of_setSingleValue("txt_NADSsearch", "''''", "''''", "''''", 0);
    //
    of_setSingleValue("sel_NADSsearch", "NTNL", v_SearchFirstRec, "YES", 0)
    of_selectRecord("sel_NADSsearch", sel_NADSsearch.options[0].value);
    //
    of_selectRecord("sel_NADS", sel_NADS.options[0].value);
    //
    of_selectRecord("sel_BulletinStatus", sel_BulletinStatus.options[0].value);
    //
    for (var i=0; i<sel_Bulletins.options.length; i++){ sel_Bulletins.options[i].selected = false; }
    of_selectRecord("sel_Bulletins", sel_Bulletins.options[0].value);
    //
    of_setSingleValue("txt_BulletinNum_3", "''''", "''''", "''''", 0);
    //
    of_setSingleValue("txt_BulletinNum_2", "''''", "''''", "''''", 0);
    //
    f_getsetAllAcronyms();
    for (var i=0; i<sel_Acronyms.options.length; i++){ sel_Acronyms.options[i].selected = false; }
    of_selectRecord("sel_Acronyms", sel_Acronyms.options[0].value);
    f_onChangeAcronyms();
    //
    f_onChange("sel_BulletinStatus");
    //
}}
//---------------------------------------------------
// RETRIVE AND OUTPUT A LIST OF AREAS, DISTRICTS, SITES starts:
');
htp.p('

bfrNADS = new Array();

function arrayNADS(a_parent_id, a_option_value, a_output_text, a_based_on, a_option_level, a_option_text)
{
    this.a_parent_id    = a_parent_id;
    this.a_option_value = a_option_value;
    this.a_output_text  = a_output_text;
    this.a_based_on     = a_based_on;
    this.a_option_level = a_option_level;
    this.a_option_text  = a_option_text;
}

function f_getNADS(){with(self.document.forms[0])
{
    objAJAX.load("NMARS.NM_EQUIP_MODS.sp_getNADS");
    //
    if (objAJAX.parsed)
    {//1.2
          v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
          v_NumberOfRecords = v_ArrayOfRecords.length;
          //TEST: alert(v_NumberOfRecords);
          for (var r=0; r<v_NumberOfRecords; r++)
          {//1.2.1
            v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
            //alert(v_ArrayOfValuesInRecord[2].text)
            bfrNADS[r] = new arrayNADS( v_ArrayOfValuesInRecord[0].text, //a_parent_id
                                        v_ArrayOfValuesInRecord[1].text, //a_option_value
                                        v_ArrayOfValuesInRecord[2].text, //a_output_text
                                        v_ArrayOfValuesInRecord[3].text, //a_based_on
                                        v_ArrayOfValuesInRecord[4].text, //a_option_level
                                        v_ArrayOfValuesInRecord[5].text  //a_option_text
                                      );
          }//1.2.1

    }//1.2
    //
    f_setNADS();
    //
}}
');
htp.p('
function f_setNADS()
{
    for (var i=0; i<bfrNADS.length; i++)
    {
        of_setSingleValue("sel_NADS", bfrNADS[i].a_option_value, bfrNADS[i].a_output_text, "NO", i)
    }
}
');
htp.p('
// RETRIVE AND OUTPUT A LIST OF AREAS, DISTRICTS, SITES ends.
//---------------------------------------------------

function f_text_onKeyup(arg_CtrlName, arg_Next_CtrlName) {with(self.document.forms[0])
{
            var vValue = eval(arg_CtrlName+".value");

            if ( isNaN(vValue) == true)
            {
                 if (vValue.length == 1){eval(arg_CtrlName+".value = ''''");}
                 else if (vValue.length > 1)
                 {
                   vValue = vValue.substr(0, (parseInt(vValue.length) - 1));
                   eval(arg_CtrlName+".value = "+vValue);
                 }
                 alert("Sorry, this field accepts only numeric values.");
            }

            else if (isNaN(vValue) == false && vValue.length == 3)
            {
                  eval(arg_Next_CtrlName+".focus();");
            }
         }// end of with()
}         //  end of function f_text_onKeyup
//---------------------------------------------------
');
htp.p('
function f_isValueValid(arg_CtrlName){with(self.document.forms[0])
{
     var vValue = eval(arg_CtrlName+".value");
     if ( isNaN(vValue) == true)
     {
         if (vValue.length == 1){eval(arg_CtrlName+".value = ''''");}
         else if (vValue.length > 1)
         {
           vValue = vValue.substr(0, (parseInt(vValue.length) - 1));
           eval(arg_CtrlName+".value = "+vValue);
         }
         alert("Sorry, this field accepts only numeric values.");
     }
}}
//---------------------------------------------------
// PAGE RELATED FUNCTIONS ends.
//===================================================
');

htp.p('
</script>
</head>
<body onload="set_form_state();">
<FORM name="form1" action="" method="POST">
<DIV class="MenuHead">Modification Tracking</DIV>
<DIV id="id_divPage" class="SHOW_SITE">

<table width="95%" border="0" cellspacing="2" cellpadding="2">
   <tr><!--- 1 --->
     <td valign="top"><!--- 2 --->
         <input type="text"
                name="txt_NADSsearch"
                id="txt_NADSsearch"
                size="20" />
         <input type="button"
                name="cb_NADSsearch"
                id="cb_NADSsearch"
                value="Area / Distr / Site Search"
                onclick="f_onClick(this.name);" />
         <br />
         <strong>
         Search results:
         <br />
         <select name="sel_NADSsearch"
                 id="sel_NADSsearch"
                 onchange="f_onChange(this.name);"
                 size="4"
                 tabindex="2"
                 style="font-family:''Courier New'', Courier, monospace;">
            <option value="NTNL">_NATIONAL_________________________________</option>
         </select>
         <br /><br />
         <strong>
         Hierarchical view of
         <br />
         a
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         Areas,
         <br />
         d
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         Districts</strong>, and
         <br />
         <strong>
         s
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         Sites</strong> with their IDs for the references:
         <br />
         <select name="sel_NADS"
                 onchange="f_onChange(this.name);"
                 size="26"
                 tabindex="1"
                 style="font-family:''Courier New'', Courier, monospace;">
            <option value="NTNL">NATIONAL</option>
         </select>
     </td><!--- 2 --->
     <td valign="top"><!--- 3 --->
');

htp.p('
                    <table width="100%" border="0" cellspacing="2" cellpadding="2">
                            <tr>
                                    <td width="40%"><font face="Arial, Helvetica, sans-serif"><strong>Bulletin Status</strong></font></td>
                                    <td width="15%">&nbsp;</td>
                            <td width="45%">&nbsp;</td>
                            </tr>
                            <tr>
                                    <td valign="top" rowspan="4">
                                        <select name="sel_BulletinStatus"
                                                onchange="f_onChange(this.name);"
                                                size="4"
                                                tabindex="70"
                                                style="font-family:''Courier New'', Courier, monospace;">
                                        <!---<option value="OPEN">Open</option>--->
                                        <option value="OPEN_PASTDUE">Open</option>
                                        <option value="COMPLETED">Completed</option>
                                        <option value="PAST_DUE">Past Due</option>
                                        <!---<option value="OPEN_PASTDUE">Open, Past Due</option>--->
                                        <option value="OPEN_COMPLETED">Open, Completed, Past Due</option>
                                        </select>
                                    </td>
                            </tr>
                            <tr>
                                    <td>
                                        <font face="Arial, Helvetica, sans-serif">
                                        <strong>Issue Date</strong>
                                        </font>
                                        <span id="id_start_date"></span>
                            </td>
                                    <td>
                                        <INPUT TYPE="text"
                                               size="15" maxlength="10"
                                               name="pi_s_start_date"
                                               id="pi_s_start_date"
                                               tabindex="10"
                                               alt="enter the begin date of a date range"
                                               style="font-family:''Courier New'', Courier, monospace; margin-bottom:5px;"/>
                                             <a href="javascript:show_calendar(''form1.pi_s_start_date'');"
                                                      onmouseover="window.status=''Date Picker'';return true;"
                                                      onmouseout="window.status='''';return true;">
                                              <img src="/emars-img/calendar.jpg"
                                                   width=24
                                                   height=22
                                                   border=0
                                                   tabindex="20"
                                                   alt="click here to select the begin date of a date range">
                                                   </a>
                                    </td>

                            </tr>
                            <tr>
                                    <td>
                                        <font face="Arial, Helvetica, sans-serif">
                                        <strong>Due Date</strong>
                                        </font>
                              <span id="id_due_date"></span>
                                    </td>
                                    <td><INPUT TYPE="text"
                                             size="15" maxlength="10"
                                             name="pi_s_due_date"
                                             id="pi_s_due_date"
                                             tabindex="30"
                                             alt="enter the end date of a date range"
                                             style="font-family:''Courier New'', Courier, monospace; margin-bottom:5px;"/>
                                            <a href="javascript:show_calendar(''form1.pi_s_due_date'');"
                                                     onmouseover="window.status=''Date Picker'';return true;"
                                                     onmouseout="window.status='''';return true;">
                                            <img src="/emars-img/calendar.jpg"
                                                             width=24
                                                               height=22
                                                               border=0
                                                               tabindex="40"
                                                               alt="click here to select the end date of a date range">
                                           </a>
                                    </td>
                            </tr>
                            <tr>
                                    <td>
                                        <font face="Arial, Helvetica, sans-serif">
                                        <strong>Completed Date</strong>
                                        </font>
                              <span id="id_end_date"></span>
                                    </td>
                                    <td><INPUT TYPE="text"
                                             size="15" maxlength="10"
                                             name="pi_s_end_date"
                                             id="pi_s_end_date"
                                             tabindex="50"
                                             alt="enter the end date of a date range"
                                             style="font-family:''Courier New'', Courier, monospace; margin-bottom:5px;"/>
                                              <a href="javascript:show_calendar(''form1.pi_s_end_date'');"
                                                 onmouseover="window.status=''Date Picker'';return true;"
                                                   onmouseout="window.status='''';return true;">
                                              <img src="/emars-img/calendar.jpg"
                                                               width=24
                                                                 height=22
                                                                 border=0
                                                                 tabindex="60"
                                                                 alt="click here to select the end date of a date range">
                                              </a>
                                    </td>
                            </tr>
                    </table>
');

/*htp.p('
          <br />
');*/
htp.p('
              <table width="100%" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                        <td width="36%">
                       <font face="Arial, Helvetica, sans-serif"><strong>List of Bulletin Types</strong></font>
                    </td>
                        <td width="14%" colspan="5">
                        <font face="Arial, Helvetica, sans-serif"><strong>
                        Bulletin Num.
                        </strong></font>
                    </td>

                    <td width="23%">
                        <font face="Arial, Helvetica, sans-serif"><strong>List of Acronyms</strong></font>
                        <font color="Red" face="Arial, Helvetica, sans-serif"><strong>&aelig;</strong></font>
                    </td>
                    <td width="23%"><font face="Arial, Helvetica, sans-serif"><strong>Selected Acronym(s):</strong></font></td>
                    </tr>
                    <tr>
                            <td valign="top">
                                <select name="sel_Bulletins"
                                        onchange=""
                                        tabindex="80"
                                        size="5"
                                        style="font-family:''Courier New'', Courier, monospace;">
                                      <option value="MMO,MSB,MWO,SMO">(MMO,MSB,MWO,SMO)&nbsp;.....All Bulletins</option>
                                      <option value="MMO">(MMO)&nbsp;..Maintenance Management Order</option>
                                      <option value="MSB">(MSB)&nbsp;..Maintenance Service Bulletin</option>
                                      <option value="MWO">(MWO)&nbsp;.......Modification Work Order</option>
                                      <option value="SMO">(SMO)&nbsp;...Software Modification Order</option>
                                </select>
                        <br /><br />
                          <strong>Notes:</strong>
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <strong>MM/DD/YYYY</strong> - required date format.
                          <br /><br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <strong>Bulletin Status definitions:</strong>
                          <br />

                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <strong>Open, Completed, Past Due</strong> - All records
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          starting from ''Issue Date'';
                          <br />

                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <strong>Open</strong> - All records without ''Completed Date'', and
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          Current Date neither reached, nor surpassed
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          by ''Due Date''.
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <strong>Completed</strong> - All records where ''Completed Date''
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          is present.

                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <strong>Past Due</strong> - All records without ''Completed Date'',
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          and ''Due Date'' reached, or surpassed by
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          Current Date.

                          <br /> <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <strong><font color="Red" face="Arial, Helvetica, sans-serif">*</font></strong>
                          Mandatory field selection
                          <br /><br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <strong><font color="Red" face="Arial, Helvetica, sans-serif">&aelig;</font></strong>
                          Multiple record selection is supported.<br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          Use the "Shift" key with the mouse to select<br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          a range of items or the "Ctrl" key to select<br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          multiple items, clicking one after the other.
                          <br /><br />
                      </td>
                      <td valign="top">-</td>
                      <td valign="top">
                          <input name="txt_BulletinNum_3"
                                 type="text"
                                 size="3"
                                 tabindex="80"
                                 maxlength="3"
                                 onkeyup="f_text_onKeyup(this.name, ''txt_BulletinNum_2'');"
                                 style="font-family:''Courier New'', Courier, monospace;"/>
                      </td>
                      <td valign="top">-</td>
                      <td valign="top">
                          <input name="txt_BulletinNum_2"
                                 type="text"
                                 size="2"
                                 tabindex="90"
                                 maxlength="2"
                                 onkeyup="f_isValueValid(this.name);"
                                 style="font-family:''Courier New'', Courier, monospace;"/>
                      </td>
                      <td>&nbsp;</td>
                      <td valign="top"><!--- multiple="multiple" --->
                          <select name="sel_Acronyms"
                                        onchange="f_onChange(this.name);"
                          tabindex="100"
                                      size="25"
                                      style="font-family:''Courier New'', Courier, monospace;">
                              <option value="ALL_ACRONYMS">== All Acronyms ==</option>
                          </select>
                      </td>
                      <td valign="top"><div id="id_selectedAconyms">&nbsp;</div>
                      </td>
                    </tr>
              </table>
');
htp.p('
          <br />
');
htp.p('
              <center>
                <table width="40%" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                            <td align="center"><input name="cb_Submit"
                                                onclick="f_onClick(this.name);"
                                                type="button"
                                                tabindex="110"
                                                value="Submit"/></td>
                            <td align="center"><input name="cb_Refresh"
                                                onclick="f_onClick(this.name);"
                                                type="button"
                                                tabindex="120"
                                                value="Reset"/></td>
                            <td align="center"><input name="site_menu_button"
                                                id="site_menu_button"
                                                onclick="f_onClick(this.name);"
                                                type="button"
                                                tabindex="130"
                                                value="Main Menu"/></td>
                    </tr>
              </table>
              </center>
    </td><!--- 3 --->
  </tr><!--- 1 --->
</table>
</DIV> <!--- end of id_divPage --->
</FORM>
</body>
');
htp.p('
<script language="javascript" type="text/javascript">
//--------------------------------------------------
// CALENDAR CODE begins:
    var weekend = [0,6];
    var weekendColor = "#e0e0e0";
    var fontface = "Verdana";
    var fontsize = 2;

    var gNow = new Date();
    var ggWinCal;
    isNav = (navigator.appName.indexOf("Netscape") != -1) ? true : false;
    isIE = (navigator.appName.indexOf("Microsoft") != -1) ? true : false;

    Calendar.Months = ["January", "February", "March", "April", "May", "June",
                       "July", "August", "September", "October", "November", "December"];

    // Non-Leap year Month days..
    Calendar.DOMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    // Leap year Month days..
    Calendar.lDOMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    function Calendar(p_item, p_WinCal, p_month, p_year, p_format) {
     if ((p_month == null) && (p_year == null))      return;

     if (p_WinCal == null)
             this.gWinCal = ggWinCal;
     else
             this.gWinCal = p_WinCal;

     if (p_month == null) {
             this.gMonthName = null;
             this.gMonth = null;
             this.gYearly = true;
     } else {
             this.gMonthName = Calendar.get_month(p_month);
             this.gMonth = new Number(p_month);
             this.gYearly = false;
     }

     this.gYear = p_year;
     this.gFormat = p_format;
     this.gBGColor = "white";
     this.gFGColor = "black";
     this.gTextColor = "black";
     this.gHeaderColor = "black";
     this.gReturnItem = p_item;
    }

    Calendar.get_month = Calendar_get_month;
    Calendar.get_daysofmonth = Calendar_get_daysofmonth;
    Calendar.calc_month_year = Calendar_calc_month_year;
    Calendar.print = Calendar_print;

    function Calendar_get_month(monthNo) {
     return Calendar.Months[monthNo];
    }

    function Calendar_get_daysofmonth(monthNo, p_year) {
     /*
     Check for leap year ..
     1.Years evenly divisible by four are normally leap years, except for...
     2.Years also evenly divisible by 100 are not leap years, except for...
     3.Years also evenly divisible by 400 are leap years.
     */
     if ((p_year % 4) == 0) {
             if ((p_year % 100) == 0 && (p_year % 400) != 0)
                     return Calendar.DOMonth[monthNo];

             return Calendar.lDOMonth[monthNo];
     } else
             return Calendar.DOMonth[monthNo];
    }

    function Calendar_calc_month_year(p_Month, p_Year, incr) {
     /*
     Will return an 1-D array with 1st element being the calculated month
     and second being the calculated year
     after applying the month increment/decrement as specified by ''incr'' parameter.
     ''incr'' will normally have 1/-1 to navigate thru the months.
     */
     var ret_arr = new Array();

     if (incr == -1) {
             // B A C K W A R D
             if (p_Month == 0) {
                     ret_arr[0] = 11;
                     ret_arr[1] = parseInt(p_Year) - 1;
             }
             else {
                     ret_arr[0] = parseInt(p_Month) - 1;
                     ret_arr[1] = parseInt(p_Year);
             }
     } else if (incr == 1) {
             // F O R W A R D
             if (p_Month == 11) {
                     ret_arr[0] = 0;
                     ret_arr[1] = parseInt(p_Year) + 1;
             }
             else {
                     ret_arr[0] = parseInt(p_Month) + 1;
                     ret_arr[1] = parseInt(p_Year);
             }
     }

     return ret_arr;
    }

    function Calendar_print() {
     ggWinCal.print();
    }

    function Calendar_calc_month_year(p_Month, p_Year, incr) {
     /*
     Will return an 1-D array with 1st element being the calculated month
     and second being the calculated year
     after applying the month increment/decrement as specified by ''incr'' parameter.
     ''incr'' will normally have 1/-1 to navigate thru the months.
     */
     var ret_arr = new Array();

     if (incr == -1) {
             // B A C K W A R D
             if (p_Month == 0) {
                     ret_arr[0] = 11;
                     ret_arr[1] = parseInt(p_Year) - 1;
             }
             else {
                     ret_arr[0] = parseInt(p_Month) - 1;
                     ret_arr[1] = parseInt(p_Year);
             }
     } else if (incr == 1) {
             // F O R W A R D
             if (p_Month == 11) {
                     ret_arr[0] = 0;
                     ret_arr[1] = parseInt(p_Year) + 1;
             }
             else {
                     ret_arr[0] = parseInt(p_Month) + 1;
                     ret_arr[1] = parseInt(p_Year);
             }
     }

     return ret_arr;
    }

    // This is for compatibility with Navigator 3, we have to create and discard one object before the prototype object exists.
    new Calendar();

    Calendar.prototype.getMonthlyCalendarCode = function() {
     var vCode = "";
     var vHeader_Code = "";
     var vData_Code = "";

     // Begin Table Drawing code here..
     vCode = vCode + "<TABLE BORDER=1 BGCOLOR=\"" + this.gBGColor + "\">";

     vHeader_Code = this.cal_header();
     vData_Code = this.cal_data();
     vCode = vCode + vHeader_Code + vData_Code;

     vCode = vCode + "</TABLE>";

     return vCode;
    }

    Calendar.prototype.show = function() {
     var vCode = "";

     this.gWinCal.document.open();

     // Setup the page...
     this.wwrite("<html>");
     this.wwrite("<head><title>Calendar</title>");
     this.wwrite("</head>");

     this.wwrite("<body " +
             "link=\"" + this.gLinkColor + "\" " +
             "vlink=\"" + this.gLinkColor + "\" " +
             "alink=\"" + this.gLinkColor + "\" " +
             "text=\"" + this.gTextColor + "\">");
     this.wwriteA("<FONT FACE=''" + fontface + "'' SIZE=2><B>");
     this.wwriteA(this.gMonthName + " " + this.gYear);
     this.wwriteA("</B><BR>");

     // Show navigation buttons
     var prevMMYYYY = Calendar.calc_month_year(this.gMonth, this.gYear, -1);
     var prevMM = prevMMYYYY[0];
     var prevYYYY = prevMMYYYY[1];

     var nextMMYYYY = Calendar.calc_month_year(this.gMonth, this.gYear, 1);
     var nextMM = nextMMYYYY[0];
     var nextYYYY = nextMMYYYY[1];

     this.wwrite("<TABLE WIDTH=''100%'' BORDER=1 CELLSPACING=0 CELLPADDING=0 BGCOLOR=''#e0e0e0''><TR><TD ALIGN=center>");
     this.wwrite("[<A HREF=\"" +
             "javascript:window.opener.Build(" +
             "''" + this.gReturnItem + "'', ''" + this.gMonth + "'', ''" + (parseInt(this.gYear)-1) + "'', ''" + this.gFormat + "''" +
             ");" +
             "\"><<<\/A>]</TD><TD ALIGN=center>");
     this.wwrite("[<A HREF=\"" +
             "javascript:window.opener.Build(" +
             "''" + this.gReturnItem + "'', ''" + prevMM + "'', ''" + prevYYYY + "'', ''" + this.gFormat + "''" +
             ");" +
             "\"><<\/A>]</TD><TD ALIGN=center>");
     this.wwrite("[<A HREF=\"javascript:window.print();\">Print</A>]</TD><TD ALIGN=center>");
     this.wwrite("[<A HREF=\"" +
             "javascript:window.opener.Build(" +
             "''" + this.gReturnItem + "'', ''" + nextMM + "'', ''" + nextYYYY + "'', ''" + this.gFormat + "''" +
             ");" +
             "\">><\/A>]</TD><TD ALIGN=center>");
     this.wwrite("[<A HREF=\"" +
             "javascript:window.opener.Build(" +
             "''" + this.gReturnItem + "'', ''" + this.gMonth + "'', ''" + (parseInt(this.gYear)+1) + "'', ''" + this.gFormat + "''" +
             ");" +
             "\">>><\/A>]</TD></TR></TABLE><BR>");

     // Get the complete calendar code for the month..
     vCode = this.getMonthlyCalendarCode();
     this.wwrite(vCode);

     this.wwrite("</font></body></html>");
     this.gWinCal.document.close();
    }

    Calendar.prototype.showY = function() {
     var vCode = "";
     var i;
     var vr, vc, vx, vy;             // Row, Column, X-coord, Y-coord
     var vxf = 285;                  // X-Factor
     var vyf = 200;                  // Y-Factor
     var vxm = 10;                   // X-margin
     var vym;                                // Y-margin
     if (isIE)       vym = 75;
     else if (isNav) vym = 25;

     this.gWinCal.document.open();

     this.wwrite("<html>");
     this.wwrite("<head><title>Calendar</title>");
     this.wwrite("<style type=''text/css''>\n<!--");
     for (i=0; i<12; i++) {
             vc = i % 3;
             if (i>=0 && i<= 2)      vr = 0;
             if (i>=3 && i<= 5)      vr = 1;
             if (i>=6 && i<= 8)      vr = 2;
             if (i>=9 && i<= 11)     vr = 3;

             vx = parseInt(vxf * vc) + vxm;
             vy = parseInt(vyf * vr) + vym;

             this.wwrite(".lclass" + i + " {position:absolute;top:" + vy + ";left:" + vx + ";}");
     }
     this.wwrite("-->\n</style>");
     this.wwrite("</head>");

     this.wwrite("<body " +
             "link=\"" + this.gLinkColor + "\" " +
             "vlink=\"" + this.gLinkColor + "\" " +
             "alink=\"" + this.gLinkColor + "\" " +
             "text=\"" + this.gTextColor + "\">");
     this.wwrite("<FONT FACE=''" + fontface + "'' SIZE=2><B>");
     this.wwrite("Year : " + this.gYear);
     this.wwrite("</B><BR>");

     // Show navigation buttons
     var prevYYYY = parseInt(this.gYear) - 1;
     var nextYYYY = parseInt(this.gYear) + 1;

     this.wwrite("<TABLE WIDTH=''100%'' BORDER=1 CELLSPACING=0 CELLPADDING=0 BGCOLOR=''#e0e0e0''><TR><TD ALIGN=center>");
     this.wwrite("[<A HREF=\"" +
             "javascript:window.opener.Build(" +
             "''" + this.gReturnItem + "'', null, ''" + prevYYYY + "'', ''" + this.gFormat + "''" +
             ");" +
             "\" alt=''Prev Year''><<<\/A>]</TD><TD ALIGN=center>");
     this.wwrite("[<A HREF=\"javascript:window.print();\">Print</A>]</TD><TD ALIGN=center>");
     this.wwrite("[<A HREF=\"" +
             "javascript:window.opener.Build(" +
             "''" + this.gReturnItem + "'', null, ''" + nextYYYY + "'', ''" + this.gFormat + "''" +
             ");" +
             "\">>><\/A>]</TD></TR></TABLE><BR>");

     // Get the complete calendar code for each month..
     var j;
     for (i=11; i>=0; i--) {
             if (isIE)
                     this.wwrite("<DIV ID=\"layer" + i + "\" CLASS=\"lclass" + i + "\">");
             else if (isNav)
                     this.wwrite("<LAYER ID=\"layer" + i + "\" CLASS=\"lclass" + i + "\">");

             this.gMonth = i;
             this.gMonthName = Calendar.get_month(this.gMonth);
             vCode = this.getMonthlyCalendarCode();
             this.wwrite(this.gMonthName + "/" + this.gYear + "<BR>");
             this.wwrite(vCode);

             if (isIE)
                     this.wwrite("</DIV>");
             else if (isNav)
                     this.wwrite("</LAYER>");
     }

     this.wwrite("</font><BR></body></html>");
     this.gWinCal.document.close();
    }

    Calendar.prototype.wwrite = function(wtext) {
     this.gWinCal.document.writeln(wtext);
    }

    Calendar.prototype.wwriteA = function(wtext) {
     this.gWinCal.document.write(wtext);
    }

    Calendar.prototype.cal_header = function() {
     var vCode = "";

     vCode = vCode + "<TR>";
     vCode = vCode + "<TD WIDTH=''14%''><FONT SIZE=''2'' FACE=''" + fontface + "'' COLOR=''" + this.gHeaderColor + "''><B>Sun</B></FONT></TD>";
     vCode = vCode + "<TD WIDTH=''14%''><FONT SIZE=''2'' FACE=''" + fontface + "'' COLOR=''" + this.gHeaderColor + "''><B>Mon</B></FONT></TD>";
     vCode = vCode + "<TD WIDTH=''14%''><FONT SIZE=''2'' FACE=''" + fontface + "'' COLOR=''" + this.gHeaderColor + "''><B>Tue</B></FONT></TD>";
     vCode = vCode + "<TD WIDTH=''14%''><FONT SIZE=''2'' FACE=''" + fontface + "'' COLOR=''" + this.gHeaderColor + "''><B>Wed</B></FONT></TD>";
     vCode = vCode + "<TD WIDTH=''14%''><FONT SIZE=''2'' FACE=''" + fontface + "'' COLOR=''" + this.gHeaderColor + "''><B>Thu</B></FONT></TD>";
     vCode = vCode + "<TD WIDTH=''14%''><FONT SIZE=''2'' FACE=''" + fontface + "'' COLOR=''" + this.gHeaderColor + "''><B>Fri</B></FONT></TD>";
     vCode = vCode + "<TD WIDTH=''16%''><FONT SIZE=''2'' FACE=''" + fontface + "'' COLOR=''" + this.gHeaderColor + "''><B>Sat</B></FONT></TD>";
     vCode = vCode + "</TR>";

     return vCode;
    }

    Calendar.prototype.cal_data = function() {
     var vDate = new Date();
     vDate.setDate(1);
     vDate.setMonth(this.gMonth);
     vDate.setFullYear(this.gYear);

     var vFirstDay=vDate.getDay();
     var vDay=1;
     var vLastDay=Calendar.get_daysofmonth(this.gMonth, this.gYear);
     var vOnLastDay=0;
     var vCode = "";

     /*
     Get day for the 1st of the requested month/year..
     Place as many blank cells before the 1st day of the month as necessary.
     */

     vCode = vCode + "<TR>";
     for (i=0; i<vFirstDay; i++) {
             vCode = vCode + "<TD WIDTH=''14%''" + this.write_weekend_string(i) + "><FONT SIZE=''2'' FACE=''" + fontface + "''>&nbsp;</FONT></TD>";
     }

     // Write rest of the 1st week
     for (j=vFirstDay; j<7; j++) {
             vCode = vCode + "<TD WIDTH=''14%''" + this.write_weekend_string(j) + "><FONT SIZE=''2'' FACE=''" + fontface + "''>" +
                     "<A HREF=''#'' " +
                             "onClick=\"self.opener.document." + this.gReturnItem + ".value=''" +
                             this.format_data(vDay) +
                             "'';window.close();\">" +
                             this.format_day(vDay) +
                     "</A>" +
                     "</FONT></TD>";
             vDay=vDay + 1;
     }
     vCode = vCode + "</TR>";

     // Write the rest of the weeks
     for (k=2; k<7; k++) {
             vCode = vCode + "<TR>";

             for (j=0; j<7; j++) {
                     vCode = vCode + "<TD WIDTH=''14%''" + this.write_weekend_string(j) + "><FONT SIZE=''2'' FACE=''" + fontface + "''>" +
                             "<A HREF=''#'' " +
                                     "onClick=\"self.opener.document." + this.gReturnItem + ".value=''" +
                                     this.format_data(vDay) +
                                     "'';window.close();\">" +
                             this.format_day(vDay) +
                             "</A>" +
                             "</FONT></TD>";
                     vDay=vDay + 1;

                     if (vDay > vLastDay) {
                             vOnLastDay = 1;
                             break;
                     }
             }

             if (j == 6)
                     vCode = vCode + "</TR>";
             if (vOnLastDay == 1)
                     break;
     }

     // Fill up the rest of last week with proper blanks, so that we get proper square blocks
     for (m=1; m<(7-j); m++) {
             if (this.gYearly)
                     vCode = vCode + "<TD WIDTH=''14%''" + this.write_weekend_string(j+m) +
                     "><FONT SIZE=''2'' FACE=''" + fontface + "'' COLOR=''gray''>&nbsp;</FONT></TD>";
             else
                     vCode = vCode + "<TD WIDTH=''14%''" + this.write_weekend_string(j+m) +
                     "><FONT SIZE=''2'' FACE=''" + fontface + "'' COLOR=''gray''>" + m + "</FONT></TD>";
     }

     return vCode;
    }

    Calendar.prototype.format_day = function(vday) {
     var vNowDay = gNow.getDate();
     var vNowMonth = gNow.getMonth();
     var vNowYear = gNow.getFullYear();

     if (vday == vNowDay && this.gMonth == vNowMonth && this.gYear == vNowYear)
             return ("<FONT COLOR=\"RED\"><B>" + vday + "</B></FONT>");
     else
             return (vday);
    }

    Calendar.prototype.write_weekend_string = function(vday) {
     var i;

     // Return special formatting for the weekend day.
     for (i=0; i<weekend.length; i++) {
             if (vday == weekend[i])
                     return (" BGCOLOR=\"" + weekendColor + "\"");
     }

     return "";
    }

    Calendar.prototype.format_data = function(p_day) {
     var vData;
     var vMonth = 1 + this.gMonth;
     vMonth = (vMonth.toString().length < 2) ? "0" + vMonth : vMonth;
     var vMon = Calendar.get_month(this.gMonth).substr(0,3).toUpperCase();
     var vFMon = Calendar.get_month(this.gMonth).toUpperCase();
     var vY4 = new String(this.gYear);
     var vY2 = new String(this.gYear.substr(2,2));
     var vDD = (p_day.toString().length < 2) ? "0" + p_day : p_day;

     switch (this.gFormat) {
             case "MM\/DD\/YYYY" :
                     vData = vMonth + "\/" + vDD + "\/" + vY4;
                     break;
             case "MM\/DD\/YY" :
                     vData = vMonth + "\/" + vDD + "\/" + vY2;
                     break;
             case "MM-DD-YYYY" :
                     vData = vMonth + "-" + vDD + "-" + vY4;
                     break;
             case "MM-DD-YY" :
                     vData = vMonth + "-" + vDD + "-" + vY2;
                     break;

             case "DD\/MON\/YYYY" :
                     vData = vDD + "\/" + vMon + "\/" + vY4;
                     break;
             case "DD\/MON\/YY" :
                     vData = vDD + "\/" + vMon + "\/" + vY2;
                     break;
             case "DD-MON-YYYY" :
                     vData = vDD + "-" + vMon + "-" + vY4;
                     break;
             case "DD-MON-YY" :
                     vData = vDD + "-" + vMon + "-" + vY2;
                     break;

             case "DD\/MONTH\/YYYY" :
                     vData = vDD + "\/" + vFMon + "\/" + vY4;
                     break;
             case "DD\/MONTH\/YY" :
                     vData = vDD + "\/" + vFMon + "\/" + vY2;
                     break;
             case "DD-MONTH-YYYY" :
                     vData = vDD + "-" + vFMon + "-" + vY4;
                     break;
             case "DD-MONTH-YY" :
                     vData = vDD + "-" + vFMon + "-" + vY2;
                     break;

             case "DD\/MM\/YYYY" :
                     vData = vDD + "\/" + vMonth + "\/" + vY4;
                     break;
             case "DD\/MM\/YY" :
                     vData = vDD + "\/" + vMonth + "\/" + vY2;
                     break;
             case "DD-MM-YYYY" :
                     vData = vDD + "-" + vMonth + "-" + vY4;
                     break;
             case "DD-MM-YY" :
                     vData = vDD + "-" + vMonth + "-" + vY2;
                     break;

             default :
                     vData = vMonth + "\/" + vDD + "\/" + vY4;
     }

     return vData;
    }

    function Build(p_item, p_month, p_year, p_format) {
     var p_WinCal = ggWinCal;
     gCal = new Calendar(p_item, p_WinCal, p_month, p_year, p_format);

     // Customize your Calendar here..
     gCal.gBGColor="white";
     gCal.gLinkColor="black";
     gCal.gTextColor="black";
     gCal.gHeaderColor="darkgreen";

     // Choose appropriate show function
     if (gCal.gYearly)       gCal.showY();
     else    gCal.show();
    }

    function show_calendar() {
     /*
             p_month : 0-11 for Jan-Dec; 12 for All Months.
             p_year  : 4-digit year
             p_format: Date format (mm/dd/yyyy, dd/mm/yy, ...)
             p_item  : Return Item.
     */

     p_item = arguments[0];
     if (arguments[1] == null)
             p_month = new String(gNow.getMonth());
     else
             p_month = arguments[1];
     if (arguments[2] == "" || arguments[2] == null)
             p_year = new String(gNow.getFullYear().toString());
     else
             p_year = arguments[2];
     if (arguments[3] == null)
             p_format = "MM/DD/YYYY";
     else
             p_format = arguments[3];

     vWinCal = window.open("", "Calendar",
             "width=250,height=250,status=no,resizable=no,top=200,left=200");
     vWinCal.opener = self;
     ggWinCal = vWinCal;

     Build(p_item, p_month, p_year, p_format);
    }
    /*
    Yearly Calendar Code Starts here
    */
    function show_yearly_calendar(p_item, p_year, p_format) {
     // Load the defaults..
     if (p_year == null || p_year == "")
             p_year = new String(gNow.getFullYear().toString());
     if (p_format == null || p_format == "")
             p_format = "MM/DD/YYYY";

     var vWinCal = window.open("", "Calendar", "scrollbars=yes");
     vWinCal.opener = self;
     ggWinCal = vWinCal;

     Build(p_item, null, p_year, p_format);
    }

// CALENDAR CODE ends.
//---------------------------------------------------
f_getNADS();
f_ResetScreen();
//---------------------------------------------------

//---------------------------------------------------
</script>
</html>
');

nm_main.htp_footer;
END em_criteria;--sp_buildScreen;
--==============================================================================

PROCEDURE sp_getNADS IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD (   parent_id    VARCHAR2(10),
                                option_value VARCHAR2(10),
                                output_text  VARCHAR2(200),
                                based_on     CHAR(4),
                                option_level NUMBER,
                                option_text  VARCHAR(100)
                             );

v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;
--v_Counter   NUMBER DEFAULT 0;
v_MaxStrLength NUMBER DEFAULT 0;
v_ID VARCHAR(50);
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------
/*
select MAX(LENGTH(LPAD(' ',(level-1)*10)||option_text))
  into v_MaxStrLength
  from emdba.area_dist_site_hierarchy_mv
  start with parent_id is null
connect by nocycle parent_id = prior option_value;
*/
select MAX(LENGTH(option_text))
  into v_MaxStrLength
  from emdba.area_dist_site_hierarchy_mv
;
--------------------------------------------------------------------------------
/*v_SQL :=
'select NVL(parent_id,''0'') as parent_id,
       option_value,
       DECODE(based_on,''NTNL'','''',
                       ''AREA'',''a'',
                       ''DIST'',''d'',
                       ''SITE'',''s'')
       ||
       LPAD('' '',(level-1)*5)||option_text as output_text,
       based_on,
       level as option_level,
       option_text
  from emdba.area_dist_site_hierarchy_mv
  -- where option_text not like (''%&%'')
start with parent_id is null
connect by nocycle parent_id = prior option_value
order siblings by option_text
';*/
v_SQL :=
'select NVL(parent_id,''0'') as parent_id,
       option_value,
       DECODE(based_on,''NTNL'','''',
                       ''AREA'',''a'',
                       ''DIST'',''d'',
                       ''SITE'',''s'')
       ||
       LPAD('' '',(level-1)*5)||NMARS.NM_EQUIP_MODS.f_removeSpecialChar(option_text) as output_text,
       based_on,
       level as option_level,
       NMARS.NM_EQUIP_MODS.f_removeSpecialChar(option_text)
  from emdba.area_dist_site_hierarchy_mv
  -- where option_text not like (''%&%'')
start with parent_id is null
connect by nocycle parent_id = prior option_value
order siblings by option_text
';


--------------------------------------------------------------------------------
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            /*
            v_ID := RPAD(SUBSTR(r_Record.option_value, 1, INSTR(r_Record.option_value,'_')-1),
                                v_MaxStrLength,
                                '.');
            */
            v_ID := SUBSTR(r_Record.option_value, 1, INSTR(r_Record.option_value,'_')-1);

            htp.p('<ROW>
                       <PARENT_ID>'   ||r_Record.parent_id||   '</PARENT_ID>
                       <OPTION_VALUE>'||r_Record.option_value||'</OPTION_VALUE>
                       <OUTPUT_TEXT>' ||r_Record.output_text||' '||v_ID||'</OUTPUT_TEXT>
                       <BASED_ON>'    ||r_Record.based_on||    '</BASED_ON>
                       <OPTION_LEVEL>'||r_Record.option_level||'</OPTION_LEVEL>
                       <OPTION_TEXT>' ||r_Record.option_text|| '</OPTION_TEXT>
                  </ROW>');
        END LOOP;
    CLOSE c_AvailableRecords;
htp.p('</ROWSET>');
--------------------------------------------------------------------------------
END sp_getNADS;
--==============================================================================

PROCEDURE sp_getsetAllAcronyms
IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( option_value VARCHAR2(10),
                              option_text  VARCHAR2(100)
                             );

v_SQL VARCHAR2(4000);
c_AvailableRecords cRef_getData;
r_Record           rRef_getData;
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------
v_SQL := 'select distinct mv.acr as option_value
                         ,mv.acr as option_text
            from emdba.em_nm_mod_tracking_1_mv mv
            order by 1';
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
htp.p('<?xml version="1.0"?><ROWSET>');
    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;
            htp.p('<ROW>'||
                       '<OPTION_VALUE>'||r_Record.option_value||'</OPTION_VALUE>'||
                       '<OPTION_TEXT>' ||r_Record.option_text|| '</OPTION_TEXT>'||
                  '</ROW>');
        END LOOP;
    CLOSE c_AvailableRecords;
htp.p('</ROWSET>');
--------------------------------------------------------------------------------
END sp_getsetAllAcronyms;
--==============================================================================
/*
PROCEDURE sp_getHTML_Output( arg_NADS_value     IN VARCHAR2
                            ,arg_NADS_Scope     IN VARCHAR2
                            ,arg_IssueDate      IN VARCHAR2
                            ,arg_DueDate        IN VARCHAR2
                            ,arg_CloseDate      IN VARCHAR2
                            ,arg_BulletinStatus IN VARCHAR2
                            ,arg_BulletinType   IN VARCHAR2
                            ,arg_BulletinNum_3  IN VARCHAR2
                            ,arg_BulletinNum_2  IN VARCHAR2
                            ,arg_ListOfAcronyms IN VARCHAR2)
*/
PROCEDURE sp_getHTML_Output( aV   IN VARCHAR2
                            ,aSp  IN VARCHAR2
                            ,aIDt IN VARCHAR2
                            ,aDDt IN VARCHAR2
                            ,aCDt IN VARCHAR2
                            ,aBSt IN VARCHAR2
                            ,aBT  IN VARCHAR2
                            ,aB3  IN VARCHAR2
                            ,aB2  IN VARCHAR2
                            ,aLA  IN VARCHAR2)
IS
--------------------------------------------------------------------------------
TYPE cRef_getData IS REF CURSOR;
TYPE rRef_getData IS RECORD ( parent_id        VARCHAR2(50)
                             ,child_id         VARCHAR2(50)
                             ,area             emdba.em_site_t.area%TYPE
                             ,area_name        emdba.em_area_t.area_name%TYPE
                             ,district_code    emdba.em_district_code_t.district_code%TYPE
                             ,district_name    emdba.em_district_code_t.district_name%TYPE
                             ,site_id          emdba.em_site_t.site_id%TYPE
                             ,site_name        emdba.em_site_t.site_name%TYPE
                             ,reg_workorder_no VARCHAR2(50)
                             ,bulletinno_descr VARCHAR2(100)
                             ,acronym          emdba.em_nm_mod_tracking_1_mv.acr%TYPE
                             ,equip_no         emdba.em_nm_mod_tracking_1_mv.equip_no%TYPE
                             ,serial_no        VARCHAR2(50)
                             ,class_code       emdba.em_nm_mod_tracking_1_mv.class_code%TYPE
                             ,start_dt         VARCHAR2(10)
                             ,due_dt           VARCHAR2(10)
                             ,complete_dt      VARCHAR2(10)
                             ,labor_hr         VARCHAR2(20)
                             ,labor_cost       VARCHAR2(20)
                             ,material_cost    VARCHAR2(20)
                             ,record_status    VARCHAR2(20)
                             ,date_ref         DATE
                             ,random_ref_num   NUMBER
                             ,past_due_reason_code NUMBER
                             );

v_SQL            VARCHAR2(4000) default '';
v_NADS           VARCHAR2(100)  default '';
v_IssueDate      DATE           default SYSDATE;
v_DueDate        DATE           default SYSDATE;
v_CloseDate      DATE           default SYSDATE;
v_BulletinStatus VARCHAR2(500)  default '';
v_BulletinType   VARCHAR2(500)  default '';
v_BulletinNum    VARCHAR2(200)  default '';
v_ListOfAcronyms VARCHAR2(2000) default '';

c_AvailableRecords cRef_getData;
r_Record           rRef_getData;
vNoData      VARCHAR2(100) DEFAULT 'No Data';

v_NumOfTabs  VARCHAR2(200) DEFAULT '';
v_FontWeight VARCHAR2(100) DEFAULT '';

--v_Color1     CHAR(7) DEFAULT '#CCCCCC';
--v_Color2     CHAR(7) DEFAULT '#EBEBEB';

v_RandomRefNum NUMBER DEFAULT 0;
v_DateRef      DATE   DEFAULT SYSDATE;
-----------------------------------------------------------------------------------------
CURSOR c_Past_Due_Reason IS
select rownum as row_num, reason_code||' - '||past_due_reason reason
  from emdba.em_past_due_reason_t
order by reason_code;

v_NumOfRecActual  NUMBER DEFAULT 0;
v_NumOfRows       NUMBER DEFAULT 0;
--v_RecIteration    NUMBER DEFAULT 0;
--v_SQL_Out         VARCHAR2(4000);
--v_SQL_Temp        VARCHAR2(100);
-----------------------------------------------------------------------------------------
-- This cursor generates "explorer" output
CURSOR c_Output IS
select level,
       area,
       district_code,
       site_id,
       NVL(reg_workorder_no,'&nbsp;')  as reg_workorder_no,
       NVL(bulletinno_descr,'&nbsp;')  as bulletinno_descr,
       NVL(acronym,         '&nbsp;')  as acronym,
       NVL(equip_no,        '&nbsp;')  as equip_no,
       NVL(serial_no,       '&nbsp;')  as serial_no,
       NVL(class_code,      '&nbsp;')  as class_code,
       NVL(start_dt,        '&nbsp;')  as start_dt,
       NVL(due_dt,          '&nbsp;')  as due_dt,
       NVL(complete_dt,     '&nbsp;')  as complete_dt,
       NVL(labor_hr,        '&nbsp;')  as labor_hr,
       NVL(labor_cost,      '&nbsp;')  as labor_cost,
       NVL(material_cost,   '&nbsp;')  as material_cost,
       NVL(record_status,   '&nbsp;')  as record_status,
       NVL(to_char(date_ref),'&nbsp;') as date_ref,
       NVL(to_char(random_ref_num),'&nbsp;') as random_ref_num,
       DECODE( level, 5, NVL(to_char(past_due_reason_code),''||vNoData||''),'') as past_due_reason_code
  from NMARS.nm_mod_tracking_temp
       --NMARS.nm_mod_tracking_output
 where level != 1
   --and date_ref = v_DateRef
   and random_ref_num = v_RandomRefNum
 start with parent_id is NULL
connect by parent_id = prior child_id
 order siblings by bulletinno_descr;
-----------------------------------------------------------------------------------------
BEGIN
-----------------------------------------------------------------------------------------
select TRUNC(to_date(aIDt, 'MM/DD/YYYY')),
       TRUNC(to_date(aDDt,   'MM/DD/YYYY')),
       TRUNC(to_date(aCDt, 'MM/DD/YYYY'))
into v_IssueDate,
     v_DueDate,
     v_CloseDate
from dual;
-----------------------------------------------------------------------------------------
select dbms_random.random
  into v_RandomRefNum
  from dual;
-----------------------------------------------------------------------------------------
-- The idea is to build a table with 3 columns
-- Currently this "select" is not used.  It will be needed for
-- building dynamic table for PAST_DUE reasons:
select Count(*),
       DECODE( MOD(Count(*),3), 0,Count(*)/3,
                                1,ROUND(Count(*)/3)+1,
                                2,ROUND(Count(*)/3) )
  into v_NumOfRecActual, v_NumOfRows
  from emdba.em_past_due_reason_t
order by reason_code;
-----------------------------------------------------------------------------------------
-- The following SQL retrievs
v_SQL :=
 'SELECT  to_char(s.site_id)||''_SITE'' as parent_id
         ,UPPER(substr(t.modification_no,5,3))||''-''||UPPER(substr(t.modification_no,9)) as child_id
         ,s.area
         ,a.area_name
         ,s.district_code
         ,d.district_name
         ,s.site_id
         ,s.site_name
         ,t.reg_no||'' -  ''||to_char(t.wo_no)   as Reg_WorkOrder_No
         ,UPPER(NVL(t.modification_no, '''||vNoData||'''))||'' / '' || NVL(t.wo_desc,'''||vNoData||''') as BulletinNo_Descr
         ,t.acr                                  as Acronym
         ,t.equip_no                             as Equip_No
         ,NVL(t.serial_no,'''||vNoData||''')     as Serial_No
         ,t.class_code                           as Class_Code
         ,to_char(t.date_issued,''mm/dd/yyyy'')  as Start_Dt
         ,NVL(to_char(t.date_due,''mm/dd/yyyy''),    '''||vNoData||''') as Due_Dt
         ,NVL(to_char(t.date_closed,''mm/dd/yyyy''), '''||vNoData||''') as Complete_Dt
         ,NVL(to_char(t.hours_to_date),'''||vNoData||''')  as Labor_Hr
         ,NVL(to_char(t.labor_cost),'''||vNoData||''')     as Labor_Cost
         ,NVL(to_char(t.material_cost),'''||vNoData||''')  as Material_Cost
         ,NMARS.NM_EQUIP_MODS.f_BulletinStatus(t.date_due, t.date_closed)      as Record_Status
         ,NVL(to_char('''||v_DateRef||'''),'''||vNoData||''')  as date_ref
         ,NVL(to_char('||v_RandomRefNum||'),'''||vNoData||''') as random_ref_num
         ,t.past_due_reason_code as past_due_reason_code
    FROM  emdba.em_site_t s,emdba.em_area_t a,emdba.em_district_code_t d,emdba.em_nm_mod_tracking_1_mv t
   WHERE s.site_status_code =''A''
     AND t.site_id <> 303
     AND t.area_id = a.area_code
     AND s.district_code = d.district_code
     AND t.site_id = s.site_id
     ';
-- TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
-- delete nm_dynamic_sql_t_2;
-- insert into nm_dynamic_sql_t_2 (sql_statement) values (v_SQL);
--TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
 -----------------------------------------------------------------------------------------
if aSp = 'NTNL' then
   v_NADS := '';
elsif aSp = 'AREA' then
   v_NADS := ' AND t.area_id = '''||aV||'''
';
elsif aSp = 'DIST' then
   v_NADS := ' AND s.district_code = '''||aV||'''
';
elsif aSp = 'SITE' then
   v_NADS := ' AND t.site_id = '||to_Number(aV)||'
';
end if;
v_SQL := v_SQL||v_NADS;
-----------------------------------------------------------------------------------------
-- 1. All records (OPEN, COMPLETED, PAST DUE) issued on "v_IssueDate" and later:
if aBSt = 'OPEN_COMPLETED' then
   --v_BulletinStatus := ' AND UPPER(TRUNC(t.date_issued)) >= TO_DATE(UPPER('''||v_IssueDate||'''))
   v_BulletinStatus := ' AND TRUNC(t.date_issued) >= '''||v_IssueDate||'''
';
-- 2. Only OPEN records issued on "v_IssueDate" and later:
elsif aBSt = 'OPEN' then
  v_BulletinStatus := ' AND TRUNC(t.date_issued) >= '''||v_IssueDate||'''
                        AND TRUNC(t.date_due)    >= TRUNC(SYSDATE)
                        AND t.date_closed IS NULL
';
-- 3. Only COMPLETED records issued on "v_IssueDate" and later:
elsif aBSt = 'COMPLETED' then
  v_BulletinStatus := ' AND TRUNC(t.date_issued) >= '''||v_IssueDate||'''
                        AND t.date_closed IS NOT NULL
';
-- 4. Only PAST DUE records issued on "v_IssueDate" and later:
elsif aBSt = 'PAST_DUE' then
  v_BulletinStatus := ' AND TRUNC(t.date_issued) >= '''||v_IssueDate||'''
                        AND TRUNC(t.date_due)    <  TRUNC(SYSDATE)
                        AND t.date_closed IS NULL
';
-- 5.  Only OPEN nad PAST DUE records
elsif aBSt = 'OPEN_PASTDUE' then
   v_BulletinStatus := ' AND ( (TRUNC(t.date_issued) >= '''||v_IssueDate||'''
                                AND TRUNC(t.date_due)>= TRUNC(SYSDATE)
                                AND t.date_closed IS NULL
                                ) OR t.date_closed IS NULL
                              )
';
end if;
v_SQL := v_SQL||v_BulletinStatus;
-----------------------------------------------------------------------------------------
v_BulletinType := ' AND UPPER(substr(t.modification_no,1,3)) IN ( select column_value from table(NMARS.NM_EQUIP_MODS.f_convertStringToListOfVals('''||aBT||''')) )
';
v_SQL := v_SQL||v_BulletinType;
-----------------------------------------------------------------------------------------
if (aB3 is not NULL or aB3 != '')
   and
   (aB2 is not NULL or aB2 != '')
then
    v_BulletinNum := ' AND UPPER(substr(t.modification_no,5,3)) = '''||aB3||'''
                       AND UPPER(substr(t.modification_no,9))   = '''||aB2||'''
';
end if;
v_SQL := v_SQL||v_BulletinNum;
-----------------------------------------------------------------------------------------
if  aLA = 'ALL_ACRONYMS' then
    v_ListOfAcronyms := '';
else
    v_ListOfAcronyms := ' AND t.acr IN ( select column_value from table(NMARS.NM_EQUIP_MODS.f_convertStringToListOfVals('''||aLA||''')) )
';
end if;
v_SQL := v_SQL||v_ListOfAcronyms;
-----------------------------------------------------------------------------------------
-- Remove any record that had been created more then 2 days ago:
delete NMARS.nm_equip_mods_sql_t s
where (trunc(v_DateRef) - trunc(s.date_ref)) > 2;
-- Create a record with the most recent "select statement":
-- A record in "NMARS.nm_equip_mods_sql_t" may be needed for references.
insert into NMARS.nm_equip_mods_sql_t t
            (sql_statement, date_ref, random_ref_num)
     values (v_SQL, v_DateRef, v_RandomRefNum);
-----------------------------------------------------------------------------------------
commit;
-----------------------------------------------------------------------------------------

    OPEN c_AvailableRecords FOR v_SQL;
        LOOP
            FETCH c_AvailableRecords INTO r_Record;
            EXIT WHEN c_AvailableRecords%NOTFOUND;

           insert into NMARS.nm_mod_tracking_temp
              (parent_id,     child_id,
               area,          area_name,
               district_code, district_name,
               site_id,       site_name,
               reg_workorder_no, bulletinno_descr,
               acronym,       equip_no,
               serial_no,     class_code,
               start_dt,      due_dt,
               complete_dt,   labor_hr,
               labor_cost,    material_cost,
               record_status, date_ref,
               random_ref_num,past_due_reason_code)
            values
              ( r_Record.parent_id,     r_Record.child_id,
                r_Record.area,          r_Record.area_name,
                r_Record.district_code, r_Record.district_name,
                r_Record.site_id,       r_Record.site_name,
                r_Record.reg_workorder_no, r_Record.bulletinno_descr,
                r_Record.acronym,       r_Record.equip_no,
                r_Record.serial_no,     r_Record.class_code,
                r_Record.start_dt,      r_Record.due_dt,
                r_Record.complete_dt,   r_Record.labor_hr,
                r_Record.labor_cost,    r_Record.material_cost,
                r_Record.record_status, r_Record.date_ref,
                r_Record.random_ref_num,r_Record.past_due_reason_code);

        END LOOP;
    CLOSE c_AvailableRecords;
-----------------------------------------------------------------------------------------
insert into NMARS.nm_mod_tracking_temp
  (parent_id, child_id, bulletinno_descr, date_ref, random_ref_num)
select distinct 'NTNL', a.area||'_AREA', a.area_name, v_DateRef, v_RandomRefNum
  from NMARS.nm_mod_tracking_temp a
where a.area is not NULL;
-----------------------------------------------------------------------------------------
insert into NMARS.nm_mod_tracking_temp
  (parent_id, child_id, bulletinno_descr, date_ref, random_ref_num)
select distinct d.area||'_AREA', d.district_code||'_DIST', district_name, v_DateRef, v_RandomRefNum
  from NMARS.nm_mod_tracking_temp d
 where d.area is not null;
-----------------------------------------------------------------------------------------
insert into NMARS.nm_mod_tracking_temp
  (parent_id, child_id, bulletinno_descr, date_ref, random_ref_num)
select distinct s.district_code||'_DIST', to_char(s.site_id)||'_SITE', site_name, v_DateRef, v_RandomRefNum
  from NMARS.nm_mod_tracking_temp s
 where s.area is not NULL;
-----------------------------------------------------------------------------------------
insert into NMARS.nm_mod_tracking_temp
  (parent_id, child_id, bulletinno_descr, date_ref, random_ref_num)
values
  (NULL, 'NTNL', 'NATIONAL', v_DateRef, v_RandomRefNum);
-----------------------------------------------------------------------------------------
htp.p('
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
');
htp.p('
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Modification Tracking Report</title>
<script language="javascript" type="text/javascript">
');
htp.p('
function f_onClick(arg_CtrlName){with(self.document.forms[0])
{
    switch(arg_CtrlName)
    {
        //case "cb_ExcelFormat":
        //   f_generateReport();
        //break;
        //
        case "cb_Close":
           self.close();
        break;
        //
        case "cb_NewReport":
             history.go(-1);
        break;
        //
        case "cb_MainMenu":
           go_home("cb_MainMenu")
        break;
    }

}}
');
htp.p('
function f_generateReport(arg_RandomNum){with(self.document.forms[0])
{
    alert('||v_RandomRefNum||');
}}
');
htp.p('
</script>
</head>
<body>
<FORM name="form1" action="" method="POST">
');
-----------------------------------------------------------------------------------------
htp.p('
<table width="100%" border="0" cellspacing="2" cellpadding="2">
');

htp.p('
        <tr>
                <td width="10%" valign="top">
                    <a href="!em_run_report?pApplication=EMARS'
                                                    ||'&pReportType=REPORT60'
                                                    ||'&p_report=mtr003.rdf'
                                                    ||'&p_random_num='||v_RandomRefNum
                                                    ||'&log=N'
                                                    ||'&email=N'
                                                    ||'&desformat=XLS">'
                                                    ||'<font color="#003366" size="-1" face="Arial, Helvetica, sans-serif">'
                                                    ||'<strong>Convert to Excel</strong>'
                                                    ||'</font>'
                                                    ||'</a>
                </td>
                <td width="15%" valign="top">
                    <a href="javascript:void(0);" name="cb_Close" onclick="javascript: f_onClick(this.name);" >'||
                       '<font color="#003366" size="-1" face="Arial, Helvetica, sans-serif">'||
                       '<strong>Close</strong>'||
                       '</font>'||
                '</td>

');
-----------------------------------------------------------------------------------------
htp.p('
               <td>
                   <font color="#003366" size="+3" face="Arial, Helvetica, sans-serif">
                   <strong>
                   Modification Tracking Report
                  <strong>
                  </font>
               </td>
');
-----------------------------------------------------------------------------------------
htp.p('
               <td width="20%" align="right">
                    <table width="100%" border="0" cellspacing="4" cellpadding="0">
                        <tr>
                            <td align="left" colspan="3">
                                <font color="#666633" size="-1" face="Arial, Helvetica, sans-serif" style="font-weight:bold;">
                                Legend for Past Due Reasons:
                                <strong>
                            </td>
                        </tr>
');
        FOR r_Past_Due_Reason IN c_Past_Due_Reason LOOP

        htp.p('
                        <tr>
                            <td style="font-family:Arial, Helvetica, sans-serif; font-size:x-small;" align="left">'||
                                '<strong>'||
                                '<font color="#666633" size="-2" face="Arial, Helvetica, sans-serif">'||
                                r_Past_Due_Reason.Reason||
                                '</font>'||
                                '</strong>'||
                            '</td>
                        </tr>
        ');
        END LOOP;
htp.p('
                    </table>
');
-----------------------------------------------------------------------------------------
htp.p('
                </td>
        </tr>
');
htp.p('
</table>
<br />
');

-----------------------------------------------------------------------------------------
htp.p('
<table width="100%" border="0" cellspacing="2" cellpadding="2">
');
            htp.p('<tr bgcolor="#666666">');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Bulletin Number</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Work<br />Order<br />Number</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Acronym</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Equipment<br />Number</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                          <strong>Serial<br />Number</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Class<br />Code</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Issue<br />Date</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Due<br />Date</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Completed<br />Date</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Labor<br />Hour(s)</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Labor<br />Cost</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Material<br />Cost</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Record<br />Status</strong></font>
                       </td>');
            htp.p('    <td><font face="Arial, Helvetica, sans-serif" color="#CCCCCC" size="-1">
                           <strong>Past Due<br />Reasons</strong></font>
                       </td>');
            htp.p('</tr>');

            FOR r_Output IN c_Output
            LOOP

                if r_Output.Level = 2 then
                   v_NumOfTabs := '';
                   v_FontWeight := '';
                elsif r_Output.Level = 3 then
                   v_NumOfTabs := '&nbsp;&nbsp;&nbsp;&nbsp;';
                   v_FontWeight := '';
                elsif r_Output.Level = 4 then
                   v_NumOfTabs := '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                   v_FontWeight := '';
                elsif r_Output.Level = 5 then
                   v_NumOfTabs := '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                   v_FontWeight := 'style="font-weight:bold;"';
                else
                   v_NumOfTabs := '';
                end if;

                htp.p('<tr>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000" '||v_FontWeight||'>'||v_NumOfTabs||r_Output.bulletinno_descr ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.reg_workorder_no||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.acronym         ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.equip_no        ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.serial_no       ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.class_code      ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.start_dt        ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.due_dt          ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.complete_dt     ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.labor_hr        ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.labor_cost      ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.material_cost   ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.record_status   ||'</font></td>');
                htp.p('    <td><font face="Arial, Helvetica, sans-serif" size="-3" color="#000000">'||r_Output.past_due_reason_code||'</font></td>');
                htp.p('</tr>');

            END LOOP;

-----------------------------------------------------------------------------------------
-- Table "nm_mod_tracking_output" has to be populated since "nm_mod_tracking_temp"
-- cannot hold records to be retried for Excel file.
delete nm_mod_tracking_output o
where (trunc(v_DateRef) - trunc(to_date(o.date_ref))) > 2
;

insert into nm_mod_tracking_output
  (parent_id, child_id, area, area_name, district_code, district_name, site_id, site_name,
   reg_workorder_no, bulletinno_descr, acronym, equip_no, serial_no, class_code, start_dt, due_dt, complete_dt,
   labor_hr, labor_cost, material_cost, record_status, date_ref, random_ref_num, past_due_reason_code)
select parent_id, child_id, area, area_name, district_code, district_name, site_id, site_name,
       reg_workorder_no, bulletinno_descr, acronym, equip_no, serial_no, class_code, start_dt, due_dt, complete_dt,
       labor_hr, labor_cost, material_cost, record_status, date_ref, random_ref_num, past_due_reason_code
from nm_mod_tracking_temp t
where t.area is not NULL
;

commit; --<-- This "COMMIT" commits all previous transactions and
        -- "removes" record from "nm_mod_tracking_temp" since it is
        -- a global temporary table designed as "on commit delete rows". - see create code of this table.
-----------------------------------------------------------------------------------------
htp.p('
<tr><td colspan="14">&nbsp;</td></tr>
<tr><td colspan="14"><font color="#000000"><center><strong>_____________________________________________________</strong></center></font></td></tr>
<tr><td colspan="14">&nbsp;</td></tr>
');
htp.p('
</table>
');
htp.p('
</FORM>
</body>
</html>
');
-----------------------------------------------------------------------------------------
EXCEPTION
      WHEN OTHERS THEN
          htp.p('Error ID:'||sqlcode||'<BR>');
          htp.p('Error Description:'||sqlerrm);
-----------------------------------------------------------------------------------------
END sp_getHTML_Output;
--=======================================================================================

PROCEDURE sp_NADSsearch( arg_NADSsearch IN VARCHAR2)
IS
-------------------------------------------------
v_NADSsearch VARCHAR2(100) DEFAULT arg_NADSsearch;
-------------------------------------------------
TYPE rec_SearchedVal IS RECORD
     (id_SearchedVal VARCHAR2(10)
     ,nm_SearchedVal VARCHAR2(50)
     ,based_on       VARCHAR2(4));
TYPE tbl_SearchedVal IS TABLE OF rec_SearchedVal;
result_SearchedVal tbl_SearchedVal;
----------------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------------
     SELECT SUBSTR(mv.option_value, 1, Length(mv.option_value)-5)
           ,mv.option_text
           ,mv.based_on
       BULK COLLECT INTO result_SearchedVal
       FROM emdba.area_dist_site_hierarchy_mv mv
      WHERE mv.based_on != 'NTNL'
        AND UPPER(mv.option_text) LIKE UPPER('%'||v_NADSsearch||'%')
      ORDER BY mv.based_on, mv.option_text;

htp.p('<?xml version="1.0"?><ROWSET>');
    FOR i IN 1..result_SearchedVal.COUNT LOOP
            htp.p('<ROW>
                       <OPTION_VALUE>'||result_SearchedVal(i).id_SearchedVal||'</OPTION_VALUE>
                       <OPTION_TEXT>' ||result_SearchedVal(i).nm_SearchedVal||'</OPTION_TEXT>
                       <BASED_ON>'    ||result_SearchedVal(i).based_on      ||'</BASED_ON>
                  </ROW>');
     END LOOP;
htp.p('</ROWSET>');
-----------------------------------------------------------------------------------------
COMMIT;
-----------------------------------------------------------------------------------------
END sp_NADSsearch;
--=======================================================================================
PROCEDURE sp_getSYSDATEminus60
IS
v_getSYSDATEminus60 VARCHAR2(10);
BEGIN

  SELECT to_Char(TRUNC(sysdate-60),'MM/DD/YYYY')
    INTO v_getSYSDATEminus60
    FROM dual;

htp.p('<?xml version="1.0"?><ROWSET>');
            htp.p('<ROW>
                       <SYSDATEminus60>'||v_getSYSDATEminus60||'</SYSDATEminus60>
                  </ROW>');
htp.p('</ROWSET>');

END sp_getSYSDATEminus60;
--=======================================================================================
--CREATE OR REPLACE TYPE VCARRAY  AS TABLE OF VARCHAR2(4000);
FUNCTION f_convertStringToListOfVals (arg_String IN VARCHAR2) RETURN vcarray PIPELINED
AS
    v_length   NUMBER := LENGTH(arg_String);
    v_start    NUMBER := 1;
    v_index    NUMBER;
    v_delimiter VARCHAR2(10) := ',';
BEGIN

    WHILE(v_start <= v_length)
    LOOP
        v_index := INSTR(arg_String, v_delimiter, v_start);
        IF v_index = 0 THEN
            PIPE ROW(SUBSTR(arg_String, v_start));
            v_start := v_length + 1;
        ELSE
            PIPE ROW(SUBSTR(arg_String, v_start, v_index - v_start));
            v_start := v_index + 1;
        END IF;
    END LOOP;

   RETURN;
 END f_convertStringToListOfVals;
--==============================================================================

FUNCTION f_DateDifference (arg_SS_MI_HH IN VARCHAR2,
                           arg_Date1    IN DATE,
                           arg_Date2    IN DATE) return NUMBER
AS
  v_RtnVal NUMBER;
BEGIN
     SELECT (arg_Date1-arg_Date2) * DECODE( UPPER(arg_SS_MI_HH),'SS', 24*60*60
                                                               ,'MI', 24*60
                                                               ,'HH', 24
                                                               ,NULL)
       INTO v_RtnVal
       FROM dual;

       RETURN v_RtnVal;

END f_DateDifference;
--==============================================================================
FUNCTION f_BulletinStatus(arg_DateDue    IN DATE
                         ,arg_DateClosed IN DATE) RETURN VARCHAR2
AS
 v_RtnVal VARCHAR2(20); -- Possible return values: "OPEN", "COMPLETED", "PAST DUE"
 v_DateDiff NUMBER DEFAULT 0;

BEGIN
     IF arg_DateClosed IS NULL THEN
        -- 1:
        select  TRUNC(arg_DateDue) - TRUNC(SYSDATE)
          into  v_DateDiff
          from dual;
        -- 2:
        if v_DateDiff >= 0 then
           v_RtnVal := 'OPEN';
        elsif v_DateDiff < 0 then
           v_RtnVal := 'PAST DUE';
        end if;

     ELSE -- arg_DateClosed IS NOT NULL
        v_RtnVal := 'COMPLETED';
     END IF;

     RETURN v_RtnVal;

END f_BulletinStatus;
--==============================================================================
FUNCTION f_removeSpecialChar(arg_String IN VARCHAR2) RETURN VARCHAR2
AS
  v_RtnVal VARCHAR2(4000);
BEGIN
  SELECT TRIM ( REGEXP_REPLACE ( arg_String
                      , '[\*;%&$´`¿_.+,-]*' ||  -- These characters will be removed
                    '( ?)'          ||  -- \1 = optional space
                '('         ||  -- Begin \2
                   ' *'         ||  --   0 or more spaces
                   '[\*;%&$´`¿_.+,-]*'  ||  --   0 or more special characters (same list as above)
                 ')*'               -- End \2 (\2 can occur 0 or more times)
                  , '\1'
                  )
         )
  INTO v_RtnVal
  FROM dual;

  RETURN v_RtnVal;

END f_removeSpecialChar;
--==============================================================================
END nm_equip_mods;
/
