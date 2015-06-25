<!--- inc_MergeDups_RES_ADDR.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray;">
		<tr><td colspan="<cfoutput>#local.NumOfColumns+2#</cfoutput>" class="c_fieldName" style="text-decoration:underline; ">Residential</td></tr>
		<tr>
		<th class="c_fieldName" scope="row" align="left">Mailing Address</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_resdnc_adrs_txt# NEQ "&nbsp;">
					<cfset local.Output = "#almn_resdnc_adrs_txt#">
					<cfset local.Value  = "#almn_resdnc_adrs_txt#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_RADD_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="Mailing Address">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><textarea name="txt_RADD" class="forminputs" cols="20" rows="4"></textarea></td>
			
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">City</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_resdnc_city_nm# NEQ "&nbsp;">
					<cfset local.Output = "#almn_resdnc_city_nm#">
					<cfset local.Value = "#almn_resdnc_city_nm#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_RCTY_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="City">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_RCTY" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">State/Province</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_resdnc_state_prvnc_nm# NEQ "&nbsp;">
					<cfset local.Output = "#almn_resdnc_state_prvnc_nm#">
					<cfset local.Value = "#almn_resdnc_state_prvnc_nm#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_RSPR_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="State/Province">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_RSPR" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">ZIP</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_resdnc_postl_cd# NEQ "&nbsp;">
					<cfset local.Output = "#almn_resdnc_postl_cd#">
					<cfset local.Value = "#almn_resdnc_postl_cd#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_RZIP_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="ZIP">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_RZIP" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Country</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_resdnc_cntry_cd# NEQ "&nbsp;">
					<cfset local.Output = "#almn_resdnc_cntry_nm#">
					<cfset local.Value = "#almn_resdnc_cntry_cd#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_RCRY_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
						value="#local.Value#" alt="Country">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_RCRY" class="forminputs"></select></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	self.document.forms[0].txt_RADD.value = "";
	self.document.forms[0].txt_RCTY.value = "";
	self.document.forms[0].txt_RSPR.value = "";
	self.document.forms[0].txt_RZIP.value = "";
	of_populateSelect( "ddlb_RCRY", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
	of_selectedInDDLB ("ddlb_RCRY", "-1");
	//
	f_fillMergedColumn("RADD", "", "txt");
	f_fillMergedColumn("RCTY", "", "txt");
	f_fillMergedColumn("RSPR", "", "txt");
	f_fillMergedColumn("RZIP", "", "txt");
	f_fillMergedColumn("RCRY", "-1", "ddlb");
}
</script>
