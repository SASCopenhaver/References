<!--- of_msgWaitForLoad.cfm --->
		<div id="id_msgWait"  style="z-index:100;">
			System is processing your request.
			<br>
			Please wait.
			<br>
			<BR><img alt="It takes time to load new info..." src="Img/Animation.gif">
		</div>

<script language="javascript1.4" type="text/javascript">
//=====================================================================================
//
/*
		var writeDoc  = "<div id=\"id_msgWait\"  style=\"z-index:100;\">";
		writeDoc += "System is processing your request.";
		writeDoc += "<br>";
		writeDoc += "Please wait.";
		writeDoc += "<br>";
		writeDoc += "";
		writeDoc += "<BR><img alt=\"It takes time to load new info...\" src=\"Img/Animation.gif\">";
		writeDoc += "</div>";
		//
		document.write(writeDoc);
*/
function of_msgWaitForLoad(argDivID)
{
	var navVersion = navigator.appVersion.substring(0,1);
	//var writeDoc = "";
	if (navVersion >= 4)
	{
		/*
		writeDoc  = "<div id=\"id_msgWait\">";
		writeDoc += "System is processing your request.";
		writeDoc += "<br>";
		writeDoc += "Please wait.";
		writeDoc += "<br>";
		writeDoc += "";
		writeDoc += "<BR><img alt=\"It takes time to load new info...\" src=\"Img/Animation.gif\">";
		writeDoc += "</div>";
		//
		document.write(writeDoc);
		*/
		//
		/*
		var navi = (navigator.appName == "Netscape" && parseInt(navigator.appVersion) >= 4);
		var HIDDEN = (navi) ? 'hide' : 'hidden';
    	var VISIBLE = (navi) ? 'show' : 'visible';
		var id_msgWait = (navi) ? document.id_msgWait : document.all.id_msgWait.style;
    	*/
		of_Style(argDivID, "visibility", "visible");
    }
}
//=====================================================================================
//of_msgWaitForLoad('id_msgWait');
//=====================================================================================
function of_hideDiv(argDivID){with(self.document.forms[0])
{
	var navVersion = navigator.appVersion.substring(0,1);
	if (navVersion >= 4)
	{
		of_Style(argDivID, "visibility", "hidden");
	}
}}
</script>
