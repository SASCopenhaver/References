<!--- inc_MergeDups_CTZNSP.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray;">
		<tr>
		<th class="c_fieldName" scope="row" align="left">Country of Citizenship</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<!--- #almn_ctznsp_cntry_cd# -- #almn_ctznsp_cntry_nm# --->
				
				<cfif #almn_ctznsp_cntry_cd# NEQ "&nbsp;">
					<cfset local.Output = "#almn_ctznsp_cntry_nm#">
					<cfset local.Value = "#almn_ctznsp_cntry_cd#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_CTZP_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
						value="#local.Value#" alt="Country of Citizenship">
				#local.Output#
				
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_CTZP" class="forminputs"></select></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">2nd Country of Citizenship</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_ctznsp_cntry_cd2# NEQ "&nbsp;">
					<cfset local.Output = "#almn_ctznsp_cntry_nm2#">
					<cfset local.Value = "#almn_ctznsp_cntry_cd2#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_CTZ2_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
						value="#local.Value#" alt="2nd Country of Citizenship">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_CTZ2" class="forminputs"></select></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	//CNTRY OF Citizenship
	of_populateSelect( "ddlb_CTZP", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
	of_selectedInDDLB ("ddlb_CTZP", "-1");
	//CNTRY OF Citizenship 2
	of_populateSelect( "ddlb_CTZ2", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
	of_selectedInDDLB ("ddlb_CTZ2", "-1");
	//
	
	f_fillMergedColumn("CTZP", "-1", "ddlb");
	f_fillMergedColumn("CTZ2", "-1", "ddlb");
}
</script>
