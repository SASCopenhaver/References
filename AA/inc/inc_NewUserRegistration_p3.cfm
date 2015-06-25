<!--- inc_NewUserRegistration.cfm --->
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getAppRoles#" output="spr_getAppRoles">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getCountry#" output="spr_getCountry">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getCityPost#" output="spr_getCityPost">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_get_DOS_OfficeCode#" output="spr_get_DOS_OfficeCode">
<input type="hidden" name="h_Submitted_YES_NO" value="NO">
<cfif isDefined("client.vSubmitted")>
	<script language="javascript" type="text/javascript">
		with(self.document.forms[0])
		{
			h_Submitted_YES_NO.value = "YES";
		}
	</script>
	<cfset local.DelClientVar = DeleteClientVariable("vSubmitted")>
</cfif>
<div class="feature">
	
<br>
	<cfoutput>
	<table width="85%%"  border=0 cellpadding=2 cellspacing=2 >
		<tr>
			<td width="30%"bgcolor="##CCCCCC">&nbsp;</td>
			<td width="40%" bgcolor="##CCCCCC"><span class="c_fieldName">Provided Personal Information</span></td>
			<td>&nbsp;<!--- TEST: client.NUR_Usr_ID = #client.NUR_Usr_ID# ---></td>
		</tr>
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">NAME</span></td>
			<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue"><!--- #client.NUR_Usr_ID# --->
				<cfif #client.NUR_Usr_Prfx# EQ -1>
					<cfset local.NUR_Usr_Prfx = "">
				<cfelse>
					<cfset local.NUR_Usr_Prfx = client.NUR_Usr_Prfx>
				</cfif>
				<strong>#local.NUR_Usr_Prfx#&nbsp;#client.NUR_Usr_FName#&nbsp;#client.NUR_Usr_MI#&nbsp;#client.NUR_Usr_LName#</strong>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">Phone</span></td>
			<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue">
				#client.NUR_Usr_Phone#
				<cfif #client.NUR_Usr_Ext# NEQ "">
					&nbsp;&nbsp;&nbsp;Ext.#client.NUR_Usr_Ext#
				</cfif>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">E-Mail</span></td>
			<td width="40%" bgcolor="##EFEFEF"class="c_fieldValue">#client.NUR_Usr_Email#</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<cfset local.Len_NUR_Usr_Pass = Len(client.NUR_Usr_Pass)>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">LogIn Name&nbsp;/&nbsp;Password</span></td>
			<!--- <td width="40%" bgcolor="##EFEFEF"class="c_fieldValue">#client.NUR_Usr_UserName#&nbsp;/&nbsp;#client.NUR_Usr_Pass#</td> --->
			<td width="40%" bgcolor="##EFEFEF"class="c_fieldValue">#client.NUR_Usr_UserName#&nbsp;/&nbsp;<cfloop index="i" from="1" to="#local.Len_NUR_Usr_Pass#"><strong>&middot;</strong></cfloop></td>
			<td>&nbsp;</td>
		</tr>
		<!--- ........................................................................... --->
		<cfloop query="spr_getAppRoles" startrow="1" endrow="#spr_getAppRoles.recordCount#">
			<cfif #client.NUR_Usr_RoleCD# EQ #app_role_id#>
				<cfset client.NUR_Usr_AlumniArchiveRole_NM = #app_role_nm#>
				<cfbreak>
			</cfif>
		</cfloop>
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">DOS Alumni Archive Role</span></td>
			<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue">#client.NUR_Usr_AlumniArchiveRole_NM#</td>
			<td>&nbsp;</td>
		</tr>
		<!--- ........................................................................... --->
		<cfloop query="spr_getCountry" startrow="1" endrow="#spr_getCountry.recordCount#">
			<cfif #client.NUR_Usr_CountryOfAssignmt_CD# EQ #cntry_cntry_cd#>
				<cfset local.NUR_Usr_CountryOfAssignmt_NM = #cntry_cntry_nm#>
				<cfbreak>
			</cfif>
		</cfloop>
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">Country of Assignment</span></td>
			<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue">#local.NUR_Usr_CountryOfAssignmt_NM#</td>
			<td></td>
		</tr>
		<!--- ........................................................................... --->
		<cfif #client.NUR_Usr_CountryOfAssignmt_CD# EQ "US">
			<cfloop query="spr_get_DOS_OfficeCode" startrow="1" endrow="#spr_get_DOS_OfficeCode.recordCount#">
				<cfif #client.NUR_DOS_OfficeCode_CD# EQ #usr_cntry_ofc_abbr#>
					<cfset local.NUR_DOS_OfficeCode_CD = #usr_cntry_ofc_abbr#>
					<cfbreak>
				</cfif>
			</cfloop>
			<tr>
				<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">DOS Office Code</span></td>
				<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue">#local.NUR_DOS_OfficeCode_CD#</td>
				<td>&nbsp;</td>
			</tr>
		<!--- <cfelse>
			<cfset local.NUR_DOS_OfficeCode_CD = "&nbsp;"> --->
		</cfif>
		<!--- ........................................................................... --->
		<cfif #client.NUR_Usr_CityPostOfAssignmt_NM# EQ -1>
			<cfset local.NUR_Usr_CityPostOfAssignmt_NM = "">
		<cfelse>
			<cfset local.NUR_Usr_CityPostOfAssignmt_NM = client.NUR_Usr_CityPostOfAssignmt_NM>
		</cfif>
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">Post/City of Assignment</span></td>
			<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue">#local.NUR_Usr_CityPostOfAssignmt_NM#</td>
			<td>&nbsp;</td>
		</tr>
		<!--- ........................................................................... --->
		<cfif #client.NUR_Usr_NewCityPostOfAssignmt# EQ "">
			<cfset local.NUR_Usr_NewCityPostOfAssignmt = "n/a">
		<cfelse>
			<cfset local.NUR_Usr_NewCityPostOfAssignmt = client.NUR_Usr_NewCityPostOfAssignmt>
		</cfif>
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">New Post/City</span></td>
			<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue">#local.NUR_Usr_NewCityPostOfAssignmt#</td>
			<td>&nbsp;</td>
		</tr>
		<!--- ........................................................................... --->
		<cfif #client.NUR_Usr_AddnlCountries_NM# EQ "">
			<cfset local.NUR_Usr_AddnlCountries_NM = "n/a">
		<cfelse>
			<cfset local.NUR_Usr_AddnlCountries_NM = client.NUR_Usr_AddnlCountries_NM>
		</cfif>
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">Additional Country(ies)</span></td>
			<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue" >#local.NUR_Usr_AddnlCountries_NM#</td>
			<td>&nbsp;<!--- TEST: #client.NUR_Usr_AddnlCountry_CD# ---></td>
		</tr>
		<!--- ........................................................................... --->
		<cfif #client.NUR_Usr_Depart_Dt# EQ "">
			<cfset local.NUR_Usr_Depart_Dt = "n/a">
		<cfelse>
			<cfset local.NUR_Usr_Depart_Dt = client.NUR_Usr_Depart_Dt>
		</cfif>
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">Estimated date of final departure</span></td>
			<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue">#local.NUR_Usr_Depart_Dt#</td>
			<td>&nbsp;</td>
		</tr>
		<!--- ........................................................................... --->
		<tr>
			<td width="30%" bgcolor="##EFEFEF"><span class="c_fieldName">Security Question / Answer</span></td>
			<td width="40%" bgcolor="##EFEFEF" class="c_fieldValue">#client.NUR_Usr_SecQ_Txt#&nbsp;/&nbsp;#client.NUR_Usr_Answer#</td>
			<td>&nbsp;</td>
		</tr>
		<!--- ........................................................................... --->
		<tr><td colspan="3"><hr></td></tr><!--- <tr><td colspan="3">&nbsp;</td></tr> --->
		<tr>
			<td valign="top"><span class="c_fieldName">DOS Authorizing Agent</span></td>
			<!--- <td valign="top"><select name="ddlb_NUR_Usr_AuthAgent" class="forminputs"></select></td> --->
			<td valign="top" class="c_fieldValue">
				<!--- <cfoutput> --->
				#client.NUR_AuthAgnt_FullName# - #client.NUR_AuthAgnt_Role_Nm#<br>
				#client.NUR_AuthAgnt_Phone#&nbsp;<cfif #client.NUR_AuthAgnt_Ext# NEQ "">Ext.: #client.NUR_AuthAgnt_Ext#</cfif><br>
				#client.NUR_AuthAgnt_Email#
		 		<!--- </cfoutput> --->
			</td>
			<td>&nbsp;</td>
			<!--- 
			<td class="c_Format">List of Authorizing Agents depends upon:<br>
								&not; "DOS Alumni Archive Role",<br>
								&not; "Country of Assignment",<br>
								&not; "Post/City of Assignment"<br>
								<br>
								If name is not available, please indicate it in "Comments".
								<br>&nbsp;
			</td>
			 --->
		</tr>
		<tr>
			<td valign="top" bgcolor="##EFEFEF"><span class="c_fieldName">Comments</span></td>
			<td  bgcolor="##EFEFEF">
				<textarea name="txta_NUR_Usr_Comments" rows="5" cols="45" class="forminputs" onKeyUp="f_CharCount(this.value);">#client.NUR_Usr_Comments#</textarea>		
				<cfset local.ctrl_help_ID = "8">
				<cfinclude template="../Ctrl_Help.cfm">	
			</td>
			<td valign="top" class="c_Format" bgcolor="##EFEFEF">
				Available limit to your message is 1000 characters.<br><br><span id="id_CharCount"></span>
			</td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<!--- <td>&nbsp;</td> --->
			<td align="center" colspan="2">
				<!--- <a href="##" onClick="JavaScript: f_Back();" ><strong>Back</strong></a> --->
				<input type="button" value="Back" class="c_formbuttons" onClick="JavaScript: f_Back();">
				&nbsp;&nbsp;&nbsp;
				<!--- <a href="##" onClick="JavaScript: f_Validate();" ><strong>Submit</strong></a> --->
				<input type="button" value="Submit" class="c_formbuttons" onClick="JavaScript: f_Validate();">
				<!--- &nbsp;&nbsp;&nbsp; --->
				<!--- <a href="##" onClick="JavaScript: f_PrintPreview();" ><strong>Print Preview</strong></a> --->
				<!--- <input type="button" value="Fax/Print Preview" class="c_formbuttons" onClick="JavaScript: f_PrintPreview();"> --->
			</td>
			<td valign="top" class="c_Format">Click 'Back' to correct personal information</td>
		</tr>
	</table>
	
	</cfoutput>
</div> 
<script language="javascript" type="text/javascript">
//
if (self.document.forms[0].txta_NUR_Usr_Comments.value.length != 0)
{
	f_CharCount(self.document.forms[0].txta_NUR_Usr_Comments.value);
}
//
//----------------------------------------------------------------------------------------------------------------------
function f_Validate(){with(self.document.forms[0])
{//alert(ddlb_NUR_Usr_Prfx.value)
	var vNextCtrl = "YES";
	
	if (vNextCtrl == "YES")
	{
		//if ( confirm("Do you want submit provided information?") )
		//{
			of_CallFile("InsUpdNewUserRegistration");
		//}
	}
	//
}}
//
//----------------------------------------------------------------------------------------------------------------------
//
function f_Back()
{
	of_CallFile("BackToNewUserRegistration");
}
//
//-----------------------------------------------------------------------------------------------------------------------
function f_PrintPreview(){with(self.document.forms[0])
{//	alert("Print")
	var vSubmitted = h_Submitted_YES_NO.value;
	//vSubmitted = "YES";
	if (vSubmitted == "YES")
	{//alert(vSubmitted)
		f_openFaxPage("<cfoutput>#client.NUR_Usr_ID#</cfoutput>");
	}
	else
	{
		if ( confirm("Sorry, requested information cannot be printed before it was saved.\nDo you want to save your registration information.") )
		{
			of_CallFile("InsUpdNewUserRegistration");
		}
	}
 }}
//
//---------------------------------------------------------------------------------------------------------------------
////////////////////////////////////////////
function f_openFaxPage(arg_NUR_Usr_ID)
{//alert(arg_NUR_Usr_ID)
	var popupPage = "popupNUR_Fax.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&url_NUR_Usr_ID="+arg_NUR_Usr_ID;
	var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=550,height=230','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
}


//
//---------------------------------------------------------------------------------------------------------------------
function f_CharCount(argString){with(self.document.forms[0]){
	of_innerHTML("id_CharCount", "'Your message is "+argString.length+" characters long.'");
}}
//
//of_innerHTML("id_CharCount", "'"+self.document.forms[0].txta_NUR_Usr_Comments.value.length+"'");
</script>
