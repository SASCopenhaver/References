<!--- inc_ListPrograms_p1.cfm --->
<script language="javascript" type="text/javascript">
//
//------------------------------------------------------------------------------------------------------------

function f_LaundryText(arg_vValue1){with(self.document.forms[0])
{
	var vRtn = "";
	var vChar = "";
	for (var c=0; c<arg_vValue1.length; c++)
	{
		// Code 13 is "next line"; Code 39 is "'"- single quote
			 if (arg_vValue1.charCodeAt(c) == 13) { vChar = " "; }
		else if (arg_vValue1.charCodeAt(c) == 39) { vChar = "`"; }
		else                                      { vChar = arg_vValue1.charAt(c); }
		//
		vRtn = vRtn + vChar;
	}
	//
	return vRtn;
}}

//
//--------------------------------------------------------------------------------------------------------

var vPgmID = 0; 
var vAlnmID = 0;
var vPosTemp = 0;
function f_getPgmIDandAlmnID(argElementNm){with(self.document.forms[0]){
	{
			vPosTemp = argElementNm.lastIndexOf("_");
			vAlmnID = argElementNm.substr( parseInt(vPosTemp)+1, argElementNm.length );
			//
			vPgmID = argElementNm.substr(0, vPosTemp);
			vPosTemp = vPgmID.lastIndexOf("_");
			vPgmID = vPgmID.substr( parseInt(vPosTemp)+1, vPgmID.length )
	}
}}
//
//---------------------------------------------------------------------------------------------------------

function f_showPlaceVisited(){with(self.document.forms[0]){
	
	var vOutputPV = "";
	var vCounter = 0;
	var vRtn = "";
	//
	
	
	//
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].name.substr(0,13) == "cbx_pgm_almn_" && elements[e].checked == true)
		{
			vCounter++;
			
		}
	}
	//
	if (vCounter != 0)	
	{
			vOutputPV += "<table width=\"100%\"  border=\"0\" cellspacing=\"2\" cellpadding=\"2\">";
			vOutputPV += "<tr>";
						vOutputPV += "<td colspan=\"7\">";
						vOutputPV += "<table align=\"left\" width=\"100%\" border=\"0\" >";
						vOutputPV += "<tr><th width=\"40%\" style=\"border-bottom:1px solid Gray;\" align=\"right\">PLACES VISITED</th>";
						vOutputPV += "<td class=\"c_fieldValueRed\" align=\"left\">ONLY SELECTED \"Places Visited\" WILL REMAIN IN DATABASE. ALL NOT SEECTED \"Places Visited\" WILL BE PERMANENTLY DELETED. </th></tr>";
						vOutputPV += "</table><br>";
					vOutputPV += "</td>";
					
			vOutputPV += "</tr>";
			vOutputPV += "<tr>";
					vOutputPV += "<th>Select</th>";
					vOutputPV += "<th>pgm_id</th>";
					vOutputPV += "<th>pgm_almn_id</th>";
					vOutputPV += "<th>City</th>";
					vOutputPV += "<th>State / Province</th>";
					vOutputPV += "<th>Country</th>";
					vOutputPV += "<th>Host Institution</th>";
			vOutputPV += "</tr>";
			//
			for (var e=0; e<elements.length; e++)// loop 1
			{
					if (elements[e].name.substr(0,13) == "cbx_pgm_almn_" && elements[e].checked == true)
					{
							//
							f_getPgmIDandAlmnID(elements[e].name);
							//
							vRtn = f_checkRelatedPVRecords(vPgmID, vAlmnID);
							if (vRtn != "")
							{
								vOutputPV += vRtn
							}
					}
			}//end of loop 
			//
			vOutputPV += "</table>";
			
	}
	//
	of_innerHTML("id_OutPutPlaceVisited", "'"+vOutputPV+"'");
}}
//
//-----------------------------------------------------------------------------------------------------------------

function f_checkRelatedPVRecords(argPgmID, argAlmnID){with(self.document.forms[0]){
	var vOut = "";
	for (var v=0; v<orgBfrPV.length; v++)
	{
		if(orgBfrPV[v].aplace_visit_pgm_id == argPgmID && orgBfrPV[v].aplace_visit_almn_id == argAlmnID)
		{
			
			vOut += "<tr>";
				vOut += "<td>"+"<input type=\"checkbox\"  name=\"cbx_place_visit_pgm_id_almn_id_"+orgBfrPV[v].aplace_visit_pgm_id+"_"+orgBfrPV[v].aplace_visit_almn_id+"\">"+"</td>";
				vOut += "<td>"+orgBfrPV[v].aplace_visit_pgm_id+"</td>";
				vOut += "<td>"+orgBfrPV[v].aplace_visit_almn_id+"</td>";
				vOut += "<td>"+"<input type=\"text\" class=\"forminputs\" name=\"txt_place_visit_city_nm_"+orgBfrPV[v].aplace_visit_pgm_id+"\" value=\""+orgBfrPV[v].aplace_visit_city_nm+"\">";
				//vOut += "<td>"+orgBfrPV[v].aplace_visit_city_nm+"</td>";
				vOut += "<td>"+"<input type=\"text\" class=\"forminputs\" name=\"txt_place_visit_state_prvnc_nm_"+orgBfrPV[v].aplace_visit_pgm_id+"\" value=\""+orgBfrPV[v].aplace_visit_state_prvnc_nm+"\">";
				//vOut += "<td>"+orgBfrPV[v].aplace_visit_state_prvnc_nm+"</td>"; 
				vOut += "<td>"+orgBfrPV[v].aplace_visit_cntry_nm+"</td>";
				vOut += "<td>"+"<input type=\"text\" class=\"forminputs\" name=\"txt_place_visit_host_instn_nm_"+orgBfrPV[v].aplace_visit_pgm_id+"\" value=\""+orgBfrPV[v].aplace_visit_host_instn_nm+"\">";
				//vOut += "<td>"+orgBfrPV[v].aplace_visit_host_instn_nm+"</td>";
			vOut += "</tr>";
			break;
		}
	}
	//
	return vOut;

}}

//
//------------------------------------------------------------------------------------------------


function f_DataOutput(argColumnNm){with(self.document.forms[0])
{
	var vRtn = "";
	var vValTemp = "";
	//
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].name.substr(0,13) == "cbx_pgm_almn_" && elements[e].checked == true)
		{
			for (var p=0; p<orgBfrLOP.length; p++)
			{
				if (elements[e].name == "cbx_pgm_almn_"+orgBfrLOP[p].apgm_id+"_"+orgBfrLOP[p].apgm_almn_id 
					&&
					elements[e].checked == true
					)
				{
					vRtn += "<td>";
					if ( argColumnNm == "pgm_id" || argColumnNm == "pgm_src_nm")
					{
						vRtn += "&nbsp;";
					}
					else
					{
						vRtn += "<input type=\"checkbox\" name=\"cbx_"+argColumnNm+"_"+orgBfrLOP[p].apgm_id+"\" value=\""+ eval("orgBfrLOP[p].a"+argColumnNm) +"\"  onClick=\"JavaScript: f_setMrgdValue(this.value, this.name,"+orgBfrLOP[p].apgm_id+", "+orgBfrLOP[p].apgm_almn_id+");\">";
					}
					//
					vValTemp = eval("orgBfrLOP[p].a"+argColumnNm);
					if (vValTemp == ""){vValTemp = "---";}
					//
					vRtn += vValTemp;
					vRtn += "</td>";
					//
					break;
				}
			}
		}
	}
	//alert(vRtn)
	return vRtn;
}}
//
//-----------------------------------------------------------------------------------------------

function f_onClickShowPgmDetails(){with(self.document.forms[0])
{
	var vCounter = 0;
	var vOutput = "";
	var vOutPutPV = "";
	vNumOfSelctdPgm = 0;
	
	//
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].name.substr(0,13) == "cbx_pgm_almn_" && elements[e].checked == true)
		{
			vCounter++;
			vNumOfSelctdPgm++;
		}
	}
	//alert(vNumOfSelctdPgm)
	
	//
	if (vCounter == 0) 
	{ 
		vOutput = "&nbsp;"; 
		vOutPutPV = "&nbsp;"; 
	}
	else
	{
	 
			vOutput += "<table width=\"100%\"  border=\"0\" cellspacing=\"2\" cellpadding=\"2\">";
			vOutput += "<tr><td>";
			//=================================================================================================================================
				   vOutput += "<table align=\"left\" width=\"40%\" border=\"0\" style=\"border-bottom:1px solid Gray;\"><tr><th align=\"right\">PROGRAM DETAILS&nbsp;&nbsp;<font color=\#FF0000\" size=\"+2\">*</font> - required field</th></tr></table><br>";
			//=================================================================================================================================	   
			vOutput += "</td></tr>";
			vOutput += "<tr><td>";
			//=================================================================================================================================
				   //
				   vOutput += "<table width=\"100%\" border=\"0\">";
					
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">pgm_id</th>";
							vOutput += f_DataOutput("pgm_id");
							vOutput += "<td align=\"left\" >";
							//vOutput += "<input type=\"text\" name=\"txt_mrgd_pgm_id\" class=\"forminputs\" value=\"\">";
							vOutput += "<cfoutput>#client.AP_AlmnID#</cfoutput>";
							vOutput += "</td>";
					vOutput += "</tr>";
					
					///////////////////////////////////////////////////////////////////////////////////////////////////////////////
					//<font color="##FF0000" size="+2">*</font> - required field
					vOutput += "<tr>";
							for (var i=0; i<parseInt(vCounter)+2; i++)
							{
								vOutput += "<th><hr></th>";
							}
					vOutput += "</tr>";
										
					vOutput += "<tr bgcolor=\"#CCCCCC\">";
							vOutput += "<th width=\"10%\" align=\"left\">Prg. Name</th>";
							vOutput += f_DataOutput("pgm_type_nm");
							vOutput += "<td align=\"left\"  bordercolor=\"#CCCCCC\">&nbsp;";
							
							//vOutput += "<input type=\"hidden\" name=\"h_pgm_type_cd\" value=\"\">";
							
							//vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font><input type=\"text\" id=\"txt_mrgd_pgm_type_nm\" name=\"txt_mrgd_pgm_type_nm\" class=\"forminputs\" value=\"\">";
							//vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font>";
							//vOutput += "<select name=\"ddlb_mrgd_pgm_type_nm\" id=\"txt_mrgd_pgm_type_nm\" class=\"forminputs\"></select>";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr bgcolor=\"#CCCCCC\">";
							vOutput += "<td colspan=\""+(parseInt(vCounter)+2)+"\" align=\"right\">";
							//vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font><input type=\"text\" id=\"txt_mrgd_pgm_type_nm\" name=\"txt_mrgd_pgm_type_nm\" class=\"forminputs\" value=\"\">";
							vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font>";
							vOutput += "<select name=\"ddlb_mrgd_pgm_type_nm\" id=\"txt_mrgd_pgm_type_nm\" class=\"forminputs\"></select><br>&nbsp;";
							vOutput += "</td>";
					vOutput += "</tr>";
															
					vOutput += "<tr bgcolor=\"#EFEFEF\">";
							vOutput += "<th width=\"10%\" align=\"left\">Prg. Fiscal Year</th>";
							vOutput += f_DataOutput("pgm_fy_dt");
							vOutput += "<td align=\"left\">";
							vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font><input type=\"text\" id=\"txt_mrgd_pgm_fy_dt\" name=\"txt_mrgd_pgm_fy_dt\" class=\"forminputs\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					
					vOutput += "<tr bgcolor=\"#CCCCCC\">";
							vOutput += "<th width=\"10%\" align=\"left\">Prg. Year</th>";
							vOutput += f_DataOutput("pgm_yr_dt");
							vOutput += "<td align=\"left\">";
							vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font><input type=\"text\" id=\"txt_mrgd_pgm_yr_dt\" name=\"txt_mrgd_pgm_yr_dt\" class=\"forminputs\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
										
					vOutput += "<tr bgcolor=\"#EFEFEF\">";
							vOutput += "<th width=\"10%\" align=\"left\">Country From</th>";
							vOutput += f_DataOutput("pgm_from_cntry_nm"); 
							vOutput += "<td align=\"left\">";
							//vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font><input type=\"text\" id=\"txt_mrgd_pgm_from_cntry_nm\" name=\"txt_mrgd_pgm_from_cntry_nm\" class=\"forminputs\" value=\"\">";
							//
							vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font>";
							vOutput += "<select name=\"ddlb_mrgd_pgm_from_cntry_nm\" id=\"txt_mrgd_pgm_from_cntry_nm\" class=\"forminputs\"></select>";
							
							//vOutput += "<input type=\"hidden\" name=\"h_pgm_from_cntry_cd\" value=\"\">";
							
							//
							vOutput += "</td>";
					vOutput += "</tr>";
										
					vOutput += "<tr bgcolor=\"#CCCCCC\">";
							vOutput += "<th width=\"10%\" align=\"left\">Country To</th>";
							vOutput += f_DataOutput("pgm_to_cntry_nm");
							vOutput += "<td align=\"left\">";
							//vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font><input type=\"text\" id=\"txt_mrgd_pgm_to_cntry_nm\" name=\"txt_mrgd_pgm_to_cntry_nm\" class=\"forminputs\" value=\"\">";
							//
							vOutput += "<font color=\"#FF0000\" size=\"+2\">*</font>";
							vOutput += "<select name=\"ddlb_mrgd_pgm_to_cntry_nm\" id=\"txt_mrgd_pgm_to_cntry_nm\" class=\"forminputs\"></select>";
							
							//vOutput += "<input type=\"hidden\" name=\"h_pgm_to_cntry_cd\" value=\"\">";
							
							//
							vOutput += "</td>";
					vOutput += "</tr>";
					
					vOutput += "<tr>";
							for (var i=0; i<parseInt(vCounter)+2; i++)
							{
								vOutput += "<th><hr></th>";
							}
					vOutput += "</tr>";
					/////////////////////////////////////////////////////////////////////////////////////////////////////////////
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Prg. Start Date</th>";
							vOutput += f_DataOutput("pgm_start_dt"); 
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_start_dt\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Prg. End Date</th>";
							vOutput += f_DataOutput("pgm_end_dt");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_end_dt\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Field fo Study</th>";
							vOutput += f_DataOutput("pgm_field_stdy_nm");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input disabled type=\"text\" id=\"\" name=\"txt_mrgd_pgm_field_stdy_nm\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Agency</th>";
							vOutput += f_DataOutput("pgm_agcy_nm");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_agcy_nm\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Placement Org.</th>";
							vOutput += f_DataOutput("pgm_plcmnt_org_nm"); 
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_plcmnt_org_nm\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Nominating Org.</th>";
							vOutput += f_DataOutput("pgm_nmtng_org_nm");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_nmtng_org_nm\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Sub-Category</th>";
							vOutput += f_DataOutput("pgm_sub_ctgry_txt");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_sub_ctgry_txt\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Topic</th>";
							vOutput += f_DataOutput("pgm_topic_txt");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_topic_txt\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Strategic Goal</th>";
							vOutput += f_DataOutput("pgm_strtgc_goal_txt");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_strtgc_goal_txt\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>"; 
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Special Award</th>";
							vOutput += f_DataOutput("pgm_spcl_award_txt");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_spcl_award_txt\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Updated Date</th>";
							vOutput += f_DataOutput("pgm_updt_dt");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_updt_dt\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Updated by</th>";
							vOutput += f_DataOutput("pgm_updt_id");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_updt_id\" class=\"forminputs\" size=\"33\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
					vOutput += "<tr>";
							vOutput += "<th width=\"10%\" align=\"left\">Source Name</th>";
							vOutput += f_DataOutput("pgm_src_nm");
							vOutput += "<td align=\"left\" width=\"10%\">";
							vOutput += "Merged record";
							//vOutput += "<input type=\"text\" id=\"\" name=\"txt_mrgd_pgm_src_nm\" class=\"forminputs\" value=\"\">";
							vOutput += "</td>";
					vOutput += "</tr>";
						
					vOutput += "</table>";
			//=================================================================================================================================	   
			vOutput += "</td></tr>";
			//=================================================================================================================================
			vOutput += "</table>";
			
	}
	//
	of_innerHTML("id_Output", "'"+vOutput+"'");
	//
	if (vOutput != "&nbsp;")
	{
		//
		of_populateSelect( "ddlb_mrgd_pgm_from_cntry_nm", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
		of_populateSelect( "ddlb_mrgd_pgm_to_cntry_nm", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );		
		of_populateSelect( "ddlb_mrgd_pgm_type_nm", "-1", "=== Select Program ===", rowsPT, "orgBfrPT", "apgm_type_crnt_cd", "apgm_type_nm", "2D" );		
		//
		f_setMergedData();
		//
	}
	
	//
	f_showPlaceVisited();
	//
	f_showButtons();
	//
}}
//
//------------------------------------------------------------------------------------------------

function f_setMergedData(){with(self.document.forms[0]){
		f_setValueToCrtl_DDLB("pgm_type_nm");
		f_setValueToCrtl_Txt("pgm_fy_dt"); 
		f_setValueToCrtl_Txt("pgm_yr_dt");
	 	f_setValueToCrtl_DDLB("pgm_from_cntry_nm");
		f_setValueToCrtl_DDLB("pgm_to_cntry_nm");
		f_setValueToCrtl_Txt("pgm_start_dt"); 
		f_setValueToCrtl_Txt("pgm_end_dt");
		
		f_setValueToCrtl_Txt("pgm_field_stdy_nm");
		
		f_setValueToCrtl_Txt("pgm_agcy_nm");
		f_setValueToCrtl_Txt("pgm_plcmnt_org_nm");
		f_setValueToCrtl_Txt("pgm_nmtng_org_nm");
		f_setValueToCrtl_Txt("pgm_sub_ctgry_txt");
		f_setValueToCrtl_Txt("pgm_topic_txt");
		f_setValueToCrtl_Txt("pgm_strtgc_goal_txt");
		f_setValueToCrtl_Txt("pgm_spcl_award_txt");
		f_setValueToCrtl_Txt("pgm_updt_dt");
		f_setValueToCrtl_Txt("pgm_updt_id");
}}
//
//------------------------------------------------------------------------------------------------

function f_setValueToCrtl_DDLB(argClmnNm){with(self.document.forms[0]){
	//
	var vArgClmnNmLen = argClmnNm.length;
	var vVal_1 = "";//picks up the first available value != ""
	var vVal_2 = "";//picks up the second available value != "".
	var vCounter = 0;//counts number of selected programs to be shown on page
	var vCtrlNm = "";
	var vTemp = "";
	//
	for (var e=0; e<elements.length; e++)
	{
		if ( elements[e].type == "checkbox" && elements[e].name.substr(0,4+parseInt(vArgClmnNmLen)) == "cbx_"+argClmnNm )
		{  
			vCounter++;
			//
			if (elements[e].value != "" && vVal_1 == "") { vVal_1 = elements[e].value; vCtrlNm = elements[e].name; }	
			//
			if (vVal_1 != "" && vCounter > 1) { vVal_2 = elements[e].value; }											
		} 
	}			
	//
//===============================================================================================================================================
	if (vCounter == 1)//=========================================================================================================================
	{
			//pgm_type_nm ===================================================================//
			if (argClmnNm == "pgm_type_nm" && vVal_1 != "")
			{
					for (var t=0; t<rowsPT; t++) { if (orgBfrPT[t].apgm_type_nm == vVal_1) { vTemp = orgBfrPT[t].apgm_type_crnt_cd; break;} }
					eval(vCtrlNm+".checked = true");
			}
			else if (argClmnNm == "pgm_type_nm" && vVal_1 == "")
			{
					vTemp = "-1";
					eval(vCtrlNm+".checked = false");
			}
			//==============================================================================//
			//pgm_from_cntry_nm ============================================================//
			if (argClmnNm == "pgm_from_cntry_nm" && vVal_1 != "")
			{
					for (var c=0; c<rowsConCurr; c++) { if (orgBfrConCurr[c].acntry_cntry_nm == vVal_1) { vTemp = orgBfrConCurr[c].acntry_cntry_cd; break;} }
					eval(vCtrlNm+".checked = true");
			}
			else if (argClmnNm == "pgm_from_cntry_nm" && vVal_1 == "")
			{
					vTemp = "-1";
					eval(vCtrlNm+".checked = false");
			}
			//==============================================================================//
			//pgm_to_cntry_nm ============================================================//
			if (argClmnNm == "pgm_to_cntry_nm" && vVal_1 != "")
			{
					for (var c=0; c<rowsConCurr; c++) { if (orgBfrConCurr[c].acntry_cntry_nm == vVal_1) { vTemp = orgBfrConCurr[c].acntry_cntry_cd; break;} }
					//alert(vTemp)
					eval(vCtrlNm+".checked = true");
			}
			else if (argClmnNm == "pgm_to_cntry_nm" && vVal_1 == "")
			{
					vTemp = "-1";
					eval(vCtrlNm+".checked = false");
			}
			//==============================================================================//
			//
				
	}
	else if (vCounter > 1)//====================================================================================================================
	{
			//pgm_type_nm =================================================================//
			if (argClmnNm == "pgm_type_nm" && ((vVal_1 == "" && vVal_1 == vVal_2) || (vVal_1 != "" && vVal_1 != vVal_2)))
			{
					vTemp = "-1";
					eval(vCtrlNm+".checked = false");
			}
			else if (argClmnNm == "pgm_type_nm" && vVal_1 != "" && vVal_1 == vVal_2 )
			{
					for (var t=0; t<rowsPT; t++) { if (orgBfrPT[t].apgm_type_nm == vVal_1) { vTemp = orgBfrPT[t].apgm_type_crnt_cd; break; } }
					eval(vCtrlNm+".checked = true");
			}
			//==============================================================================//
			//pgm_from_cntry_nm ============================================================//
			if (argClmnNm == "pgm_from_cntry_nm" && ((vVal_1 == "" && vVal_1 == vVal_2) || (vVal_1 != "" && vVal_1 != vVal_2)))
			{
					vTemp = "-1";
					eval(vCtrlNm+".checked = false");
			}
			else if (argClmnNm == "pgm_from_cntry_nm" && vVal_1 != "" && vVal_1 == vVal_2 )
			{
					for (var c=0; c<rowsConCurr; c++) { if (orgBfrConCurr[c].acntry_cntry_nm == vVal_1) { vTemp = orgBfrConCurr[c].acntry_cntry_cd; break;} }
					eval(vCtrlNm+".checked = true");
			}
			//==============================================================================//
			//pgm_to_cntry_nm ============================================================//
			if (argClmnNm == "pgm_to_cntry_nm" && ((vVal_1 == "" && vVal_1 == vVal_2) || (vVal_1 != "" && vVal_1 != vVal_2)))
			{
					vTemp = "-1";
					eval(vCtrlNm+".checked = false");
			}
			else if (argClmnNm == "pgm_to_cntry_nm" && vVal_1 != "" && vVal_1 == vVal_2 )
			{
					for (var c=0; c<rowsConCurr; c++) { if (orgBfrConCurr[c].acntry_cntry_nm == vVal_1) { vTemp = orgBfrConCurr[c].acntry_cntry_cd; break;} }
					eval(vCtrlNm+".checked = true");
			}
			//==============================================================================//
	}
	//
	
	of_selectedInDDLB ("ddlb_mrgd_"+argClmnNm, vTemp);
//===========================================================================================================================================
//===========================================================================================================================================
//===========================================================================================================================================
//===========================================================================================================================================
//===========================================================================================================================================
}}
//
//-------------------------------------------------------------------------------------------------------------------------------------------

function f_setValueToCrtl_Txt(argClmnNm){with(self.document.forms[0]){
	//
	var vArgClmnNmLen = argClmnNm.length;
	var vVal_1 = "";//picks up the first available value != ""
	var vVal_2 = "";//picks up the second available value != "".
	var vCounter = 0;//counts number of selected programs to be shown on page
	var vCtrlNm = "";
	var vTemp = "";
	//
	
	for (var e=0; e<elements.length; e++)
	{
		if ( elements[e].type == "checkbox" && elements[e].name.substr(0,4+parseInt(vArgClmnNmLen)) == "cbx_"+argClmnNm )
		{  
			vCounter++;
			//
			if (elements[e].value != "" && vVal_1 == "") { vVal_1 = elements[e].value;  vCtrlNm = elements[e].name; }	
			if (elements[e].value == "" && vVal_1 == "") { vVal_1 = "";  				vCtrlNm = elements[e].name; }
			//
			if (vVal_1 != "" && vCounter > 1) { vVal_2 = elements[e].value; }
			//
		} 
	}			
	//
//===============================================================================================================================================
	if (vCounter == 1)//=========================================================================================================================
	{
			//
			if ( vVal_1 != "")
			{
					vTemp = vVal_1;
					eval(vCtrlNm+".checked = true");
			}
			else if (vVal_1 == "")
			{
					vTemp = "";
					eval(vCtrlNm+".checked = false");
			}
	}
	else if (vCounter > 1)//====================================================================================================================
	{
			//
			if ((vVal_1 == "" && vVal_2 == "") || (vVal_1 != "" && vVal_2 != "" && vVal_1 != vVal_2))
			{
					vTemp = "";
					eval(vCtrlNm+".checked = false");
			}
			else if (vVal_1 != "" && ( (vVal_1 == vVal_2) || (vVal_2 == "")) )
			{
					vTemp = vVal_1;
					eval(vCtrlNm+".checked = true");
			}
			//
	}
	
	
	
	//
	eval("txt_mrgd_"+argClmnNm+".value="+"'"+vTemp+"'");	
	
///===========================================================================================================================================


}}
//
//--------------------------------------------------------------------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------------------------

function f_showButtons(){with(self.document.forms[0]){
	var vCounter = 0;
	var vOutButtons = "";
	
	//
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].name.substr(0,13) == "cbx_pgm_almn_" && elements[e].checked == true)
		{
			vCounter++;
		}
	}
	//
	if (vCounter == 0) 
	{ 
		vOutButtons = "&nbsp;"; 
	}
	else
	{
		vOutButtons += "<table width=\"20%\" align=\"right\" border=\"0\">";
		vOutButtons += "<tr><td><hr></td></tr>";
		vOutButtons += "<tr><td>";
		vOutButtons += "<input	type=\"button\" alt=\"Continue\" class=\"c_formbuttons\" name=\"cb_Continue\" value=\"Continue\" onClick=\"f_Submit();\">";
		vOutButtons += "</td></tr>";
		vOutButtons += "</table>";
	}
	//
	of_innerHTML("id_OutButtons", "'"+vOutButtons+"'");
}}
//
//------------------------------------------------------------------------------------------------
function f_setMrgdValue(argVal, argCtrlNm, argPgmID, argAlmnID){with(self.document.forms[0])
{
	var vTrueFalse = eval(argCtrlNm+".checked");//it is either "true" or "false"
	var vPartOfCtrlNm = argCtrlNm.substr(0, parseInt(argCtrlNm.lastIndexOf("_")+1) );
	var vStrTemp = "";
	var vTemp = "";
	for (var e=0; e<elements.length; e++)
	{
		if ( elements[e].name.substr(0,parseInt(argCtrlNm.lastIndexOf("_")+1) )  == vPartOfCtrlNm )
		{
			elements[e].checked = false;
		}
	}
	//
	vStrTemp = vPartOfCtrlNm.substr(4, vPartOfCtrlNm.length);
	vStrTemp = vStrTemp.substr( 0, parseInt(vStrTemp.length)-1 );
	if (vTrueFalse == true)
	{
		eval(argCtrlNm+".checked = true"); 
		//
		if  (vStrTemp == "pgm_type_nm")      
		{ 
				for (var t=0; t<rowsPT; t++) { if (orgBfrPT[t].apgm_type_nm == argVal) { vTemp = orgBfrPT[t].apgm_type_crnt_cd; break;} }
				of_selectedInDDLB ("ddlb_mrgd_"+vStrTemp, vTemp); 
		}
		else if (vStrTemp == "pgm_from_cntry_nm")
		{ 
				for (var c=0; c<rowsConCurr; c++) { if (orgBfrConCurr[c].acntry_cntry_nm == argVal) { vTemp = orgBfrConCurr[c].acntry_cntry_cd; break;} }
				of_selectedInDDLB ("ddlb_mrgd_"+vStrTemp, vTemp); 
		}
		else if (vStrTemp == "pgm_to_cntry_nm")  
		{ 
				for (var c=0; c<rowsConCurr; c++) { if (orgBfrConCurr[c].acntry_cntry_nm == argVal) { vTemp = orgBfrConCurr[c].acntry_cntry_cd; break;} }
				of_selectedInDDLB ("ddlb_mrgd_"+vStrTemp, vTemp); 
		}
		else 
		{
				eval("txt_mrgd_"+vStrTemp+".value='"+argVal+"'");
		}
	}
	else
	{
		vTemp = "-1";
		if (vStrTemp == "pgm_type_nm" || vStrTemp == "pgm_from_cntry_nm" || vStrTemp == "pgm_to_cntry_nm" )
		{
				of_selectedInDDLB ("ddlb_mrgd_"+vStrTemp, vTemp);
		}
		else 
		{
			eval("txt_mrgd_"+vStrTemp+".value=''");
		}
		
	}
	//
}}
//
//--------------------------------------------------------------------------------------------------------
function f_Submit(){with(self.document.forms[0]){
	var vValidationPassed = "YES";
	var vCounter = 0;	
	var vCounterPV_Checked_YES = 0;
	var vPV_Checked_YES_Pgm_ID_Almn_ID = "";
	var vCounterPV_Checked_NO = 0;
	var vPV_Checked_NO_Pgm_ID_Almn_ID = "";
	var vStrTemp = "";
	
	//
	h_PV_Chckd_YES.value = vPV_Checked_YES_Pgm_ID_Almn_ID;
	h_PV_Chckd_NO.value  = vPV_Checked_NO_Pgm_ID_Almn_ID;
	h_PV_Counter.value = vCounter;
	
	//
		if (orgBfrPV.length!=0)
		{
			for (var e=0; e<elements.length; e++)
			{
				if (  elements[e].name.substr(0,31) == "cbx_place_visit_pgm_id_almn_id_"  )
				{
					vCounter++;
					if (elements[e].checked == true) 
					{ 
						vCounterPV_Checked_YES++;
						vStrTemp = elements[e].name.substr(31);
						vPV_Checked_YES_Pgm_ID_Almn_ID = vPV_Checked_YES_Pgm_ID_Almn_ID + vStrTemp+";"
						 
					}
					if (elements[e].checked == false)
					{ 
						vCounterPV_Checked_NO++;  
						vStrTemp = elements[e].name.substr(31);
						vPV_Checked_NO_Pgm_ID_Almn_ID = vPV_Checked_NO_Pgm_ID_Almn_ID + vStrTemp+";"
					}
				}
			}
			//
			h_PV_Chckd_YES.value = vPV_Checked_YES_Pgm_ID_Almn_ID;
			h_PV_Chckd_NO.value  = vPV_Checked_NO_Pgm_ID_Almn_ID;
			h_PV_Counter.value = vCounter;
			//
			if ( vCounter !=0 && vCounter != vCounterPV_Checked_YES )
			{
				if ( confirm("You have not checked all 'Places Visited'.\nALL NOT SELECTED \"Places Visited\" WILL BE PERMANENTLY DELETED FROM DATABASE.\nDo you want to continue?") )
				{
					vValidationPassed = f_validatePgm();
				}
			}
			else 
			{
				vValidationPassed = f_validatePgm();
			}
			//
		}
		//
		vValidationPassed = "NO";
		if (vValidationPassed == "YES"){of_CallFile("mergePgm_and_PV");}
}}
//
//-------------------------------------------------------------------------------------------------------------------------

function f_validatePgm(){with(self.document.forms[0]){
		var vStrTemp = "";
		var vMrgd_Recrd = "";
		var vRtnVal = "YES";
		
		for (var e=0; e<elements.length; e++)
		{
				//Validation of required fields:
				//Value in property "id" is assigned to required fields only
				
				if (elements[e].type == "text" && elements[e].id != "" && elements[e].value == "")
				{
					
					alert("Sorry, system cannot coninue to merge data.\nAll required fields must have values.");
					vRtnVal = "NO";
					break;
				}
				//
				//alert(elements[e].name.substr(0,9))
				//
				if (elements[e].type == "text" && elements[e].name.substr(0,9) == "txt_mrgd_")
				{
					//alert(elements[e].name.substr(0,9)+"  "+elements[e].name.substr(0,9))
					vStrTemp = elements[e].name.substr(9)+"=\""+elements[e].value+"\";";
					vMrgd_Recrd = vMrgd_Recrd + vStrTemp;
				}
				
		}
		//
			//of_innerHTML("id_Mrgd_Recrd", "'"+vMrgd_Recrd+"'");
			h_mrgd_Recrd.value = vMrgd_Recrd;
		
		//
		return vRtnVal;
}}


</script>
<input type="hidden" name="h_PV_Chckd_YES" value="">
<input type="hidden" name="h_PV_Chckd_NO" value="">
<input type="hidden" name="h_PV_Counter" value="">
<input type="hidden" name="h_mrgd_Recrd" value="">

<div class="feature">
<table  width="100%"  border="0" cellspacing="2" cellpadding="2"  style="border-bottom:1px solid Gray;">
  <tr>
    <td>
		<cfoutput><strong>#client.AlmnName#</strong></cfoutput>
	</td>
  </tr>
</table>
<!--- =========================================================================================== --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2"  style="border-bottom:1px solid Gray;">
	<tr class="c_fieldName">
		<th scope="col">Program ID<br>(pgm_id)</th>
		<th scope="col">Alumni ID<br>(pgm_almn_id)</th>
		<th scope="col">Program Name</th>
		<th scope="col">Fiscal Year</th>
		<th scope="col">Pgm Year</th>
		<th scope="col">Country From</th>
		<th scope="col">Country To</th>
	</tr>
<!--- =========================================================================================== --->
<cfloop query="spr_getListOfPrograms" startrow="1" endrow="#spr_getListOfPrograms.recordCount#">
<cfoutput>
	<tr class="c_fieldValue">
    	<td><input type="checkbox" onClick="JavaScript: f_onClickShowPgmDetails();" name="cbx_pgm_almn_#pgm_id#_#pgm_almn_id#"> #pgm_id#</td>
		<td align="center">#pgm_almn_id#</td>
		<td><input type="hidden" name="h_pgm_type_cd_#pgm_id#_#pgm_almn_id#" value="#pgm_type_cd#">#pgm_type_nm#</td>
		<td>#pgm_fy_dt#</td>
		<td>#pgm_yr_dt#</td>
		<td><input type="hidden" name="h_pgm_from_cntry_cd_#pgm_id#_#pgm_almn_id#" value="#pgm_from_cntry_cd#">#pgm_from_cntry_nm#</td>
		<td><input type="hidden" name="h_pgm_to_cntry_cd_#pgm_id#_#pgm_almn_id#" value="#pgm_to_cntry_cd#">#pgm_to_cntry_nm#</td>
  	</tr>
</cfoutput>
</cfloop>

<!--- =========================================================================================== --->
	<tr class="c_fieldValue">
    	<td colspan="7"><hr></td>
  	</tr>
<!--- =========================================================================================== --->
	<tr class="c_fieldValue">
    	<td colspan="7" id="id_Output">&nbsp;</td>
  	</tr>
<!--- =========================================================================================== --->
	<tr class="c_fieldValue" >
    	<td colspan="7"><hr></td>
  	</tr>
<!--- =========================================================================================== --->
	<tr class="c_fieldValue">
    	<td colspan="7" id="id_OutPutPlaceVisited">&nbsp;</td>
  	</tr>
<!--- =========================================================================================== --->
	<tr class="c_fieldValue">
    	<td colspan="7" id="id_OutButtons">&nbsp;</td>
  	</tr>
<!--- =========================================================================================== --->
	<!--- 
	<tr class="c_fieldValue">
    	<td colspan="7" id="id_Mrgd_Recrd">&nbsp;</td>
  	</tr>
	 --->
<!--- =========================================================================================== --->

</table>
</div>

