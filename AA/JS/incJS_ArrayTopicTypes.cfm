<!--- incJS_ArrayHelpTopics.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getTopicTypes#" toplevelvariable="tlv_TT">
var rowsTT = tlv_TT.getRowCount();
//alert(rowsHT)
function arrayTT(aitem, aitem_cd, aitem_desc)
{
	this.aitem = aitem;
	this.aitem_cd = aitem_cd;
	this.aitem_desc = aitem_desc;
	
}
orgBfrTT = new Array();
for (var t=0; t<rowsTT; t++)
{
	orgBfrTT[t] = new arrayTT (
								 tlv_TT.item[t]
								,tlv_TT.item_cd[t]
								,tlv_TT.item_desc[t]
							  )
}
//alert(orgBfrTT.length)
</script>
