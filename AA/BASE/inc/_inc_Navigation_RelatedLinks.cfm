<!--- _inc_Navigation_RelatedLinks.cfm --->
<script language="javascript" type="text/javascript">
	if (orgBfrRL.length != 0)
	{
		var vOutputRL = "<div class=\"relatedLinks\">";
		//vOutputRL += "<h3>Related Link Category</h3>";
		for (var rl=0; rl<vOutputSL.length; rl++)
		{
			vOutputRL += "<a href=\"#\">"+orgBfrRL[rl].ast_nm+"</a> ";
		}
		vOutputRL += "</div>";
	}
	//
	document.write(vOutputRL);
</script>

<!--- 
<div class="relatedLinks"> 
  <h3>Related Link Category</h3> 
  <a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related
  Link</a> <a href="#">Related Link</a> <a href="#">Related Link</a> <a href="#">Related
  Link</a> 
</div>  --->