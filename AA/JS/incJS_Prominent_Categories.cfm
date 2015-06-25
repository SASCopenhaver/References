<!--- incJS_ArrayInterest.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getProminent_Categories#" toplevelvariable="tlv_PC">
var rowsPC = tlv_PC.getRowCount();
//alert(rowsINT)
function arrayPC(aitem_cd, aitem_desc)
{
	this.aitem_cd = aitem_cd;
	this.aitem_desc = aitem_desc;
}
orgBfrPromCatg = new Array();
for (var pc=0; pc<rowsPC; pc++)
{
	orgBfrPromCatg[pc] = new arrayPC(
							   tlv_PC.item_cd[pc]
							  ,tlv_PC.item_desc[pc]
							  )
//alert(orgBfrPromCatg[pc].aitem_cd+"  "+orgBfrPromCatg[pc].aitem_desc)
}
</script>
