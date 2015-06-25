<!--- incJS_ArrayComments.cfm --->
<script language="javascript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_getUsrComment#" toplevelvariable="tlv_Comm">
var rowsComm = tlv_Comm.getRowCount();
function arrayComm(aUSR_COMNT_USR_ID, aUSR_COMNT_COMNT_TXT, aUSR_COMNT_REQCHG_TXT)
{
	this.aUSR_COMNT_USR_ID = aUSR_COMNT_USR_ID;
	this.aUSR_COMNT_COMNT_TXT = aUSR_COMNT_COMNT_TXT;
	this.aUSR_COMNT_REQCHG_TXT = aUSR_COMNT_REQCHG_TXT;
}
//
orgBfrComm = new Array();
for (var c=0; c<rowsComm; c++)
{
	orgBfrComm[c] = new arrayComm(tlv_Comm.usr_comnt_usr_id[c], tlv_Comm.usr_comnt_comnt_txt[c], tlv_Comm.usr_comnt_reqchg_txt[c])
}
</script>

