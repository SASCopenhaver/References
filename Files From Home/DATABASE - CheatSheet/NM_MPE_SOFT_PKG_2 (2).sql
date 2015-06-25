create or replace package NM_MPE_SOFT_PKG_2
IS
  -- SASurikov     01/12/11   Created
  --------------------------------------------------------------------

--=======================================================================================
PROCEDURE sp_setCriteria;
--=======================================================================================
PROCEDURE sp_getHTML_Output(arg_Scope IN VARCHAR2,
                            arg_Value IN VARCHAR2,
                            arg_Schema_Name IN VARCHAR2);
--=======================================================================================
PROCEDURE sp_getBulk_EOR_NADS;-- (v_LimitIn IN PLS_INTEGER DEFAULT 100);
--=======================================================================================
PROCEDURE sp_getCalculatedDate(arg_DaysOffSysdate IN NUMBER);
--=======================================================================================
FUNCTION f_convertStringToListOfVals(arg_String IN VARCHAR2) RETURN vcarray PIPELINED;
--=======================================================================================
FUNCTION f_removeSpecialChar(arg_String IN VARCHAR2) RETURN VARCHAR2;
--=======================================================================================
end NM_MPE_SOFT_PKG_2;
/
CREATE OR REPLACE PACKAGE BODY NM_MPE_SOFT_PKG_2
  IS
  --=================================================================
  --=================================================================
  PROCEDURE sp_setCriteria
  IS
  -------------------------------------------------------------------
  --v_SiteName_MaxLength  NUMBER DEFAULT 24;
  --v_DistrName_MaxLength NUMBER DEFAULT 22;
  --v_AreaName_MaxLength  NUMBER DEFAULT 13;
  -------------------------------------------------------------------
  ----------------------------------------------------------------
  BEGIN
  nm_main.htp_header(TRUE);
  --=======================================================================================
  htp.p('
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>MPE Software Version report</title>
  <script language="javascript" type="text/javascript">
  //===================================================
  // GENERIC FUNCTION starts:
  //---------------------------------------------------

  var objAJAX = new ActiveXObject("microsoft.XMLDOM");
    objAJAX.async=false;
  var v_ArrayOfRecords = new Array();
  var v_ArrayOfValuesInRecord = new Array();
  var v_NumberOfRecords = 0;
  //---------------------------------------------------

  var v_CtrlName  = "";
  var v_CtrlID    = "";
  var v_CtrlType  = "";
  var v_CtrlValue = "";
  var v_CtrlText  = "";

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
//---------------------------------------------------------------------------------------
// GENERIC FUNCTIONS ends.
//=======================================================================================
');
--=======================================================================================
htp.p('
//=======================================================================================
// PAGE RELATED FUNCTIONS starts:

//---------------------------------------------------------------------------------------
var RegExPattern_Date = /^(?=\d)(?:(?:(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})|(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))|(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2}))($|\ (?=\d)))?(((0?[1-9]|1[012])(:[0-5]\d){0,2}(\ [AP]M))|([01]\d|2[0-3])(:[0-5]\d){1,2})?$/;
var v_ValidationPassed = "YES";

//---------------------------------------------------------------------------------------
var objAJAX = new ActiveXObject("microsoft.XMLDOM");
  objAJAX.async=false;
var v_ArrayOfRecords = new Array();
var v_ArrayOfValuesInRecord = new Array();
var v_NumberOfRecords = 0;
//---------------------------------------------------------------------------------------
//var v_NADS_ID = "";
var v_Scope   = "";
var v_SoftVerFor  = "";
//---------------------------------------------------------------------------------------
function set_form_state() {} // This function does not do anything. It is needed to prevent JavaScript error.

//---------------------------------------------------------------------------------------
function f_Exit(arg_CtrlID){ go_home(arg_CtrlID)}

//---------------------------------------------------------------------------------------
');
-----------------------------------------------------------------------------------------
htp.p('
function f_onClick(arg_CtrlName){with(self.document.forms[0])
{
   switch(arg_CtrlName)
   {
      case "ahref_ReqSoftVer":
           f_getHTML_Output();
      break;
      //
      case "ahref_MainMenu":
           open_wdw("NMARS.nm_main.main_menu");
           self.close();
      break;
   }
}}
');
-----------------------------------------------------------------------------------------
htp.p('
//---------------------------------------------------------------------------------------
bfrSoftVer_Oper = new Array();

bfrSofrVer_NotOper = new Array();

function arraySoftVer( a_area_name, 
                       a_district_name, 
                       a_site_id, 
                       a_site_name,
                       a_mach_type_code,
                       a_mach_type_desc,
                       a_machine_nbr,
                       a_serial_nbr,
                       a_mpe_sfwe_version_id,
                       a_schema_name, 
                       a_date_ref, 
                       a_random_ref_num_oper,
                       a_random_ref_num_not_oper)
{
    this.a_area_name      = a_area_name;
    this.a_district_name  = a_district_name;
    this.a_site_id        = a_site_id;
    this.a_site_name      = a_site_name;
    this.a_mach_type_code = a_mach_type_code;
    this.a_mach_type_desc = a_mach_type_desc;
    this.a_machine_nbr    = a_machine_nbr;
    this.a_serial_nbr     = a_serial_nbr;
    this.a_mpe_sfwe_version_id = a_mpe_sfwe_version_id;
    this.a_schema_name    = a_schema_name;
    this.a_date_ref       = a_date_ref;
    this.a_random_ref_num_oper = a_random_ref_num_oper;
    this.a_random_ref_num_not_oper = a_random_ref_num_not_oper;
}             
//---------------------------------------------------------------------------------------

function f_getHTML_Output(){with(self.document.forms[0])
{
     var o = 0;
     var no = 0;
     //
     v_Schema_Name = "";
     //------------------------------------------------------------------------------------
     of_getCtrlProperties("sel_NADS");  //alert(v_CtrlName+"\n"+v_CtrlID+"\n"+v_CtrlType+"\n"+v_CtrlValue);
     //
     v_Scope = v_CtrlValue.substr(v_CtrlValue.length - 4, v_CtrlValue.length); // Possible values: NTNL, AREA, DIST, SITE.
     //
     if (v_Scope == "NTNL" )
     {
         alert("Sorry, System cannot process your request.\n"+
               "Requested record set for \"National\" is too large to retrieve at once.\n"+
               "Please select \"Area\", \"District\", or \"Site\" level information.");
     }
     else
     {
         for (var i=0; i<bfrPF.length; i++)
         {
             if (bfrPF[i].a_child_id == v_CtrlValue)
             {
                v_Schema_Name = v_Schema_Name+bfrPF[i].a_schema_name+",";
             }
         }
         //
         v_Schema_Name = v_Schema_Name.substr(0, v_Schema_Name.length-1);
         v_CtrlValue   = v_CtrlValue.substr(0, v_CtrlValue.length-5)
         //------------------------------------------------------------------------------
         //TEST: alert(v_Scope+"  "+v_CtrlValue+"  "+v_Schema_Name)
         //alert("NMARS.NM_MPE_SOFT_PKG_2.sp_getHTML_Output?arg_Scope="+v_Scope+
         //                                                      "&arg_Value="+v_CtrlValue+
         //                                                      "&arg_Schema_Name="+v_Schema_Name);
         //------------------------------------------------------------------------------
         objAJAX.load("NMARS.NM_MPE_SOFT_PKG_2.sp_getHTML_Output?arg_Scope="+v_Scope+
                                                               "&arg_Value="+v_CtrlValue+
                                                               "&arg_Schema_Name="+v_Schema_Name);
         //------------------------------------------------------------------------------
         bfrSoftVer_Oper.length = 0;
          bfrSofrVer_NotOper.length = 0;
         //
         if (objAJAX.parsed)
         {
            v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW_EOR");
            v_NumberOfRecords = v_ArrayOfRecords.length;
            //
            //TEST: alert("v_NumberOfRecords SoftVer = "+v_NumberOfRecords);
            //
            for (var r=0; r<v_NumberOfRecords; r++)
            {
                v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
                if (v_ArrayOfValuesInRecord[11].text != "" 
                    &&
                    v_ArrayOfValuesInRecord[12].text == "")
                {
                      bfrSoftVer_Oper[o] = new arraySoftVer(  v_ArrayOfValuesInRecord[0].text, //a_area_name
                                                              v_ArrayOfValuesInRecord[1].text, //a_district_name
                                                              v_ArrayOfValuesInRecord[2].text, //a_site_id
                                                              v_ArrayOfValuesInRecord[3].text, //a_site_name
                                                              v_ArrayOfValuesInRecord[4].text, //a_mach_type_code
                                                              v_ArrayOfValuesInRecord[5].text, //a_mach_type_desc
                                                              v_ArrayOfValuesInRecord[6].text, //a_machine_nbr
                                                              v_ArrayOfValuesInRecord[7].text, //a_serial_nbr
                                                              v_ArrayOfValuesInRecord[8].text, //a_mpe_sfwe_version_id
                                                              v_ArrayOfValuesInRecord[9].text, //a_schema_name
                                                              v_ArrayOfValuesInRecord[10].text,//a_date_ref
                                                              v_ArrayOfValuesInRecord[11].text, //a_random_ref_num_oper
                                                              v_ArrayOfValuesInRecord[12].text //a_random_ref_num_not_oper
                                                           );
                      o++;
                }
                else if (v_ArrayOfValuesInRecord[11].text == "" 
                         &&
                         v_ArrayOfValuesInRecord[12].text != "")
                {
                      bfrSofrVer_NotOper[no] = new arraySoftVer( v_ArrayOfValuesInRecord[0].text, //a_area_name
                                                                v_ArrayOfValuesInRecord[1].text, //a_district_name
                                                                v_ArrayOfValuesInRecord[2].text, //a_site_id
                                                                v_ArrayOfValuesInRecord[3].text, //a_site_name
                                                                v_ArrayOfValuesInRecord[4].text, //a_mach_type_code
                                                                v_ArrayOfValuesInRecord[5].text, //a_mach_type_desc
                                                                v_ArrayOfValuesInRecord[6].text, //a_machine_nbr
                                                                v_ArrayOfValuesInRecord[7].text, //a_serial_nbr
                                                                v_ArrayOfValuesInRecord[8].text, //a_mpe_sfwe_version_id
                                                                v_ArrayOfValuesInRecord[9].text, //a_schema_name
                                                                v_ArrayOfValuesInRecord[10].text,//a_date_ref
                                                                v_ArrayOfValuesInRecord[11].text, //a_random_ref_num_oper
                                                                v_ArrayOfValuesInRecord[12].text //a_random_ref_num_not_oper
                                                           );
                      no++;
                
                }
            }
         }
         //------------------------------------------------------------------------------
         f_setSoftVer();
         //------------------------------------------------------------------------------
     }
}}
');
-----------------------------------------------------------------------------------------
-- of_setSingleValue("sel_EquipList", arg_Value, arg_Text, arg_ZeroLength_YesNo, arg_Pos)
htp.p('
function f_setSoftVer(){with(self.document.forms[0])
{   
    var v_outPut = "";
    var v_EmptyStr = " ";
    //
    var v_Desh = "-"; // 116 is used because a tiotal length of output in "sel_EquipList" is 116
        for (var i=0; i<94; i++){v_Desh = v_Desh+"-";}
    
    
    //----------------------------------------------------------------------------------
    f_setHeader("sel_EquipList");
    f_setHeader("sel_NotOperEquipList");

    for (var r=0; r<bfrSoftVer_Oper.length; r++)
    {//1
        v_outPut = of_RPad( bfrSoftVer_Oper[r].a_schema_name,                  3, v_EmptyStr)+"   "+
                   of_RPad( bfrSoftVer_Oper[r].a_site_name.substr(0,30),      30, v_EmptyStr)+"   "+
                   of_RPad( bfrSoftVer_Oper[r].a_mach_type_code,               7, v_EmptyStr)+"   "+
                   of_RPad( bfrSoftVer_Oper[r].a_mach_type_desc.substr(0,10), 10, v_EmptyStr)+"   "+
                   of_RPad( bfrSoftVer_Oper[r].a_machine_nbr,                  7, v_EmptyStr)+"   "+
                   of_RPad( bfrSoftVer_Oper[r].a_serial_nbr,                  20, v_EmptyStr)+"   "+
                   of_RPad( bfrSoftVer_Oper[r].a_mpe_sfwe_version_id,         16, v_EmptyStr);
       
        of_setSingleValue("sel_EquipList", bfrSoftVer_Oper[r].a_site_id, v_outPut, "NO", r+2);
    } // end of 1
    //
    of_setSingleValue("sel_EquipList", "-2", v_Desh+bfrSoftVer_Oper.length+" Record(s) retrieved", "NO",  1)
    //
    for (var r=0; r<bfrSofrVer_NotOper.length; r++)
    {//2
        v_outPut = of_RPad( bfrSofrVer_NotOper[r].a_schema_name,                  3, v_EmptyStr)+"   "+
                   of_RPad( bfrSofrVer_NotOper[r].a_site_name.substr(0,30),      30, v_EmptyStr)+"   "+
                   of_RPad( bfrSofrVer_NotOper[r].a_mach_type_code,               7, v_EmptyStr)+"   "+
                   of_RPad( bfrSofrVer_NotOper[r].a_mach_type_desc.substr(0,10), 10, v_EmptyStr)+"   "+
                   of_RPad( bfrSofrVer_NotOper[r].a_machine_nbr,                  7, v_EmptyStr)+"   "+
                   of_RPad( bfrSofrVer_NotOper[r].a_serial_nbr,                  20, v_EmptyStr)+"   "+
                   of_RPad( bfrSofrVer_NotOper[r].a_mpe_sfwe_version_id,         16, v_EmptyStr);
       
        of_setSingleValue("sel_NotOperEquipList", bfrSofrVer_NotOper[r].a_site_id, v_outPut, "NO", r+2);
    } // end of 2
    of_setSingleValue("sel_NotOperEquipList", "-2", v_Desh+bfrSofrVer_NotOper.length+" Record(s) retrieved", "NO",  1)
    
}}// end of function f_setSoftVer()
');
-----------------------------------------------------------------------------------------
htp.p('
function f_setHeader(arg_CtrlName){with(self.document.forms[0])
{
      //---------------------------------------------------------------------------------
      var v_outPut = "";
      var v_EmptyStr = " ";
      var v_Desh = "-"; // 116 is used because a tiotal length of output in "sel_EquipList" is 116
          for (var i=0; i<118; i++){v_Desh = v_Desh+"-";}
      //---------------------------------------------------------------------------------
      
      eval(arg_CtrlName+".options.length = 0");
      //sel_EquipList.options.length = 0;
      
      v_outPut = "SERVR NAME"+" | "+
                 of_RPad("SITE NAME (may be abbreviated)", 28, v_EmptyStr)+" | "+
                 of_RPad("MACH.CD",                         7, v_EmptyStr)+" | "+
                 of_RPad("MACH.DESC",                      10, v_EmptyStr)+" | "+
                 of_RPad("MACH.NM",                         7, v_EmptyStr)+" | "+
                 of_RPad("SERL.NM",                        20, v_EmptyStr)+" | "+
                 of_RPad("SOFT.VER",                       16, v_EmptyStr);
      
      of_setSingleValue(arg_CtrlName, "-1", v_outPut, "YES", 0);
      
      of_setSingleValue(arg_CtrlName, "-2", v_Desh, "NO",  1);
      //---------------------------------------------------------------------------------
}}
');
-----------------------------------------------------------------------------------------
htp.p('
function f_onChange(arg_CtrlName){with(self.document.forms[0])
{
      var v_EmptyStr = " ";
      //
      of_getCtrlProperties(arg_CtrlName);
      //
      v_Scope = v_CtrlValue.substr(v_CtrlValue.length - 4, v_CtrlValue.length); // Possible values: NTNL, AREA, DIST, SITE.
      //
      if (v_Scope == "NTNL")
      {
         v_CtrlText_Output = v_CtrlText+" due to a large record set is not available";
      }
      else  // if (v_Scope == "AREA" || v_Scope == "DIST" || v_Scope == "SITE")
      {
         // Remove the first letter ("a", or "d", or "s") in v_CtrlText_Output.
         // ex.: v_CtrlText_Output = "a    Area Name":
         v_CtrlText_Output = v_CtrlText.substr(1);
         //
         // Remove empty string(s) in v_CtrlText_Output.
         // ex.: v_CtrlText_Output = "    Area Name"
         while (v_EmptyStr == " ")
         {
              v_EmptyStr = v_CtrlText_Output.substr(0,1);
              if (v_EmptyStr == " ")
              {
                 v_CtrlText_Output = v_CtrlText_Output.substr(1, v_CtrlText_Output.length);
              }
         }
         //
         // Now v_CtrlText_Output = "Area Name" and ready to be output:
         if      (v_Scope == "NTNL") {v_CtrlText_Output = v_CtrlText_Output+""}
         else if (v_Scope == "AREA") {v_CtrlText_Output = v_CtrlText_Output+" area"}
         else if (v_Scope == "DIST") {v_CtrlText_Output = v_CtrlText_Output+" district"}
         else if (v_Scope == "SITE") {v_CtrlText_Output = v_CtrlText_Output+" site"}         
         //
      }
      //
      of_outPut("id_SoftVerFor", v_CtrlText_Output);
      //
      f_setHeader("sel_EquipList");
      f_setHeader("sel_NotOperEquipList");
      //
}}
');
-----------------------------------------------------------------------------------------
htp.p('
//--------------------------------------------------------------------------------------
// "PF" stands for "Postal Facility"
bfrPF = new Array();

function arrayPF( a_parent_id, 
                  a_child_id, 
                  a_nads_name, 
                  a_site_id, 
                  a_schema_name, 
                  a_date_ref, 
                  a_random_ref_num)
{
    this.a_parent_id   = a_parent_id;
    this.a_child_id    = a_child_id;
    this.a_nads_name   = a_nads_name;
    this.a_site_id     = a_site_id;
    this.a_schema_name = a_schema_name;
    this.a_date_ref    = a_date_ref;
    this.a_random_ref_num = a_random_ref_num;
}             

//---------------------------------------------------------------------------------------
// "PF_Sub" stands for "Postal Facility Subset" of data.
bfrPF_Sub = new Array();

function arrayPF_Sub(a_parent_id, 
                     a_child_id, 
                     a_nads_name, 
                     a_schema_name, 
                     a_date_ref, 
                     a_random_ref_num)
{
  this.a_parent_id = a_parent_id;
  this.a_child_id  = a_child_id;
  this.a_nads_name = a_nads_name;
  this.a_date_ref  = a_date_ref;
  this.a_random_ref_num = a_random_ref_num;
}
//---------------------------------------------------------------------------------------

function f_getNADS(){with(self.document.forms[0])
{
      objAJAX.load("NMARS.NM_MPE_SOFT_PKG_2.sp_getCalculatedDate?arg_DaysOffSysdate=-10");
      //
      if (objAJAX.parsed)
      {
         v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW_DT");
         v_NumberOfRecords = v_ArrayOfRecords.length;
         //v_NumberOfRecords in this case will always be = 1.
         //
         for (var r=0; r<v_NumberOfRecords; r++)  
         {
             v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
             
             of_outPut("span_MODsDateFrom", v_ArrayOfValuesInRecord[0].text);
             of_outPut("span_MODsDateTo",   v_ArrayOfValuesInRecord[1].text);
         }
      }
      //---------------------------------------------------------------------------------
      objAJAX.load("NMARS.NM_MPE_SOFT_PKG_2.sp_getCalculatedDate?arg_DaysOffSysdate=-30");
      //
      if (objAJAX.parsed)
      {
         v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW_DT");
         v_NumberOfRecords = v_ArrayOfRecords.length;
         //v_NumberOfRecords in this case will always be = 1.
         //
         for (var r=0; r<v_NumberOfRecords; r++)  
         {
             v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
             
             of_outPut("span_MODsDateFrom_2", v_ArrayOfValuesInRecord[0].text);
             of_outPut("span_MODsDateTo_2",   v_ArrayOfValuesInRecord[1].text);
         }
      }
      //---------------------------------------------------------------------------------
      objAJAX.load("NMARS.NM_MPE_SOFT_PKG_2.sp_getBulk_EOR_NADS");
      //
      bfrPF_Sub.length = 0;
      bfrPF.length     = 0;
      //
      if (objAJAX.parsed)
      {//1.2
            
            //---------------------------------------------------------------------------
            v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW_PF_SUB");
            v_NumberOfRecords = v_ArrayOfRecords.length;
            //
            //TEST: alert("v_NumberOfRecords PF Sub = "+v_NumberOfRecords);
            //
            for (var r=0; r<v_NumberOfRecords; r++)
            {//1.2.1
                    v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
                    //alert(v_ArrayOfValuesInRecord[2].text)
                    bfrPF_Sub[r] = new arrayPF_Sub( v_ArrayOfValuesInRecord[0].text, //a_parent_id
                                                    v_ArrayOfValuesInRecord[1].text, //a_child_id
                                                    v_ArrayOfValuesInRecord[2].text, //a_nads_name
                                                    v_ArrayOfValuesInRecord[3].text, //a_date_ref
                                                    v_ArrayOfValuesInRecord[4].text  //a_random_ref_num
                                                   );
                   //TEST: alert(bfrPF_Sub[r].a_parent_id+"\n"+bfrPF_Sub[r].a_child_id+"\n"+bfrPF_Sub[r].a_nads_name);
            }//1.2.1
            //
            //---------------------------------------------------------------------------
            
            v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW_PF");
            v_NumberOfRecords = v_ArrayOfRecords.length;
            //
            //TEST: alert("v_NumberOfRecords PF = "+v_NumberOfRecords);
            //
            for (var r=0; r<v_NumberOfRecords; r++)
            {//1.3.1
                    v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
                    //alert(v_ArrayOfValuesInRecord[2].text)
                    bfrPF[r] = new arrayPF( v_ArrayOfValuesInRecord[0].text, //a_parent_id
                                            v_ArrayOfValuesInRecord[1].text, //a_child_id
                                            v_ArrayOfValuesInRecord[2].text, //a_nads_name
                                            v_ArrayOfValuesInRecord[3].text, //a_site_id
                                            v_ArrayOfValuesInRecord[4].text, //a_schema_name
                                            v_ArrayOfValuesInRecord[5].text, //a_date_ref
                                            v_ArrayOfValuesInRecord[6].text  //a_random_ref_num
                                              );
                   //TEST: alert(bfrPF[r].a_parent_id+"\n"+bfrPF[r].a_child_id+"\n"+bfrPF[r].a_nads_name);
            }//1.3.1
            
      }//1.2
      //
      f_setPF_Sub();
      //
      //---------------------------------------------------------------------------------
}}
');

-----------------------------------------------------------------------------------------
htp.p('
function f_setPF_Sub()
{//
  for (var i=0; i<bfrPF_Sub.length; i++)
  {
      of_setSingleValue("sel_NADS", bfrPF_Sub[i].a_child_id, bfrPF_Sub[i].a_nads_name, "NO", i)
  }
}
');
-----------------------------------------------------------------------------------------
htp.p('
function f_resetScreen(){with(self.document.forms[0])
{
  of_selectRecord("sel_NADS", "NTNL");
  //
  f_onChange("sel_NADS");
  //
}}
');
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
htp.p('
//---------------------------------------------------
// PAGE RELATED FUNCTIONS ends.
//===================================================
');
-----------------------------------------------------------------------------------------
htp.p('
</script>
</head>
<body onload="set_form_state();">
<FORM name="form1" action="" method="POST">
<DIV class="MenuHead">MPE Software Version report</DIV>
<DIV id="id_divPage" class="SHOW_SITE">

<table width="95%" border="0" cellspacing="2" cellpadding="2">
 <tr><!--- 1 --->
   <td width="20%" style="font-size:11px"><!--- 2 --->
       <strong>
       Hierarchical view of
       <br />
       a
       &nbsp;&nbsp;&nbsp;
       Areas,
       <br />
       d
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       Districts</strong>, and
       <br />
       <strong>
       s
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       Sites
       </strong>
       <br />
       (names may be abbreviated):

   </td><!--- 2 --->
   <td valign="top"><!--- 3 --->
        <br />
            <center>
              <table width="100%" border="0" cellspacing="2" cellpadding="2">
                  <tr>
                      <td align="right" width="30%">
                          <a href="#"
                             name="ahref_ReqSoftVer"
                             id="ahref_ReqSoftVer"
                             onclick="JavaScript: f_onClick(this.name);">
                                <font color="#003366" size="-1" face="Arial, Helvetica, sans-serif">
                                <strong>Request MPE Software Version report for </strong>
                                </font>
                          </a>
                      </td>
                      <td align="left" width="30%">
                          <font color="#003366" size="-1" face="Arial, Helvetica, sans-serif">
                          <span id="id_SoftVerFor">&nbsp;</span>
                          </font>
                      </td>
                      <td align="center" width="15%">
                          <a href="void(0);"
                             name="ahref_MainMenu"
                             onclick="JavaScript: f_onClick(this.name);">
                                <font color="#003366" size="-1" face="Arial, Helvetica, sans-serif">
                                <strong>Main Menu</strong>
                                </font>
                          </a>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="3">
                          <span style="font-size:11px; font-weight:bold;">
                          Note:
                          </span>
                          <span style="font-size:11px; font-weight:normal; color:#00C;">
                          Please be patient, requesting a large data output may take up to 30 seconds to process.
                          </span>
                      </td>
                  </tr>
            </table>
            </center>
            <br />
            <span style="font-size:11px; font-weight:bold;">List of equipmet that was operational between</span> 
            <span id="span_MODsDateFrom" style="font-size:11px; font-weight:bold; color:#009;"></span>
            <span style="font-size:11px; font-weight:bold;">&nbsp;and&nbsp;</span> 
            <span id="span_MODsDateTo" style="font-size:11px; font-weight:bold; color:#009;"></span>
            <span style="font-size:11px; font-weight:bold;">&nbsp;(past 10 days).</span>
  </td><!--- 3 --->
</tr><!--- 1 --->
<tr>
    <td valign="top">
        <select name="sel_NADS"
                id="sel_NADS"
                onchange="f_onChange(this.name);"
                size="40"
                tabindex="1"
                style="font-family:''Courier New'', Courier, monospace; font-size:11px;">
          <option value="0">NATIONAL</option>
        </select>
    </td>
    <td valign="top" style="font-size:11px">
        <select name="sel_EquipList"
                id="sel_EquipList"
                size="30"
                tabindex=""
                style="font-family:''Courier New'', Courier, monospace;  font-size:11px;">
          <option value="NTNL">=== ALL ===</option>
        </select>
        <br /><br />
            <span style="font-size:11px; font-weight:bold;">List of equipment that was not operated between</span> 
            <span id="span_MODsDateFrom_2" style="font-size:11px; font-weight:bold; color:#009;"></span>
            <span style="font-size:11px; font-weight:bold;">&nbsp;and&nbsp;</span> 
            <span id="span_MODsDateTo_2" style="font-size:11px; font-weight:bold; color:#009;"></span>
            <span style="font-size:11px; font-weight:bold;">&nbsp;(past 30 days), but still registered on the selected site:</span>
        <br />
        <select name="sel_NotOperEquipList"
                id="sel_NotOperEquipList"
                size="8"
                tabindex=""
                style="font-family:''Courier New'', Courier, monospace;  font-size:11px;">
          <option value="NTNL">=== ALL ===</option>
        </select>

    </td>
<!---    <td><div id="td_ReqSoftVer">td_ReqSoftVer</div></tr>--->

</table>
</DIV> <!--- end of id_divPage --->
</FORM>
</body>
');
-----------------------------------------------------------------------------------------
htp.p('
<script language="javascript" type="text/javascript">
//---------------------------------------------------
f_getNADS();
f_resetScreen();
//---------------------------------------------------
</script>
</html>
');
nm_main.htp_footer;
END sp_setCriteria;

--=======================================================================================
PROCEDURE sp_getBulk_EOR_NADS --(v_LimitIn IN PLS_INTEGER DEFAULT 100)
IS
-----------------------------------------------------------------------------------------
v_SchemaName emdba.em_site_t.eor_schema_name%TYPE;

cursor c_getEOR_Schemas is
/*       select eor_schema_name 
       from eor_test;*/

       select distinct t.eor_schema_name
         from emdba.em_site_t t
        where t.eor_schema_name is not NULL;


-----------------------------------------------------------------------------------------
v_RandomRefNum NUMBER DEFAULT dbms_random.random;
v_DateRef      DATE   DEFAULT SYSDATE;
--v_SQLSource    VARCHAR2(200) DEFAULT 'NMARS.NM_MPE_SOFT_PKG_2.sp_getBulk_EOR_NADS';

--v_SQL_EOR  VARCHAR2(2000) DEFAULT 'EOR';
v_SQL_AREA VARCHAR2(4000) DEFAULT 'SELECT AREA';
v_SQL_DIST VARCHAR2(4000) DEFAULT 'SELECT DIST';
v_SQL_SITE VARCHAR2(4000) DEFAULT 'SELECT SITE';
-----------------------------------------------------------------------------------------
--v_Counter NUMBER default 0;
-----------------------------------------------------------------------------------------
TYPE cRef_getPostFac IS REF CURSOR;
TYPE rRef_getPostFac IS RECORD ( parent_id   VARCHAR2(100),
                                 child_id    VARCHAR2(100),
                                 nads_name   VARCHAR2(100),
                                 site_id     VARCHAR2(20),
                                 schema_name VARCHAR2(20),
                                 date_ref    DATE,
                                 random_ref_num NUMBER
                                );

c_AvailablePostFac cRef_getPostFac;
r_RecordPostFac    rRef_getPostFac;

v_SQL_PostFac VARCHAR2(4000) DEFAULT
'select parent_id, 
        child_id, 
        nads_name, 
        site_id, 
        schema_name, 
        date_ref, 
        random_ref_num 
   from NMARS.nm_post_facil_temp'
;

-----------------------------------------------------------------------------------------
-- "Sub" stands for subset of retrieved data.
TYPE cRef_getPostFac_Sub IS REF CURSOR;
TYPE rRef_getPostFac_Sub IS RECORD ( parent_id   VARCHAR2(100),
                                     child_id    VARCHAR2(100),
                                     nads_name   VARCHAR2(100),
                                     date_ref    DATE,
                                     random_ref_num NUMBER
                                    );

c_AvailablePostFac_Sub cRef_getPostFac_Sub;
r_RecordPostFac_Sub    rRef_getPostFac_Sub;

v_SQL_PostFac_Sub VARCHAR2(4000) DEFAULT
'select pf.parent_id as parent_id
       ,pf.child_id  as child_id
       ,DECODE(level,1,'''',
                     2,''a'',
                     3,''d'',
                     4,''s'')||
               LPAD('' '',(level-1)*1)||SUBSTR(pf.nads_name,1,25) as nads_name
       ,pf.date_ref
       ,pf.random_ref_num
  from nmars.nm_post_facil_subset_temp pf
 --where pf.parent_id != ''0''
 start with parent_id = ''0''
connect by nocycle parent_id = prior child_id
 order siblings by pf.nads_name'
;
-----------------------------------------------------------------------------------------
BEGIN
-----------------------------------------------------------------------------------------
-- Table NMARS.NM_DYNAMIC_SQL_T is for references only
delete NMARS.NM_DYNAMIC_SQL_T ds
 where (trunc(v_DateRef) - trunc(ds.date_ref)) > 2
;
-- 1. -----------------------------------------------------------------------------------
-- 1.1:
insert into nm_post_facil_temp
(parent_id, child_id, nads_name, site_id, schema_name, date_ref, random_ref_num)
values
('0', 'NTNL', 'NATIONAL', 'NTNL', 'ALL_SCHEMAS', v_DateRef, v_RandomRefNum);

-----------------------------------------------------------------------------------------
-- 1.2:
FOR r_getEOR_Schemas IN c_getEOR_Schemas LOOP
       ----------------------------------------------------------------------------------
       v_SchemaName := r_getEOR_Schemas.eor_schema_name;
       ----------------------------------------------------------------------------------
/*
       OPEN c_AvailEOR_Recds FOR v_SQL_EOR; 
            LOOP
--                      FETCH c_AvailEOR_Recds BULK COLLECT INTO v_r_nm_sql_eor_temp LIMIT v_LimitIn;
--                            FORALL i IN 1..v_r_nm_sql_eor_temp.COUNT
--                            INSERT INTO NMARS.nm_sql_eor_test
--                            VALUES v_r_nm_sql_eor_temp(i);
               EXIT WHEN c_AvailEOR_Recds%NOTFOUND;
            END LOOP;
       CLOSE c_AvailEOR_Recds;
*/
       ----------------------------------------------------------------------------------
       v_SQL_AREA := 
       'insert into nm_post_facil_temp
               (parent_id, child_id, nads_name, site_id, schema_name, date_ref, random_ref_num)
       select distinct ''NTNL''                        as parent_id
                         ,UPPER(NMARS.NM_EQUIP_MODS.f_removeSpecialChar( REPLACE(pf.AREA_NAME,'' '','''') ))||''_AREA''  
                                                       as child_id
                         ,NMARS.NM_EQUIP_MODS.f_removeSpecialChar(pf.AREA_NAME) 
                                                       as nads_name
                         ,''AREA''                     as site_id
                         ,'''||v_SchemaName||'''       as schema_name
                         ,to_date('''||v_DateRef||''') as date_ref
                         ,'||v_RandomRefNum||'         as random_ref_num
                   from '||v_SchemaName||'.POSTAL_FACILITY@eorweb.usps.gov pf'
         ;
         execute immediate v_SQL_AREA;
         --------------------------------------------------------------------------------
          v_SQL_DIST :=
           'insert into nm_post_facil_temp
                   (parent_id, child_id, nads_name, site_id, schema_name, date_ref, random_ref_num)
            select distinct UPPER(NMARS.NM_EQUIP_MODS.f_removeSpecialChar( REPLACE(pf.AREA_NAME,'' '','''') ))||''_AREA'' 
                                                       as parent_id
                         ,UPPER(NMARS.NM_EQUIP_MODS.f_removeSpecialChar( REPLACE(pf.DISTRICT_NAME,'' '','''') ))||''_DIST'' 
                                                       as child_id
                         ,NMARS.NM_EQUIP_MODS.f_removeSpecialChar(pf.DISTRICT_NAME) 
                                                       as nads_name
                         ,''DIST''                     as site_id
                         ,'''||v_SchemaName||'''       as schema_name
                         ,to_date('''||v_DateRef||''') as date_ref
                         ,'||v_RandomRefNum||'         as random_ref_num
           from '||v_SchemaName||'.POSTAL_FACILITY@eorweb.usps.gov pf'
           ;
           ---
           execute immediate v_SQL_DIST;
           ------------------------------------------------------------------------------
           v_SQL_SITE :=
           'insert into nm_post_facil_temp
                   (parent_id, child_id, nads_name, site_id, schema_name, date_ref, random_ref_num)        
            select distinct UPPER(NMARS.NM_EQUIP_MODS.f_removeSpecialChar( REPLACE(pf.DISTRICT_NAME,'' '','''') ))||''_DIST'' 
                                                       as parent_id
                         ,UPPER(NMARS.NM_EQUIP_MODS.f_removeSpecialChar( REPLACE(pf.SITE_NAME,'' '','''') ))||''_SITE'' 
                                                       as child_id
                         ,NMARS.NM_EQUIP_MODS.f_removeSpecialChar(pf.SITE_NAME) 
                                                       as nads_name
                         ,''''||pf.site_id||''''       as site_id
                         ,'''||v_SchemaName||'''       as schema_name
                         ,to_date('''||v_DateRef||''') as date_ref
                         ,'||v_RandomRefNum||'         as random_ref_num
            from '||v_SchemaName||'.POSTAL_FACILITY@eorweb.usps.gov pf'
            ;
            ---
            execute immediate v_SQL_SITE;
-----------------------------------------------------------------------------------------
/*
-- For potential references:
-- 1.3:
            insert into NM_DYNAMIC_SQL_T (sql_source, sql_statement, date_ref, random_ref_num)
            values (v_SchemaName, v_SQL_AREA, v_DateRef, v_RandomRefNum);
          -- 
            insert into NM_DYNAMIC_SQL_T (sql_source, sql_statement, date_ref, random_ref_num)
            values (v_SchemaName, v_SQL_DIST, v_DateRef, v_RandomRefNum);
          -- 
            insert into NM_DYNAMIC_SQL_T (sql_source, sql_statement, date_ref, random_ref_num)
            values (v_SchemaName, v_SQL_SITE, v_DateRef, v_RandomRefNum);
*/
-----------------------------------------------------------------------------------------
END LOOP; -- 1. Loop for c_getEOR_Schemas ends

-- 2. -----------------------------------------------------------------------------------
insert into nm_post_facil_subset_temp
      (parent_id, child_id, nads_name, date_ref, random_ref_num)
select distinct
       parent_id, child_id, nads_name, date_ref, random_ref_num 
  from nm_post_facil_temp;

-- 3. -----------------------------------------------------------------------------------
htp.p('<?xml version="1.0"?><ROWSET>');
-----------------------------------------------------------------------------------------
-- TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
--delete NMARS.nm_post_facil_test;
--delete NMARS.nm_post_facil_subset_test;
--TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
-----------------------------------------------------------------------------------------
  OPEN c_AvailablePostFac FOR v_SQL_PostFac;
      LOOP
          FETCH c_AvailablePostFac INTO r_RecordPostFac;
          EXIT WHEN c_AvailablePostFac%NOTFOUND;
          
          htp.p('<ROW_PF>
                     <PARENT_ID>'     ||r_RecordPostFac.parent_id  ||'</PARENT_ID>
                     <CHILD_ID>'      ||r_RecordPostFac.child_id   ||'</CHILD_ID>
                     <NADS_NAME>'     ||r_RecordPostFac.nads_name  ||'</NADS_NAME>
                     <SITE_ID>'       ||r_RecordPostFac.site_id    ||'</SITE_ID>
                     <SCHEMA_NAME>'   ||r_RecordPostFac.schema_name||'</SCHEMA_NAME>
                     <DATE_REF>'      ||r_RecordPostFac.date_ref   ||'</DATE_REF>
                     <RANDOM_REF_NUM>'||r_RecordPostFac.random_ref_num|| '</RANDOM_REF_NUM>
                </ROW_PF>');

-- TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
--insert into nm_post_facil_test (parent_id, child_id, nads_name, site_id, schema_name, date_ref, random_ref_num)
--values (r_RecordPostFac.parent_id,r_RecordPostFac.child_id,r_RecordPostFac.nads_name,
--        r_RecordPostFac.site_id,r_RecordPostFac.schema_name,r_RecordPostFac.date_ref,r_RecordPostFac.random_ref_num);
--TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
      END LOOP;
  CLOSE c_AvailablePostFac;
-----------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
  OPEN c_AvailablePostFac_Sub FOR v_SQL_PostFac_Sub;
      LOOP
          FETCH c_AvailablePostFac_Sub INTO r_RecordPostFac_Sub;
          EXIT WHEN c_AvailablePostFac_Sub%NOTFOUND;
          
          htp.p('<ROW_PF_SUB>
                     <PARENT_ID>'     ||r_RecordPostFac_Sub.parent_id  ||'</PARENT_ID>
                     <CHILD_ID>'      ||r_RecordPostFac_Sub.child_id   ||'</CHILD_ID>
                     <NADS_NAME>'     ||r_RecordPostFac_Sub.nads_name  ||'</NADS_NAME>
                     <DATE_REF>'      ||r_RecordPostFac_Sub.date_ref   ||'</DATE_REF>
                     <RANDOM_REF_NUM>'||r_RecordPostFac_Sub.random_ref_num|| '</RANDOM_REF_NUM>
                </ROW_PF_SUB>');
-- TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
--insert into nm_post_facil_subset_test (parent_id, child_id, nads_name, date_ref, random_ref_num)
--values (r_RecordPostFac_Sub.parent_id, r_RecordPostFac_Sub.child_id, 
--        r_RecordPostFac_Sub.nads_name, r_RecordPostFac_Sub.date_ref, r_RecordPostFac_Sub.random_ref_num);
-- TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
      END LOOP;
  CLOSE c_AvailablePostFac_Sub;
-----------------------------------------------------------------------------------------
htp.p('</ROWSET>');
-----------------------------------------------------------------------------------------
COMMIT;
-----------------------------------------------------------------------------------------
EXCEPTION

    WHEN OTHERS THEN
        htp.p('Error ID:'||sqlcode||'<BR>');
        htp.p('Error Description:'||sqlerrm);

          -- ms47.MS47_SP_ERROR_LOG
          ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                           ,'NM_MPE_SOFT_PKG.sp_getBulk_EOR_NADS'
                                                           ,-1
                                                           ,0
                                                           ,0
                                                           ,'x'
                                                           ,SQLCODE
                                                           ,SQLERRM
                                                          );
-----------------------------------------------------------------------------------------
END sp_getBulk_EOR_NADS;
--)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
--=======================================================================================

PROCEDURE sp_getHTML_Output(arg_Scope IN VARCHAR2,
                            arg_Value IN VARCHAR2,
                            arg_Schema_Name IN VARCHAR2)
IS
-----------------------------------------------------------------------------------------
v_RandomRefNum NUMBER DEFAULT dbms_random.random;
v_DateRef      DATE   DEFAULT SYSDATE;
----------------------------------------------------------------------------------------
v_Scope     VARCHAR2(10) DEFAULT arg_Scope;
-- Reminder: available values - "AREA", "DIST", "SITE".
--
v_NADS_Name VARCHAR2(100) DEFAULT arg_Value;
-- Reminder: format of passed value (arg_Value) was altered - 
-- UPPER(NMARS.NM_EQUIP_MODS.f_removeSpecialChar( REPLACE(pf.'||v_Scope||'_NAME,'' '','''') ))||''_''||v_Scope
--
v_SchemaName emdba.em_site_t.eor_schema_name%TYPE DEFAULT 'EOR_SCHEMA';
-- Reminder: v_SchemaName should have only one Schema Name, but passed arg_Schema_Name
-- may contain one or more in coma delimited string
-----------------------------------------------------------------------------------------
TYPE cRef_getEOR IS REF CURSOR;
TYPE rRef_getEOR IS RECORD (
                            area_name           VARCHAR2(35),
                            district_name       VARCHAR2(35),
                            site_id             VARCHAR2(20),
                            site_name           VARCHAR2(65),
                            mach_type_code      NUMBER,
                            mach_type_desc      VARCHAR2(50),
                            machine_nbr         NUMBER,
                            serial_nbr          VARCHAR2(31),
                            mpe_sfwe_version_id VARCHAR2(16),
                            schema_name         VARCHAR2(10),
                            date_ref            DATE,
                            random_ref_num_oper NUMBER,
                            random_ref_num_not_oper NUMBER
                         );
c_AvailEOR_Recds cRef_getEOR;
r_AvailEOR_Recds rRef_getEOR;
                         
c_AvailEOR_Recds_OPER cRef_getEOR;
r_AvailEOR_Recds_OPER rRef_getEOR;

c_AvailEOR_Recds_NOT_OPER cRef_getEOR;
r_AvailEOR_Recds_NOT_OPER rRef_getEOR;

v_SQL_EOR_OPER VARCHAR2(4000);     -- <---- SQL that delivers a list of operational equipment between SYSDATE-10 and SYSDATE
v_SQL_EOR_NOT_OPER VARCHAR2(4000); -- <---- SQL that delivers a list of equipment that was NOT operated between SYSDATE-10 and SYSDATE
v_SQL_HTML_Output VARCHAR2(4000);
--
-----------------------------------------------------------------------------------------
CURSOR c_Schema_Name IS 
select t.column_value
    from TABLE(NMARS.NM_MPE_SOFT_PKG_2.f_convertStringToListOfVals(arg_Schema_Name)) t;
-----------------------------------------------------------------------------------------
v_Count NUMBER default 0;

BEGIN
-----------------------------------------------------------------------------------------
-- 1.
IF arg_Scope = 'DIST' THEN
  v_Scope := 'DISTRICT';
END IF;
-----------------------------------------------------------------------------------------
-- TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
--delete nm_dynamic_sql_t_2;
--delete nm_sql_eor_test;
-- TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
 v_SQL_HTML_Output := 'select area_name,
                              district_name,
                              site_id,
                              site_name,
                              mach_type_code,
                              mach_type_desc,
                              machine_nbr,
                              serial_nbr,
                              mpe_sfwe_version_id,
                              schema_name,
                              date_ref,
                              random_ref_num_oper,
                              random_ref_num_not_oper
                        from nm_sql_eor_temp
                       where random_ref_num_oper = '||v_RandomRefNum||' '||
                       ' or random_ref_num_not_oper = '||v_RandomRefNum||' '||
                      ' order by area_name,
                                district_name,
                                site_name,
                                mach_type_desc,
                                machine_nbr,
                                mpe_sfwe_version_id';

-- 2.
FOR r_Schema_Name IN c_Schema_Name LOOP
  v_SchemaName := r_Schema_Name.Column_Value;
  
  v_Count := v_Count+1;
-- 2.1
  v_SQL_EOR_OPER := 
'select distinct
        NMARS.NM_EQUIP_MODS.f_removeSpecialChar( pf.AREA_NAME)     as AREA_NAME
       ,NMARS.NM_EQUIP_MODS.f_removeSpecialChar( pf.DISTRICT_NAME) as DISTRICT_NAME
       ,pf.SITE_ID
       ,NMARS.NM_EQUIP_MODS.f_removeSpecialChar( pf.SITE_NAME)     as SITE_NAME
       ,mt.MACH_TYPE_CODE
       ,mt.MACH_TYPE_DESC
       , m.MACHINE_NBR
       , m.SERIAL_NBR
       , m.MPE_SFWE_VERSION_ID
       ,'''||v_SchemaName||'''       as SCHEMA_NAME
       ,to_date('''||v_DateRef||''') as DATE_REF
       ,'||v_RandomRefNum||'         as RANDOM_REF_NUM_OPER
       ,NULL                         as RANDOM_REF_NUM_NOT_OPER
  from  '||v_SchemaName||'.POSTAL_FACILITY@eorweb.usps.gov pf
       join '||v_SchemaName||'.MACHINE@eorweb.usps.gov m
         on pf.SITE_ID = m.SITE_ID
            join '||v_SchemaName||'.MACHINE_TYPE@eorweb.usps.gov mt
              on m.MACH_TYPE_CODE = mt.MACH_TYPE_CODE
                 join '||v_SchemaName||'.END_OF_RUN@eorweb.usps.gov er
                   on m.MACHINE_ID = er.MACHINE_ID              
 where m.MPE_SFWE_VERSION_ID is not null
   and UPPER(NMARS.NM_EQUIP_MODS.f_removeSpecialChar( REPLACE(pf.'||v_Scope||'_NAME,'' '','''') )) = '||''''||v_NADS_Name||'''
   and er.MODS_DATE between TRUNC(SYSDATE-10) and TRUNC(SYSDATE)
   order by 1,2,4,7,6';
-----------------------------------------------------------------------------------------
-- 2.2

v_SQL_EOR_NOT_OPER := 
'select NMARS.NM_EQUIP_MODS.f_removeSpecialChar( pf.AREA_NAME)     as AREA_NAME
       ,NMARS.NM_EQUIP_MODS.f_removeSpecialChar( pf.DISTRICT_NAME) as DISTRICT_NAME
       ,pf.SITE_ID
       ,NMARS.NM_EQUIP_MODS.f_removeSpecialChar( pf.SITE_NAME)     as SITE_NAME
       ,mt.MACH_TYPE_CODE
       ,mt.MACH_TYPE_DESC
       , m.MACHINE_NBR
       , m.SERIAL_NBR
       , m.MPE_SFWE_VERSION_ID
       ,'''||v_SchemaName||'''       as SCHEMA_NAME
       ,to_date('''||v_DateRef||''') as DATE_REF
       ,NULL                         as RANDOM_REF_NUM_OPER
       ,'||v_RandomRefNum||'         as RANDOM_REF_NUM_NOT_OPER
  from  '||v_SchemaName||'.POSTAL_FACILITY@eorweb.usps.gov pf
       join '||v_SchemaName||'.MACHINE@eorweb.usps.gov m
         on pf.SITE_ID = m.SITE_ID
            join '||v_SchemaName||'.MACHINE_TYPE@eorweb.usps.gov mt
              on m.MACH_TYPE_CODE = mt.MACH_TYPE_CODE
                 join '||v_SchemaName||'.END_OF_RUN@eorweb.usps.gov er
                   on m.MACHINE_ID = er.MACHINE_ID              
 where m.MPE_SFWE_VERSION_ID is not null
   and UPPER(NMARS.NM_EQUIP_MODS.f_removeSpecialChar( REPLACE(pf.'||v_Scope||'_NAME,'' '','''') )) = '||''''||v_NADS_Name||'''
   and er.MODS_DATE between TRUNC(SYSDATE-30) and TRUNC(SYSDATE)
MINUS
select distinct
        NMARS.NM_EQUIP_MODS.f_removeSpecialChar( pf.AREA_NAME)     as AREA_NAME
       ,NMARS.NM_EQUIP_MODS.f_removeSpecialChar( pf.DISTRICT_NAME) as DISTRICT_NAME
       ,pf.SITE_ID
       ,NMARS.NM_EQUIP_MODS.f_removeSpecialChar( pf.SITE_NAME)     as SITE_NAME
       ,mt.MACH_TYPE_CODE
       ,mt.MACH_TYPE_DESC
       , m.MACHINE_NBR
       , m.SERIAL_NBR
       , m.MPE_SFWE_VERSION_ID
       ,'''||v_SchemaName||'''       as SCHEMA_NAME
       ,to_date('''||v_DateRef||''') as DATE_REF
       ,NULL                         as RANDOM_REF_NUM_OPER
       ,'||v_RandomRefNum||'         as RANDOM_REF_NUM_NOT_OPER
  from  '||v_SchemaName||'.POSTAL_FACILITY@eorweb.usps.gov pf
       join '||v_SchemaName||'.MACHINE@eorweb.usps.gov m
         on pf.SITE_ID = m.SITE_ID
            join '||v_SchemaName||'.MACHINE_TYPE@eorweb.usps.gov mt
              on m.MACH_TYPE_CODE = mt.MACH_TYPE_CODE
                 join '||v_SchemaName||'.END_OF_RUN@eorweb.usps.gov er
                   on m.MACHINE_ID = er.MACHINE_ID              
 where m.MPE_SFWE_VERSION_ID is not null
   and UPPER(NMARS.NM_EQUIP_MODS.f_removeSpecialChar( REPLACE(pf.'||v_Scope||'_NAME,'' '','''') )) = '||''''||v_NADS_Name||'''
   and er.MODS_DATE between TRUNC(SYSDATE-10) and TRUNC(SYSDATE)
   order by 1,2,4,7,6';

-- TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
--  insert into nm_dynamic_sql_t_2 (sql_source, sql_statement)
--  values ('OPER', v_SQL_EOR_OPER);
--  insert into nm_dynamic_sql_t_2 (sql_source, sql_statement)
--  values ('NOTOPER', v_SQL_EOR_NOT_OPER);
-- TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
-----------------------------------------------------------------------------------------
-- 2.3
      OPEN c_AvailEOR_Recds_OPER FOR v_SQL_EOR_OPER;
          LOOP
              FETCH c_AvailEOR_Recds_OPER INTO r_AvailEOR_Recds_OPER;
              EXIT WHEN c_AvailEOR_Recds_OPER%NOTFOUND;

              insert into nm_sql_eor_temp
                (parent_id,child_id,nads_name,
                 area_name,
                 district_name,
                 site_id,
                 site_name,
                 mach_type_code,
                 mach_type_desc,
                 machine_nbr,
                 serial_nbr,
                 mpe_sfwe_version_id,
                 schema_name,
                 date_ref,
                 random_ref_num_oper,
                 random_ref_num_not_oper)
              values
                (NULL,NULL,NULL,
                 r_AvailEOR_Recds_OPER.area_name,
                 r_AvailEOR_Recds_OPER.district_name,
                 r_AvailEOR_Recds_OPER.site_id,
                 r_AvailEOR_Recds_OPER.site_name,
                 r_AvailEOR_Recds_OPER.mach_type_code,
                 r_AvailEOR_Recds_OPER.mach_type_desc,
                 r_AvailEOR_Recds_OPER.machine_nbr,
                 r_AvailEOR_Recds_OPER.serial_nbr,
                 r_AvailEOR_Recds_OPER.mpe_sfwe_version_id,
                 r_AvailEOR_Recds_OPER.schema_name,
                 r_AvailEOR_Recds_OPER.date_ref,
                 r_AvailEOR_Recds_OPER.random_ref_num_oper,
                 r_AvailEOR_Recds_OPER.random_ref_num_not_oper
                 );

-- TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
--insert into nm_sql_eor_test
--  (parent_id, child_id, nads_name, area_name, district_name, site_id, site_name, mach_type_code, mach_type_desc, machine_nbr, serial_nbr, mpe_sfwe_version_id, schema_name, date_ref, random_ref_num_oper, random_ref_num_not_oper)
--select parent_id, child_id, nads_name, area_name, district_name, site_id, site_name, mach_type_code, mach_type_desc, machine_nbr, serial_nbr, mpe_sfwe_version_id, schema_name, date_ref, random_ref_num_oper, random_ref_num_not_oper 
--from nm_sql_eor_temp;
-- TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
          END LOOP;
      CLOSE c_AvailEOR_Recds_OPER;
      
-- 2.4

      OPEN c_AvailEOR_Recds_NOT_OPER FOR v_SQL_EOR_NOT_OPER;
          LOOP
              FETCH c_AvailEOR_Recds_NOT_OPER INTO r_AvailEOR_Recds_NOT_OPER;
              EXIT WHEN c_AvailEOR_Recds_NOT_OPER%NOTFOUND;

              insert into nm_sql_eor_temp
                (parent_id,child_id,nads_name,
                 area_name,
                 district_name,
                 site_id,
                 site_name,
                 mach_type_code,
                 mach_type_desc,
                 machine_nbr,
                 serial_nbr,
                 mpe_sfwe_version_id,
                 schema_name,
                 date_ref,
                 random_ref_num_oper,
                 random_ref_num_not_oper)
              values
                (NULL,NULL,NULL,
                 r_AvailEOR_Recds_NOT_OPER.area_name,
                 r_AvailEOR_Recds_NOT_OPER.district_name,
                 r_AvailEOR_Recds_NOT_OPER.site_id,
                 r_AvailEOR_Recds_NOT_OPER.site_name,
                 r_AvailEOR_Recds_NOT_OPER.mach_type_code,
                 r_AvailEOR_Recds_NOT_OPER.mach_type_desc,
                 r_AvailEOR_Recds_NOT_OPER.machine_nbr,
                 r_AvailEOR_Recds_NOT_OPER.serial_nbr,
                 r_AvailEOR_Recds_NOT_OPER.mpe_sfwe_version_id,
                 r_AvailEOR_Recds_NOT_OPER.schema_name,
                 r_AvailEOR_Recds_NOT_OPER.date_ref,
                 r_AvailEOR_Recds_NOT_OPER.random_ref_num_oper,
                 r_AvailEOR_Recds_NOT_OPER.random_ref_num_not_oper);

-- TEST TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
--insert into nm_sql_eor_test
--  (parent_id, child_id, nads_name, area_name, district_name, site_id, site_name, mach_type_code, mach_type_desc, machine_nbr, serial_nbr, mpe_sfwe_version_id, schema_name, date_ref, random_ref_num_oper, random_ref_num_not_oper)
--select parent_id, child_id, nads_name, area_name, district_name, site_id, site_name, mach_type_code, mach_type_desc, machine_nbr, serial_nbr, mpe_sfwe_version_id, schema_name, date_ref, random_ref_num_oper, random_ref_num_not_oper 
--from nm_sql_eor_temp;
-- TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
          END LOOP;
      CLOSE c_AvailEOR_Recds_NOT_OPER;


END LOOP;
-----------------------------------------------------------------------------------------
    htp.p('<?xml version="1.0"?><ROWSET>');
      OPEN c_AvailEOR_Recds FOR v_SQL_HTML_Output;
          LOOP
              FETCH c_AvailEOR_Recds INTO r_AvailEOR_Recds;
              EXIT WHEN c_AvailEOR_Recds%NOTFOUND;

              htp.p('<ROW_EOR>
                         <AREA_NAME>'     ||r_AvailEOR_Recds.area_name     ||'</AREA_NAME>
                         <DISTRICT_NAME>' ||r_AvailEOR_Recds.district_name ||'</DISTRICT_NAME>
                         <SITE_ID>'       ||r_AvailEOR_Recds.site_id       ||'</SITE_ID>
                         <SITE_NAME>'     ||r_AvailEOR_Recds.site_name     ||'</SITE_NAME>
                         <MACH_TYPE_CODE>'||r_AvailEOR_Recds.mach_type_code||'</MACH_TYPE_CODE>
                         <MACH_TYPE_DESC>'||r_AvailEOR_Recds.mach_type_desc||'</MACH_TYPE_DESC>
                         <MACHINE_NBR>'   ||r_AvailEOR_Recds.machine_nbr   ||'</MACHINE_NBR>
                         <SERIAL_NBR>'    ||r_AvailEOR_Recds.serial_nbr    ||'</SERIAL_NBR>
                         <MPE_SFWE_VERSION_ID>'||r_AvailEOR_Recds.mpe_sfwe_version_id||'</MPE_SFWE_VERSION_ID>
                         <SCHEMA_NAME>'   ||r_AvailEOR_Recds.schema_name   ||'</SCHEMA_NAME>
                         <DATE_REF>'      ||r_AvailEOR_Recds.date_ref      ||'</DATE_REF>
                         <RANDOM_REF_NUM_OPER>'||r_AvailEOR_Recds.random_ref_num_oper||'</RANDOM_REF_NUM_OPER>
                         <RANDOM_REF_NUM_NOT_OPER>'||r_AvailEOR_Recds.random_ref_num_not_oper||'</RANDOM_REF_NUM_NOT_OPER>
                    </ROW_EOR>');
                    
          END LOOP;
      CLOSE c_AvailEOR_Recds;
    htp.p('</ROWSET>');
-----------------------------------------------------------------------------------------
COMMIT;
-----------------------------------------------------------------------------------------
EXCEPTION
    WHEN OTHERS THEN
        htp.p('Error ID:'||sqlcode||'<BR>');
        htp.p('Error Description:'||sqlerrm);

          -- ms47.MS47_SP_ERROR_LOG
          ms47.ms47_sp_error_log_pkg.MS47_SP_ERROR_LOG_PROC( SYSDATE
                                                           ,'NM_MPE_SOFT_PKG.sp_getHTML_Output'
                                                           ,-1
                                                           ,0
                                                           ,0
                                                           ,'x'
                                                           ,SQLCODE
                                                           ,SQLERRM
                                                          );
-----------------------------------------------------------------------------------------
END sp_getHTML_Output;
--=======================================================================================
PROCEDURE sp_getCalculatedDate(arg_DaysOffSysdate IN NUMBER)
IS
v_CalculatedDate VARCHAR2(10);
BEGIN

  SELECT to_Char(TRUNC(sysdate+arg_DaysOffSysdate),'MM/DD/YYYY')
    INTO v_CalculatedDate
    FROM dual;
htp.p('<?xml version="1.0"?><ROWSET>');
            htp.p('<ROW_DT>
                       <CALCULATED_DT>'||v_CalculatedDate||'</CALCULATED_DT>
                       <TODAYS_DT>'    ||to_Char(TRUNC(sysdate),'MM/DD/YYYY')||'</TODAYS_DT>
                  </ROW_DT>');
htp.p('</ROWSET>');
END sp_getCalculatedDate;
--=======================================================================================



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
END NM_MPE_SOFT_PKG_2;
/
