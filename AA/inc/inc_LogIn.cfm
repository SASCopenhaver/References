<!--- inc_LogIn.cfm --->
<cfset local.PicNumber = RandRange(1,9)>
<table width="90%"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <cfoutput>
	<td width="325px" align="center" valign="middle"><img alt="Alumni" src="Img/g#local.PicNumber#.jpg"></td>
	</cfoutput>
	<td valign="top" bgcolor="#D5E0C0">
		<table align="center" width="95%"  border="0" cellspacing="2" cellpadding="2">
		  <tr>
		  		<td  align="center">
					<table border="0">
						<tr>
							<td><img alt="Pay attention" src="Img/6PointStar.jpg"></td>
							<td valign="middle" class="justText"><a href="JavaScript: of_CallFile(1002);" style="text-decoration:underline; "><strong>NEW USER CLICK HERE TO REGISTER</strong></a></td>
							<td><img alt="Pay attention" src="Img/6PointStar.jpg"></td>
						</tr>
					</table>
				</td>
		  </tr>
		  <tr>
			<td class="justText" style="border-bottom: 1px dotted #005FA9;">
				Welcome to the <strong><font color="#911628">Alumni Archive</font></strong> database of the State Department Bureau of Educational and Cultural Affairs (ECA). This is a consolidated database of alumni from all of ECA&acute;s exchange programs.  Here you can search for alumni, update their contact information and print mailing labels as well as run statistical reports.
				<!--- The purpose of the <strong><font color="#911628">Alumni Archive</font></strong>  is to create a consolidated database housing information on alumni of all the ECA programs.  To utilize this data for re-engaging the alumnus(a), determine their whereabouts, and the value of their exchange on the ECA program, and to be able to produce a cross referencing of reports on the collected data.<br> --->
			</td>
		  </tr>
		  <tr>
			<td>
				<table  align="center" width="80%"  border="0" cellspacing="2" cellpadding="2">
					<tr>
						<td>&nbsp;</td>
						<td class="fieldNmLogIn" width="35%">USER NAME:</td>
						<td class="fieldNmLogIn" width="35%">PASSWORD:</td>
						<td width="30%">&nbsp;</td>
					</tr>
					<tr  style="border-bottom: 2px dotted #005FA9;">
						<td><cfset local.ctrl_help_ID = "10">
							<cfinclude template="../Ctrl_Help.cfm">	
						</td>
						<td><!--- surikovax --->
							<input	type="text" 
									name="txt_Usr_UName" 
									title="Enter Uswer Name"
									value="surikovax" 
									class="forminputs"
									onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
									
						</td><!--- 12345678 --->
						<td><input	type="password" 
									name="txt_Usr_Pass" 
									title="Enter Password"
									value="Sasha&Leah"
									class="forminputs"
									onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
						<td align="center">
							<input type="button" name="cb_Login" value="Login" class="c_formbuttons" onClick="JavaScript: f_Validate();">
						</td>
					</tr>
					<!--- <tr><td colspan="3">&nbsp;</td></tr> --->
					<tr>
						<td colspan="4"  class="justText">
							<a href="##" onClick="f_forgotPass();" style="text-decoration:underline; "><strong>Forgot your password?</strong></a>.
						</td>
					</tr>
					<!---
					<tr>
						<td colspan="3"  class="justText">
							Not a user yet?&nbsp;&nbsp;Click to <a href="JavaScript: of_CallFile(1002);"><strong>register</strong></a>
						</td>
					</tr>
					--->
				</table>

			
			</td>
		  </tr>
		  
		
		<!--- 
		  <tr>
		  	<td>
					
			<cfoutput>
			#CGI.CF_TEMPLATE_PATH#<br>
			#Mid(CGI.CF_TEMPLATE_PATH, 1 ,   Len(CGI.CF_TEMPLATE_PATH)  -  Len(GetFileFromPath(CGI.CF_TEMPLATE_PATH)) )#
			</cfoutput>
			
			</td>
		  </tr>
		 --->
		
		
		
		
		</table>

	</td>
  </tr>
</table>
<script language="javascript" type="text/javascript">
self.document.forms[0].txt_Usr_UName.focus();
//
//----------------------------------------------------------------------------------------------------------
function f_onKeyDown()
{
	var vKeyCode = window.event.keyCode;
	if (vKeyCode == 13)// 13 means Key "Enter" was clicked
	{
		f_Validate(); 
		return false;
	}
}
//
//----------------------------------------------------------------------------------------------------------
function f_Validate(){with(self.document.forms[0])
{
	if(txt_Usr_UName.value == "" || txt_Usr_Pass.value == "")
	{
		alert("'User Name' and 'Password' should have values.")
	}
	else
	{
		of_CallFile("AuthenticateUser");
	}
}}
//
//---------------------------------------------------------------------------------------------------------
function f_forgotPass()
{
	of_CallFile(1003);
}
</script> 
