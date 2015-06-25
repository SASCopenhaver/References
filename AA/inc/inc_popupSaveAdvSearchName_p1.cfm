<!--- inc_popupSaveSearchName_p1.cfm --->
<!--- Could be 0 for new search or some number if custom search is selected --->
<cfset client.CS_Search_ID = URL.url_CS_SearchID>

<!--- Could be "empty string", if not ,than custom search is selected --->
<cfset client.CS_Search_Nm = URL.url_CS_Search_Nm>

<!--- Could be "empty string" --->
<cfset client.CS_First_Nm = Trim(URL.url_CS_First_Nm)>
		
<!--- Could be "empty string" --->
<cfset client.CS_Last_Nm = Trim(URL.url_CS_Last_Nm)>

<!--- Could be "-1" - Gender is not selected or some value, gender is selected --->
<cfset client.CS_Gender = URL.url_CS_Gender>

<cfset client.CS_From_Cntry = URL.url_CS_From_Cntry>
<cfset local.MinusOne = Left(client.CS_From_Cntry, 2)>
<cfif local.MinusOne EQ "-1" AND #Len(client.CS_From_Cntry)# GT 2>
	<cfset client.CS_From_Cntry = Mid(client.CS_From_Cntry,4,Len(client.CS_From_Cntry))>
</cfif>

<cfset client.CS_To_Cntry = URL.url_CS_To_Cntry>
<cfset local.MinusOne = Left(client.CS_To_Cntry, 2)>
<cfif local.MinusOne EQ "-1" AND #Len(client.CS_To_Cntry)# GT 2>
	<cfset client.CS_To_Cntry = Mid(client.CS_To_Cntry,4,Len(client.CS_To_Cntry))>
</cfif>
		
<cfset client.CS_Pgm_Type = URL.url_CS_Pgm_Type>
<cfset local.MinusOne = Left(client.CS_Pgm_Type, 2)>
<cfif local.MinusOne EQ "-1" AND #Len(client.CS_Pgm_Type)# GT 2>
	<cfset client.CS_Pgm_Type = Mid(client.CS_Pgm_Type,4,Len(client.CS_Pgm_Type))>
</cfif>
		
<cfset client.CS_Year_Type = URL.url_CS_Year_Type>
<cfset client.CS_Year = URL.url_CS_Year>
<cfset local.MinusOne = Left(client.CS_Year, 2)>
<cfif local.MinusOne EQ "-1" AND #Len(client.CS_Year)# GT 2>
	<cfset client.CS_Year = Mid(client.CS_Year,4,Len(client.CS_Year))>
</cfif>
<!--- ADDITIONAL SEARCH CRITERIA --->
<cfset client.CS_Field_Stdy_Nm = URL.url_CS_Field_Stdy_Nm>
<!--- <cfset client.CS_ALMN_PROMINENT_CD = URL.url_CS_ALMN_PROMINENT_CD> --->
<cfset client.CS_Citznsp_Cntry_CD = URL.url_CS_Citznsp_Cntry_CD>
<cfset client.CS_Resdnc_Cntry_CD = URL.url_CS_Resdnc_Cntry_CD>
<cfset client.CS_Resdnc_City_Nm = URL.url_CS_Resdnc_City_Nm>
<cfset client.CS_Host_Instn_Nm = URL.url_CS_Host_Instn_Nm>
<cfset client.CS_Visit_City_Nm = URL.url_CS_Visit_City_Nm>

<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
	<tr>
		<td class="c_fieldName" bgcolor="#C7DD9C" colspan="2">CUSTOM SEARCH NAME</td>
	</tr>
	<tr>
		<td> <!--- <cfoutput>#client.CS_ALMN_PROMINENT_CD#</cfoutput>  --->
			<cfoutput>
			<input type="text" name="txt_CS_Search_Nm" value="#client.CS_Search_Nm#" size="60" class="forminputs">
			<input type="hidden" name="h_CS_Search_ID" value="#URL.url_CS_SearchID#">
			</cfoutput>
		</td>
	<!--- </tr>
	<tr> --->
		<td>
			<input type="button" name="cb_SearchAndSave" value="Save & Search" class="c_formbuttons" onClick="JavaScript: f_SaveAndSearch();">
			<!--- &nbsp;&nbsp; --->
			<!--- <input type="button" name="cb_SearchAndSave" value="Close" class="c_formbuttons" onClick="JavaScript: window.close();"> --->
		</td>
	</tr>
</table>

<script language="javascript" type="text/javascript">
function f_SaveAndSearch(){with(self.document.forms[0])
{ 
	if ("<cfoutput>#client.CS_Search_Nm#</cfoutput>" != self.document.forms[0].txt_CS_Search_Nm.value)
	{
		h_CS_Search_ID.value = 0;
	}
	else
	{
		h_CS_Search_ID.value = "<cfoutput>#client.CS_Search_ID#</cfoutput>";
	}
	//

	of_CallFile("InsUpdAdvCustomSearch");
	//
	
	window.location.reload();
	
	//
	window.opener.f_App.h_AnyChanges.value = "NO";
	var vSearch_Type = "";
	if ("<cfoutput>#URL.url_CS_Search_Type#</cfoutput>" == "MAIL")
	{
		window.opener.of_CallFile("doMailingLables");
	}
	else if ("<cfoutput>#URL.url_CS_Search_Type#</cfoutput>" == "CONT")
	{
		window.opener.of_CallFile("doContactList");
	}
	else if ("<cfoutput>#URL.url_CS_Search_Type#</cfoutput>" == "STAT")
	{
		window.opener.of_CallFile("doStatReport");
	}
	else if ("<cfoutput>#URL.url_CS_Search_Type#</cfoutput>" == "DIST")
	{
		window.opener.of_CallFile("doDistributionList");
	}
	
	window.close();
	
	
}}
</script> 