<!--- inc_MergeDups_NAME.cfm --->
<input type="hidden" name="h_almn_id" value="">
<input type="hidden" name="h_loop_counter" value="">
<table width="100%"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<!--- ............................................................................. --->
		<cfif #client.Usr_Role_CD# EQ "1">
		<tr>
				<th class="c_fieldName" scope="row" align="left">Alumni ID<br>Source</th>
				<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
					<cfoutput>
					<td class="c_fieldValue">
						#almn_id#<br>#pgm_src_nm#
						<input type="hidden" name="h_almn_id_#almn_id#" value="#almn_id#">
					</td>
					</cfoutput>
				</cfloop>
				<td class="c_fieldValue">0<br>(Merged)</td>
		</tr>
		</cfif>
		<!--- ............................................................................. --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Prefix</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_pfx_dsc# NEQ "&nbsp;">
					<cfset local.Output = "#almn_pfx_dsc#">
					<cfset local.Value = "#almn_pfx_dsc#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "-1">
				</cfif>
				<input	type="checkbox" name="cbx_PRFX_#almn_id#" 
						onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'ddlb');" 
						value="#local.Value#" alt="Prefix">
				<!--- <input type="hidden" name="h_cbx_PRFX_#almn_id#" value="#local.Output#"> --->
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><select name="ddlb_PRFX" class="forminputs"></select></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">First Name</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				
				<cfif #almn_frst_nm# NEQ "&nbsp;">
					<cfset local.Output = "#almn_frst_nm#">
					<cfset local.Value = "#almn_frst_nm#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_FNME_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
				value="#local.Value#" alt="First Name">
				#local.Output#
			
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_FNME" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">MI</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_midl_nm# NEQ "&nbsp;">
					<cfset local.Output = "#almn_midl_nm#">
					<cfset local.Value = "#almn_midl_nm#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_MINT_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
				value="#local.Value#" alt="Middle Initial">
				#local.Output#
				
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_MINT" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Last Name</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_last_nm# NEQ "&nbsp;">
					<cfset local.Output = "#almn_last_nm#">
					<cfset local.Value = "#almn_last_nm#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_LNME_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
				value="#local.Value#" alt="Last Name">
				#local.Output#
				
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_LNME" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Last Name 2</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				
				<cfif #almn_last_nm2# NEQ "&nbsp;">
					<cfset local.Output = "#almn_last_nm2#">
					<cfset local.Value = "#almn_last_nm2#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_LNM2_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
				value="#local.Value#" alt="Last Name 2">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_LNM2" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
		<tr>
		<th class="c_fieldName" scope="row" align="left">Suffix</th>
		<cfloop query="spr_getRecordsToMerge" startrow="1" endrow="#local.NumOfColumns#">
			<cfoutput>
			<td class="c_fieldValue">
				<cfif #almn_sfx_dsc# NEQ "&nbsp;">
					<cfset local.Output = "#almn_sfx_dsc#">
					<cfset local.Value = "#almn_sfx_dsc#">
				<cfelse>
					<cfset local.Output = "---">
					<cfset local.Value = "">
				</cfif>
				<input type="checkbox" name="cbx_SUFX_#almn_id#" onClick="JavaScript: js_behaveLikeRadioButton(this.name, '#local.NumOfColumns#', 'txt_');" 
				value="#local.Value#" alt="Suffix">
				#local.Output#
			</td>
			</cfoutput>
		</cfloop>
			<td><input type="text" name="txt_SUFX" class="forminputs" value=""></td>
		</tr>
		<!--- ||||| --->
		<!--- ||||| --->
</table>
<!--- ------------------------------------------------- --->
<script language="javascript" type="text/javascript">
with (self.document.forms[0])
{
	//
	of_populateSelect( "ddlb_PRFX", "-1", "=Select=", rowsPrfx, "orgBfrPrfx", "aitem_cd", "aitem_cd", "2D" );
	txt_FNME.value = "";
	txt_MINT.value = "";
	txt_LNME.value = "";
	txt_LNM2.value = "";
	txt_SUFX.value = "";
	//
	f_fillMergedColumn("PRFX", "-1", "ddlb");
	f_fillMergedColumn("FNME", "", "txt");
	f_fillMergedColumn("MINT", "", "txt");
	f_fillMergedColumn("LNME", "", "txt");
	f_fillMergedColumn("LNM2", "", "txt");
	f_fillMergedColumn("SUFX", "", "txt");
	
}
</script>