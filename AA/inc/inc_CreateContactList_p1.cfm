<!--- inc_BasicSearch_p1.cfm EDF7D8  C7DD9C--->
<script language="javascript" type="text/javascript">

function f_ShowHideSavedSearches(){with(self.document.forms[0])
{
	var vAction = h_ShowHideSavedSearches.value;
	var vSign = "";
	var vList = "";
	var vListTemp = "";
	var vTemp = "";
	//
	switch (vAction)
	{
		case "SHOW"://alert(vAction)
			vSign = "";
			vSign += "<a href=\"##\" onClick=\"JavaScript: f_ShowHideSavedSearches();\" >";
			//vSign += "<font size=\"+2\">-</font>";
			vSign += "Hide Saved Searches";
			vSign += "</a>";
			//
			vAction = "HIDE";
			//
			vList += "<table title\"List of Searches\" border=0 width=\"100%\">";
			for (var r=0; r<orgBrgCS.length; r++)
			{
				
				vTemp += "<tr>";
					//cell 1:
					//vTemp += "<td bgcolor=\"#C7DD9C\" align=\"center\">";//width=\"10%\" 
					//	vTemp += "&nbsp;";
					//vTemp += "</td>";
					//cell 2:
					vTemp += "<td class=\"c_fieldValue\" bgcolor=\"#C7DD9C\">";
						vTemp += "&nbsp;&nbsp;&nbsp;";
						vTemp += "<a href=\"JavaScript: void(0);\" onClick=\"JavaScript: f_getSelectedSearch("+orgBrgCS[r].acust_search_id+");\">"+orgBrgCS[r].acust_search_nm+"</a>";
					vTemp += "</td>";
					//cell 3:
					vTemp += "<td class=\"c_fieldValue\" align=\"center\" width=\"10%\">";
						vTemp += "<input type=\"button\" value=\"Delete\" class=\"c_formbuttons\" onClick=\"JavaScript: f_deleteSearch("+orgBrgCS[r].acust_search_id+");\">"
					vTemp += "</td>";
					//
				vTemp += "</tr>";
				//
				vListTemp += vTemp;
				vTemp = "";
			}
			vList += vListTemp;
			vList += "</table>";
		break;
		//
		case "HIDE"://alert(vAction)
			vSign = "";
			vSign += "<a href=\"##\" onClick=\"JavaScript: f_ShowHideSavedSearches();\" >";
			vSign += "Show Saved Searches";
			vSign += "</a>";
			//
			vAction = "SHOW";
		break;
	}
	//
	h_ShowHideSavedSearches.value = vAction;
	//
	of_innerHTML("id_Sign", "'"+vSign+"'");
	//
	of_innerHTML("id_ListOfSearches", "'"+vList+"'");
}}
</script>
<div class="feature">

<cfif #spr_getCustomSearches.recordCount# NEQ 0>
		<br>
		<table width="60%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EDF7D8">
		  	<td align="center" width="3%">
				<a href="##" onClick="JavaScript: f_ShowHideSavedSearches();">
				<img border="0" src="Img/Attn.jpg">
				</a>
			</td>
			
			<td class="c_fieldName" width="140px" >
			<div  id="id_Sign"></div>
				<!--- <a href="##" onClick="JavaScript: f_ShowHideSavedSearches();"> --->
				<!--- <span> --->
				<!--- Show Saved Searches --->
				<!--- </span> --->
				<!--- </a> --->
			</td>
			<td><hr color="#E20C0C"></td>
		  </tr>
		</table>
		
		<table width="60%" border="0" cellspacing="0" cellpadding="0" bgcolor="#EDF7D8">
		  <tr>
		  	<td colspan="3"><span id="id_ListOfSearches"></span></td>
		  </tr>
		</table>
		<br>
</cfif>

<table border="0" cellspacing="1" cellpadding="1">
  <tr>                                                           
    <td width="60%" valign="top" style="border-right-style:groove; border-top-style:groove;">
		<cfinclude template="inc_CreateContactList_Tbl.cfm">
	</td>
	<td valign="top" id="id_SearchCriteria">&nbsp;</td>
  </tr>
</table>
<cfif client.CS_SetDefault EQ "NO">
	<script language="javascript" type="text/javascript">
		f_showSelection();
	</script>
</cfif>
</div>
<script language="javascript" type="text/javascript">
//
//-- SEARCHES ---
with (self.document.forms[0])
{
	h_ShowHideSavedSearches.value = "<cfoutput>#client.ShowHideSavedSearches#</cfoutput>";
}
//
if (orgBrgCS.length > 0) 
{ 
	of_innerHTML("id_ListOfSearches", "''"); 
	f_ShowHideSavedSearches();
}
//
//--------------------------------------------------------------------------------------
function f_getSelectedSearch(arg_SearchID){with(self.document.forms[0])
{//alert(arg_SearchID)
	var vName = "";
	for (var cs=0; cs<rowsCS; cs++)
	{//alert(orgBrgCS[cs].acust_search_frst_nm)
		if ( orgBrgCS[cs].acust_search_id == arg_SearchID )
		{//alert(orgBrgCS[cs].acust_search_id +"   "+ arg_SearchID)
		
			h_CS_Search_ID.value = orgBrgCS[cs].acust_search_id;
			txt_CS_Search_Nm.value = orgBrgCS[cs].acust_search_nm;
					
			//-- FIRST NAME
			if (orgBrgCS[cs].acust_search_frst_nm == "nullishere") { vName = "" }
			else { vName = orgBrgCS[cs].acust_search_frst_nm }
			txt_CS_Frst_Nm.value = vName;
			//-- LAST NAME
			if (orgBrgCS[cs].acust_search_last_nm == "nullishere") { vName = "" }
			else { vName = orgBrgCS[cs].acust_search_last_nm }
			txt_CS_Last_Nm.value = vName;
			//
			of_selectedInDDLB("ddlb_CS_Gender", orgBrgCS[cs].acust_search_gender_cd);
			//
			//-- Country FROM:
			for (var i=0; i<ddlbm_CS_From_Cntry.options.length; i++)
			{
				ddlbm_CS_From_Cntry.options[i].selected = false;
			}
			//
			
			if (orgBrgCS[cs].acust_search_from_cntry_cd.indexOf(",") == -1)
			{
				of_selectedInDDLB("ddlbm_CS_From_Cntry", orgBrgCS[cs].acust_search_from_cntry_cd);
			}
			else
			{
				var vTempPartStr = orgBrgCS[cs].acust_search_from_cntry_cd;
				var vTempShowStr = "";
				var pos0=0;
				while (vTempPartStr.indexOf(",") != -1) 
				{
					vTempShowStr = vTempPartStr.substr(0,2);
					of_selectedInDDLB("ddlbm_CS_From_Cntry", vTempShowStr);
					vTempPartStr = vTempPartStr.substr(3);
				}
				of_selectedInDDLB("ddlbm_CS_From_Cntry", vTempPartStr);
			}
			//
			//
			//-- Country TO:
			for (var i=0; i<ddlbm_CS_To_Cntry.options.length; i++)
			{
				ddlbm_CS_To_Cntry.options[i].selected = false;
			}
			if (orgBrgCS[cs].acust_search_to_cntry_cd.indexOf(",") == -1)
			{
				of_selectedInDDLB("ddlbm_CS_To_Cntry", orgBrgCS[cs].acust_search_to_cntry_cd);
			}
			else
			{
				var vTempPartStr = orgBrgCS[cs].acust_search_to_cntry_cd;
				var vTempShowStr = "";
				var pos0=0;
				while (vTempPartStr.indexOf(",") != -1) 
				{
					vTempShowStr = vTempPartStr.substr(0,2);
					of_selectedInDDLB("ddlbm_CS_To_Cntry", vTempShowStr);
					vTempPartStr = vTempPartStr.substr(3);
				}
				of_selectedInDDLB("ddlbm_CS_To_Cntry", vTempPartStr);
			}
			//
			//
			//-- PROGRAM TYPE:
			for (var i=0; i<ddlbm_CS_Pgm_Type.options.length; i++)
			{
				ddlbm_CS_Pgm_Type.options[i].selected = false;
			}
			
			if (orgBrgCS[cs].acust_search_pgm_type_cd.indexOf(",") == -1)
			{
				of_selectedInDDLB("ddlbm_CS_Pgm_Type", orgBrgCS[cs].acust_search_pgm_type_cd);
			}
			else
			{
				//alert(orgBrgCS[cs].acust_search_pgm_type_cd)
				var vTempPartStr = orgBrgCS[cs].acust_search_pgm_type_cd;
				var vTempShowStr = "";
				var pos0=0;
				var vComaPos = 0;
				while (vTempPartStr.indexOf(",") != -1) 
				{
					vComaPos = vTempPartStr.indexOf(",");
					vTempShowStr = vTempPartStr.substr(0, vComaPos );
					of_selectedInDDLB("ddlbm_CS_Pgm_Type", vTempShowStr);
					vTempPartStr = vTempPartStr.substr(vComaPos+1);
					
					
					//vTempShowStr = vTempPartStr.substr(0,2);
					//of_selectedInDDLB("ddlbm_CS_Pgm_Type", vTempShowStr);
					//vTempPartStr = vTempPartStr.substr(3);
				}
				of_selectedInDDLB("ddlbm_CS_Pgm_Type", vTempPartStr);
				
			}
			//
			//
			//Fiscal Year or Program Start Year
			of_selectedInDDLB("ddlb_CS_Year_Type", orgBrgCS[cs].acust_search_yr_type);
			f_onChng_YearType(orgBrgCS[cs].acust_search_yr_type);
			//
			
			//-- YEAR: ////
			//of_selectedInDDLB("ddlb_CS_Year", orgBrgCS[cs].acust_search_yr);
			for (var i=0; i<ddlb_CS_Year.options.length; i++)
			{
				ddlb_CS_Year.options[i].selected = false;
			}
			
			if (orgBrgCS[cs].acust_search_yr.indexOf(",") == -1)
			{
				of_selectedInDDLB("ddlb_CS_Year", orgBrgCS[cs].acust_search_yr);
			}
			else
			{
				//alert(orgBrgCS[cs].acust_search_pgm_type_cd)
				var vTempPartStr = orgBrgCS[cs].acust_search_yr;
				var vTempShowStr = "";
				var pos0=0;
				
				while (vTempPartStr.indexOf(",") != -1) 
				{
					vTempShowStr = vTempPartStr.substr(0,4); 					
					of_selectedInDDLB("ddlb_CS_Year", vTempShowStr);
					vTempPartStr = vTempPartStr.substr(5);
				}
				of_selectedInDDLB("ddlb_CS_Year", vTempPartStr);
				
			}
			//
			
			//
			//-- Field Of Study/Project Subject
			if (orgBrgCS[cs].acust_search_field_stdy_nm == "nullishere") { vName = "" }
			else { vName = orgBrgCS[cs].acust_search_field_stdy_nm }
			//alert(vName)
			txt_CS_Field_Stdy_Nm.value = vName;
			
			//-- Citizenship Country
			of_selectedInDDLB("ddlb_CS_Citznsp_Cntry_CD", orgBrgCS[cs].acust_search_ctznsp_cntry_cd);
			
			//-- Residence Country
			of_selectedInDDLB("ddlb_CS_Resdnc_Cntry_CD", orgBrgCS[cs].acust_search_resdnc_cntry_cd);
			
			//-- City Of Residence
			if (orgBrgCS[cs].acust_search_resdnc_city_nm == "nullishere") { vName = "" }
			else { vName = orgBrgCS[cs].acust_search_resdnc_city_nm }
			txt_CS_Resdnc_City_Nm.value = vName;
			
			//-- Host Institution
			if (orgBrgCS[cs].acust_search_host_inst_nm == "nullishere") { vName = "" }
			else { vName = orgBrgCS[cs].acust_search_host_inst_nm }
			txt_CS_Host_Instn_Nm.value = vName;
			
			//-- City Visited
			if (orgBrgCS[cs].acust_search_city_visit_nm == "nullishere") { vName = "" }
			else { vName = orgBrgCS[cs].acust_search_city_visit_nm }
			txt_CS_Visit_City_Nm.value = vName;
			
			//
			f_showSelection();
			//
			break;
		}// end of   if( orgBrgCS[cs].acust_search_id == arg_SearchID )
	}// end of loop
}}
</script>