<!--- incJS_ArrayPrefix.cfm --->
<script language="javascript" type="text/javascript">
//PREFIX
//--------------------------------------------------------------------------
<cfwddx action="CFML2JS" input="#spr_getPrefix#" toplevelvariable="tlv_Prfx">
var rowsPrfx = tlv_Prfx.getRowCount();
function arrayPrfx( aitem_type, aitem_cd, aitem_desc) 
{
	this.aitem_type = aitem_type;
	this.aitem_cd = aitem_cd;
	this.aitem_desc = aitem_desc;
}
orgBfrPrfx = new Array();

for (var p=0; p<rowsPrfx; p++)
{
	
	orgBfrPrfx[p] = new arrayPrfx( tlv_Prfx.item_type[p]
								  ,tlv_Prfx.item_cd[p]
								  ,tlv_Prfx.item_desc[p] )
}
//
//--------------------------------------------------------------------------

</script>