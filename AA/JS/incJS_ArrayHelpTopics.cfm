<!--- incJS_ArrayHelpTopics.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getHelpTopics#" toplevelvariable="tlv_HT">
var rowsHT = tlv_HT.getRowCount();
//alert(rowsHT)
function arrayHT(atopic_st_id, ast_nm, atopic_txt)
{
	this.atopic_st_id = atopic_st_id;
	this.ast_nm = ast_nm;
	this.atopic_txt = atopic_txt;
	
}
orgBfrHT = new Array();
for (var h=0; h<rowsHT; h++)
{
	orgBfrHT[h] = new arrayHT (
								 tlv_HT.topic_st_id[h]
								,tlv_HT.st_nm[h]
								,tlv_HT.topic_txt[h]
							  )
}
//alert(orgBfrHT.length)
</script>
