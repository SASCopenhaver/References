<!--- inc_MergeDups_PRFRD_PHONE.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Peferred Phone/Fax</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_prefrd_phone_num_ind# NEQ "&nbsp;">
				
						<cfif #almn_prefrd_phone_num_ind# EQ "H">
							<cfset local.Output = "Home">
							<cfset local.Value = "H">
						<cfelseif #almn_prefrd_phone_num_ind# EQ "B">
							<cfset local.Output = "Business">
							<cfset local.Value = "B">
						<cfelseif #almn_prefrd_phone_num_ind# EQ "C">
							<cfset local.Output = "Cellular">
							<cfset local.Value = "C">
						<cfelseif #almn_prefrd_phone_num_ind# EQ "O">
							<cfset local.Output = "Other">
							<cfset local.Value = "O">
						<cfelseif #almn_prefrd_phone_num_ind# EQ "F">
							<cfset local.Output = "Fax">
							<cfset local.Value = "F">
						<cfelseif #almn_prefrd_phone_num_ind# EQ "-1">
							<cfset local.Output = "---">
							<cfset local.Value = "-1">
						</cfif>
					
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_PPHN_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
					value="#local.Value#" alt="Peferred Phone/Fax">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_PPHN" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="H">Home</option>
					<option value="B">Business</option>
					<option value="C">Cellular</option>
					<option value="O">Other</option>
					<option value="F">Fax</option>
				</select>
			</td>
		</tr>
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	of_selectedInDDLB ("ddlb_PPHN", "-1");
	f_fillMergedColumn("PPHN", "-1", "ddlb");
}
</script>
