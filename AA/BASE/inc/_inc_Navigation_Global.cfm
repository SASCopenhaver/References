<!--- _inc_Navigation_Global.cfm --->
<div id="globalNav">
	<img alt="" src="Img/gblnav_left.gif" height="32" width="4" id="gnl"> <img alt="" src="Img/glbnav_right.gif" height="32" width="4" id="gnr">
	<div id="globalLink"> 
	<script language="javascript" type="text/javascript">
	//orgBfrGL is created in JS/incJS_ArrayNavigation.cfm
	//GL stands for GLOBAL
		var vOutputGL = "";
		for (var gl=0; gl<orgBfrGL.length; gl++)
		{
			vOutputGL += "<a href=\"#\" class=\"glink\" "+
						 " onmouseover=\"f_showSubGlobalNavigation("+orgBfrGL[gl].ast_id+");\""+
						 ">"+
						 orgBfrGL[gl].ast_nm+"</a>";
		}
		document.write(vOutputGL);
	</script>
	</div> 
	<!--- <div id="search"><input name="searchFor" type="text" size="10"> <a href="">search</a></div> --->
</div>


<!--- 
vOutputGL += "<a href=\"#\""+		 
						 " onClick=\"JavaScript: f_getNextPage("+orgBfrGL[gl].ast_id+");\""+
						 " onmouseover=\"f_showSubGlobalMenu("+orgBfrGL[gl].ast_id+");\""+
						 " class=\"glink\" >"+orgBfrGL[gl].ast_menu_name+"</a>";
 --->

