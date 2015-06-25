<!--- inc_LogIn.cfm --->
<div class="story"> 
  <!--- <h3>Story Title</h3>
  <p>
   Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec molestie.
   Sed aliquam sem ut arcu. Phasellus sollicitudin. Vestibulum condimentum
   facilisis nulla. In hac habitasse platea dictumst. Nulla nonummy. Cras
   quis libero. Cras venenatis. Aliquam posuere lobortis pede. Nullam fringilla
   urna id leo. Praesent aliquet pretium erat. Praesent non odio. Pellentesque
   a magna a mauris vulputate lacinia. Aenean viverra. Class aptent taciti
   sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos.
   Aliquam lacus. Mauris magna eros, semper a, tempor et, rutrum et, tortor.
  </p>  ---> 
<p>
<table align="center" width="60%"  border="0" cellspacing="1" cellpadding="1" summary="Log In controls">
  <tr>
    <td width="25%" align="right"><h4>User Name</h4></td>
    <td width="40%" align="center">
		<input	type="text" 
				name="txt_Usr_UName" 
				maxlength="10" 
				title="Enter Uswer Name"
				value="sasurikov" 
				onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
				>
		</td>
    <td align="left"><h5>(max 10 characters)</h5></td>
  </tr>
  <tr>
    <td width="25%" align="right"><h4>Password</h4></td>
	<td width="40%" align="center">
		<input	type="password" 
				name="txt_Usr_Pass" 
				maxlength="10" 
				title="Enter Password"
				value="sas"
				onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
				>
	</td>
    <td align="left"><h5>(max 10 characters)</h5></td>
  </tr>
   <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="left"><a href="JavaScript: f_Validate();" >Login</a></td>
  </tr>
</table>
</p> 
<br>
<br>
</div>
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
</script> 
