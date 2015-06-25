<!--- inc_EditUSER_p1.cfm --->
<!--- GA - Grant Access --->

<div class="story">
<cfif #client.Usr_Role_CD# EQ "1" OR #client.Usr_Role_CD# EQ "21" OR #client.Usr_Role_CD# EQ "304">
<!--- Show Everybody --->
	<table width="100%"  border="0" cellspacing="2" cellpadding="2">
	<cfloop query="spr_getListOfPendingUsers" startrow="1" endrow="#spr_getListOfPendingUsers.recordCount#">
	<cfoutput>
	<tr>
		<td>
			<cfif #usr_is_act# EQ "N">
				<cfset local.BG_Color = "CBD8FB"><!--- Light Blue --->
				<cfset local.BG_ColorNM = "A8C0FF">
			<cfelseif #usr_is_act# EQ "I">
				<cfset local.BG_Color = "F9FBCB"><!--- Light Yellow --->
				<cfset local.BG_ColorNM = "FBFF9E">
			<cfelseif #usr_is_act# EQ "A">
				<cfset local.BG_Color = "AEEEA3"><!--- Light Green --->
				<cfset local.BG_ColorNM = "A7D69F">
			</cfif>
			
			<table width="100%" border="0" bgcolor="#local.BG_Color#"  cellspacing="1" cellpadding="1">
				<tr>
					<td colspan="1" bgcolor="#local.BG_ColorNM#">
						<a href="##" onClick="JavaScript: f_Action(#usr_cd#);"><span id="id_Usr#usr_cd#">#usr_full_nm#</span></a>
					</td>
					<td  colspan="3" align="right">
						<cfinclude template="inc_GrantAccessCtrl.cfm">
					</td>
				</tr>
				<tr>
					<td width="20%">
						<span class="c_fieldName">Phone:</span>&nbsp;
						<span class="c_fieldValue">#usr_phone#&nbsp;<cfif #usr_ext# NEQ "">/&nbsp;Ext.#usr_ext#</cfif></span>
					</td>
					<td width="20%">
						<span class="c_fieldName">E-Mail:</span>&nbsp;
						<span class="c_fieldValue">#usr_email#</span>
					</td>
					<td width="30%">
						<span class="c_fieldName">Role:</span>&nbsp;
						<span class="c_fieldValue">#usr_role_nm#</span>
					</td>
					<td width="30%">
						<span class="c_fieldName">Status:</span>&nbsp;
						<span class="c_fieldValue">#is_act_nm#</span>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<cfset local.UsrID = #usr_cd#>
						<cfset local.AddCntryTemp = "">
						<cfset local.AddCntry = "">
						<table width="100%" border="0" cellspacing="1" cellpadding="1">
						<cfloop query="spr_getUsrCntry" startrow="1" endrow="#spr_getUsrCntry.recordCount#">
							<cfif #local.UsrID# EQ #usr_cntry_usr_id#>
								<cfif #usr_cntry_is_prmry# EQ "Y">
								<tr>
									<td width="40%">
										<span class="c_fieldName">Country / Post-City of Assignment:</span>&nbsp;
										<span class="c_fieldValue">#usr_cntry_cntry_nm# / <cfif #usr_cntry_city_post_nm# EQ "">n/a<cfelse>#usr_cntry_city_post_nm#</cfif></span>
									</td>
									<td width="30%">
										<span class="c_fieldName">Office Code:</span>&nbsp;
										<span class="c_fieldValue"><cfif #usr_cntry_cntry_cd# EQ "US">#usr_cntry_ofc_abbr#<cfelse>n/a</cfif></span>
									</td>
								</tr>
								<!--- ... --->
								<cfelseif #usr_cntry_is_prmry# EQ "N">
									<cfset local.AddCntryTemp = #usr_cntry_cntry_nm#>
									<cfset local.AddCntry = #local.AddCntry#&#local.AddCntryTemp#&", ">
								</cfif>
								<!--- ... --->
							</cfif>
						</cfloop>
							<tr>
								<td colspan="2">
									<span class="c_fieldName">Additional Countries:</span>&nbsp;
									<span class="c_fieldValue">
									<cfif #local.AddCntry# NEQ "">
										#Left(local.AddCntry, Len(local.AddCntry)-2)#
									<cfelse>
										n/a
									</cfif>
									</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<span class="c_fieldName">Comment:</span>&nbsp;
						
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</cfoutput>
	</cfloop>
	</div>
	</table>
<cfelseif #client.Usr_Role_CD# EQ "242">

<cfelse><!--- 241, 245, 306, 307 --->

</cfif>

<script language="javascript" type="text/javascript">
function f_Action(argUsrID){with(self.document.forms[0])
{
	h_GA_UsrID.value = argUsrID;
	of_CallFile("EditUsrAccs");
}}
</script>
