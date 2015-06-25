<!--- inc_AdvancedSearch_Tbl.cfm --->
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
//
//--------------------------------------------------------------------------------------------------
//alert("before f_onChng_YearType")
/*
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
*/
//alert("after f_onChng_YearType")
//
//--------------------------------------------------------------------------------
function f_AnyChanges(argAnyChenges){ with(self.document.forms[0])
{
	//alert("anych")
	h_AnyChanges.value = argAnyChenges;
}}
//
//---------------------------------------------------------------------------------
/*
function f_ShowHideAddCriteria(){with(self.document.forms[0])
{
	var vAction = h_ShowHideAddCriteria.value;
	//alert(vAction)
	var vPhrase = "";
	var vFieldOfStudy = "";
	var vCitnshpCntry = "";
	var vHostInst = "";
	//
	//alert(vAction)
	switch (vAction)
	{
		case "SHOW":
			//
			vPhrase += "<a href=\"##\" onClick=\"JavaScript: f_ShowHideAddCriteria();\">";
			vPhrase += "Hide Additional Criteria";
			vPhrase += "</a>";
			//
			vAction = "HIDE";
			//
			vFieldOfStudy = "visible";
			vCitnshpCntry = "visible";
			vHostInst = "visible";
			
		break;
		//
		case "HIDE": 
			//
			vPhrase += "<a href=\"##\" onClick=\"JavaScript: f_ShowHideAddCriteria();\">";
			vPhrase += "Show Additional Criteria";
			vPhrase += "</a>";
			//
			vAction = "SHOW";
			//
			vFieldOfStudy = "hidden";
			vCitnshpCntry = "hidden";
			vHostInst = "hidden";
			
		break;
	}
	 //
	 of_innerHTML("id_PhraseAddCriteria", "'"+vPhrase+"'");
	 //
	 h_ShowHideAddCriteria.value = vAction;
	 //
	 of_Style("id_FieldOfStudy", "visibility", vFieldOfStudy);
	 of_Style("id_CitnshpCntry", "visibility", vCitnshpCntry);
	 of_Style("id_HostInst", "visibility", vHostInst);
}}
*/
</script> 

<cfoutput>
	<cfif client.CS_SetDefault EQ "NO">
		<input type="hidden" name="h_SearchCriteria" value="">
	<cfelseif client.CS_SetDefault EQ "YES">
		<input type="hidden" name="h_SearchCriteria" value="#client.CS_SearchCriteria#">
	</cfif>
	<!--- <input type="hidden" name="h_SearchCriteria" value="#client.CS_SearchCriteria#"> --->
	<input type="hidden" name="h_CS_Search_ID" value="#client.CS_Search_ID#">
	<input type="hidden" name="h_AnyChanges" value="NO">
	
	<input type="hidden" name="txt_CS_Search_Nm" value="#client.CS_Search_Nm#" size="60" class="forminputs" onBlur="f_AnyChanges('YES');" >
	
	<input type="hidden" name="h_ShowHideAddCriteria" value="">
	
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
					<input type="button" name="cb_Search1" value="Search" class="c_formbuttons" onClick="JavaScript: f_Search();">
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
							onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);
								               f_AnyChanges('YES');"
							onChange="javascript: while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" >
				</td>
				<td>
					<input	type="text" value="<cfoutput>#client.CS_Last_Nm#</cfoutput>"
							name="txt_CS_Last_Nm" 
							maxlength="60" 
							size="25"
							title="Enter Last Name"
							class="forminputs"
							onKeyUp="JavaScript: f_showSelection();"
							onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);
								               f_AnyChanges('YES');"
							onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
				</td>
				<td>
					<select name="ddlb_CS_Gender" class="forminputs" onChange="JavaScript: f_showSelection();" onBlur="f_AnyChanges('YES');">
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
					<select name="ddlbm_CS_From_Cntry" class="forminputs" size="5" multiple onChange="JavaScript: f_showSelection();" onBlur="f_AnyChanges('YES');"> 
						<option value="-1">=== Select Country ===</option>
						<cfloop query="spr_getCntryFrom" startrow="1" endrow="#spr_getCntryFrom.recordCount#">
						<cfoutput>
						<option value="#spr_getCntryFrom.pgm_from_cntry_cd#">#spr_getCntryFrom.cntry_name#</option>
						</cfoutput>
						</cfloop>
					</select>
				</td>
				<td>
					<select name="ddlbm_CS_To_Cntry" class="forminputs" size="5" multiple onChange="JavaScript: f_showSelection();" onBlur="f_AnyChanges('YES');">
						<option value="-1">=== Select Country ===</option>
						<cfloop query="spr_getCntryTo" startrow="1" endrow="#spr_getCntryTo.recordCount#">
						<cfoutput>
						<option value="#spr_getCntryTo.pgm_to_cntry_cd#">#spr_getCntryTo.cntry_name#</option>
						</cfoutput>
						</cfloop>
					</select>
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
					<select name="ddlbm_CS_Pgm_Type" class="forminputs" size="5" multiple  onChange="JavaScript: f_showSelection();" onBlur="f_AnyChanges('YES');">
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
					<select name="ddlb_CS_Year_Type" class="forminputs" size="4" onChange="JavaScript: f_onChng_YearType(this.value); f_showSelection();" onBlur="f_AnyChanges('YES');">
						<option value="-1">=== Select Type ===</option>
						<option value="FY">Fiscal Year</option>
						<option value="PS">Program Start Year</option>
						<option value="FYPS">Fiscal & Program Start Year</option>
					</select>
				</td>
				<td valign="top">
					<select name="ddlb_CS_Year" class="forminputs" multiple onChange="JavaScript: f_showSelection();" onBlur="f_AnyChanges('YES');"></select>
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->
	</td>
  </tr>
  <!--- END OF BASIC  END OF BASIC  END OF BASIC  END OF BASIC  END OF BASIC  END OF BASIC  END OF BASIC --->
  <!--- ------------------------------------------------------------------------------------------------ --->
  <!--- START ADVANCED  START ADVANCED  START ADVANCED  START ADVANCED  START ADVANCED  START ADVANCED   --->
  <tr>
  	<td>
		<!--- --------------------------------------------------- --->
		<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
			<tr>
				<td align="center" width="3%">
					<a href="##" onClick="JavaScript: f_ShowHideAddCriteria();">
					<img border="0" src="Img/Attn.jpg">
					</a>
				</td>
				<td class="c_fieldName" id="id_PhraseAddCriteria">
					&nbsp;
					<!--- <a href="##" onClick="JavaScript: f_ShowHideAddCriteria();">Show Additional Criteria</a> --->
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->
	</td>
  </tr>
  <tr><td></td></tr>
</table>

 <!--- FIELD OF STUDY/Project Subject --->
<table align="center" width="100%"  border="0" cellspacing="2" cellpadding="2">
   <tr>
  	<td id="id_FieldOfStudy">
		<!--- --------------------------------------------------- --->
		
		<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
			<tr>
				<td class="c_fieldName" bgcolor="#C7DD9C">FIELD OF STUDY / PROJECT SUBJECT</td>
			</tr>
			<tr></tr>
				<td>
					<cfoutput>
					<input type="text" name="txt_CS_Field_Stdy_Nm" value="#client.CS_Field_Stdy_Nm#" size="40" class="forminputs" onKeyUp="JavaScript: f_showSelection();"
						   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						   onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);
								   f_AnyChanges('YES');">
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
				
			</tr>
			<tr>
				<td>
					<select name="ddlb_CS_Citznsp_Cntry_CD" class="forminputs" onChange="JavaScript: f_showSelection();"  onBlur="f_AnyChanges('YES');"></select>
				</td>
				<td>
					<select name="ddlb_CS_Resdnc_Cntry_CD" class="forminputs" onChange="JavaScript: f_showSelection();" onBlur="f_AnyChanges('YES');"></select>
				</td>
				<td>
					<cfoutput>
					<input type="text" name="txt_CS_Resdnc_City_Nm" value="#client.CS_Resdnc_City_Nm#" size="40" class="forminputs"  onKeyUp="JavaScript: f_showSelection();"
						   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						   onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);
					               f_AnyChanges('YES');">
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
  <tr>
    <td id="id_HostInst">
		<!--- --------------------------------------------------- --->
		
		<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
			<tr bgcolor="#C7DD9C">
				<td width="50%">
					<a href="##" onClick="JavaScript: f_openPopUpWin('HOST_INSTITUTION')">
						<span class="c_fieldName" style="text-decoration:underline; ">
						HOST INSTITUTION
						</span>
					</a>
				</td>
				<td>
					<a href="##" onClick="JavaScript: f_openPopUpWin('CITY_VISITED')">
						<span class="c_fieldName" style="text-decoration:underline; ">
						CITY VISITED
						</span>
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<cfoutput>
					<input disabled type="text" name="txt_CS_Host_Instn_Nm" value="#client.CS_Host_Instn_Nm#" size="40" class="forminputs"  onKeyUp="JavaScript: f_showSelection();"
						   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						   onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);
								   f_AnyChanges('YES');">
					</cfoutput>
				</td>
				<td>
					<cfoutput>
					<input disabled type="text" name="txt_CS_Visit_City_Nm" value="#client.CS_Visit_City_Nm#" size="40" class="forminputs"  onKeyUp="JavaScript: f_showSelection();"
						   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
						   onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);
								   f_AnyChanges('YES');">
					</cfoutput>
				</td>
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
					<input type="button" name="cb_Search2" value="Search" class="c_formbuttons" onClick="JavaScript: f_Search();">
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

<script language="javascript" type="text/javascript">
//-- Filling default values in controls:
of_selectedInDDLB("ddlb_CS_Gender", "<cfoutput>#client.CS_Gender#</cfoutput>");
//
of_selectedInDDLB("ddlb_CS_Year_Type", "<cfoutput>#client.CS_Year_Type#</cfoutput>");
//
f_onChng_YearType(self.document.forms[0].ddlb_CS_Year_Type.value);
//
self.document.forms[0].h_ShowHideAddCriteria.value = "<cfoutput>#client.ShowHideAddCriteria#</cfoutput>";
f_ShowHideAddCriteria();
//
of_populateSelect( "ddlb_CS_Citznsp_Cntry_CD", "-1", "=== Select Countries ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
of_selectedInDDLB("ddlb_CS_Citznsp_Cntry_CD", "<cfoutput>#client.CS_Citznsp_Cntry_CD#</cfoutput>");
//
of_populateSelect( "ddlb_CS_Resdnc_Cntry_CD", "-1", "=== Select Countries ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
of_selectedInDDLB("ddlb_CS_Resdnc_Cntry_CD", "<cfoutput>#client.CS_Resdnc_Cntry_CD#</cfoutput>");


//-- End of filling default values
//-------------------------------------
//of_Style("id_CustomSearch",  "visibility", "hidden");
//
function f_openPopUpWin(argItemNm){with(self.document.forms[0])
{//alert(argItemNm)
	
	
}}




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
		h_ShowHideAddCriteria.value = "HIDE";
		//
		f_ShowHideAddCriteria();
}}
//
//--------------------------------

//
//----------------------------------------------------------------------------------------------------
function f_Search(){with(self.document.forms[0])
{//alert(h_AnyChanges.value)
	
	
	if (ddlb_CS_Year_Type.value != "-1" && ddlb_CS_Year.value == "-1")
	{
		alert("Your request cannot be processed.  Please select year.");
		ddlb_CS_Year.focus();
	}
	else
	{
		var vAnyChangesOnPage =  h_AnyChanges.value;
		if (vAnyChangesOnPage == "YES")
		{
			if ( confirm("Do you want to save these Search Criteria?") )
			{
				f_popupSaveSearchName();
			}
			else
			{
				of_CallFile("doCustomSearch");//used to be basicCustomSearch
			}
		}
		else
		{
			of_CallFile("doCustomSearch");
		}
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
function f_popupSaveSearchName(){ with(self.document.forms[0])
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
	var popupPage = "popupSaveSearchName_p1.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>"+
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
					"&url_CS_Visit_City_Nm="+url_CS_Visit_City_Nm;
					//alert(popupPage)
	
	var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=650,height=200','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
	
}}
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