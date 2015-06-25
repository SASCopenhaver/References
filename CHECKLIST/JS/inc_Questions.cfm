<!--- inc_Questions.cfm --->
<script language="JavaScript">
//-- Q means Question
<cfwddx action="CFML2JS" input="#spr_Questions#" toplevelvariable="tlv_Q">

var rowsQ = tlv_Q.getRowCount();
function holdQ (aIDs, aDescr, aSuperID)
				{
					this.aIDs = aIDs;
					this.aDescr = aDescr;
					this.aSuperID = aSuperID;
				}

arrayQ = new Array();
for (var i=0; i<rowsQ; i++)
{
	arrayQ[i] = new holdQ 
						(
							tlv_Q.ids[i]
						   ,tlv_Q.descr[i]
						   ,tlv_Q.superid[i]
						);
}
//alert(rowsQ)
</script>