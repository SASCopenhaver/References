// JavaScript Document NM_PM_COMPLETION.js
//==============================================================================
/* GENERIC variables and functions declared in "JS_GENERIC.js"
v_ValidationPassed
//------------------------------------------------------------------------------
v_DefaultValue
//------------------------------------------------------------------------------
v_CtrlName
v_CtrlID
v_CtrlType
v_CtrlValue
v_CtrlText
v_CtrlAlt
v_CtrlSize
//------------------------------------------------------------------------------
objAJAX
v_ArrayOfRecords
v_ArrayOfValuesInRecord
v_NumberOfRecords
//------------------------------------------------------------------------------
objRegExp_Date
objRegExp_onlyNumeric
objRegExp_onlyAlpha
objRegExp_onlyAlphaNumeric
//------------------------------------------------------------------------------
of_outPut(arg_WhereOutput, arg_WhatOutput);
of_setSingleValue(arg_CtrlName, arg_Value, arg_Text, arg_ZeroLength_YesNo, arg_Pos);
of_selectRecord(arg_CtrlName, arg_Value)
of_getCtrlProperties(arg_CtrlName)
of_roundNumber(arg_Number, arg_Decimal)
of_Trim(s)
of_isDateFormated(arg_Date)
of_LPad(arg_StrToSize, arg_PadLength, arg_PadChar)
of_RPad(arg_StrToSize, arg_Max_Str_Length, arg_PadChar)
of_Validation_DataPresence(arg_CtrlName)
*/
//==============================================================================
// Page specific VARIABLE DECLARATION begins ===================================
var v_OutPut = "";

var v_Date = new Date();
var v_CurrentYear = v_Date.getFullYear();

var v_DefaultYear_From = "Select Year - FROM";
var v_DefaultYear_To   = "Select Year - TO"

var v_DefaultPeriod_From = "Select Period - FROM____________________";
var v_DefaultPeriod_To   = "Select Period - TO______________________";
//var v_Default_Search = "___Search results will be listed here_____";

var v_Default_From = "Select Period - FROM____________________";
var v_Default_To   = "Select Period - TO______________________";
//var v_Default_Search = "___Search results will be listed here_____";

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
var v_DefaultSearchCriteria = "Is not defined.";
//------------------------------------------------------------------------------
var arrayCtrlNames = new Array();
	arrayCtrlNames = new Array(  "sel_Area"
								,"sel_Dist"
								,"sel_Site"
								,"sel_FY_From"
								,"sel_Period_From"
								,"sel_FY_To"
								,"sel_Period_To"
							  );


// Page specific VARIABLE DECLARATION ends =====================================
//==============================================================================
//==============================================================================
// Page specific FUNCTION DECLARATION begins ===================================
//------------------------------------------------------------------------------
function f_positionMainTable()
{
	v_OutPut = '<table width="100%" border="0" summary="Preventive Maintenance Reports">'+
				 '<caption class="PageTytle">'+
					'Preventive Maintenance Reports'+
				 '</caption>'+
					  '<tr>'+
							'<td valign="top" class="tblBG_Color1" width="50%">'+f_positionNADS()+'</td>'+
							'<td valign="top" class="tblBG_Color1" width="50%">'+f_positionDateSearchCriteria()+'</td>'+
					  '</tr>'+
					  '<tr>'+
							'<td valign="top" colspan="2" class="tblBG_Color1">'+f_positionSelectedCriteria()+'</td>'+
					  '</tr>'+
					  '<tr>'+
							'<td valign="top" colspan="2" class="tblBG_Color1">'+f_positionNavigation()+'</td>'+
					  '</tr>'+
					  '<tr>'+
							'<td valign="top" colspan="2" class="tblBG_Color1"><div id="div_dataOutput"></div></td>'+
					  '</tr>'+
			     '</table>';

	return v_OutPut;
}
//------------------------------------------------------------------------------
function f_positionNADS()
{
	v_OutPut = "<table width='100%' border='0' class='tblBG_Color1'>"+
				  "<tr>"+
					  "<td colspan='3' align='left'>"+
					  	"<font class='Ctrl_Title_12_Bold'>Hierarchical presentation of National/Areas - Districts - Sites relations</font><br />"+
					  	"<font class='Ctrl_Title_10_Norm'>ID for the references is shown in \"()\" </font>"+
						"<br /><br />"+
					  "</td>"+
				  "</tr>"+
				  "<tr>"+
					  "<td><font class='Ctrl_Title_10_Bold'>List of National/Areas</font></td>"+
					  "<td><font class='Ctrl_Title_10_Bold'>List of Districts</font></td>"+
					  "<td><font class='Ctrl_Title_10_Bold'>List of Sites</font></td>"+
				  "</tr>"+
				  "<tr>"+
					  "<td valign='top' width='33%'>"+
						  "<select id='sel_Area' "+
								  "name='sel_Area' "+ 
								  "alt='List of National/Areas' "+
								  "size='8' "+
								  "tabindex='1' "+
								  "onchange='f_onChange(this.name)' "+
								  "class='Select_Options'></select> "+
					  "</td>"+
					  "<td valign='top' width='33%'>"+
						  "<select id='sel_Dist' "+
								  "name='sel_Dist' "+ 
								  "alt='List of Districts' "+
								  "size='8' "+
								  "tabindex='2' "+
								  "onchange='f_onChange(this.name)' "+
								  "class='Select_Options'></select> "+
					  "</td>"+
					  "<td valign='top' width='33%'>"+
						  "<select id='sel_Site' "+
								  "name='sel_Site' "+ 
								  "alt='List of Sites' "+
								  "size='8' "+
								  "tabindex='3' "+
								  "onchange='f_onChange(this.name)' "+
								  "class='Select_Options'></select> "+
					  "</td>"+
				  "</tr>"+
			   "</table>";
	return v_OutPut;
} 
//------------------------------------------------------------------------------
function f_positionDateSearchCriteria()
{
	v_OutPut = "<table width='100%' border='0' class='tblBG_Color1'> "+
					  "<tr>"+
					  	  "<td colspan='2'>"+
						  		"<br />"+
								"<font class='Ctrl_Title_12_Bold'>FROM:&nbsp;&nbsp;&nbsp;&nbsp;</font>"+
								"<font class='Ctrl_Title_10_Norm'>(consider Start Date)</font> "+
						  "</td>"+
					  "</tr>"+
					  "<tr>"+
//						  "<td valign='top'>"+
//								 "<font class='Ctrl_Title_14'>FROM:</font> "+
//								 "<br />"+
//								 "<font class='Ctrl_Title_10_Norm'>(consider Start Date)</font> "+
//						  "</td>"+
						  "<td>"+
								 "<font class='Ctrl_Title_10_Bold'>Fyscal Year:</font>"+
								 //"<font class='Ctrl_Title_10_Norm'>(Step 1)</font>"+
								 "<br />"+
								 "<select id='sel_FY_From' "+
										 "name='sel_FY_From' "+
										 "size='1' "+
										 "alt='FROM: Fyscal Year' "+
										 "tabindex='4' "+
										 "onChange='f_onChange(this.name);' "+
										 "class='Select_Options'> "+
									 "<option value='-1' selected='selected'>Select Year - FROM</option>"+
								 "</select>"+
						  "</td>"+
						  "<td>"+
								 "<font class='Ctrl_Title_10_Bold'>Period:&nbsp;&nbsp;&nbsp;&nbsp;</font>"+
								 //"<font class='Ctrl_Title_10_Norm'>(Step 2)</font>"+
								 "<br />"+
								 "<select id='sel_Period_From' "+
										 "name='sel_Period_From' "+
										 "size='1' "+
										 "alt='FROM: Period' "+
										 "tabindex='5' "+
										 "onChange='f_onChange(this.name);' "+
										 "class='Select_Options'> "+
								 "</select>"+
						  "</td>"+
					  "</tr>"+
					  "<tr>"+
					  	  "<td colspan='2'>"+
						  		"<br \><br \>"+
						  "</td>"+
					  "</tr>"+
					  "<tr>"+
					  	  "<td colspan='2'>"+
						  		"<font class='Ctrl_Title_12_Bold'>TO:&nbsp;&nbsp;&nbsp;&nbsp;</font>"+
								"<font class='Ctrl_Title_10_Norm'>(consider End Date)</font> "+
						  "</td>"+
					  "</tr>"+
					  "<tr>"+
//						  "<td>"+
//								 "<font class='Ctrl_Title_14'>TO:</font>"+
//								 "<br />"+
//								 "<font class='Ctrl_Title_10_Norm'>(consider End Date)</font>"+
//						  "</td>"+
						  "<td>"+
								 "<font class='Ctrl_Title_10_Bold'>Fyscal Year:</font>"+
								 //"<font class='Ctrl_Title_10_Norm'>(Step 3)</font>"+
								 "<br />"+
								 "<select id='sel_FY_To' "+
										 "name='sel_FY_To' "+
										 "size='1' "+
										 "alt='TO: Fyscal Year' "+
										 "tabindex='6' "+
										 "onChange='f_onChange(this.name);' "+
										 "class='Select_Options'>"+
									  "<option value='-1' selected='selected'>Select Year - TO  </option>' "+
								 "</select>"+
						  "</td>"+
						  "<td>"+
								 "<font class='Ctrl_Title_10_Bold'>Period:</font>"+
								 //"<font class='Ctrl_Title_10_Norm'>(Step 4)</font>"+
								 "<br />"+
								 "<select id='sel_Period_To' "+
										 "name='sel_Period_To' "+
										 "size='1' "+
										 "alt='TO: Period' "+
										 "tabindex='7' "+
										 "onChange='f_onChange(this.name);' "+
										 "class='Select_Options'>"+
								 "</select>"+
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
						"<td width='15%' align='left'>"+ //
							"<font class='Ctrl_Title_10_Bold'>Location search criteria:</font>"+
						"</td>"+
//						"<td width='5%' align='right'>"+
//							"<font class='Ctrl_Title_10_Norm'>Location:</font>"+
//						"</td>"+
						"<td width='80%'>"+
							"<div id='id_NADS_SearchCriteria' class='Data_10_Navy_Bold'></div>"+
							"<input type='hidden' id='hdn_LocationType' name='hdn_LocationType' value=''/>"+
							"<input type='hidden' id='hdn_LocationID'   name='hdn_LocationID'   value=''/>"+
						"</td>"+
//						"<td width='1%'>&nbsp;</td>"+
//						"<td width='10%' align='right'>"+
//							"<font class='Ctrl_Title_10_Norm'>Fiscal Year/Period:</font>"+
//							"<input type='hidden' id=hdn_FY' name='hdn_FY' />"+
//							"<input type='hidden' id=hdn_' name='hdn_' />"+
//							"</td>"+
//						"<td width='34%'>"+
//							"<div id='id_FY_Period_SearchCriteria' class='Data_10_Navy_Bold'></div>"+
//						"</td>"+
					"</tr>"+
			   "</table>";
	
	return v_OutPut;	
}
//------------------------------------------------------------------------------
function f_positionNavigation()
{
	v_OutPut = "<table align='center' border='0' class='tblBG_Color1'>"+
					  "<tr valign='top'>"+
						  "<td>"+
							  "<input name='cb_Execute' "+
									 "id='cb_Execute' "+
									 "onclick='f_onClick(this.name);' "+
									 "type='button' "+
									 "tabindex='8' "+
									 "value='EXECUTE'/>"+
							   "<input type='hidden' id='h_Random_Num' name='h_Random_Num' value='' />"+
						  "</td>"+
						  "<td>"+
							  "<input name='cb_Reset1' "+
									 "id='cb_Reset1' "+
									 "onclick='f_onClick(this.name);' "+
									 "type='button' "+
									 "tabindex='9' "+
									 "value='&nbsp;&nbsp;&nbsp;RESET&nbsp;&nbsp;&nbsp;'/>"+
						  "</td>"+						  
						  "<td>"+
							  "<input name='cb_MainMenu1' "+
									 "id='cb_MainMenu1' "+
									 "onclick='f_onClick(this.name);' "+
									 "type='button' "+
									 "tabindex='10' "+
									 "value='MAIN MENU'/>"+
						  "</td>"+
						  "<td>"+
							  "<input name='cb_Exit1' "+
									 "id='cb_Exit1' "+
									 "onclick='f_onClick(this.name);' "+
									 "type='button' "+
									 "tabindex='11' "+
									 "value='&nbsp;&nbsp;&nbsp;EXIT&nbsp;&nbsp;&nbsp;'/>"+
						  "</td>"+
					  "</tr>"+
				"</table>";
	
	return v_OutPut;
}
//------------------------------------------------------------------------------
function f_onClick(arg_CtrlName)
{
	switch(arg_CtrlName)
	{
		case "cb_Execute":
			//v_ValidationPassed == "YES";
			// arrayCtrlNames is declared above
			for (var c=0; c<arrayCtrlNames.length; c++)
			{
				if (arrayCtrlNames[c] != "sel_Area" && arrayCtrlNames[c] != "sel_Dist" && arrayCtrlNames[c] != "sel_Site")	
				{
					v_ValidationPassed = of_Validation_DataPresence(arrayCtrlNames[c]);
					if (v_ValidationPassed == "NO"){ break; }
				}
			}
			//
			if (v_ValidationPassed == "YES")
			{
				f_getData();	
			}
		break;
		//
		case "cb_Reset1":
			f_resetScreen();
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
	}
}
//------------------------------------------------------------------------------
function f_onChange(arg_CtrlName)
{
	switch(arg_CtrlName)
	{
		case "sel_Area":
			f_onChange_Area();
			f_outputSearchCriteria_Location();
		break;
		//
		case "sel_Dist":
			f_onChange_Dist();
			f_outputSearchCriteria_Location();
		break;
		//
		case "sel_Site":
//			f_onChange_Site(); <-- function does not exist
			f_outputSearchCriteria_Location();
		break;
		//
		case "sel_FY_From":
			f_onChange_FY_From();
			//f_outputSearchCriteria_FY_Period();
		break;
		//
		case "sel_Period_From":
			f_onChange_Period_From();
			//f_outputSearchCriteria_FY_Period();
		break;
		//
		case "sel_FY_To":
			f_onChange_FY_To();
			//f_outputSearchCriteria_FY_Period();
		break;
		//
		case "sel_Period_To":
			//f_onChange_Period_To(); <-- function does not exist
			//f_outputSearchCriteria_FY_Period();
		break;
	} // end of switch
}
//------------------------------------------------------------------------------
function f_onChange_Area()
{
	of_getCtrlProperties("sel_Area");
	
	if (v_CtrlValue == "NTNL")
	{
		of_setSingleValue("sel_Dist", v_DefaultValue, "======== Districts: ALL ========", "YES", 0);
		of_setSingleValue("sel_Site", v_DefaultValue, "======== Sites: ALL ============", "YES", 0);
		
		of_selectRecord("sel_Dist", v_DefaultValue);
		of_selectRecord("sel_Site", v_DefaultValue);	
	}
	else
	{
		f_getsetNADS("DIST", v_CtrlValue);
		of_setSingleValue("sel_Site", v_DefaultValue, "== Selected District Sites: 0 ==", "YES", 0);
		
		of_selectRecord("sel_Dist", v_DefaultValue);
		of_selectRecord("sel_Site", v_DefaultValue);
	}
}
//------------------------------------------------------------------------------
function f_onChange_Dist()
{
	of_getCtrlProperties("sel_Dist");
	
	if (v_CtrlValue == v_DefaultValue)
	{
		of_setSingleValue("sel_Site", v_DefaultValue, "== Selected District Sites: 0 ==", "YES", 0);	
	}
	else
	{
		f_getsetNADS("SITE", v_CtrlValue);
	}
	
	of_selectRecord("sel_Site", v_DefaultValue);
	
}
//------------------------------------------------------------------------------
function f_getsetNADS(arg_NADS_Type, arg_ID)
{
	v_Option_Value = "";
	v_Option_Text  = "";
	// 1. Retrieve data:
	objAJAX.load("NMARS.NM_PM_COMPLETION33.sp_getNADS?p_NADS_Type="+arg_NADS_Type+
													"&p_ID="+arg_ID);
	// 2. Populate retrieved data:
	v_ArrayOfRecords  = objAJAX.getElementsByTagName("ROW");
	v_NumberOfRecords = v_ArrayOfRecords.length;//TEST: alert(v_NumberOfRecords);
	// 2.1 ..................................................................... 
	if (arg_NADS_Type == "AREA") 
	{
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
		
		of_selectRecord("sel_Area", "NTNL"); //<-- Highligths the first record in control "sel_Area".
		f_onChange("sel_Area"); //<-- removes records from "sel_Dist" and "sel_Site".
		
	}
	// 2.2 ......................................................................
	else if (arg_NADS_Type == "DIST") 
	{
		of_setSingleValue("sel_Dist", v_DefaultValue, "== Selected Area Districts: "+v_NumberOfRecords+" ==", "YES", 0);
		
		for (var r=0; r<v_NumberOfRecords; r++)
		{
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			v_Option_Value = v_ArrayOfValuesInRecord[0].text;
			v_Option_Text  = v_ArrayOfValuesInRecord[1].text;
			
			of_setSingleValue("sel_Dist", v_Option_Value, of_RPad("("+v_Option_Value+")",8,'.')+v_Option_Text, "NO", r+1);
		}
	}
	// 2.3 .....................................................................
	else if (arg_NADS_Type == "SITE")
	{
		of_setSingleValue("sel_Site", v_DefaultValue, "== Selected District Sites: "+v_NumberOfRecords+" ==", "YES", 0);
		
		for (var r=0; r<v_NumberOfRecords; r++)
		{
			v_ArrayOfValuesInRecord = v_ArrayOfRecords(r).childNodes;
			v_Option_Value = v_ArrayOfValuesInRecord[0].text;
			v_Option_Text  = v_ArrayOfValuesInRecord[1].text;
			
			of_setSingleValue("sel_Site", v_Option_Value, of_RPad("("+v_Option_Value+")",8,'.')+v_Option_Text, "NO", r+1);	
		}
	}
	//..........................................................................
}
//------------------------------------------------------------------------------
function f_resetScreen()
{
	of_selectRecord("sel_Area", "NTNL");
	f_onChange_Area();
	of_selectRecord("sel_FY_From", v_DefaultValue);
	f_reset_FYandPeriods();
	f_outputSearchCriteria_Location();
}
//------------------------------------------------------------------------------
function f_onChange_FY_From(){with(self.document.forms[0])
{
	  var yy = 0;
      var v_SP_Call = "";
      var v_FY_To = "";
      var v_Period_From = "";
	  
	  of_getCtrlProperties("sel_FY_From");
	  
	  if (v_CtrlValue < 0)
	  {
			f_reset_FYandPeriods();
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
		  //
		  // 4.
		  of_setSingleValue("sel_Period_To", v_DefaultValue, v_Default_To, "YES", 0);	
	  }
}}
//------------------------------------------------------------------------------
function f_onChange_Period_From(){with(self.document.forms[0])
{
	of_getCtrlProperties("sel_Period_From");
	
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
	
}}
//------------------------------------------------------------------------------
function f_onChange_FY_To(){with(self.document.forms[0])
{
	 of_getCtrlProperties("sel_FY_To");
	 
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
}}
//------------------------------------------------------------------------------
function f_reset_FYandPeriods()
{
	of_setSingleValue("sel_Period_From", v_DefaultValue, v_Default_From, "YES", 0);
	of_setSingleValue("sel_FY_To", v_DefaultValue, "Select Year - TO  ", "YES", 0);
	of_setSingleValue("sel_Period_To", v_DefaultValue, v_Default_To, "YES", 0);
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
function f_getData(){with(self.document.forms[0])
{
	var v_LocationType = "NTNL";
	var v_LocationID   = "NTNL";
	//var v_FY_From	   = "-1";
	var v_PeriodPtr_From  = "-1";
	//var v_FY_To	       = "-1";
	var v_PeriodPtr_To	   = "-1";
	
	of_getCtrlProperties("hdn_LocationType");
	v_LocationType = v_CtrlValue;
	
	of_getCtrlProperties("hdn_LocationID");
	v_LocationID = v_CtrlValue;
	
	of_getCtrlProperties("sel_Period_From");
	v_PeriodPtr_From = v_CtrlValue;
	
	of_getCtrlProperties("sel_Period_To");
	v_PeriodPtr_To = v_CtrlValue;
	
	alert("Line 802 "+v_PeriodPtr_From+"  "+v_PeriodPtr_To)
	
	objAJAX.load("NMARS.NM_PM_COMPLETION33.sp_getData?p_LocationType="+v_LocationType+
													"&p_LocationID="+v_LocationID+
													"&p_PeriodPtr_From="+v_PeriodPtr_From+
													"&p_PeriodPtr_To="+v_PeriodPtr_To
													);
	
}}
//------------------------------------------------------------------------------
/*

Sricpt of the following function is not finished


function f_outputSearchCriteria_FY_Period(){with(self.document.forms[0])
{
	var v_SearchFYP = ""; // FYP - Fyscal Year and Period
	
	of_getCtrlProperties("sel_FY_From");
	var v_FY_From = v_CtrlValue;
	var v_Search_FY_From = "FROM Fyscal Year:";
	//alert("v_FY_From  "+v_FY_From)
	
	
	of_getCtrlProperties("sel_Period_From");
	var v_Period_From = v_CtrlValue;
	var v_Search_Period_From = "FROM Date:";
	//alert("v_Period_From  "+v_Period_From)
	
	of_getCtrlProperties("sel_FY_To");
	var v_FY_To = v_CtrlValue;
	var v_Search_FY_To = "TO Fyscal Year ";
	//alert("v_FY_To  "+v_FY_To)
	
	
	of_getCtrlProperties("sel_Period_To");
	var v_Period_To = v_CtrlValue;
	var v_Search_Period_To = "TO Date ";
	//alert("v_Period_To  "+v_Period_To)
	//alert(v_FY_From+"  "+ v_Period_From+"  "+ v_FY_To+"  "+ v_Period_To)
	//..........................................................................
	if (v_Period_To < 0)
	{
		if (v_FY_To < 0)
		{
			if (v_Period_From < 0)
			{
				if (v_FY_From < 0)
				{
					v_Search_FY_From = v_Search_FY_From+v_DefaultSearchCriteria+"; ";
				}
				else
				{
					of_getCtrlProperties("sel_FY_From");
					v_Search_FY_From = v_Search_FY_From+v_CtrlValue;		
				}
			}
			else
			{
				of_getCtrlProperties("sel_Period_From");
				v_SearchFYP = v_CtrlValue;	
			}
		}
		else
		{
			of_getCtrlProperties("sel_FY_To");
			v_SearchFYP = v_CtrlValue;
		}
	}
	else
	{
		of_getCtrlProperties("sel_Period_To");
		v_SearchFYP = v_CtrlValue;
	}
	
	v_SearchFYP = v_Search_FY_From+v_Search_Period_From+v_Search_FY_To+v_Search_Period_To;
	
	of_outPut("id_FY_Period_SearchCriteria", v_SearchFYP);
	
}}
*/
//------------------------------------------------------------------------------
// Page specific FUNCTION DECLARATION ends =====================================
//==============================================================================
//==============================================================================
// INITIAL ACTIONS:
of_outPut("div_Page", f_positionMainTable());
//
f_getsetNADS("AREA","NTNL"); //<-- Request for National/Areas
//
of_setSingleValue("sel_FY_From",     v_DefaultValue,  v_DefaultYear_From,  "YES", 0);
of_setSingleValue("sel_FY_From",     v_CurrentYear-2, v_CurrentYear-2,     "NO", 1);
of_setSingleValue("sel_FY_From",     v_CurrentYear-1, v_CurrentYear-1,     "NO", 2);
of_setSingleValue("sel_FY_From",     v_CurrentYear,   v_CurrentYear,       "NO", 3);
of_setSingleValue("sel_FY_From",     v_CurrentYear+1, v_CurrentYear+1,     "NO", 4);
of_setSingleValue("sel_Period_From", v_DefaultValue,  v_DefaultPeriod_From,"YES", 0);
//
of_setSingleValue("sel_FY_To",     v_DefaultValue, v_DefaultYear_To, 0);
of_setSingleValue("sel_Period_To", v_DefaultValue, v_DefaultPeriod_To, "YES", 0);
//
of_selectRecord("sel_FY_From",     v_DefaultValue);
of_selectRecord("sel_FY_To",       v_DefaultValue);
of_selectRecord("sel_Period_From", v_DefaultValue);
of_selectRecord("sel_Period_To",   v_DefaultValue);
//
of_outPut("id_NADS_SearchCriteria",      v_DefaultSearchCriteria);
//of_outPut("id_FY_Period_SearchCriteria", v_DefaultSearchCriteria);
//
f_outputSearchCriteria_Location();
//f_outputSearchCriteria_FY_Period();
