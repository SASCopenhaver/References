<!--- inc_MergeDups_PHONE.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<tr>
		<th class="c_fieldName" scope="row" align="left">Residence Phone</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_resdnc_phone_num# NEQ "&nbsp;">
					<cfset local.Output = "#almn_resdnc_phone_num#">
					<cfset local.Value = "#almn_resdnc_phone_num#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_RPHN_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="Residence Phone">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_RPHN" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Business Phone</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_bsns_phone_num# NEQ "&nbsp;">
					<cfset local.Output = "#almn_bsns_phone_num#">
					<cfset local.Value = "#almn_bsns_phone_num#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_BPHN_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="Business Phone">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_BPHN" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Cellular Phone</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_cell_num# NEQ "&nbsp;">
					<cfset local.Output = "#almn_cell_num#">
					<cfset local.Value = "#almn_cell_num#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_CPHN_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="Cellular Phone">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_CPHN" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Other Phone</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_othr_phone_num# NEQ "&nbsp;">
					<cfset local.Output = "#almn_othr_phone_num#">
					<cfset local.Value = "#almn_othr_phone_num#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_OPHN_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
						value="#local.Value#" alt="Other Phone">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_OPHN" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	self.document.forms[0].txt_RPHN.value = "";
	self.document.forms[0].txt_BPHN.value = "";
	self.document.forms[0].txt_CPHN.value = "";
	self.document.forms[0].txt_OPHN.value = "";
	//
	f_fillMergedColumn("RPHN", "", "txt");
	f_fillMergedColumn("BPHN", "", "txt");
	f_fillMergedColumn("CPHN", "", "txt");
	f_fillMergedColumn("OPHN", "", "txt");
}
</script>
