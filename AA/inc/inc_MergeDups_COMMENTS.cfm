<!--- inc_MergeDups_COMMENTS.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray;">
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left" valign="top">Comments</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue" valign="top">
				<cfif #almn_notes_txt# NEQ "&nbsp;"> 
					<cfset local.Output = "#almn_notes_txt#">
					<cfset local.Value = "#almn_notes_txt#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_NOTS_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
				value="#local.Value#" alt="Comments">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><textarea name="txt_NOTS" class="forminputs" cols="20" rows="4"></textarea></td>
		</tr>
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	txt_NOTS.value = "";
	//
	f_fillMergedColumn("NOTS", "", "txt");
}
</script>
