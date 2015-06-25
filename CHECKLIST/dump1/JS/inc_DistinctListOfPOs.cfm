<!--- inc_DistinctListOfPOs.cfm --->
<script language="JavaScript" type="text/javascript">
<cfwddx action="CFML2JS" input="#spr_DistinctListOfPOsInDoS#" toplevelvariable="tlv_DLP">
var rowsDLP = tlv_DLP.getRowCount();
function arrayDPL (aDoSPrgramOffiserID, 
				   aDoSProgramOfficerName, 
				   aDosProgramOfficerEMail, 
				   aDoSOfficeSymbol, 
				   aDOSOfficeID)
{
	this.aDoSPrgramOffiserID = aDoSPrgramOffiserID;
	this.aDoSProgramOfficerName = aDoSProgramOfficerName;
	this.aDosProgramOfficerEMail = aDosProgramOfficerEMail;
	this.aDoSOfficeSymbol = aDoSOfficeSymbol;
	this.aDOSOfficeID = aDOSOfficeID;
}
//

orgBufferDLP = new Array();
for (var dlp=0; dlp<rowsDLP; dlp++)
{
	orgBufferDLP[dlp] = new arrayDPL(
										tlv_DLP.dosprgramoffiserid[dlp],
										tlv_DLP.dosprogramofficername[dlp],
										tlv_DLP.dosprogramofficeremail[dlp],
										tlv_DLP.dosofficesymbol[dlp],
										tlv_DLP.dosofficeid[dlp]
									);
}
//alert(rowsDLP)
</script> 