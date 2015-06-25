<!--- inc_MergeDups_EMAIL.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<tr>
		<th class="c_fieldName" scope="row" align="left">E-Mail 1</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_email1_txt# NEQ "&nbsp;">
					<cfset local.Output = "#almn_email1_txt#">
					<cfset local.Value = "#almn_email1_txt#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_EMAL_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
					value="#local.Value#" alt="E-Mail 1">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_EMAL" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">E-Mail 2</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_email2_txt# NEQ "&nbsp;">
					<cfset local.Output = "#almn_email2_txt#">
					<cfset local.Value = "#almn_email2_txt#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_EML2_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="E_Mail 2">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_EML2" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	txt_EMAL.value = "";
	txt_EML2.value = "";
	//
	f_fillMergedColumn("EMAL", "", "txt");
	f_fillMergedColumn("EML2", "", "txt");
}
</script>
