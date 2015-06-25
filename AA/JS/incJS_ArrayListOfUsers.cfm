<!--- incJS_ArrayListOfUsers ---><!--- <cfoutput>#spr_getListOfUsers.columnList#</cfoutput><cfabort> --->
<!--- 
USR_CD, USR_LNAME_ALPHA, USR_FULL_NM, USR_PHONE, USR_EXT, USR_EMAIL, USR_ROLE_CD, USR_ROLE_NM,
USR_IS_ACT, IS_ACT_NM, USR_CNTRY_CNTRY_CD, USR_CNTRY_CNTRY_NM, USR_CNTRY_CITY_POST_NM,
USR_CNTRY_IS_PRMRY, USR_CNTRY_OFC_ABBR 
 --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getListOfUsers#" toplevelvariable="tlv_L">
var rowsL = tlv_L.getRowCount();

function arrayL( aUSR_CD, aUSR_LNAME_ALPHA, aUSR_FULL_NM, aUSR_PHONE, aUSR_EXT, aUSR_EMAIL, aUSR_ROLE_CD, aUSR_ROLE_NM, aUSR_IS_ACT,
				 aIS_ACT_NM, aUSR_CNTRY_CNTRY_CD, aUSR_CNTRY_CNTRY_NM, aUSR_CNTRY_CITY_POST_NM, aUSR_CNTRY_IS_PRMRY, aUSR_CNTRY_OFC_ABBR )
{
	this.aUSR_CD = aUSR_CD;						this.aUSR_LNAME_ALPHA = aUSR_LNAME_ALPHA;		this.aUSR_FULL_NM = aUSR_FULL_NM;
	this.aUSR_PHONE = aUSR_PHONE;				this.aUSR_EXT = aUSR_EXT;						this.aUSR_EMAIL = aUSR_EMAIL;
	this.aUSR_ROLE_CD = aUSR_ROLE_CD;			this.aUSR_ROLE_NM = aUSR_ROLE_NM;				this.aUSR_IS_ACT = aUSR_IS_ACT;
	this.aIS_ACT_NM = aIS_ACT_NM;				this.aUSR_CNTRY_CNTRY_CD = aUSR_CNTRY_CNTRY_CD;	this.aUSR_CNTRY_CNTRY_NM = aUSR_CNTRY_CNTRY_NM;
	this.aUSR_CNTRY_CITY_POST_NM = aUSR_CNTRY_CITY_POST_NM;	this.aUSR_CNTRY_IS_PRMRY = aUSR_CNTRY_IS_PRMRY; this.aUSR_CNTRY_OFC_ABBR = aUSR_CNTRY_OFC_ABBR;
}
//
orgBfrL = new Array();
//
for (var l=0; l<rowsL; l++)
{
	orgBfrL[l] = new arrayL(
							  tlv_L.usr_cd[l],
							  tlv_L.usr_lname_alpha[l],
							  tlv_L.usr_full_nm[l],
							  tlv_L.usr_phone[l],
							  tlv_L.usr_ext[l],
							  tlv_L.usr_email[l],
							  tlv_L.usr_role_cd[l],
							  tlv_L.usr_role_nm[l],
							  tlv_L.usr_is_act[l],
							  tlv_L.is_act_nm[l],
							  tlv_L.usr_cntry_cntry_cd[l],
							  tlv_L.usr_cntry_cntry_nm[l],
							  tlv_L.usr_cntry_city_post_nm[l],
							  tlv_L.usr_cntry_is_prmry[l],
							  tlv_L.usr_cntry_ofc_abbr[l]
							 )
}
</script>

