<!--- incJS_UsrCntry.cfm --->
<script language="javascript" type="text/javascript">
//US - User Country
//--------------------------------------------------------------------------
<cfwddx action="CFML2JS" input="#spr_getGA_UsrCntry#" toplevelvariable="tlv_UC">
var rowsUC = tlv_UC.getRowCount();
function arrayUC (ausr_cntry_usr_id, ausr_cntry_regn_cd, ausr_cntry_cntry_cd, ausr_cntry_city_post_nm, ausr_cntry_is_prmry, ausr_cntry_ofc_abbr)
{
	this.ausr_cntry_usr_id = ausr_cntry_usr_id;
	this.ausr_cntry_regn_cd = ausr_cntry_regn_cd;
	this.ausr_cntry_cntry_cd = ausr_cntry_cntry_cd;
	this.ausr_cntry_city_post_nm = ausr_cntry_city_post_nm;
	this.ausr_cntry_is_prmry = ausr_cntry_is_prmry;
	this.ausr_cntry_ofc_abbr = ausr_cntry_ofc_abbr; 
}
orgBfrUC = new Array();
for (var uc=0; uc<rowsUC; uc++)
{
	orgBfrUC[uc] = new arrayUC(
								tlv_UC.usr_cntry_usr_id[uc],
								tlv_UC.usr_cntry_regn_cd[uc],
								tlv_UC.usr_cntry_cntry_cd[uc],
								tlv_UC.usr_cntry_city_post_nm[uc],
								tlv_UC.usr_cntry_is_prmry[uc],
								tlv_UC.usr_cntry_ofc_abbr[uc]
							);
}
//alert(orgBfrUC.length)
</script>
