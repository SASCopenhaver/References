<!--- inc_QuickSearch_p1.cfm --->
<script language="javascript1.2" type="text/javascript">
function f_CtrlOnClick(argCtrlName){with(self.document.forms[0])
{//alert("id_"+argCtrlName.substr(4))
	if (eval(argCtrlName+".checked"))
	{
		of_Style("id_"+argCtrlName.substr(4), "visibility", "visible")
	}
	else
	{
		of_Style("id_"+argCtrlName.substr(4), "visibility", "hidden")
	}
}}
</script>
<div class="story">
<cfoutput>
<table width="100%"  border="0" cellspacing="2" cellpadding="2">
  <tr><td colspan="4"><span class="c_fieldName">Search by:</span></td></tr>  
  <tr>
    <td width="20%">
		&nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="cbx_QS_Cntry" value="CNTRY" onClick="f_CtrlOnClick(this.name)">
		<span class="c_fieldName">Country</span>
	</td>
    <td id="id_QS_Cntry"><!--- onChange="f_OnChangeCountry(this.value)" --->
		<select name="ddlb_QS_Cntry_CD" class="forminputs" ></select>
	</td>
  </tr>
  <tr>
    <td width="20%">
		&nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="cbx_QS_Role" value="ROLE"  onClick="f_CtrlOnClick(this.name)">
		<span class="c_fieldName">Role</span>
	</td>
    <td id="id_QS_Role"><!--- onChange="f_onChangeAARole(this.value);" --->
		<select name="ddlb_QS_Role_ID" class="forminputs" ></select>
	</td>
  </tr>
  <tr>
    <td width="20%">
		&nbsp;&nbsp;&nbsp;
		<input type="checkbox" name="cbx_QS_LName" value="LNAME"  onClick="f_CtrlOnClick(this.name)">
		<span class="c_fieldName">Last Name</span>
	</td>
    <td id="id_QS_LName">
		<input class="forminputs" type="text" name="txt_QS_LName" value="#client.QS_LName#"
			   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
	</td>
  </tr>
  <tr>
  	<td width="20%">&nbsp;</td>
	<td align="center">
		<table width="100%" border="0">
			<tr>
				<td width="50%" align="center">
					<input type="button" name="cb_Search" value="Search" class="c_formbuttons" onClick="JavaScript: f_Validate();">
					&nbsp;&nbsp;&nbsp;
					<input type="button" name="cb_Reset" value="Reset" class="c_formbuttons" onClick="JavaScript: f_Reset();">
				</td>
				<td width="50%">&nbsp;</td>
			</tr>
		</table>
	</td>
  </tr>
  <tr><td colspan="2">&nbsp;</td></tr>
</table>
</cfoutput>
</div>
<script language="javascript" type="text/javascript">
//
of_populateSelect( "ddlb_QS_Cntry_CD", "-1", "=== Select Countries ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
of_selectedInDDLB ("ddlb_QS_Cntry_CD", "<cfoutput>#client.QS_Cntry_CD#</cfoutput>"); 
//
of_populateSelect( "ddlb_QS_Role_ID", "-1", "=== Select Role ===", rowsAR, "orgBfrAR", "aapp_role_id", "aapp_role_nm", "2D" );
of_selectedInDDLB ("ddlb_QS_Role_ID", "<cfoutput>#client.QS_Role_ID#</cfoutput>"); 
//
if ("<cfoutput>#client.QS_Done#</cfoutput>" == "NO")
{
	f_CtrlOnClick("cbx_QS_Cntry")
	f_CtrlOnClick("cbx_QS_Role")
	f_CtrlOnClick("cbx_QS_LName")
}
//
function f_Validate(){with(self.document.forms[0])
{
	var vValidate = "YES";
	if ( cbx_QS_Cntry.checked == true && ddlb_QS_Cntry_CD.value == -1 )
	{
		alert("Please select country.");
		ddlb_QS_Cntry_CD.focus();
		vValidate = "NO";
	}
	//
	if ( cbx_QS_Role.checked == true && ddlb_QS_Role_ID.value == -1 && vValidate == "YES" )
	{
		alert("Please select role.");
		ddlb_QS_Role_ID.focus();
		vValidate = "NO";
	}
	//
	if ( cbx_QS_LName.checked == true &&  txt_QS_LName.value == "" && vValidate == "YES" )
	{
		alert("Please provide name you would like to find.");
		cbx_QS_LName.focus();
		vValidate = "NO";
	}
	//
	if (vValidate == "YES")
	{
		alert("Submit request")
	}
}}
//
function f_Reset(){with(self.document.forms[0])
{
	cbx_QS_Cntry.checked = false;
	cbx_QS_Role.checked = false;
	cbx_QS_LName.checked = false;
	//
	of_selectedInDDLB ("ddlb_QS_Cntry_CD", "-1"); 
	of_selectedInDDLB ("ddlb_QS_Role_ID", "-1");
	txt_QS_LName.value = "";
	//
	f_CtrlOnClick("cbx_QS_Cntry");
	f_CtrlOnClick("cbx_QS_Role");
	f_CtrlOnClick("cbx_QS_LName");
	
}}
</script>