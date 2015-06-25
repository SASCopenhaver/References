<!--- _inc_Navigation_Sections.cfm --->
<script language="javascript" type="text/javascript">
	if (orgBfrSL.length != 0)
	{
		var vOutputSL = "<div id=\"sectionLinks\">";
		for (var sl=0; sl<vOutputSL.length; sl++)
		{
			vOutputSL += "<a href=\"#\">"+orgBfrSL[sl].ast_nm+"</a> ";
		}
		vOutputSL += "</div>";
	}
	//
	document.write(vOutputSL);
</script>
	
<!--- 
<div id="sectionLinks">
	<a href="#">Section Link</a> <a href="#">Section Link</a> <a href="#">Section Link</a>
</div>
 --->