<!--- incJS_CountryCityPost.cfm --->
<script language="javascript" type="text/javascript">
//
//--------------------------------------------------------------------------
// Con - Countries
<cfwddx action="CFML2JS" input="#spr_getCountry#" toplevelvariable="tlv_Con">
var rowsCon = tlv_Con.getRowCount();
function arrayCon( acntry_regn_cd, acntry_cntry_cd, acntry_cntry_nm)
{
	this.acntry_regn_cd = acntry_regn_cd;
	this.acntry_cntry_cd = acntry_cntry_cd;
	this.acntry_cntry_nm = acntry_cntry_nm;
}
orgBfrCon =  new Array();
orgBfrConCurr =  new Array();
var conCurr = 0;
var rowsConCurr = 0;
for (var con=0; con<rowsCon; con++)
{
	orgBfrCon[con] = new arrayCon(
									tlv_Con.cntry_regn_cd[con]
								   ,tlv_Con.cntry_cntry_cd[con]
								   ,tlv_Con.cntry_cntry_nm[con]
								 )
	if (tlv_Con.cntry_cntry_nm[con].substr(0,1) != "*")
	{
		
		orgBfrConCurr[conCurr] = new arrayCon(
									tlv_Con.cntry_regn_cd[con]
								   ,tlv_Con.cntry_cntry_cd[con]
								   ,tlv_Con.cntry_cntry_nm[con]
								 )
		conCurr++;
		rowsConCurr++;
	}
}
//
//-----------------------------------------------------------------------
<cfwddx action="CFML2JS" input="#spr_getCityPost#" toplevelvariable="tlv_CP">
var rowsCP = tlv_CP.getRowCount();
function arrayCP(acity_cntry_cd, acity_city_nm )
{
	this.acity_cntry_cd = acity_cntry_cd;
	this.acity_city_nm = acity_city_nm;
}
orgBfrCP =  new Array();
for (var cp=0; cp<rowsCP; cp++)
{
	orgBfrCP[cp] = new arrayCP(
								tlv_CP.city_cntry_cd[cp]
							   ,tlv_CP.city_city_nm[cp]
							 )
}
//
//-----------------------------------------------------------------------
// AC - Additional Countries:
<cfwddx action="CFML2JS" input="#spr_getAdditionalCountry#" toplevelvariable="tlv_AC">
var rowsAC = tlv_AC.getRowCount();
//alert("rowsAC   "+rowsAC)
function arrayAC( aacntry_regn_cd, aacntry_cntry_cd, aacntry_cntry_nm)
{
	this.aacntry_regn_cd = aacntry_regn_cd;
	this.aacntry_cntry_cd = aacntry_cntry_cd;
	this.aacntry_cntry_nm = aacntry_cntry_nm;
}
orgBfrAC = new Array();
//var ac=0;
for (var ac=0; ac<rowsAC; ac++)
{
	//if (tlv_AC.cntry_cntry_nm[c].substr(0,1)!="*")
	//{
		orgBfrAC[ac] = new arrayAC(
								tlv_AC.cntry_regn_cd[ac]
							   ,tlv_AC.cntry_cntry_cd[ac]
							   ,tlv_AC.cntry_cntry_nm[ac]
							  )
		//ac++;
	//}
}
//alert("bfr  "+orgBfrAC.length)
//
//-----------------------------------------------------------------------

</script>