<!--- inc_ListJobRecords_p1.cfm --->
<div class="feature">
<table  width="100%"  border="0" cellspacing="2" cellpadding="2"  style="border-bottom:1px solid Gray;">
  <tr>
    <td>
		<cfoutput><strong>#client.AlmnName#</strong></cfoutput>
	</td>
  </tr>
</table>
<!--- =========================================================================================== --->
<table width="100%"  border="1" cellspacing="2" cellpadding="2"  style="border-bottom:1px solid Gray;">
	<tr class="c_fieldName">
		<th scope="col">Select</th>
		<th scope="col">Alumni ID</th>
		<th scope="col">Job Number</th>
		<th scope="col">Job Title</th>
		<th scope="col">Current<br>Job?</th>
		<th scope="col">Institution<br>Name</th>
		<th scope="col">Source</th>
	</tr>
<!--- ============================================================ --->
<cfset local.LoopNum = "1">
<cfloop query="spr_getListOfJobs" startrow="1" endrow="#spr_getListOfJobs.recordCount#">
<cfoutput>
	<tr class="c_fieldValue">
		<td scope="col"><input type="checkbox" name="cbx_job_almn_id_#local.LoopNum#" value="#job_almn_id#">#local.LoopNum#</td>
    	<td>#job_almn_id#</td>
		<td><input type="text" class="forminputs" name="txt_job_num_#local.LoopNum#" value="#job_num#" size="3"></td>
		<td><input type="text" class="forminputs" name="txt_job_title_txt_#local.LoopNum#" value="#job_title_txt#"></td>
		
		<td>
			
			<select name="ddlb_job_crnt_ind_#local.LoopNum#" class="forminputs">
				<option value="-1">Unknown</option>
				<option value="Y">Yes</option>
				<option value="N">No</option>
			</select>
			<script language="javascript" type="text/javascript">
				with (self.document.forms[0])
				{
					of_selectedInDDLB ("<cfoutput>ddlb_job_crnt_ind_#local.LoopNum#</cfoutput>", "<cfoutput>#job_crnt_ind#</cfoutput>");
				}
			</script>
		</td>
		
		<td><input type="text" class="forminputs" name="txt_job_instn_nm_#local.LoopNum#" value="#job_instn_nm#"></td>
		<td>#pgm_src_nm#</td>
  	</tr>
</cfoutput>
<cfset local.LoopNum = local.LoopNum + 1>
</cfloop>
<!--- ============================================================ --->
</table>
<!--- =========================================================================================== --->
<p>
<table align="right" width="300px"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<tr>
			<td align="left" width="80%">
				<input	type="button" 
						alt="Continue" 
						class="c_formbuttons" 
						name="cb_Continue" 
						value="Continue" 
						onClick="f_assignJobNum(); f_Validate(); f_Submit();">
			</td>
		</tr>
</table>
<input type="hidden" name="h_mergeJobRecds" value="">
<input type="hidden" name="h_LoopNum" value="">
</p>
<!--- =========================================================================================== --->
</div>
<script language="javascript" type="text/javascript">
var vValidationPassed = "YES";
var vCountJobNum = 0;
var vCtrlID = 0;
//------------------------------------------------------------------------------------------------
function f_assignJobNum(){with(self.document.forms[0]){
vValidationPassed = "YES";
vCountJobNum = 0;
vCtrlID = 0;
var vTemp = 0;
	//
	for (var e=0; e<elements.length; e++)
	{
			if (elements[e].type == "checkbox"  && elements[e].name.substr(0,16)=="cbx_job_almn_id_" )
			{
					vCountJobNum++;
					//
					if (elements[e].checked == true)
					{
						vCtrlID = elements[e].name.substr(16);
						vTemp++;
						eval("txt_job_num_"+vCtrlID+".value="+vTemp);
					}
			}
	}
}}
//
//---------------------------------------------------------------------------------------------------
function f_Validate(){with(self.document.forms[0]){
var vTempStr = "";
	// 1. Nothing was checked:
	if (vCtrlID == 0)
	{
		vValidationPassed = "NO";
		alert("Sorry, we cannot proceed with your request, one or more jobs must be checked.");
	}
	// 2. Check the presence of job title
	if (vValidationPassed == "YES")
	{
			for (var e=0; e<elements.length; e++)
			{
					if (elements[e].type == "checkbox"  && elements[e].name.substr(0,16)=="cbx_job_almn_id_" )
					{
							if (elements[e].checked == true)
							{
									vCtrlID = elements[e].name.substr(16);
									vTempStr = eval("txt_job_title_txt_"+vCtrlID+".value");
									if (vTempStr == "")
									{
										vValidationPassed = "NO";
										alert("Sorry, 'Job Title' must be provided for the record.");
										eval("txt_job_title_txt_"+vCtrlID+".focus()");
										break;
									}
							}
					}
			}
	}
}}
//
//---------------------------------------------------------------------------------------------------

function f_Submit(){with(self.document.forms[0]){
	var vBuiltString = "";
	var vLoopNum = 0;
	//---------------------------------------
	if ( vValidationPassed == "YES" )
	{
			for (var e=0; e<elements.length; e++)
			{
					if (elements[e].type == "checkbox"  && elements[e].name.substr(0,16)=="cbx_job_almn_id_" )
					{
							if (elements[e].checked == true)
							{
								vCtrlID = elements[e].name.substr(16);
								vBuiltString += f_buildString("<cfoutput>#client.AP_AlmnID#</cfoutput>", vCtrlID)+";";
								//vBuiltString += f_buildString(eval("cbx_job_almn_id_"+vCtrlID+".value"), vCtrlID)+";";
								vLoopNum++;
								//alert(vBuiltString)
							}
					}
			}
	
	//-------------------------------------
	//alert(vBuiltString)
	h_mergeJobRecds.value = vBuiltString;
	h_LoopNum.value = vLoopNum;
	//alert(h_mergeJobRecds.value)
	
	of_CallFile("mergeJobRecords");
	}
}}
//
//----------------------------------------------------------------------------------------------------
function f_buildString(argAlnmID, argCtrlID){with(self.document.forms[0]){
	var vRtnVal = "";
	var vJob_Crnt_Ind = "";
	
	//return RtnVal = eval("ddlb_job_crnt_ind_"+argAlnmID+"_"+argJobNum+".value");
	
	/*
	vRtnVal = "insert into job1 (job_almn_id, job_num, job_pgm_id, job_title_txt, job_crnt_ind, job_instn_nm, job_crtd_dt, "+
   							           "job_crtd_id, job_updt_dt, job_updt_id, original_almn_id, pgm_src_nm) "+
				"values "+
				"("+argAlnmID+", "+
			        eval("txt_job_num_"+argCtrlID+".value")+", "+
			        "null"+", "+
			   		"'"+eval("txt_job_title_txt_"+argCtrlID+".value")+"', "+//job_title_txt
					"DECODE('"+eval("ddlb_job_crnt_ind_"+argCtrlID+".value")+"','-1',null, '"+eval("ddlb_job_crnt_ind_"+argCtrlID+".value")+"'), "+//job_crnt_ind
					"'"+eval("txt_job_instn_nm_"+argCtrlID+".value")+"', "+//job_instn_nm
					"sysdate"+", "+
				    "<cfoutput>#client.Usr_CD#</cfoutput>"+", "+
				    "sysdate"+", "+
				   "<cfoutput>#client.Usr_CD#</cfoutput>"+", "+
				    "null"+", "+
   				    "'Merged')";
	*/
	
	vJob_Crnt_Ind = eval("ddlb_job_crnt_ind_"+argCtrlID+".value");
	if (vJob_Crnt_Ind == "-1"){vJob_Crnt_Ind = "N"}
	//
	
	vRtnVal = "insert into JOB1 (job_almn_id, job_num, job_pgm_id, job_title_txt, job_crnt_ind, job_instn_nm, job_crtd_dt, "+
   							           "job_crtd_id, job_updt_dt, job_updt_id, original_almn_id, pgm_src_nm) "+
				"values "+
				"("+argAlnmID+", "+
			        eval("txt_job_num_"+argCtrlID+".value")+", "+
			        "0"+", "+
			   		"'"+eval("txt_job_title_txt_"+argCtrlID+".value")+"', "+//job_title_txt
					"'"+vJob_Crnt_Ind+"', "+ 									//job_crnt_ind
					"'"+eval("txt_job_instn_nm_"+argCtrlID+".value")+"', "+//job_instn_nm
					"sysdate"+", "+ //sysdate
				    "<cfoutput>#client.Usr_CD#</cfoutput>"+", "+
				    "sysdate"+", "+ //sysdate
				   "<cfoutput>#client.Usr_CD#</cfoutput>"+", "+
				    "0"+", "+
   				    "'Merged')";
	
	//
	
	
	
	
	return vRtnVal;
			
}}
</script>