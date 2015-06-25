<!--- inc_UserProfile_p1.cfm --->
<script language="javascript" type="text/javascript">
//
//----------------------------------------------------------------------------------------------------------------------
function f_IsNumber(argValue, argCtrlName){with(self.document.forms[0]){
	var vLastVal = "";
	if (argValue.length > 0)
	{
		if (argValue.length == 1){ vLastVal = argValue; }
		else { vLastVal = argValue.substr((parseInt(argValue.length)-1),1); }
	}
	//alert(vLastVal)
	if ( isNaN(vLastVal) )
	{
		if (argValue.length == 1){ eval(argCtrlName+".value = ''"); alert("Sorry, value in this field should consist of numbers only.");}
		else
		{
			vLastVal = argValue.substr(0, parseInt(argValue.length)-1);
			eval(argCtrlName+".value = "+vLastVal);
			alert("Sorry, value in this field should consist of numbers only.");
		}
	}
}}
//
//---------------------------------------------------------------------------------------------------------------------
//
function f_onChangeAARole(argValue){with(self.document.forms[0])
{
/*
-1 Nothing
1	Data manager, appointed by ECA

241	DOS Foreign Service stationed abroad
300	DOS Civil Service stationed abroad
301	DOS Contract Employee stationed abroad

242	PAO or Chief American PD officer abroad

245	FSN - Foreign Service National

302	DOS Foreign Service stationed in US
303	DOS Contract Employee stationed in US
304	ECA/P Office Director
306	State Dept. Domestic Office Director
307	DOS Civil Service stationed in US	

=====================================
ddlb_UP_Usr_CountryOfAssignmt_CD
ddlb_UP_Usr_CityPostOfAssignmt_NM 
txt_UP_NewPostCity

*/
	switch (argValue)
	{
		case "-1"://Default
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", "-1");
			
			//Post/City of Assignment
			of_populateSelect( "ddlb_UP_Usr_CityPostOfAssignmt_NM", "-1", "=== Select City/Post ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "-1");
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			 
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
		break;
		//
		case "1"://1	Data manager, appointed by ECA
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "US", "United States of America", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", "US");
			
			//Post/City of Assignment
			f_OnChangeCountry();
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "Washington"); 
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== No Addnl Countries ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "<cfoutput>#spr_getGA_UsrCntry.usr_cntry_ofc_abbr#</cfoutput>");
		break;
		//
		case "241"://241	DOS Foreign Service stationed abroad
		case "300"://300	DOS Civil Service stationed abroad
		case "301"://301	DOS Contract Employee stationed abroad
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", "<cfoutput>#spr_getGA_UsrCntry.usr_cntry_cntry_cd#</cfoutput>");
			
			//Post/City of Assignment
			f_OnChangeCountry();
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "<cfoutput>#spr_getGA_UsrCntry.usr_cntry_city_post_nm#</cfoutput>");
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== No Addnl Countries ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Role ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
			
		break;
		//
		case "242"://242	PAO or Chief American PD officer abroad
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", "<cfoutput>#spr_getGA_UsrCntry.usr_cntry_cntry_cd#</cfoutput>");
						
			//Post/City of Assignment
			f_OnChangeCountry();
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "<cfoutput>#spr_getGA_UsrCntry.usr_cntry_city_post_nm#</cfoutput>");
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== No Addnl Countries ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
		break;
		//
		case "245"://245	FSN - Foreign Service National
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			
			for (var uc=0; uc<rowsUC; uc++)
			{ 
				if ( orgBfrUC[uc].ausr_cntry_is_prmry == "Y" )
				{
					of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", orgBfrUC[uc].ausr_cntry_cntry_cd);
					break;
				}
			}
			
			//Post/City of Assignment
			f_OnChangeCountry();
			for (var uc=0; uc<rowsUC; uc++)
			{ <!--- alert(orgBfrUC[uc].ausr_cntry_city_post_nm+"   "+orgBfrUC[uc].ausr_cntry_is_prmry) --->
				if ( orgBfrUC[uc].ausr_cntry_is_prmry == "Y" )
				{
					of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", orgBfrUC[uc].ausr_cntry_city_post_nm);
					break;
				}
			}
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			if ("<cfoutput>#client.UsrAddCntryCD#</cfoutput>" != "")
			{
				var vTempPartStr = "<cfoutput>#client.UsrAddCntryCD#</cfoutput>";
				var vTempShowStr = "";
				var pos0=0;
				while (vTempPartStr.indexOf(",") != -1) 
				{
					vTempShowStr = vTempPartStr.substr(0,2);
					of_selectedInDDLB("ddlbm_UP_Usr_AddnlCountry", vTempShowStr);
					vTempPartStr = vTempPartStr.substr(3);
				}
				of_selectedInDDLB("ddlbm_UP_Usr_AddnlCountry", vTempPartStr);
				
				vOutputTitle ="SELECTED COUNTRIES:"; 
				of_innerHTML("id_Title", "'"+vOutputTitle+"'");
			}
			
			
			//
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'"+"<cfoutput>#client.UsrAddCntryNM#</cfoutput>"+"'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Role ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
			
			
			
			
		break;
		//
		case "302"://302	DOS Foreign Service stationed in US
		case "303"://303	DOS Contract Employee stationed in US
		case "304"://304	ECA/P Office Director
		case "306"://306	State Dept. Domestic Office Director
		case "307"://307	DOS Civil Service stationed in US	
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "US", "United States of America", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", "US");
			
			//Post/City of Assignment 
			f_OnChangeCountry();
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "Washington"); 
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== No Addnl Countries ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "<cfoutput>#spr_getGA_UsrCntry.usr_cntry_ofc_abbr#</cfoutput>");
			
		break;
	}
	
	//
	//f_ShowHideAddnlCntry();
	//
	//it was commented//f_showSelection()
}}
//
//---------------------------------------------------------------------------------------------------------------------------------------

function f_OnChangeCountry(){with(self.document.forms[0]){
	var vCountryID = ddlb_UP_Usr_CountryOfAssignmt_CD.value;
	//
	switch (vCountryID)
	{
		case "-1":
			//Post/City of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CityPostOfAssignmt_NM", "-1", "=== No Posts/Cities ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "-1");
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== No Addnl Countries ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Role ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
		break;
		//
		case "US":
			//Post/City of Assignment 
			// filter orgBfrCP:
			filterBfrCP =  new Array();
			var fcp = 0;
			for (var cp=0; cp<rowsCP; cp++)
			{
				if (vCountryID == orgBfrCP[cp].acity_cntry_cd)
				{
					filterBfrCP[fcp] = new arrayCP ( orgBfrCP[cp].acity_cntry_cd
													,orgBfrCP[cp].acity_city_nm
												   )
					fcp++;
				}
			}
			of_populateSelect( "ddlb_UP_Usr_CityPostOfAssignmt_NM", "-1", "=== Select City ===", filterBfrCP.length, "filterBfrCP", "acity_city_nm", "acity_city_nm", "2D" );
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== No Addnl Countries ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
		break;
		//
		default :
			//Post/City of Assignment 
			filterBfrCP =  new Array();
			var fcp = 0;
			for (var cp=0; cp<rowsCP; cp++)
			{
				if (vCountryID == orgBfrCP[cp].acity_cntry_cd)
				{
					filterBfrCP[fcp] = new arrayCP ( orgBfrCP[cp].acity_cntry_cd
													,orgBfrCP[cp].acity_city_nm
												   )
					fcp++;
				}
			}
			//
			of_populateSelect( "ddlb_UP_Usr_CityPostOfAssignmt_NM", "-1", "=== Select City ===", filterBfrCP.length, "filterBfrCP", "acity_city_nm", "acity_city_nm", "2D" );
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Role ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
	}
	//
	//f_ShowHideAddnlCntry();
	////f_ShowHideAddnlCntry(vCountryID);
	// 
	//f_show_DOS_OfficeCode(vCountryID);
	//
	
}}

//
//---------------------------------------------------------------------------------------------------------------------------------------
/*
function f_show_DOS_OfficeCode (argCountryID){with(self.document.forms[0])
{//
	var vOutput = "";
	if ( vCountryID == "US" )
	{
		vOutput = "<select name=\"ddlb_UP_Usr_DOS_OfficeCode_CD\" class=\"forminputs\"></select>";
	}
	else
	{
		vOutput = "No office code for selected Country of Assignmnet.";//"&nbsp;"
	}
	//
	of_innerHTML("id_DosOffice", "'"+vOutput+"'");
	//
	if ( vCountryID == "US" )
	{
		of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
		//
		for (var uc=0; uc<orgBfrUC.length; uc++)
		{
			if (orgBfrUC[uc].ausr_cntry_is_prmry == "Y")
			{
				of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", orgBfrUC[uc].ausr_cntry_ofc_abbr);
				break;
			}
		}
	}
}}
*/
//
//-----------------------------------------------------------------------------------------------------------
/*
function f_ShowHideAddnlCntry(){with(self.document.forms[0])
{
	var vRoleID = ddlb_UP_Usr_AlumniArchiveRole_ID.value;
	var vCntryCD = ddlb_UP_Usr_CountryOfAssignmt_CD.value;
	var vAllCntryAccss = "";
	//alert(vRoleID +"   "+vCntryCD)
	for (var ar=0; ar<orgBfrAR.length; ar++)
	{
		if (vRoleID == orgBfrAR[ar].aapp_role_id)
		{
			vAllCntryAccss = orgBfrAR[ar].aapp_role_all_cntry_access;
			break;
		}
	}
	//alert(vAllCntryAccss)
	//
	if (vAllCntryAccss == "Y")
	{
		of_innerHTML("id_AddnlCntry", "'Access to all countries.'");
	}
	else if (vAllCntryAccss == "")
	{
		of_innerHTML("id_AddnlCntry", "'Access to additional countries depends on your role.'");
	}
	else// vAllCntryAccss == "N"
	{
		of_innerHTML("id_AddnlCntry", "'"+" <select name=\"ddlbm_UP_Usr_AddnlCountry\" class=\"forminputs\" multiple size=5 onChange=\"f_showSelection();\"></select>  "+"'");
		of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== Select Countries ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
	}
}}
*/
//

function f_showSelection(){with(self.document.forms[0])
{
	var vSelectedID = "";
	var vSelectedTxt = "";
	var vCountSelected = 0;
	var vCtrlName = "ddlbm_UP_Usr_AddnlCountry";
	///
	for ( var e=0; e<eval(vCtrlName+".options.length"); e++ )
	{
		if ( eval(vCtrlName+".options["+e+"].selected"))
		{
			vCountSelected++;
		}
		if (vCountSelected >= 2)
		{
			break;
		}
	}
	///
	for ( var e=0; e<eval(vCtrlName+".options.length"); e++ )
	{
		if ( eval(vCtrlName+".options["+e+"].selected") )
		{
			vSelectedID = eval(vCtrlName+".options["+e+"].value");
			if ( (vSelectedID == -1) && (vCountSelected > 1) )
			{
				eval(vCtrlName+".options["+0+"].selected = false");
			}
			else 
			{
				vSelectedTxt += eval(vCtrlName+".options["+e+"].text")+"; ";
			}
		}
	}
	//
	var vOutputTxt = "";
	var vOutputTitle = "";
	if (vSelectedID != -1)
	{
		vOutputTitle ="SELECTED COUNTRIES:";
		vOutputTxt += vSelectedTxt;
	}
	else
	{
		vOutputTitle =  "&nbsp;";
		vOutputTxt = "&nbsp;";
	}
	//
	of_innerHTML("id_Title", "'"+vOutputTitle+"'");
	of_innerHTML("id_ListOfAddnlCntry", "'"+vOutputTxt+"'");
	//h_showSelection.value = vOutputTxt;
	
}}//end of function

//
//-------------------------------------------------------------------------------------------------------------------
</script>
<cfoutput>
<input type="hidden" name="h_UP_Usr_ID" value="#spr_getUP_Usr.usr_cd#">
<input type="hidden" name="h_EMailMsg" value="">
<input type="hidden" name="h_SendEMailTo" value="#spr_getUP_Usr.usr_email#">
<div class="feature">
<table align="center" width="95%" border=0 cellpadding="1" cellspacing="1">
	<tr>
		<td valign="bottom" align="left">
			<font color="##FF0000" size="+2">*</font> - required field
		</td>
	</tr>
	<!--- BUTTONS --->
	<tr>
      <td >
		<!--- --------------------------------------------------- --->
		<table width="100%" border=0  bgcolor="##EFEFEF">
			<tr align="right">
				<td valign="top" colspan="2">
					<input type="button" name="cb_Back2" value="Back To User List" class="c_formbuttons" onClick="JavaScript: of_CallFile(#client.ListType#);">
					<cfif #spr_getUP_Usr.usr_is_act# EQ "H">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="cb_DenyReq2" value="Deny Request" class="c_formbuttons" onClick="JavaScript: f_Validate('DenyRequest'); ">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="cb_ApprReq2" value="Approve Request" class="c_formbuttons" onClick="JavaScript: f_Validate('ApprvRequest');">
					<cfelse>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="cb_Submit2" value="Submit" class="c_formbuttons" onClick="JavaScript: f_Validate('Submit');">
					</cfif>
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->	
	</td>
  </tr>
  <!--- BUTTONS --->
  <tr><td><hr></td></tr>
	<!--- NAME --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="15%">PREFIX:</td>
					<td width="20%" colspan="2">FIRST NAME:</td>
					<td width="10%">MIDDLE INITIAL:</td>
					<td width="20%" colspan="2">LAST NAME:</td>
				</tr>
				<tr>
					<td><select name="ddlb_UP_Usr_Prfx" class="forminputs"></select></td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_FName" value="#spr_getUP_Usr.usr_fname#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_MI" value="#spr_getUP_Usr.usr_mi#" size="3"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_LName" value="#spr_getUP_Usr.usr_lname#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
	<!--- PHONE and E-MAIL --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="15%" colspan="2">PHONE:</td>
					<td width="20%">EXT:</td>
					<td width="30%" colspan="2">E-MAIL:</td>
				</tr>
				<tr>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
       					<input class="forminputs" type="text" name="txt_UP_Usr_Phone" value="#spr_getUP_Usr.usr_phone#"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_Ext" value="#spr_getUP_Usr.usr_ext#" size="5"  onKeyUp="f_IsNumber(this.value, this.name);"
								onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_Email" value="#spr_getUP_Usr.usr_email#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		
		</td>
	</tr>
	<!--- LOGIN INFORMATION --->
	 <tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="15%" colspan="2">LOGIN NAME:</td>
					<td width="20%" colspan="2">PASSWORD:</td>
					<td width="30%" colspan="2">STATUS:</td>
				</tr>
				<tr>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
          				<input class="forminputs" type="text" name="txt_UP_Usr_UserName" value="#spr_getUP_Usr.usr_uname#"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="password" name="txt_UP_Usr_Pass" value="#spr_getUP_Usr.usr_pass#"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<select name="ddlb_UP_Usr_Status_CD" class="forminputs"></select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!--- ROLES --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="35%" colspan="2">ROLE:</td>
					<td width="30%" id="id_FieldNm">Estimated Date of Final Departure (Format mm/dd/yyyy):</td>
				</tr>
				<tr>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<select name="ddlb_UP_Usr_AlumniArchiveRole_ID" class="forminputs" onChange="f_onChangeAARole(this.value);"></select>
					</td>
					<td id="id_Cntrl">
						<input class="forminputs" type="text" name="txt_UP_Usr_Est_Depart" value="#DateFormat(spr_getUP_Usr.usr_est_depart_dt,'mm/dd/yyyy')#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!--- COUNTRY OF ASSIGNMENT --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="25%" colspan="2">COUNTRY OF ASSIGNMENT:</td>
					<td width="25%" colspan="2">POST/CITY OF ASSIGNMENT:</td>
					<td width="30%">NEW POST/CITY:</td>
				</tr>
				<tr>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<select name="ddlb_UP_Usr_CountryOfAssignmt_CD" class="forminputs" onChange="f_OnChangeCountry();"></select>
					</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<select name="ddlb_UP_Usr_CityPostOfAssignmt_NM" class="forminputs"></select>
					</td>
					<td><!--- onBlur="f_DeSelectPostCity(this.value);" --->
						<input class="forminputs" type="text" name="txt_UP_NewPostCity" value=""  id="id_UP_NewPostCity" 
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		
		</td>
	</tr>
	<!--- ADDITIONAL COUNTRIES / DOS OFFICE CODE --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="15%">ADDITIONAL COUNTRIES:</td>
					<td width="20%" id="id_Title">&nbsp;</td>
					<td width="30%">DoS OFFICE CODE:</td>
				</tr>
				<tr>
					<td id="id_AddnlCntry" class="c_fieldValue">
						<select name="ddlbm_UP_Usr_AddnlCountry" class="forminputs" multiple size=5 onChange="f_showSelection();"></select>
					</td>
					<td id="id_ListOfAddnlCntry" width="25%" valign="top" class="c_fieldValue">&nbsp;</td>
					<td id="id_DosOffice" valign="top" class="c_fieldValue">
						<select name="ddlb_UP_Usr_DOS_OfficeCode_CD" class="forminputs"></select>
					</td>
				</tr>
			</table>

		</td>
	</tr>
	<!--- AUTHORIZED AGENT --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td>AUTHORIZED AGENT:</td>
				</tr>
				<tr>
					<td id="id_AddnlCntry" class="c_fieldValue">#spr_getUP_Usr.usr_auth_agent_full_nm#</td>
				</tr>
			</table>

		</td>
	</tr>
	<!--- COMMENTS --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td>COMMENTS:</td>
				</tr>
				<tr>
					<cfif #spr_getUP_Usr.usr_comnt_comnt_txt# EQ "">
						<cfset local.vUsr_comnt_comnt_txt = "No data avilable">
					<cfelse>
						<cfset local.vUsr_comnt_comnt_txt = spr_getUP_Usr.usr_comnt_comnt_txt>
					</cfif>
					<td id="id_AddnlCntry" class="c_fieldValue">#local.vUsr_comnt_comnt_txt#</td>
				</tr>
			</table>

		</td>
	</tr>
	
	
	
	
	<!--- REQUESTED CHANGES --->
	<cfif #spr_getUP_Usr.usr_comnt_reqchg_txt# NEQ "">
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td>REQUESTED CHANGES:</td>
				</tr>
				<tr>
					<td class="c_fieldValue">#spr_getUP_Usr.usr_comnt_reqchg_txt#</td>
				</tr>
			</table>

		</td>
	</tr>
	</cfif>
	<!--- REQUESTED CHANGES --->
	<tr><td><hr></td></tr>
	<!--- BUTTONS --->
	<tr>
      <td >
		<!--- --------------------------------------------------- --->
		<table width="100%" border=0  bgcolor="##EFEFEF">
			<tr align="right">
				<td valign="top" colspan="2">
					<input type="button" name="cb_Back" value="Back To User List" class="c_formbuttons" onClick="JavaScript: of_CallFile(#client.ListType#);">
					<cfif #spr_getUP_Usr.usr_is_act# EQ "H">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="cb_DenyReq" value="Deny Request" class="c_formbuttons" onClick="JavaScript: f_Validate('DenyRequest'); ">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="cb_ApprReq" value="Approve Request" class="c_formbuttons" onClick="JavaScript: f_Validate('ApprvRequest');">
					<cfelse>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="cb_Submit" value="Submit" class="c_formbuttons" onClick="JavaScript: f_Validate('Submit');">
					</cfif>
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->	
	</td>
  </tr>
  <!--- BUTTONS --->
</table>

</cfoutput>
</div>
<!--- <input type="hidden" name="h_Usr_Role_CD" value=""> --->
<script language="javascript" type="text/javascript">
//PREFIX
of_populateSelect( "ddlb_UP_Usr_Prfx", "-1", "Select Prefix", rowsPrfx, "orgBfrPrfx", "aitem_cd", "aitem_cd", "2D" );
of_selectedInDDLB ("ddlb_UP_Usr_Prfx", "<cfoutput>#spr_getUP_Usr.usr_pfx#</cfoutput>");
//
//--------------------------------------------------------------------------------------------------------------------
of_populateSelect( "ddlb_UP_Usr_AlumniArchiveRole_ID", "-1", "=== Select Role ===", rowsAR, "orgBfrAR", "aapp_role_id", "aapp_role_nm", "2D" );
of_selectedInDDLB ("ddlb_UP_Usr_AlumniArchiveRole_ID", "<cfoutput>#spr_getUP_Usr.usr_role_cd#</cfoutput>"); 
//self.document.forms[0].h_Usr_Role_CD = "<cfoutput>#spr_getUP_Usr.usr_role_cd#</cfoutput>";
//
of_populateSelect( "ddlb_UP_Usr_Status_CD", "-1", "=== Select Status ===", rowsUS, "orgBfrUS", "aitem_cd", "aitem_desc", "2D" );
of_selectedInDDLB ("ddlb_UP_Usr_Status_CD", "<cfoutput>#spr_getUP_Usr.usr_is_act#</cfoutput>"); 
//
of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
//
f_onChangeAARole("<cfoutput>#spr_getUP_Usr.usr_role_cd#</cfoutput>");
//
//--------------------------------------------------------------------------------------------------------------------
//
/*
for (var uc=0; uc<orgBfrUC.length; uc++)
{
	if (orgBfrUC[uc].ausr_cntry_is_prmry == "Y")
	{
		of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", orgBfrUC[uc].ausr_cntry_cntry_cd);
		f_OnChangeCountry(orgBfrUC[uc].ausr_cntry_cntry_cd);
		//alert(orgBfrUC[uc].ausr_cntry_city_post_nm)
		of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", orgBfrUC[uc].ausr_cntry_city_post_nm);
		break;
	}
}
*/
//

//--------------------------------------------------------------------------------------------------------------------
var vValidationPassed = "YES";

function f_Validate(argAction){with(self.document.forms[0])
{
	var vIfSelected = 0;
	var vUsr_Role_ID = ddlb_UP_Usr_AlumniArchiveRole_ID.value;
	//
	
	for (var o=0; o<ddlbm_UP_Usr_AddnlCountry.options.length; o++ )
	{
		if (ddlbm_UP_Usr_AddnlCountry.options[o].selected == true && o != 0 ) 
		{	
			vIfSelected++;
			//alert(ddlbm_UP_Usr_AddnlCountry.options[o].value);
			
		}
		if (vIfSelected >= 1)
		{
			ddlbm_UP_Usr_AddnlCountry.options[0].selected = false;
			break; 
		}
		if (vIfSelected == 0)
		{
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
		}
	}
	
	//-----
	if (vValidationPassed == "YES" && txt_UP_Usr_FName.value == "")
	{ vValidationPassed = "NO"; alert("Sorry, your request cannot be completed.\n'First Name' must be provided."); txt_UP_Usr_FName.focus(); }
	//
	if (vValidationPassed == "YES" && txt_UP_Usr_LName.value == "")
	{ vValidationPassed = "NO"; alert("Sorry, your request cannot be completed.\n'Last Name' must be provided."); txt_UP_Usr_LName.focus(); }
	//
	if (vValidationPassed == "YES" && txt_UP_Usr_Phone.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Phone' must be provided."); txt_UP_Usr_Phone.focus(); }
	//
	if (vValidationPassed == "YES" && txt_UP_Usr_Email.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'E-Mail' must be provided."); txt_UP_Usr_Email.focus(); }
	//
	if (vValidationPassed == "YES" && txt_UP_Usr_UserName.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'User Name' must be provided."); txt_UP_Usr_UserName.focus(); }
	//
	if (vValidationPassed == "YES" && txt_UP_Usr_Pass.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Password' must be provided."); txt_UP_Usr_Pass.focus(); }
	//
	if (vValidationPassed == "YES" && txt_UP_Usr_Pass.value != "")
	{
		// 1. 8 char long
		if (txt_UP_Usr_Pass.value.length < 8 ) { vValidationPassed = "NO"; alert("Sorry, your request cannot be completed.\n'Password' must be at least 8 characters long."); txt_UP_Usr_Pass.focus(); }
		// 2. Check Upper case letters (A B C D )
		// 3. Check Numerals (1 2 3 4 )
		// 4. Check Non-alphanumeric characters (! @ # ^ ...)
	}
	//
	if (vValidationPassed == "YES" && ddlb_UP_Usr_AlumniArchiveRole_ID.value == "-1")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Role' must be selected."); ddlb_UP_Usr_AlumniArchiveRole_ID.focus(); }
	//
	//................................................................................................
	if (vValidationPassed == "YES" && ddlb_UP_Usr_AlumniArchiveRole_ID.value == "242")
	{
		if (txt_UP_Usr_Est_Depart.value == ""){ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' must be provided."); txt_UP_Usr_Est_Depart.focus();  }
		//
		if (txt_UP_Usr_Est_Depart.value != "" && txt_UP_Usr_Est_Depart.value.length != 10)
		{
			vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' is not in requested format."); txt_UP_Usr_Est_Depart.focus();
		}
		//
		if (txt_UP_Usr_Est_Depart.value != "" && txt_UP_Usr_Est_Depart.value.length == 10)
		{
			var vVal = txt_UP_Usr_Est_Depart.value;
			//
			var v0 = vVal.substr(0,1);
			var v1 = vVal.substr(1,1);
			var v2 = vVal.substr(2,1);
			var v3 = vVal.substr(3,1);
			var v4 = vVal.substr(4,1);
			var v5 = vVal.substr(5,1);
			var v6 = vVal.substr(6,1);
			var v7 = vVal.substr(7,1);
			var v8 = vVal.substr(8,1);
			var v9 = vVal.substr(9,1);
			//
			if ( isNaN(v0) || isNaN(v1) || isNaN(v3) || isNaN(v4) || isNaN(v6) || isNaN(v7) || isNaN(v8) || isNaN(v9) )
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' is not in requested format."); txt_UP_Usr_Est_Depart.focus(); }
			//
			if ( v2 != "/" || v5 != "/")
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' is not in requested format."); txt_UP_Usr_Est_Depart.focus(); }
		}
	}
	//................................................................................................
		
	if (	
			(vValidationPassed == "YES" && ddlb_UP_Usr_AlumniArchiveRole_ID.value == "306")
			||
			(vValidationPassed == "YES" && ddlb_UP_Usr_AlumniArchiveRole_ID.value == "302")
			||
			(vValidationPassed == "YES" && ddlb_UP_Usr_AlumniArchiveRole_ID.value == "303")
			||
			(vValidationPassed == "YES" && ddlb_UP_Usr_AlumniArchiveRole_ID.value == "307")
	
		)
	{
		if (ddlb_UP_Usr_DOS_OfficeCode_CD.value == "-1")
		{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'DoS Office Code' is required."); ddlb_UP_Usr_DOS_OfficeCode_CD.focus; }
	}
	//
	if (vValidationPassed == "YES" && ddlb_UP_Usr_CountryOfAssignmt_CD.value == "-1")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Country Of Assignment' must be selected."); ddlb_UP_Usr_CountryOfAssignmt_CD.focus(); }
	
	if (vValidationPassed == "YES" && ddlb_UP_Usr_CityPostOfAssignmt_NM.value == "-1")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Post/City Of Assignment' must be selected."); ddlb_UP_Usr_CityPostOfAssignmt_NM.focus(); }
	//
	switch (argAction)
	{
		case "DenyRequest":
			if (ddlb_UP_Usr_Status_CD.value == "H") { of_selectedInDDLB ("ddlb_UP_Usr_Status_CD", "A"); }
			h_EMailMsg.value = "The requested changes to your Alumni Archive profile have been denied.  Please contact your authorizing agent if there are any questions.";
	    break;
		case "ApprvRequest":
			if (ddlb_UP_Usr_Status_CD.value == "H") { of_selectedInDDLB ("ddlb_UP_Usr_Status_CD", "A"); }
			h_EMailMsg.value = "The requested changes to your Alumni Archive profile have been approved by your authorizing agent.";
		break;
		case "Submit":
			if (ddlb_UP_Usr_Status_CD.value == "A" && "<cfoutput>#spr_getUP_Usr.usr_is_act#</cfoutput>" != "A")
			{
				h_EMailMsg.value = "Your authorizing agent has activated your Alumni Archive account.";
			}
		break;
	}
	
	if (vValidationPassed == "YES") { of_CallFile("UpdUserProfileByAuthAgent"); }
	//
}}

//
//--------------------------------------------------------------------------------------------------------------------


</script>