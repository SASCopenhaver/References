<!--- _inc_Navigation_Utility.cfm --->

<script language="javascript" type="text/javascript">
//orgBfrUT is created in JS/incJS_ArrayNavigation.cfm
	if (orgBfrUT.length != 0)
	{
		var vOutputUT = "<div id=\"utility\">";
		for (var ut=0; ut<orgBfrUT.length; ut++)
		{
			vOutputUT += "<a href=\"JavaScript: of_CallFile("+orgBfrUT[ut].ast_id+")\">"+orgBfrUT[ut].ast_nm+"</a> | ";
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






