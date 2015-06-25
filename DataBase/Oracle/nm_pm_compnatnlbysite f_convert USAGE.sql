CREATE OR REPLACE PACKAGE BODY nm_pm_compnatnlbysite
IS
--==============================================================================
PROCEDURE pm_criteria IS
BEGIN
--------------------------------------------------------------------------------
--nm_main.htp_header(TRUE);
--------------------------------------------------------------------------------
--htp.p('<FORM name="form1" action="" method="POST">');
--------------------------------------------------------------------------------
--nm_main.htp_footer;
--------------------------------------------------------------------------------
htp.p('
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
');
htp.p('
<SCRIPT language="javascript" type="text/javascript"><!--- SCRIPT 1 starts --->
//==============================================================================
// VARIABLE DECLARATION starts =================================================
//------------------------------------------------------------------------------
// GENERIC:
var v_Out = "";
var v_Date = new Date();
var v_CurrentYear = v_Date.getFullYear();

var v_ValidationPassed = "YES";

var v_DefaultValue = "-1";

var v_CtrlName  = "";
var v_CtrlID    = "";
var v_CtrlType  = "";
var v_CtrlValue = "";
var v_CtrlText  = "";
var v_CtrlAlt   = "";
var v_CtrlSize  = 0;

//---------------------------------------------------
var objAJAX = new ActiveXObject("microsoft.XMLDOM");
    objAJAX.async=false;
var v_ArrayOfRecords = new Array();
var v_ArrayOfValuesInRecord = new Array();
var v_NumberOfRecords = 0;
//---------------------------------------------------

//------------------------------------------------------------------------------

// PAGE SPECIFIC:
var arrayCtrlNames = new Array("sel_NADS",
                               "sel_FY_From",
                               "sel_FY_To",
                               "sel_Period_From",
                               "sel_Period_To"
                               );

var arrayPeriod_Ptr = new Array("sel_NADS",
                                "sel_Period_From",
                                "sel_Period_To"
                                );

var v_Default_From = "Select Period - FROM____________________";
var v_Default_To   = "Select Period - TO______________________";
var v_Default_Search = "___Search results will be listed here_____";

//------------------------------------------------------------------------------
// VARIABLE DECLARATION ends ===================================================
//==============================================================================
');
htp.p('
//==============================================================================
//GENERIC FUNCTION starts ======================================================
//------------------------------------------------------------------------------
');
htp.p('
//------------------------------------------------------------------------------
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
    //objAJAX.load("NMARS.NM_EQUIP_MODS.sp_getNADS");

    objAJAX.load("NMARS.NM_PM_COMPNATNLBYSITE.sp_getNADS");

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
//------------------------------------------------------------------------------
function f_setNADS()
{
    for (var i=0; i<bfrNADS.length; i++)
    {
        of_setSingleValue("sel_NADS", bfrNADS[i].a_option_value, bfrNADS[i].a_output_text, "NO", i)
    }


    // The following code is specific just for this page only:
    of_setSingleValue("sel_NADS", v_DefaultValue, "__Select either Area, District, or Site__", "NO", 0);
    //---------------------------------------------------------

}
//------------------------------------------------------------------------------
');
htp.p('
function of_outPut(arg_WhereOutput, arg_WhatOutput){with(self.document.forms[0])
{
    //alert(arg_WhereOutput+"  "+ arg_WhatOutput)
    document.getElementById(arg_WhereOutput).innerHTML = arg_WhatOutput;
}}
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
            //alert(arg_CtrlName+".value = "+arg_Value);

            eval(arg_CtrlName+".value = "+arg_Value);
            //
        break;
        //

    }
    //
}}

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
      else if (v_CtrlType == "hidden")
      {
          v_CtrlValue = of_Trim(eval(v_CtrlName+".value"));
      }
}}
//-----------------------------------------------------------------------------------------
function of_roundNumber(arg_Number, arg_Decimal) {
    var v_RtnVal = Math.round(arg_Number*Math.pow(10,arg_Decimal))/Math.pow(10,arg_Decimal);
    return v_RtnVal;
}
//-----------------------------------------------------------------------------------------
function of_Trim(s) {//***
  s = s.replace(/(^\s*)|(\s*$)/gi,"");
  s = s.replace(/[ ]{2,}/gi," ");
  s = s.replace(/\n /,"\n");
  return s;
}
');
htp.p('
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
// GENERIC FUNCTIONS ends ======================================================
//==============================================================================
');
htp.p('
//==============================================================================
//PAGE SPECIFIC FUNCTIONS starts ===============================================
function f_onClick(arg_CtrlName){with(self.document.forms[0])
{
    var v_cb_getExcel  = "";
    var v_cb_Excel_Msg = "";

    switch(arg_CtrlName)
    {
        case "cb_Execute":

            v_ValidationPassed = f_Validation_DataPresence();

            if (v_ValidationPassed == "YES")
            {
               v_cb_getExcel = ''<input name="cb_getExcel1"''+
                                      ''id="cb_getExcel1"''+
                                      ''onclick="f_onClick(this.name);"''+
                                      ''type="button"''+
                                      ''tabindex=""''+
                                      ''value="GET EXCEL"/>'';
               v_cb_Excel_Msg = ''Keep in mind that Excel spreadsheet does not have a table header, but columns match HTML output.'';

               of_outPut("span_getExcel1", v_cb_getExcel);
               of_outPut("span_Excel_Msg1",v_cb_Excel_Msg);
               of_setSingleValue("h_Random_Num", "''''", "''''", "''''", 0);

               f_getNatnlBySite();
            }

        break;
        //
        case "cb_MainMenu1":
            document.location = "nm_main.main_menu";
        break;
        //
        case "cb_MainMenu1":
            document.location = "nm_main.main_menu";
        break;
        //
        case "cb_Exit1":
            self.close()
        break;
        //
        case "cb_Exit2":
            self.close()
        break;
        //
        case "cb_Reset1":
            f_resetScreen();
        break;
        //
        case "cb_Reset2":
            f_resetScreen();
        break;
        //
        case "cb_getExcel1":
             f_getExcel();
        break;
        //
        case "cb_getExcel2":
             f_getExcel();
        break;
        //
        case "cb_NADSsearch":
             f_NADSsearch();
        break;
        //
    }
}}
//------------------------------------------------------------------------------
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
{alert(v_CtlrValue);
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
//-------------------------------------------------------------------------------------------
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
//---------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------
');
htp.p('
//------------------------------------------------------------------------------
function f_getExcel() {with(self.document.forms[0])
{
    of_getCtrlProperties("h_Random_Num");

    window.open("!em_run_report?pApplication=EMARS"+
                              "&pReportType=REPORT60"+
                              "&p_report=nms011.rdf"+
                              "&p_Random_Num="+v_CtrlValue+
                              "&log=N"+
                              "&email=N"+
                              "&desformat=XLS")
}}
//------------------------------------------------------------------------------
');
htp.p('
//------------------------------------------------------------------------------
orgBfr_PeriodFrom = new Array();
orgBfr_PeriodTo   = new Array();

function array_Periods (a_period_ptr, a_fy, a_ap, a_wk, a_start_date, a_end_date)
{
   this.a_period_ptr = a_period_ptr;
   this.a_fy         = a_fy;
   this.a_ap         = a_ap;
   this.a_wk         = a_wk;
   this.a_start_date = a_start_date;
   this.a_end_date   = a_end_date;
}
//-----------------------------------------------------------------------------
function f_onChange(arg_CtrlName){with(self.document.forms[0])
{
      var yy = 0;
      var v_SP_Call = "";
      var v_FY_To = "";
      var v_Period_From = "";


      of_getCtrlProperties(arg_CtrlName);

      switch(arg_CtrlName) //"sel_FY_From","sel_FY_To","sel_Period_From","sel_Period_To"
      {
           case "sel_FY_From":
               if (v_CtrlValue < 0)
               {
                  f_resetScreen();
               }
               else
               {
                  // 1. "sel_FY_To" must be populated with records whose values are equal or greater then selected in "sel_FY_From".

                  of_setSingleValue("sel_FY_To", v_DefaultValue, "Select Year - TO  ", "YES", 0);

                  for (var y=1; y<sel_FY_From.length; y++)
                  {
                      if (sel_FY_From.options[y].value >= v_CtrlValue)
                      {
                          yy++;
                          of_setSingleValue("sel_FY_To", sel_FY_From.options[y].value, sel_FY_From.options[y].value,"NO", yy);
                      }
                  }
                  //
                  // 2. "sel_Period_From" - Show all the records available for the selected year in "sel_FY_From".

                  v_SP_Call = "NMARS.NM_PM_COMPNATNLBYSITE.sp_getPeriodsFrom?p_PostalFY_From="+v_CtrlValue;

                  objAJAX.load(v_SP_Call);

                  orgBfr_PeriodFrom.length = 0;

                  if (objAJAX.parsed)
                  {
                       v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
                       v_NumberOfRecords = v_ArrayOfRecords.length; //alert(v_NumberOfRecords)
                       //
                       for (var r=0; r<v_NumberOfRecords; r++)
                       {
                           v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
                           orgBfr_PeriodFrom[r] = new array_Periods( v_ArrayOfValuesInRecord[0].text,  // a_period_ptr
                                                                     v_ArrayOfValuesInRecord[1].text,  // a_fy
                                                                     v_ArrayOfValuesInRecord[2].text,  // a_ap
                                                                     v_ArrayOfValuesInRecord[3].text,  // a_wk
                                                                     v_ArrayOfValuesInRecord[4].text,  // a_start_date
                                                                     v_ArrayOfValuesInRecord[5].text   // a_end_date
                                                                    );
                       }
                  }
                  //
                  // 3. Output selected values into "sel_Period_From":
                  of_setSingleValue("sel_Period_From", v_DefaultValue, v_Default_From, "YES", 0);

                  of_setSingleValue("sel_Period_From",
                                    v_DefaultValue*2,
                                    "Period | Week | Start Date | End Date", "NO", 1);

                  for (var y=0; y<orgBfr_PeriodFrom.length; y++)
                  {
                      of_setSingleValue("sel_Period_From",
                                        orgBfr_PeriodFrom[y].a_period_ptr,
                                        " "+orgBfr_PeriodFrom[y].a_ap+"       "+
                                        orgBfr_PeriodFrom[y].a_wk+"     "+
                                        orgBfr_PeriodFrom[y].a_start_date+" - "+
                                        orgBfr_PeriodFrom[y].a_end_date,
                                        "NO", y+2);
                  }

               }
           break;
           //
           case "sel_Period_From":

                if (v_CtrlValue < 0)
                {
                     of_selectRecord("sel_FY_To", v_DefaultValue);
                     of_setSingleValue("sel_Period_To", v_DefaultValue, v_Default_To,"YES", 0);
                }
               else
                {
                     v_FY_To = sel_FY_To.options[sel_FY_To.options.selectedIndex].value;

                     if (v_FY_To < 0)
                     {
                        of_setSingleValue("sel_Period_To", v_DefaultValue, v_Default_To,"YES", 0);
                     }
                     else
                     {
                         v_SP_Call = "NMARS.NM_PM_COMPNATNLBYSITE.sp_getPeriodsTo?p_FY_To="+v_FY_To+
                                                                                "&p_Period_Ptr_From="+v_CtrlValue;

                         objAJAX.load(v_SP_Call);

                         orgBfr_PeriodTo.length = 0;

                         if (objAJAX.parsed)
                         {
                               v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
                               v_NumberOfRecords = v_ArrayOfRecords.length; //alert(v_NumberOfRecords)
                               //
                               for (var r=0; r<v_NumberOfRecords; r++)
                               {
                                   v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
                                   orgBfr_PeriodTo[r] = new array_Periods( v_ArrayOfValuesInRecord[0].text,  // a_period_ptr
                                                                           v_ArrayOfValuesInRecord[1].text,  // a_fy
                                                                           v_ArrayOfValuesInRecord[2].text,  // a_ap
                                                                           v_ArrayOfValuesInRecord[3].text,  // a_wk
                                                                           v_ArrayOfValuesInRecord[4].text,  // a_start_date
                                                                           v_ArrayOfValuesInRecord[5].text   // a_end_date
                                                                          );
                               }
                         }
                         //
                         // 3. Output selected values into "sel_Period_To":
                         of_setSingleValue("sel_Period_To", v_DefaultValue, v_Default_To, "YES", 0);
                         of_setSingleValue("sel_Period_To",
                                           v_DefaultValue*2,
                                           "Period | Week | Start Date | End Date", "NO", 1);
                         for (var y=0; y<orgBfr_PeriodTo.length; y++)
                         {
                             of_setSingleValue("sel_Period_To",
                                               orgBfr_PeriodTo[y].a_period_ptr,
                                               " "+orgBfr_PeriodTo[y].a_ap+"       "+
                                               orgBfr_PeriodTo[y].a_wk+"     "+
                                               orgBfr_PeriodTo[y].a_start_date+" - "+
                                               orgBfr_PeriodTo[y].a_end_date,
                                               "NO", y+2);
                         }
                     }
                }
           //
           break;
           //
           case "sel_FY_To":
               if (v_CtrlValue < 0)
               {
                  of_setSingleValue("sel_Period_To", v_DefaultValue, v_Default_To,"YES", 0);
               }
               else
               {
                  v_Period_From = sel_Period_From.options[sel_Period_From.options.selectedIndex].value;

                  if (v_Period_From <0)
                  {
                     of_setSingleValue("sel_Period_To", v_DefaultValue, v_Default_To,"YES", 0);
                  }
                  else
                  {
                      v_SP_Call = "NMARS.NM_PM_COMPNATNLBYSITE.sp_getPeriodsTo?p_FY_To="+v_CtrlValue+
                                                                             "&p_Period_Ptr_From="+v_Period_From;

                      objAJAX.load(v_SP_Call);


                       if (objAJAX.parsed)
                       {
                             v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
                             v_NumberOfRecords = v_ArrayOfRecords.length; //alert(v_NumberOfRecords)
                             //
                             for (var r=0; r<v_NumberOfRecords; r++)
                             {
                                 v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
                                 orgBfr_PeriodTo[r] = new array_Periods( v_ArrayOfValuesInRecord[0].text,  // a_period_ptr
                                                                         v_ArrayOfValuesInRecord[1].text,  // a_fy
                                                                         v_ArrayOfValuesInRecord[2].text,  // a_ap
                                                                         v_ArrayOfValuesInRecord[3].text,  // a_wk
                                                                         v_ArrayOfValuesInRecord[4].text,  // a_start_date
                                                                         v_ArrayOfValuesInRecord[5].text   // a_end_date
                                                                        );
                             }
                       }
                       //
                       // 3. Output selected values into "sel_Period_To":
                       of_setSingleValue("sel_Period_To", v_DefaultValue, v_Default_To, "YES", 0);
                       of_setSingleValue("sel_Period_To",
                                         v_DefaultValue*2,
                                         "Period | Week | Start Date | End Date", "NO", 1);
                       for (var y=0; y<orgBfr_PeriodTo.length; y++)
                       {
                           of_setSingleValue("sel_Period_To",
                                             orgBfr_PeriodTo[y].a_period_ptr,
                                             " "+orgBfr_PeriodTo[y].a_ap+"       "+
                                             orgBfr_PeriodTo[y].a_wk+"     "+
                                             orgBfr_PeriodTo[y].a_start_date+" - "+
                                             orgBfr_PeriodTo[y].a_end_date,
                                             "NO", y+2);
                       }


                  }
               }
           break;
           //
           case "sel_NADSsearch":

               of_getCtrlProperties(arg_CtrlName);
               //
               if (v_CtrlValue == "-1")
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

           break;
           //
      }
}}
//------------------------------------------------------------------------------
');
htp.p('
//------------------------------------------------------------------------------
function f_Validation_DataPresence()
{
// NOTE: arrayCtrlNames is defined above.

    v_ValidationPassed = "YES";

    for (var c=0; c<arrayCtrlNames.length; c++) //c - for "control"
      {
          of_getCtrlProperties(arrayCtrlNames[c]);

          if (
                   (v_CtrlType == "select-one" && (v_CtrlValue == "-1" || v_CtrlValue == "-2"))
                   ||
                   (v_CtrlType == "text" && v_CtrlValue == "")
               )
          {
              alert("System cannot process your request.\n"+"A value from the field ''"+v_CtrlAlt+"'' has not been selected.");
              v_ValidationPassed = "NO";
              //eval(v_CtrlName+".focus()");
              break;
          }
      }
    return v_ValidationPassed;
}
//------------------------------------------------------------------------------
');
htp.p('
//------------------------------------------------------------------------------
// "sel_FY_From", "sel_FY_To", "sel_Period_From", "sel_Period_To"

function f_getNatnlBySite(){with(self.document.forms[0])
{
    var v_SP_Call = "NMARS.NM_PM_COMPNATNLBYSITE.sp_getNatnlBySite?";
    //var v_SP_Call_Test = "NMARS.NM_PM_COMPNATNLBYSITE.sp_getNatnlBySite?";

    var v_Name = "";
    var v_Out = "";

    //var v_Color1 = "#faf9da";
    //var v_Color2 = "#e3e3e3";

    //var v_NumTemp = 0;
    //---------------------------

    of_outPut("td_Output", "&nbsp;");
    of_outPut("td_Navigation2", "&nbsp;");

    //---------------------------
    for (var r=0; r<arrayPeriod_Ptr.length; r++)
    {
        //v_Name removes the first 4 charecters from the control name, ex: "sel_FY_From" becomes "FY_From".
          v_Name = arrayPeriod_Ptr[r].substr(4);

        //v_SP_Call builds a list of parameters to be passed to the stored procedure adding "p_" to the v_Name,
          // ex: "FY_From" becomes "p_FY_From".

          v_SP_Call = v_SP_Call+"p_"+v_Name+"="+document.getElementById(arrayPeriod_Ptr[r]).value+"&";
        //v_SP_Call_Test = v_SP_Call_Test+"p_"+v_Name+"="+document.getElementById(arrayPeriod_Ptr[r]).value+"&\n";
    }

    //Removing the last "&" from the value of v_SP_Call.
    v_SP_Call = v_SP_Call.substr(0,v_SP_Call.length-1);
    //v_SP_Call_Test = v_SP_Call_Test.substr(0,v_SP_Call_Test.length-1);
    //alert(v_SP_Call_Test+"\n"+v_SP_Call)

    of_outPut("td_Output", "&nbsp;");
    of_outPut("td_Navigation2", "&nbsp;");

    v_Out = "<table width=''100%'' border=''0'' cellpadding=''2'' cellspacing=''2''>";
    v_Out = v_Out+"<tr class=''Ctrl_Title_10_Bold''>";
          //1 route_type:
          v_Out = v_Out+''<td>ROUTE TYPE</td>'';

          //2 site_id:
          v_Out = v_Out+''<td align="right">SITE ID</td>'';

          //3 facility_name:
          v_Out = v_Out+''<td align="left">SITE NAME</td>'';

          //4 finance_no:
          v_Out = v_Out+''<td>FINANCE NUM.</td>'';

          //5 machine_type:
          v_Out = v_Out+''<td align="left">ACRONYM</td>'';

                      ////6 report_order:
                      //v_Out = v_Out+''<td>REPORT ORDER</td>'';

          //7 numscheduled:
          v_Out = v_Out+''<td align="right">SCHEDULED</td>'';

          //8 closed:
          v_Out = v_Out+''<td>COMP</td>'';

          //9 closed percent
          v_Out = v_Out+''<td>COMP %</td>'';

          //10 bypassed:
          v_Out = v_Out+''<td>BYPASSED</td>'';

          //11 bypassed percent:
          v_Out = v_Out+''<td>BYPASSED %</td>'';

          ////12 bypasscode9:
          //v_Out = v_Out+''<td>bypasscode9</td>'';

          //13 partial:
          v_Out = v_Out+''<td>PARTIAL</td>'';

          //14 partial percent:
          v_Out = v_Out+''<td>PARTIAL %</td>'';

          //15 hoursscheduled:
          v_Out = v_Out+''<td>HRS SCHED</td>'';

          //16 hoursused:
          v_Out = v_Out+''<td>HRS USED</td>'';

          //17 hoursused_percent:
          v_Out = v_Out+''<td>HRS USED %</td>'';

    v_Out = v_Out+"</tr>";

    v_Out = v_Out+"<tr class=''Ctrl_Title_10_Bold''>";
          //1 route_type:
          v_Out = v_Out+''<td align="center">(A)</td>'';

          //2 site_id:
          v_Out = v_Out+''<td align="center">(B)</td>'';

          //3 facility_name:
          v_Out = v_Out+''<td align="center">(C)</td>'';

          //4 finance_no:
          v_Out = v_Out+''<td align="center">(D)</td>'';

          //5 machine_type:
          v_Out = v_Out+''<td align="left">(E)</td>'';

                      ////6 report_order:
                      //v_Out = v_Out+''<td>REPORT ORDER</td>'';

          //7 numscheduled:
          v_Out = v_Out+''<td align="center">(F)</td>'';

          //8 closed:
          v_Out = v_Out+''<td align="center">(G)</td>'';

          //9 closed percent
          v_Out = v_Out+''<td align="center">(H)</td>'';

          //10 bypassed:
          v_Out = v_Out+''<td align="center">(I)</td>'';

          //11 bypassed percent:
          v_Out = v_Out+''<td align="center">(J)</td>'';

          ////12 bypasscode9:
          //v_Out = v_Out+''<td align="center">bypasscode9</td>'';

          //13 partial:
          v_Out = v_Out+''<td align="center">(K)</td>'';

          //14 partial percent:
          v_Out = v_Out+''<td align="center">(L)</td>'';

          //15 hoursscheduled:
          v_Out = v_Out+''<td align="center">(M)</td>'';

          //16 hoursused:
          v_Out = v_Out+''<td align="center">(N)</td>'';

          //17 hoursused_percent:
          v_Out = v_Out+''<td align="center">(O)</td>'';

    v_Out = v_Out+"</tr>";

    objAJAX.load(v_SP_Call);

    if (objAJAX.parsed)
    {
          v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
          v_NumberOfRecords = v_ArrayOfRecords.length;
          //TEST: alert("v_NumberOfRecords = "+v_NumberOfRecords);

          for (var r=0; r<v_NumberOfRecords; r++)
          {//1.

               v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;

               v_Out = v_Out+''<tr class="Ctrl_Title_10_Norm">'';
                     //1 route_type:
                     if (v_ArrayOfValuesInRecord[0].text == "DAILIES")
                     { v_Out = v_Out+''<td align="left">''+v_ArrayOfValuesInRecord[0].text+''</td>'';}  // route_type
                     else if (v_ArrayOfValuesInRecord[0].text == "SENIORS")
                     { v_Out = v_Out+''<td align="left">&nbsp;&nbsp;&nbsp;''+v_ArrayOfValuesInRecord[0].text+''</td>'';}  // route_type

                     //2 site_id:
                     v_Out = v_Out+''<td align="right">(''+v_ArrayOfValuesInRecord[1].text+'')</td>''; // site_id

                     //3 facility_name:
                     v_Out = v_Out+''<td align="left">''+v_ArrayOfValuesInRecord[2].text+''</td>'';    // facility_name = site name

                     //4 finance_no:
                     v_Out = v_Out+''<td align="center">''+v_ArrayOfValuesInRecord[3].text+''</td>'';  // finance_no

                     //5 machine_type:
                     v_Out = v_Out+''<td align="left">''+v_ArrayOfValuesInRecord[4].text+''</td>'';    // machine_type = acronym

                     ////6 report_order:
                     //v_Out = v_Out+''<td>''+v_ArrayOfValuesInRecord[5].text+''</td>'';  // report_order

                     //7 numscheduled:
                     v_Out = v_Out+''<td align="right">''+v_ArrayOfValuesInRecord[6].text+''</td>'';  // numscheduled

                     //8 closed:
                     v_Out = v_Out+''<td>''+v_ArrayOfValuesInRecord[7].text+''</td>'';  // closed
                     //9 closed percent:
                     v_Out = v_Out+''<td>''+v_ArrayOfValuesInRecord[8].text+''</td>'';  // closed_percent

                     //10 bypassed:
                     v_Out = v_Out+''<td>''+v_ArrayOfValuesInRecord[9].text+''</td>'';  // bypassed
                     //11 bypassed percent:
                     v_Out = v_Out+''<td>''+v_ArrayOfValuesInRecord[10].text+''</td>'';  // bypassed_percent

                     ////12 bypasscode9:
                     //v_Out = v_Out+''<td>''+v_ArrayOfValuesInRecord[11].text+''</td>'';  // bypasscode9

                     //13 partial:
                     v_Out = v_Out+''<td>''+v_ArrayOfValuesInRecord[12].text+''</td>''; // partial
                     //14 partial percent:
                     v_Out = v_Out+''<td>''+v_ArrayOfValuesInRecord[13].text+''</td>''; // partial_percent

                     //15 hoursscheduled:
                     v_Out = v_Out+''<td align="right">''+v_ArrayOfValuesInRecord[14].text+''</td>''; // hoursscheduled

                     //16 hoursused:
                     v_Out = v_Out+''<td align="right">''+v_ArrayOfValuesInRecord[15].text+''</td>''; // hoursused

                     //17 hoursused_percent:
                     v_Out = v_Out+''<td align="right">''+v_ArrayOfValuesInRecord[16].text+''</td>''; // hoursused_percent

               v_Out = v_Out+''</tr>'';

               if ( r == 0 )
               {
                  h_Random_Num.value = v_ArrayOfValuesInRecord[17].text;

               }
          }//1.
    }

    v_Out = v_Out+''</table>'';
    of_outPut("td_Output", v_Out);

    v_Out = ''<table>''+
                ''<tr>''+
                    ''<td id="td_Navigation2" align="center">''+
                        ''<input name="cb_Reset2"''+
                                   ''id="cb_Reset2"''+
                                   ''onclick="f_onClick(this.name);"''+
                                   ''type="button"''+
                                   ''tabindex=""''+
                                   ''value="RESET"/>''+
                        ''&nbsp;&nbsp;&nbsp;''+
                        ''<input name="cb_MainMenu2"''+
                               ''id="cb_MainMenu2"''+
                               ''onclick="f_onClick(this.name);"''+
                               ''type="button"''+
                               ''tabindex=""''+
                               ''value="MAIN MENU"/>''+
                        ''&nbsp;&nbsp;&nbsp;''+
                        ''<input name="cb_Exit2"''+
                               ''id="cb_Exit2"''+
                               ''onclick="f_onClick(this.name);"''+
                               ''type="button"''+
                               ''tabindex=""''+
                               ''value="EXIT"/>''+
                    ''</td>''+
                ''</tr>''+
             ''</table>'';

    of_outPut("td_Navigation2", v_Out);

}}
//------------------------------------------------------------------------------
');
htp.p('
//------------------------------------------------------------------------------
// "sel_FY_From", "sel_FY_To", "sel_Period_From", "sel_Period_To"
function f_resetScreen(){with(self.document.forms[0])
{
     of_setSingleValue("txt_NADSsearch",    "''''",  "''''", "''''", 0);
     of_setSingleValue("sel_NADSsearch", v_DefaultValue, v_Default_Search, "YES", 0)
     of_selectRecord("sel_NADSsearch", sel_NADSsearch.options[0].value);

     of_selectRecord("sel_NADS", sel_NADS.options[0].value);

     of_outPut("td_Output",      "&nbsp;");
     of_outPut("td_Navigation2", "&nbsp;");
     of_outPut("span_getExcel1", "&nbsp;");
     of_outPut("span_Excel_Msg1","&nbsp;");
     of_setSingleValue("h_Random_Num",    "''''",  "''''", "''''", 0);

     of_setSingleValue("sel_FY_From", v_DefaultValue,  "Select Year - FROM", "YES", 0);
     of_setSingleValue("sel_FY_From", v_CurrentYear-2, v_CurrentYear-2, "NO", 1);
     of_setSingleValue("sel_FY_From", v_CurrentYear-1, v_CurrentYear-1, "NO", 2);
     of_setSingleValue("sel_FY_From", v_CurrentYear,   v_CurrentYear,   "NO", 3);
     of_setSingleValue("sel_FY_From", v_CurrentYear+1, v_CurrentYear+1, "NO", 4);

     of_setSingleValue("sel_Period_From", v_DefaultValue, v_Default_From,     "YES", 0);
     of_setSingleValue("sel_FY_To",       v_DefaultValue, "Select Year - TO  ", "YES", 0);
     of_setSingleValue("sel_Period_To",   v_DefaultValue, v_Default_To,       "YES", 0);

     of_selectRecord("sel_FY_From",     v_DefaultValue);
     of_selectRecord("sel_FY_To",       v_DefaultValue);
     of_selectRecord("sel_Period_From", v_DefaultValue);
     of_selectRecord("sel_Period_To",   v_DefaultValue);

}}
//------------------------------------------------------------------------------
');
htp.p('
//------------------------------------------------------------------------------

//PAGE SPECIFIC FUNCTIONS ends =================================================
//==============================================================================
</SCRIPT><!--- SCRIPT 1 ends --->
');
htp.p('</HEAD>');
htp.p('
<STYLE TYPE="text/css">
    DIV.MenuHead {
       background-color: #DCDCDC;
       font-size: 32;
       color:navy;
       font-weight: bold;
       font-family: arial;
       text-align: center;
       border-style: outset;
    }

    .Select_Options {
       font-family:''Courier New'', Courier, monospace;
       font-size:12px;
    }

    .Ctrl_Title_12_Bold {
       font-family:Verdana, Geneva, sans-serif;
       font-size:12px;
       font-weight:bold;
    }

    .Ctrl_Title_10_Norm {
       font-family:Verdana, Geneva, sans-serif;
       font-size:12px;
    }

    .Ctrl_Title_10_Bold {
       font-family:Verdana, Geneva, sans-serif;
       font-size:12px;
       font-weight:bold;
    }

    .Ctrl_Title_14 {
       font-family:Verdana, Geneva, sans-serif;
       font-size:14px;
       font-weight:bold;
    }

</STYLE>
');
htp.p('<BODY>');
htp.p('
<FORM name="form1" action="" method="POST">
<DIV id="div_MenuHead" class="MenuHead"><br />PM Completion: National By Site<br /><br /></DIV>

<table width="100%" border="0">
    <tr bgcolor="#CCCCCC">
       <td width="30%">
             <input type="text"
                    name="txt_NADSsearch"
                    id="txt_NADSsearch"
                    size="20" />
             <input type="button"
                    name="cb_NADSsearch"
                    id="cb_NADSsearch"
                    value="Search of Area / Distr / Site"
                    onclick="f_onClick(this.name);" />
             <br />
             <font class="Ctrl_Title_10_Bold">
             Search results:
             </font>
             <br />
             <select name="sel_NADSsearch"
                     id="sel_NADSsearch"
                     onchange="f_onChange(this.name);"
                     size="4"
                     tabindex="2"
                     style="font-family:''Courier New'', Courier, monospace;">
                <option value="-1">___Search results will be listed here_____</option>
             </select>
             <br />
             <br />
             <font class="Ctrl_Title_10_Bold">
             Hierarchical view at Areas, Districts, and Sites
             </font>
             <br />
             <select name="sel_NADS"
                     id="sel_NADS"
                     alt="Hierarchical view at Areas, Districts, and Sites"
                     onchange="f_onChange(this.name);"
                     size="20"
                     tabindex=""
                     style="font-family:''Courier New'', Courier, monospace;">
                <option value="NTNL">Select Area, District, or Site</option>
             </select>
             <br /><br />
       </td>
       <td valign=top">
             <table width="100%" border="0">
                  <tr>
                      <td valign=top">
                             <font class="Ctrl_Title_14">FROM:</font>
                             <br />
                             <font class="Ctrl_Title_10_Norm">(consider Start Date)</font>
                      </td>
                      <td>
                             <font class="Ctrl_Title_12_Bold">Fyscal Year:</font>
                             <font class="Ctrl_Title_10_Norm">(Step 1)</font>
                             <select id="sel_FY_From"
                                     name="sel_FY_From"
                                     size="1"
                                     alt="Select Year - FROM"
                                     tabindex=""
                                     onChange="f_onChange(this.name);"
                                     class="Select_Options">
                                 <option value="-1" selected="selected">Select Year - FROM</option>"
                             </select>
                      </td>
                      <td>
                             <font class="Ctrl_Title_12_Bold">Period:</font>
                             <font class="Ctrl_Title_10_Norm">(Step 2)</font>
                             <select id="sel_Period_From"
                                     name="sel_Period_From"
                                     size="1"
                                     alt="Select Period - FROM"
                                     tabindex=""
                                     onChange="f_onChange(this.name);"
                                     class="Select_Options">
                             </select>
                      </td>
                  </tr>
                  <tr>
                      <td>
                             <font class="Ctrl_Title_14">TO:</font>
                             <br />
                             <font class="Ctrl_Title_10_Norm">(consider End Date)</font>
                      </td>
                      <td>
                             <font class="Ctrl_Title_12_Bold">Fyscal Year:</font>
                             <font class="Ctrl_Title_10_Norm">(Step 3)</font>
                             <select id="sel_FY_To"
                                     name="sel_FY_To"
                                     size="1"
                                     alt="Select Year - &nbsp;&nbsp;TO"
                                     tabindex=""
                                     onChange="f_onChange(this.name);"
                                     class="Select_Options">
                                  <option value="-1" selected="selected">Select Year - TO  </option>"
                             </select>
                      </td>
                      <td>
                             <font class="Ctrl_Title_12_Bold">Period:</font>
                             <font class="Ctrl_Title_10_Norm">(Step 4)</font>
                             <!--- <br /> --->
                             <select id="sel_Period_To"
                                     name="sel_Period_To"
                                     size="1"
                                     alt="Select Period - TO"
                                     tabindex=""
                                     onChange="f_onChange(this.name);"
                                     class="Select_Options">
                             </select>
                      </td>
                  </tr>
                  <tr>
                     <td colspan="3">
                          <br />
                          <table width="100%" border="0">
                                <tr valign="top">
                                    <td width="10%">
                                        <input name="cb_Execute"
                                               id="cb_Execute"
                                               onclick="f_onClick(this.name);"
                                               type="button"
                                               tabindex=""
                                               value="EXECUTE"/>
                                         <input type="hidden" id="h_Random_Num" name="h_Random_Num" value="" />
                                    </td>
                                    <td width="10%">
                                         <span id="span_getExcel1">&nbsp;</span>
                                    </td>
                                    <td><span id="span_Excel_Msg1" class="Ctrl_Title_10_Norm">&nbsp;</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input name="cb_Reset1"
                                               id="cb_Reset1"
                                               onclick="f_onClick(this.name);"
                                               type="button"
                                               tabindex=""
                                               value="&nbsp;&nbsp;&nbsp;RESET&nbsp;&nbsp;&nbsp;"/>
                                    </td>
                                    <td>
                                        <input name="cb_MainMenu1"
                                               id="cb_MainMenu1"
                                               onclick="f_onClick(this.name);"
                                               type="button"
                                               tabindex=""
                                               value="MAIN MENU"/>
                                    </td>
                                    <td>
                                        <input name="cb_Exit1"
                                               id="cb_Exit1"
                                               onclick="f_onClick(this.name);"
                                               type="button"
                                               tabindex=""
                                               value="EXIT"/>
                                    </td>
                                </tr>
                          </table>
                     </td>
                  </tr>
            </table>
       </td>
    </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td id="td_Output" align="center">td_Output</td>
  </tr>
  <tr>
    <td id="td_Navigation2" align="center">td_Navigation2</td>
  </tr>
</table>



</FORM>
<SCRIPT language="javascript" type="text/javascript"><!--- SCRIPT 2 starts --->
//
f_getNADS();
f_resetScreen();
//
</SCRIPT><!--- SCRIPT 2 ends --->
');
htp.p('</BODY>');

END pm_criteria;
--==============================================================================
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
v_MaxStrLength NUMBER DEFAULT 0;
v_ID VARCHAR(50);
--------------------------------------------------------------------------------
BEGIN
--------------------------------------------------------------------------------
-- NEW CODE:
    INSERT INTO NMARS.AREA_DIST_SITE_HIERARCHY_TEMP
           (parent_id, option_value, option_text, based_on)
    SELECT NULL as parent_id
           ,'NTNL' as option_value
           ,'NATIONAL' as option_text
           ,'NTNL' as based_on
    from dual
    UNION
    -- AREA:
    SELECT 'NTNL' as parent_id
           ,a.area_code||'_AREA' as option_value
           ,a.area_name  as option_text
           ,'AREA' as based_on
      FROM emdba.em_area_t a
     WHERE a.area_code LIKE '1%'
       AND a.area_status_code = 'A'
    UNION
    -- DISTRICT
      SELECT site.area||'_AREA' as parent_id
             ,site.district_code||'_DIST' as option_value
             ,dist.district_name as option_text
             ,'DIST' as based_on
       FROM emdba.em_site_t site,
            emdba.em_area_t area,
            emdba.em_district_code_t dist,
            emdba.em_subsite_t sb
      WHERE site.site_id BETWEEN 1 AND 550
        AND site.site_id <> 303
        AND site.site_status_code ='A'
        AND site.area=area.area_code
        ---
        AND site.district_code=dist.district_code
        ---
        AND area.area_code LIKE '1%'
        AND area.area_status_code = 'A'
        ---
        AND site.site_id = sb.site_id
        AND site.site_status_code != 'I'
        AND site.site_id > 0 -- this line excludes "ADMINISTRATION"
        AND sb.default_flag = 'Y'
        AND sb.subsite_id = '00'
        ---
    UNION
    -- SITE:
      SELECT site.district_code||'_DIST' as parent_id
             ,TO_CHAR(site.site_id)||'_SITE' as option_value
             ,site.site_name as option_text
             ,'SITE' as based_on
       FROM emdba.em_site_t site,
            emdba.em_area_t area,
            emdba.em_district_code_t dist,
            emdba.em_subsite_t sb
      WHERE site.site_id BETWEEN 1 AND 550
        AND site.site_id <> 303
        AND site.site_status_code ='A'
        AND site.area=area.area_code
        ---
        AND site.district_code=dist.district_code
        ---
        AND area.area_code LIKE '1%'
        and area.area_status_code = 'A'
        ---
        AND site.site_id = sb.site_id
        AND site.site_status_code != 'I'
        AND site.site_id > 0 -- this line excludes "ADMINISTRATION"
        AND sb.default_flag = 'Y'
        AND sb.subsite_id = '00'
        ---
        ;
--------------------------------------------------------------------------------
select MAX(LENGTH(option_text))
  into v_MaxStrLength
  from NMARS.AREA_DIST_SITE_HIERARCHY_TEMP;

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
  from NMARS.AREA_DIST_SITE_HIERARCHY_TEMP
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
COMMIT;
--------------------------------------------------------------------------------
/*
--------------------------------------------------------------------------------
-- ORIGINAL CODE:
select MAX(LENGTH(option_text))
  into v_MaxStrLength
  from emdba.area_dist_site_hierarchy_mv
;
--------------------------------------------------------------------------------
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
*/
END sp_getNADS;
--==============================================================================

PROCEDURE sp_getNatnlBySite ( p_NADS        IN VARCHAR2
                             ,p_Period_From IN emdba.em_ap_calendar_t.period_ptr%TYPE -- NUMBER
                             ,p_Period_To   IN emdba.em_ap_calendar_t.period_ptr%TYPE -- NUMBER
                             )
-- A guideline to create output is taken from ¿NMARS.nm_PM_COMPLETION.PM_COMP_BY_SITE¿
-- Format of p_NADS: "25_SITE", or "210_DIST", or "1K_AREA"
-- "NADS" stands for National / Area / District / Site
IS
-------------------------------------------------------------------------------
v_Site_ID EMDBA.EM_SITE_T.SITE_ID%TYPE;       -- NUMBER DEFAULT NULL;
-------------------------------------------------------------------------------
v_NADS   VARCHAR2(100) default ''; -- Will be used to determine: either 'AREA', or 'DIST', or 'SITE'.

v_NADS_Area_ID EMDBA.EM_SITE_T.AREA%TYPE;          -- VARCHAR2(2);
-- p_NADS = v_NADS||'_'||v_NADS_Area_ID; if v_NADS = 'AREA';

v_NADS_Dist_ID EMDBA.EM_SITE_T.DISTRICT_CODE%TYPE; -- VARCHAR2(3)
-- p_NADS = v_NADS||'_'||v_NADS_Dist_ID; if v_NADS = 'DIST';

v_NADS_Site_ID EMDBA.EM_SITE_T.SITE_ID%TYPE;       -- NUMBER DEFAULT NULL;
-- p_NADS = v_NADS||'_'||v_NADS_Site_ID; if v_NADS = 'SITE';

v_ListOfSiteIDs VARCHAR2(1000) DEFAULT NULL;
v_Comma VARCHAR2(5) default ',';
-------------------------------------------------------------------------------
v_Date_Closed_From NUMBER;
v_Date_Closed_To   NUMBER;
-------------------------------------------------------------------------------
v_Closed_Percent    NUMBER;
v_Bypassed_Percent  NUMBER;
v_Partial_Percent   NUMBER;
v_Hoursused         NUMBER;
v_Hoursused_Percent NUMBER;
v_Random_Num        NUMBER;
v_Record_Num        NUMBER default 1;
-------------------------------------------------------------------------------
BEGIN
-------------------------------------------------------------------------------
-- I:
-- I.1:
         SELECT substr(p_NADS,Instr(p_NADS,'_')+1)
           INTO v_NADS -- Possible results: 'AREA', or 'DIST', or 'SITE'.
           FROM dual;
-- I.2.1
         IF v_NADS = 'AREA' THEN
                -- a:
                SELECT substr(p_NADS, 1, Instr(p_NADS,'_')-1)
                  INTO v_NADS_Area_ID
                  FROM dual;
                -- b:
                FOR r_Value IN ( SELECT s.site_id AS Site_Id
                                        --,s.site_name AS site_name,
                                        --s.site_name ||', '||s.state||' - '||s.psdsno||sb.SUBSITE_ID site_name
                                        -- '('||LPad(s.site_id,3,'.')||') '||s.site_name AS site_name_show
                                   FROM  EMDBA.em_site_t s,
                                         EMDBA.em_subsite_t sb
                                   WHERE s.site_id = sb.site_id
                                     AND s.site_status_code != 'I'
                                     AND s.site_id > 0 -- this line excludes "ADMINISTRATION"
                                     AND sb.default_flag = 'Y'
                                     AND sb.subsite_id = '00'
                                     ---
                                     AND s.area = v_NADS_Area_ID
                                     ---
                                   ORDER BY SITE_NAME
                               )
               LOOP
                 v_ListOfSiteIDs := v_ListOfSiteIDs||v_Comma||TO_CHAR(r_Value.Site_Id);
               END LOOP;
-- I.2.2
         ELSIF v_NADS = 'DIST' THEN
                -- a:
                SELECT substr(p_NADS, 1, Instr(p_NADS,'_')-1)
                  INTO v_NADS_Dist_ID
                  FROM dual;
                -- b:
                FOR r_Value IN ( SELECT s.site_id AS Site_Id
                                        --,s.site_name AS site_name,
                                        --s.site_name ||', '||s.state||' - '||s.psdsno||sb.SUBSITE_ID site_name
                                        -- '('||LPad(s.site_id,3,'.')||') '||s.site_name AS site_name_show
                                   FROM  EMDBA.em_site_t s,
                                         EMDBA.em_subsite_t sb
                                   WHERE s.site_id = sb.site_id
                                     AND s.site_status_code != 'I'
                                     AND s.site_id > 0 -- this line excludes "ADMINISTRATION"
                                     AND sb.default_flag = 'Y'
                                     AND sb.subsite_id = '00'
                                     ---
                                     AND s.district_code = v_NADS_Dist_ID
                                     ---
                                   ORDER BY SITE_NAME
                               )
               LOOP
                 v_ListOfSiteIDs := v_ListOfSiteIDs||v_Comma||TO_CHAR(r_Value.Site_Id);
               END LOOP;
-- I.2.3
         ELSIF v_NADS = 'SITE' THEN
                -- a:
                SELECT substr(p_NADS, 1, Instr(p_NADS,'_')-1)
                  INTO v_NADS_Site_ID
                  FROM dual;
                -- b:
                FOR r_Value IN ( SELECT s.site_id AS Site_Id
                                        --,s.site_name AS site_name,
                                        --s.site_name ||', '||s.state||' - '||s.psdsno||sb.SUBSITE_ID site_name
                                        -- '('||LPad(s.site_id,3,'.')||') '||s.site_name AS site_name_show
                                   FROM  EMDBA.em_site_t s,
                                         EMDBA.em_subsite_t sb
                                   WHERE s.site_id = sb.site_id
                                     AND s.site_status_code != 'I'
                                     AND s.site_id > 0 -- this line excludes "ADMINISTRATION"
                                     AND sb.default_flag = 'Y'
                                     AND sb.subsite_id = '00'
                                     ---
                                     AND s.site_id = v_NADS_Site_ID
                                     ---
                                   ORDER BY SITE_NAME
                               )
               LOOP
                 v_ListOfSiteIDs := v_ListOfSiteIDs||v_Comma||TO_CHAR(r_Value.Site_Id);
               END LOOP;
         END IF;
-- I.3  Remove ',' in front of the string v_ListOfSiteIDs:
         SELECT substr(v_ListOfSiteIDs,2)
           INTO v_ListOfSiteIDs
           FROM dual;
-------------------------------------------------------------------------------
         SELECT fy||ap
           INTO v_Date_Closed_From
           FROM EMDBA.em_ap_calendar_t c
          WHERE c.period_ptr = p_Period_From;

         SELECT fy||ap
           INTO v_Date_Closed_To
           FROM EMDBA.em_ap_calendar_t c
          WHERE c.period_ptr = p_Period_To;
-------------------------------------------------------------------------------

      FOR r_Site_ID IN ( select column_value as Site_Id
                           from table(NMARS.NM_EQUIP_MODS.f_convertStringToListOfVals(v_ListOfSiteIDs))
                       )
      --FOR r_Site_ID IN c_Sites
        LOOP
          v_Site_ID := r_Site_ID.Site_Id;
-------------------------------------------------------------------------------
-- Script below is based on the following stored procedures with some changes:
----pm_dailies_by_site(p_site_id,v_from_fyap,v_to_fyap);
----pm_seniors_by_site(p_site_id,v_from_fyap,v_to_fyap);
-------------------------------------------------------------------------------

-- 1. DAILIES starts ----------------------------------------------------------
-- 1.1
              INSERT INTO NMARS.nm_pm_comp_natnl_by_site_temp
                (route_type, site_id, facility_name, finance_no, machine_type, report_order, numscheduled,
                 closed, bypassed, bypasscode9, partial, hoursscheduled, hoursused)
              SELECT 'DAILIES' as route_type,
                     r.site_id,
                     -----
                     s.facility_name,
                     s.finance_no,
                     -----
                     r.machine_type,
                     Min(a.report_order) as report_order,
                     Sum(numscheduled)   as numscheduled,
                     Sum(closed)         as closed,
                     Sum(bypassed)       as bypassed,
                     Sum(bypasscode9)    as bypasscode9,
                     Sum(partial)        as partial,
                     Sum(hoursScheduled) as hoursScheduled,
                     Sum(hoursUsed)      as hoursUsed
                FROM NMARS.nm_pm_rollup_comp_t r,
                     EMDBA.em_acronym_t a
                     -----
                    ,EMDBA.EM_SUBSITE_FACILITY_T s
                     -----
                WHERE r.site_id = a.site_id
                  AND r.site_id = v_Site_ID --490 --cp_site_id
                  AND r.equip_cat_ptr = a.equip_cat_ptr
                  AND wo_type_code = 'D'
                  AND a.group_code = 'A'
                  AND date_closed BETWEEN v_Date_Closed_From --200801 --cp_from_fyap
                                      AND v_Date_Closed_To   --200801 --cp_to_fyap
                  AND numscheduled - bypasscode9 > 0
                  -----
                  AND r.site_id = s.site_id
                  AND s.subsite_id = '00'
                  AND s.subsite_default_yn = 'Y'
                  -----
                GROUP BY  r.site_id, s.facility_name, r.machine_type, s.finance_no
                ;
 -- 1.2
               INSERT INTO NMARS.nm_pm_comp_natnl_by_site_temp
                (route_type, site_id, facility_name, finance_no, machine_type, report_order, numscheduled,
                 closed, bypassed, bypasscode9, partial, hoursscheduled, hoursused)
               SELECT 'DAILIES' as route_type,
                      r.site_id,
                      -----
                      s.facility_name,
                      s.finance_no,
                      -----
                      g.group_desc,
                      Min(a.report_order),
                      Sum(numscheduled) numscheduled,
                      Sum(closed) closed,
                      Sum(bypassed) bypassed,
                      Sum(bypasscode9) bypasscode9,
                      Sum(partial) partial,
                      Sum(hoursScheduled) hoursScheduled,
                      Sum(hoursUsed) hoursUsed
                FROM nm_pm_rollup_comp_t r,
                      em_acronym_t a,
                      em_group_code_t g
                      -----
                     ,EMDBA.EM_SUBSITE_FACILITY_T s
                     -----
                WHERE r.site_id = a.site_id
                  AND r.equip_cat_ptr = a.equip_cat_ptr
                  AND a.group_code = g.group_code
                  AND r.site_id = v_Site_ID --490 --cp_site_id
                  AND wo_type_code = 'D'
                  AND a.group_code != 'A'
                  AND a.group_code != 'X'
                  AND date_closed BETWEEN v_Date_Closed_From --200801 --cp_from_fyap
                                      AND v_Date_Closed_To   --201201 --cp_to_fyap
                  AND numscheduled - bypasscode9 > 0
                  -----
                  AND r.site_id = s.site_id
                  AND s.subsite_id = '00'
                  AND s.subsite_default_yn = 'Y'
                  -----
                GROUP BY  r.site_id, s.facility_name, g.group_desc, s.finance_no
                ;

--- DAILIES ends -------------------------------------------------------------------
-- 2. SENIORS starts ---------------------------------------------------------------
-- 2.1
                 INSERT INTO NMARS.nm_pm_comp_natnl_by_site_temp
                            (route_type, site_id, facility_name, finance_no, machine_type, report_order, numscheduled,
                             closed, bypassed, bypasscode9, partial, hoursscheduled, hoursused)
                  SELECT 'SENIORS' AS route_type,
                         r.site_id,
                         -----
                         s.facility_name,
                         s.finance_no,
                         -----
                         r.machine_type,
                         Min(a.report_order),
                         Sum(numscheduled) numscheduled,
                         Sum(closed) closed,
                         Sum(bypassed) bypassed,
                         Sum(bypasscode9) bypasscode9,
                         Sum(partial) partial,
                         Sum(hoursScheduled) hoursScheduled,
                         Sum(hoursUsed) hoursUsed
                 FROM nm_pm_rollup_comp_t r,
                      em_acronym_t a
                      -----
                     ,EMDBA.EM_SUBSITE_FACILITY_T s
                      -----
                 WHERE r.site_id = a.site_id
                   AND r.equip_cat_ptr = a.equip_cat_ptr
                   AND r.site_id = v_Site_ID --490 --cp_site_id
                   AND wo_type_code = 'S'
                   AND a.group_code = 'A'
                   AND date_closed BETWEEN v_Date_Closed_From --200801 --cp_from_fyap
                                       AND v_Date_Closed_To   --201201 --cp_to_fyap
                   AND numscheduled - bypasscode9 > 0
                   -----
                   AND r.site_id = s.site_id
                   AND s.subsite_id = '00'
                   AND s.subsite_default_yn = 'Y'
                   -----
                 GROUP BY  r.site_id, s.facility_name, r.machine_type, s.finance_no
                 ;
            --  UNION ALL
            -- 2.2
                 INSERT INTO NMARS.nm_pm_comp_natnl_by_site_temp
                            (route_type, site_id, facility_name, finance_no, machine_type, report_order, numscheduled,
                             closed, bypassed, bypasscode9, partial, hoursscheduled, hoursused)
                  SELECT 'SENIORS' AS route_type,
                         r.site_id,
                          -----
                          s.facility_name,
                          s.finance_no,
                          -----
                         g.group_desc,
                         Min(a.report_order),
                         Sum(numscheduled) numscheduled,
                         Sum(closed) closed,
                         Sum(bypassed) bypassed,
                         Sum(bypasscode9) bypasscode9,
                         Sum(partial) partial,
                         Sum(hoursScheduled) hoursScheduled,
                         Sum(hoursUsed) hoursUsed
                    FROM nm_pm_rollup_comp_t r,
                         em_acronym_t a,
                         em_group_code_t g
                         -----
                        ,EMDBA.EM_SUBSITE_FACILITY_T s
                         -----
                   WHERE r.site_id = a.site_id
                     AND r.equip_cat_ptr = a.equip_cat_ptr
                     AND a.group_code = g.group_code
                     AND r.site_id = v_Site_ID --490 --cp_site_id
                     AND wo_type_code = 'S'
                     AND a.group_code != 'A'
                     AND a.group_code != 'X'
                     AND date_closed BETWEEN v_Date_Closed_From --200801 --cp_from_fyap
                                         AND v_Date_Closed_To   --201201 --cp_to_fyap
                     AND numscheduled - bypasscode9 > 0
                     -----
                     AND r.site_id = s.site_id
                     AND s.subsite_id = '00'
                     AND s.subsite_default_yn = 'Y'
                     -----
                   GROUP BY  r.site_id, s.facility_name, g.group_desc, s.finance_no
                 --ORDER BY 3
                 ;
                 END LOOP;
-- SENIORS ends ---------------------------------------------------------------

 -- Get a random number that will be used during retrieval of the Excel report:
     select dbms_random.random
       into v_Random_Num
       from dual;
 -- Delete "old" records from the table:
   delete NMARS.nm_pm_comp_natnl_by_site_excel
    where create_date < SYSDATE
    ;
-------------------------------------------------------------------------------
-- Output collected data to the screen:
htp.p('<?xml version="1.0"?><ROWSET>');
         FOR r_Record IN ( select route_type, site_id, facility_name, finance_no, machine_type,
                                  report_order, numscheduled, closed, bypassed, bypasscode9,
                                  partial, hoursscheduled, hoursused
                             from nm_pm_comp_natnl_by_site_temp
                             ORDER BY site_id, route_type, machine_type
                         )
         LOOP

           -----
           SELECT DECODE((r_Record.numscheduled - r_Record.bypasscode9),NULL,0,
                         0,0,
                         Round((r_Record.closed/(r_Record.numscheduled - r_Record.bypasscode9))*100,2))
             INTO v_Closed_Percent
             from dual;
           -----
           SELECT DECODE((r_Record.numscheduled - r_Record.bypasscode9), NULL, 0,
                          0,0,
                          Round((r_Record.bypassed/(r_Record.numscheduled - r_Record.bypasscode9))*100,2))
             INTO v_Bypassed_Percent
             FROM dual;
           -----
           SELECT DECODE((r_Record.numscheduled - r_Record.bypasscode9),NULL,0,
                         0,0,
                         Round((r_Record.partial/(r_Record.numscheduled - r_Record.bypasscode9))*100,2))
             INTO v_Partial_Percent
             FROM dual;
           -----
           SELECT DECODE(r_Record.hoursused, NULL,0,0,0,Round(r_Record.hoursused,2))
             INTO v_Hoursused
             FROM dual;
           -----
           SELECT DECODE(r_Record.hoursscheduled,NULL,0,
                         0,0,
                         Round((r_Record.hoursused/r_Record.hoursscheduled)*100,2))
             INTO v_Hoursused_Percent
             FROM dual;
           -----------------------------------------------------------------------------------------

           -- Create table header:
           /*
           IF v_Record_Num = 1 THEN
              INSERT INTO nm_pm_comp_natnl_by_site_excel
                (record_num, random_num, create_date, route_type, site_id, facility_name, finance_no, machine_type, numscheduled, closed, closed_percent, bypassed, bypassed_percent, partial, partial_percent, hoursscheduled, hoursused, hoursused_percent)
              VALUES
                (v_Record_Num, v_Random_Num, SYSDATE, 'ROUTE TYPE', 'SITE ID', 'SITE NAME', 'FINANCE NUMBER', 'ACRONYM',
                 'SCHEDULED', 'COMP', 'COMP %', 'BYPASSED', 'BYPASSED %', 'PARTIAL', 'PARTIAL %', 'HRS SCHED',
                 'HRS USED', 'HRS USED %');
           END IF;
           */
           -- Getting sequencial record number, populate table for the Excel report:
           v_Record_Num := v_Record_Num+1;

           INSERT INTO nm_pm_comp_natnl_by_site_excel
             (record_num, random_num, create_date, route_type, site_id, facility_name,
              finance_no, machine_type, numscheduled, closed, closed_percent,
              bypassed, bypassed_percent, partial, partial_percent,
              hoursscheduled, hoursused, hoursused_percent)
           VALUES
             (v_Record_Num, v_Random_Num, SYSDATE, r_Record.route_type, r_Record.site_id, r_Record.facility_name,
              r_Record.finance_no, r_Record.machine_type, r_Record.numscheduled, r_Record.closed, v_Closed_Percent,
              r_Record.bypassed, v_Bypassed_Percent, r_Record.partial, v_Partial_Percent,
              r_Record.hoursscheduled, v_Hoursused, v_Hoursused_Percent);

           -- Prepare data for the output on the screen in HTML format:
           -----------------------------------------------------------------------------------------
           htp.p('<ROW>'||
                       '<route_type>'       ||r_Record.route_type    ||'</route_type>'||       --1
                       '<site_id>'          ||r_Record.site_id       ||'</site_id>'||          --2
                       '<facility_name>'    ||r_Record.facility_name ||'</facility_name>'||    --3
                       '<finance_no>'       ||r_Record.finance_no    ||'</finance_no>'||       --4
                       '<machine_type>'     ||r_Record.machine_type  ||'</machine_type>'||     --5
                       '<report_order>'     ||r_Record.report_order  ||'</report_order>'||     --6
                       '<numscheduled>'     ||r_Record.numscheduled  ||'</numscheduled>'||     --7
                       '<closed>'           ||r_Record.closed        ||'</closed>'||           --8
                       '<closed_percent>'   ||v_Closed_Percent       ||'</closed_percent>'||   --9
                       '<bypassed>'         ||r_Record.bypassed      ||'</bypassed>'||         --10
                       '<bypassed_percent>' ||v_Bypassed_Percent     ||'</bypassed_percent>'|| --11
                       '<bypasscode9>'      ||r_Record.bypasscode9   ||'</bypasscode9>'||      --12
                       '<partial>'          ||r_Record.partial       ||'</partial>'||          --13
                       '<partial_percent>'  ||v_Partial_Percent      ||'</partial_percent>'||  --14
                       '<hoursscheduled>'   ||r_Record.hoursscheduled||'</hoursscheduled>'||   --15
                       '<hoursused>'        ||v_Hoursused            ||'</hoursused>'||        --16
                       '<hoursused_percent>'||v_Hoursused_Percent    ||'</hoursused_percent>'||--17
                       '<random_num>'       ||v_Random_Num           ||'</random_num>'||       --18
                  '</ROW>');
         END LOOP;
htp.p('</ROWSET>');


COMMIT;
-----------------------------------------------------------------------------------------
EXCEPTION
    WHEN OTHERS THEN
        htp.p('Error ID:'||sqlcode||'<BR>');
        htp.p('Error Description:'||sqlerrm);
          -- select * from ms47.MS47_SP_ERROR_LOG order by 1;
          ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                           ,'nm_pm_CompNatnlBySite.sp_getNatnlBySite'
                                                           ,-1
                                                           ,0
                                                           ,0
                                                           ,'x'
                                                           ,SQLCODE
                                                           ,SQLERRM
                                                          );
-----------------------------------------------------------------------------------------

END sp_getNatnlBySite;
--==============================================================================
--==============================================================================
PROCEDURE sp_getPeriodsFrom ( p_PostalFY_From IN VARCHAR2 DEFAULT NULL)
IS
--------------------------------------------------------------------------------
     CURSOR c_PeriodFrom IS
     SELECT c.period_ptr, c.fy, c.ap, c.wk,
            to_char(c.start_date,'MM/DD/YYYY') AS start_date,
            to_char(c.end_date,'MM/DD/YYYY')   AS end_date
       FROM EMDBA.EM_AP_CALENDAR_T c
      WHERE c.fy = p_PostalFY_From;
--------------------------------------------------------------------------------
BEGIN
htp.p('<?xml version="1.0"?><ROWSET>');
     FOR record_PeriodFrom IN c_PeriodFrom
       LOOP
           htp.p('<ROW>
                       <Period_Ptr>'||record_PeriodFrom.Period_Ptr||'</Period_Ptr>
                       <Fy>'        ||record_PeriodFrom.Fy||'</Fy>
                       <Ap>'        ||record_PeriodFrom.Ap||'</Ap>
                       <Wk>'        ||record_PeriodFrom.Wk||'</Wk>
                       <Start_Date>'||record_PeriodFrom.Start_Date||'</Start_Date>
                       <End_Date>'  ||record_PeriodFrom.End_Date||'</End_Date>
                  </ROW>');
       END LOOP;

htp.p('</ROWSET>');

END sp_getPeriodsFrom;
--==============================================================================
--==============================================================================
PROCEDURE sp_getPeriodsTo( p_FY_To emdba.em_ap_calendar_t.fy%TYPE                   -- VARCHAR2(4)
                          ,p_Period_Ptr_From emdba.em_ap_calendar_t.period_ptr%TYPE -- NUMBER
                          )
IS
--------------------------------------------------------------------------------
     CURSOR c_PeriodTo IS
     SELECT c.period_ptr, c.fy, c.ap, c.wk,
            to_char(c.start_date,'MM/DD/YYYY') AS start_date,
            to_char(c.end_date,'MM/DD/YYYY')   AS end_date
       FROM EMDBA.EM_AP_CALENDAR_T c
      WHERE c.fy = p_FY_To
        AND c.start_date >= (select c2.start_date
                               from emdba.em_ap_calendar_t c2
                              where c2.period_ptr = p_Period_Ptr_From);
--------------------------------------------------------------------------------
BEGIN
htp.p('<?xml version="1.0"?><ROWSET>');
     FOR record_PeriodTo IN c_PeriodTo
       LOOP
           htp.p('<ROW>
                       <Period_Ptr>'||record_PeriodTo.Period_Ptr||'</Period_Ptr>
                       <Fy>'        ||record_PeriodTo.Fy||'</Fy>
                       <Ap>'        ||record_PeriodTo.Ap||'</Ap>
                       <Wk>'        ||record_PeriodTo.Wk||'</Wk>
                       <Start_Date>'||record_PeriodTo.Start_Date||'</Start_Date>
                       <End_Date>'  ||record_PeriodTo.End_Date||'</End_Date>
                  </ROW>');
       END LOOP;

htp.p('</ROWSET>');


END sp_getPeriodsTo;
--==============================================================================
--==============================================================================
END nm_pm_CompNatnlBySite;
/
