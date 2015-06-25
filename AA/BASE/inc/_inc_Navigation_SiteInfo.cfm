<!--- _inc_Navigation_SiteInfo.cfm --->
<div id="siteInfo">
<img src="Img/imgSiteInfo.jpg" width="44" height="38">
<script language="javascript" type="text/javascript">
	var vOutputSI = "";
	if (orgBfrSI.length != 0)
	{
		for (var si=0; si<vOutputAD.length; si++)
		{
			vOutputSI += "<a href=\"#\">"+orgBfrSI[si].ast_nm+"</a> | ";
		}
		document.write(vOutputSI);
	}
</script>
&copy;<cfoutput>#Year(Now())#&nbsp;#Application.orgName#</cfoutput>
</div>

 <!--- 
<div id="siteInfo"> 
	<img src="" width="44" height="22"> <a href="#">About Us</a> | <a href="#">Site
	Map</a> | <a href="#">Privacy Policy</a> | <a href="#">Contact Us</a> | &copy;2003
	Company Name
</div>  
 --->