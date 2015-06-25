//of_hideDiv.js
function of_hideDiv(argDivID){with(self.document.forms[0])
{
	var navVersion = navigator.appVersion.substring(0,1);
	if (navVersion >= 4)
	{
		of_Style(argDivID, "visibility", "hidden");
	}
}}