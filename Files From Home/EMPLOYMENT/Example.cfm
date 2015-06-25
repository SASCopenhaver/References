<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<!---The following is not actual files - just fragments.--->

<!--- -------------------------------------------------------------------------------------------
	Needed action: Retrieve data.
1.	    Action description: After data is selected on the "Search" action page, function f_Search() 
		performs validation, and if all required fields were selected ...  --->
        
<input type="button" name="cb_Search1" value="Search" class="c_formbuttons" onClick="JavaScript:f_Search();">


<!--- -------------------------------------------------------------------------------------------
2.      it submits request to the database --->
<script language="javascript" type="text/javascript">
function of_CallFile(argRequest)
{with(self.document.forms[0])
{
	of_msgWaitForLoad('id_msgWait');
	submit("_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController="+argRequest);<!--- TEST: value of argRequest = "execSQL" --->
}}
</script>


<!--- ----------------------------------------------------------------------
3. Before stored procedure is triggered, variable "client.basicCS_SQLstatement" builds a dynamic SQL based on what was selected on the action page:--->
<cfset client.SelectStmnt =  " SELECT "
								&client.Usr_CD&", rownum , a.almn_id "
								&", a.almn_last_nm "
								<!--- ... ---> 
								&", Initcap(almn_last_nm)|| "
								&" decode(almn_frst_nm, null,'',', '||Initcap(almn_frst_nm))||' '|| "
								&" decode(almn_midl_nm, null,'',Initcap(almn_midl_nm))"
								<!--- ... --->
								&", NVL(almn_sex_ind,'-') "
								&", p.pgm_field_stdy_cd "
								&", decode(pgm_field_stdy_cd, null, '-', fs.field_stdy_nm) "
								<!--- ... --->
								&", p.pgm_type_cd " 								
								&", decode(p.pgm_type_cd, null,'-',pt.pgm_type_nm) "	
								&", NVL(TO_CHAR(pgm_fy_dt),'-') " 						
								&", NVL(TO_CHAR(pgm_yr_dt),'-') "  						
								&", a.almn_updt_id "
								&", a.almn_updt_dt"
								&", DECODE(a.almn_updt_id,null,null, "
									&" decode(u.usr_pfx, '-1', '', null,'',Initcap(u.usr_pfx))||' '|| "
									&" decode(u.usr_fname, null,'',Initcap(u.usr_fname))||' '|| "
									&" decode(u.usr_mi, null,'',Initcap(u.usr_mi))||' '|| "
									&" Initcap(u.usr_lname) "
								&" ) "
								&", NVL(Replace(p.pgm_topic_txt,'''','`'), '-') ">
							<cfset client.FromWhere = 
							" FROM  almn a, pgm p, pgm_type pt, field_stdy fs, usr u "
							&" WHERE "
								&" a.almn_id = p.pgm_almn_id "
								&" and p.pgm_type_cd = pt.pgm_type_cd "
								&" and p.pgm_field_stdy_cd = fs.field_stdy_cd(+) "
								&" and a.almn_updt_id = u.usr_cd(+) "
								&" and p.show_pgm_ind = 'Y' "
								&" and a.show_almn_ind = 'Y' "
								&local.First_Nm
								&local.Last_Nm
								...
								&local.CS_Resdnc_Cntry_CD>
							<cfset client.SelectCount = client.SelectCount & client.FromWhere>
<cfset client.OrderBy = " ORDER BY a.almn_last_nm ">  
<cfset client.ASC_DESC = " ASC "> 
<cfset client.basicCS_SQLstatement = client.InsertStmnt	& client.SelectStmnt & client.FromWhere & client.OrderBy & client.ASC_DESC>

<!--- TEST:  <cfoutput>#client.basicCS_SQLstatement#</cfoutput><cfabort> --->


<!---
4. Stored procedure is triggered to insert search results into staging table ------------------------- --->
	<cfcase value="execSQL">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_execSQL" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_execSQL" value="#client.basicCS_SQLstatement#" null="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">
			
		</cfstoredproc>
	</cfcase>

<!--- .... Skipping some logic ....--->


<!---  -------------------------------------------------------------------------------------------
5.  There is a need to trigger another stored procedure to retrieve search results fron the staging table:  --->

<cfswitch expression="#client.ControllerDB#">
...
	<cfcase value="getSearchedRecords">
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getSearchedRecords" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_CD" value="#client.Usr_CD#" null="no">

			<cfprocresult name="spr_getSearchedRecords" resultset="1">
		
		</cfstoredproc>
		<!---  TEST:  <cfoutput>#spr_countSearchedAlumni.countAlumni#</cfoutput>	<cfabort> --->
		
<!--- Using <CFWDDX> tag to pass records into JavaScript array --->        
		<cfwddx action="cfml2wddx" input="#spr_getSearchedRecords#"  output="client.sprWDDX_getSearchedRecords">
	
		
	</cfcase>
...
</cfswitch>

<!---  -------------------------------------------------------------------------------------------
6. The following is an example of how WDDX output populates record set into JavaScript function: --->
<!--- incJS_ArraySearchedRecords.cfm --->
<script language="javascript" type="text/javascript">

<cfwddx action="CFML2JS" input="#spr_getSearchedRecords#" toplevelvariable="tlv_SR">
// 6.1 Function declaration: ------------------------------------------------------------------------
var rowsSR = tlv_SR.getRowCount();
function arraySR(acsr_usr_cd, 
				 acsr_rcrd_num, 
				 acsr_almn_id, 
				 acsr_almn_last_nm, 
				 acsr_almn_full_nm, 
				 acsr_gender, 
				 acsr_pgm_field_stdy_cd, 
				 acsr_field_stdy_nm, 
				 acsr_pgm_topic_txt,
				 acsr_pgm_type_cd, 
				 acsr_pgm_type_nm, 
				 acsr_pgm_fy_dt, 
				 acsr_pgm_yr_dt, 
				 acsr_almn_updt_id, 
				 acsr_almn_updt_dt, 
				 acsr_updt_usr_nm)
{
 	this.acsr_usr_cd = acsr_usr_cd;
	this.acsr_rcrd_num = acsr_rcrd_num;
	this.acsr_almn_id= acsr_almn_id;
	this.acsr_almn_last_nm = acsr_almn_last_nm;
	this.acsr_almn_full_nm = acsr_almn_full_nm;
	this.acsr_gender = acsr_gender;
	this.acsr_pgm_field_stdy_cd = acsr_pgm_field_stdy_cd;
	this.acsr_field_stdy_nm = acsr_field_stdy_nm;
	this.acsr_pgm_topic_txt = acsr_pgm_topic_txt;
	this.acsr_pgm_type_cd = acsr_pgm_type_cd;
	this.acsr_pgm_type_nm = acsr_pgm_type_nm;
	this.acsr_pgm_fy_dt = acsr_pgm_fy_dt;
	this.acsr_pgm_yr_dt = acsr_pgm_yr_dt;
	this.acsr_almn_updt_id = acsr_almn_updt_id;
	this.acsr_almn_updt_dt = acsr_almn_updt_dt;
	this.acsr_updt_usr_nm =acsr_updt_usr_nm ;
}

// 6.2 Cashing result set for further dynamic processing, such as filtering and sorting, 
//     without any additional database calls and page reloading.
//     This is a way of using AJAX concept.  ----------------------------------------------------------------------
for (var sr=0;sr<rowsSR; sr++)
{
	orgBfrSR[sr] = new arraySR(  tlv_SR.csr_usr_cd[sr], 
								 tlv_SR.csr_rcrd_num[sr], 
								 tlv_SR.csr_almn_id[sr], 
								 tlv_SR.csr_almn_last_nm[sr], 
								 tlv_SR.csr_almn_full_nm[sr], 
								 tlv_SR.csr_gender[sr], 
								 tlv_SR.csr_pgm_field_stdy_cd[sr], 
								 tlv_SR.csr_field_stdy_nm[sr], 
								 tlv_SR.csr_pgm_topic_txt[sr],
								 tlv_SR.csr_pgm_type_cd[sr], 
								 tlv_SR.csr_pgm_type_nm[sr], 
								 tlv_SR.csr_pgm_fy_dt[sr], 
								 tlv_SR.csr_pgm_yr_dt[sr], 
								 tlv_SR.csr_almn_updt_id[sr], 
								 tlv_SR.csr_almn_updt_dt[sr], 
								 tlv_SR.csr_updt_usr_nm[sr] 
								 )
}
//
// 6.3 ----------------------------------------------------------------------------------------------
// Function f_outputSearchedRecords dynamically builds HTML output for the record set stored in the buffer orgBfrSR, see above.

function f_outputSearchedRecords(){with(self.document.forms[0]){
	// Variables declaration
	var vSelectedRecordFrom = parseInt(h_SelectedRecordFrom.value);
	var vInc = 25;				//vInc - Increment
	var vRecOnPage = 0;			//vRecOnPage - Records On Page
	var vDelta = 0;
	var vRecFr = 0;				//vRecFr - Show record from
	var vRecTo = 0;				//vRecTo - Show record to
	var vOut = "";				//vOut   - Output
	//------------------------------------------------------------------
	vDelta = rowsSR - vSelectedRecordFrom;
	//
	vRecFr = vSelectedRecordFrom;
	if      (vDelta < vInc)  { vRecTo = rowsSR; }
	else if (vDelta >= vInc) { vRecTo = vRecFr + (vInc-1); }
	//alert(vRecFr +"   "+vRecTo)
	//
	vOut = "<table width=\"95%\" border=0 cellspacing=1 cellpadding=1>";
	for (var sr=0; sr<rowsSR; sr++)
	{
		if (orgBfrSR[sr].acsr_rcrd_num >= vRecFr && orgBfrSR[sr].acsr_rcrd_num < (vRecTo+1))
		{
			vOut += "<tr>";
				vOut += "<td width=\"5%\" class=\"c_fieldValue\">";
					if ("<cfoutput>#client.Usr_Role_CD#</cfoutput>" == 1)
					{ vOut += orgBfrSR[sr].acsr_almn_id; }
					else
					{vOut += "&nbsp;";}
					//vOut += orgBfrSR[sr].acsr_rcrd_num;
					
				vOut += "</td>";
				//
				vOut += "<td width=\"15%\" class=\"c_fieldValue\">";
						vOut += "<a href=\"##\" style=\"text-decoration:underline;\" onClick=\"JavaScript: f_getAlumniRecord("+orgBfrSR[sr].acsr_almn_id+");\">";
						vOut += orgBfrSR[sr].acsr_almn_full_nm;
						vOut += "</a>";
				vOut += "</td>";
				//
				vOut += "<td width=\"19%\" class=\"c_fieldValue\">";
					vOut += orgBfrSR[sr].acsr_field_stdy_nm;
				vOut += "</td>";
				//
				vOut += "<td width=\"18%\" class=\"c_fieldValue\">";
					vOut += orgBfrSR[sr].acsr_pgm_topic_txt;
				vOut += "</td>";
				//
				vOut += "<td  width=\"18%\" class=\"c_fieldValue\">";
					vOut += orgBfrSR[sr].acsr_pgm_type_nm;
				vOut += "</td>";
				
				//
				vOut += "<td  width=\"8%\"  class=\"c_fieldValue\">";
					vOut += orgBfrSR[sr].acsr_pgm_fy_dt;
				vOut += "</td>";
				vOut += "<td  width=\"8%\" class=\"c_fieldValue\">";
					vOut += orgBfrSR[sr].acsr_pgm_yr_dt;
				vOut += "</td>";
				vOut += "<td  width=\"14%\" class=\"c_fieldValue\">";
					//if (orgBfrSR[sr].acsr_almn_updt_id == "0"){ vUpd = "No" }
					//else { vUpd = "Yes, on "+orgBfrSR[sr].acsr_almn_updt_dt }
					//vOut += vUpd;
					vOut += orgBfrSR[sr].acsr_almn_updt_dt;
					if (orgBfrSR[sr].acsr_almn_updt_dt != "No")
					{
						vOut += " by "+orgBfrSR[sr].acsr_updt_usr_nm;
					}
				vOut += "</td>";
			vOut += "</tr>";
			if (sr>vRecTo){break;}
		}
	}
	vOut += "</table>";
	//
	of_innerHTML("id_SearchedRecords", "'"+vOut+"'");

}}
//------------------------------------------------------------------------------------------------------------------
</script>

</body>
</html>