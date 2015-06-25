<!--- inc_NPA_ProgramOfficers.cfm --->
<script language="JavaScript">
<cfwddx action="CFML2JS" input="#spr_NPA_PrgrOfficers#" toplevelvariable="tlv_NPA_PO">
var rowsNPA_PO = tlv_NPA_PO.getRowCount();

function arrayNPA_PO (aPersonID, aPersonFullName, aPersonOrgID)
{
	this.aPersonID       = aPersonID;
	this.aPersonFullName = aPersonFullName;
	this.aPersonOrgID    = aPersonOrgID;
}

orgBufferNPA_PO = new Array();

for (var o=0; o<rowsNPA_PO; o++)
{
	orgBufferNPA_PO[o] = new arrayNPA_PO( tlv_NPA_PO.personid[o]
										 ,tlv_NPA_PO.personfullname[o]
										 ,tlv_NPA_PO.personorgid[o]
										)
}
</script>