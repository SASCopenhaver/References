<!--- inc_MergeDups_FAX.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Fax</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_fax_num# NEQ "&nbsp;">
					<cfset local.Output = "#almn_fax_num#">
					<cfset local.Value = "#almn_fax_num#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_FNUM_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="Fax">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_FNUM" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	txt_FNUM.value = "";
	//
	f_fillMergedColumn("FNUM", "", "txt");
}
</script>
