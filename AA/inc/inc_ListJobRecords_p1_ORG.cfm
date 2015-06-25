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
		<td scope="col"><input type="checkbox" name="cbx_job_almn_id_#job_almn_id#_#job_num#" value="#job_almn_id#"></td>
    	<td>#job_almn_id#  #local.LoopNum#</td>
		<td><input type="text" class="forminputs" name="txt_job_num_#job_almn_id#_#job_num#" value="#job_num#"></td>
		<td><input type="text" class="forminputs" name="txt_job_title_txt_#job_almn_id#_#job_num#" value="#job_title_txt#"></td>
		
		<td>
			
			<select name="ddlb_job_crnt_ind_#job_almn_id#_#job_num#" class="forminputs">
				<option value="-1">Unknown</option>
				<option value="Y">Yes</option>
				<option value="N">No</option>
			</select>
			<script language="javascript" type="text/javascript">
				with (self.document.forms[0])
				{
					of_selectedInDDLB ("<cfoutput>ddlb_job_crnt_ind_#job_almn_id#_#job_num#</cfoutput>", "<cfoutput>#job_crnt_ind#</cfoutput>");
				}
			</script>
		</td>
		
		<td><input type="text" class="forminputs" name="txt_job_instn_nm_#job_almn_id#_#job_num#" value="#job_instn_nm#"></td>
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
						onClick="f_Validate(); f_Submit();">
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
//
var vPosTemp = 0; 
var vAlnmID = 0;
var vJobNum = 0;
function f_getAlmnIDandJobNum(argElementNm){with(self.document.forms[0]){
	{
			vPosTemp = argElementNm.lastIndexOf("_");
			vJobNum = argElementNm.substr( parseInt(vPosTemp)+1, argElementNm.length );
			//
			vAlnmID = argElementNm.substr(0, vPosTemp);
			vPosTemp = vAlnmID.lastIndexOf("_");
			vAlnmID = vAlnmID.substr( parseInt(vPosTemp)+1, vAlnmID.length )
			alert(vAlnmID+"  "+vJobNum)
	}
}}
//
//---------------------------------------------------------------------------------------------------
function f_assignJobNum(){with(self.document.forms[0]){
var vLoopNum=0;
	for (var e=0; e<elements.length; e++)
	{
			if (elements[e].type == "text" && elements[e].name.substr(0,12)=="txt_job_num_") 
			{
				vLoopNum++;
			}
	}
}}
//
//---------------------------------------------------------------------------------------------------
function f_Validate(){with(self.document.forms[0]){
	//
	f_assignJobNum();
	//
	for (var e=0; e<elements.length; e++)
	{
			if (elements[e].type == "checkbox" && elements[e].checked == true)
			{
					//
					f_getAlmnIDandJobNum(elements[e].name);
					//
					if (eval("txt_job_title_txt_"+vAlnmID+"_"+vJobNum+".value == ''"))
					{
						vValidationPassed = "NO";
						alert("Sorry, 'Job Title' must be provided for the record where  'Alumni ID' is "+vAlnmID+" and  'Job Number' is "+vJobNum+".");
						eval("txt_job_title_txt_"+vAlnmID+"_"+vJobNum+".focus();");
						break;
					}
			}
	}
}}
//
//---------------------------------------------------------------------------------------------------

function f_Submit(){with(self.document.forms[0]){
	var vBuiltString = "";
	var vLoopNum = 1;
	//---------------------------------------
	if ( vValidationPassed == "YES" )
	{
			for (var e=0; e<elements.length; e++)
			{
					if (elements[e].type == "checkbox" && elements[e].checked == true)
					{
							alert(elements[e].name+"   "+elements[e].value)
							f_getAlmnIDandJobNum(elements[e].name);
							//vAlnmID vJobNum
							//
							eval( "txt_job_num_"+vAlnmID+"_"+vJobNum+".value="+vLoopNum )
							
							//
							//Building a string to pass to Stored Procedure for record updates.
							vBuiltString += f_buildString("<cfoutput>#client.AP_AlmnID#</cfoutput>", vLoopNum)+";";
							vLoopNum++;
							alert(vBuiltString)
					}
			}
	}
	//-------------------------------------
	//alert(vBuiltString)
	h_mergeJobRecds.value = vBuiltString;
	h_LoopNum.value = parseInt(vLoopNum)-1;
	alert("replace with of_CallFile..")
	//of_CallFile("mergeJobRecords");

}}
//
//----------------------------------------------------------------------------------------------------
function f_buildString(argAlnmID, argJobNum){with(self.document.forms[0]){
	var RtnVal = "";
	
	//return RtnVal = eval("ddlb_job_crnt_ind_"+argAlnmID+"_"+argJobNum+".value");
	
	return vRtnVal = "insert into job1 (job_almn_id, job_num, job_pgm_id, job_title_txt, job_crnt_ind, job_instn_nm, job_crtd_dt, "+
   							   "job_crtd_id, job_updt_dt, job_updt_id, original_almn_id, pgm_src_nm) "+
				"values "+
				"("+argAlnmID+", "+
			        argJobNum+", "+
			        "null"+", "+
			   		"'"+eval("txt_job_title_txt_"+argAlnmID+"_"+argJobNum+".value")+"', "+//job_title_txt
					"DECODE('"+eval("ddlb_job_crnt_ind_"+argAlnmID+"_"+argJobNum+".value")+"','-1',null, '"+eval("ddlb_job_crnt_ind_"+argAlnmID+"_"+argJobNum+".value")+"'), "+//job_crnt_ind
					"'"+eval("txt_job_instn_nm_"+argAlnmID+"_"+argJobNum+".value")+"', "+//job_instn_nm
					"sysdate"+", "+
				    "<cfoutput>#client.Usr_CD#</cfoutput>"+", "+
				    "sysdate"+", "+
				   "<cfoutput>#client.Usr_CD#</cfoutput>"+", "+
				    "null"+", "+
   				    "'Merged')";
		
}}
</script>