<!--- incJS_Navigation_SubGlobal.cfm --->
<div id="subglobal" class="subglobalNav"></div>
<script language="javascript1.2" type="text/javascript">
function f_showSubGlobalNavigation(argGlobalNavigationID)
{
	vOutputSG = "";
	if(orgBfrSG.length != 0)
	{
		//Building filter buffer of Sub-Global Navigation
		var fsg=0;
		ftrBfrSG = new Array();//ftrBfrSG - filter Bufer Sub-Global Navigation
		for (var sg=0; sg<orgBfrSG.length; sg++)
		{
			if (orgBfrSG[sg].ast_parent_id == argGlobalNavigationID)
			{//arrayN is declared in incJS_ArrayNavigation.cfm
				ftrBfrSG[fsg] = new arrayN (orgBfrSG[sg].ast_id, orgBfrSG[sg].ast_nm, orgBfrSG[sg].ast_loc, orgBfrSG[sg].ast_parent_id, orgBfrSG[sg].ast_is_act, orgBfrSG[sg].ast_seq, orgBfrSG[sg].ast_call_file)
				fsg++;
			}
		}//enf of for loop
		//
		if (ftrBfrSG != 0)
		{
			vOutputSG = "";
			for (var fsg=0; fsg<ftrBfrSG.length; fsg++)
			{
				vOutputSG += "<a href=\"#\""+
						 " onClick=\"JavaScript: of_CallFile("+ftrBfrSG[fsg].ast_id+");\" >"+
						 ftrBfrSG[fsg].ast_nm+
						 "</a> | ";
			}
			vOutputSG = vOutputSG.substr(0, (vOutputSG.length-3));
		}
	}//end of if(orgBfrSG.length != 0) statement
	//
	of_innerHTML("subglobal", "'"+vOutputSG+"'");
	of_Style("subglobal", "visibility", "visible")
	//alert(vOutputSG)
}//end of function	
//
//---------------------------------------------------------------------------------------------------------------
</script>
