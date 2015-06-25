// JavaScript Document - JS_GENERIC.js
// VARIABLE DECLARATION:
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
//------------------------------------------------------------------------------
// GENERIC FUNCTIONS:
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function of_outPut(arg_WhereOutput, arg_WhatOutput){with(self.document.forms[0])
{
    //TEST: 
	//alert(arg_WhereOutput+"  "+ arg_WhatOutput)
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
			for (var e=0; e<elements.length; e++)
	  	  	{
				if (elements[e].name == v_CtrlName )
				{
					v_CtrlType = elements[e].type;
					break;	
				}
			}
			//
			if (v_CtrlType == "radio")
			{
				for(var r=0; r<eval(v_CtrlName+".length"); r++)
				{
					if(eval(v_CtrlName+"["+r+"].checked") == true )	
					{
						v_CtrlValue = eval(v_CtrlName+"["+r+"].value");
					}
				}
			}
	  }

}}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function of_roundNumber(arg_Number, arg_Decimal) {
    var v_RtnVal = Math.round(arg_Number*Math.pow(10,arg_Decimal))/Math.pow(10,arg_Decimal);
    return v_RtnVal;
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
function of_Trim(s) {//***
  s = s.replace(/(^\s*)|(\s*$)/gi,"");
  s = s.replace(/[ ]{2,}/gi," ");
  s = s.replace(/\n /,"\n");
  return s;
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
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
function f_testAlert(arg_Test1, arg_Test2)
{
	alert(arg_Test1+"  "+arg_Test2);
	//document.getElementById(arg_Test1).innerHTML = arg_Test2;
}
