<!--- incJS_ArrayPrefix.cfm --->
<script language="javascript" type="text/javascript">
//PREFIX
//--------------------------------------------------------------------------
<cfwddx action="CFML2JS" input="#spr_getSuffix#" toplevelvariable="tlv_Sfx">
var rowsSfx = tlv_Sfx.getRowCount();
function arraySfx( aitem_type, aitem_cd, aitem_desc) 
{
	this.aitem_type = aitem_type;
	this.aitem_cd = aitem_cd;
	this.aitem_desc = aitem_desc;
}
orgBfrSfx = new Array();

for (var p=0; p<rowsSfx; p++)
{
	
	orgBfrSfx[p] = new arraySfx( tlv_Sfx.item_type[p]
								  ,tlv_Sfx.item_cd[p]
								  ,tlv_Sfx.item_desc[p] )
}
//
//--------------------------------------------------------------------------

</script>