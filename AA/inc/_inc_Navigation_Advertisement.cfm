<!--- _inc_Navigation_Advertisement.cfm --->
<script language="javascript" type="text/javascript">
	if (orgBfrAD.length != 0)
	{
		var vOutputAD = "<div id=\"advert\">";
		for (var ad=0; ad<vOutputAD.length; ad++)
		{
			vOutputAD += "<a href=\"#\">"+orgBfrAD[ad].ast_nm+"</a> ";
		}
		vOutputAD += "</div>";
	}
	//
	document.write(vOutputAD);
</script>

