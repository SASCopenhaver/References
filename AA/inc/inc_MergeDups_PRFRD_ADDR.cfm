<!--- inc_MergeDups_PRFRD_ADDR.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<tr>
		<th class="c_fieldName" scope="row" align="left">Preferred Address</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_prefrd_adrs_ind# NEQ "&nbsp;">
					<cfif #almn_prefrd_adrs_ind# EQ "H">
						<cfset local.Output = "Home">
						<cfset local.Value = "H">
					<cfelseif #almn_prefrd_adrs_ind# EQ "B">
						<cfset local.Output = "Business">
						<cfset local.Value = "B">
					</cfif>
					
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_PADD_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
						value="#local.Value#" alt="Preferred Address">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_PADD" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="H">Home</option>
					<option value="B">Business</option>
				</select>
			</td>
		</tr>
		<!--- ||||| --->
		
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	of_selectedInDDLB ("ddlb_PADD", "-1");
	//
	f_fillMergedColumn("PADD", "-1", "ddlb");
	
}
</script>
