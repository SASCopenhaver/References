<!--- inc_NewUserRegistration_p1.cfm --->
<div class="feature">
<br>
<table align="center" width="80%"  border=0 cellpadding=2 cellspacing=2>
	<tr>
		<td align="right" width="35%"><span class="c_fieldName">Your OpenNet E-Mail:</span></td>
		<td>
			<input class="forminputs" type="text" name="txt_NUR_Usr_Email" value="@state.gov" size="40"
			onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
			&nbsp;&nbsp;&nbsp;<span class="c_Format">(Format: DoeJX@state.gov)</span>
			<cfset local.ctrl_help_ID = "1">
		    <cfinclude template="../Ctrl_Help.cfm">
		</td>
		
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td align="center" colspan="2">
			<input type="button" value="Submit" class="c_formbuttons" onClick="JavaScript: f_Validate();">
		</td>
	</tr>
</table>
</div>

<script language="javascript" type="text/javascript">
//----------------------------------------------------------------------------------------------------------------------
function f_Validate(){with(self.document.forms[0])
{
	var vPosOfAt = txt_NUR_Usr_Email.value.indexOf('@');
	if (txt_NUR_Usr_Email.value == "@state.gov")
	{
		alert("Sorry, this is incomplete format for e-mail address.");
		txt_NUR_Usr_Email.focus();
	}
	else
	{
		if ( txt_NUR_Usr_Email.value.substr(vPosOfAt, txt_NUR_Usr_Email.value.length) != "@state.gov")
		{
			alert("Sorry, this is not Department of State e-mail account.  Your request cannot be processed.");
		}
		else
		{
			of_CallFile("get_NUR_User");
		}
	}	
}}
//
</script>
