<!--- inc_MergeDups_ELP.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray;">
		<tr>
		<th class="c_fieldName" scope="row" align="left">ELP Speak</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<!--- S-#almn_elp_speak_fsi_level_num#-E --->
				<cfif #almn_elp_speak_fsi_level_num# NEQ "&nbsp;">
					<cfset local.Output = "#almn_elp_speak_fsi_level_num#">
					<cfset local.Value = "#almn_elp_speak_fsi_level_num#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_ELPS_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
						value="#local.Value#" alt="ELP Speak">
				#local.Output#
				
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_ELPS" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="0">0</option>
					<option value="1">&nbsp;1</option>
					<option value="2">&nbsp;&nbsp;2</option>
					<option value="3">&nbsp;&nbsp;&nbsp;3</option>
					<option value="4">&nbsp;&nbsp;&nbsp;&nbsp;4</option>
					<option value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5</option>
				</select>
			</td>
			
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">ELP Read</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_elp_read_fsi_level_num# NEQ "&nbsp;">
					<cfset local.Output = "#almn_elp_read_fsi_level_num#">
					<cfset local.Value = "#almn_elp_read_fsi_level_num#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_ELPR_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
				value="#local.Value#" alt="ELP Read">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_ELPR" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="0">0</option>
					<option value="1">&nbsp;1</option>
					<option value="2">&nbsp;&nbsp;2</option>
					<option value="3">&nbsp;&nbsp;&nbsp;3</option>
					<option value="4">&nbsp;&nbsp;&nbsp;&nbsp;4</option>
					<option value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5</option>
				</select>
			</td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">ELP Comprehand</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				
				<cfif #almn_elp_comp_fsi_level_num# NEQ "&nbsp;">
					<cfset local.Output = "#almn_elp_comp_fsi_level_num#">
					<cfset local.Value = "#almn_elp_comp_fsi_level_num#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input type="checkbox" name="cbx_ELPC_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
				value="#local.Value#" alt="ELP Comprehand">
				#local.Output#
								
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_ELPC" class="forminputs">
					<option value="-1">=Select=</option>
					<option value="0">0</option>
					<option value="1">&nbsp;1</option>
					<option value="2">&nbsp;&nbsp;2</option>
					<option value="3">&nbsp;&nbsp;&nbsp;3</option>
					<option value="4">&nbsp;&nbsp;&nbsp;&nbsp;4</option>
					<option value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5</option>
				</select>
			</td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
</table>
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	of_selectedInDDLB ("ddlb_ELPS", "-1");
	of_selectedInDDLB ("ddlb_ELPR", "-1");
	of_selectedInDDLB ("ddlb_ELPC", "-1");
	//
	f_fillMergedColumn("ELPS", "-1", "ddlb");
	f_fillMergedColumn("ELPR", "-1", "ddlb");
	f_fillMergedColumn("ELPC", "-1", "ddlb");
}
</script>
