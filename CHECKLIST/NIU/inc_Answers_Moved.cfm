<!--- inc_Answers.cfm --->
<script language="JavaScript">
<cfwddx action="CFML2JS" input="#spr_getAnswers#" toplevelvariable="tlv_A">
var rowsA = tlv_A.getRowCount();

function arrayA ( aPersonID, aPrjID, 
				  aQ_101, aQ_102, aQ_103, aQ_104, aQ_105, aQ_106, aQ_107, aQ_108, aQ_109, 
				  aQ_110, aQ_111, aQ_112, aQ_113, aQ_114, aQ_115, aQ_116, aQ_117, aQ_118, 
				  aQ_119, aQ_120, aQ_121, aQ_122, aQ_123, aQ_124, aQ_125, aQ_126, aQ_127 )
{
	this.aPersonID = aPersonID;	this.aPrjID = aPrjID;
	this.aQ_101 = aQ_101;	this.aQ_102 = aQ_102;	this.aQ_103 = aQ_103;	this.aQ_104 = aQ_104;
	this.aQ_105 = aQ_105;	this.aQ_106 = aQ_106;	this.aQ_107 = aQ_107;	this.aQ_108 = aQ_108;
	this.aQ_109 = aQ_109;	this.aQ_110 = aQ_110;	this.aQ_111 = aQ_111;	this.aQ_112 = aQ_112;
	this.aQ_113 = aQ_113;	this.aQ_114 = aQ_114;	this.aQ_115 = aQ_115;	this.aQ_116 = aQ_116;
	this.aQ_117 = aQ_117;	this.aQ_118 = aQ_118;	this.aQ_119 = aQ_119;	this.aQ_120 = aQ_120;	
	this.aQ_121 = aQ_121;	this.aQ_122 = aQ_122;	this.aQ_123 = aQ_123;	this.aQ_124 = aQ_124;
	this.aQ_125 = aQ_125;	this.aQ_126 = aQ_126;	this.aQ_127 = aQ_127;	
}

orgBufferA = new Array();

for (var a=0; a<rowsA; a++)
{
	orgBufferA[a] = new arrayA(
		tlv_A.eval_personid[a],	tlv_A.eval_prjid[a],
		tlv_A.q_101[a],	tlv_A.q_102[a],	tlv_A.q_103[a],	tlv_A.q_104[a],	tlv_A.q_105[a],
		tlv_A.q_106[a],	tlv_A.q_107[a],	tlv_A.q_108[a],	tlv_A.q_109[a],	tlv_A.q_110[a],
		tlv_A.q_111[a],	tlv_A.q_112[a],	tlv_A.q_113[a],	tlv_A.q_114[a],	tlv_A.q_115[a],
		tlv_A.q_116[a],	tlv_A.q_117[a],	tlv_A.q_118[a],	tlv_A.q_119[a],	tlv_A.q_120[a],
		tlv_A.q_121[a],	tlv_A.q_122[a],	tlv_A.q_123[a],	tlv_A.q_124[a],	tlv_A.q_125[a],
		tlv_A.q_126[a],	tlv_A.q_127[a]
	);
}
//alert(arrayA.length)
/*
arrayPB[0] = new arrayA(
						arrayA[0].aPersonID, -1,
						-1, -1, -1, -1, -1, -1, -1, -1, -1,
						-1, -1, -1, -1, -1, -1, -1, -1, -1, 
						-1, -1, -1, -1, -1, -1, -1, -1, -1);
*/

</script>