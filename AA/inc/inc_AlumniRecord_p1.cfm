<!--- inc_AlumniRecord_p1.cfm --->
<script language="javascript" type="text/javascript">
/*
function f_CallFromBreadCrumb(argGetPage){with(self.document.forms[0])
{
	if ( argGetPage == "BasicSearch" )
	{
		of_CallFile(203);
	}
	else if ( argGetPage == "AlumniRecord" )
	{
		of_CallFile("getAlumniRecord");
	}
	else if ( argGetPage == 'SearchResults')
	{
		of_CallFile("basicCustomSearchFromAlmnProfile");
	}
}}
*/
//
//--------------------------------------------------------------------------------------------------------------------------------
function f_cbxOnClick(argCtrlName){with(self.document.forms[0])
{
	if( eval(argCtrlName+".checked") )
	{
		eval(argCtrlName+".value='Y'")
	}
	else
	{
		eval(argCtrlName+".value='N'")
	}
}}
//
//--------------------------------------------------------------------------------------------------------------------------------
function f_cbxOnClickContact(argCtrlName){with(self.document.forms[0])
{
	if( eval(argCtrlName+".checked") )
	{
		eval(argCtrlName+".value='N'")
	}
	else
	{
		eval(argCtrlName+".value='Y'")
	}
}}


</script>
<div class="feature">
<!--- ========================================================================================================================= --->
<cfoutput>
<input type="hidden" name="h_AlmnID" value="#client.AP_AlmnID#">
</cfoutput>
<!--- ========================================================================================================================= --->

<table border="0" width="100%">
	<tr>
		<td width="30%" valign="top">
			<cfoutput query="spr_getAlnmProfile">
			<cfif #almn_pfx_dsc# EQ -1>
				<cfset local.almn_pfx_dsc = "">
			<cfelse>
				<cfset local.almn_pfx_dsc = #almn_pfx_dsc#>
			</cfif>
			<font size="+1"><strong>#local.almn_pfx_dsc# #almn_frst_nm# #almn_midl_nm# #almn_last_nm# #almn_last_nm2# #almn_sfx_dsc#</strong></font>
			</cfoutput>
		</td>
		<td valign="top" class="c_fieldValueRed">
			<!--- <cfset local.ctrl_help_ID = "40"> <cfinclude template="../Ctrl_Help.cfm"> --->
			If you believe that any of the program data is incorrect, please send your suggested corrections to the Alumni Archive data administrator, at 
			<a href="mailto:alumniarchive@state.goc">AlumniArchive@state.gov</a>. The administrator will seek the approval for this change from the appropriate ECA Program Office and, once it is approved, will make the change in the Archive database.
		</td>
	</tr>
</table>
<br>
<!--- ========================================================================================================================= --->
<table title="Controls for Alumni Records" width="100%" border="0">
	<!--- ................................................................... --->
	<tr>
		<td align="right">
			<table width="100%">
				<tr>
					<td align="left">
					</td>
					<td>
						<input type="button" name="cb_CloseNoSave2" value="Close Without Changes" class="c_formbuttons" onClick="JavaScript: f_CloseNoSaving();">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" name="cb_Save" value="Save" class="c_formbuttons" onClick="JavaScript: f_UpdateAlmnRecord('UpdateAlmnRecord');">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<!--- <input name="cb_SaveClose" style="margin-right:300px; " type="button" value="Save & Close" class="c_formbuttons" onClick="JavaScript: f_backToSearchResults();"> --->
						<input name="cb_SaveClose" style="margin-right:300px; " type="button" value="Save & Close" class="c_formbuttons" onClick="JavaScript: f_UpdateAlmnRecord('UpdateAlmnRecord_BackToSearchReslt');">
					</td>
				
				</tr>
			</table>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr>
		<td>
			<table width="100%" border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
				<tr class="c_fieldName" bgcolor="#C7DD9C">
					<!--- <td width="10%">&nbsp;</td> --->
					
					<td>Country From</td>
					<td>Country To</td>
					<td>Program Type</td>
					<td>Field of Study/Project Subject</td>
					<td>Pgm Fiscal Year</td>
					<td>Pgm Start Year</td>
					<td>Pgm Start Date&nbsp;</td>
					<td>Host Inst.</td>
					<td>City Visited</td>
				</tr>
				
				<cfloop query="spr_getPgm" startrow="1" endrow="#spr_getPgm.recordCount#">
				<cfoutput>
				<tr >
					
					<td class="c_fieldValue" >#pgm_from_cntry_nm#</td>
					<td class="c_fieldValue" >#pgm_to_cntry_nm#</td>
					<td class="c_fieldValue" >#pgm_type_nm#</td>
					<td class="c_fieldValue" >#field_stdy_nm#</td>
					<td class="c_fieldValue" >#pgm_fy_dt#</td>
					<td class="c_fieldValue" >#pgm_yr_dt#</td>
					<td class="c_fieldValue" >#pgm_start_dt#</td>
					<td class="c_fieldValue" >#place_visit_host_instn_nm#</td>
					<td class="c_fieldValue" >#place_visit_city_n#</td>
				</tr>
				</cfoutput>
				</cfloop>
				
			</table>
		</td>
		<!--- ... --->
	</tr>
</table>

<!--- ========================== PERSONAL INFORMATION ========================================================================= --->
<br>
<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
	<!--- ................................................................... --->
	<tr>
		<td class="c_fieldName" bgcolor="#C7DD9C">
				<table width="100%"><tr><td width="50%">PERSONAL INFORMATION</td></tr></table>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr>	
		<td>
				<cfoutput>
				<table border=0><!--- bgcolor="#EFEFEF" --->
					<tr class="c_fieldName">
						<td>Prefix:</td>
						<td>First Name:</td>
						<td>Middle Initial:</td>
						<td>Last Name:</td>
						<td>Second Last Name:</td>
						<td>Suffix:</td>
						<!--- <td>Sex:</td> --->
						<!--- <td>DOB (mm/dd/yyyy)</td> --->
					</tr>
					<tr>
						<td><select name="ddlb_AP_Pfx" class="forminputs"></select></td>
						<td>
							<input class="forminputs" type="text" name="txt_AP_Frst_Nm" value="#client.AP_Frst_Nm#" size="30"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
						<td>
							<input class="forminputs" type="text" name="txt_AP_Midl_Nm" value="#client.AP_Midl_Nm#" size="30"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
						<td>
							<input class="forminputs" type="text" name="txt_AP_Last_Nm" value="#client.AP_Last_Nm#" size="30"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
						<td>
							<input class="forminputs" type="text" name="txt_AP_Last_Nm2" value="#client.AP_Last_Nm2#" size="30"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
						<td>
							<input class="forminputs" type="text" name="txt_AP_Sfx" value="#client.AP_Sfx#" size="5"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
					</tr>
				</table>
				</cfoutput>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr>
		<td>
				<cfoutput>
				<table width="100%" border=0>
					<tr class="c_fieldName">
						<td>Sex:</td>
						<td>DOB (mm/dd/yyyy):</td>
						<!--- 
						<td>Deceased:</td>
						<td>Disabled:</td>
						 --->
						<td>Country of Citizenship:</td>
						<td>2nd Country of Citizenship:</td>
					</tr>
					<tr>
						<td>
							<select name="ddlb_AP_Sex" class="forminputs">
								<option value="-1">=Select=</option>
								<option value="M">Male</option>
								<option value="F">Female</option>
							</select>
						</td>
						<td>
							<cfif #client.AP_DOB# NEQ "">
								<cfset local.AP_DOB = DateFormat(client.AP_DOB, "mm/dd/yyyy")>
							<cfelse>
								<cfset local.AP_DOB = "">
							</cfif>
							<input class="forminputs" type="text" name="txt_AP_DOB" value="#local.AP_DOB#" size="15"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
						<!--- 
						<td>
							<select name="ddlb_AP_Dcsd" class="forminputs">
								<option value="-1">=Select=</option>
								<option value="N">N</option>
								<option value="Y">Y</option>
							</select>
						</td>
						<td>
							<select name="ddlb_AP_Dsabld" class="forminputs">
								<option value="-1">=Select=</option>
								<option value="N">N</option>
								<option value="Y">Y</option>
							</select>
						</td>
						 --->
						<td>
							<select name="ddlb_AP_Ctznsp_Cd" class="forminputs"></select>
						</td> 
						<td>
							<select name="ddlb_AP_Ctznsp_Cd2" class="forminputs"></select>
						</td>
					</tr>
				</table>
				</cfoutput>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr>
		<td>
				<cfoutput>
				<!--- 
			 NVL(almn_cntct_ind,  'Y') AS almn_cntct_ind,
             NVL(almn_dcsd_ind,   'N') AS almn_dcsd_ind,
             NVL(almn_dsabld_ind, 'N') AS almn_dsabld_ind,
				<cfset client.AP_cntct_ind = #almn_cntct_ind#>
				<cfset client.AP_Dcsd = #almn_dcsd_ind#>
				<cfset client.AP_Dsabld = #almn_dsabld_ind#>
				 --->
				
				<table border="0">
					<tr class="c_fieldName">
						<td>Do&nbsp;Not&nbsp;Contact</td>
						<td>
							<cfif #client.AP_cntct_ind# EQ "N">
								<cfset local.vChecked = "checked">
							<cfelse>
								<cfset local.vChecked = "">
							</cfif>
							<input type="checkbox" name="cbx_AP_Cntct_Ind" value="#client.AP_cntct_ind#" #local.vChecked# onClick="JavaScript: f_cbxOnClickContact(this.name);">
							<input type="hidden" name="h_AP_Cntct_Ind" value="#client.AP_cntct_ind#">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>Deceased:</td>
						<td>
							<cfif #client.AP_Dcsd# EQ "Y">
								<cfset local.vChecked = "checked">
							<cfelse>
								<cfset local.vChecked = "">
							</cfif>
							<input type="checkbox" name="cbx_AP_Dcsd" value="N" #local.vChecked# onClick="JavaScript: f_cbxOnClick(this.name);">
							<input type="hidden" name="h_AP_Dcsd" value="#client.AP_Dcsd#">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>Disabled:</td>
						<td>
							<cfif #client.AP_Dsabld# EQ "Y">
								<cfset local.vChecked = "checked">
							<cfelse>
								<cfset local.vChecked = "">
							</cfif>
							<input type="checkbox" name="cbx_AP_Dsabld" value="#client.AP_Dsabld#" #local.vChecked# onClick="JavaScript: f_cbxOnClick(this.name);">
							<input type="hidden" name="h_AP_Dsabld" value="#client.AP_Dsabld#">
						</td>
					</tr>
				</table>
				</cfoutput>
				
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr><td>&nbsp;</td></tr>
	<!--- ................................................................... --->
	<tr>
		<td class="c_fieldName" bgcolor="#C7DD9C">
				<table width="100%"><tr><td width="35%">RESIDENCE ADDRESS</td><td width="65%">BUSINESS ADDRESS</td></tr></table>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr>
		<td>	
				
				<table width="100%" border="0">
					<tr>
						<td width="35%" valign="top">
							<cfoutput>
							<table border="0">
								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td valign="top" class="c_fieldName" width="35%">Street Address</td>
									<td><textarea name="txta_AP_Resdnc_Adrs_Txt" class="forminputs" cols="30" rows="5">#client.AP_Resdnc_Adrs_Txt#</textarea></td>
								</tr>
								<tr>
									<td class="c_fieldName">City</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Resdnc_City_Nm" value="#client.AP_Resdnc_City_Nm#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">State/Province</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Resdnc_State_Prvnc_Nm" value="#client.AP_Resdnc_State_Prvnc_Nm#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Postal Code</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Resdnc_Postl_CD" value="#client.AP_Resdnc_Postl_CD#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Country Of Residence</td>
									<td>
										<select name="ddlb_AP_Resdnc_Cntry_Cd" class="forminputs"></select>
									</td>
								</tr>
							</table>
							</cfoutput>
						</td>
						<td width="65%">
							<table border="0">
								<cfoutput>
								<tr>
									<td valign="top" class="c_fieldName"  width="25%">Institution/Company Name</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Bsns_Nm" value="#client.AP_Bsns_Nm#" size="90"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td valign="top" class="c_fieldName"  width="25%">Street Address</td>
									<td><textarea name="txta_AP_Bsns_Adrs_Txt" class="forminputs" cols="30" rows="5">#client.AP_Bsns_Adrs_Txt#</textarea></td>
								</tr>
								<tr>
									<td class="c_fieldName">City</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Bsns_City_Nm" value="#client.AP_Bsns_City_Nm#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">State/Province</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Bsns_State_Prvnc_Nm" value="#client.AP_Bsns_State_Prvnc_Nm#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Postal Code</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Bsns_Postl_CD" value="#client.AP_Bsns_Postl_CD#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Country Of Business</td>
									<td>
										<select name="ddlb_AP_Bsns_Cntry_Cd" class="forminputs"></select>
									</td>
								</tr>
								</cfoutput>
							</table>
						</td>
					</tr>
				</table>
				
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr>
		<td>
				<cfoutput>
				<table border="0">
					<tr>
						<td class="c_fieldName" width="56%">Preferred Address:</td>
						<td>
							<select name="ddlb_AP_Prfrd_Adrs_ind" class="forminputs">
								<option value="-1">=Select=</option>
								<option value="H">Residence</option>
								<option value="B">Business</option>
							</select>
						</td>
					</tr>
				</table>
				</cfoutput>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr><td>&nbsp;</td></tr>
	<!--- ................................................................... --->
	<tr>
		<td class="c_fieldName" bgcolor="#C7DD9C">
				<table width="100%"><tr><td>TITLE / PROFESSION INSTITUTION</td></tr></table>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr>
		<td width="50%">
			<table border="0" width="100%">
				<tr>
					<td width="50%">
						<table border="0">
							<tr>
								<td class="c_fieldName">Title</td>
								<td class="c_fieldName">Institution</td>
								<td class="c_fieldName">Current?</td>
								<td class="c_fieldName">Remove?</td>
							</tr>
							<cfif spr_getJob.recordCount EQ "0">
							<tr>
								<td colspan="4" class="c_fieldValue">
									&nbsp;
									<!--- No Job/Title availble for this Alumni. --->
								</td>
							</tr>
							<cfelse>
								<cfoutput query="spr_getJob" startrow="1" maxrows="#spr_getJob.recordCount#">
								<tr>
									<td class="c_fieldValue">#job_title_txt#</td>
									<td class="c_fieldValue">#job_instn_nm#</td>
									<td class="c_fieldValue"><!--- cbx_AP_Crnt_Ind_#job_num# --->
										<cfif #job_crnt_ind# EQ "Y">
											<cfset local.vChecked = "checked">
										<cfelse>
											<cfset local.vChecked = "">
										</cfif>
										<input type="checkbox" name="cbx_AP_Crnt_Ind_#job_num#" #local.vChecked#>
									</td>
									<td ><!-- checkbox to Delete Job -->
										<input type="checkbox" name="cbx_AP_Remove_#job_num#" >
										<!-- add :
											1) code to function f_UpdateAlmnRecord like for Crnt_Ind cbx ;
											2) parameters to ControllerDB part of  <cfcase value="UpdateAlmnRecord"> for the procedure call;
											3) modify DB procedure  sp_UpdateAlmnRecord - add arguments to signature and body and add code to delete jobs as for Crnt_Ind cbx ln.(3124 - 3141)
										 -->
									</td>
								</tr>
								</cfoutput>
							</cfif>
							<tr>
								<td><!--- #client.AP_New_title_txt# --->
									<input class="forminputs" type="text" name="txt_AP_New_title_txt" value="" size="30"
										   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
								</td>
								<td><!--- #client.AP_New_instn_nm# --->
									<input class="forminputs" type="text" name="txt_AP_New_instn_nm" value="" size="30"
										   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
								</td>
								<td>
									<cfif spr_getJob.recordCount EQ "0">
										<cfset local.JobNum = 1>
									<cfelse>
										<cfset local.JobNum = spr_getJob.recordCount + 1>
									</cfif>
									<cfoutput><!--- cbx_AP_Crnt_Ind_#local.JobNum# --->
									<input type="checkbox" name="cbx_AP_Crnt_Ind_#local.JobNum#" onClick="f_newOnClick(this.name);">
									</cfoutput>
									<input type="hidden" name="h_checked_cbx" value="0">
									<input type="hidden" name="h_NumOfLoops" value="0">
									<input type="hidden" name="h_remove_checked_cbx" value="0">
									<input type="hidden" name="h_Remove_NumOfLoops" value="0">
								</td>
							</tr>
						</table>
					</td>
					<td>
									<table border="0">
										<tr>
											<td class="c_fieldName">Prominent Category (if applies)</td>
										</tr>
										<tr>
											<td colspan="3" class="c_fieldValue">
												<select name="ddlb_AP_ALMN_PROMINENT_CD" class="forminputs"></select>
												<script language="javascript" type="text/javascript">
													
												</script>
											</td>
										</tr>
 								  </table>

					</td>
				</tr>
			</table>
		</td>
		
	</tr>
	<!--- ................................................................... --->
	<tr><td>&nbsp;</td></tr>
	<!--- ................................................................... --->
	<tr>
		<td class="c_fieldName" bgcolor="#C7DD9C">
				<table width="100%"><tr><td width="50%">PHONES</td><td width="50%">E_MAIL</td></tr></table>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr>
		<td>	
				<cfoutput>
				<table width="100%" border="0">
					<tr>
						<td width="50%">
							<table border="0">
								<tr>
									<td class="c_fieldName">Residence Phone</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Resdnc_Phone_Num" value="#client.AP_resdnc_phone_num#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Business Phone</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Bsns_Phone_Num" value="#client.AP_bsns_phone_num#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Cellular Phone</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Cell_Num" value="#client.AP_cell_num#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Other Phone</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Othr_Phone_Num" value="#client.AP_othr_phone_num#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Preferred Phone</td>
									<td>
										<select name="ddlb_AP_Prfrd_Phone_Num_Ind" class="forminputs">
											<option value="-1">=Select=</option>
											<option value="R">Residence</option>
											<option value="B">Business</option>
											<option value="C">Cellular</option>
											<option value="O">Other</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Fax</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Fax_Num" value="#client.AP_fax_num#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
							</table>
						</td>
						<td width="50%" valign="top">
							<table border="0">
								<tr>
									<td class="c_fieldName">E-Mail 1</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Email1_txt" value="#client.AP_email1_txt#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">E-Mail 2</td>
									<td>
										<input class="forminputs" type="text" name="txt_AP_Email2_txt" value="#client.AP_email2_txt#" size="30"
								   			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">Preferred Email</td>
									<td>
										<select name="ddlb_AP_Prfrd_Email_Num_Ind" class="forminputs">
											<option value="-1">=Select=</option>
											<option value="1">E-Mail 1</option>
											<option value="2">E-Mail 2</option>
										</select>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</cfoutput>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr><td>&nbsp;</td></tr>
	<!--- ................................................................... --->
	<tr>
		<td class="c_fieldName" bgcolor="#C7DD9C">
				<table width="100%"><tr><td width="50%">ADDITIONAL INFORMATION</td></tr></table>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr>
		<td valign="top">	
				<cfoutput>
				<table width="100%" border="0">
					<tr>
						<td width="50%" valign="top">
							<table border="0">
								<tr>
									<td class="c_fieldName">Interest</td>
									<td>
										<select name="ddlb_AP_Intrst" class="forminputs"></select>
									</td>
								</tr>
								<tr>
									
									<td class="c_fieldName">ELP Speak</td>
									<td>
										<select name="ddlb_AP_speak_level" class="forminputs">
											<option value="-1">=Select=</option>
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</td>
									<td rowspan="4" class="c_fieldValue">
										For ELP (English Language Proficiency) ratings, use the following scale:<br>
										&nbsp;&nbsp;<strong>0</strong> = No Proficiency<br>
										&nbsp;&nbsp;<strong>1</strong> = Elementary Proficiency<br>
										&nbsp;&nbsp;<strong>2</strong> = Limited Working Proficiency<br>
										&nbsp;&nbsp;<strong>3</strong> = General Professional Proficiency<br>
										&nbsp;&nbsp;<strong>4</strong> = Advanced Professional Proficiency<br>
										&nbsp;&nbsp;<strong>5</strong> = Native or Bilingual Proficiency
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">ELP Read</td>
									<td>
										<select name="ddlb_AP_read_level" class="forminputs">
											<option value="-1">=Select=</option>
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="c_fieldName">ELP Comprehend</td>
									<td>
										<select name="ddlb_AP_comp_level" class="forminputs">
											<option value="-1">=Select=</option>
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
									</td>
								</tr>
							</table>
							
						</td>
						<td width="50%" valign="top">
							<table border="0">
								<tr>
									<td class="c_fieldName" valign="top">Comments</td>
									<td>
										<textarea name="txta_AP_Notes_Txt" class="forminputs" rows="8" cols="45">#client.AP_notes_txt#</textarea>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				</cfoutput>
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr><td>&nbsp;</td></tr>
	<!--- ................................................................... --->
	<tr>
		<td align="right">
			<input type="button" name="cb_CloseNoSave" value="Close Without Saving" class="c_formbuttons" onClick="JavaScript: f_CloseNoSaving();">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" name="cb_Save" value="Save" class="c_formbuttons" onClick="JavaScript: f_UpdateAlmnRecord('UpdateAlmnRecord');">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<!--- <input name="cb_SaveClose" style="margin-right:300px; " type="button" value="Save & Close" class="c_formbuttons" onClick="JavaScript: f_backToSearchResults();"> --->
			<input name="cb_SaveClose" style="margin-right:300px; " type="button" value="Save & Close" class="c_formbuttons" onClick="JavaScript: f_UpdateAlmnRecord('UpdateAlmnRecord_BackToSearchReslt');">
		</td>
	</tr>
	<!--- ................................................................... --->
	<tr><td>&nbsp;</td></tr>
	<!--- ................................................................... --->
</table>
<!--- ... --->
<!--- ========================================================================================================================= --->
</div>
<script language="javascript" type="text/javascript">
//PREFIX
of_populateSelect( "ddlb_AP_Pfx", "-1", "=Select=", rowsPrfx, "orgBfrPrfx", "aitem_cd", "aitem_cd", "2D" );
of_selectedInDDLB ("ddlb_AP_Pfx", "<cfoutput>#client.AP_Pfx#</cfoutput>");
//self.document.forms[0].ddlb_AP_Pfx.focus();
//SEX
of_selectedInDDLB ("ddlb_AP_Sex", "<cfoutput>#client.AP_Sex#</cfoutput>");
//
//alert("cbx_AP_Cntct_Ind   "+self.document.forms[0].cbx_AP_Cntct_Ind.value)
//alert("cbx_AP_Dcsd   "+self.document.forms[0].cbx_AP_Dcsd.value)
//alert("cbx_AP_Dsabld  "+self.document.forms[0].cbx_AP_Dsabld.value)
//Deceased
//f_cbxOnClick("self.document.forms[0].cbx_AP_Dcsd");
//Disabled
//f_cbxOnClick("self.document.forms[0].cbx_AP_Dsabld");

//CNTRY OF Citizenship
of_populateSelect( "ddlb_AP_Ctznsp_Cd", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
of_selectedInDDLB ("ddlb_AP_Ctznsp_Cd", "<cfoutput>#client.AP_Ctznsp_Cd#</cfoutput>");
//CNTRY OF Citizenship 2
of_populateSelect( "ddlb_AP_Ctznsp_Cd2", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
of_selectedInDDLB ("ddlb_AP_Ctznsp_Cd2", "<cfoutput>#client.AP_Ctznsp_Cd2#</cfoutput>");
//Residence Country
of_populateSelect( "ddlb_AP_Resdnc_Cntry_Cd", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
of_selectedInDDLB ("ddlb_AP_Resdnc_Cntry_Cd", "<cfoutput>#client.AP_Resdnc_Cntry_Cd#</cfoutput>");
//Business Country
of_populateSelect( "ddlb_AP_Bsns_Cntry_Cd", "-1", "=== Select Country ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
of_selectedInDDLB ("ddlb_AP_Bsns_Cntry_Cd", "<cfoutput>#client.AP_Bsns_Cntry_Cd#</cfoutput>");
//Preferred Address
of_selectedInDDLB ("ddlb_AP_Prfrd_Adrs_ind", "<cfoutput>#client.AP_Prfrd_Adrs_ind#</cfoutput>");
//PROMINENT
of_populateSelect( "ddlb_AP_ALMN_PROMINENT_CD", "-1", "=== Select Prominent Category ===", rowsPC, "orgBfrPromCatg", "aitem_cd", "aitem_desc", "2D" );
of_selectedInDDLB ("ddlb_AP_ALMN_PROMINENT_CD", "<cfoutput>#client.AP_Prominent_CD#</cfoutput>"); 
//Preferred Phone
of_selectedInDDLB ("ddlb_AP_Prfrd_Phone_Num_Ind", "<cfoutput>#client.AP_prefrd_phone_num_ind#</cfoutput>");
//Preferred Email
of_selectedInDDLB ("ddlb_AP_Prfrd_Email_Num_Ind", "<cfoutput>#client.AP_prefrd_email_ind#</cfoutput>");
//English Speaking Level
of_selectedInDDLB ("ddlb_AP_speak_level", "<cfoutput>#client.AP_speak_level#</cfoutput>");
//English Reading Level
of_selectedInDDLB ("ddlb_AP_read_level", "<cfoutput>#client.AP_read_level#</cfoutput>");
//English Comprehention Level
of_selectedInDDLB ("ddlb_AP_comp_level", "<cfoutput>#client.AP_comp_level#</cfoutput>");
//Interest
of_populateSelect( "ddlb_AP_Intrst", "-1", "=== Select Interest ===", rowsINT, "orgBfrINT", "aintrst_cd", "aintrst_nm", "2D" );
of_selectedInDDLB ("ddlb_AP_Intrst", "<cfoutput>#client.AP_intrst#</cfoutput>");
//
//----------------------------------------------------------------------------------------------------------
function f_UpdateAlmnRecord(argAction){with(self.document.forms[0])
{
	var vValidationPassed = "YES";
	var vCbxNum = "";
	var vCbxNumTemp = "";
	var vCbxChecked = "";
	var vNumOfLoops = 0;
	//--- 
//code for the Remove? cbx
//<input type="checkbox" name="cbx_AP_Remove_#job_num#" >
//<input type="hidden" name="h_remove_checked_cbx" value="0">
//<input type="hidden" name="h_Remove_NumOfLoops" value="0">
	var vRmvCbxNum = "";
	var vRmvCbxNumTemp = "";
	var vRmvCbxChecked = "";
	var vRmvNumOfLoops = 0;

	if(txt_AP_Last_Nm.value == "") 
	{ 
		alert("Sorry, Information could not be updated without Last name");
		txt_AP_Last_Nm.focus();
		vValidationPassed = "NO";
	}
	
	if (vValidationPassed == "YES")
	{
		for (var e=0; e<elements.length; e++)
		{
			if ( (elements[e].type == 'checkbox') && (elements[e].name.substr(0,16) == "cbx_AP_Crnt_Ind_") )
			{//alert( elements[e].name.substr(16) )
				vCbxNumTemp = elements[e].name.substr(16)+"_";
				if ( eval(elements[e].name+".checked") )
				{
					vCbxChecked = "Y";
				}
				else
				{
					vCbxChecked = "N";
				}
				//
				vCbxNumTemp = vCbxNumTemp + vCbxChecked + ";"
				//
				vCbxNum = vCbxNum+vCbxNumTemp;
				vNumOfLoops++;
			}
			//code fore Remove? cbx
			else if ( (elements[e].type == 'checkbox') && (elements[e].name.substr(0,14) == "cbx_AP_Remove_") )
			{//alert( elements[e].name.substr(14) )
				vRmvCbxNumTemp = elements[e].name.substr(14)+"_";
				if ( eval(elements[e].name+".checked") )
				{
					vRmvCbxChecked = "Y";
				}
				else
				{
					vRmvCbxChecked = "N";
				}
				//
				vRmvCbxNumTemp = vRmvCbxNumTemp + vRmvCbxChecked + ";"
				//
				vRmvCbxNum = vRmvCbxNum+vRmvCbxNumTemp;
				vRmvNumOfLoops++;
			}
			
		}
		//
		if (vCbxNum.substr(0,  (parseInt(vCbxNum.length)-1) ) != "")
		{
			h_checked_cbx.value = vCbxNum.substr(0,  parseInt(vCbxNum.length) );
		}
		h_NumOfLoops.value = vNumOfLoops;
		//
		//code fore Remove? cbx
		if (vRmvCbxNum.substr(0,  (parseInt(vCRmvbxNum.length)-1) ) != "")
		{
			h_remove_checked_cbx.value = vRmvCbxNum.substr(0,  parseInt(vRmvCbxNum.length) );
		}
		h_Remove_NumOfLoops.value = vRmvNumOfLoops;
		//
		h_AP_Cntct_Ind.value = cbx_AP_Cntct_Ind.value;
		h_AP_Dcsd.value = cbx_AP_Dcsd.value;
		h_AP_Dsabld.value = cbx_AP_Dsabld.value;
		//
		
		of_CallFile(argAction);
	}
}}
//
//-----------------------------------------------------------------------------------------------------------
function f_backToSearchResults(){with(self.document.forms[0])
{
	of_CallFile("UpdAlmnRec_BackToSearchReslt");
}}
//
//-----------------------------------------------------------------------------------------------------------
function f_CloseNoSaving(){with(self.document.forms[0])
{
	of_CallFile('backToSearchResults');
	//history.back();
}}
//
//-----------------------------------------------------------------------------------------------------------
function f_newOnClick(argCntlName){with(self.document.forms[0])
{
	if (txt_AP_New_title_txt.value == "" && txt_AP_New_instn_nm.value == "" && eval(argCntlName+".checked") )
	{
		eval(argCntlName+".checked = false")
		alert("Sorry, Title and/or Institution must be provided before this box is checked.")
	}
}}
</script>