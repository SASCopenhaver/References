<!--- <cflocation url="AppFlow.cfm?#client.URLTOKEN#&urlCase=Log In"> --->
<!--- <cflocation url="UnderConstruction.cfm"> --->
<script language="JavaScript">
function startApp()
{//	alert(argSelectedDate)
	
	var popupPage = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=Log In";
	//var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,titlebar=yes,resizable=yes,top=0,left=0,copyhistory=no,width=800,height=600','yes');
	var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=0,left=0,copyhistory=no,width=800,height=800','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
}
//
//------------------------------------------------------------------------------
startApp();
//
//------------------------------------------------------------------------------
window.opener=self;
window.close();
//
//------------------------------------------------------------------------------
</script>
<!--- <cflocation url="AppFlow.cfm?#client.URLTOKEN#&urlCase=Log In"> --->
<!--- <cflocation url="UnderConstruction.cfm"> --->