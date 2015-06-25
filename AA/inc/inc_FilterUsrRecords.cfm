<!--- inc_FilterUsrRecords.cfm --->
<!--- 
Country || Select Country name --> click button Filter
Post || Select Country --> Select Post within the selected country --> click button Filter
Office Code || Just show in ddlb a list of offices --> click button Filter
Role || in ddlb show a list of roles -->  click button Filter
All users
 --->
<script>
//
//---------------------------------------------------------------------------------------------------------------
orgBfrDistinctCNTRY = new Array();
orgBfrDistinctOFFICE = new Array();
orgBfrDistinctROLE = new Array();
//
fltrBfrPost = new Array();
//
//---------------------------------------------------------------------------------------------------------------

function f_buildFilter(argFilterCriteria){with(self.document.forms[0])
{//alert(argFilterCriteria)
	switch (argFilterCriteria) //ALL CNTRY OFFICE_CD POST ROLE
	{
		//........................................................................
		case "-1":
			//--------------------------------------------------------------------
			of_selectedInDDLB ("ddlb_FilterCriteria", "-1");
			//--------------------------------------------------------------------
			f_createOutput(argFilterCriteria);
			//--------------------------------------------------------------------
		break;
		//........................................................................
		case "ALL":
			//--------------------------------------------------------------------
			of_selectedInDDLB ("ddlb_FilterCriteria", "ALL");
			//--------------------------------------------------------------------
			f_createOutput(argFilterCriteria);
			//--------------------------------------------------------------------
		break;
		//........................................................................
		case "CNTRY":
			//--------------------------------------------------------------------
			of_selectedInDDLB ("ddlb_FilterCriteria", "CNTRY");
			//--------------------------------------------------------------------
			f_buildCntryDistinctList();
			//--------------------------------------------------------------------
			f_createOutput(argFilterCriteria);
			//--------------------------------------------------------------------
			of_populateSelect( "ddlb_Cntry", "-1", "=== Select Country ===", orgBfrDistinctCNTRY.length, "orgBfrDistinctCNTRY", "aUSR_CNTRY_CNTRY_CD", "aUSR_CNTRY_CNTRY_NM", "2D" );
			//--------------------------------------------------------------------	
		break;
		//........................................................................
		case "OFFICE_CD":
			//--------------------------------------------------------------------
			of_selectedInDDLB ("ddlb_FilterCriteria", "OFFICE_CD");
			//--------------------------------------------------------------------
			f_buildOfficeDistinctList();
			//--------------------------------------------------------------------
			f_createOutput(argFilterCriteria);
			//--------------------------------------------------------------------
			of_populateSelect( "ddlb_Office", "-1", "=== Select Office Abbrv. ===", orgBfrDistinctOFFICE.length, "orgBfrDistinctOFFICE", "aUSR_CNTRY_OFC_ABBR", "aUSR_CNTRY_OFC_ABBR", "2D" );
			//--------------------------------------------------------------------
		break;
		//........................................................................
		case "ROLE":
			//--------------------------------------------------------------------
			of_selectedInDDLB ("ddlb_FilterCriteria", "ROLE");
			//--------------------------------------------------------------------
			f_buildRoleDistinctList();
			//--------------------------------------------------------------------
			f_createOutput(argFilterCriteria);
			//--------------------------------------------------------------------
			of_populateSelect( "ddlb_Role", "-1", "=== Select Role ===", orgBfrDistinctROLE.length, "orgBfrDistinctROLE", "aUSR_ROLE_CD", "aUSR_ROLE_NM", "2D" );
			//--------------------------------------------------------------------
		break;
		//........................................................................
		//........................................................................
		case "POST":
			//--------------------------------------------------------------------
			of_selectedInDDLB ("ddlb_FilterCriteria", "POST");
			//--------------------------------------------------------------------
			f_buildCntryDistinctList();
			//--------------------------------------------------------------------
			f_createOutput(argFilterCriteria);
			//--------------------------------------------------------------------
			of_populateSelect( "ddlb_Cntry", "-1", "=== Select Country ===", orgBfrDistinctCNTRY.length, "orgBfrDistinctCNTRY", "aUSR_CNTRY_CNTRY_CD", "aUSR_CNTRY_CNTRY_NM", "2D" );
			//--------------------------------------------------------------------	
			of_populateSelect( "ddlb_Post", "-1", "=== First Select Country ===", 0, "", "", "", "2D" );
			//--------------------------------------------------------------------	
		break;
	}
}}

//
//-------------------------------------------------------------------------------------------------------------------

function f_arraySort_O_ASC(a,b)
{
	a = a.aUSR_CNTRY_OFC_ABBR;
	b = b.aUSR_CNTRY_OFC_ABBR;
	//alert(a+"   "+b)
	//return ( (a < b) ? 1 : ((a > b) ? -1 : 0) );//DESC order
	return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );//ASC order
}
//
//---------------------------------------------------------------------------------

function f_arraySort_L_ASC(a,b)
{
	a = a.aUSR_CNTRY_CNTRY_NM;
	b = b.aUSR_CNTRY_CNTRY_NM;
	//alert(a+"   "+b)
	//return ( (a < b) ? 1 : ((a > b) ? -1 : 0) );//DESC order
	return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );//ASC order
}
//
//---------------------------------------------------------------------------------

function f_arraySort_Post_ASC(a,b)
{
	a = a.aUSR_CNTRY_CITY_POST_NM;
	b = b.aUSR_CNTRY_CITY_POST_NM;
	//alert(a+"   "+b)
	//return ( (a < b) ? 1 : ((a > b) ? -1 : 0) );//DESC order
	return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );//ASC order 
}
//
//--------------------------------------------------------------------------------

function f_arraySort_R_ASC(a,b)
{
	a = a.aUSR_ROLE_NM;
	b = b.aUSR_ROLE_NM;
	//alert(a+"   "+b)
	//return ( (a < b) ? 1 : ((a > b) ? -1 : 0) );//DESC order
	return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );//ASC order 
}
//
//--------------------------------------------------------------------------------

function f_buildOfficeDistinctList(){with(self.document.forms[0])
{
	if (orgBfrDistinctOFFICE.length == 0)
	{
		var o = 0;
		//
		orgBfrL.sort(f_arraySort_O_ASC);
		//
		function arrayOFFICE( aUSR_CNTRY_OFC_ABBR, aUSR_CNTRY_OFC_ABBR )
		{
			this.aUSR_CNTRY_OFC_ABBR = aUSR_CNTRY_OFC_ABBR;
			this.aUSR_CNTRY_OFC_ABBR = aUSR_CNTRY_OFC_ABBR;
		}
		//
		orgBfrDistinctOFFICE[o] = new arrayOFFICE( orgBfrL[0].aUSR_CNTRY_OFC_ABBR, orgBfrL[0].aUSR_CNTRY_OFC_ABBR );
		//
		for (var l=1; l<rowsL; l++)
		{
			//
			if ( orgBfrL[l].aUSR_CNTRY_OFC_ABBR != "no_val" && orgBfrDistinctOFFICE[o].aUSR_CNTRY_OFC_ABBR != orgBfrL[l].aUSR_CNTRY_OFC_ABBR)
			{
				o++;
				orgBfrDistinctOFFICE[o] = new arrayOFFICE( orgBfrL[l].aUSR_CNTRY_OFC_ABBR, orgBfrL[l].aUSR_CNTRY_OFC_ABBR );
			}
			//
		}//end of loop
		//
		if (orgBfrDistinctOFFICE.length == 1 && orgBfrDistinctOFFICE[o].aUSR_CNTRY_OFC_ABBR == "no_val" )
		{
			orgBfrDistinctOFFICE[o] = new arrayOFFICE( "no_val", "Office is not available" );
		}
	}//end of if statement
}}

//
//-------------------------------------------------------------------------------------------------------------------

function f_buildRoleDistinctList(){with(self.document.forms[0])
{
	if( orgBfrDistinctROLE == 0 )
	{
		var r = 0;
		//
		orgBfrL.sort(f_arraySort_R_ASC);
		//
		function arrayROLE( aUSR_ROLE_CD, aUSR_ROLE_NM )
		{
			this.aUSR_ROLE_CD = aUSR_ROLE_CD;
			this.aUSR_ROLE_NM = aUSR_ROLE_NM;
		}
		//
		orgBfrDistinctROLE[r] = new arrayROLE( orgBfrL[0].aUSR_ROLE_CD, orgBfrL[0].aUSR_ROLE_NM );
		//
		for (var l=1; l<rowsL; l++)
		{
			if ( orgBfrDistinctROLE[r].aUSR_ROLE_CD != orgBfrL[l].aUSR_ROLE_CD )
			{
				r++;
				orgBfrDistinctROLE[r] = new arrayROLE( orgBfrL[l].aUSR_ROLE_CD, 
													   orgBfrL[l].aUSR_ROLE_NM
													 )
			}
		}
	}
}}
//
//---------------------------------------------------------------------------------
function f_buildCntryDistinctList(){with(self.document.forms[0])
{
	if (orgBfrDistinctCNTRY.length == 0)
	{
		var c = 0;
		//
		orgBfrL.sort(f_arraySort_L_ASC);
		//
		function arrayCNTRY( aUSR_CNTRY_CNTRY_CD, aUSR_CNTRY_CNTRY_NM )
		{
			this.aUSR_CNTRY_CNTRY_CD = aUSR_CNTRY_CNTRY_CD;
			this.aUSR_CNTRY_CNTRY_NM = aUSR_CNTRY_CNTRY_NM;
		}
		//
		//orgBfrDistinctCNTRY = new Array();
		//
		orgBfrDistinctCNTRY[c] = new arrayCNTRY( orgBfrL[0].aUSR_CNTRY_CNTRY_CD, orgBfrL[0].aUSR_CNTRY_CNTRY_NM );
		//
		for (var l=1; l<rowsL; l++)
		{
			if ( orgBfrDistinctCNTRY[c].aUSR_CNTRY_CNTRY_NM != orgBfrL[l].aUSR_CNTRY_CNTRY_NM && orgBfrL[l].aUSR_CNTRY_IS_PRMRY == "Y")
			{
				c++;
				orgBfrDistinctCNTRY[c] = new arrayCNTRY( orgBfrL[l].aUSR_CNTRY_CNTRY_CD, 
														 orgBfrL[l].aUSR_CNTRY_CNTRY_NM
													   )
			}
		}
	}	
}}
//
//-------------------------------------------------------------------------------------------------------------------

function f_buildBfrForPost(){with(self.document.forms[0])
{
	var vCntryCD = ddlb_Cntry.options[ddlb_Cntry.options.selectedIndex].value;
	fltrBfrPostTemp = new Array();
	fltrBfrPost = new Array();
	var pt=0;
	var p=0;
	//
	function arrayPOST( aUSR_CNTRY_CITY_POST_NM )
	{
		this.aUSR_CNTRY_CITY_POST_NM = aUSR_CNTRY_CITY_POST_NM;
	}
	//
	for (var l=0; l<rowsL; l++)
	{
		if ( orgBfrL[l].aUSR_CNTRY_CNTRY_CD == vCntryCD )
		{
				fltrBfrPostTemp[pt] = new arrayPOST( orgBfrL[l].aUSR_CNTRY_CITY_POST_NM );
				pt++;
		}
	}
	//
	if (fltrBfrPostTemp.length != 0)
	{
		fltrBfrPostTemp.sort(f_arraySort_Post_ASC);
		//
		fltrBfrPost[p] = new arrayPOST(fltrBfrPostTemp[0].aUSR_CNTRY_CITY_POST_NM);
		//
		if (fltrBfrPostTemp.length > 1) 
		{
				for (var pt=1; pt<fltrBfrPostTemp.length; pt++)
				{
						if (fltrBfrPostTemp[pt].aUSR_CNTRY_CITY_POST_NM != fltrBfrPost[p].aUSR_CNTRY_CITY_POST_NM)
						{
							p++;
							fltrBfrPost[p] = new arrayPOST(fltrBfrPostTemp[pt].aUSR_CNTRY_CITY_POST_NM);
						}
				}
		}
	}
}}
//
//-------------------------------------------------------------------------------------------------------------------

function f_createOutput(argFilterCriteria){with(self.document.forms[0])
{
	var vOut1 = "&nbsp;";
	var vOut2 = "&nbsp;";
	var vOut3 = "&nbsp;";
	//
	switch (argFilterCriteria)
	{
		//
		case "-1":
			vOut1 = "&nbsp;";
			vOut2 = "&nbsp;";
			vOut3 = "&nbsp;";
		break;
		//
		case "ALL":
			vOut1 = "<input type=\"button\" name=\"cb_Filter\" value=\"Filter\" class=\"c_formbuttons\" onClick=\"JavaScript: f_Validate();\">";
			vOut2 = "&nbsp;";
			vOut3 = "&nbsp;";
		break;
		//
		case "CNTRY":
			vOut1 = "<select name=\"ddlb_Cntry\" class=\"forminputs\"></select>";
			vOut2 = "<input type=\"button\" name=\"cb_Filter\" value=\"Filter\" class=\"c_formbuttons\" onClick=\"JavaScript: f_Validate();\">";
			vOut3 = "&nbsp;";
		break;
		//
		case "POST":
			vOut1 = "<select name=\"ddlb_Cntry\" onChange=\"f_OnChangeCountryForPost();\" class=\"forminputs\"></select>";
			vOut2 = "<select name=\"ddlb_Post\" class=\"forminputs\"></select>";
			vOut3 = "<input type=\"button\" name=\"cb_Filter\" value=\"Filter\" class=\"c_formbuttons\" onClick=\"JavaScript: f_Validate();\">";
		break;
		//
		case "OFFICE_CD":
			vOut1 = "<select name=\"ddlb_Office\" class=\"forminputs\"></select>";
			vOut2 = "<input type=\"button\" name=\"cb_Filter\" value=\"Filter\" class=\"c_formbuttons\" onClick=\"JavaScript: f_Validate();\">";
			vOut3 = "&nbsp;";
		break;
		//
		case "ROLE":
			vOut1 = "<select name=\"ddlb_Role\" class=\"forminputs\"></select>";
			vOut2 = "<input type=\"button\" name=\"cb_Filter\" value=\"Filter\" class=\"c_formbuttons\" onClick=\"JavaScript: f_Validate();\">";
			vOut3 = "&nbsp;";
		break;
	}
	//
	of_innerHTML("id_fltr1",  "'"+vOut1+"'");
	of_innerHTML("id_fltr2",  "'"+vOut2+"'");
	of_innerHTML("id_fltr3",  "'"+vOut3+"'");
}}
//
//----------------------------------------------------------------------------------------------------------------

function f_OnChangeCountryForPost(){with(self.document.forms[0])
{//alert(ddlb_Cntry.options[ddlb_Cntry.options.selectedIndex].value)
	var vCntryCD = ddlb_Cntry.options[ddlb_Cntry.options.selectedIndex].value;
	if ( vCntryCD != -1)
	{
		//
		f_buildBfrForPost();
		//
		fltrBfrPost.sort(f_arraySort_Post_ASC);
		//
		of_populateSelect( "ddlb_Post", "-1", "=== Select Post ===", fltrBfrPost.length, "fltrBfrPost", "aUSR_CNTRY_CITY_POST_NM", "aUSR_CNTRY_CITY_POST_NM", "2D" );
		//
	}
	else
	{
		of_populateSelect( "ddlb_Post", "-1", "=== First Select Country ===", 0, "", "", "", "2D" );
	}

}}
//
//----------------------------------------------------------------------------------------------------------------

function f_Validate(){with(self.document.forms[0])
{
	
	var vValidationPassed = "YES";
	var vFilterCriteria = ddlb_FilterCriteria.options[ddlb_FilterCriteria.options.selectedIndex].value;
	//alert(vFilterCriteria)
	switch (vFilterCriteria)
	{
		//
		case "-1":
			f_prepBfrListUsrOutput(vFilterCriteria);
		break;
		//
		case "ALL":
			f_prepBfrListUsrOutput(vFilterCriteria);
		break;
		//
		case "CNTRY":
			if (ddlb_Cntry.options[ddlb_Cntry.options.selectedIndex].value == "-1"){ vValidationPassed = "NO" }
			else {f_prepBfrListUsrOutput(vFilterCriteria);}
		break;
		//
		case "OFFICE_CD":
			if (ddlb_Office.options[ddlb_Office.options.selectedIndex].value == "-1"){ vValidationPassed = "NO" }
			else {f_prepBfrListUsrOutput(vFilterCriteria);}
		break;
		//
		case "POST":
			if ( ddlb_Cntry.options[ddlb_Cntry.options.selectedIndex].value == "-1" ||  ddlb_Post.options[ddlb_Post.options.selectedIndex].value == "-1" ) { vValidationPassed = "NO" }
			else {f_prepBfrListUsrOutput(vFilterCriteria);}
		break;
		//
		case "ROLE":
			if ( ddlb_Role.options[ddlb_Role.options.selectedIndex].value == "-1") { vValidationPassed = "NO" }
			else {f_prepBfrListUsrOutput(vFilterCriteria);}
		break;
		//
	}
	//
	if ( vValidationPassed == "NO" )
	{
		alert("Sorry, your request cannot be processed, please make appropriate selections.");
	}
	else
	{
		//alert("Submit");
		f_buildListUsrOutput();
	}
}}
//
//------------------------------------------------------------------------------------------------------------------

//
//------------------------------------------------------------------------------------------------------------------

</script>
<cfset client.ControllerDB = "getFilterCriteria">
<cfinclude template="../_ControllerDB.cfm">


<table width="100%"  border="0" cellspacing="2" cellpadding="2">
  <tr><td colspan="4" class="c_fieldValue">Please be patient, filtering may take 30-35 seconds to run.</td></tr>
  <tr>
		<td width="15%">
			<select name="ddlb_FilterCriteria"  class="forminputs" onChange="f_buildFilter(this.value);">
				<option value="-1">=== Filter by ===</option>
				<cfloop query="spr_getFilterCriteria" startrow="1" endrow="#spr_getFilterCriteria.recordCount#">
				<cfoutput>
				<option value="#item_cd#">#item_desc#</option>
				</cfoutput>
				</cfloop>
			</select>
		
		</td>
		<td align="left" id="id_fltr1" width="25%">&nbsp;</td>
		<td align="left" id="id_fltr2" width="25%">&nbsp;</td>
		<td align="left" id="id_fltr3">&nbsp;</td>
  </tr>
</table>
