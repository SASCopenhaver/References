<!--- inc_ListUsr_Active_p1.cfm --->
<script language="javascript" type="text/javascript">
function f_Action(argUsrID){with(self.document.forms[0])
{
	h_GA_UsrID.value = argUsrID;
	//
	h_UsrAddCntryCD.value = eval("h_UsrAddCntryCD"+argUsrID+".value");
	h_UsrAddCntryNM.value = eval("h_UsrAddCntryNM"+argUsrID+".value");
	//
	of_CallFile("UserProfile");
}}
//
</script>
<input type="hidden" name="h_ListType" value="402">
<input type="hidden" name="h_GA_UsrID" value="">

<input type="hidden" name="h_UsrAddCntryCD" value="">
<input type="hidden" name="h_UsrAddCntryNM" value="">

<input type="hidden" name="h_GA_UsrFullNm">
<input type="hidden" name="h_GA_UsrEMail">
<input type="hidden" name="h_GA_UsrRole">


<div class="story">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getAlphaSearch#" output="spr_getAlphaSearch">
<cfif #spr_getListOfUsers.recordCount# EQ 0>
	<h3>Sorry, there are no users in this category.</h3>
<cfelse>
	<!--- ------------------------------- --->
	<cfinclude template="inc_FilterUsrRecords.cfm">
	<!--- ------------------------------- --->
	<cfif #spr_getListOfUsers.recordCount# GT 5>
		<cfinclude template="inc_AlphaSearch.cfm">
	</cfif>
	<!--- ------------------------------- --->
	<table  width="100%"  border="0" cellspacing="1" cellpadding="1">
	<cfloop query="spr_getListOfUsers" startrow="1" endrow="#spr_getListOfUsers.recordCount#">
	<cfoutput>
		<!---  --->
		<!--- <cfif #usr_cntry_is_prmry# EQ "Y" AND #usr_cd# EQ #local.TempUsrCD#> --->
		<cfif #usr_cntry_is_prmry# EQ "Y">
		<cfset local.TempUsrCD = #usr_cd#>
		<tr>
			<td valign="top">
				<table width="100%" border="0" cellspacing="1" cellpadding="1">
					
					<tr>
						<td width="20%" valign="top">
							<input type="hidden" name="h_UsrNm#usr_cd#" value="#usr_full_nm#">
							<a href="##" name="#usr_lname_alpha#" onClick="JavaScript: f_Action(#usr_cd#);">
							<span style="text-decoration:underline;" id="id_Usr#usr_cd#">#usr_full_nm#</span>
							</a>
						</td>
						<td width="40%">
							<span class="c_fieldName">Country / Post-City of Assignment:</span>&nbsp;
							<span class="c_fieldValue">#usr_cntry_cntry_nm# / <cfif #usr_cntry_city_post_nm# EQ "">none<cfelse>#usr_cntry_city_post_nm#</cfif></span>
						</td>
						<td valign="top">
							<input type="hidden" name="h_UsrRole#usr_cd#" value="#usr_role_cd#">
							<span class="c_fieldName">Role:</span>&nbsp;
							<span class="c_fieldValue">#usr_role_nm#</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="c_fieldName">Phone:</span>&nbsp;
							<span class="c_fieldValue">#usr_phone#&nbsp;<cfif #usr_ext# NEQ "">/&nbsp;Ext.#usr_ext#</cfif></span>
						</td>
						<td>
							<input type="hidden" name="h_UsrEMail#usr_cd#" value="#usr_email#">
							<span class="c_fieldName">E-Mail:</span>&nbsp;
							<span class="c_fieldValue">#usr_email#</span>
						</td>
						<td>
							<span class="c_fieldName">Status:</span>&nbsp;
							<span class="c_fieldValue">#is_act_nm#</span>
						</td>
					</tr>
					<!--- ................................................................................. --->
					<cfset local.AddCntryTemp = "">
					<cfset local.AddCntry = "">
					<cfset local.AddCntryTempCD = "">
					<cfset local.AddCntryCD = "">
					
					<cfloop query="spr_getListOfUsers" startrow="1" endrow="#spr_getListOfUsers.recordCount#">
						<cfif local.TempUsrCD EQ #usr_cd# AND #usr_cntry_is_prmry# EQ "N">
							<cfset local.AddCntryTemp = #usr_cntry_cntry_nm#>
							<cfset local.AddCntry = #local.AddCntry#&#local.AddCntryTemp#&", ">
							
							<cfset local.AddCntryTempCD = #usr_cntry_cntry_cd#>
							<cfset local.AddCntryCD = #local.AddCntryCD#&#local.AddCntryTempCD#&", ">
						</cfif>
					</cfloop>
					<cfif #local.AddCntry# EQ "">
						<cfset local.AddCntry = "No additional countries.">
					<cfelseif #local.AddCntry# EQ "*">
						<cfset local.AddCntry = "All countries.">
					<cfelse>
						<cfset local.AddCntry = #Left(local.AddCntry, Len(local.AddCntry)-2)#>
					</cfif>
					<!--- --- --->
					<!--- --- --->
					<cfset local.OfficeAbbr = "n/a">
					<cfif #usr_cntry_cntry_cd# EQ "US">
						<cfif #usr_cntry_ofc_abbr# EQ "">
							<cfset local.OfficeAbbr = "Not selected">
						<cfelse>
							<cfset local.OfficeAbbr = #usr_cntry_ofc_abbr#>
						</cfif>
					</cfif>
					<tr>
						<td colspan="2">
							<span class="c_fieldName">Additional Countries:</span>&nbsp;
							<span class="c_fieldValue">#local.AddCntry#</span>
							<input type="hidden" name="h_UsrAddCntryCD#usr_cd#" value="#local.AddCntryCD#">
							<input type="hidden" name="h_UsrAddCntryNM#usr_cd#" value="#local.AddCntry#">
						</td>
						<td>
							<span class="c_fieldName">Office Code:</span>&nbsp;
							<span class="c_fieldValue">#local.OfficeAbbr#</span>
						</td>
					</tr>
					<!--- ................................................................................. --->
					<tr>
						<td colspan="4">
							<cfset local.UsrComments = "No comments">
							<span class="c_fieldName">Comments:</span>&nbsp;
							<cfloop query="spr_getUsrComment" startrow="1" endrow="#spr_getUsrComment.recordCount#">
								<cfif #local.TempUsrCD# EQ #usr_comnt_usr_id#>
									<cfif #usr_comnt_comnt_txt# EQ "">
										<cfset local.UsrComments = "No comments">
									<cfelse>
										<cfset local.UsrComments = #usr_comnt_comnt_txt#>
										<cfbreak>
									</cfif>
								</cfif>
							</cfloop>
							<span class="c_fieldValue">#local.UsrComments#</span>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<cfset local.UsrComments = "No requested changes">
							<span class="c_fieldName">Requested Changes:</span><br>
							<cfloop query="spr_getUsrComment" startrow="1" endrow="#spr_getUsrComment.recordCount#">
								<cfif #local.TempUsrCD# EQ #usr_comnt_usr_id#>
									<cfif #usr_comnt_reqchg_txt# EQ "">
										<cfset local.UsrComments = "No requested changes">
									<cfelse>
										<cfset local.UsrComments = #usr_comnt_reqchg_txt#>
										<cfbreak>
									</cfif>
								</cfif>
							</cfloop>
							<span class="c_fieldValue">#local.UsrComments#</span>
						</td>
					</tr>
					<!--- ................................................................................. --->
					
				</table>
			</td>
			<td width="9%">&nbsp;
				<!--- <cfinclude template="inc_AccsCtrl.cfm"> --->
			</td>
		</tr>
		<tr><td colspan="2"><hr></td></tr>
	
	</cfif>
	</cfoutput>
	</cfloop>
	</table>
	
	
</cfif>
</div>
