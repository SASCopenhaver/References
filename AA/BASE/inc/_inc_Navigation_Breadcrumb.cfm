<!--- _inc_Navigation_Breadcrumb.cfm --->
<div id="breadCrumb" onMouseOver="f_HideSubGlobalNavigation();"></div>
<script language="javascript" type="text/javascript">
	var vOutputBC = "";
	var vParentID;
	// 1. Determine the last position in the Breadcrumb 
	var vCurrentSIID = "<cfoutput>#client.CallPageID#</cfoutput>";//vCurrentSIID - Current Security_Item ID
	//vCurrentSIID = 201
	for (var n=0; n<orgBfrN.length; n++)
	{
		if (orgBfrN[n].ast_id == vCurrentSIID)
		{
			vOutputBC = orgBfrN[n].ast_nm;
			vParentID = orgBfrN[n].ast_parent_id;
			break;
		}
	}
	//
	if (vParentID == 0) {vOutputBC = "";}
	//
	// 2. Building the rest of the Breadcumbs:
	if (vParentID != 0)
	{
		for (var n=0; n<orgBfrN.length; n++)
		{
			if (orgBfrN[n].ast_id == vParentID)
			{
				vOutputBC = "<a href=\"#\">"+orgBfrN[n].ast_nm+"</a> / " + vOutputBC;
				vParentID = orgBfrN[n].ast_parent_id;
				if(vParentID == 0){ break; }
			}
		}
		
	}
	//
	of_innerHTML("breadCrumb", "'"+vOutputBC+"'");
</script>

<!-- 
<div id="breadCrumb" onMouseOver="f_HideSubGlobalNavigation();"> 
<a href="#">Breadcrumb</a> / <a href="#">Breadcrumb</a> / <a href="#">Breadcrumb</a> / 
</div>  
 -->