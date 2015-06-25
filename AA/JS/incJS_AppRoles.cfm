<!--- incJS_AppRoles.cfm --->
<script language="javascript" type="text/javascript">
//Application Roles
//--------------------------------------------------------------------------
<cfwddx action="CFML2JS" input="#spr_getAppRoles#" toplevelvariable="tlv_AR">
var rowsAR = tlv_AR.getRowCount();
function arrayAR( aapp_role_id, aapp_role_nm, aapp_role_desc, aapp_role_super_id, aapp_role_super_nm, aapp_role_all_cntry_access ) 
{
	this.aapp_role_id = aapp_role_id;
	//this.aapp_role_cd = aapp_role_cd;
	this.aapp_role_nm = aapp_role_nm;
	this.aapp_role_desc = aapp_role_desc;
	this.aapp_role_super_id = aapp_role_super_id;
	this.aapp_role_super_nm = aapp_role_super_nm;
	this.aapp_role_all_cntry_access = aapp_role_all_cntry_access;
}
//
orgBfrAR = new Array();
fltrBfrAR  = new Array();
var fr=0;
//
for (var ar=0; ar<rowsAR; ar++)
{
	orgBfrAR[ar] = new arrayAR( tlv_AR.app_role_id[ar]
							   ,tlv_AR.app_role_nm[ar]
							   ,tlv_AR.app_role_desc[ar]
							   ,tlv_AR.app_role_super_id[ar]
							   ,tlv_AR.app_role_super_nm[ar]
							   ,tlv_AR.app_role_all_cntry_access[ar] );
							
	if (tlv_AR.app_role_id[ar] != 0 &&
		tlv_AR.app_role_id[ar] != 1 &&
		tlv_AR.app_role_id[ar] != 304 &&
		tlv_AR.app_role_id[ar] != 21 )
	{
		fltrBfrAR[fr] = new arrayAR( 
								tlv_AR.app_role_id[ar]
							   ,tlv_AR.app_role_nm[ar]
							   ,tlv_AR.app_role_desc[ar]
							   ,tlv_AR.app_role_super_id[ar]
							   ,tlv_AR.app_role_super_nm[ar]
							   ,tlv_AR.app_role_all_cntry_access[ar] 
							   )
		fr++;
		
	}
}
//
//--------------------------------------------------------------------------
</script>

