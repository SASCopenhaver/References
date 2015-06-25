<!--- incJS_Navigation_SubGlobal.cfm --->
<!--- <div id="subglobal" class="subglobalNav"></div> --->
<!--- <div id="id_SubGlobalVertical" class="subglobalNav"></div> --->
<script language="javascript1.2" type="text/javascript">
function f_showSubGlobalNavigation(argGlobalNavigationID)
{//alert(argGlobalNavigationID)
	//**************** VERTICAL MENU *************************
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
			vOutputSG = "<table border=0>";
			for (var fsg=0; fsg<ftrBfrSG.length; fsg++)
			{
				//if ()
				
						//vOutputSG += "<a href=\"#\""+ " onClick=\"JavaScript: of_CallFile("+ftrBfrSG[fsg].ast_id+");\" >"+  ftrBfrSG[fsg].ast_nm+  "</a> | ";
						vOutputSG += "<tr>";
						vOutputSG += "<td style=\"border-bottom-style:solid; \">";
						//
						vOutputSG += "<a href=\"#\""+ " onClick=\"JavaScript: of_CallFile("+ftrBfrSG[fsg].ast_id+");\" >"
						/*
						if (argGlobalNavigationID == 106)
						{
							vOutputSG += "<a href=\"#\""+ " onClick=\"JavaScript: f_openAdvancedSearch("+ftrBfrSG[fsg].ast_id+");\" >";
						}
						else
						{
							vOutputSG += "<a href=\"#\""+ " onClick=\"JavaScript: of_CallFile("+ftrBfrSG[fsg].ast_id+");\" >";
						}
						*/
						//
						vOutputSG += ftrBfrSG[fsg].ast_nm;
						vOutputSG += "</a>";
						//
						vOutputSG += "</td>";
						vOutputSG += "</tr>";
						 
			}
			//vOutputSG = vOutputSG.substr(0, (vOutputSG.length-3));
			vOutputSG += "</table>";
			//alert(vOutputSG)
		}
	}//end of if(orgBfrSG.length != 0) statement
	//
	of_innerHTML("subglobal", "'"+vOutputSG+"'");
	if (argGlobalNavigationID == 104)
	{
		of_Style("subglobal", "left", "355")
	}
	else if (argGlobalNavigationID == 106)
	{
		of_Style("subglobal", "left", "235")
	}
	
	
	of_Style("subglobal", "visibility", "visible")
	
//--------------------------------------------------------------------------------
/*
function f_openAdvancedSearch(argPageId){with(self.document.forms[0])
{
	for (var n=0; n<orgBfrN.length; n++)
	{
		
		if ( orgBfrN[n].ast_id == argPageId )
		{
			h_PageId.value = orgBfrN[n].ast_id;
			h_PageNm.value = orgBfrN[n].ast_nm;
			h_PageFileNm.value = orgBfrN[n].ast_call_file;
			break;
		}
	}
	//
	of_CallFile("getAdvancedSearch");
}}
*/
//---------------------------------------------------------------------------------	
	
	
	//of_innerHTML("id_SubGlobalVertical", "'"+vOutputSG+"'");
	//of_Style("id_SubGlobalVertical", "visibility", "visible")
	
	//alert(vOutputSG)
	
	/************************  HORIZONTAL MENU   **************************************
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
	*/
	//alert(vOutputSG)
}//end of function	
//
//---------------------------------------------------------------------------------------------------------------
</script>
