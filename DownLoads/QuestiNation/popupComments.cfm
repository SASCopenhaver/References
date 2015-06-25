<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<script language="JavaScript" src="JS/swapImg_cbSave.js"></script>

<script language="JavaScript">
function of_Submit(){with(self.document.forms[0])
{
    var vCommentsTxt = txta_Comments.value;
	var vCommentsLen = vCommentsTxt.length;
	
	if (vCommentsLen > 0)
	{
		window.opener.f_Q.img_<cfoutput>#URL.urlQNum#</cfoutput>.src = 'img/FullComments.jpg';
	}
	else
	{
		window.opener.f_Q.img_<cfoutput>#URL.urlQNum#</cfoutput>.src = 'img/EmptyComments.jpg';
	}
	
	
	action = "SP_Call/nvo_InsUpdComments.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>"
	submit();
    window.close();
	
}}
//==============================================================================
/*
function of_OnKeyDown()
{
	var vKeyCode = window.event.keyCode;
	if (vKeyCode == 13)// 13 means Key "Enter" was clicked
	{
		//alert(vKeyCode)
		of_Submit(); 
		return false;
	}
}
*/
</script>

<cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">

<cfinclude template="SP_Call/nvo_selectUserComments.cfm">

<cfset client.QNum = #URL.urlQNum#>
<cfset client.QValue = #URL.urlQValue#>
<html><head><title>Comments to the Question <cfoutput>#URL.urlQNum#&nbsp;&nbsp;#URL.urlQDescr#</cfoutput></title></head>
<body>
<form action="" name="f_Comm" method="post" <!--- onkeydown="javascript: return of_OnKeyDown();" --->>
<table class="Teal10" align="center" width="100%" cellspacing="2" cellpadding="2" border="0">
<tr><td colspan="2">
<strong>If you wish to, please provide comment related to this question:</strong>
<br>
<br>
"<cfoutput>#URL.urlQNum#&nbsp;&nbsp;#URL.urlQDescr#</cfoutput>"
</td></tr>
<tr>
 <td><textarea 
 		cols="43" 
		rows="8" 
		name="txta_Comments" 
		onchange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"><cfoutput query="spr_UC">#Comments#</cfoutput></textarea></td>
 <td valign="bottom" align="center">
    <img src="Img/writeComments.gif" alt="Write Comments" border="0">
    <p>
 	<a href="javascript: of_Submit(); "
	   onMouseDown="return imgDownS('imgs');"
	   onMouseOver="return imgOverS('imgs');"
	   onMouseOut="return imgOutS('imgs');" 
	   >
       <img src="Img/cb_Save_I.jpg" 
	   		name="imgs" 
			title="Save Comments to the Question <cfoutput>#URL.urlQNum#</cfoutput>" 
			border="0">
	</a>
 </td>
</tr>
</table>
</form>
</body>
</html>
<script language="JavaScript">
	self.document.forms[0].txta_Comments.focus();
</script>