<!--- incJS_DOS_OfficeCode.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_get_DOS_OfficeCode#" toplevelvariable="tlv_DO">
var rowsDO = tlv_DO.getRowCount();
function arrayDO( ausr_cntry_ofc_abbr ) {
									this.ausr_cntry_ofc_abbr = ausr_cntry_ofc_abbr;
									}
orgBufferDO = new Array();
for (var d=0; d<rowsDO; d++)
{
	
	orgBufferDO[d] = new arrayDO( 
								  tlv_DO.usr_cntry_ofc_abbr[d] 
								)
}
</script>