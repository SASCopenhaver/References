<!--- inc_MergeDups_Sex_DOB.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<tr>
		<th class="c_fieldName" scope="row" align="left">Gender</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				
				<cfif #almn_sex_ind# NEQ "&nbsp;">
					<cfset local.Output = "#almn_sex_ind#">
					<cfset local.Value = "#almn_sex_ind#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_SEXI_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
				value="#local.Value#" alt="Gender">
				#local.Output#
			
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_SEXI" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="M">Male</option>
					<option value="F">Female</option>
				</select>
			</td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">DOB (Format: mm-dd-yyyy)</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_dob_dt# NEQ "&nbsp;">
					<cfset local.Output = "#almn_dob_dt#">
					<cfset local.Value = "#almn_dob_dt#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_ADOB_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="DOB">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_ADOB" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	of_selectedInDDLB ("ddlb_SEXI", "-1");
	txt_ADOB.value = "";
	//
	f_fillMergedColumn("SEXI", "-1", "ddlb");
	f_fillMergedColumn("ADOB", "", "txt");
}
</script>
