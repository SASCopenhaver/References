<!--- inc_EditROLE_p2.cfm --->
<!--- ------------------------------------------------------------------------------ --->
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getAppRoles#" output="spr_getAppRoles">
<cfinclude template="../JS/incJS_AppRoles.cfm">
<!--- ------------------------------------------------------------------------------ --->
<cfinclude template="../JS/incJS_AllNavigationItems.cfm">
<!--- ------------------------------------------------------------------------------ --->
<cfinclude template="../JS/incJS_UserRole_NavigItem.cfm">
<!--- ------------------------------------------------------------------------------ --->
<script language="javascript" type="text/javascript">
//
//------------------------------------------------------------------------------
function f_arraySortASC(a,b)
{
	a = parseInt(a.ast_seq);
	b = parseInt(b.ast_seq);
	//alert(a+"   "+b)
	//return ( (a < b) ? 1 : ((a > b) ? -1 : 0) );//DESC order
	return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );//ASC order
}

//
//------------------------------------------------------------------------------
function f_FilterGL()
{
	fGL_BfrANI = new Array();//filtered Global Baffer All Navigation Items
	var gl=0;
	for (var ani=0; ani<rowsANI; ani++)
	{
		if (orgBfrANI[ani].ast_loc == "GL")
		{
			fGL_BfrANI[gl] = new arrayANI(
											orgBfrANI[ani].ast_id
										   ,orgBfrANI[ani].ast_nm
										   ,orgBfrANI[ani].ast_loc
										   ,orgBfrANI[ani].ast_parent_id
										   ,orgBfrANI[ani].ast_is_act
										   ,orgBfrANI[ani].ast_seq
										   ,orgBfrANI[ani].ast_call_file
										)
			gl++;
		}
	}
	//
	if (fGL_BfrANI.length > 0)
	{
		fGL_BfrANI.sort(f_arraySortASC);
	}
}
//
//---------------------------------------------------------------------------------------
function f_FilterSG(argGL_ID){
	fSG_BfrANI = new Array();
	var sg = 0;
	var vRtnOutput = "";
	for (var ani=0; ani<rowsANI; ani++)
	{
		if (orgBfrANI[ani].ast_loc == "SG" && orgBfrANI[ani].ast_parent_id == argGL_ID)
		{
			fSG_BfrANI[sg] = new arrayANI(
											orgBfrANI[ani].ast_id
										   ,orgBfrANI[ani].ast_nm
										   ,orgBfrANI[ani].ast_loc
										   ,orgBfrANI[ani].ast_parent_id
										   ,orgBfrANI[ani].ast_is_act
										   ,orgBfrANI[ani].ast_seq
										   ,orgBfrANI[ani].ast_call_file
										)
			sg++;
		}
	}
	//
	if (fSG_BfrANI.length > 0)
	{
		fSG_BfrANI.sort(f_arraySortASC);
		//
		vRtnOutput += "<table width=\"100%\" border=0 cellspacing=0 cellpadding=0>";
		for (var sg=0; sg<fSG_BfrANI.length; sg++)
		{
			vRtnOutput += "<tr>";
				//vRtnOutput += " <td width=\"20%\">&nbsp;</td>";
				vRtnOutput += "<td width=\"20%\">";
					vRtnOutput += "<input type=\"radio\" name=\"rb_"+fSG_BfrANI[sg].ast_id+"\" value=\"Y\"><font class=\"c_fieldNameGreen\">Yes</font>";
					vRtnOutput += "&nbsp;&nbsp;";
					vRtnOutput += "<input type=\"radio\" name=\"rb_"+fSG_BfrANI[sg].ast_id+"\" value=\"N\"><font class=\"c_fieldNameRed\">No</font>";
				vRtnOutput += "</td>";
				vRtnOutput += "<td  class=\"c_fieldName\">";
				vRtnOutput += fSG_BfrANI[sg].ast_nm;
				vRtnOutput += "</td>";
				vRtnOutput += "<td>&nbsp;</td>";
			vRtnOutput += "</tr>";
		}
		vRtnOutput += "</table>";
		//
	}
	else
	{
		vRtnOutput = "&nbsp;";
	}
	//
	return vRtnOutput;
}
//
//------------------------------------------------------------------------------
function f_FilterUT()
{
	fUT_BfrANI = new Array();//filtered Global Baffer All Navigation Items
	var ut=0;
	for (var ani=0; ani<rowsANI; ani++)
	{
		if (orgBfrANI[ani].ast_loc == "UT")
		{
			fUT_BfrANI[ut] = new arrayANI(
											orgBfrANI[ani].ast_id
										   ,orgBfrANI[ani].ast_nm
										   ,orgBfrANI[ani].ast_loc
										   ,orgBfrANI[ani].ast_parent_id
										   ,orgBfrANI[ani].ast_is_act
										   ,orgBfrANI[ani].ast_seq
										   ,orgBfrANI[ani].ast_call_file
										)
			ut++;
		}
	}
	//
	if (fUT_BfrANI.length > 0)
	{
		fUT_BfrANI.sort(f_arraySortASC);
	}
}
//
//------------------------------------------------------------------------------------------------------------
function f_checkRadioButtons(){with(self.document.forms[0]){
	var rb_ST_ID = 0;
	var vRoleID = ddlb_app_role_nm.options[ddlb_app_role_nm.options.selectedIndex].value;
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].type == "radio")
		{
			rb_ST_ID = elements[e].name.substr(3);//alert(elements[e].name+"  "+rb_ST_ID)
			
			
			for (var urni=0; urni<rowsURNI; urni++)
			{//orgBfrURNI[urni].astr_st_id, orgBfrURNI[urni].astr_r_id
				
				
				if (orgBfrURNI[urni].astr_r_id == vRoleID && orgBfrURNI[urni].astr_st_id == rb_ST_ID)
				{
					//alert(orgBfrURNI[urni].astr_st_id+"   "+orgBfrURNI[urni].astr_r_id)
					////alert(orgBfrURNI[urni].astr_st_id+"  "+ rb_ST_ID)
					eval("rb_"+rb_ST_ID+"[0].checked = true");
					eval("rb_"+rb_ST_ID+"[1].checked = false");
					break;
				}
				else
				{
					//alert(orgBfrURNI[urni].astr_st_id+"  "+ rb_ST_ID)
					eval("rb_"+rb_ST_ID+"[0].checked = false");
					eval("rb_"+rb_ST_ID+"[1].checked = true");
				}
				
			}//end of for loop
			
			
			/////////////////////////////////////
		}//end of if
	}//end of for loop
}}
</script>
<!--- ------------------------------------------------------------------------------ --->
<cfif client.app_role_id EQ "0">
	<cfset local.app_role_id = "0">
	<!--- <cfset local.app_role_cd = ""> --->
	<cfset local.app_role_nm = "">
	<cfset local.app_role_desc = "">
	<cfset local.app_role_super_id = "-1">
	<cfset local.app_role_super_nm = "">
<cfelse>
	<cfloop query="spr_getAppRoles" startrow="1" endrow="#spr_getAppRoles.recordCount#">
		<cfif client.app_role_id EQ #app_role_id#>
			<cfset local.app_role_id = #app_role_id#>
			<!--- <cfset local.app_role_cd = #app_role_cd#> --->
			<cfset local.app_role_nm = #app_role_nm#>
			<cfset local.app_role_desc = #app_role_desc#>
			<cfset local.app_role_super_id = #app_role_super_id#>
			<cfset local.app_role_super_nm = #app_role_super_nm#>
			<cfbreak>
		</cfif>
	</cfloop>
</cfif>
<div class="story">
<cfoutput>
<input type="hidden" name="h_app_role_id" value="#local.app_role_id#">
<input type="hidden" name="h_ValsFromRadioButtons">
<table align="center" border="0" cellspacing="2" cellpadding="2"><!--- width="70%" --->
	<tr>
		<td class="c_fieldName" valign="top">Role Name</td>
		<td>
			<select name="ddlb_app_role_nm" class="forminputs" onChange="f_onChangeRoleName(this.value)"></select>&nbsp;&nbsp;
			<!--- <div id="id_NewRoleNm"> --->
				<input type="text" class="forminputs" name="txt_app_role_nm" size="45" value="#local.app_role_nm#" onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);" >
			<!--- </div> --->
		</td>
			
			
	</tr>
	<tr>
		<td class="c_fieldName" >Role Description</td>
		<td><input type="text" class="forminputs" name="txt_app_role_desc" size="99" value="#local.app_role_desc#"
			onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
			>
		</td>
	</tr>
	<tr>
		<td class="c_fieldName" >Authorizing Agent Role</td>
		<td><select name="ddlb_app_role_super_id" class="forminputs"></select></td>
	</tr>
	<!--- ------------------------------------------------------------------------------------------------------------ --->
	<tr><td colspan="2"><hr></td></tr>
	<!--- ------------------------------------------------------------------------------------------------------------ --->
	<tr>
		<td colspan="2">
			<script language="javascript" type="text/javascript">
				f_FilterGL();
				//
				if (fGL_BfrANI.length > 0)
				{
					var vOutput = "";
					vOutput += "<table width=\"100%\" border=0 cellspacing=0 cellpadding=0>";
					vOutput += "<tr><td  colspan=3><strong>Action Page Access:</strong></td></tr>";
					for (var gl=0; gl<fGL_BfrANI.length; gl++)
					{
						vOutput += "<tr>";
							vOutput += "<td width=\"15%\">";
								vOutput += "<input type=\"radio\" name=\"rb_"+fGL_BfrANI[gl].ast_id+"\" value=\"Y\"><font class=\"c_fieldNameGreen\">Yes</font>";
								vOutput += "&nbsp;&nbsp;";
								vOutput += "<input type=\"radio\" name=\"rb_"+fGL_BfrANI[gl].ast_id+"\" value=\"N\"><font class=\"c_fieldNameRed\">No</font>";
							vOutput += "</td>";
							vOutput += "<td  class=\"c_fieldName\">";
							vOutput += fGL_BfrANI[gl].ast_nm;
							vOutput += "</td>";
							vOutput += "<td>&nbsp;</td>";
							//vOutput += "<td>"+f_FilterSG(fGL_BfrANI[gl].ast_id);+"</td>";
						vOutput += "</tr>";
						//
						vOutput += "<tr>";
						vOutput += " <td colspan=3>"+f_FilterSG(fGL_BfrANI[gl].ast_id);+"</td>";
						vOutput += "</tr>";
					}
					//
					vOutput += "<tr><td  colspan=3>&nbsp;</td></tr>";
					vOutput += "<tr><td  colspan=3><strong>Utility Page Access:</strong></td></tr>";
					//
					//-------------------------------------------------------------------------------------------------------------------------------
					//  Utility Output:
					//
					f_FilterUT();
					//
					for (var ut=0; ut<fUT_BfrANI.length; ut++)
					{
						vOutput += "<tr>";
							vOutput += "<td width=\"15%\">";
								vOutput += "<input type=\"radio\" name=\"rb_"+fUT_BfrANI[ut].ast_id+"\" value=\"Y\"><font class=\"c_fieldNameGreen\">Yes</font>";
								vOutput += "&nbsp;&nbsp;";
								vOutput += "<input type=\"radio\" name=\"rb_"+fUT_BfrANI[ut].ast_id+"\" value=\"N\"><font class=\"c_fieldNameRed\">No</font>";
							vOutput += "</td>";
							vOutput += "<td  class=\"c_fieldName\">";
							vOutput += fUT_BfrANI[ut].ast_nm;
							vOutput += "</td>";
							vOutput += "<td>&nbsp;</td>";
							//vOutput += "<td>"+f_FilterSG(fGL_BfrANI[gl].ast_id);+"</td>";
						vOutput += "</tr>";
						//
					}
					//
					vOutput += "</table>";
					//
					//------------------------------------------------------------------------------------------------
					document.write(vOutput);
				}
				
			</script>
		</td>
	</tr>
	<!--- ------------------------------------------------------------------------------------------------------------ --->
	<tr><td colspan="2"><hr></td></tr>
	<!--- ------------------------------------------------------------------------------------------------------------ --->
	<tr>
		<td>&nbsp;</td>
		<td align="right">
			<a href="##" onClick="f_Validate();"><strong>Submit</strong></a>
			<!--- &nbsp;&nbsp;&nbsp;&nbsp;
			<a href="##" onClick="f_Reset();"><strong>Reset/New</strong></a> --->
		</td>
	</tr>
</table>
</cfoutput>
</div>
<script language="javascript" type="text/javascript">
//
if ("<cfoutput>#local.app_role_id#</cfoutput>" == 0) 
{ 
	of_populateSelect( "ddlb_app_role_nm", "-1", "=== Create New Role ===", rowsAR, "orgBfrAR", "aapp_role_id", "aapp_role_nm", "2D" );
	of_selectedInDDLB ("ddlb_app_role_nm", "-1"); 
}
else 
{ 
	of_populateSelect( "ddlb_app_role_nm", "-1", "=== Create New Role ===", rowsAR, "orgBfrAR", "aapp_role_id", "aapp_role_nm", "2D" );
	of_selectedInDDLB ("ddlb_app_role_nm", "<cfoutput>#local.app_role_id#</cfoutput>"); 
}
//
of_populateSelect( "ddlb_app_role_super_id", "-1", "=== Select Role ===", rowsAR, "orgBfrAR", "aapp_role_id", "aapp_role_nm", "2D" );
of_selectedInDDLB ("ddlb_app_role_super_id", "<cfoutput>#local.app_role_super_id#</cfoutput>");

//
f_checkRadioButtons();
//-------------------------------------------------------------------------------------------------------------
function f_onChangeRoleName(argRoleID){with(self.document.forms[0])
{//ddlb_app_role_nm  ddlb_app_role_super_id
	if (argRoleID == -1)
	{
		txt_app_role_desc.value = "";
		of_selectedInDDLB ("ddlb_app_role_super_id", "-1");
		//
		txt_app_role_nm.value = "";
		
	}
	else
	{
		for (var ar=0; ar<rowsAR; ar++)
		{
			if (orgBfrAR[ar].aapp_role_id == argRoleID)
			{
				txt_app_role_desc.value = orgBfrAR[ar].aapp_role_desc;
				of_selectedInDDLB ("ddlb_app_role_super_id", orgBfrAR[ar].aapp_role_super_id);
				//
				txt_app_role_nm.value = ddlb_app_role_nm.options[ddlb_app_role_nm.options.selectedIndex].text;
				break;
			}
		}
	}
	//
	f_checkRadioButtons();
}}
//
//-------------------------------------------------------------------------------------------------------------
function f_Validate(){with(self.document.forms[0]){
	var vRoleID = ddlb_app_role_nm.value;
	if (vRoleID == -1)
	{
		h_app_role_id.value = 0
		if ( txt_app_role_nm == "" || txt_app_role_desc.value == "" || ddlb_app_role_super_id.value == -1)
		{
			alert("Sorry, cannot process your request. At one or more fields do not have values.")
		}
		else
		{
			if ( confirm("Do you want to create a new role '"+txt_app_role_nm.value+"'?") )
			{
				h_ValsFromRadioButtons.value = f_collectValsFromRadioButtons();
				of_CallFile("InsUpdRole");
			}
		}
	}
	else
	{
		h_app_role_id.value = vRoleID;
		if ( confirm("Do you want to update role '"+ddlb_app_role_nm.options[ddlb_app_role_nm.options.selectedIndex].text+"'?") )
		{
			h_ValsFromRadioButtons.value = f_collectValsFromRadioButtons();
			of_CallFile("InsUpdRole");
		}
	}
}}
//
//-------------------------------------------------------------------------------------------------------------
/*function f_Reset(){alert("RESET")}*/
function f_collectValsFromRadioButtons(){with(self.document.forms[0])
{
	var vString = "";
	var v_ST_ID = "";
	var vRB_Val = "";
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].type == "radio" && elements[e].checked == true && elements[e].value == "Y")
		{
			v_ST_ID = elements[e].name.substr(3);
			vRB_Val = elements[e].value;
			vString += v_ST_ID+";";
		}
		//
	}
	//
	return vString;
}}
</script>
