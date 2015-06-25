
<script language="JavaScript">
//-- BP - means Branch Profile
<cfwddx action="CFML2JS" input="#spr_getBranchProfile#" toplevelvariable="tlv_BP">
var rowsBP = tlv_BP.getRowCount();

var vPrjTotal = rowsBP;
//
function arrayBP ( aDoSPrgramOffiserID
				  ,aDoSProgramOfficerName
				  ,aPrjID
				  ,aPrjNum
				  ,aPrjTitle
				  ,aPrjFiscalYear
				  ,aPrgrAgency
				  ,aPrgrAgencyID
				  ,aNPAOfficerID
				  ,aNPAOfficerName
				  ,aEVDB_Presence
				  ,aStrGoalID
				  ,aStrGoalName
				  ,aPrjComments
				  ,aEvalStatus
				  ,aPrjCurrentStatus
				)
{
  this.aDoSPrgramOffiserID = aDoSPrgramOffiserID;
  this.aDoSProgramOfficerName = aDoSProgramOfficerName;
  this.aPrjID = aPrjID;
  this.aPrjNum = aPrjNum;
  this.aPrjTitle = aPrjTitle;
  this.aPrjFiscalYear = aPrjFiscalYear;
  this.aPrgrAgency = aPrgrAgency;
  this.aPrgrAgencyID = aPrgrAgencyID;
  this.aNPAOfficerID = aNPAOfficerID;
  this.aNPAOfficerName = aNPAOfficerName;
  this.aEVDB_Presence = aEVDB_Presence;
  this.aStrGoalID = aStrGoalID;
  this.aStrGoalName = aStrGoalName;
  this.aPrjComments = aPrjComments;
  this.aEvalStatus = aEvalStatus;
  this.aPrjCurrentStatus = aPrjCurrentStatus;
}					


orgBufferBP = new Array();
for (var bp=0; bp<rowsBP; bp++)
{
	orgBufferBP[bp] = new arrayBP
								(   tlv_BP.dosprgramoffiserid[bp]
								   ,tlv_BP.dosprogramofficername[bp]
								   ,tlv_BP.prjid[bp]
								   ,tlv_BP.prjnum[bp]
								   ,tlv_BP.prjtitle[bp]
								   ,tlv_BP.prjfiscalyear[bp]
								   ,tlv_BP.prgragency[bp]
								   ,tlv_BP.prgragencyid[bp]
								   ,tlv_BP.npaofficerid[bp]
								   ,tlv_BP.npaofficername[bp]
								   ,tlv_BP.evdb_presence[bp]
								   ,tlv_BP.strgoalid[bp]
								   ,tlv_BP.strgoalname[bp]
								   ,tlv_BP.prjcomments[bp]
								   ,tlv_BP.evalstatus[bp]
								   ,tlv_BP.prjcurrentstatus[bp]
								   
								)
	//
	      if (tlv_BP.prjcurrentstatus[bp] == "ACT"){ vPrjActive++; }
	else if  (tlv_BP.prjcurrentstatus[bp] == "CLO"){ vPrjClosed++; }
	else if  (tlv_BP.prjcurrentstatus[bp] == "COM"){ vPrjCompleted++; }
	
	if ( tlv_BP.prjcurrentstatus[bp] != "ACT" )
	{
		     if (tlv_BP.evalstatus[bp] == "NE"){ vPrjNE++; }
		else if (tlv_BP.evalstatus[bp] == "PE"){ vPrjPE++; }
		else if (tlv_BP.evalstatus[bp] == "E") { vPrjE++;  }
	}
}


vPrjCLO_COM = parseInt(vPrjClosed)+parseInt(vPrjCompleted);
	
if (vPrjTotal != 0)
{
	vPerOfEval = Math.round((parseInt(vPrjE)*100)/parseInt(vPrjCLO_COM));
}
else
{
	vPerOfEval = 0;
}

</script>

