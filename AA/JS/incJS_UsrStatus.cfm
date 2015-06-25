<!--- incJS_UsrStatus.cfm --->
<script language="javascript" type="text/javascript">
//US - User Status
//--------------------------------------------------------------------------
<cfwddx action="CFML2JS" input="#spr_getUsrStatus#" toplevelvariable="tlv_US">
var rowsUS = tlv_US.getRowCount();
function arrayUS (aitem_cd, aitem_desc)
{
	this.aitem_cd = aitem_cd;
	this.aitem_desc = aitem_desc;
}
orgBfrUS = new Array();
for (var us=0; us<rowsUS; us++)
{
	orgBfrUS[us] = new arrayUS(
								tlv_US.item_cd[us],
								tlv_US.item_desc[us]
	
							);
//alert(orgBfrUS[us].aitem_cd)
}
</script>
