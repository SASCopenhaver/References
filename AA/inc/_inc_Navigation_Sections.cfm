<!--- _inc_Navigation_Sections.cfm --->

<script language="javascript" type="text/javascript">
	if (orgBfrSL.length != 0)
	{
		var vOutputSL = "<div id=\"sectionLinks\">";
		var vLinks = "";
		for (var sl=0; sl<orgBfrSL.length; sl++)
		{
			if (orgBfrSL[sl].ast_parent_id == "<cfoutput>#client.CallPageID#</cfoutput>")
			//
			vLinks += "<a href=\"##\" onClick=\"of_CallFile("+orgBfrSL[sl].ast_id+");\"  >"+orgBfrSL[sl].ast_nm+"</a> ";
			//vOutputSL += orgBfrSL[sl].ast_nm;
		}
		vOutputSL += vLinks+"</div>";
	}
	//
	//alert(vLinks +"    "+vOutputSL)
	if (vLinks != "")
	{
		document.write(vOutputSL);
	}
	
</script>

<!--- 
<div id="sectionLinks">
	<a href="#">Section Link</a> <a href="#">Section Link</a> <a href="#">Section Link</a>
</div>
 --->