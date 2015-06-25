<!--- inc_Search_Tbl.cfm --->
<script language="javascript" type="text/javascript">
//
function f_deleteSearch(arg_cust_search_id){with(self.document.forms[0])
{
	var SearchNm = "";
	for (var r=0; r<orgBrgCS.length; r++)
	{
		if (orgBrgCS[r].acust_search_id == arg_cust_search_id)
		{
			SearchNm = orgBrgCS[r].acust_search_nm;
			break;
		}
	}
	//
	if ( confirm("Do you want to delete Custom Search '"+SearchNm+"'?") )
	{
		h_CS_Search_ID.value = arg_cust_search_id;
		//alert("Delete is under test");
		of_CallFile("delCustomSearch");
		
		//of_CallFile("doCustomSearch");
		
	}
}}
//
//
//--------------------------------------------------------------------------------------------------
//alert("before f_onChng_YearType")
function f_onChng_YearType(argYearType)
{
	switch (argYearType)
	{
		case "-1":
		{
			of_populateSelect( "ddlb_CS_Year", "-1", "=== Select Type ===", 0, "", "", "", "2D" );
			break;
		}
		case "FY":
		{
			of_populateSelect( "ddlb_CS_Year", "-1", "=== Select Fiscal Year ===", rowsFY, "orgBfrFY", "apgm_fy_dt_cd", "apgm_fy_dt", "2D" );
			self.document.forms[0].ddlb_CS_Year.options[0].selected = true;
			break; 
		}
		case "PS":
		{
			of_populateSelect( "ddlb_CS_Year", "-1", "=== Select Program Year ===", rowsPS, "orgBfrPS", "apgm_yr_dt_cd", "apgm_yr_dt", "2D" );
			self.document.forms[0].ddlb_CS_Year.options[0].selected = true;
			break;
		}
	}
}
//alert("after f_onChng_YearType")
//
//--------------------------------------------------------------------------------
function f_AnyChanges(argAnyChenges){ with(self.document.forms[0])
{
	h_AnyChanges.value = argAnyChenges;
}}
//
//---------------------------------------------------------------------------------

function f_Check_All(argCtrlNm){with(self.document.forms[0])
{
	if (argCtrlNm == "cbx_Check_All")
	{
		for (var e=0; e<elements.length; e++)
		{
			     if (cbx_Check_All.checked == true  && elements[e].type == "checkbox" && elements[e].name.substr(0,7) == "cbx_AH_" ){ elements[e].checked = true; }
			else if (cbx_Check_All.checked == false && elements[e].type == "checkbox" && elements[e].name.substr(0,7) == "cbx_AH_" ){ elements[e].checked = false; }
		}
	}
	else
	{
		var vCount = 0;
		for (var e=0; e<elements.length; e++)
		{
			if (elements[e].type == "checkbox" && elements[e].name.substr(0,7) == "cbx_AH_" && elements[e].checked == false)
			{
				vCount ++;
				break;
			}
		}
		if ( vCount != 0 ) { cbx_Check_All.checked = false; }
		if ( vCount == 0 ) { cbx_Check_All.checked = true; }
	}	
}}



</script> 

<cfoutput>
	<input type="hidden" name="h_DocType" value="">	
	<cfif client.CS_SetDefault EQ "NO">
		<input type="hidden" name="h_SearchCriteria" value="">
	<cfelseif client.CS_SetDefault EQ "YES">
		<input type="hidden" name="h_SearchCriteria" value="#client.CS_SearchCriteria#">
	</cfif>
	<!--- <input type="hidden" name="h_SearchCriteria" value="#client.CS_SearchCriteria#"> --->
	<input type="hidden" name="h_CS_Search_ID" value="#client.CS_Search_ID#">
	<input type="hidden" name="h_AnyChanges" value="NO">
	<input type="hidden" name="txt_CS_Search_Nm" value="#client.CS_Search_Nm#" size="60" class="forminputs" onBlur="f_AnyChanges('YES');" >
	<!--- <input type="hidden" name="h_ShowHideAddCriteria" value=""> --->
	<input type="hidden" name="h_ShowHideSavedSearches" value="">
</cfoutput>

<table title="Custom Report" width="100%"  border="0" cellspacing="2" cellpadding="2">
  <!--- AD-HOC report fields --->
  <tr>
  	<td>
		
		<!--- --------------------------------------------------- --->
		<table width="100%"  border="0" cellspacing="2" cellpadding="2">
			<tr bgcolor="#C7DD9C">
				<td>
					<div class="c_fieldName">STEP 1: </div><div class="c_fieldValue">From the Fields below, place a check mark to select the fields you would like to have displayed on your report.  These fields will be displayed in columns on the spreadsheet you are creating. Once done, proceed to STEP 2 below.</div>
				</td>
			</tr>
			<!--- BUTTON SELECT ALL --->
			<tr bgcolor="#C7DD9C">
				<td class="c_fieldName">
					<input type="checkbox" name="cbx_Check_All" value="" onClick="f_Check_All(this.name);">CHECK ALL FIELDS
				</td>
			</tr>
			<!--- ... --->
			<tr><td><hr></td></tr>
			<tr><td>
						<table width="100%" border=0>
							<tr>
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Cntry_From" value="" onClick="f_Check_All(this.name);">Country From</td><!--- PGM_FROM_CNTRY_CD --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Cntry_To"   value="" onClick="f_Check_All(this.name);">Country To</td><!--- PGM_TO_CNTRY_CD --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Pgm_Type"   value="" onClick="f_Check_All(this.name);">Program Type</td><!--- PGM_TYPE_CD --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Field_Stdy" value="" onClick="f_Check_All(this.name);">Field of Study/Project Subject</td><!--- PGM_FIELD_STDY_CD --->
							</tr>
						</table>
			</td></tr>
			<tr><td>
						<table width="100%" border=0>
							<tr>
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Pgm_Fy" value=""  onClick="f_Check_All(this.name);">Program Fiscal Year</td><!--- PGM_FY_DT --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Pgm_Yr" value=""  onClick="f_Check_All(this.name);">Program Start Year</td><!--- PGM_YR_DT --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Pgm_Start_Dt" value=""  onClick="f_Check_All(this.name);">Program Start Date</td><!--- PGM_START_DT --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Pgm_End_Dt" value=""  onClick="f_Check_All(this.name);">Program End Date</td><!--- PGM_END_DT --->
							</tr>
						</table>
			</td></tr>
			<tr><td>
						<table width="100%" border=0>
							<tr>
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Host_Inst" value=""  onClick="f_Check_All(this.name);">Host Institution</td><!--- PLACE_VISIT_HOST_INST_NM --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_City_Visited" value=""  onClick="f_Check_All(this.name);">City Visited</td><!--- PLACE_VISIT_CITY_NM --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Agcy_Nm" value="" onClick="f_Check_All(this.name);" >Agency Name</td><!--- PGM_AGCY_NM --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Plcmnt_Org_Nm" value=""  onClick="f_Check_All(this.name);">Placement Org.</td><!--- PGM_PLCMNT_ORG_NM --->
							</tr>
						</table>
			</td></tr>
			<tr><td>
						<table width="100%" border=0>
							<tr>
								<td width="20%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Nmtng_Org_Nm" value="" onClick="f_Check_All(this.name);">Nominating Org.</td><!--- PGM_NMTNG_ORG_NM --->
								<td width="20%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Sub_Ctgry" value="" onClick="f_Check_All(this.name);">Sub-Category</td><!--- PGM_SUB_CTGRY_TXT --->
								<td width="20%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Topic" value="" onClick="f_Check_All(this.name);">Sub-Topic</td><!--- PGM_TOPIC_TXT --->
								<td width="20%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Strtgc_Goal" value="" onClick="f_Check_All(this.name);">Strategic Goal</td><!--- PGM_STRTGC_GOAL_TXT --->
								<td width="20%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Spcl_Award" value="" onClick="f_Check_All(this.name);">Special Award</td><!--- PGM_SPCL_AWARD_TXT --->
							</tr>
						</table>
			</td></tr>
			
			
			<tr><td><hr></td></tr>
		<!--- --------------------------------------------------- --->
			<tr><td>
						<table width="100%" border=0>
							<tr>
								<td class="c_fieldName" ><input type="checkbox" name="cbx_AH_Prfx" value="" onClick="f_Check_All(this.name);">Prefix</td><!--- ALMN_PFX_DSC --->
								<td class="c_fieldName" ><input type="checkbox" name="cbx_AH_FNm" value="" onClick="f_Check_All(this.name);">First Name</td><!--- ALMN_FRST_NM --->
								<td class="c_fieldName" ><input type="checkbox" name="cbx_AH_MI" value="" onClick="f_Check_All(this.name);">MI</td><!--- ALMN_MIDL_NM --->
								<td class="c_fieldName" ><input type="checkbox" name="cbx_AH_LNm" value="" onClick="f_Check_All(this.name);">Last Name</td><!--- ALMN_LAST_NM --->
								<td class="c_fieldName" ><input type="checkbox" name="cbx_AH_LNm2" value="" onClick="f_Check_All(this.name);">Last Name 2</td><!--- ALMN_LAST_NM2 --->
								<td class="c_fieldName" ><input type="checkbox" name="cbx_AH_Sfx" value="" onClick="f_Check_All(this.name);">Suffix</td><!--- ALMN_SFX_DSC --->
							</tr>
							<tr>
								<td class="c_fieldName"><input type="checkbox" name="cbx_AH_Sex" value="" onClick="f_Check_All(this.name);">Gender</td><!--- ALMN_SEX_IND --->
								<td class="c_fieldName"><input type="checkbox" name="cbx_AH_Dob" value="" onClick="f_Check_All(this.name);">DOB(Date of Birth)</td><!--- ALMN_DOB_DT --->
								<td class="c_fieldName"><input type="checkbox" name="cbx_AH_Cntry_Ctznsp" value="" onClick="f_Check_All(this.name);" >Country of Citizenship</td><!--- ALMN_CTZNSP_CNTRY_CD --->
								<td class="c_fieldName" colspan="3"><input type="checkbox" name="cbx_AH_Cntry_Ctznsp2" value="" onClick="f_Check_All(this.name);">2nd Country of Citizenship</td><!--- ALMN_CTZNSP_CNTRY_CD2 --->
							</tr>
						</table>
			</td></tr>
			<tr><td><hr></td></tr>
			<tr><td>
						<table width="100%" border=0>
							<tr>
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Cntct" value="" onClick="f_Check_All(this.name);">Permission to Contact</td><!--- ALMN_CNTCT_IND --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Dcsd" value="" onClick="f_Check_All(this.name);">Deceased</td><!--- ALMN_DCSD_IND --->
								<td width="25%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Dsabld" value="" onClick="f_Check_All(this.name);">Disabled</td><!--- ALMN_DSABLD_IND --->
								<td width="25%" class="c_fieldName" ><input type="checkbox" name="cbx_AH_Intrst" value="" onClick="f_Check_All(this.name);">Interest</td><!--- INTRST_NM --->
							</tr>
						</table>
			</td></tr>
			<tr><td colspan="4" ><hr></td></tr>
			<tr><td>
						<table width="100%" border=0>
							<tr>
								<td width="20%" class="c_fieldName"><input type="checkbox" name="cbx_AH_Title" value="" onClick="f_Check_All(this.name);">Title / Profession</td><!--- JOB_TITLE_TXT --->
								<td width="20%" class="c_fieldName" ><input type="checkbox" name="cbx_AH_ELP_Speak" value="" onClick="f_Check_All(this.name);">ELP Speak</td><!--- ALMN_ELP_SPEAK_FSI_LEVEL_NUM --->
								<td width="20%" class="c_fieldName" ><input type="checkbox" name="cbx_AH_ELP_Read" value="" onClick="f_Check_All(this.name);">ELP Read</td><!--- ALMN_ELP_READ_FSI_LEVEL_NUM --->
								<td width="20%" class="c_fieldName" ><input type="checkbox" name="cbx_AH_ELP_Comp" value="" onClick="f_Check_All(this.name);">ELP Comprehend</td><!--- ALMN_ELP_COMP_FSI_LEVEL_NUM --->
								<td width="20%" class="c_fieldName" ><input type="checkbox" name="cbx_AH_Comments" value="" onClick="f_Check_All(this.name);">Comments</td><!--- USR_COMNT_COMNT_TXT --->
							</tr>
						</table>
			</td></tr>
			<tr><td colspan="4" ><hr></td></tr>
			<tr><td>
						<table width="100%" border=0>
							<tr>
								<td width="30%" class="c_fieldName"><input type="checkbox" name="cbx_AH_BusAddr" value="" onClick="f_Check_All(this.name);">Business Address</td>
								<td width="30%" class="c_fieldName" ><input type="checkbox" name="cbx_AH_HomeAddr" value="" onClick="f_Check_All(this.name);">Home Address</td>
								<td width="30%" class="c_fieldName" ><input type="checkbox" name="cbx_AH_Prominent" value="" onClick="f_Check_All(this.name);">Prominent</td>
							</tr>
						</table>
			</td></tr>
		</table>
		<!--- --------------------------------------------------- --->
	</td>
  </tr>
  <tr bgcolor="#C7DD9C">
	<td>
		<div class="c_fieldName">STEP 2: </div><div class="c_fieldValue">Choose and select the criteria for the alumni you wish to find information on.  Example; pick a program type, country, FY, or other types of data, to search by.   Once your choices have been made, press the "Create MS-Excel Spreadsheet" button, and allow your report to process.</div>
	</td>
  </tr>

</table>
<table align="center" width="100%"  border="0" cellspacing="2" cellpadding="2">
  <!--- FIRST and LAST NAME --->
  <tr>
    <td>
		<!--- --------------------------------------------------- --->
		<table width="100%"  border="0" cellspacing="2" cellpadding="2"  bgcolor="#EDF7D8">
			<tr bgcolor="#C7DD9C">
				<td class="c_fieldName" width="40%">FIRST/GIVEN NAME</td>
				<td class="c_fieldName" width="40%">LAST/FAMILY NAME</td>
				<td class="c_fieldName" width="20%">GENDER</td>
				
			</tr>
			<tr>
				<td>
					<input	type="text" 
							value="<cfoutput>#client.CS_First_Nm#</cfoutput>" 
							name="txt_CS_Frst_Nm" 
							maxlength="40"  
							size="25"
							title="Enter First Name"
							class="forminputs" 
							onKeyUp="JavaScript: f_showSelection();"
							onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length); "
							onChange="javascript:f_AnyChanges('YES'); while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" >
				</td>
				<td>
					<input	type="text" 
							value="<cfoutput>#client.CS_Last_Nm#</cfoutput>"
							name="txt_CS_Last_Nm" 
							maxlength="60" 
							size="25"
							title="Enter Last Name"
							class="forminputs"
							onKeyUp="JavaScript: f_showSelection();"
							onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length); "
							onChange="javascript:f_AnyChanges('YES'); while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
				</td>
				<td>
					<select name="ddlb_CS_Gender" class="forminputs" onChange="JavaScript:f_AnyChanges('YES'); f_showSelection();">
						<option value="-1">=== Select Gender ===</option>
						<option value="M">Male</option>
						<option value="F">Female</option>
					</select>
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->
	</td>
  </tr>

  <!--- COUNTRY FROM and COUNTRY TO --->
  <tr>
    <td>
		<!--- --------------------------------------------------- --->
		<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
			<tr bgcolor="#C7DD9C">
				<td class="c_fieldName" width="50%">COUNTRY FROM</td>
				<td class="c_fieldName">COUNTRY TO</td>
			</tr>
			<tr>
				<td>
					<select name="ddlbm_CS_From_Cntry" class="forminputs" size="5" multiple onChange="JavaScript:f_AnyChanges('YES'); of_ruleInMultSelectCntrl(this.name); f_showSelection();"> 
						<option value="-1">=== Select Country ===</option>
						<cfloop query="spr_getCntryFrom" startrow="1" endrow="#spr_getCntryFrom.recordCount#">
						<cfoutput>
						<option value="#spr_getCntryFrom.pgm_from_cntry_cd#">#spr_getCntryFrom.cntry_name#</option>
						</cfoutput>
						</cfloop>
					</select>
					<input type="hidden" name="h_CS_From_Cntry" value="">
					
				</td>
				<td><!--- f_handleHSandCV(this.value); --->
					<select name="ddlbm_CS_To_Cntry" class="forminputs" size="5" multiple onChange="JavaScript:f_AnyChanges('YES'); of_ruleInMultSelectCntrl(this.name);  f_showSelection();">
						<option value="-1">=== Select Country ===</option>
						<cfloop query="spr_getCntryTo" startrow="1" endrow="#spr_getCntryTo.recordCount#">
						<cfoutput>
						<option value="#spr_getCntryTo.pgm_to_cntry_cd#">#spr_getCntryTo.cntry_name#</option>
						</cfoutput>
						</cfloop>
					</select>
					<input type="hidden" name="h_CS_To_Cntry" value="">
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- ---> 
	</td>
  </tr>
  <!--- PROGRAM NAME --->
  <tr>
    <td>
		<!--- --------------------------------------------------- --->
		<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
			<tr>
				<td class="c_fieldName" bgcolor="#C7DD9C">PROGRAM TYPE</td>
			</tr>
			<tr>
				<td>
					<select name="ddlbm_CS_Pgm_Type" class="forminputs" size="5" multiple  onChange="JavaScript:f_AnyChanges('YES'); of_ruleInMultSelectCntrl(this.name); f_showSelection();">
						<option value="-1">=== Select Program Type ===</option>
						<cfloop query="spr_getPrograms" startrow="1" endrow="#spr_getPrograms.recordCount#">
						<cfoutput>
						<option value="#spr_getPrograms.pgm_type_cd#">#spr_getPrograms.pgm_type_nm#</option>
						</cfoutput>
						</cfloop>
					</select>
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->
	</td>
  </tr>
  <!--- YEAR --->
  <tr>
    <td>
		<!--- --------------------------------------------------- --->
		<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
			<tr bgcolor="#C7DD9C">
				<td class="c_fieldName" width="50%">FISCAL YEAR or PROGRAM START YEAR</td>
				<td class="c_fieldName">&nbsp;</td>
			</tr>
			<tr>
				<td valign="top">
					<select name="ddlb_CS_Year_Type" class="forminputs" size="4" onChange="JavaScript:f_AnyChanges('YES'); f_onChng_YearType(this.value); f_showSelection();">
						<option value="-1">=== Select Type ===</option>
						<option value="FY">Fiscal Year</option>
						<option value="PS">Program Start Year</option>
						<option value="FYPS">Fiscal & Program Start Year</option>
					</select>
				</td>
				<td valign="top">
					<select name="ddlb_CS_Year" class="forminputs" multiple onChange="JavaScript:f_AnyChanges('YES'); f_showSelection();"></select>
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->
	</td>
  </tr>
  <!--- END OF BASIC  END OF BASIC  END OF BASIC  END OF BASIC  END OF BASIC  END OF BASIC  END OF BASIC --->
  <!--- ------------------------------------------------------------------------------------------------ --->
  <!--- START ADVANCED  START ADVANCED  START ADVANCED  START ADVANCED  START ADVANCED  START ADVANCED  ---> 
  <tr><td>&nbsp;</td></tr>
</table>
<!--- FIELD OF STUDY --->
<table align="center" width="100%"  border="0" cellspacing="2" cellpadding="2">
   <tr>
  	<td id="id_FieldOfStudy">
		<!--- --------------------------------------------------- --->
		
		<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
			<tr>
				<td class="c_fieldName"  width="50%" bgcolor="#C7DD9C">FIELD OF STUDY/PROJECT SUBJECT</td>
				<td class="c_fieldName"  width="50%" bgcolor="#C7DD9C">PROMINENT CATEGORY</td>
			</tr>
			<tr></tr>
				<td>
					<cfoutput>
					<input	type="text" 
							name="txt_CS_Field_Stdy_Nm" 
							value="#client.CS_Field_Stdy_Nm#" 
							size="40" 
							class="forminputs" 
							onKeyUp= "JavaScript: f_showSelection();"
						    onChange="javascript:f_AnyChanges('YES'); while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						    onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length); ">
					</cfoutput>
				</td>
				<td colspan="3" class="c_fieldValue">
					<select name="ddlb_CS_ALMN_PROMINENT_CD" class="forminputs"  onChange="f_showSelection();"></select>
					<script language="javascript" type="text/javascript">
						
					</script>
				</td>
			</tr>
		</table>
		
		<!--- --------------------------------------------------- --->
	</td>
  </tr>
</table>

<!--- CITIZENSHIP COUNTRY and CITY of RESIDENCE --->
<table align="center" width="100%"  border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td id="id_CitnshpCntry">
		<!--- --------------------------------------------------- --->
		
		<table width="100%"  border="0" cellspacing="2" cellpadding="2"  bgcolor="#EDF7D8">
			<tr bgcolor="#C7DD9C">
				<td class="c_fieldName" width="40%">CITIZENSHIP</td>
				<td class="c_fieldName" width="40%">COUNTRY OF RESIDENCE</td>
				<td class="c_fieldName" width="20%">CITY OF RESIDENCE</td>
				<!--- <td class="c_fieldName" width="20%">&nbsp;</td> --->
				
			</tr>
			<tr>
				<td>
					<select name="ddlb_CS_Citznsp_Cntry_CD" class="forminputs" onChange="JavaScript:f_AnyChanges('YES'); f_showSelection();" ></select>
				</td>
				<td>
					<select name="ddlb_CS_Resdnc_Cntry_CD" class="forminputs" onChange="JavaScript:f_AnyChanges('YES'); f_showSelection();" ></select>
				</td>
				<!--- <td>&nbsp;</td>---> 
				<td>
					<cfoutput>
					<input type="text" 
						   name="txt_CS_Resdnc_City_Nm" 
						   value="#client.CS_Resdnc_City_Nm#" 
						   size="40" 
						   class="forminputs"  
						   onKeyUp="JavaScript: f_showSelection();"
						   onChange="javascript:f_AnyChanges('YES'); while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						   onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</cfoutput>
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->
	</td>
  </tr> 
</table>

<!--- HOST INSTITUTION and CITY VISITED --->
<table align="center" width="100%"  border="0" cellspacing="2" cellpadding="2">
  <!--- ... --->
  <tr>
    <td id="id_HostInst">
		<!--- --------------------------------------------------- --->
		
		<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
			
			<tr bgcolor="#C7DD9C">
				<td width="50%" class="c_fieldName" >HOST INSTITUTION</td>
				<td class="c_fieldName">CITY VISITED</td>
			</tr>
			<!---  --->
			<tr>
				<td><!--- #client.CS_Host_Instn_Nm# --->
					<!--- 
					<select multiple name="ddlbm_CS_Host_Instn_Nm" onBlur="f_AnyChanges('YES');"  class="forminputs" onChange="JavaScript: f_showSelection();"></select>
					<br>
					<input type="text" name="h_CS_Host_Instn_Nm" value="" size="50"><!---  onChange="f_Test(this.value)" --->
					 --->
					
					<cfoutput>
					<input type="text" name="txt_CS_Host_Instn_Nm" value="#client.CS_Host_Instn_Nm#" size="40" class="forminputs"  onKeyUp="JavaScript: f_showSelection();"
						   onChange="javascript:f_AnyChanges('YES'); while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						   onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length); ">
					</cfoutput>
					
				</td>
				<td>
					<!--- 
					<select multiple name="ddlbm_CS_Visit_City_Nm" onBlur="f_AnyChanges('YES');"  class="forminputs" onChange="JavaScript: f_showSelection();"></select>
					<br>
					<input type="text" name="h_CS_Visit_City_Nm" value="" size="50">
					 --->
					<cfoutput>
					<input type="text" name="txt_CS_Visit_City_Nm" value="#client.CS_Visit_City_Nm#" size="40" class="forminputs"  onKeyUp="JavaScript: f_showSelection();"
						   onChange="javascript:f_AnyChanges('YES'); while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						   onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length); ">
					</cfoutput>
					
			</tr>
			
		</table>
	</td>
  </tr>
  
   <!--- BUTTONS --->
  <tr>
    <td >
		<!--- --------------------------------------------------- --->
		<table width="100%"  border="0" cellspacing="3" cellpadding="2">
			<tr align="right">
				<td valign="top" colspan="2">
					<!--- <input type="button" name="cb_Search22" value="Create MS-Word document" class="c_formbuttons" onClick="JavaScript: f_Search('DOC');">
					&nbsp;&nbsp; --->
					<input type="button" name="cb_Search2" value="Create MS-Excel spreadsheet" class="c_formbuttons" onClick="JavaScript: f_Search('XLS');">
					&nbsp;&nbsp;
					<input type="button" name="cb_Reset2" value="Reset" class="c_formbuttons" onClick="JavaScript: f_Reset();">
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->	
	</td>
  </tr>
  <!--- BUTTONS --->
</table>


<cfloop index = "i" list = "#client.CS_From_Cntry#" delimiters=",">
  <script language="javascript" type="text/javascript">
  	of_selectedInDDLB("ddlbm_CS_From_Cntry", "<cfoutput>#i#</cfoutput>");
  </script>
</cfloop>

<cfloop index = "i" list = "#client.CS_To_Cntry#" delimiters=",">
  <script language="javascript" type="text/javascript">
	of_selectedInDDLB("ddlbm_CS_To_Cntry", "<cfoutput>#i#</cfoutput>");
  </script>
</cfloop>

<cfloop index = "i" list = "#client.CS_Pgm_Type#" delimiters=",">
  <script language="javascript" type="text/javascript">
	of_selectedInDDLB("ddlbm_CS_Pgm_Type", "<cfoutput>#i#</cfoutput>");
  </script>
</cfloop>
<!--- 
<cfset client.sprWDDX_getHostInst = "<wddxPacket version='1.0'><header/><data><recordset rowCount='0' fieldNames='PLACE_VISIT_HOST_INSTN_NM' type='coldfusion.sql.QueryTable'><field name='PLACE_VISIT_HOST_INSTN_NM'></field></recordset></data></wddxPacket>">
<cfset client.sprWDDX_getCityVisit = "<wddxPacket version='1.0'><header/><data><recordset rowCount='0' fieldNames='PLACE_VISIT_CITY_NM' type='coldfusion.sql.QueryTable'><field name='PLACE_VISIT_CITY_NM'></field></recordset></data></wddxPacket>">
 --->


<script language="javascript" type="text/javascript">
//-- Filling default values in controls:
of_selectedInDDLB("ddlb_CS_Gender", "<cfoutput>#client.CS_Gender#</cfoutput>");
//
of_selectedInDDLB("ddlb_CS_Year_Type", "<cfoutput>#client.CS_Year_Type#</cfoutput>");
f_onChng_YearType(self.document.forms[0].ddlb_CS_Year_Type.value);
//
//<!--- self.document.forms[0].h_ShowHideAddCriteria.value = "<cfoutput>#client.ShowHideAddCriteria#</cfoutput>" --->;
//f_ShowHideAddCriteria();
//
//PROMINENT
of_populateSelect( "ddlb_CS_ALMN_PROMINENT_CD", "-1", "=== Select Prominent Category ===", rowsPC, "orgBfrPromCatg", "aitem_cd", "aitem_desc", "2D" );
of_selectedInDDLB ("ddlb_CS_ALMN_PROMINENT_CD", "<cfoutput>#client.CS_Prominent_CD#</cfoutput>"); 

of_populateSelect( "ddlb_CS_Citznsp_Cntry_CD", "-1", "=== Select Countries ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
of_selectedInDDLB("ddlb_CS_Citznsp_Cntry_CD", "<cfoutput>#client.CS_Citznsp_Cntry_CD#</cfoutput>");
//
of_populateSelect( "ddlb_CS_Resdnc_Cntry_CD", "-1", "=== Select Countries ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
of_selectedInDDLB("ddlb_CS_Resdnc_Cntry_CD", "<cfoutput>#client.CS_Resdnc_Cntry_CD#</cfoutput>");
//


//f_handleHSandCV(self.document.forms[0].ddlbm_CS_To_Cntry.value);
//-- End of filling default values
//----------------------------------------------------------------------------------------
//
function f_Reset(){with(self.document.forms[0])
{
	//alert("Reset is testing.....")
	h_SearchCriteria.value = "";
	h_CS_Search_ID.value = 0;
	h_AnyChanges.value = "NO";
	txt_CS_Search_Nm.value = "";
	//
	txt_CS_Frst_Nm.value = "";
	txt_CS_Last_Nm.value = "";
	of_selectedInDDLB("ddlb_CS_Gender", "-1");
	//
	for (var i=0; i<ddlbm_CS_From_Cntry.options.length; i++)
	{
		ddlbm_CS_From_Cntry.options[i].selected = false;
	}
	of_selectedInDDLB("ddlbm_CS_From_Cntry", "-1");
	//
	for (var i=0; i<ddlbm_CS_To_Cntry.options.length; i++)
	{
		ddlbm_CS_To_Cntry.options[i].selected = false;
	}
	of_selectedInDDLB("ddlbm_CS_To_Cntry", "-1");
	//
	for (var i=0; i<ddlbm_CS_Pgm_Type.options.length; i++)
	{
		ddlbm_CS_Pgm_Type.options[i].selected = false;
	}
	of_selectedInDDLB("ddlbm_CS_Pgm_Type", "-1");
	//
	of_selectedInDDLB("ddlb_CS_Year_Type", "-1");
	f_onChng_YearType("-1");
	of_selectedInDDLB("ddlb_CS_Year", -1);
	//
	h_ShowHideSavedSearches.value = "HIDE";
	f_ShowHideSavedSearches();
	//
	of_innerHTML("id_SearchCriteria", "'&nbsp;'");
	//
	//---
	//
		var vName = "";
		txt_CS_Field_Stdy_Nm.value = vName;
		of_selectedInDDLB("ddlb_CS_Citznsp_Cntry_CD", "-1");
		of_selectedInDDLB("ddlb_CS_Resdnc_Cntry_CD", "-1");
		txt_CS_Resdnc_City_Nm.value = vName;
		
		txt_CS_Host_Instn_Nm.value = vName;
		txt_CS_Visit_City_Nm.value = vName;
		//
		//h_ShowHideAddCriteria.value = "HIDE";
		//f_ShowHideAddCriteria();
}}
//
//----------------------------------------------------------------------------------------------------
function f_setValForCheckedCBX(){with(self.document.forms[0])
{
	var vCounter = 0;
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].type == "checkbox" && elements[e].name.substr(0,7) == "cbx_AH_" && elements[e].checked == true)
		{ 
			vCounter++; 
			//
			switch (elements[e].name)
			{	//-------------------------------------------------------------------------
				case "cbx_AH_Cntry_From": elements[e].value = "PGM_FROM_CNTRY_CD"; break;
				//
				case "cbx_AH_Cntry_To": elements[e].value = "PGM_TO_CNTRY_CD"; break;
				//
				case "cbx_AH_Pgm_Type": elements[e].value = "PGM_TYPE_CD"; break;
				//
				case "cbx_AH_Field_Stdy": elements[e].value = "PGM_FIELD_STDY_CD"; break;
				//-------------------------------------------------------------------------
				case "cbx_AH_Pgm_Fy": elements[e].value = "PGM_FY_DT"; break;
				//
				case "cbx_AH_Pgm_Yr": elements[e].value = "PGM_YR_DT"; break;
				//
				case "cbx_AH_Pgm_Start_Dt": elements[e].value = "PGM_START_DT"; break;
				//
				case "cbx_AH_Pgm_End_Dt": elements[e].value = "PGM_END_DT"; break;
				//-------------------------------------------------------------------------
				case "cbx_AH_Host_Inst": elements[e].value = "PLACE_VISIT_HOST_INST_NM"; break;
				//
				case "cbx_AH_City_Visited": elements[e].value = "PLACE_VISIT_CITY_NM"; break;
				//
				case "cbx_AH_Agcy_Nm": elements[e].value = "PGM_AGCY_NM"; break;
				//
				case "cbx_AH_Plcmnt_Org_Nm": elements[e].value = "PGM_PLCMNT_ORG_NM"; break;
				//-------------------------------------------------------------------------
				case "cbx_AH_Nmtng_Org_Nm": elements[e].value = "PGM_NMTNG_ORG_NM"; break;
				//
				case "cbx_AH_Sub_Ctgry": elements[e].value = "PGM_SUB_CTGRY_TXT"; break;
				//
				case "cbx_AH_Topic": elements[e].value = "PGM_TOPIC_TXT"; break;
				//
				case "cbx_AH_Strtgc_Goal": elements[e].value = "PGM_STRTGC_GOAL_TXT"; break;
				//
				case "cbx_AH_Spcl_Award": elements[e].value = "PGM_SPCL_AWARD_TXT"; break;
				//-------------------------------------------------------------------------
				case "cbx_AH_Prfx": elements[e].value = "ALMN_PFX_DSC"; break;
				//
				case "cbx_AH_FNm": elements[e].value = "ALMN_FRST_NM"; break;
				//
				case "cbx_AH_MI": elements[e].value = "ALMN_MIDL_NM"; break;
				//
				case "cbx_AH_LNm": elements[e].value = "ALMN_LAST_NM"; break;
				//
				case "cbx_AH_LNm2": elements[e].value = "ALMN_LAST_NM2"; break;
				//
				case "cbx_AH_Sfx": elements[e].value = "ALMN_SFX_DSC"; break;
				//-------------------------------------------------------------------------
				case "cbx_AH_Sex": elements[e].value = "ALMN_SEX_IND"; break;
				//
				case "cbx_AH_Dob": elements[e].value = "ALMN_DOB_DT"; break;
				//
				case "cbx_AH_Cntry_Ctznsp": elements[e].value = "ALMN_CTZNSP_CNTRY_CD"; break;
				//
				case "cbx_AH_Cntry_Ctznsp2": elements[e].value = "ALMN_CTZNSP_CNTRY_CD2"; break;
				//-------------------------------------------------------------------------
				case "cbx_AH_Cntct": elements[e].value = "ALMN_CNTCT_IND"; break;
				//
				case "cbx_AH_Dcsd": elements[e].value = "ALMN_DCSD_IND"; break;
				//
				case "cbx_AH_Dsabld": elements[e].value = "ALMN_DSABLD_IND"; break;
				//
				case "cbx_AH_Intrst": elements[e].value = "INTRST_NM"; break;
				//-------------------------------------------------------------------------
				case "cbx_AH_Title": elements[e].value = "JOB_TITLE_TXT"; break;
				//
				case "cbx_AH_ELP_Speak": elements[e].value = "ALMN_ELP_SPEAK_FSI_LEVEL_NUM"; break;
				//
				case "cbx_AH_ELP_Read": elements[e].value = "ALMN_ELP_READ_FSI_LEVEL_NUM"; break;
				//
				case "cbx_AH_ELP_Comp": elements[e].value = "ALMN_ELP_COMP_FSI_LEVEL_NUM"; break;
				//
				case "cbx_AH_Comments": elements[e].value = "USR_COMNT_COMNT_TXT"; break;
				//-------------------------------------------------------------------------
				case "cbx_AH_BusAddr": elements[e].value = "USR_BUS_ADDR"; break;
				//
				case "cbx_AH_HomeAddr": elements[e].value = "USR_HOME_ADDR"; break;
				//-------------------------------------------------------------------------
				case "cbx_AH_Prominent": elements[e].value = "ALMN_PROMINENT_CD"; break;
				//-------------------------------------------------------------------------
				
			}
		}
	}
	//
	if (vCounter == 0) 
	{ 
		vValidationPassed = "NO";
	    alert("Your request cannot be processed.  Please use checkboxes to select fields for Ad-Hoc Report.")	
	} 
	//
}}
//
//----------------------------------------------------------------------------------------------------
function f_Search(argDocType){with(self.document.forms[0])
{//alert(h_AnyChanges.value)
	
	h_DocType.value = argDocType;
	var vValidationPassed = "YES";
	//=====================================================================================
	if (  
		txt_CS_Frst_Nm.value == ""   &&
		txt_CS_Last_Nm.value == ""   &&
		ddlb_CS_Gender.value == "-1" &&
		//
		ddlbm_CS_From_Cntry.value == "-1" &&
		ddlbm_CS_To_Cntry.value   == "-1" &&
		//
		ddlbm_CS_Pgm_Type.value == "-1" &&
		//
		ddlb_CS_Year_Type.value == "-1" &&
		ddlb_CS_Year.value      == "-1" &&
		//
		txt_CS_Field_Stdy_Nm.value == "" &&
		ddlb_CS_ALMN_PROMINENT_CD.value == "-1" &&
		//
		ddlb_CS_Citznsp_Cntry_CD.value == "-1" &&
		ddlb_CS_Resdnc_Cntry_CD.value  == "-1" &&
		txt_CS_Resdnc_City_Nm.value    == ""   &&
		//
		txt_CS_Host_Instn_Nm.value == "" &&
		txt_CS_Visit_City_Nm.value == ""
		
	)
	{
		alert("Sorry, we cannot process your request.  You have to select search criteria.")
		vValidationPassed = "NO";
	}
	//=====================================================================================
	//-- 1
	if (ddlb_CS_Year_Type.value != "-1" && ddlb_CS_Year.value == "-1")
	{
		vValidationPassed = "NO";
		alert("Your request cannot be processed.  Please select year.");
		ddlb_CS_Year.focus();
	}
	//-- 2
	if (
			(txt_CS_Host_Instn_Nm.value != "" || txt_CS_Visit_City_Nm.value != "")
			&&
			(ddlbm_CS_To_Cntry.value == -1) 
		)
	{
		vValidationPassed = "NO";
		alert("Your request cannot be processed.  Please select 'Country To'.");
		ddlbm_CS_To_Cntry.focus();
	}
	//=====================================================================================
	f_setValForCheckedCBX();
	//=====================================================================================
	//
	f_CntryList("ddlbm_CS_From_Cntry");
	//
	f_CntryList("ddlbm_CS_To_Cntry");
	//		
	
	var vAnyChangesOnPage =  h_AnyChanges.value;
	if (vAnyChangesOnPage == "YES" && vValidationPassed == "YES") 
	{
		if ( confirm("Do you want to save these Search Criteria?") )
		{
			f_popupSaveAdvSearchName();
		}
		else
		{
			of_CallFile("doStatReport");
		}
	}
	else if (vAnyChangesOnPage == "NO" && vValidationPassed == "YES")
	{
		of_CallFile("doStatReport");
	}
}}
//
//------------------------------------------------------------------------------------------------
//
function of_getValFromDDLM(argCntrlName){with(self.document.forms[0])
{
	var vRtn = "";
	var vRtnTemp = "";
	var vLen = eval(argCntrlName+".options.length");
	//
	for (var e=0; e<vLen; e++)
	{
		if ( eval(argCntrlName+".options["+e+"].selected == true") )
		{
			vRtnTemp = eval(argCntrlName+".options["+e+"].value")+",";
			vRtn = vRtn + vRtnTemp;
		}
	}
	//
	
	//alert(vRtn.substr(0,parseInt(vRtn.length)-1))
	
	return vRtn.substr(0,parseInt(vRtn.length)-1);
}}
//
//------------------------------------------------------------------------------------------------
function f_popupSaveAdvSearchName(){ with(self.document.forms[0])
{ //alert(ddlb_CS_ALMN_PROMINENT_CD.value)
	var url_CS_SearchID = h_CS_Search_ID.value;
	var url_CS_Search_Nm = txt_CS_Search_Nm.value;
	//
	var url_CS_First_Nm = txt_CS_Frst_Nm.value;
	var url_CS_Last_Nm = txt_CS_Last_Nm.value;
	var url_CS_Gender = ddlb_CS_Gender.value;
	var url_CS_From_Cntry = of_getValFromDDLM("ddlbm_CS_From_Cntry");
	var url_CS_To_Cntry = of_getValFromDDLM("ddlbm_CS_To_Cntry");
	var url_CS_Pgm_Type = of_getValFromDDLM("ddlbm_CS_Pgm_Type");
	var url_CS_Year_Type = ddlb_CS_Year_Type.value;
	var url_CS_Year = of_getValFromDDLM("ddlb_CS_Year");
	//
	var url_CS_Field_Stdy_Nm = txt_CS_Field_Stdy_Nm.value;
	var url_CS_ALMN_PROMINENT_CD = ddlb_CS_ALMN_PROMINENT_CD.value;
	var url_CS_Citznsp_Cntry_CD = ddlb_CS_Citznsp_Cntry_CD.value;
	var url_CS_Resdnc_Cntry_CD = ddlb_CS_Resdnc_Cntry_CD.value;
	var url_CS_Resdnc_City_Nm = txt_CS_Resdnc_City_Nm.value;
	var url_CS_Host_Instn_Nm = txt_CS_Host_Instn_Nm.value;
	var url_CS_Visit_City_Nm = txt_CS_Visit_City_Nm.value;
	//
	var popupPage = "popupSaveAdvSearchName_p1.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>"+
					"&url_CS_SearchID="+url_CS_SearchID+
					"&url_CS_Search_Nm="+url_CS_Search_Nm+
					"&url_CS_First_Nm="+url_CS_First_Nm+
					"&url_CS_Last_Nm="+url_CS_Last_Nm+
					"&url_CS_Gender="+url_CS_Gender+
					"&url_CS_From_Cntry="+url_CS_From_Cntry+
					"&url_CS_To_Cntry="+url_CS_To_Cntry+
					"&url_CS_Pgm_Type="+url_CS_Pgm_Type+
					"&url_CS_Year_Type="+url_CS_Year_Type+
					"&url_CS_Year="+url_CS_Year+
					"&url_CS_Field_Stdy_Nm="+url_CS_Field_Stdy_Nm+
					"&url_CS_ALMN_PROMINENT_CD="+url_CS_ALMN_PROMINENT_CD+
					"&url_CS_Citznsp_Cntry_CD="+url_CS_Citznsp_Cntry_CD+
					"&url_CS_Resdnc_Cntry_CD="+url_CS_Resdnc_Cntry_CD+
					"&url_CS_Resdnc_City_Nm="+url_CS_Resdnc_City_Nm+
					"&url_CS_Host_Instn_Nm="+url_CS_Host_Instn_Nm+
					"&url_CS_Visit_City_Nm="+url_CS_Visit_City_Nm+
					"&url_CS_Search_Type="+"<cfoutput>#client.CS_Search_Type#</cfoutput>";
					//alert(popupPage)
	
	var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=650,height=200','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
	
}}
//
//----------------------------------------------------------------------------------------------------

function f_CntryList(argCntrlName){with(self.document.forms[0])
{
	var vUsrRole = "<cfoutput>#client.Usr_Role_CD#</cfoutput>";
	var vCtrlName = argCntrlName;
	if (vUsrRole == 245) //it means this is applicable to FSN ONLY
	{// 
		var vF_Temp = "";
		var vF = "";
		var vSelectedID = "";
		
		//
		for (var f=0; f< eval(vCtrlName+".options.length"); f++)
		{
			if ( eval(vCtrlName+".options["+f+"].selected")  )
			{
				vSelectedID = eval(vCtrlName+".options["+f+"].value");
				break;
			}
		}
		//alert(vSelectedID)
		//if (vSelectedID == "-1")
		if (vSelectedID == "-1" || vSelectedID == "")
		{
			for (var f=0; f< eval(vCtrlName+".options.length"); f++)
			{
				if (eval(vCtrlName+".options["+f+"].value") != "-1")
				{
					vF_Temp = eval(vCtrlName+".options["+f+"].value")+",";
					vF = vF + vF_Temp;
				}
				
			}
			//vF = vF.substr(0, (vF.length-1))
		}
		else//vSelectedID could be "US" or "IT" and so on
		{
			for (var f=0; f< eval(vCtrlName+".options.length"); f++)
			{
				if (eval(vCtrlName+".options["+f+"].selected"))
				{
					vF_Temp = eval(vCtrlName+".options["+f+"].value")+",";
					vF = vF + vF_Temp;
				}
			}
			//vF = vF.substr(0, (vF.length-1))
		}
		vF = vF.substr(0, (vF.length-1));//this procedure removes "," from the last position
		//
		vCtrlName = "h_"+vCtrlName.substr( 6, vCtrlName.length);
		//
		eval(vCtrlName+".value = '"+vF+"'");
	}
	else// applies to all other roles (excluding FSN)
	{
		eval(vCtrlName+".value = ''");
	}
}}
//
//-----------------------------------------------------------------------------------------------------------

</script>
<!--- ... --->
<script language="javascript" type="text/javascript">
for (var i=0; i<self.document.forms[0].ddlb_CS_Year.options.length; i++)
{
	self.document.forms[0].ddlb_CS_Year.options[i].selected = false;
}
</script>


<cfloop index = "i" list = "#client.CS_Year#" delimiters=",">
  <script language="javascript" type="text/javascript">
	of_selectedInDDLB("ddlb_CS_Year", "<cfoutput>#i#</cfoutput>");
  </script>
</cfloop>
<!--- 
<cfif client.CS_SetDefault EQ "NO">
	<script language="javascript" type="text/javascript">
		f_showSelection();
	</script>
</cfif>
 --->