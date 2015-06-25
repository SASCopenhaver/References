<!--- incJS_ArrayCustomSearches.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getCustomSearches#" toplevelvariable="tlv_CS">
var rowsCS = tlv_CS.getRowCount();
//alert(rowsCS)
function arrayCS(acust_search_id, acust_search_usr_cd, acust_search_nm, acust_search_gender_cd, 
				 acust_search_frst_nm, acust_search_last_nm, acust_search_from_cntry_cd, acust_search_to_cntry_cd,
				 acust_search_pgm_type_cd, acust_search_yr_type, acust_search_yr,
				 acust_search_field_stdy_nm, acust_search_ctznsp_cntry_cd, acust_search_resdnc_cntry_cd,
				 acust_search_resdnc_city_nm, acust_search_host_inst_nm, acust_search_city_visit_nm
				 )
{
	this.acust_search_id = acust_search_id;
	this.acust_search_usr_cd = acust_search_usr_cd;	
	this.acust_search_nm = acust_search_nm;
	this.acust_search_gender_cd = acust_search_gender_cd;
	this.acust_search_frst_nm = acust_search_frst_nm;
	this.acust_search_last_nm = acust_search_last_nm;
	this.acust_search_from_cntry_cd = acust_search_from_cntry_cd;
	this.acust_search_to_cntry_cd = acust_search_to_cntry_cd;
	this.acust_search_pgm_type_cd = acust_search_pgm_type_cd;
	this.acust_search_yr_type = acust_search_yr_type;
	this.acust_search_yr = acust_search_yr;
	this.acust_search_field_stdy_nm = acust_search_field_stdy_nm;
    this.acust_search_ctznsp_cntry_cd = acust_search_ctznsp_cntry_cd;
    this.acust_search_resdnc_cntry_cd = acust_search_resdnc_cntry_cd;
    this.acust_search_resdnc_city_nm = acust_search_resdnc_city_nm;
    this.acust_search_host_inst_nm = acust_search_host_inst_nm;
    this.acust_search_city_visit_nm = acust_search_city_visit_nm;
}
orgBrgCS = new Array();
for (var cs=0; cs<rowsCS; cs++)
{
	orgBrgCS[cs] = new arrayCS(
							 tlv_CS.cust_search_id[cs]
							,tlv_CS.cust_search_usr_cd[cs]
							,tlv_CS.cust_search_nm[cs]
							,tlv_CS.cust_search_gender_cd[cs]
							,tlv_CS.cust_search_frst_nm[cs]
							,tlv_CS.cust_search_last_nm[cs]
							,tlv_CS.cust_search_from_cntry_cd[cs]
							,tlv_CS.cust_search_to_cntry_cd[cs]
							,tlv_CS.cust_search_pgm_type_cd[cs]
							,tlv_CS.cust_search_yr_type[cs]
							,tlv_CS.cust_search_yr[cs]
							,tlv_CS.cust_search_field_stdy_nm[cs]
       					    ,tlv_CS.cust_search_ctznsp_cntry_cd[cs]
       						,tlv_CS.cust_search_resdnc_cntry_cd[cs]
       						,tlv_CS.cust_search_resdnc_city_nm[cs]
       						,tlv_CS.cust_search_host_inst_nm[cs]
       						,tlv_CS.cust_search_city_visit_nm[cs]
						  );
}
</script>
