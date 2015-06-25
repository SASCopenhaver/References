<!--- _inc_Navigation_Utility.cfm --->
<script language="javascript" type="text/javascript">
//------------------------------------------------------------------------------------------------------------
function f_showMainHelp(){with(self.document.forms[0])
{	
	var popupPage = "WebHelp/Alumni_Archive.htm";
	var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=yes,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=400,height=250','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
}}

//------------------------------------------------------------------------------------------------------------
//orgBfrUT is created in JS/incJS_ArrayNavigation.cfm
	if (orgBfrUT.length != 0)
	{
		var vOutputUT = "<div id=\"utility\">";
		//
		vOutputUT += "<a href=\"JavaScript: f_showMainHelp()\">";
		vOutputUT += "HELP";
		vOutputUT += "</a>";
		//
		vOutputUT += "&nbsp;|&nbsp;";
		//
		for (var ut=0; ut<orgBfrUT.length; ut++)
		{
			//vOutputUT += "<a href=\"JavaScript: of_CallFile("+orgBfrUT[ut].ast_id+")\">"+orgBfrUT[ut].ast_nm+"</a> | ";
			vOutputUT += "<a href=\"JavaScript: of_CallFile('index_cfm')\">"+orgBfrUT[ut].ast_nm+"</a> | ";
		}
		vOutputUT = vOutputUT.substr(0, (vOutputUT.length-3));
		vOutputUT += "</div>";
	}
	else
	{
		var vOutputUT = "";
	}
	document.write(vOutputUT);
</script>

<!--- 
<div id="utility">
<a href="#">Utility Link</a> | <a href="#">Utility Link</a> | <a href="#">Utility Link</a> 
</div>
 --->






