<!--- incJS_ArraySearchedRecords.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getSearchedRecords#" toplevelvariable="tlv_SR">
var rowsSR = tlv_SR.getRowCount();
function arraySR(acsr_usr_cd, 
				 acsr_rcrd_num, 
				 acsr_almn_id, 
				 acsr_almn_last_nm, 
				 acsr_almn_full_nm, 
				 acsr_gender, 
				 acsr_pgm_field_stdy_cd, 
				 acsr_field_stdy_nm, 
				 acsr_pgm_topic_txt,
				 acsr_pgm_type_cd, 
				 acsr_pgm_type_nm, 
				 acsr_pgm_fy_dt, 
				 acsr_pgm_yr_dt, 
				 acsr_almn_updt_id, 
				 acsr_almn_updt_dt, 
				 acsr_updt_usr_nm)
{
 	this.acsr_usr_cd = acsr_usr_cd;
	this.acsr_rcrd_num = acsr_rcrd_num;
	this.acsr_almn_id= acsr_almn_id;
	this.acsr_almn_last_nm = acsr_almn_last_nm;
	this.acsr_almn_full_nm = acsr_almn_full_nm;
	this.acsr_gender = acsr_gender;
	this.acsr_pgm_field_stdy_cd = acsr_pgm_field_stdy_cd;
	this.acsr_field_stdy_nm = acsr_field_stdy_nm;
	this.acsr_pgm_topic_txt = acsr_pgm_topic_txt;
	this.acsr_pgm_type_cd = acsr_pgm_type_cd;
	this.acsr_pgm_type_nm = acsr_pgm_type_nm;
	this.acsr_pgm_fy_dt = acsr_pgm_fy_dt;
	this.acsr_pgm_yr_dt = acsr_pgm_yr_dt;
	this.acsr_almn_updt_id = acsr_almn_updt_id;
	this.acsr_almn_updt_dt = acsr_almn_updt_dt;
	this.acsr_updt_usr_nm =acsr_updt_usr_nm ;
}
//
function arrayAlmn( acsr_almn_id, acsr_almn_full_nm)
{
	this.acsr_almn_id = acsr_almn_id;
	this.acsr_almn_full_nm = acsr_almn_full_nm;
}
		


//
orgBfrSR = new Array();
orgBfrAlmn = new Array();
//
for (var sr=0;sr<rowsSR; sr++)
{
	orgBfrSR[sr] = new arraySR(  tlv_SR.csr_usr_cd[sr], 
								 tlv_SR.csr_rcrd_num[sr], 
								 tlv_SR.csr_almn_id[sr], 
								 tlv_SR.csr_almn_last_nm[sr], 
								 tlv_SR.csr_almn_full_nm[sr], 
								 tlv_SR.csr_gender[sr], 
								 tlv_SR.csr_pgm_field_stdy_cd[sr], 
								 tlv_SR.csr_field_stdy_nm[sr], 
								 tlv_SR.csr_pgm_topic_txt[sr],
								 tlv_SR.csr_pgm_type_cd[sr], 
								 tlv_SR.csr_pgm_type_nm[sr], 
								 tlv_SR.csr_pgm_fy_dt[sr], 
								 tlv_SR.csr_pgm_yr_dt[sr], 
								 tlv_SR.csr_almn_updt_id[sr], 
								 tlv_SR.csr_almn_updt_dt[sr], 
								 tlv_SR.csr_updt_usr_nm[sr] 
								 )
}
//
//
/*
function f_SortByID(a,b)
{
	a = parseInt(a.acsr_usr_cd);
	b = parseInt(b.acsr_usr_cd);
	return ( (a < b) ? -1 : ((a > b) ?  1 : 0) );
}
//
orgBfrSR.sort(f_SortByID);
//
//Removing duplicates based on AlmnID
var a = 0;
orgBfrAlmn[a] = new arrayAlmn (orgBfrSR[0].acsr_almn_id, 
							   orgBfrSR[0].acsr_almn_full_nm);	

for (var sr=1; sr<rowsSR; sr++ )
{
	if (orgBfrAlmn[a].acsr_almn_id != orgBfrSR[sr].acsr_almn_id)
	{
		a++;
		orgBfrAlmn[a] = new arrayAlmn (orgBfrSR[sr].acsr_almn_id, 
							   		   orgBfrSR[sr].acsr_almn_full_nm);	
		
	}
	
}//alert(orgBfrAlmn.length);
*/
</script>

