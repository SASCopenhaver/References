<!--- inc_MergeDups_BUS_ADDR.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray;">
		<tr><td colspan="<cfoutput>#local.NumOfColumns+2#</cfoutput>" class="c_fieldName" style="text-decoration:underline; ">Business</td></tr>
		<tr>
		<th class="c_fieldName" scope="row" align="left">Mailing Address</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_bsns_adrs_txt# NEQ "&nbsp;">
					<cfset local.Output = "#almn_bsns_adrs_txt#">
					<cfset local.Value  = "#almn_bsns_adrs_txt#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_BADD_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="Mailing Address">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><textarea name="txt_BADD" class="forminputs" cols="20" rows="4"></textarea></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		
		
		<tr>
		<th class="c_fieldName" scope="row" align="left">Business Name</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_bsns_nm# NEQ "&nbsp;">
					<cfset local.Output = "#almn_bsns_nm#">
					<cfset local.Value  = "#almn_bsns_nm#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_BNME_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="Business Name">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><textarea name="txt_BNME" class="forminputs" cols="20" rows="4"></textarea></td>
		</tr>
		
		
		
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">City</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_bsns_city_nm# NEQ "&nbsp;">
					<cfset local.Output = "#almn_bsns_city_nm#">
					<cfset local.Value = "#almn_bsns_city_nm#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_BCTY_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="City">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_BCTY" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">State/Province</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_bsns_state_prvnc_nm# NEQ "&nbsp;">
					<cfset local.Output = "#almn_bsns_state_prvnc_nm#">
					<cfset local.Value = "#almn_bsns_state_prvnc_nm#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_BSPR_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="State/Province">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_BSPR" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">ZIP</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_bsns_postl_cd# NEQ "&nbsp;">
					<cfset local.Output = "#almn_bsns_postl_cd#">
					<cfset local.Value = "#almn_bsns_postl_cd#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_BZIP_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="State/Province">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_BZIP" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Country</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_resdnc_cntry_cd# NEQ "&nbsp;">
					<cfset local.Output = "#almn_bsns_cntry_nm#">
					<cfset local.Value = "#almn_bsns_cntry_cd#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_BCRY_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
						value="#local.Value#" alt="Country">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_BCRY" class="forminputs"></select></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	self.document.forms[0].txt_BADD.value = "";
	self.document.forms[0].txt_BNME.value = "";
	self.document.forms[0].txt_BCTY.value = "";
	self.document.forms[0].txt_BZIP.value = "";
	self.document.forms[0].txt_BSPR.value = "";
	of_populateSelect( "ddlb_BCRY", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
	of_selectedInDDLB ("ddlb_BCRY", "-1");

	//
	f_fillMergedColumn("BADD", "", "txt");
	f_fillMergedColumn("BNME", "", "txt");
	f_fillMergedColumn("BCTY", "", "txt");
	f_fillMergedColumn("BSPR", "", "txt");
	f_fillMergedColumn("BZIP", "", "txt");
	f_fillMergedColumn("BCRY", "-1", "ddlb");
}
</script>
