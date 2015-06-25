<!--- inc_MergeDups_DCSD_DESBL.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<tr>
		<th class="c_fieldName" scope="row" align="left">Deceased</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_dcsd_ind# NEQ "&nbsp;">

						<cfif almn_dcsd_ind EQ "Y">
							<cfset local.Output = "Yes">
							<cfset local.Value = "Y">
						<cfelseif almn_dcsd_ind EQ "N">
							<cfset local.Output = "No">
							<cfset local.Value = "N">
						</cfif>
				
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input	type="checkbox" 
						name="cbx_DEAD_#almn_id#"  
					    onClick = "JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');"
						value="#local.Value#" alt="Deceased">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_DEAD" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="N">No</option>
					<option value="Y">Yes</option>
				</select>
			</td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Desabled</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_dsabld_ind# NEQ "&nbsp;">
					
						<cfif almn_dsabld_ind EQ "Y">
							<cfset local.Output = "Yes">
							<cfset local.Value = "Y">
						<cfelseif almn_dsabld_ind EQ "N">
							<cfset local.Output = "No">
							<cfset local.Value = "N">
						</cfif>
				
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_DSBL_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
				value="#local.Value#" alt="Desabled">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_DSBL" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="N">No</option>
					<option value="Y">Yes</option>
				</select>
			</td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	of_selectedInDDLB ("ddlb_DEAD", "-1");
	of_selectedInDDLB ("ddlb_DSBL", "-1");
	//
	f_fillMergedColumn("DEAD", "-1", "ddlb");
	f_fillMergedColumn("DSBL", "-1", "ddlb");
}
</script>