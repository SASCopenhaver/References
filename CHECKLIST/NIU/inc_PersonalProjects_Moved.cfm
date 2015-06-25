
<script language="JavaScript">
<cfwddx action="CFML2JS" input="#spr_getPersonalProjects#" toplevelvariable="tlv_PP">
var rowsPP = tlv_PP.getRowCount();
vPrjTotal = rowsPP;
//
function arrayPP ( aPrjID
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


orgBufferPP = new Array();
for (var pp=0; pp<rowsPP; pp++)
{
	orgBufferPP[pp] = new arrayPP
								(
									tlv_PP.prjid[pp]
								   ,tlv_PP.prjnum[pp]
								   ,tlv_PP.prjtitle[pp]
								   ,tlv_PP.prjfiscalyear[pp]
								   ,tlv_PP.prgragency[pp]
								   ,tlv_PP.prgragencyid[pp]
								   ,tlv_PP.npaofficerid[pp]
								   ,tlv_PP.npaofficername[pp]
								   ,tlv_PP.evdb_presence[pp]
								   ,tlv_PP.strgoalid[pp]
								   ,tlv_PP.strgoalname[pp]
								   ,tlv_PP.prjcomments[pp]
								   ,tlv_PP.evalstatus[pp]
								   ,tlv_PP.prjcurrentstatus[pp]
								   
								)
	//
	      if (tlv_PP.prjcurrentstatus[pp] == "ACT"){ vPrjActive++; }
	else if  (tlv_PP.prjcurrentstatus[pp] == "CLO"){ vPrjClosed++; }
	else if  (tlv_PP.prjcurrentstatus[pp] == "COM"){ vPrjCompleted++; }
	
	if ( tlv_PP.prjcurrentstatus[pp] != "ACT" )
	{
		     if (tlv_PP.evalstatus[pp] == "NE"){ vPrjNE++; }
		else if (tlv_PP.evalstatus[pp] == "PE"){ vPrjPE++; }
		else if (tlv_PP.evalstatus[pp] == "E") { vPrjE++;  }
	}
}


vPrjCLO_COM = parseInt(vPrjClosed)+parseInt(vPrjCompleted);
	
vPerOfEval = (parseInt(vPrjE)*100)/parseInt(vPrjTotal);

</script>

