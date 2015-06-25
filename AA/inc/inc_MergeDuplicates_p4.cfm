<!--- inc_MergeDuplicates_p4.cfm --->
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getRecordsToMerge#" output="spr_getRecordsToMerge">
<cfset local.NumOfColumns = "#spr_getRecordsToMerge.recordCount#">

<script language="javascript" type="text/javascript">
function js_outputUsrData()
{
	var vNumOfColumns = "<cfoutput>#local.NumOfColumns#</cfoutput>";
	var vFirstClmnWidth = 10;
	var vWidth = 0;
	var vOutput = "";
	//
	vWidth = (100 - vFirstClmnWidth) / (parseInt(vNumOfColumns) +1)
	//
	vOutput += "<style type=\"text/css\">";
	vOutput += ".feature table tr th";
	vOutput += "{";
	vOutput += "width:"+vFirstClmnWidth+"%;";
	vOutput += "}";
	vOutput += ".feature table tr td";
	vOutput += "{";
	vOutput += "width:"+vWidth+"%;";
	vOutput += "}";
	vOutput += "</style>";
	
	document.write(vOutput);
}
//
//---------------------------------------------------------------------
function js_behaveLikeRadioButton(argCtrlName, argNumOfDups, argCtrlTypeForResult)
{with(self.document.forms[0]) {//alert(argCtrlName+"  "+argNumOfDups+"   "+argCtrlTypeForResult)
	
	var vPartialCtrlName = argCtrlName.substr(4,4);
	var vTrueFalse = eval(argCtrlName+".checked");
	var vCtrlVal = "";
	var vStrLength = 0;
	var vStr = "";
	//
	for (var e=0; e<elements.length; e++)
	{
				//1
				if (elements[e].name.substr(4,4) == vPartialCtrlName )
				{
						//
						for (var ee=e; ee<(parseInt(e)+parseInt(argNumOfDups)+1); ee++) { elements[ee].checked = false; }
						//2 alert(eval(argCtrlName+".checked"))
						if (vTrueFalse == true) 
						{ 
								eval(argCtrlName+".checked = true"); 
								vStrLength = eval(argCtrlName+".value.length")
								vCtrlVal = eval(argCtrlName+".value"); 
						}
						else 
						{ 
								switch (argCtrlTypeForResult)
								{
									case "ddlb":
										vCtrlVal = "-1";
									break;
									//
									case "txt_":
										vCtrlVal = "";
									break;
								}
						
						}// end of if 2
						//
						switch (argCtrlTypeForResult)
						{
								case "ddlb":
									of_selectedInDDLB ("ddlb_"+vPartialCtrlName, vCtrlVal);
								break;
								//
								case "txt_":
									vCtrlVal = f_LaundryText(vCtrlVal);
									eval(argCtrlTypeForResult+vPartialCtrlName+".value = \""+vCtrlVal+"\"");
								break;
						}
						//
						break;
				}// end of if 1
	}//end of loop
}}
//
//-----------------------------------------------------------------------------------------

function f_Validate(){with(self.document.forms[0])
{
	var vValidationPassed = "YES";
	//
	var vLoopCounter = 0;
	
	//inc_MergeDups_NAME.cfm
	vValidationPassed = f_miniValidation("ddlb_PRFX");
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_FNME"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_MINT"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_LNME"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_LNM2"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_SUFX"); }
	//
	//inc_MergeDups_Sex_DOB.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_SEXI"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_ADOB"); }
	//
	//inc_MergeDups_DCSD_DESBL.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_DEAD"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_DSBL"); }
	//
	//inc_MergeDups_CTZNSP.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_CTZP"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_CTZ2"); }
	//
	//inc_MergeDups_RES_ADDR.cfm 
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_RADD"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_RCTY"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_RSPR"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_RZIP"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_RCRY"); }
	//
	//inc_MergeDups_BUS_ADDR.cfm 
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_BADD"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_BNME"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_BCTY"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_BSPR"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_BZIP"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_BCRY"); }
	//
	//inc_MergeDups_PRFRD_ADDR.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_PADD"); }
	//
	//inc_MergeDups_PHONE.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_RPHN"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_BPHN"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_CPHN"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_OPHN"); }
	//
	//inc_MergeDups_FAX.cfm 
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_FNUM"); }
	//
	//inc_MergeDups_PRFRD_PHONE.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_PPHN"); }
	//
	//inc_MergeDups_EMAIL.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_EMAL"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_EML2"); }
	//
	//inc_MergeDups_PRFRD_EMAIL.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_PEML"); }
	//
	//inc_MergeDups_CONTACT.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_CNCT"); }
	//
	//inc_MergeDups_ELP.cfm
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_ELPS"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_ELPR"); }
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("ddlb_ELPC"); }
	//
	//inc_MergeDups_COMMENTS.cfm 
	if (vValidationPassed == "YES"){ vValidationPassed = f_miniValidation("txt_NOTS"); }
	//	
	//
	if (vValidationPassed == "YES") 
	{
			for (var e=0; e<elements.length; e++)
			{
				if (elements[e].type == "hidden" && elements[e].name.substr(0, 10) == "h_almn_id_")
				{
					h_almn_id.value += elements[e].value+",";
					vLoopCounter++;
				}
			}
			//
			h_loop_counter.value = vLoopCounter;
			//
			of_CallFile('getMergeVals'); 
	}
	//
}}
//
//------------------------------------------------------------------------------------------------

function f_miniValidation(argCtrlName){with (self.document.forms[0])
{
	var vValidationPassed = "YES";
	var vCounter = 0;
	var vCtrlType = argCtrlName.substr(0,1)/*Could be "t" or "d"*/
	var vCbxName = "cbx_";
	var vCtrlValue = eval(argCtrlName+".value");
	//
	switch (vCtrlType)
	{
		case "t":
			vCbxName = vCbxName + argCtrlName.substr(4,4)
		break;
		//
		case "d":
			vCbxName = vCbxName + argCtrlName.substr(5,4)
		break;
	}
	//
	for(var e=0; e<elements.length; e++)
	{
		if ( elements[e].name.substr(0,8) == vCbxName )
		{
			if (vCtrlType == "t" && elements[e].value != "" ){ vCounter++; break;}
			//
			if (vCtrlType == "d" && elements[e].value !="-1"){ vCounter++; break;}
		}
	}
	//
	if (vCounter != 0 && (vCtrlValue == "" || vCtrlValue == "-1") )
	{
		vValidationPassed = "NO"; 
		alert("One or more records have value(s) in the field "+elements[e].alt+".\nYou should select one for merged record.\nPlease apply changes.");
	}
	//
	return vValidationPassed;
}}
//
//-------------------------------------------------------------------------------------------------

function f_fillMergedColumn(argProperty, argValCompareWith, argOutputType){with (self.document.forms[0])
{ 
	//
	var vCounter = 0;
	var vValue1 = "";
	var vValue2 = "";
	var vE = 0;
	//
	
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].name.substr(0,9) == "cbx_"+argProperty+"_" && elements[e].value != argValCompareWith)
		{ 
			if (vValue1 == ""){ vE = e; vValue1 = elements[vE].value; vCounter++; }//vValue1 gets value from the first checkbox
			//
			if (vCounter >= 1){ vValue2 = elements[e].value; vCounter++; }
			//
			if ( vValue1 != vValue2 ){ vCounter = 0; break; }
		}
	}//end of for loop
	//
	if (vCounter == 1 || (vCounter > 1 && vValue1 == vValue2))
	{
		elements[vE].checked = true;
		
		switch (argOutputType)
		{
			case"ddlb":
				of_selectedInDDLB ("ddlb_"+elements[vE].name.substr(4,4), vValue1);	
			break;
			//
			case"txt":
				vValue1 = f_LaundryText(vValue1);
				//
				eval("txt_"+elements[vE].name.substr(4,4)+".value='"+vValue1+"'");
			break;
		}
	}
	//
	vCounter = 0; vValue1 = ""; vValue2 = ""; vE = 0;
}}

//
//------------------------------------------------------------------------------------------------------------

function f_LaundryText(arg_vValue1){with(self.document.forms[0])
{
	var vRtn = "";
	var vChar = "";
	for (var c=0; c<arg_vValue1.length; c++)
	{
		// Code 13 is "next line"; Code 39 is "'"- single quote
			 if (arg_vValue1.charCodeAt(c) == 13) { vChar = " "; }
		else if (arg_vValue1.charCodeAt(c) == 39) { vChar = "`"; }
		else                                      { vChar = arg_vValue1.charAt(c); }
		//
		vRtn = vRtn + vChar;
	}
	//
	return vRtn;
}}
</script>
<div class="feature">
<p><cfinclude template="inc_MergeDups_NAME.cfm"></p>
<p><cfinclude template="inc_MergeDups_Sex_DOB.cfm"></p>
<p><cfinclude template="inc_MergeDups_DCSD_DESBL.cfm"></p>
<p><cfinclude template="inc_MergeDups_CTZNSP.cfm"></p>

<p><cfinclude template="inc_MergeDups_RES_ADDR.cfm"></p>
<p><cfinclude template="inc_MergeDups_BUS_ADDR.cfm"></p>

<p><cfinclude template="inc_MergeDups_PRFRD_ADDR.cfm"></p>
<p><cfinclude template="inc_MergeDups_PHONE.cfm"></p>
<p><cfinclude template="inc_MergeDups_FAX.cfm"></p>
<p><cfinclude template="inc_MergeDups_PRFRD_PHONE.cfm"></p>

<p><cfinclude template="inc_MergeDups_EMAIL.cfm"></p>
<p><cfinclude template="inc_MergeDups_PRFRD_EMAIL.cfm"></p>
<p><cfinclude template="inc_MergeDups_CONTACT.cfm"></p>
<p><cfinclude template="inc_MergeDups_ELP.cfm"></p>
<p><cfinclude template="inc_MergeDups_COMMENTS.cfm"></p>
<p><cfinclude template="inc_MergeDups_BUTTON.cfm"></p>
</div>
<script language="javascript" type="text/javascript">
	js_outputUsrData();
</script>

