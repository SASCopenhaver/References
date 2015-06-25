<!--- inc_MergeDups_PRFRD_EMAIL.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Peferred E-Mail</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				
				<cfif #almn_prefrd_email_ind# NEQ "&nbsp;">
				
						<cfif #almn_prefrd_email_ind# EQ "1">
							<cfset local.Output = "E-Mail 1">
							<cfset local.Value = "1">
						<cfelseif #almn_prefrd_phone_num_ind# EQ "2">
							<cfset local.Output = "E-Mail 2">
							<cfset local.Value = "2">
						<cfelseif #almn_prefrd_phone_num_ind# EQ "-1">
							<cfset local.Output = "---">
							<cfset local.Value = "-1">
						</cfif>
					
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_PEML_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
						value="#local.Value#" alt="Peferred E_Mail">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_PEML" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="1">E-Mail 1</option>
					<option value="2">E_Mail 2</option>
				</select>
			</td>
		</tr>
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	of_selectedInDDLB ("ddlb_PEML", "-1");
	//
	f_fillMergedColumn("PEML", "-1", "ddlb");
}
</script>
