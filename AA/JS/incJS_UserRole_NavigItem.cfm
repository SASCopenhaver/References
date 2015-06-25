<!--- incJS_UserRole_NavigItem.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getUserRole_NavigItem#" toplevelvariable="tlv_URNI">
var rowsURNI = tlv_URNI.getRowCount();
function arrayURNI (astr_st_id, astr_r_id)
{
	this.astr_st_id = astr_st_id; this.astr_r_id = astr_r_id;
}
orgBfrURNI = new Array();
for (var urni=0; urni<rowsURNI; urni++)
{
	orgBfrURNI[urni] = new arrayURNI ( tlv_URNI.str_st_id[urni], tlv_URNI.str_r_id[urni] )
}
</script>

