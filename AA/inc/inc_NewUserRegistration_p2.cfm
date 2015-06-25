<!--- inc_NewUserRegistration_p2.cfm --->
<script language="javascript" type="text/javascript">
function f_onChangeAARole(argValue){with(self.document.forms[0])
{
	switch (argValue)
	{
		case "-1"://Default
			//
			of_innerHTML("id_NoteForRole", "'&nbsp;'");
			//
			of_innerHTML("id_AddnlCntryMsg", "'&nbsp;'");
			//
			//Departure Date: HIDDEN
			of_innerHTML("id_FieldNmDate", "'&nbsp;'");
			txt_h_NUR_Depart_Dt.value = "";
			of_Style("id_FieldNmDate", "visibility", "hidden");
			of_Style("id_DateMandat", "visibility", "hidden");
			of_Style("id_CntrlDate", "visibility", "hidden");
			//
			//
			//Country of Assignment: HIDDEN	//id_FieldNmCntryAss id_CntryOfAssMandat id_CntrlCntryAss
			of_populateSelect( "ddlb_NUR_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CountryOfAssignmt_CD", "-1"); 
			of_Style("id_FieldNmCntryAss", "visibility", "hidden");
			of_Style("id_CntryOfAssMandat", "visibility", "hidden"); 
			of_Style("id_CntrlCntryAss", "visibility", "hidden");
			//
			//City of Assignment: HIDDEN	//id_FieldNmPostCityAss id_PostCityOfAssMandat id_CntrlPostCityAss
			of_populateSelect( "ddlb_NUR_Usr_CityPostOfAssignmt_NM", "-1", "=== No Posts/Cities ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CityPostOfAssignmt_NM", "-1");
			of_Style("id_FieldNmPostCityAss", "visibility", "hidden");
			of_Style("id_PostCityOfAssMandat", "visibility", "hidden"); 
			of_Style("id_CntrlPostCityAss", "visibility", "hidden");
			//
			//New City of Assignment: HIDDEN	//id_FieldNameNewPostCity id_CntrlNewPostCity
			txt_h_NUR_NewPostCity.value = "";
			of_Style("id_FieldNameNewPostCity", "visibility", "hidden");
			of_Style("id_CntrlNewPostCity", "visibility", "hidden");
			//
			//Additional Countries
			//of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsConCurr, "orgBfrConCurr", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlbm_NUR_Usr_AddnlCountry", "-1");
			of_Style("id_FieldNmAddCntry", "visibility", "hidden");
			of_Style("id_CntrlAddCntry", "visibility", "hidden");
			//
			//Selected Countries:
			of_Style("id_FieldNmSelctdCntry", "visibility", "hidden");
			of_Style("id_ListSelctdCntry", "visibility", "hidden");
			//
			//Office Code
			of_populateSelect( "ddlb_NUR_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_DOS_OfficeCode_CD", "-1");
			of_Style("id_FieldNmOfficeCode", "visibility", "hidden");
			of_Style("id_DOS_OfficeCode_CD_Mandat", "visibility", "hidden");
			of_Style("id_CntrlOfficeCode", "visibility", "hidden");
		break;
		//....................................................................................................
		//....................................................................................................
		case "242"://PAO or American PD officer at non-presence post
			//
			if ("<cfoutput>#client.NUR_Usr_ID#</cfoutput>" == 0)
			{
				of_innerHTML("id_NoteForRole", "'You may select only one Post on your initial registration. If more than one Post applies to you, note this in the comments area of the next page and the Administrator will contact you.'");
			}
			else if ("<cfoutput>#client.NUR_Usr_ID#</cfoutput>" > 0)
			{
				of_innerHTML("id_NoteForRole", "'If Posts listed are not part of your assignment, please note this in the comments area of the next page and the Administrator will contact you.'");
			}
			//
			of_innerHTML("id_AddnlCntryMsg", "'&nbsp;'");
			//DATE
			of_innerHTML("id_FieldNmDate", "'Estimated Date of Final Departure From Post'");
			txt_h_NUR_Depart_Dt.value = "<cfoutput>#client.NUR_Usr_Depart_Dt#</cfoutput>";
			of_Style("id_FieldNmDate", "visibility", "visible");
			of_Style("id_DateMandat", "visibility", "visible");
			of_Style("id_CntrlDate", "visibility", "visible");
			//
			//Country of Assignment:
			of_populateSelect( "ddlb_NUR_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CountryOfAssignmt_CD", "<cfoutput>#client.NUR_Usr_CountryOfAssignmt_CD#</cfoutput>");
			of_Style("id_FieldNmCntryAss", "visibility", "visible");
			of_Style("id_CntryOfAssMandat", "visibility", "visible");
			of_Style("id_CntrlCntryAss", "visibility", "visible");
			//
			//City of Assignment:
			of_populateSelect( "ddlb_NUR_Usr_CityPostOfAssignmt_NM", "-1", "=== No Posts/Cities ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CityPostOfAssignmt_NM", "<cfoutput>#client.NUR_Usr_CityPostOfAssignmt_NM#</cfoutput>");
			of_Style("id_FieldNmPostCityAss", "visibility", "visible");
			of_Style("id_PostCityOfAssMandat", "visibility", "visible"); 
			of_Style("id_CntrlPostCityAss", "visibility", "visible");
			//
			//New City of Assignment:
			txt_h_NUR_NewPostCity.value = "";
			of_Style("id_FieldNameNewPostCity", "visibility", "visible");
			of_Style("id_CntrlNewPostCity", "visibility", "visible");
			//
			//Additional Countries
			//of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsConCurr, "orgBfrConCurr", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlbm_NUR_Usr_AddnlCountry", "-1");
			of_Style("id_FieldNmAddCntry", "visibility", "hidden");
			of_Style("id_CntrlAddCntry", "visibility", "hidden");
			//
			//Selected Countries:
			of_Style("id_FieldNmSelctdCntry", "visibility", "hidden");
			of_Style("id_ListSelctdCntry", "visibility", "hidden");
			//
			//Office Code
			of_populateSelect( "ddlb_NUR_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_DOS_OfficeCode_CD", "-1");
			of_Style("id_FieldNmOfficeCode", "visibility", "hidden");
			of_Style("id_DOS_OfficeCode_CD_Mandat", "visibility", "hidden");
			of_Style("id_CntrlOfficeCode", "visibility", "hidden");
		break;
		//....................................................................................................
		case "306"://State Dept. Domestic Office Director
			//
			if ("<cfoutput>#client.NUR_Usr_ID#</cfoutput>" == 0)
			{
				of_innerHTML("id_NoteForRole", "'You may select only one Office on your initial registration. If more than one Office applies to you, note this in the comments area of the next page and the Administrator will contact you.'");
			}
			else if ("<cfoutput>#client.NUR_Usr_ID#</cfoutput>" > 0)
			{
				of_innerHTML("id_NoteForRole", "'If Office listed is not correct or not part of your assignment, please note this in the comments area of the next page and the Administrator will contact you.'");
			}
			//
			of_innerHTML("id_AddnlCntryMsg", "'&nbsp;'");
			//
			//Depart DATE:
			of_innerHTML("id_FieldNmDate", "'Estimated Date of Final Departure From Position:'");
			txt_h_NUR_Depart_Dt.value = "";
			of_Style("id_FieldNmDate", "visibility", "visible");
			of_Style("id_DateMandat", "visibility", "visible");
			of_Style("id_CntrlDate", "visibility", "visible");
			//
			//Country of Assignment:
			of_populateSelect( "ddlb_NUR_Usr_CountryOfAssignmt_CD", "US", "United States of America", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CountryOfAssignmt_CD", "US"); 
			of_Style("id_FieldNmCntryAss", "visibility", "visible");
			of_Style("id_CntryOfAssMandat", "visibility", "visible");
			of_Style("id_CntrlCntryAss", "visibility", "visible");
			//
			//City of Assignment: 
			of_Style("id_FieldNmPostCityAss", "visibility", "visible");
			of_Style("id_PostCityOfAssMandat", "visibility", "visible"); 
			of_Style("id_CntrlPostCityAss", "visibility", "visible");
			f_OnChangeCountry();
			//
			//New City of Assignment: HIDDEN
			txt_h_NUR_NewPostCity.value = "";
			of_Style("id_FieldNameNewPostCity", "visibility", "visible");
			of_Style("id_CntrlNewPostCity", "visibility", "visible");
			//
			//Additional Countries
			//of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsConCurr, "orgBfrConCurr", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );of_selectedInDDLB ("ddlbm_NUR_Usr_AddnlCountry", "-1");
			of_Style("id_FieldNmAddCntry", "visibility", "hidden");
			of_Style("id_CntrlAddCntry", "visibility", "hidden");
			//
			//Selected Countries:
			of_Style("id_FieldNmSelctdCntry", "visibility", "hidden");
			of_Style("id_ListSelctdCntry", "visibility", "hidden");
			//
			//Office Code
			of_populateSelect( "ddlb_NUR_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_DOS_OfficeCode_CD", "<cfoutput>#client.NUR_DOS_OfficeCode_CD#</cfoutput>");
			of_Style("id_FieldNmOfficeCode", "visibility", "visible");
			of_Style("id_DOS_OfficeCode_CD_Mandat", "visibility", "visible");
			of_Style("id_CntrlOfficeCode", "visibility", "visible");
			//
		break;
		//....................................................................................................
		case "241": //DOS Foreign Service Employee stationed abroad
		case "300": //DOS Civil Service Employee stationed abroad
		case "301": //DOS Contract Employee Employee stationed abroad
			//
			of_innerHTML("id_NoteForRole", "'&nbsp;'");
			//
			of_innerHTML("id_AddnlCntryMsg", "'&nbsp;'");
			//Departure Date: 
			of_innerHTML("id_FieldNmDate", "'&nbsp;'");
			txt_h_NUR_Depart_Dt.value = "";
			of_Style("id_FieldNmDate", "visibility", "hidden");
			of_Style("id_DateMandat", "visibility", "hidden");
			of_Style("id_CntrlDate", "visibility", "hidden");
			//
			//Country of Assignment:
			of_populateSelect( "ddlb_NUR_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country(ies) ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CountryOfAssignmt_CD", "<cfoutput>#client.NUR_Usr_CountryOfAssignmt_CD#</cfoutput>"); 
			of_Style("id_FieldNmCntryAss", "visibility", "visible");
			of_Style("id_CntryOfAssMandat", "visibility", "visible");
			of_Style("id_CntrlCntryAss", "visibility", "visible");
			//
			//City of Assignment: 
			of_Style("id_FieldNmPostCityAss", "visibility", "visible");
			of_Style("id_PostCityOfAssMandat", "visibility", "visible"); 
			of_Style("id_CntrlPostCityAss", "visibility", "visible");
			f_OnChangeCountry();
			//
			//New City of Assignment:
			txt_h_NUR_NewPostCity.value = "";
			of_Style("id_FieldNameNewPostCity", "visibility", "visible");
			of_Style("id_CntrlNewPostCity", "visibility", "visible");
			//
			//Additional Countries
			//of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsConCurr, "orgBfrConCurr", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );of_selectedInDDLB ("ddlbm_NUR_Usr_AddnlCountry", "-1");
			of_Style("id_FieldNmAddCntry", "visibility", "hidden");
			of_Style("id_CntrlAddCntry", "visibility", "hidden");
			//
			//Selected Countries:
			of_Style("id_FieldNmSelctdCntry", "visibility", "hidden");
			of_Style("id_ListSelctdCntry", "visibility", "hidden");
			//
			//Office Code
			of_populateSelect( "ddlb_NUR_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_DOS_OfficeCode_CD", "-1");
			of_Style("id_FieldNmOfficeCode", "visibility", "hidden");
			of_Style("id_DOS_OfficeCode_CD_Mandat", "visibility", "hidden");
			of_Style("id_CntrlOfficeCode", "visibility", "hidden");
		break;
		//.................................................................................................
		
		
		case "302": //DOS Foreign Service Employee stationed in US
		case "307": //DOS Civil Service Employee stationed in US
		case "303": //DOS Contract Employee Employee stationed in US
			//
			of_innerHTML("id_NoteForRole", "'&nbsp;'");
			//
			of_innerHTML("id_AddnlCntryMsg", "'&nbsp;'");
			//Departure Date: 
			of_innerHTML("id_FieldNmDate", "'&nbsp;'");
			txt_h_NUR_Depart_Dt.value = "";
			of_Style("id_FieldNmDate", "visibility", "hidden");
			of_Style("id_DateMandat", "visibility", "hidden");
			of_Style("id_CntrlDate", "visibility", "hidden");
			//
			//Country of Assignment:
			of_populateSelect( "ddlb_NUR_Usr_CountryOfAssignmt_CD", "US", "United States of America", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CountryOfAssignmt_CD", "US"); 
			of_Style("id_FieldNmCntryAss", "visibility", "visible");
			of_Style("id_CntryOfAssMandat", "visibility", "visible");
			of_Style("id_CntrlCntryAss", "visibility", "visible");
			//
			//City of Assignment: 
			of_Style("id_FieldNmPostCityAss", "visibility", "visible");
			of_Style("id_PostCityOfAssMandat", "visibility", "visible"); 
			of_Style("id_CntrlPostCityAss", "visibility", "visible");
			f_OnChangeCountry();
			//
			//New City of Assignment:
			txt_h_NUR_NewPostCity.value = "";
			of_Style("id_FieldNameNewPostCity", "visibility", "visible");
			of_Style("id_CntrlNewPostCity", "visibility", "visible");
			//
			//Additional Countries
			//of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsConCurr, "orgBfrConCurr", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );of_selectedInDDLB ("ddlbm_NUR_Usr_AddnlCountry", "-1");
			of_Style("id_FieldNmAddCntry", "visibility", "hidden");
			of_Style("id_CntrlAddCntry", "visibility", "hidden");
			//
			//Selected Countries:
			of_Style("id_FieldNmSelctdCntry", "visibility", "hidden");
			of_Style("id_ListSelctdCntry", "visibility", "hidden");
			//
			//Office Code
			of_populateSelect( "ddlb_NUR_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_DOS_OfficeCode_CD", "<cfoutput>#client.NUR_DOS_OfficeCode_CD#</cfoutput>");
			of_Style("id_FieldNmOfficeCode", "visibility", "visible");
			of_Style("id_DOS_OfficeCode_CD_Mandat", "visibility", "visible");
			of_Style("id_CntrlOfficeCode", "visibility", "visible");
		break;
		//........................................................................................................................
		case "245"://LES/FSN - Locally Engaged Staff/Foreign Service National
			//
			of_innerHTML("id_NoteForRole", "'&nbsp;'");
			//
			of_innerHTML("id_AddnlCntryMsg", "'Some users who are normally restricted to access just their country`s data, may need access to other country`s data due to the position at their post, or needs of their regional office.  These users may request access to other country`s data, but must be approved by their PAO or Office Director.'");
						
			//Departure Date: 
			txt_h_NUR_Depart_Dt.value = "";
			of_Style("id_FieldNmDate", "visibility", "hidden");
			of_Style("id_CntrlDate", "visibility", "hidden");
			//
			//Country of Assignment:
			of_populateSelect( "ddlb_NUR_Usr_CountryOfAssignmt_CD", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CountryOfAssignmt_CD", "<cfoutput>#client.NUR_Usr_CountryOfAssignmt_CD#</cfoutput>");
			of_Style("id_FieldNmCntryAss", "visibility", "visible");
			of_Style("id_CntryOfAssMandat", "visibility", "visible");
			of_Style("id_CntrlCntryAss", "visibility", "visible");
			//
			//City of Assignment:
			of_populateSelect( "ddlb_NUR_Usr_CityPostOfAssignmt_NM", "-1", "=== No Posts/Cities ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CityPostOfAssignmt_NM", "-1");
			of_Style("id_FieldNmPostCityAss", "visibility", "visible");
			of_Style("id_CntrlPostCityAss", "visibility", "visible");
			of_Style("id_PostCityOfAssMandat", "visibility", "visible");
			//
			//New City of Assignment: 
			txt_h_NUR_NewPostCity.value = "";
			of_Style("id_FieldNameNewPostCity", "visibility", "visible");
			of_Style("id_CntrlNewPostCity", "visibility", "visible");
			//
			//Additional Countries
			of_Style("id_FieldNmAddCntry", "visibility", "visible");
			//of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsConCurr, "orgBfrConCurr", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Country(ies) ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );of_selectedInDDLB ("ddlbm_NUR_Usr_AddnlCountry", "-1");
			of_Style("id_CntrlAddCntry", "visibility", "visible");
			//
			//Selected Countries:
			//of_Style("id_FieldNmSelctdCntry", "visibility", "hidden");
			//of_Style("id_ListSelctdCntry", "visibility", "visible");
			f_showSelection();
			//
			//Office Code
			of_populateSelect( "ddlb_NUR_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
			of_selectedInDDLB ("ddlbm_NUR_Usr_AddnlCountry", "-1");
			of_Style("id_FieldNmOfficeCode", "visibility", "hidden");
			of_Style("id_DOS_OfficeCode_CD_Mandat", "visibility", "hidden");
			of_Style("id_CntrlOfficeCode", "visibility", "hidden");
			
		break;
		//....................................................................................................
		/*
		case "304"://ECA/P Office Director
			//Departure Date: HIDDEN
			of_Style("id_FieldNmDate", "visibility", "hidden");
			txt_h_NUR_Depart_Dt.value = "";
			of_Style("id_CntrlDate", "visibility", "hidden");
			//
			//Country of Assignment:
			of_Style("id_FieldNmCntryAss", "visibility", "visible");
			of_populateSelect( "ddlb_NUR_Usr_CountryOfAssignmt_CD", "US", "United States of America", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CountryOfAssignmt_CD", "US"); 
			of_Style("id_CntrlCntryAss", "visibility", "visible");
			//
			//City of Assignment: 
			of_Style("id_FieldNmPostCityAss", "visibility", "visible");
			of_Style("id_CntrlPostCityAss", "visibility", "visible");
			f_OnChangeCountry();
			//
			//New City of Assignment: 
			of_Style("id_FieldNameNewPostCity", "visibility", "visible");
			txt_h_NUR_NewPostCity.value = "";
			of_Style("id_CntrlNewPostCity", "visibility", "visible");
			//
			//
			//Additional Countries
			of_Style("id_FieldNmAddCntry", "visibility", "hidden");
			of_populateSelect( "ddlbm_NUR_Usr_AddnlCountry", "-1", "=== Select Countries ===", rowsAC, "orgBfrAC", "aacntry_cntry_cd", "aacntry_cntry_nm", "2D" );
			of_selectedInDDLB ("ddlbm_NUR_Usr_AddnlCountry", "-1");
			of_Style("id_CntrlAddCntry", "visibility", "hidden");
			//
			//Selected Countries:
			of_Style("id_FieldNmSelctdCntry", "visibility", "hidden");
			//f_showSelection();
			of_Style("id_ListSelctdCntry", "visibility", "hidden");
			//
			//Office Code
			of_Style("id_FieldNmOfficeCode", "visibility", "visible");
			of_populateSelect( "ddlb_NUR_Usr_DOS_OfficeCode_CD", "ECA/P/V", "ECA/P/V", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlbm_NUR_Usr_AddnlCountry", "ECA/P/V");
			of_Style("id_CntrlOfficeCode", "visibility", "visible");
			
		break;
		
		//....................................................................................................
		
		*/
		//....................................................................................................
	}
}}
//
//-----------------------------------------------------------------------------------------------------------
function f_OnChangeCountry(){with(self.document.forms[0])
{
	var vCountryID = ddlb_NUR_Usr_CountryOfAssignmt_CD.value;
	//
	txt_h_NUR_NewPostCity.value = "";
	//
	switch (vCountryID)
	{
		case "-1":
			of_populateSelect( "ddlb_NUR_Usr_CityPostOfAssignmt_NM", "-1", "=== No Posts/Cities ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_NUR_Usr_CityPostOfAssignmt_NM", "-1");
		break;
		//.....................................................................................................
		//case "US":
			
		//break;
		//.....................................................................................................
		default :
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
			of_populateSelect( "ddlb_NUR_Usr_CityPostOfAssignmt_NM", "-1", "=== Select City ===", filterBfrCP.length, "filterBfrCP", "acity_city_nm", "acity_city_nm", "2D" );
			if (vCountryID == "US")
			{
				of_selectedInDDLB ("ddlb_NUR_Usr_CityPostOfAssignmt_NM", "Washington"); 
			}
			else
			{
				of_selectedInDDLB ("ddlb_NUR_Usr_CityPostOfAssignmt_NM", "<cfoutput>#client.NUR_Usr_CityPostOfAssignmt_NM#</cfoutput>"); 
			}
				
	}
	//
	//f_show_DOS_OfficeCode();
	//
	
}}
//
//------------------------------------------------------------------------------------------------------
function f_showSelection(){with(self.document.forms[0])
{
	//of_Style("id_FieldNmSelctdCntry", "visibility", "visible");
	//of_Style("id_ListSelctdCntry", "visibility", "visible");
	//
	var vSelectedID = "";
	var vSelectedTxt = "";
	var vCountSelected = 0;
	var vCtrlName = "ddlbm_NUR_Usr_AddnlCountry";
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
	//alert(vSelectedTxt)
	//
	var vOutputTxt = "";
	var vOutputTitle = "";
	if (vSelectedID != -1)
	{
		vOutputTitle ="Selected Countries";
		vOutputTxt += vSelectedTxt;
		h_showSelection.value = vOutputTxt;
	}
	else
	{
		vOutputTitle =  "&nbsp;";
		vOutputTxt = "&nbsp;";
		h_showSelection.value = "";
	}
	//
	
	of_Style("id_FieldNmSelctdCntry", "visibility", "visible");
	of_Style("id_ListSelctdCntry", "visibility", "visible");
	//
	//of_innerHTML("id_FieldNmSelctdCntry", "'"+vOutputTitle+"'");
	of_innerHTML("id_ListSelctdCntry", "'"+vOutputTxt+"'");
	//
	
	
	
}}//end of function
//
//--------------------------------------------------------------------------------------------------------
function f_filterForECA()
{
	fBufferDO = new Array();
	var f=0;
	for (var d=0; d<rowsDO; d++)
	{
		if (orgBufferDO[d].ausr_cntry_ofc_abbr.substr(0,3) == "ECA")
		{
			fBufferDO[f] = new arrayDO(orgBufferDO[d].ausr_cntry_ofc_abbr)
			f++;
		}
	}
	//
}

//
//--------------------------------------------------------------------------------------------------------
// JavaScript Document
function f_IsNumber(argValue, argCtrlName){with(self.document.forms[0]){
	var vLastVal = "";
	if (argValue.length > 0)
	{
		if (argValue.length == 1){ vLastVal = argValue; }
		else { vLastVal = argValue.substr((parseInt(argValue.length)-1),1); }
	}
	//alert(vLastVal) Sorry, numbers, hyphens, and parenthesis are allowed in this field?
	if ( isNaN(vLastVal) )
	{
		switch (argCtrlName)
		{
			case "txt_NUR_Usr_Ext":
				if (argValue.length == 1){ eval(argCtrlName+".value = ''"); alert("Sorry, value in this field should consist of numbers only.");}
				else
				{
					vLastVal = argValue.substr(0, parseInt(argValue.length)-1);
					eval(argCtrlName+".value = "+vLastVal);
					alert("Sorry, value in this field should consist of numbers only.");
				}
			break;
			//
			case "txt_NUR_Usr_Phone":
			
				if (vLastVal != '-' && vLastVal != '(' && vLastVal != ')')
				{
					if (argValue.length == 1)
					{ 
						eval(argCtrlName+".value = ''"); 
						alert("Sorry, value in this field could consist of numbers, '(', ')', or '-' only.");
					}
					else
					{
						vLastVal = argValue.substr(0, parseInt(argValue.length)-1);
						//alert(vLastVal)
						txt_NUR_Usr_Phone.value = vLastVal;
						alert("Sorry, value in this field could consist of numbers, '(', ')', or '-' only.");
					}
				}
			break;
		}// enfd of switch
	}
}}
//
//------------------------------------------------------------------------------------------------------------
function f_DeSelectPostCity(argValue){with(self.document.forms[0])
{
	if (argValue != "")
	{
		of_selectedInDDLB ("ddlb_NUR_Usr_CityPostOfAssignmt_NM", "-1"); 
	}
}}
//
</script>
<div class="feature">
<br>
<cfoutput>

<input type="hidden" name="h_NUR_Usr_CountryOfAssignmt_NM">
<input type="hidden" name="h_showSelection"  value="#client.NUR_Usr_AddnlCountries_NM#">
<input type="hidden" name="h_NUR_Usr_ID" value="#client.NUR_Usr_ID#">

<table  width="100%" align="center" border="0" cellpadding="1" cellspacing="1"><!--- --->
	<tr>
		<td valign="bottom" align="left"   class="c_fieldName">
			<font color="##FF0000" size="+2">*</font> - required field
		</td>
	</tr>
	<!--- NAME --->
	<tr >
		<td>
			<table border="0" width="100%" bgcolor="##EFEFEF">
				<tr>
					<td class="c_fieldName" align="right" width="25%">Prefix:</td>
					<td width="1%">&nbsp;&nbsp;</td>
					<td><select name="ddlb_NUR_Usr_Prfx" class="forminputs"></select></td>
				</tr>
				<tr>
					<td class="c_fieldName" align="right">First Name:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_FName" value="#client.NUR_Usr_FName#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
				<tr>
					<td class="c_fieldName" align="right">Middle Initial:</td>
					<td width="1%">&nbsp;&nbsp;</td>
					<td>
					<input class="forminputs" type="text" name="txt_NUR_Usr_MI" value="#client.NUR_Usr_MI#" size="3"
						   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
				<tr>
					<td class="c_fieldName" align="right">Last Name:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
					<input class="forminputs" type="text" name="txt_NUR_Usr_LName" value="#client.NUR_Usr_LName#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!--- PHONE and E-MAIL --->
	<tr>
		<td>
			<table border="0" width="100%" bgcolor="##EFEFEF">
				<tr>
					<td class="c_fieldName" align="right" width="25%">Phone:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs"  size="30" type="text" name="txt_NUR_Usr_Phone" value="#client.NUR_Usr_Phone#" 
						       onKeyUp="f_IsNumber(this.value, this.name);"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="c_fieldName">Ext:</span>
						&nbsp;&nbsp;
						<input class="forminputs" type="text" name="txt_NUR_Usr_Ext" value="#client.NUR_Usr_Ext#" size="5"  
							   onKeyUp="f_IsNumber(this.value, this.name);"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					
					
					</td>
				</tr>
				<tr>
					<td class="c_fieldName" align="right" width="25%">E-Mail:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_Email" value="#client.NUR_Usr_Email#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
			
			
		</td>
	</tr>
	<!--- LOGIN INFORMATION --->
	<tr>
		<td>
			<table border="0" width="100%" bgcolor="##EFEFEF">
				<tr>
					<!--- ... --->
					<td width="25%" class="c_fieldName" align="right">Login Name:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_UserName" value="#client.NUR_Usr_UserName#"  size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
				<tr>
					<td width="25%" class="c_fieldName" align="right">Password: (min 8 characters)</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<input class="forminputs" type="password" name="txt_NUR_Usr_Pass" value="#client.NUR_Usr_Pass#"  size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
							   &nbsp;&nbsp;
							  <cfset local.ctrl_help_ID = "2">
					   		  <cfinclude template="../Ctrl_Help.cfm">
					</td>
				</tr>
				<tr>
					<td width="25%" class="c_fieldName" align="right">Confirm Password:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<!--- #client.NUR_Usr_Confrm_Pass# --->
						<input class="forminputs" type="password" name="txt_NUR_Usr_Confrm_Pass" value="#client.NUR_Usr_Confrm_Pass#"  size="30"
						onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</cfoutput>
	<!--- SECURITY QUESTION --->
	<tr>
		<td>
			<table border="0" width="100%" bgcolor="#EFEFEF">
				<tr>
					<td width="25%" class="c_fieldName" align="right">Security Question:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<select name="ddlb_NUR_SecQ" class="forminputs" >
							<option value="-1">=== Select Security Question ===</option>
							<cfoutput query="spr_getSecretQuestions">
							<option value="#item_cd#">#item_desc#</option>
							</cfoutput>
						</select>
						<!--- <cfoutput> --->
						<input type="hidden" name="h_Item_Desc" value=""><!--- #spr_getSecretQuestions.item_desc# --->
						<!--- </cfoutput> --->
					</td>
				</tr>
				<tr>
					<td width="15%" class="c_fieldName" align="right">Security Answer:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<cfoutput>
						<input class="forminputs" type="text" name="txt_NUR_Answer" value="#client.NUR_Usr_Answer#"  size="30"
				   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					   </cfoutput>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<cfoutput>
	
	<!--- ROLES --->
	<tr>
		<td>
			<table border="0" width="100%" bgcolor="##EFEFEF">
				<!--- |||| --->
				<tr>
					<!--- ... --->
					<td width="25%" class="c_fieldName" align="right">Role:</td>
					<td width="1%" align="center"><font color="##FF0000" size="+2">*</font></td>
					<td>
						<select name="ddlb_NUR_Usr_AlumniArchiveRole_ID" class="forminputs" onChange="f_onChangeAARole(this.value);"></select>
						&nbsp;&nbsp;
					   <cfset local.ctrl_help_ID = "3">
					   <cfinclude template="../Ctrl_Help.cfm">
					   
					</td>
					<!--- ... --->
				</tr>
				<!--- |||| --->
				<tr>
					<td width="25%">&nbsp;</td>
					<td id="id_NoteForRole"  class="c_fieldName"  colspan="2">&nbsp;</td>
				</tr>
				<!--- |||| --->
				<tr>
					<!--- ... --->
					<td width="25%" class="c_fieldName" align="right" valign="top">
						<span id="id_FieldNmOfficeCode">DoS Office Code:</span>
					</td>
					
					<td width="1%" align="center">
						<span id="id_DOS_OfficeCode_CD_Mandat"><font color="##FF0000" size="+2">*</font></span>
					</td>
					
					<td>
						<span id="id_CntrlOfficeCode"><select name="ddlb_NUR_Usr_DOS_OfficeCode_CD" class="forminputs"></select></span>
					</td>
					<!--- ... --->
				</tr>
				
				
				
				<tr>
					<!--- Departure DATE --->
					<td width="25%" class="c_fieldName" align="right"id="id_FieldNmDate">&nbsp;</td>
					<td width="1%" align="center" id="id_DateMandat"><font color="##FF0000" size="+2">*</font></td>
					<td id="id_CntrlDate">
						<input class="forminputs" 
							   type="text" 
							   name="txt_h_NUR_Depart_Dt" 
							   value="#client.NUR_Usr_Depart_Dt#"
							   maxlength="10"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
							   >
							   <span class="c_fieldName">(Format: mm/dd/yyyy)</span>
							   <cfset local.ctrl_help_ID = "6">
					   		   <cfinclude template="../Ctrl_Help.cfm">
					</td>
					<!--- ... --->
				</tr>
			</table>
		</td>
	</tr>
	<!--- COUNTRY OF ASSIGNMENT ---> 
	<tr>
		<td>
			<table border="0" width="100%" bgcolor="##EFEFEF">
				<tr>
					<td width="25%" class="c_fieldName" align="right"id="id_FieldNmCntryAss">Country Of Assignment:</td>
					<td width="1%" align="center" id="id_CntryOfAssMandat"><font color="##FF0000" size="+2">*</font></td>
					<td id="id_CntrlCntryAss">
						<select name="ddlb_NUR_Usr_CountryOfAssignmt_CD" class="forminputs" onChange="f_OnChangeCountry();"></select>
						
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span id="id_FieldNmPostCityAss"  class="c_fieldName" >Post/City Of Assignment:</span>
						&nbsp;&nbsp;
						<span id="id_PostCityOfAssMandat"><font color="##FF0000" size="+2">*</font></span>
						<span id="id_CntrlPostCityAss">
							<select name="ddlb_NUR_Usr_CityPostOfAssignmt_NM" class="forminputs"></select>
							<cfset local.ctrl_help_ID = "4">
					   		<cfinclude template="../Ctrl_Help.cfm">
						</span>
					</td>
				</tr>
				<tr>
					
					<td width="25%" class="c_fieldName" align="right"id="id_FieldNameNewPostCity">If your Post/City is not Listed, Add It:</td>
					<td width="1%">&nbsp;&nbsp;</td>
					<td id="id_CntrlNewPostCity">
						<input class="forminputs" 
							   type="text" 
							   name="txt_h_NUR_NewPostCity" 
							   value="#client.NUR_Usr_NewCityPostOfAssignmt#" 
							   onBlur="f_DeSelectPostCity(this.value);" 
							   size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					
							<cfset local.ctrl_help_ID = "5">
					   		<cfinclude template="../Ctrl_Help.cfm">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!--- .................... --->
	<!--- ADDITIONAL COUNTRIES / DOS OFFICE CODE --->
	<tr>
		<td>
			<table width="100%"  border="0" bgcolor="##EFEFEF">
				<td width="25%" >&nbsp;</td>
				<td width="25%" valign="top" class="c_fieldName" colspan="4" id="id_AddnlCntryMsg">&nbsp;</td>
				<tr>
					<td width="25%" valign="top" class="c_fieldName" align="right"id="id_FieldNmAddCntry">Additional Countries:</td>
					<td width="1%">&nbsp;&nbsp;</td>
					<td width="20%" id="id_CntrlAddCntry" class="c_fieldValue">
						<select name="ddlbm_NUR_Usr_AddnlCountry" 
								class="forminputs" 
								multiple 
								size=5 
								onChange="JavaScript: f_showSelection();">
								</select>
						<cfset local.ctrl_help_ID = "7">
					    <cfinclude template="../Ctrl_Help.cfm">
					</td>
					<td width="10%" align="right" id="id_FieldNmSelctdCntry" valign="top"  class="c_fieldName">Selected Countries:</td>
					<td id="id_ListSelctdCntry" valign="top">&nbsp;</td>
				</tr>
			</table>

		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<!--- BUTTON --->
	<tr>
		<td>
			<table width="100%" border="0"  bgcolor="##EFEFEF">
				<tr>
					<td valign="bottom"   class="c_fieldName">
						<font color="##FF0000" size="+2">*</font> - required field
					</td>
					<td align="center">
						<input type="button" value="Continue" class="c_formbuttons" onClick="JavaScript: f_Validate();">
						<!--- 
						&nbsp;&nbsp;&nbsp;
						<input type="button" value="f_validPass" class="c_formbuttons" onClick="JavaScript: f_validPass();">
						 --->
						<!--- <input type="button" value="Show All Cntrls" class="c_formbuttons" onClick="JavaScript: f_ShowAllCntrls();"> --->
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
</cfoutput>
</div> 
<script language="javascript" type="text/javascript">
function f_validPass(){with(self.document.forms[0])
{
	var vPass = txt_NUR_Usr_Pass.value;
	var expPass = /[^0-9a-zA-Z]/;
	var vTrueFalse = expPass.test(vPass)
	if (vTrueFalse == true)	{ alert("Yes Char")}
	if (vTrueFalse == false)	{ alert("NO Char")}
	
	
}}



//PREFIX
of_populateSelect( "ddlb_NUR_Usr_Prfx", "-1", "Select", rowsPrfx, "orgBfrPrfx", "aitem_cd", "aitem_cd", "2D" );
of_selectedInDDLB ("ddlb_NUR_Usr_Prfx", "<cfoutput>#client.NUR_Usr_Prfx#</cfoutput>");
//ALUMNI ARCHIVE ROLES
of_populateSelect( "ddlb_NUR_Usr_AlumniArchiveRole_ID", "-1", "=== Select Role ===", fltrBfrAR.length, "fltrBfrAR", "aapp_role_id", "aapp_role_nm", "2D" );
of_selectedInDDLB ("ddlb_NUR_Usr_AlumniArchiveRole_ID", "<cfoutput>#client.NUR_Usr_RoleCD#</cfoutput>"); 
//
//<!--- of_selectedInDDLB ("ddlb_NUR_SecQ", "<cfoutput>#client.NUR_Usr_SecQ#</cfoutput>"); --->
//
self.document.forms[0].txt_h_NUR_Depart_Dt.value = "<cfoutput>#client.NUR_Usr_Depart_Dt#</cfoutput>";
//
f_onChangeAARole("<cfoutput>#client.NUR_Usr_RoleCD#</cfoutput>");
//
f_OnChangeCountry()//<!--- "<cfoutput>#client.NUR_Usr_CountryOfAssignmt_CD#</cfoutput>" --->

//
//--------------------------------------------------------------------------------------------------------------------
function f_Validate(){with(self.document.forms[0])
{
	vValidationPassed = "YES";
	//       
	if (vValidationPassed == "YES" && txt_NUR_Usr_FName.value == "")
	{ vValidationPassed = "NO"; alert("Sorry, your request cannot be completed.\n'First Name' must be provided."); txt_NUR_Usr_FName.focus(); }
	//
	if (vValidationPassed == "YES" && txt_NUR_Usr_LName.value == "")
	{ vValidationPassed = "NO"; alert("Sorry, your request cannot be completed.\n'Last Name' must be provided."); txt_NUR_Usr_LName.focus(); }
	//
	if (vValidationPassed == "YES" && txt_NUR_Usr_Phone.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Phone' must be provided."); txt_NUR_Usr_Phone.focus(); }
	//
	if (vValidationPassed == "YES" && txt_NUR_Usr_Email.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'E-Mail' must be provided."); txt_NUR_Usr_Email.focus(); }
	//
	if (vValidationPassed == "YES" && txt_NUR_Usr_UserName.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'User Name' must be provided."); txt_NUR_Usr_UserName.focus(); }
	//
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//---
	if (vValidationPassed == "YES" && txt_NUR_Usr_Pass.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Password' must be provided."); txt_NUR_Usr_Pass.focus(); }
	//
	if (vValidationPassed == "YES" && txt_NUR_Usr_Pass.value != "" && txt_NUR_Usr_Pass.value.length < 8)
	{
		vValidationPassed = "NO"; alert("Sorry, your request cannot be completed.\n'Password' must be at least 8 characters long."); txt_NUR_Usr_Pass.focus(); 
	}
	//
	if (vValidationPassed == "YES" && txt_NUR_Usr_Pass.value != "" && txt_NUR_Usr_Pass.value.length >= 8)
	{
		// 1. Check Lower case letters (a b c d )
		var vLowLetter = 1;
		var vPass = txt_NUR_Usr_Pass.value;
		var expPass = /[a-z]/;
		var vTrueFalse = expPass.test(vPass)
		if (vTrueFalse == false) { var vLowLetter = 0; }
	
		// 2. Check Upper case letters (A B C D )
		var vCapLetter = 1;
		var vPass = txt_NUR_Usr_Pass.value;
		var expPass = /[A-Z]/;
		var vTrueFalse = expPass.test(vPass)
		if (vTrueFalse == false) { var vCapLetter = 0; }
		
		// 3. Check Numerals (1 2 3 4 )
		var vNumerals = 1;
		var vPass = txt_NUR_Usr_Pass.value;
		var expPass = /[0-9]/;
		var vTrueFalse = expPass.test(vPass)
		if (vTrueFalse == false) { vNumerals = 0; }
		
		// 4. Check Non-alphanumeric characters (! @ # ^ ...)
		var vNonAlphaNum = 1;
		var vPass = txt_NUR_Usr_Pass.value;
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
			txt_NUR_Usr_Pass.focus(); 
		}
	
	}
	
	//
	if (vValidationPassed == "YES" && txt_NUR_Usr_Confrm_Pass.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Password' must be confirmed."); txt_NUR_Usr_Confrm_Pass.focus(); }
	//
	if ( vValidationPassed == "YES" && ( txt_NUR_Usr_Pass.value != txt_NUR_Usr_Confrm_Pass.value) )
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\nValues in 'Password' and 'Confirm Password' are not the same."); txt_NUR_Usr_Confrm_Pass.focus(); }
	//
	if (vValidationPassed == "YES" && ddlb_NUR_SecQ.value == "-1")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\nPlease select 'Security Question' and provide an answer."); txt_NUR_Answer.focus(); } 
	//
	if (vValidationPassed == "YES" && ddlb_NUR_SecQ.value != "-1" && txt_NUR_Answer.value == "")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\nPlease provide an answer on your 'Security Question'."); txt_NUR_Answer.focus(); }
	//
	if (vValidationPassed == "YES" && ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "-1")
	{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Role' must be selected."); ddlb_NUR_Usr_AlumniArchiveRole_ID.focus(); }
	//
	//................................................................................................
	if (
			(vValidationPassed == "YES" && ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "241")
			||
			(vValidationPassed == "YES" && ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "300")
			||
			(vValidationPassed == "YES" && ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "301")
			||
			(vValidationPassed == "YES" && ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "245")
		)
		
	{
		if (ddlb_NUR_Usr_CountryOfAssignmt_CD.value == "-1") {vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Country Of Assignment' must be selected."); ddlb_NUR_Usr_CountryOfAssignmt_CD.focus();}
		//
		if (ddlb_NUR_Usr_CityPostOfAssignmt_NM.value == "-1") {vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Post/City Of Assignment' must be selected."); ddlb_NUR_Usr_CityPostOfAssignmt_NM.focus();}
	}
	//................................................................................................
	if (vValidationPassed == "YES" && (ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "242" ||  ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "306"))
	{
		if (ddlb_NUR_Usr_CountryOfAssignmt_CD.value == "-1") {vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Country Of Assignment' must be selected."); ddlb_NUR_Usr_CountryOfAssignmt_CD.focus();}
		//
		if (txt_h_NUR_Depart_Dt.value == "" && vValidationPassed == "YES"){ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' must be provided."); txt_h_NUR_Depart_Dt.focus();  }
		//
		
		//====================================================================================================================
		//Date Validation == Date Validation == Date Validation == Date Validation == Date Validation == Date Validation == 
		if (txt_h_NUR_Depart_Dt.value != "" && txt_h_NUR_Depart_Dt.value.length != 10)
		{
			vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' is not in requested format."); txt_h_NUR_Depart_Dt.focus();
		}
		//
		if (txt_h_NUR_Depart_Dt.value != "" && txt_h_NUR_Depart_Dt.value.length == 10)
		{
			var vVal = txt_h_NUR_Depart_Dt.value;
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
			var vDate = parseInt(v3+v4, 10);
			var vYear = parseInt(v6+v7+v8+v9, 10);
			//
			if ( isNaN(v0) || isNaN(v1) || isNaN(v3) || isNaN(v4) || isNaN(v6) || isNaN(v7) || isNaN(v8) || isNaN(v9) )
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' is not in requested format."); txt_h_NUR_Depart_Dt.focus(); }
			//
			if ( v2 != "/" || v5 != "/")
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Estimated Date of Final Departure from Post' is not in requested format."); txt_h_NUR_Depart_Dt.focus(); }
			//
			if ( vMonth >= 13 || vMonth < 1 )
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'Month' value is not valid."); txt_h_NUR_Depart_Dt.focus(); }
			//
			if( 
				( (vMonth == 1 || vMonth == 3 || vMonth == 5 || vMonth == 7 || vMonth == 8 || vMonth == 10 || vMonth == 12 ) && ( vDate < 1 || vDate > 31 ) )
				||
				( (vMonth == 4 || vMonth == 6 || vMonth == 9 || vMonth == 11 ) && ( vDate < 1 || vDate > 30 ) )
				||
				( (vMonth == 2 ) && ( vDate < 1 || vDate > 29 ) )
			
			  )
			{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\nDate value is not valid."); txt_h_NUR_Depart_Dt.focus(); }
		}
		//Date Validation == Date Validation == Date Validation == Date Validation == Date Validation == Date Validation == 
		//====================================================================================================================
	}
	//................................................................................................
	if (	
			(vValidationPassed == "YES" && ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "306")
			||
			(vValidationPassed == "YES" && ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "302")
			||
			(vValidationPassed == "YES" && ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "303")
			||
			(vValidationPassed == "YES" && ddlb_NUR_Usr_AlumniArchiveRole_ID.value == "307")
			
	
		)
	{
		if (ddlb_NUR_Usr_DOS_OfficeCode_CD.value == "-1")
		{ vValidationPassed = "NO";  alert("Sorry, your request cannot be completed.\n'DoS Office Code' is required."); ddlb_NUR_Usr_DOS_OfficeCode_CD.focus; }
	}
	//
	//................................................................................................
	if (vValidationPassed == "YES") 
	{ 
		h_NUR_Usr_CountryOfAssignmt_NM.value = ddlb_NUR_Usr_CountryOfAssignmt_CD.options[ddlb_NUR_Usr_CountryOfAssignmt_CD.options.selectedIndex].text;
		h_Item_Desc.value = ddlb_NUR_SecQ.options[ddlb_NUR_SecQ.options.selectedIndex].text;
		of_CallFile("getAuthAgent"); 
	}
}}
</script>