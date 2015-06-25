<!--- inc_ProgramComparison_p1.cfm --->

<cfwddx action="wddx2cfml" input="#client.sprWDDX_getPgmRecds#" output="spr_getPgmRecds">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getAlmnName#" output="spr_getAlmnName">
<!--- ------------------------------------------------------------------------------ --->
<script language="javascript" type="text/javascript">
//
//----------------------------------------------------------------------------------------

function f_ContMerge(){with(self.document.forms[0])
{
	if (h_ListOfIDsToMerge.value == "" || h_Counter.value == 1)
	{
		alert("Sorry, your request could not be satisfied.\nSelect at least 2 records you would like to merge.")
	}
	else
	{
		of_CallFile("getRecordsToMerge"); 
	}
}}
//
//----------------------------------------------------------------------------------------

function f_getAlmnForMerge(){with(self.document.forms[0])
{
	var vListOfIDsToMerge = "";
	var vCounter = 0;
	var vCounterTemp = 0;
	//
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].type == "checkbox" 
			&& 
			elements[e].name.substr(0,11) == "cbx_Merged_" 
			&&
			elements[e].checked == true
			)
		{
			vListOfIDsToMerge += elements[e].name.substr(11)+",";
			vCounter ++;
		}
		
	}
	//
	h_ListOfIDsToMerge.value = vListOfIDsToMerge;
	h_Counter.value = vCounter;
}}
</script>
<input type="hidden" name="h_ListOfIDsToMerge" value="">
<input type="hidden" name="h_Counter" value="">
<cfset client.AlmnName = "#spr_getAlmnName.almn_pfx_dsc# #spr_getAlmnName.almn_last_nm# #spr_getAlmnName.almn_last_nm2# #spr_getAlmnName.almn_frst_nm# #spr_getAlmnName.almn_midl_nm# #spr_getAlmnName.almn_sfx_dsc#">
<div class="feature">
<table width="100%"  border="0" cellspacing="2" cellpadding="2"  style="border-bottom:1px solid Gray;">
  <tr>
    <td>
		<cfoutput><strong>#client.AlmnName#</strong>
			<!--- <input type="hidden" name="h_ALMN_ID_TITLE" value="#spr_getAlmnName.almn_id#"> --->
		</cfoutput>
	</td>
  </tr>
</table>

<table width="100%"  border="0" cellspacing="2" cellpadding="2">
	  <tr class="c_fieldName">
			<th scope="col">Program Name</th>
			<th scope="col">Fiscal Year</th>
			<th scope="col">Pgm Year</th>
			<th scope="col">Country From</th>
			<th scope="col">Country To</th>
			<th scope="col">Field of study<br>Project Subject</th>
			<th scope="col">Source</th>
			<th scope="col">Make<br>Selection<cfif client.Usr_Role_CD EQ "1"><br>(ALMNI_ID)</cfif></th>
	  </tr>

  <cfloop query="spr_getPgmRecds" startrow="1" endrow="#spr_getPgmRecds.recordCount#">
	  <cfoutput>
	  <tr class="c_fieldValue">
			<td>#pgm_nm#
				<input type="hidden" name="h_almn_id_#almn_id#" value="#almn_id#">
				<input type="hidden" name="h_pgm_id_#pgm_id#" value="#pgm_id#">
				<input type="hidden" name="h_pgm_type_cd_#pgm_type_cd#" value="#pgm_type_cd#">
			</td>
			<td>#pgm_fy_dt#</td>
			<td>#pgm_yr_dt#</td>
			<td>#pgm_from_cntry_nm#
				<input type="hidden" name="h_pgm_from_cntry_cd_#pgm_from_cntry_cd#" value="#pgm_from_cntry_cd#">
			</td>
			<td>#pgm_to_cntry_nm#
				<input type="hidden" name="h_pgm_to_cntry_cd_#pgm_to_cntry_cd#" value="#pgm_to_cntry_cd#">
			</td>
			<td>#pgm_field_stdy_nm#
				<input type="hidden" name="h_pgm_field_stdy_cd_#pgm_field_stdy_cd#" value="#pgm_field_stdy_cd#">
			</td>
			<td>#pgm_src_nm#</td>
			<td>
				<input type="checkbox" name="cbx_Merged_#almn_id#" value="#almn_id#" onClick="JavaScript: f_getAlmnForMerge();">
				<cfif client.Usr_Role_CD EQ "1">#almn_id#</cfif>
			</td>
	  </tr>
	  </cfoutput>
  </cfloop>
</table>
<br>
<!--- <table width="100%"  border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td align="right" width="80%">
		<input type="button" name="cb_ContMerge" value="Continue Merging" class="c_formbuttons" onClick="JavaScript:f_ContMerge();">
	</td>
	<td>&nbsp;&nbsp;</td>
    <td>
		<input type="button" name="cb_BackToSearchResult" value="Back To SearchResult" class="c_formbuttons" onClick="JavaScript:history.go(-2);">
	</td>
	<td>&nbsp;&nbsp;</td>
  </tr>
</table>
 --->
<table align="right" width="300px"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<tr>
			<td align="right" width="80%">
		<input type="button" name="cb_ContMerge" value="Continue Merging" class="c_formbuttons" onClick="JavaScript:f_ContMerge();">
	</td>
	<td>&nbsp;&nbsp;</td>
    <td>
		<input type="button" name="cb_BackToSearchResult" value="Back To Search Result" class="c_formbuttons" onClick="JavaScript:history.go(-2);">
	</td>
	<td>&nbsp;&nbsp;</td>
  </tr>
		</tr>
</table>

</div>
