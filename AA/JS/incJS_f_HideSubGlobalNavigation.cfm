<!--- incJS_f_HideSubGlobalNavigation.cfm --->
<script language="javascript1.2" type="text/javascript">
function f_HideSubGlobalNavigation()
{
	
	if (orgBfrSG.length >0 )
	{
		of_innerHTML("subglobal", "''");
		of_Style("subglobal", "visibility", "hidden");
	}
}
</script>