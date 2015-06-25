<!--- inc_ForgotPass.cfm --->
<div class="feature">
<br><br>
<table width="60%"  border="0" cellspacing="2" cellpadding="2" align="center">
  <tr>
    <td valign="top" width="5%" >&nbsp;</td>
    <td>
		<table align="left"  border=0 cellpadding=2 cellspacing=2>
			
			<tr>
				<td width="10%"bgcolor="#CCCCCC">&nbsp;</td>
				<td bgcolor="#CCCCCC" width="35%"><span class="c_fieldName">Please provide the following information</span></td>
			</tr>
			<tr>
				<td bgcolor="#EFEFEF" align="right"><span class="c_fieldName">E-Mail:</span></td>
				<td bgcolor="#EFEFEF">
					<input class="forminputs" type="text" name="txt_PASS_Email" value="" size="30"
						   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					<cfset local.ctrl_help_ID = "9">
				    <cfinclude template="../Ctrl_Help.cfm">	
				</td>
			</tr>
			<tr>
				<td bgcolor="#EFEFEF" align="right"><span class="c_fieldName">Security Question:</span></td>
				<td bgcolor="#EFEFEF">
					<select name="ddlb_PASS_SecQ" class="forminputs" >
						<option value="-1">=== Select Security Question ===</option>
						<cfoutput query="spr_getSecretQuestions">
						<option value="#item_cd#">#item_desc#</option>
						</cfoutput>
					</select>
				</td>
			</tr>
			<tr>
				<td bgcolor="#EFEFEF" align="right"><span class="c_fieldName">Answer:</span></td>
				<td bgcolor="#EFEFEF">
					<input class="forminputs" type="text" name="txt_PASS_Answer" value=""  size="30"
						   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					<cfset local.ctrl_help_ID = "39">
				    <cfinclude template="../Ctrl_Help.cfm">	
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td align="right">
					<input type="button" value="Submit" class="c_formbuttons" onClick="JavaScript: f_Validate();">
				</td>
			</tr>
		</table>
	</td>
  </tr>
</table>
</div>
 
<script language="JavaScript" type="text/JavaScript">
function f_Validate(){with(self.document.forms[0])
{
	var vValidate = "YES";
	var vEmail = txt_PASS_Email.value;
	var vPosOfAt = vEmail.indexOf('@');
	//
	var vSecQ = ddlb_PASS_SecQ.value;
	//
	var vAnswer = txt_PASS_Answer.value;
	
	//alert(vEmail+"  "+vSecQ+"  "+vAnswer)
	
	if (vValidate == "YES" && vEmail == '' )
	{
		vValidate = "NO";
		alert("Sorry, your request cannot be processed.\nE-Mail is required.");
		txt_PASS_Email.focus();
	}
	else if (vValidate == "YES" && vEmail != '' )
	{
		if (vValidate == 'YES' && vEmail.substr(vPosOfAt, vEmail.length).toLowerCase() != "@state.gov")
		{	alert("Sorry, your request cannot be processed.\nPlease provide your Department of State e-mail address.");
			vValidate = "NO";
			txt_PASS_Email.focus();
		}
	}
	//
	if ( vValidate == "YES" && vSecQ == "-1")
	{
		vValidate = "NO";
		alert("Sorry, your request cannot be processed.\nYou should select 'Seceret question'.");
		ddlb_PASS_SecQ.focus();
	}
	//
	if (  vValidate == "YES" && vAnswer == '' )
	{
		vValidate = "NO";
		alert("Sorry, your request cannot be processed.\nYou should answer on 'Seceret question'.");
		txt_PASS_Answer.focus();
	} 
	//
	//---------------------------------------------------------------------------------------------------------------
	if (vValidate == "YES")
	{
		of_CallFile("get_USR_Pass");
	}
	
}}
</script>
