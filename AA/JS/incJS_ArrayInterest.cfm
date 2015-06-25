<!--- incJS_ArrayInterest.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getInterests#" toplevelvariable="tlv_INT">
var rowsINT = tlv_INT.getRowCount();
//alert(rowsINT)
function arrayINT(aintrst_cd, aintrst_type_cd, aintrst_nm)
{
	this.aintrst_cd = aintrst_cd;
	this.aintrst_type_cd = aintrst_type_cd;
	this.aintrst_nm = aintrst_nm;
}
orgBfrINT = new Array();
for (var i=0; i<rowsINT; i++)
{
	orgBfrINT[i] = new arrayINT(
							   tlv_INT.intrst_cd[i]
							  ,tlv_INT.intrst_type_cd[i]
							  ,tlv_INT.intrst_nm[i]
							  )
}
//alert(orgBfrINT.length)
</script>

