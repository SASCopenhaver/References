<!--- inc_MergeDuplicates_p1.cfm --->
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
			of_innerHTML("id_CntryAss", "'&nbsp;'");
			
			//Post/City of Assignment
			of_populateSelect( "ddlb_UP_Usr_CityPostOfAssignmt_NM", "-1", "=== Select City/Post ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "-1");
			of_innerHTML("id_PostCityAss", "'&nbsp;'"); 
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			of_innerHTML("id_NewPostCityAss", "'&nbsp;'"); 
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			 
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
			of_innerHTML("id_DosOfficeCD", "'&nbsp;'");
			
			//Departure Date
			of_innerHTML("id_DepartDtTitle", "'Estimated Date<br>of Final Departure:'");
			of_innerHTML("id_EstDtReq", "'&nbsp;'");
			of_innerHTML("id_usr_est_depart_dt", "'n/a'");
			txt_UP_Usr_Est_Depart.value = "";
			
		break;
		//
		case "1"://1	Data manager, appointed by ECA
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "US", "United States of America", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", "US");
			of_innerHTML("id_CntryAss", "'United States of America'");
			
			//Post/City of Assignment
			f_OnChangeCountry();
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "Washington"); 
			of_innerHTML("id_PostCityAss", "'Washington'"); 
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			of_innerHTML("id_NewPostCityAss", "'&nbsp;'"); 
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== No Addnl Countries ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "<cfoutput>#spr_getAddlCntries.usr_cntry_ofc_abbr#</cfoutput>");
			of_innerHTML("id_DosOfficeCD", "'<cfoutput>#spr_getAddlCntries.usr_cntry_ofc_abbr#</cfoutput>'");
			
			//Departure Date
			of_innerHTML("id_DepartDtTitle", "'Estimated Date<br>of Final Departure:'");
			of_innerHTML("id_EstDtReq", "'&nbsp;'");
			of_innerHTML("id_usr_est_depart_dt", "'n/a'");
			txt_UP_Usr_Est_Depart.value = "";
		break;
		//
		case "241"://241	DOS Foreign Service stationed abroad
		case "300"://300	DOS Civil Service stationed abroad
		case "301"://301	DOS Contract Employee stationed abroad
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", "<cfoutput>#spr_getAddlCntries.usr_cntry_cntry_cd#</cfoutput>");
			of_innerHTML("id_CntryAss", "'<cfoutput>#spr_getAddlCntries.usr_cntry_cntry_nm#</cfoutput>'");
			
			//Post/City of Assignment
			f_OnChangeCountry();
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "<cfoutput>#spr_getAddlCntries.usr_cntry_city_post_nm#</cfoutput>");
			of_innerHTML("id_PostCityAss", "'<cfoutput>#spr_getAddlCntries.usr_cntry_city_post_nm#</cfoutput>'");
			 
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			of_innerHTML("id_NewPostCityAss", "'&nbsp;'"); 
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== No Addnl Countries ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Role ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
			of_innerHTML("id_DosOfficeCD", "'&nbsp;'");
			
			//Departure Date
			of_innerHTML("id_DepartDtTitle", "'Estimated Date<br>of Final Departure:'");
			of_innerHTML("id_EstDtReq", "'&nbsp;'");
			of_innerHTML("id_usr_est_depart_dt", "'n/a'");
			txt_UP_Usr_Est_Depart.value = "";
		break;
		//
		case "242"://242	PAO or Chief American PD officer abroad
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", "<cfoutput>#spr_getAddlCntries.usr_cntry_cntry_cd#</cfoutput>");
			of_innerHTML("id_CntryAss", "'<cfoutput>#spr_getAddlCntries.usr_cntry_cntry_nm#</cfoutput>'");
						
			//Post/City of Assignment
			f_OnChangeCountry();
			of_selectedInDDLB ("ddlb_UP_Usr_CityPostOfAssignmt_NM", "<cfoutput>#spr_getAddlCntries.usr_cntry_city_post_nm#</cfoutput>");
			of_innerHTML("id_PostCityAss", "'<cfoutput>#spr_getAddlCntries.usr_cntry_city_post_nm#</cfoutput>'"); 
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			of_innerHTML("id_NewPostCityAss", "'&nbsp;'"); 
			
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== No Addnl Countries ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_UP_Usr_AddnlCountry", "-1");
			
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'&nbsp;'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
			of_innerHTML("id_DosOfficeCD", "'&nbsp;'");
			
			//Departure Date
			of_innerHTML("id_DepartDtTitle", "'Estimated Date<br>of Final Departure From Post'");
			of_innerHTML("id_EstDtReq", "'<font color=\"##FF0000\" size=\"+2\">*</font>'");
			if ("<cfoutput>#spr_getSelfData.usr_est_depart_dt#</cfoutput>" == "")
			{
				of_innerHTML("id_usr_est_depart_dt", "'&nbsp;'");
				txt_UP_Usr_Est_Depart.value = "";
			}
			
			
		break;
		//
		case "245"://245	FSN - Foreign Service National
			//id_PostCityAss id_NewPostCityAss
			//Country of Assignment 
			of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			
			for (var uc=0; uc<rowsUC; uc++)
			{ 
				if ( orgBfrUC[uc].ausr_cntry_is_prmry == "Y" )
				{
					of_selectedInDDLB ("ddlb_UP_Usr_CountryOfAssignmt_CD", orgBfrUC[uc].ausr_cntry_cntry_cd);
					of_innerHTML("id_CntryAss", "'"+orgBfrUC[uc].ausr_cntry_cntry_cd+"'");
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
					of_innerHTML("id_PostCityAss", "'"+orgBfrUC[uc].ausr_cntry_city_post_nm+"'"); 
					break;
				}
			}
			
			//New Post/City 
			txt_UP_NewPostCity.value = "";
			of_innerHTML("id_NewPostCityAss", "'&nbsp;'"); 
			
			//Additional Countries
			of_populateSelect( "ddlbm_UP_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			if ("<cfoutput>#local.AddCntryCD#</cfoutput>" != "")
			{
				var vTempPartStr = "<cfoutput>#local.AddCntryCD#</cfoutput>";
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
				of_innerHTML("id_AddCntries", "'"+vOutputTitle+"'");
			}
			
			
			//
			//Additional Countries List
			of_innerHTML("id_ListOfAddnlCntry", "'<cfoutput>#local.AddCntry#</cfoutput>'");
			
			//DOS Office Code
			of_populateSelect( "ddlb_UP_Usr_DOS_OfficeCode_CD", "-1", "=== Select Role ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "-1");
			of_innerHTML("id_DosOfficeCD", "'&nbsp;'");
			
			
			
			
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
			of_innerHTML("id_CntryAss", "'United States of America'");
			
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
			of_selectedInDDLB ("ddlb_UP_Usr_DOS_OfficeCode_CD", "<cfoutput>#spr_getAddlCntries.usr_cntry_ofc_abbr#</cfoutput>");
			of_innerHTML("id_DosOfficeCD", "'<cfoutput>#spr_getAddlCntries.usr_cntry_ofc_abbr#</cfoutput>'");
			
			//Departure Date
			if (argValue == 306)
			{
				of_innerHTML("id_DepartDtTitle", "'Estimated Date of <br>Final Departure<br>From Position:'");
				of_innerHTML("id_EstDtReq", "'<font color=\"##FF0000\" size=\"+2\">*</font>'");
				//of_innerHTML("id_usr_est_depart_dt", "'&nbsp;'");
				//txt_UP_Usr_Est_Depart.value = "";
				if ("<cfoutput>#spr_getSelfData.usr_est_depart_dt#</cfoutput>" == "")
				{
					of_innerHTML("id_usr_est_depart_dt", "'&nbsp;'");
					txt_UP_Usr_Est_Depart.value = "";
				}
			}
			else
			{
				of_innerHTML("id_DepartDtTitle", "'Estimated Date<br>of Final Departure:'");
				of_innerHTML("id_EstDtReq", "'&nbsp;'");
				of_innerHTML("id_usr_est_depart_dt", "'n/a'");
				txt_UP_Usr_Est_Depart.value = "";
			}
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
	of_innerHTML("id_AddCntries", "'"+vOutputTitle+"'");
	of_innerHTML("id_ListOfAddnlCntry", "'"+vOutputTxt+"'");
	//h_showSelection.value = vOutputTxt;
	
}}//end of function
//
//
//--------------------------------------------------------------------------------------------------------------------

function f_Save(){with(self.document.forms[0])
{
	var vValidationPassed = "YES";
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
	//---------------------------------------------------------------------------------------------------------------------------------------
	//---
	if (vValidationPassed == "YES" && txt_UP_Usr_FName.value == "")
	{ vValidationPassed = "NO"; alert("Sorry, your request cannot be completed.\n'First Name' must be provided."); txt_UP_Usr_FName.focus(); }
	//---
	if (vValidationPassed == "YES" && txt_UP_Usr_LName.value == "")
	{ vValidationPassed = "NO"; alert("Sorry, your request cannot be completed.\n'Last Name' must be provided."); txt_UP_Usr_LName.focus(); }
	//---
	if (vValidationPassed == "YES" && txt_UP_Usr_Phone.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Phone' must be provided."); txt_UP_Usr_Phone.focus(); }
	//---
	if (vValidationPassed == "YES" && txt_UP_Usr_Email.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'E-Mail' must be provided."); txt_UP_Usr_Email.focus(); }
	//	
	if (vValidationPassed == "YES" && txt_UP_Usr_Email.value != "")
	{
		var vPosOfAt = txt_UP_Usr_Email.value.indexOf('@');
		if ( txt_UP_Usr_Email.value.substr(vPosOfAt, txt_UP_Usr_Email.value.length) != "@state.gov")
		{ vValidationPassed = "NO";  alert("Sorry, this is not Department of State e-mail account.  Your request cannot be processed."); txt_UP_Usr_Email.focus(); }
	}
	//---
	if (vValidationPassed == "YES" && txt_UP_Usr_UserName.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'User Name' must be provided."); txt_UP_Usr_UserName.focus(); }
	//---
	if (vValidationPassed == "YES" && txt_UP_Usr_Pass.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Password' must be provided."); txt_UP_Usr_Pass.focus(); }
	//
	if (vValidationPassed == "YES" && txt_UP_Usr_Pass.value != "" && txt_UP_Usr_Pass.value.length < 8)
	{
		vValidationPassed = "NO"; alert("Sorry, your request cannot be completed.\n'Password' must be at least 8 characters long."); txt_UP_Usr_Pass.focus(); 
	}
	//
	if (vValidationPassed == "YES" && txt_UP_Usr_Pass.value != "" && txt_UP_Usr_Pass.value.length >= 8)
	{
		// 1. Check Lower case letters (a b c d )
		var vLowLetter = 1;
		var vPass = txt_UP_Usr_Pass.value;
		var expPass = /[a-z]/;
		var vTrueFalse = expPass.test(vPass)
		if (vTrueFalse == false) { var vLowLetter = 0; }
	
		// 2. Check Upper case letters (A B C D )
		var vCapLetter = 1;
		var vPass = txt_UP_Usr_Pass.value;
		var expPass = /[A-Z]/;
		var vTrueFalse = expPass.test(vPass)
		if (vTrueFalse == false) { var vCapLetter = 0; }
		
		// 3. Check Numerals (1 2 3 4 )
		var vNumerals = 1;
		var vPass = txt_UP_Usr_Pass.value;
		var expPass = /[0-9]/;
		var vTrueFalse = expPass.test(vPass)
		if (vTrueFalse == false) { vNumerals = 0; }
		
		// 4. Check Non-alphanumeric characters (! @ # ^ ...)
		var vNonAlphaNum = 1;
		var vPass = txt_UP_Usr_Pass.value;
		var expPass = /[^0-9a-zA-Z]/;
		var vTrueFalse = expPass.test(vPass)
		if (vTrueFalse == false) { vNonAlphaNum =0; }
		
		// Analysis:
		var vTotal = parseInt(vLowLetter) + parseInt(vCapLetter) + parseInt(vNumerals) + parseInt(vNonAlphaNum)
		if ( vTotal < 3 )
		{
			vValidationPassed = "NO"; 
			alert("Sorry, your request cannot be completed.\nThe password must be composed of characters from at least three of the following four groups from the standard keyboard:\n"+
					"(a) Upper case letters (A-Z);\n(b) Lower case letters (a-z);\n(c) Arabic numerals (0 through 9);\n(d) Nonalphanumeric characters (punctuation symbols);"); 
			txt_UP_Usr_Pass.focus(); 
		}
	
	}
	//---
	if (vValidationPassed == "YES" && ddlb_UP_Usr_AlumniArchiveRole_ID.value == "-1")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Role' must be selected."); ddlb_UP_Usr_AlumniArchiveRole_ID.focus(); }
	//---
	//................................................................................................
	if (vValidationPassed == "YES" && (ddlb_UP_Usr_AlumniArchiveRole_ID.value == "242" || ddlb_UP_Usr_AlumniArchiveRole_ID.value == "306") )
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
			var vMonth = parseInt(v0+v1, 10);
			var vDate  = parseInt(v3+v4, 10);
			var vYear  = parseInt(v6+v7+v8+v9, 10);
			//
			if ( isNaN(v0) || isNaN(v1) || isNaN(v3) || isNaN(v4) || isNaN(v6) || isNaN(v7) || isNaN(v8) || isNaN(v9) )
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' is not in requested format."); txt_UP_Usr_Est_Depart.focus(); }
			//
			if ( v2 != "/" || v5 != "/")
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' is not in requested format."); txt_UP_Usr_Est_Depart.focus(); }
			//
			if ( vMonth >= 13 || vMonth < 1 )
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Month' value is not valid."); txt_UP_Usr_Est_Depart.focus(); }
			//
			if( 
				( (vMonth == 1 || vMonth == 3 || vMonth == 5 || vMonth == 7 || vMonth == 8 || vMonth == 10 || vMonth == 12 ) && ( vDate < 1 || vDate > 31 ) )
				||
				( (vMonth == 4 || vMonth == 6 || vMonth == 9 || vMonth == 11 ) && ( vDate < 1 || vDate > 30 ) )
				||
				( (vMonth == 2 ) && ( vDate < 1 || vDate > 29 ) )
			
			  )
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\nDate value is not valid."); txt_UP_Usr_Est_Depart.focus(); }
		}
	}
	
	//
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
	
	//if (vValidationPassed == "YES" && ddlb_UP_Usr_CityPostOfAssignmt_NM.value == "-1")
	//{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Post/City Of Assignment' must be selected."); ddlb_UP_Usr_CityPostOfAssignmt_NM.focus(); }
	//---------------------------------------------------------------------------------------------------------------------------------------
	//
	var vCityPostOfAssignmt = ddlb_UP_Usr_CityPostOfAssignmt_NM.value;
	var vNewCityPostOfAssignmt = txt_UP_NewPostCity.value;
	
	if ( vValidationPassed == "YES" && (vCityPostOfAssignmt == "-1" && vNewCityPostOfAssignmt == "" ) )
	{  vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\nPost/City of Assignment or New Post/City must be provided.");}
		
	//-----------------------------------------------------------------------------------------------------------------------
	// Validation is passed
	if (vValidationPassed == "YES") { of_CallFile("SelfUpdUsrProfile"); }
	//alert(vValidationPassed+"      SelfUpdUsrProfile");
}}

//--------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------------------
function f_show_hideReqChgs(){with(self.document.forms[0])
{//
	//PREFIX
	var vOutPrefix = "";
	if ( ddlb_UP_Usr_Prfx.value !=  "<cfoutput>#spr_getSelfData.usr_pfx#</cfoutput>")
	{
		vOutPrefix = "<br><strong>Prefix:</strong> "+ddlb_UP_Usr_Prfx.value;
	}
	//
	//FIRST NAME
	var vOutFName = "";
	if ( txt_UP_Usr_FName.value !=  "<cfoutput>#spr_getSelfData.usr_fname#</cfoutput>")
	{
		vOutFName = "<br><strong>First Name:</strong> "+txt_UP_Usr_FName.value;
	}
	//	
	//MI
	var vOutMI = "";
	if ( txt_UP_Usr_MI.value !=  "<cfoutput>#spr_getSelfData.usr_mi#</cfoutput>")
	{
		vOutFName = "<br><strong>Middle Initial:</strong> "+txt_UP_Usr_MI.value;
	}
	//
	//LAST NAME
	var vOutLName = "";
	if ( txt_UP_Usr_LName.value !=  "<cfoutput>#spr_getSelfData.usr_lname#</cfoutput>")
	{
		vOutLName = "<br><strong>Last Name:</strong> "+txt_UP_Usr_LName.value;
	}
	//
	//PHONE
	var vOutPhone = "";
	if ( txt_UP_Usr_Phone.value !=  "<cfoutput>#spr_getSelfData.usr_phone#</cfoutput>")
	{
		vOutPhone = "<br><strong>Phone:</strong> "+txt_UP_Usr_Phone.value;
	}
	//
	//EXT
	var vOutExt = "";
	if ( txt_UP_Usr_Ext.value !=  "<cfoutput>#spr_getSelfData.usr_ext#</cfoutput>")
	{
		vOutExt = "<br><strong>Last Name:</strong> "+txt_UP_Usr_Ext.value;
	}
	
	//
	//E_MAIL
	var vOutEMail = "";
	if ( txt_UP_Usr_Email.value !=  "<cfoutput>#spr_getSelfData.usr_email#</cfoutput>")
	{
		vOutEMail = "<br><strong>E-Mail:</strong> "+txt_UP_Usr_Email.value;
	}
	
	//name="" value="#spr_getSelfData.#"
	//LOGIN NAME
	var vOutUserName = "";
	if ( txt_UP_Usr_UserName.value !=  "<cfoutput>#spr_getSelfData.usr_uname#</cfoutput>")
	{
		vOutUserName = "<br><strong>User Name:</strong> "+txt_UP_Usr_UserName.value;
	}
	
	//
	//PASSWORD
	var vOutPass = "";
	if ( txt_UP_Usr_Pass.value !=  "<cfoutput>#spr_getSelfData.usr_pass#</cfoutput>")
	{
		vOutPass = "<br><strong>Password:</strong> "+txt_UP_Usr_Pass.value;
	}
	
	
	//
	// 1. ROLE if selected role is not as saved, than show new role in the area of requested changes
	var vOutRole = "";
	if (ddlb_UP_Usr_AlumniArchiveRole_ID.options[ddlb_UP_Usr_AlumniArchiveRole_ID.options.selectedIndex].text != id_usr_role_nm.innerHTML
	   	&& ddlb_UP_Usr_AlumniArchiveRole_ID.options[ddlb_UP_Usr_AlumniArchiveRole_ID.options.selectedIndex].value != "-1" )
	{
		vOutRole = "<br><strong>Role:</strong> "+ddlb_UP_Usr_AlumniArchiveRole_ID.options[ddlb_UP_Usr_AlumniArchiveRole_ID.options.selectedIndex].text;
	}
	//else { vOutRole = ""; }
	
	// 2. Dept Date
	var vOutDeptDate = "";
	if (txt_UP_Usr_Est_Depart.value != id_usr_est_depart_dt.innerHTML && txt_UP_Usr_Est_Depart.value != "")
	{
		vOutDeptDate = "<br><strong>Departure Date:</strong> "+txt_UP_Usr_Est_Depart.value;
	}
	//else { vOutDeptDate = ""; }
	
	// 3. Country of Assignment
	var vCntryAss = "";
	if (ddlb_UP_Usr_CountryOfAssignmt_CD.options[ddlb_UP_Usr_CountryOfAssignmt_CD.options.selectedIndex].text != id_CntryAss.innerHTML
	    && ddlb_UP_Usr_CountryOfAssignmt_CD.options[ddlb_UP_Usr_CountryOfAssignmt_CD.options.selectedIndex].value != "-1")
	{
		vCntryAss = "<br><strong>Country of Assignment:</strong> "+ddlb_UP_Usr_CountryOfAssignmt_CD.options[ddlb_UP_Usr_CountryOfAssignmt_CD.options.selectedIndex].text;
	}
	//else { vCntryAss = ""; }
	
	// 4. POST/CITY OF ASSIGNMENT
	var vPostCityAss = "";
	if (ddlb_UP_Usr_CityPostOfAssignmt_NM.options[ddlb_UP_Usr_CityPostOfAssignmt_NM.options.selectedIndex].text != id_PostCityAss.innerHTML
	    && ddlb_UP_Usr_CityPostOfAssignmt_NM.options[ddlb_UP_Usr_CityPostOfAssignmt_NM.options.selectedIndex].value != "-1")
	{
		vPostCityAss = "<br><strong>Post/City of Assignment:</strong> "+ddlb_UP_Usr_CityPostOfAssignmt_NM.options[ddlb_UP_Usr_CityPostOfAssignmt_NM.options.selectedIndex].text;
	}
	//else { vPostCityAss = ""; }
	
	// 5. New POST/CITY OF ASSIGNMENT
	var vNewPostCityAss = "";
	if ( txt_UP_NewPostCity.value != "")
	{ vNewPostCityAss = "<br><strong>New Post/City of Assignment:</strong> "+txt_UP_NewPostCity.value; }
	
	// 6. Additional Countries:
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
	var vOutAddCntries = "";
	var vOutputTitle = "";
	if (vSelectedID != -1)
	{
		vOutputTitle ="SELECTED COUNTRIES:";
		vOutAddCntries += vSelectedTxt;
	}
	else
	{
		vOutputTitle =  "";
		vOutAddCntries = "";
	}
	//of_innerHTML("id_ListOfAddnlCntry", "'"+vOutAddCntries+"'");
	// 7. DOS office Code
	var vDosOfficeCD = "";
	if (ddlb_UP_Usr_DOS_OfficeCode_CD.options[ddlb_UP_Usr_DOS_OfficeCode_CD.options.selectedIndex].text != id_DosOfficeCD.innerHTML
	    && ddlb_UP_Usr_DOS_OfficeCode_CD.options[ddlb_UP_Usr_DOS_OfficeCode_CD.options.selectedIndex].value != "-1")
	{
		vDosOfficeCD = "<br><strong>DOS office Code:</strong> "+ddlb_UP_Usr_DOS_OfficeCode_CD.options[ddlb_UP_Usr_DOS_OfficeCode_CD.options.selectedIndex].text;
	}
	//else { vCntryAss = ""; }

	//=================================================
	var vOutTitleReqChgs = ""
	var vOutValReqChgs = "";
	if ( vOutPrefix != "" || vOutFName != "" || vOutMI != "" || vOutLName != "" || vOutPhone != "" || vOutExt != "" || vOutEMail != "" || vOutUserName != "" || vOutPass  != "" || 
		 vOutRole != "" || vOutDeptDate != "" || vCntryAss != "" || vPostCityAss != "" || vNewPostCityAss != "" || vOutAddCntries != "" || vDosOfficeCD != "" )
	{
		vOutTitleReqChgs = "REQUESTED CHANGES:";
		vOutValReqChgs = vOutPrefix +  vOutFName + vOutMI + vOutLName + vOutPhone + vOutExt + vOutEMail + vOutUserName + vOutPass +
						 vOutRole + vOutDeptDate + vCntryAss + vPostCityAss + vNewPostCityAss + vOutAddCntries + vDosOfficeCD;
	}
	//
	of_innerHTML("id_TitleReqChgs", "'"+vOutTitleReqChgs+"'");
	of_innerHTML("id_ValReqChgs", "'"+vOutValReqChgs+"'");
	//h_ValReqChgs.value = vOutTitleReqChgs + vOutValReqChgs;
	h_ValReqChgs.value = vOutValReqChgs;
}}
//-----------------------------------------------------------------------------------------------------------------------
//
function f_IsValNeeded(){with(self.document.forms[0])
{
	var vRoleID = ddlb_UP_Usr_AlumniArchiveRole_ID.value;
	if ( vRoleID != 242 && vRoleID != 306)
	{
		txt_UP_Usr_Est_Depart.value = "";
		ddlb_UP_Usr_AlumniArchiveRole_ID.focus();
		alert("Estimated Departure Date is not needed for selected Role.")
	}
}}
</script>
<cfoutput>
<input type="hidden" name="h_UP_Usr_ID" value="#spr_getSelfData.usr_cd#">
<div class="feature">
<table align="center" width="80%" border=0 cellpadding="1" cellspacing="1">
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td width="20%" class="c_fieldName" colspan="2">
						<font color="##FF0000" size="+2">*</font> - required field
					</td>
					<td align="right">
						<input type="button" name="cb_Close2" value="Cancel" class="c_formbuttons" onClick="JavaScript: of_CallFile(104);">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="cb_Submit2" value="Submit" class="c_formbuttons" onClick="JavaScript: f_Save();">
					</td>
				</tr>
			</table>
		</td>
	</tr>
    <tr><td><hr></td></tr>
	<!--- NAME --->
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td width="20%" class="c_fieldName" colspan="2">PREFIX:</td>
					<td ><select name="ddlb_UP_Usr_Prfx" class="forminputs" onChange="f_show_hideReqChgs();"></select></td>
				</tr>
				<tr>
					<td width="20%" class="c_fieldName">FIRST NAME:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_FName" value="#spr_getSelfData.usr_fname#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
				<tr>
					<td width="20%" class="c_fieldName" colspan="2">MIDDLE INITIAL:</td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_MI" value="#spr_getSelfData.usr_mi#" size="3"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
				<tr>
					<td width="20%" class="c_fieldName">LAST NAME:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_LName" value="#spr_getSelfData.usr_lname#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
	<!--- PHONE and E-MAIL --->
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td width="20%" class="c_fieldName">PHONE:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td colspan="2" width="30%">
       					<input class="forminputs" type="text" name="txt_UP_Usr_Phone" value="#spr_getSelfData.usr_phone#"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					
					<td width="5%" class="c_fieldName">EXT:</td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_Ext" value="#spr_getSelfData.usr_ext#" size="5"  onKeyUp="f_IsNumber(this.value, this.name);"
								onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					
				</tr>
				<tr>
					<td width="20%" class="c_fieldName">E-MAIL:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td colspan="4">
						<input class="forminputs" type="text" name="txt_UP_Usr_Email" value="#spr_getSelfData.usr_email#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		
		</td>
	</tr>
	<!--- LOGIN INFORMATION --->
	 <tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td width="20%" class="c_fieldName">LOGIN NAME:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="text" name="txt_UP_Usr_UserName" value="#spr_getSelfData.usr_uname#"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
				<tr>
					<td width="20%" class="c_fieldName">PASSWORD:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="password" name="txt_UP_Usr_Pass" value="#spr_getSelfData.usr_pass#"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td><hr color="##FF0000"></td></tr>
	<!--- <tr><td><font color="##FF0000">We need text that warns users about status changes</font></td></tr>
	<tr><td><hr color="##FF0000"></td></tr> --->
	<!--- ROLES --->
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td width="20%" class="c_fieldName">ROLE:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td >
						<select name="ddlb_UP_Usr_AlumniArchiveRole_ID" 
								class="forminputs" 
								onChange="f_onChangeAARole(this.value); f_show_hideReqChgs();">
						</select>
					</td>
					<td><div id="id_usr_role_nm" class="c_fieldValue">#spr_getSelfData.usr_role_nm#</div></td>
				</tr>
			</table>
		</td>
	</tr>
	<!--- Estimated Date --->
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
					<tr>
						<cfset local.usr_est_depart_dt = "n/a">
						<cfif #spr_getSelfData.usr_est_depart_dt# NEQ "">
							<cfset local.usr_est_depart_dt = DateFormat(spr_getSelfData.usr_est_depart_dt,'mm/dd/yyyy')>
						</cfif>
						<cfif local.usr_est_depart_dt EQ "n/a">
							<cfset local.usr_est_depart_dt2 = "">
						<cfelse>
							<cfset local.usr_est_depart_dt2 = local.usr_est_depart_dt>
						</cfif>
												
						<td width="20%" class="c_fieldName" id="id_DepartDtTitle">Estimated Date<br>of Final Departure:</td>
						<td width="1%" align="center" id="id_EstDtReq"><font color="##FF0000" size="+2">*</font></td>
						<td width="40%" id="id_DepartDtCntrl"  colspan="2">
							<input	class="forminputs" type="text" 
									onFocus="f_IsValNeeded();"
									name="txt_UP_Usr_Est_Depart" 
									value="#local.usr_est_depart_dt2#"
									size="12" 
									onBlur="f_show_hideReqChgs();"
									onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
						<td><div id="id_usr_est_depart_dt" class="c_fieldValue">#local.usr_est_depart_dt#</div></td>
						<td class="c_fieldName">(Format mm/dd/yyyy):</td>
					</tr>
				</table>
		</td>	
	</tr>
<!--- ==================================================================================================================================== --->
	<!--- COUNTRY OF ASSIGNMENT --->	
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td width="20%" class="c_fieldName">COUNTRY OF ASSIGNMENT:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td width="40%">
						<select name="ddlb_UP_Usr_CountryOfAssignmt_CD" class="forminputs"  
									onChange="f_OnChangeCountry(); f_show_hideReqChgs()"></select>
					</td>
					<td align="left"><div class="c_fieldValue" id="id_CntryAss">&nbsp;</div></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<!--- POST/CITY OF ASSIGNMENT --->
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td width="20%" class="c_fieldName">POST/CITY OF ASSIGNMENT:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td width="30%">
						<select name="ddlb_UP_Usr_CityPostOfAssignmt_NM"  class="forminputs" onChange="f_show_hideReqChgs();"></select>
					</td>
					<td><div class="c_fieldValue" id="id_PostCityAss">&nbsp;</div></td>
				</tr>
			</table>
		</td>
	</tr>
	
	<!--- NEW POST/CITY ---> 
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td width="20%" class="c_fieldName">NEW POST/CITY:</td>
					<td width="1%">&nbsp;</td>
					<td>
						<input class="forminputs"  type="text" 
								name="txt_UP_NewPostCity" value=""   size="30"
								id="id_UP_NewPostCity"  
								onBlur="f_show_hideReqChgs();" 
								onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
								
					
					</td>
					<td><div class="c_fieldValue" id="id_NewPostCityAss">&nbsp;</div></td>
				</tr>
			</table>
		</td>
	</tr>
<!--- ==================================================================================================================================== --->
	<!--- ADDITIONAL COUNTRIES  --->
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td width="20%" valign="top"><div class="c_fieldName">ADDITIONAL COUNTRIES:</div></td>
					<td width="1%">&nbsp;</td>
					<td id="id_AddnlCntry">
						<select name="ddlbm_UP_Usr_AddnlCountry" 
								class="forminputs" 
								multiple size=5 
								onChange="f_show_hideReqChgs();" ></select><!--- f_showSelection() --->
					</td>
					<td id="id_AddCntries">&nbsp;</td>
					
					<td id="id_ListOfAddnlCntry" valign="top" class="c_fieldValue">&nbsp;</td>
				</tr>
			</table>

		</td>
	</tr>
<!--- ==================================================================================================================================== --->
	<!--- DOS OFFICE CODE --->
	<tr>
		<td>
			<table width="100%" border=0 bgcolor="##EFEFEF">
				<tr>
					<td width="20%"><div class="c_fieldName">DoS OFFICE CODE:</div></td>
					<td width="1%">&nbsp;</td>
					<td width="40%" id="id_DosOffice" class="c_fieldValue">
						<select name="ddlb_UP_Usr_DOS_OfficeCode_CD" onChange="f_show_hideReqChgs();" class="forminputs" ></select>
					</td>
					<td ><div class="c_fieldValue" id="id_DosOfficeCD">&nbsp;</div></td>
				</tr>
			</table>

		</td>
	</tr>
<!--- ==================================================================================================================================== --->

	<!--- AUTHORIZED AGENT --->
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="20%" valign="top">AUTHORIZED AGENT:</td>
					<td width="1%">&nbsp;</td>
					<td class="c_fieldValue" valign="middle">
						#spr_getSelfData.usr_auth_agent_full_nm#
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="mailto:#spr_getSelfData.usr_auth_agent_email#">#spr_getSelfData.usr_auth_agent_email#</a>
						<input type="hidden" name="h_usr_auth_agent_email" value="#spr_getSelfData.usr_auth_agent_email#"> 
					</td>
				</tr>
			</table>

		</td>
	</tr>
	
	
	<!--- COMMENTS --->
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="20%" valign="top">COMMENTS:</td>
					<td width="1%">&nbsp;</td>
					<cfset local.vUsr_comnt_comnt_txt = "">
					<cfif #spr_getSelfData.usr_comnt_comnt_txt# NEQ "">
						<cfset local.vUsr_comnt_comnt_txt = spr_getSelfData.usr_comnt_comnt_txt>
					</cfif>
					<td id="" class="c_fieldValue">
						<textarea name="txta_Comnts" rows="5" cols="30">#local.vUsr_comnt_comnt_txt#</textarea>
					</td>
				</tr>
			</table>

		</td>
	</tr>
	<tr><td><hr color="##666666"></td></tr>
	<!--- SELECTED CHANGES --->
	
	<tr>
		<td>
			<table width="100%" border=0  bgcolor="##EFEFEF">
				<cfset local.usr_comnt_reqchg_txt = "&nbsp;">
				<cfset local.usr_comnt_reqchg_title = "&nbsp;">
				<cfif #spr_getSelfData.usr_comnt_reqchg_txt# NEQ "">
					<cfset local.usr_comnt_reqchg_title = "REQUESTED CHANGES:">
					<cfset local.usr_comnt_reqchg_txt = spr_getSelfData.usr_comnt_reqchg_txt>
				</cfif>
				
				<tr class="c_fieldName">
					<td id="id_TitleReqChgs" valign="top">#local.usr_comnt_reqchg_title#</td>
				</tr>
				<tr>
					<td valign="top">
						<div class="c_fieldValue" id="id_ValReqChgs">#local.usr_comnt_reqchg_txt#</div>
						<input type="hidden" name="h_ValReqChgs" value="#local.usr_comnt_reqchg_txt#">
					</td>
				</tr>
			</table>

		</td>
	</tr>
	
	
	
	<!--- ==================================================================================================================================== --->
	<tr><td><hr></td></tr>
	<!--- BUTTONS --->
	<tr>
      <td >
		<!--- --------------------------------------------------- --->
		<table width="100%" border=0  bgcolor="##EFEFEF">
			<tr align="right">
				<td valign="top">
					<input type="button" name="cb_Close" value="Cancel" class="c_formbuttons" onClick="JavaScript: of_CallFile(104);">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" name="cb_Submit" value="Submit" class="c_formbuttons" onClick="JavaScript: f_Save();">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		<!--- --------------------------------------------------- --->	
	</td>
  </tr>
	
</table>

</cfoutput>
</div>
<!--- <input type="hidden" name="h_Usr_Role_CD" value=""> --->
<script language="javascript" type="text/javascript">
//PREFIX
of_populateSelect( "ddlb_UP_Usr_Prfx", "-1", "Select Prefix", rowsPrfx, "orgBfrPrfx", "aitem_cd", "aitem_cd", "2D" );
of_selectedInDDLB ("ddlb_UP_Usr_Prfx", "<cfoutput>#spr_getSelfData.usr_pfx#</cfoutput>");
//--------------------------------------------------------------------------------------------------------------------
of_populateSelect( "ddlb_UP_Usr_AlumniArchiveRole_ID", "-1", "=== Select Role ===", rowsAR, "orgBfrAR", "aapp_role_id", "aapp_role_nm", "2D" );
of_selectedInDDLB ("ddlb_UP_Usr_AlumniArchiveRole_ID", "<cfoutput>#spr_getSelfData.usr_role_cd#</cfoutput>"); 
//<!--- self.document.forms[0].h_Usr_Role_CD = "<cfoutput>#spr_getUP_Usr.usr_role_cd#</cfoutput>"; --->
//
//of_populateSelect( "ddlb_UP_Usr_Status_CD", "-1", "=== Select Status ===", rowsUS, "orgBfrUS", "aitem_cd", "aitem_desc", "2D" );
//<!--- of_selectedInDDLB ("ddlb_UP_Usr_Status_CD", "<cfoutput>#spr_getUP_Usr.usr_is_act#</cfoutput>");  --->
//
of_populateSelect( "ddlb_UP_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
//
f_onChangeAARole("<cfoutput>#spr_getSelfData.usr_role_cd#</cfoutput>");
//
//--------------------------------------------------------------------------------------------------------------------
//f_show_hideReqChgs();
//

</script>