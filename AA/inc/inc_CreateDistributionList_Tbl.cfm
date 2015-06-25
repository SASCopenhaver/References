<!--- inc_Search_Tbl.cfm --->
<script src="JS/incJS_onChng_YearType.js" type="text/javascript"></script>
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
//--------------------------------------------------------------------------------
function f_AnyChanges(argAnyChenges){ with(self.document.forms[0])
{
	//alert("anych")
	h_AnyChanges.value = argAnyChenges;
}}
//
//---------------------------------------------------------------------------------

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

<table width="100%"  border="0" cellspacing="2" cellpadding="2">
  <!--- BUTTONS --->
  <tr>
    <td >
		<!--- --------------------------------------------------- --->
		<table width="100%"  border="0" cellspacing="3" cellpadding="2">
			<tr align="right">
				<td valign="top" colspan="2">
					<!--- <input type="button" name="cb_Search11" value="Create MS-Word document" class="c_formbuttons" onClick="JavaScript: f_Search('DOC');">
					&nbsp;&nbsp; --->
					<input type="button" name="cb_Search1" value="Create MS-Excel spreadsheet" class="c_formbuttons" onClick="JavaScript: f_Search('XLS');">
					&nbsp;&nbsp;
					<input type="button" name="cb_Reset1" value="Reset" class="c_formbuttons" onClick="JavaScript: f_Reset();">
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->	
	</td>
  </tr>
  <!--- BUTTONS --->
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
					<input	type="text" value="<cfoutput>#client.CS_First_Nm#</cfoutput>" 
							name="txt_CS_Frst_Nm" 
							maxlength="40"  
							size="25"
							title="Enter First Name"
							class="forminputs" 
							onKeyUp="JavaScript: f_showSelection();"
							onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
							onChange="javascript:f_AnyChanges('YES'); while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" >
				</td>
				<td>
					<input	type="text" value="<cfoutput>#client.CS_Last_Nm#</cfoutput>"
							name="txt_CS_Last_Nm" 
							maxlength="60" 
							size="25"
							title="Enter Last Name"
							class="forminputs"
							onKeyUp="JavaScript: f_showSelection();"
							onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
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
					<select name="ddlbm_CS_To_Cntry" class="forminputs" size="5" multiple onChange="JavaScript:f_AnyChanges('YES'); of_ruleInMultSelectCntrl(this.name);  f_showSelection();" >
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
					<select name="ddlbm_CS_Pgm_Type" class="forminputs" size="5" multiple  onChange="JavaScript:f_AnyChanges('YES'); of_ruleInMultSelectCntrl(this.name);  f_showSelection();">
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
<!--- FIELD OF STUDY/Project Subject --->
<table align="center" width="100%"  border="0" cellspacing="2" cellpadding="2">
   <tr>
  	<td id="id_FieldOfStudy">
		<!--- --------------------------------------------------- --->
		
		<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
			<tr>
				<td class="c_fieldName" bgcolor="#C7DD9C">FIELD OF STUDY/PROJECT SUBJECT</td>
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
						    onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</cfoutput>
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
					<select name="ddlb_CS_Resdnc_Cntry_CD" class="forminputs" onChange="JavaScript:f_AnyChanges('YES'); f_showSelection();"></select>
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
					
					<cfoutput>
					<input type="text" name="txt_CS_Host_Instn_Nm" value="#client.CS_Host_Instn_Nm#" size="40" class="forminputs"  onKeyUp="JavaScript: f_showSelection();"
						   onChange="javascript:f_AnyChanges('YES'); while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						   onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</cfoutput>
					
				</td>
				<td>
					<cfoutput>
					<input type="text" name="txt_CS_Visit_City_Nm" value="#client.CS_Visit_City_Nm#" size="40" class="forminputs"  onKeyUp="JavaScript: f_showSelection();"
						   onChange="javascript:f_AnyChanges('YES'); while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						   onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</cfoutput>
					
			</tr>
			
		</table>
		
	<!--- --------------------------------------------------- ---> 
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
//--------------------------------

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
	//
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
			//alert()
			//of_CallFile("doMailingLables");
		}
		else
		{
			of_CallFile("doDistributionList");
		}
	}
	else if (vAnyChangesOnPage == "NO" && vValidationPassed == "YES")
	{
		//alert("NO  YES")
		of_CallFile("doDistributionList");
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
{
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