function f_loopCheckingValues(argClmnNm, argMergedCtrlType){with(self.document.forms[0]){
	//
	var vArgClmnNmLen = argClmnNm.length;
	var vVal_1 = "";//picks up the first available value != ""
	var vVal_2 = "";//picks up the second available value != "".
	var vCounter = 0;//counts number of selected programs to be shown on page
	var vCtrlNm = "";
	//var vT = 0;
	var vTemp = "";
	//
	for (var e=0; e<elements.length; e++)
	{
		if ( elements[e].type == "checkbox" && elements[e].name.substr(0,4+parseInt(vArgClmnNmLen)) == "cbx_"+argClmnNm )
		{  
			vCounter++;
			//
			if (elements[e].value != "" && vVal_1 == "") { vVal_1 = elements[e].value; vCtrlNm = elements[e].name; }	//alert("vVal_1 = "+vVal_1)
			//
			if (vVal_1 != "" && vCounter > 1) { vVal_2 = elements[e].value; }											//alert("vVal_2 = "+vVal_2)
		} 
	}			
	//
//======================================================================================================================================
	if (vCounter == 1)//====================================================================================================================
	{
			//pgm_type_nm
			if (argClmnNm == "pgm_type_nm" && vVal_1 != "")
			{
					for (var t=0; t<rowsPT; t++) { if (orgBfrPT[t].apgm_type_nm == vVal_1) { vTemp = orgBfrPT[t].apgm_type_crnt_cd; break; } }
					eval(vCtrlNm+".checked = true");
					of_selectedInDDLB ("ddlb_mrgd_"+argClmnNm, vTemp);	
			}
			else if (argClmnNm == "pgm_type_nm" && vVal_1 == "")
			{
					eval(vCtrlNm+".checked = false");
					of_selectedInDDLB ("ddlb_mrgd_"+argClmnNm, "-1");
			}
			//
			//pgm_fy_dt
			if (argClmnNm == "pgm_fy_dt" && vVal_1 != "")
			{
					vTemp = vVal_1;
					eval(vCtrlNm+".checked = true");
					eval("txt_mrgd_"+argClmnNm+".value="+vTemp);	
			}
			else if (argClmnNm == "pgm_fy_dt" && vVal_1 == "")
			{
					eval(vCtrlNm+".checked = false");
					eval("txt_mrgd_"+argClmnNm+".value=''");	
			}
			
			//
			//pgm_yr_dt
			if (argClmnNm == "pgm_yr_dt" && vVal_1 != "")
			{
					vTemp = vVal_1;
					eval(vCtrlNm+".checked = true");
					eval("txt_mrgd_"+argClmnNm+".value="+vTemp);	
			}
			else if (argClmnNm == "pgm_yr_dt" && vVal_1 == "")
			{
					eval(vCtrlNm+".checked = false");
					eval("txt_mrgd_"+argClmnNm+".value=''");	
			}
			
			//
			//pgm_start_dt
			if (argClmnNm == "pgm_start_dt" && vVal_1 != "")
			{
					vTemp = vVal_1;
					eval(vCtrlNm+".checked = true");
					eval("txt_mrgd_"+argClmnNm+".value="+vTemp);	
			}
			else if (argClmnNm == "pgm_start_dt" && vVal_1 == "")
			{
					eval(vCtrlNm+".checked = false");
					eval("txt_mrgd_"+argClmnNm+".value=''");	
			}
	}
	else if (vCounter > 1)//====================================================================================================================
	{
			//pgm_type_nm
			if (argClmnNm == "pgm_type_nm" && ((vVal_1 == "" && vVal_1 == vVal_2) || (vVal_1 != "" && vVal_1 != vVal_2)))
			{//alert("1   "+vVal_1+"   "+vVal_2)
					eval(vCtrlNm+".checked = false");
					of_selectedInDDLB ("ddlb_mrgd_"+argClmnNm, "-1");
			}
			else if (argClmnNm == "pgm_type_nm" && vVal_1 != "" && vVal_1 == vVal_2 )
			{//alert("2   "+vVal_1+"   "+vVal_2)
					for (var t=0; t<rowsPT; t++) { if (orgBfrPT[t].apgm_type_nm == vVal_1) { vTemp = orgBfrPT[t].apgm_type_crnt_cd; break; } }
					eval(vCtrlNm+".checked = true");
					of_selectedInDDLB ("ddlb_mrgd_"+argClmnNm, vTemp);	
			}
			//
			//pgm_fy_dt
			if (argClmnNm == "pgm_fy_dt" && ((vVal_1 == "" && vVal_1 == vVal_2) || (vVal_1 != "" && vVal_1 != vVal_2)))
			{
					eval(vCtrlNm+".checked = false");
					eval("txt_mrgd_"+argClmnNm+".value=''");	
			}
			else if (argClmnNm == "pgm_fy_dt" && vVal_1 != "" && vVal_1 == vVal_2 )
			{
					vTemp = vVal_1;
					eval(vCtrlNm+".checked = true");
					eval("txt_mrgd_"+argClmnNm+".value="+vTemp);	
			}
			//
			//pgm_yr_dt
			if (argClmnNm == "pgm_yr_dt" && ((vVal_1 == "" && vVal_1 == vVal_2) || (vVal_1 != "" && vVal_1 != vVal_2)))
			{
					eval(vCtrlNm+".checked = false");
					eval("txt_mrgd_"+argClmnNm+".value=''");	
			}
			else if (argClmnNm == "pgm_yr_dt" && vVal_1 != "" && vVal_1 == vVal_2 )
			{
					vTemp = vVal_1;
					eval(vCtrlNm+".checked = true");
					eval("txt_mrgd_"+argClmnNm+".value="+vTemp);	
			}
			
			//
			//pgm_start_dt
			if (argClmnNm == "pgm_start_dt" && ((vVal_1 == "" && vVal_1 == vVal_2) || (vVal_1 != "" && vVal_1 != vVal_2)))
			{
					eval(vCtrlNm+".checked = false");
					eval("txt_mrgd_"+argClmnNm+".value=''");	
			}
			else if (argClmnNm == "pgm_start_dt" && vVal_1 != "" && vVal_1 == vVal_2 )
			{
					vTemp = vVal_1;
					eval(vCtrlNm+".checked = true");
					eval("txt_mrgd_"+argClmnNm+".value="+vTemp);	
			}
	}
//======================================================================================================================================
}}
