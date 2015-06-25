<!--- incJS_AllNavigationItems.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getAllNavigationItems#" toplevelvariable="tlv_ANI">
var rowsANI = tlv_ANI.getRowCount();
function arrayANI(ast_id, ast_nm, ast_loc, ast_parent_id, ast_is_act, ast_seq, ast_call_file)
{
	this.ast_id = ast_id;	this.ast_nm = ast_nm;	this.ast_loc = ast_loc;	this.ast_parent_id = ast_parent_id;
	this.ast_is_act = ast_is_act;	this.ast_seq = ast_seq;	this.ast_call_file = ast_call_file;
}
orgBfrANI = new Array();
for (var ani=0; ani<rowsANI; ani++)
{
	orgBfrANI[ani] = new arrayANI(	tlv_ANI.st_id[ani]
								   ,tlv_ANI.st_nm[ani]
								   ,tlv_ANI.st_loc[ani]
								   ,tlv_ANI.st_parent_id[ani]
								   ,tlv_ANI.st_is_act[ani]
								   ,tlv_ANI.st_seq[ani]
								   ,tlv_ANI.st_call_file[ani]
								  )
}
</script>

