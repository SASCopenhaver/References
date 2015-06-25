<!--- inc_MergeDups_CONTACT.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Do Not Contact</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_cntct_ind# NEQ "&nbsp;">
						
						<cfif #almn_cntct_ind# EQ "Y">
							<cfset local.Output = "Contact">
							<cfset local.Value = "#almn_cntct_ind#">
						<cfelseif #almn_cntct_ind# EQ "N">
							<cfset local.Output = "Do Not Contact">
							<cfset local.Value = "#almn_cntct_ind#">
						</cfif>
									
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_CNCT_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
				value="#local.Value#" alt="Do Not Contact">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_CNCT" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="Y">Contact</option>
					<option value="N">Do Not Contact</option>
				</select>
			</td>
		</tr>
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	of_selectedInDDLB ("ddlb_CNCT", "-1");
	//
	f_fillMergedColumn("CNCT", "-1", "ddlb");
}
</script>