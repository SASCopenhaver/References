
<!--- <cfoutput>#urlUserIDFromPB#</cfoutput><cfabort> --->

<cfset local.UserIDFromPB = #URL.urlUserIDFromPB#>
<!---<cfset local.UserIDFromPB = "tblatt"> cmoore(SA) bmay(DC) nbell(DC) cgrabaus(BC) tblatt(BC) jbeard(PO) econnoll(BC) tajohnso(BC)--->
<script language="JavaScript">
function startApp()
{//	alert(argSelectedDate)
	
	var popupPage = "_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=SetUpUser&urlUserIDFromPB=<cfoutput>#local.UserIDFromPB#</cfoutput>";
	//var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,titlebar=yes,resizable=yes,top=0,left=0,copyhistory=no,width=800,height=600','yes');
	var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=0,left=0,copyhistory=no,width=800,height=600','yes');
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
