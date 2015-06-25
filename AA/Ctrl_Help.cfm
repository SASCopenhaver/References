<script language="javascript" type="text/javascript">
function of_helpYourself(argHelpItemId){with(self.document.forms[0])
{//alert(argHelpItemId)
	var vScreenWidth = parseInt(screen.width)/3;
	var vScreenHeiht = parseInt(screen.height)/3;
	var popupPage = "popupCtrlHelp.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlHelpItemId="+argHelpItemId;
	//alert(argHelpItemId)
	var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width='+vScreenWidth+',height='+vScreenHeiht+'','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
}}
</script>

<cfoutput>
	<a href="##" onClick="JavaScript: of_helpYourself(#local.ctrl_help_ID#);">
		<img border="0" align="middle" src="Img/Ctrl_Help_small_icon.gif">
	</a>
</cfoutput>