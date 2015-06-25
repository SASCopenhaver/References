<!--- incJS_f_ShowSelection.cfm --->
<script language="javascript" type="text/javascript">
/*
function f_Trim()
	////////////////////////////////////////////////
	while(''+elements[e].value.charAt(elements[e].value.length-1)==' ')elements[e].value=elements[e].value.substring(0,elements[e].value.length-1);
	while(''+elements[e].value.charAt(0)==' ')elements[e].value=elements[e].value.substring(1,elements[e].value.length);
	//////////////////////////////////////////////
*/
function  f_showSelection(){with(self.document.forms[0])
{
	//alert("show")
	//var vReplace = txt_CS_Search_Nm.value.replace("o", "X")
	//alert(vReplace)
		
	var vSearchNm = "<span class=\"c_fieldName\">"+txt_CS_Search_Nm.value+"</span>";
	var vSSOutput = "<table width=\"100%\"  border=\"0\" cellspacing=\"1\" cellpadding=\"1\">";
	var vFieldVal = "";
	
	vSSOutput += "<tr>";
	vSSOutput += "<td  bgcolor=\"#C7DD9C\" colspan=2>";
	vSSOutput += "<span class=\"c_fieldName\">SELECTED SEARCH CRITERIA</span>";
	vSSOutput += "</td>";
	vSSOutput += "</tr>";
	//
	vSSOutput += "<tr>";
	vSSOutput += "<td colspan=2  align=\"right\" id=\"id_Search_Nm\" >" ;
	vSSOutput += vSearchNm;
	vSSOutput += "</td>";
	vSSOutput += "</tr>";
	
	//
	for (var e=0; e<elements.length; e++)
	{//alert(elements[e].name)
		//txt_CS_Frst_Nm	//txt_CS_Last_Nm	//ddlb_CS_Gender
		//ddlbm_CS_From_Cntry
		//ddlbm_CS_To_Cntry
		//ddlbm_CS_Pgm_Type 
		//ddlb_CS_Year_Type 
		//ddlb_CS_Year
		if (elements[e].name == "txt_CS_Frst_Nm")
		{
			if (elements[e].value != "")
			{
				vFieldVal = elements[e].value.replace("'","`");
				//
				vSSOutput += "<tr>";
					vSSOutput += "<td width=\"25%\" class=\"c_fieldName\"  bgcolor=\"#EDF7D8\">";
					 	vSSOutput += "First Name:";
					vSSOutput += "</td>";
					vSSOutput += "<td class=\"c_fieldValue\">";
						vSSOutput += vFieldVal;
					vSSOutput += "</td>";
				vSSOutput += "</tr>";
			}
		}
		//
		if (elements[e].name == "txt_CS_Last_Nm")
		{
			if (elements[e].value != "")
			{
				vFieldVal = elements[e].value.replace("'","`");
				//				
				vSSOutput += "<tr>";
					vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
					 	vSSOutput += "Last Name:";
					vSSOutput += "</td>";
					vSSOutput += "<td class=\"c_fieldValue\">";
						vSSOutput += vFieldVal;
					vSSOutput += "</td>";
				vSSOutput += "</tr>";
				//alert("2   "+elements[e].value)
			}
		}
		//
		//-----------------------------------------------------------
		
		if (elements[e].name == "ddlb_CS_Gender")
		{
			switch(ddlb_CS_Gender.options[ddlb_CS_Gender.options.selectedIndex].value)
			{
				case "-1":
					vSSOutput += "";//"Male and Female";
				break;
				case "F":
					vSSOutput += "<tr>";
					vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
					vSSOutput += "Gender:";
					vSSOutput += "</td>";
					vSSOutput += "<td class=\"c_fieldValue\">";
					vSSOutput += "Female";
					vSSOutput += "</td>";
					vSSOutput += "</tr>";
				break;
				case "M":
					vSSOutput += "<tr>";
					vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
					vSSOutput += "Gender:";
					vSSOutput += "</td>";
					vSSOutput += "<td class=\"c_fieldValue\">";
					vSSOutput += "Male";
					vSSOutput += "</td>";
					vSSOutput += "</tr>";
				break;
			}
			
	  	 }
		//
		//-----------------------------------------------------------
		if (elements[e].name == "ddlbm_CS_From_Cntry")
		{
			if (elements[e].value != "-1")
			{
				var vTempString = "";
				vSSOutput += "<tr>";
					 vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
						vSSOutput += "Country From:";
					 vSSOutput += "</td>";
					 vSSOutput += "<td class=\"c_fieldValue\">";
						for (var i=0; i<ddlbm_CS_From_Cntry.options.length; i++)
						{
							if( ddlbm_CS_From_Cntry.options[i].selected )
							{
								vTempString += ddlbm_CS_From_Cntry.options[i].text+", ";
							}
						}
						vTempString = vTempString.substr(0, (parseInt(vTempString.length)-2))
					vSSOutput += vTempString;
					vSSOutput += "</td>";
				 vSSOutput += "</tr>";
				 
			}
			
		}
		//-----------------------------------------------------------
		if (elements[e].name == "ddlbm_CS_To_Cntry")
		{
			if (elements[e].value != "-1")
			{
				var vTempString = "";
				vSSOutput += "<tr>";
					 vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
						vSSOutput += "Country To:";
					 vSSOutput += "</td>";
					 vSSOutput += "<td class=\"c_fieldValue\">";
						for (var i=0; i<ddlbm_CS_To_Cntry.options.length; i++)
						{
							if( ddlbm_CS_To_Cntry.options[i].selected )
							{
								vTempString += ddlbm_CS_To_Cntry.options[i].text+", ";
							}
						}
						vTempString = vTempString.substr(0, (parseInt(vTempString.length)-2))
					vSSOutput += vTempString;
					vSSOutput += "</td>";
				 vSSOutput += "</tr>";
				 
			}
			
		}
		//-----------------------------------------------------------
		if (elements[e].name == "ddlbm_CS_Pgm_Type")
		{
			if (elements[e].value != "-1")
			{
				var vTempString = "";
				vSSOutput += "<tr>";
					 vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
						vSSOutput += "Program Type:";
					 vSSOutput += "</td>";
					 vSSOutput += "<td class=\"c_fieldValue\">";
						for (var i=0; i<ddlbm_CS_Pgm_Type.options.length; i++)
						{
							if( ddlbm_CS_Pgm_Type.options[i].selected )
							{
								vTempString += ddlbm_CS_Pgm_Type.options[i].text+", ";
							}
						}
						vTempString = vTempString.substr(0, (parseInt(vTempString.length)-2))
					vSSOutput += vTempString;
					vSSOutput += "</td>";
				 vSSOutput += "</tr>";
				 
			}
			
		}
		//-----------------------------------------------------------
		if (elements[e].name == "ddlb_CS_Year_Type" && elements[e].value !="-1") 
		{
			vSSOutput += "<tr>";
				 vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
					vSSOutput += "Year Type:";
				 vSSOutput += "</td>";
				 vSSOutput += "<td class=\"c_fieldValue\">";
				for (var i=0; i<ddlb_CS_Year_Type.options.length; i++)
				{
					if( ddlb_CS_Year_Type.options[i].selected )
					{
						
						vSSOutput += ddlb_CS_Year_Type.options[i].text;
						break;
					}
				}
				 vSSOutput += "</td>";
			 vSSOutput += "</tr>";
			 
		 }
		 else if (elements[e].name == "ddlb_CS_Year_Type" && elements[e].value =="-1")
		 {
		 	ddlb_CS_Year.options[0].selected = true;
		 }
		//-----------------------------------------------------------
		if (elements[e].name == "ddlb_CS_Year" && elements[e].value !="-1") 
		{
			
			 if (elements[e].value != "-1")
			 {
			 	var vTempString = "";
				vSSOutput += "<tr>";
					 vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
						vSSOutput += "Year:";
					 vSSOutput += "</td>";
					 vSSOutput += "<td class=\"c_fieldValue\">";
					 	for (var i=0; i<ddlb_CS_Year.options.length; i++)
						{
							if( ddlb_CS_Year.options[i].selected )
							{
								vTempString += ddlb_CS_Year.options[i].text+", ";
							}
						}
						vTempString = vTempString.substr(0, (parseInt(vTempString.length)-2));
					vSSOutput += vTempString;
					vSSOutput += "</td>";
				 vSSOutput += "</tr>";
			 
			 }
		}
		//----------------------------------------------------------
		// ADDITIONAL FIELDS:
		//-----------------------------------------------------------
		if (elements[e].name == "txt_CS_Field_Stdy_Nm")
		{
			if (elements[e].value != "")
			{
				vFieldVal = elements[e].value.replace("'","`");
				//
				vSSOutput += "<tr>";
					vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
					 	vSSOutput += "Field Of Study/Project Subject:";
					vSSOutput += "</td>";
					vSSOutput += "<td class=\"c_fieldValue\">";
						vSSOutput += vFieldVal;
					vSSOutput += "</td>";
				vSSOutput += "</tr>";
				
			}
		}
		//-----------------------------------------------------------
		if (elements[e].name == "ddlb_CS_Citznsp_Cntry_CD" && elements[e].value !="-1") 
		{
			 
			 if (elements[e].value != "-1")
			 {
			 	var vTempString = "";
				vSSOutput += "<tr>";
					 vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
						vSSOutput += "Country of Citizenship:";
					 vSSOutput += "</td>";
					 vSSOutput += "<td class=\"c_fieldValue\">";
					 	for (var i=0; i<ddlb_CS_Citznsp_Cntry_CD.options.length; i++)
						{
							if( ddlb_CS_Citznsp_Cntry_CD.options[i].selected )
							{
								vTempString += ddlb_CS_Citznsp_Cntry_CD.options[i].text+", ";
							}
						}
						vTempString = vTempString.substr(0, (parseInt(vTempString.length)-2));
					vSSOutput += vTempString;
					vSSOutput += "</td>";
				 vSSOutput += "</tr>";
			 
			 }
		}
		//-----------------------------------------------------------
		if (elements[e].name == "ddlb_CS_Resdnc_Cntry_CD" && elements[e].value !="-1") 
		{
			 
			 if (elements[e].value != "-1")
			 {
			 	var vTempString = "";
				vSSOutput += "<tr>";
					 vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
						vSSOutput += "Country of Residence:";
					 vSSOutput += "</td>";
					 vSSOutput += "<td class=\"c_fieldValue\">";
					 	for (var i=0; i<ddlb_CS_Resdnc_Cntry_CD.options.length; i++)
						{
							if( ddlb_CS_Resdnc_Cntry_CD.options[i].selected )
							{
								vTempString += ddlb_CS_Resdnc_Cntry_CD.options[i].text+", ";
							}
						}
						vTempString = vTempString.substr(0, (parseInt(vTempString.length)-2));
					vSSOutput += vTempString;
					vSSOutput += "</td>";
				 vSSOutput += "</tr>";
			 
			 }
		}
		//-----------------------------------------------------------
/*
		if (elements[e].name == "ddlb_CS_ALMN_PROMINENT_CD" && elements[e].value !="-1") 
		{
			 
			 if (elements[e].value != "-1")
			 {
			 	var vTempString = "";
				vSSOutput += "<tr>";
					 vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
						vSSOutput += "Prominent Category:";
					 vSSOutput += "</td>";
					 vSSOutput += "<td class=\"c_fieldValue\">";
					 	for (var i=0; i<ddlb_CS_ALMN_PROMINENT_CD.options.length; i++)
						{
							if( ddlb_CS_ALMN_PROMINENT_CD.options[i].selected )
							{
								vTempString += ddlb_CS_ALMN_PROMINENT_CD.options[i].text+", ";
							}
						}
						vTempString = vTempString.substr(0, (parseInt(vTempString.length)-2));
					vSSOutput += vTempString;
					vSSOutput += "</td>";
				 vSSOutput += "</tr>";
			 
			 }
		}
*/
		//-----------------------------------------------------------
		if (elements[e].name == "txt_CS_Resdnc_City_Nm")
		{
			if (elements[e].value != "")
			{
				vFieldVal = elements[e].value.replace("'","`");
				//
				vSSOutput += "<tr>";
					vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
					 	vSSOutput += "Residence City:";
					vSSOutput += "</td>";
					vSSOutput += "<td class=\"c_fieldValue\">";
						vSSOutput += vFieldVal;
					vSSOutput += "</td>";
				vSSOutput += "</tr>";
				
			}
		}
		//-----------------------------------------------------------
		if (elements[e].name == "txt_CS_Host_Instn_Nm")
		{
			if (elements[e].value != "")
			{
				vFieldVal = elements[e].value.replace("'","`");
				//
				vSSOutput += "<tr>";
					vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
					 	vSSOutput += "Host Institution:";
					vSSOutput += "</td>";
					vSSOutput += "<td class=\"c_fieldValue\">";
						vSSOutput += vFieldVal;
					vSSOutput += "</td>";
				vSSOutput += "</tr>";
				
			}
		}
		//-----------------------------------------------------------
		if (elements[e].name == "txt_CS_Visit_City_Nm")
		{
			if (elements[e].value != "")
			{
				vFieldVal = elements[e].value.replace("'","`");
				//
				vSSOutput += "<tr>";
					vSSOutput += "<td width=\"25%\" class=\"c_fieldName\" bgcolor=\"#EDF7D8\">";
					 	vSSOutput += "City Visited:";
					vSSOutput += "</td>";
					vSSOutput += "<td class=\"c_fieldValue\">";
						vSSOutput += vFieldVal;
					vSSOutput += "</td>";
				vSSOutput += "</tr>";
				
			}
		}
		//-----------------------------------------------------------
	}//end of loop
	vSSOutput += "</table>";
	//
	//h_showSelection.value = "";
	//h_showSelection.value = vSSOutput;
	//alert(vSSOutput)
	//
	if (vSSOutput.length == 176)/*176 assumes presence of the header only*/	{ vSSOutput = "&nbsp;"; }
	//
	//
	//if ( "<cfoutput>#client.CS_SetDefault#</cfoutput>" == "YES" )
	//{
		of_innerHTML("id_SearchCriteria", "'"+vSSOutput+"'");
	//}
	
	//
	h_SearchCriteria.value = vSSOutput;
}}// end of function
</script>