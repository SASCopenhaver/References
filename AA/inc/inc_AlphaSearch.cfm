<!--- inc_AlphaSearch.cfm --->
<div id="id_AlpphaSearch">
	<script language="javascript" type="text/javascript">
		<cfwddx action="CFML2JS" input="#spr_getAlphaSearch#" toplevelvariable="tlv_A">
		function arrayAlpha(aalpha_val){this.aalpha_val = aalpha_val;}
		orgBfrAlpha = new Array();
		for (var a=0; a<tlv_A.getRowCount(); a++) 
		{
			orgBfrAlpha[a] = new arrayAlpha(tlv_A.alpha_val[a]);
		}//alert(orgBfrAlpha.length)
		
		arryAlpha = new Array();
		arryAlpha[0] = "A";
		arryAlpha[1] = "B";
		arryAlpha[2] = "C";
		arryAlpha[3] = "D";
		arryAlpha[4] = "E";
		arryAlpha[5] = "F";
		arryAlpha[6] = "G";
		arryAlpha[7] = "H";
		arryAlpha[8] = "I";
		arryAlpha[9] = "J";
		arryAlpha[10] ="K";
		arryAlpha[11] ="L";
		arryAlpha[12] ="M";
		arryAlpha[13] ="N";
		arryAlpha[14] ="O";
		arryAlpha[15] ="P";
		arryAlpha[16] ="Q";
		arryAlpha[17] ="R";
		arryAlpha[18] ="S";
		arryAlpha[19] ="T";
		arryAlpha[20] ="U";
		arryAlpha[21] ="V";
		arryAlpha[22] ="W";
		arryAlpha[23] ="X";
		arryAlpha[24] ="Y";
		arryAlpha[25] ="Z";
		//alert(arryAlpha.length)
		var vOutputTemp = "";
		var vOutput="<table title=\"Alphabet\" width=\"100%\"  border=\"0\" cellspacing=\"1\" cellpadding=\"1\">";
		vOutput += "<tr><td colspan=\"26\"><hr></td></tr>";
		vOutput += "<tr bgcolor=\"#D9DDDC\" align=\"center\">";
		for (var aa=0; aa<arryAlpha.length; aa++)
		{//alert("a"+arryAlpha[aa])
			for (var a=0; a<orgBfrAlpha.length; a++)
			{
				if(arryAlpha[aa] == orgBfrAlpha[a].aalpha_val)
				{//alert(orgBfrAlpha[a].aalpha_val)
					
					vOutputTemp = "<a href=\"#"+orgBfrAlpha[a].aalpha_val+"\"  style=\"text-decoration:underline;\">";
					vOutputTemp += "<strong>"+orgBfrAlpha[a].aalpha_val+"</strong>";
					vOutputTemp += "</a>";
					break;
				}
				else
				{
					vOutputTemp = arryAlpha[aa];
					//break;
				}
				//break;
			}
			vOutput += "<td width=\"4%\">";
			vOutput += vOutputTemp;
			vOutput += "</td>";
				//vOutputTemp = "";
		}
		
		
		vOutput += "</tr>";
		vOutput += "<tr><td colspan=\"26\"><hr></td></tr>";
		vOutput += "</table>";
		//alert(vOutput)
		//of_innerHTML("id_AlpphaSearch", "'"+vOutput+"'");
		document.write(vOutput);
		
	</script>
	</div>