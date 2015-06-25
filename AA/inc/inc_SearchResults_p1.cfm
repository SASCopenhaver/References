<!--- inc_SearchResults_p1.cfm --->
<script type="text/javascript" language="javascript">
function f_SortColumn(argSortBy)
{
	f_Sort(argSortBy);
	self.document.forms[0].h_SelectedRecordFrom.value = 1;
	f_ReNumber();
	//
	var vRecordsNav = f_RecordsNav();
	of_innerHTML("id_RecordsNav", "'"+vRecordsNav+"'");
	//
	f_outputSearchedRecords();
}
//
//-------------------------------------------------------------------------------------------------------------
function f_SortLName(a,b)
{with(self.document.forms[0]){
	var vSortOrder = h_LastName_SortOrder.value; 
	//
	a = a.acsr_almn_full_nm;
	b = b.acsr_almn_full_nm;
	
	//a = a.acsr_almn_last_nm;
	//b = b.acsr_almn_last_nm;
	//alert(a+"   "+b)
		 if (vSortOrder == "ASC" ) { return ( (a < b) ? -1 : ((a > b) ?  1 : 0) );/*ASC order*/ } 
	else if (vSortOrder == "DESC") { return ( (a < b) ?  1 : ((a > b) ? -1 : 0) );/*DESC order*/}
}}
//
//------------------------------------------------------------------------------------------------------------------
function f_SortFieldOfStudy(a,b)
{with(self.document.forms[0]){
	var vSortOrder = h_FieldOfStudy_SortOrder.value; 
	//
	a = a.acsr_field_stdy_nm;
	b = b.acsr_field_stdy_nm;
	//alert(a+"   "+b)
		 if (vSortOrder == "ASC" ) { return ( (a < b) ? -1 : ((a > b) ?  1 : 0) );/*ASC order*/ } 
	else if (vSortOrder == "DESC") { return ( (a < b) ?  1 : ((a > b) ? -1 : 0) );/*DESC order*/}
}}
//
//------------------------------------------------------------------------------------------------------------------
function f_SortPrgType(a,b)
{with(self.document.forms[0]){
	var vSortOrder = h_PrgType_SortOrder.value; 
	//
	a = a.acsr_pgm_type_nm;
	b = b.acsr_pgm_type_nm;
	//alert(a+"   "+b)
		 if (vSortOrder == "ASC" ) { return ( (a < b) ? -1 : ((a > b) ?  1 : 0) );/*ASC order*/ } 
	else if (vSortOrder == "DESC") { return ( (a < b) ?  1 : ((a > b) ? -1 : 0) );/*DESC order*/}
}}
//
//------------------------------------------------------------------------------------------------------------------
function f_SortPrgFiscalYear(a,b)
{with(self.document.forms[0]){
	var vSortOrder = h_PrgFiscalYear_SortOrder.value; 
	//
	a = a.acsr_pgm_fy_dt;
	b = b.acsr_pgm_fy_dt;
	//alert(a+"   "+b)
		 if (vSortOrder == "ASC" ) { return ( (a < b) ? -1 : ((a > b) ?  1 : 0) );/*ASC order*/ } 
	else if (vSortOrder == "DESC") { return ( (a < b) ?  1 : ((a > b) ? -1 : 0) );/*DESC order*/}
}}
//
//------------------------------------------------------------------------------------------------------------------
function f_SortPrgStartYear(a,b)
{with(self.document.forms[0]){
	var vSortOrder = h_PrgStartYear_SortOrder.value; 
	//
	a = parseInt(a.acsr_pgm_yr_dt);
	b = parseInt(b.acsr_pgm_yr_dt);
	//alert(a+"   "+b)
		 if (vSortOrder == "ASC" ) { return ( (a < b) ? -1 : ((a > b) ?  1 : 0) );/*ASC order*/ } 
	else if (vSortOrder == "DESC") { return ( (a < b) ?  1 : ((a > b) ? -1 : 0) );/*DESC order*/}
}}
//
//------------------------------------------------------------------------------------------------------------------
function f_SortUpdRec(a,b)
{with(self.document.forms[0]){
	var vSortOrder = h_UpdRec_SortOrder.value; 
	//
	a = a.acsr_almn_updt_dt;
	b = b.acsr_almn_updt_dt;
	//alert(a+"   "+b)
		 if (vSortOrder == "ASC" ) { return ( (a < b) ? -1 : ((a > b) ?  1 : 0) );/*ASC order*/ } 
	else if (vSortOrder == "DESC") { return ( (a < b) ?  1 : ((a > b) ? -1 : 0) );/*DESC order*/}
}}
//
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------
function f_Sort(argSortBy){with(self.document.forms[0]){
	var vSortOrder = "";
	switch (argSortBy)
	{
		//============================================
		case "LastName":
			vSortOrder = h_LastName_SortOrder.value;
			orgBfrSR.sort(f_SortLName);
			//
			     if (vSortOrder == "ASC" ) { h_LastName_SortOrder.value = "DESC"; } 
			else if (vSortOrder == "DESC") { h_LastName_SortOrder.value = "ASC";  }
		break;
		//============================================
		case "FieldOfStudy":
			vSortOrder = h_FieldOfStudy_SortOrder.value;
			orgBfrSR.sort(f_SortFieldOfStudy);
			//
			     if (vSortOrder == "ASC" ) { h_FieldOfStudy_SortOrder.value = "DESC"; } 
			else if (vSortOrder == "DESC") { h_FieldOfStudy_SortOrder.value = "ASC";  }
		break;
		//============================================
		case "PrgType":
			vSortOrder = h_PrgType_SortOrder.value;
			orgBfrSR.sort(f_SortPrgType);
			//
			     if (vSortOrder == "ASC" ) { h_PrgType_SortOrder.value = "DESC"; } 
			else if (vSortOrder == "DESC") { h_PrgType_SortOrder.value = "ASC";  }
		break;
		//============================================
		case "PrgFiscalYear":
			vSortOrder = h_PrgFiscalYear_SortOrder.value;
			orgBfrSR.sort(f_SortPrgFiscalYear);
			//
			     if (vSortOrder == "ASC" ) { h_PrgFiscalYear_SortOrder.value = "DESC"; } 
			else if (vSortOrder == "DESC") { h_PrgFiscalYear_SortOrder.value = "ASC";  }
		break;
		//============================================
		case "PrgStartYear":
			vSortOrder = h_PrgStartYear_SortOrder.value;
			orgBfrSR.sort(f_SortPrgStartYear);
			//
			     if (vSortOrder == "ASC" ) { h_PrgStartYear_SortOrder.value = "DESC"; } 
			else if (vSortOrder == "DESC") { h_PrgStartYear_SortOrder.value = "ASC";  }
		break;
		//============================================
		case "UpdRec":
			vSortOrder = h_UpdRec_SortOrder.value;
			orgBfrSR.sort(f_SortUpdRec);
			//
			     if (vSortOrder == "ASC" ) { h_UpdRec_SortOrder.value = "DESC"; } 
			else if (vSortOrder == "DESC") { h_UpdRec_SortOrder.value = "ASC";  }
		break;
		//============================================
	}
}}
//
//------------------------------------------------------------------------------------------------------------------
function f_ReNumber()
{
	for (var sr=0; sr<rowsSR; sr++)
	{
		orgBfrSR[sr].acsr_rcrd_num = parseInt(sr)+1;
	}
}
//
//------------------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------------------------------------------
function f_getAlumniRecord(argAlmnID){with(self.document.forms[0])
{
	h_AlmnID.value = argAlmnID;
	of_CallFile("getAlumniRecord");
	//of_CallFile(131313);
	
	/*
	<!--- 
	var popupPage = "popupAlumniRecord_p1.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlAlumniID="+argAlmnID;
	var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=550,height=230','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
	 --->
	 */
	
}}
//
//--------------------------------------------------------------------------------------------------------------------------
function f_RecordsNav(){with(self.document.forms[0])
{
	var vRtn = "";
	var vRtnTemp = "";
	var	vFrom, vTo,
		vSelectedRecordFrom,
		vNumOfLoops,
		vMod;
	var vIncrement = 25;
	//	
	if (vIncrement >= rowsSR)
	{
		vSelectedRecordFrom = h_SelectedRecordFrom.value; 
		vRtn = 	"<span class=\"c_fieldValue\">";
		vRtn += vSelectedRecordFrom;
		vRtn += "&nbsp;-&nbsp;";
		vRtn += rowsSR;
		vRtn += "</span>";
	}
	else if (vIncrement < rowsSR)
	{
		vSelectedRecordFrom = h_SelectedRecordFrom.value; //alert(vSelectedRecordFrom)
		//
		vMod = of_Mod(rowsSR, vIncrement);
		//
		if      (vMod == 0) { vNumOfLoops = rowsSR/vIncrement; }
		else if (vMod >  0) { vNumOfLoops = (rowsSR - vMod)/vIncrement; }
		//alert(vMod)
		//
		vFrom = 1;
		for (var l=0; l<vNumOfLoops; l++)
		{
			vFrom = vFrom;
			vTo = vFrom + (vIncrement - 1);
			//
			//alert(vSelectedRecordFrom +"   "+ vFrom)
			if   (vSelectedRecordFrom != vFrom) {vRtnTemp = "<a href=\"JavaScript: void(0);\" onClick=\"JavaScript: f_nextGroupOfRecds("+vFrom+");\" class=\"c_fieldName\">";}
			else {vRtnTemp = "<span class=\"c_fieldValue\">";}
			vRtnTemp += vFrom + "-" + vTo;
			if (vSelectedRecordFrom != vFrom) {vRtnTemp += "</a>";}
			else {vRtnTemp += "</span>";}	
			vRtnTemp += "&nbsp;&nbsp;";
			vRtn = vRtn + vRtnTemp;
			//
			vFrom = vTo + 1;
		}
		//
		if (vMod > 0) 
		{
			if   (vSelectedRecordFrom != vFrom) {vRtn += "<a href=\"JavaScript: void(0);\"  onClick=\"JavaScript: f_nextGroupOfRecds("+vFrom+");\" class=\"c_fieldName\">";}
			else {vRtn += "<span class=\"c_fieldValue\">";}
			vRtn += vFrom + "-" + rowsSR; 
			if (vSelectedRecordFrom != vFrom) {vRtn += "</a>";}		
			else {vRtn += "</span>";}		
		}
	}
	//
	return vRtn;
	
}}
//
function f_nextGroupOfRecds(argRecFrom){with(self.document.forms[0])
{//alert(argRecFrom)
	h_SelectedRecordFrom.value = argRecFrom;
	//
	var vOut = f_RecordsNav();
	of_innerHTML("id_RecordsNav", "'"+vOut+"'");
	//
	f_outputSearchedRecords();
}}
//
//--------------------------------------------------------------------------------------------------------------------------------
function f_SaveSearchName(){with(self.document.forms[0])
{//
	if ( "<cfoutput>#client.AnyChanges#</cfoutput>" == "YES" ) 
	{
		if (txt_CS_Search_Nm.value == "")
		{
			alert("Sorry, cannot process your request.\nName of Search Criteria must be provided.")
			txt_CS_Search_Nm.focus();
		}
		else 
		{
			alert(" Line 340, f_SaveSearchName")
			//of_CallFile("");
		}
	}
}}
</script>

<cfwddx action="wddx2cfml" input="#client.sprWDDX_getSearchedRecords#" output="spr_getSearchedRecords">

<cfwddx action="wddx2cfml" input="#client.sprWDDX_countSearchedAlumni#" output="spr_countSearchedAlumni">

<link href="../Style/emx_nav_left.css" rel="stylesheet" type="text/css">
 <h3 style="margin-left:20px; ">Total Alumni Records:&nbsp;<cfoutput>#spr_countSearchedAlumni.countAlumni#</cfoutput></h3>
<h3 style="margin-left:20px; ">Total Program Records:&nbsp;<cfoutput>#spr_getSearchedRecords.recordCount#</cfoutput></h3><br> 
<!--- ------------------------------------------------------------------------------------------------------- --->
<!--- 
<cfset local.NumOfLoops = Int(#client.SEARCH_TotalRecords#/#client.RecordsShownOnPage#)>
<cfset local.Reminder = (#client.SEARCH_TotalRecords# MOD #client.RecordsShownOnPage#)>
<cfset local.NumFrom = 1>
--->
<!--- ------------------------------------------------------------------------------------------------------- --->
<input type="hidden" name="h_SelectedRecordFrom" value="">
<input type="hidden" name="h_AlmnID" value="">
<div class="feature">
<div id="id_RecordsNav" style="margin-left:20px;" >&nbsp;</div><!--- class="c_fieldName" --->

<table width="90%"  border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="45%"><cfoutput>#client.CS_SearchCriteria#</cfoutput></td>
	<td width="5%">&nbsp;</td>
	<td valign="top" class="c_fieldValueRed">When seeing the results on this screen, you may notice what appear to be multiple instances of the same named Alumnus.  Look at these records closely to see if it is the same person.  If you verify that the record is for the same Alumnus, choose the one record that is most complete, and or contains the most data, and update that record for the alum.  This will become their most recently updated record.  We are working to eliminate duplicates in the database, and creating a module that will allow users to combine records and easily manipulate alumnus records as well.  Look for announcements on the Home Page soon!</td>
  </tr>
</table>
<br>
<!--- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --->
<!--- 
<cfif #client.AnyChanges# EQ "YES">
<table bgcolor="#CCCCCC" width="40%"  border="0" cellspacing="2" cellpadding="2">
  <tr>
		<td class="c_fieldValueRed">This Search Criteria is not saved. If you want to save it, please provide name below:</td>
		<!--- <td><cfoutput>#client.AnyChanges#</cfoutput></td> --->
  </tr>
  <tr>
		<td><input	type="text" 
				    value="" 
					name="txt_CS_Search_Nm" 
					size="60"
					title="To be saved Custom Search Name"
					class="forminputs" 
					onBlur="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
					onChange="javascript: while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" name="cb_Save" value="Save" class="c_formbuttons" onClick="JavaScript: f_SaveSearchName();">
		</td>
  </tr>
</table>
</cfif>
 --->
<!--- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --->
<br>
<table width="40%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="right">
			<input type="button" name="cb_BackToSC" value="Back To Search Criteria" class="c_formbuttons" onClick="JavaScript: f_backToSearchCriteria();">
		</td>
	</tr>
</table>
<br>
<table width="95%" border="0" cellspacing="0" cellpadding="0">
	<tr><td>&nbsp;</td><td colspan="7"><hr></td></tr>
	<tr>
		<td width="5%" class="c_fieldName">
		<cfif #client.Usr_Role_CD# EQ "1"> 
			Almn_ID
		<cfelse>
			&nbsp;
		</cfif>
		</td>
		<td width="15%" class="c_fieldName">
			<a href="JavaScript: void(0);" onClick="JavaScript: f_SortColumn('LastName');" title="Sort by Last Name">
			&nbsp;Full Name
			</a>
			<input type="hidden" name="h_LastName_SortOrder" value="">
		</td>
		
		<td width="19%"  class="c_fieldName">
			<a href="JavaScript: void(0);" onClick="JavaScript: f_SortColumn('FieldOfStudy');" title="Sort by Field of Study/Project Subject">
			Field Of Study/Project Subject
			</a>
			<input type="hidden" name="h_FieldOfStudy_SortOrder" value="">
		</td>
		<td width="18%" class="c_fieldName">
			<!--- <a href="JavaScript: void(0);" onClick="JavaScript: f_SortColumn('Topic');" title="Sort by Sub-Topic"> --->
			Sub-Topic
			<!--- </a> --->
			<input type="hidden" name="h_SubTopic_SortOrder" value="">
		</td>
		<td width="18%" class="c_fieldName">
			<a href="JavaScript: void(0);" onClick="JavaScript: f_SortColumn('PrgType');" title="Sort by Program Type">
			Program Type
			</a>
			<input type="hidden" name="h_PrgType_SortOrder" value="">
		</td>
		
		<td width="8%" class="c_fieldName">
			<a href="JavaScript: void(0);" onClick="JavaScript: f_SortColumn('PrgFiscalYear');" title="Sort by Fiscal Year">
			Fiscal Year
			</a>
			<input type="hidden" name="h_PrgFiscalYear_SortOrder" value="">
		</td>
		<td width="8%" class="c_fieldName">
			<a href="JavaScript: void(0);" onClick="JavaScript: f_SortColumn('PrgStartYear');" title="Sort by Program Start Year">
			Program<br>Start Year
			</a>
			<input type="hidden" name="h_PrgStartYear_SortOrder" value="">
		</td>
	  	<td width="14%" class="c_fieldName">
			<a href="JavaScript: void(0);" onClick="JavaScript: f_SortColumn('UpdRec');" title="Sort by Status">
			Updated<br>Record?
			</a>
			<input type="hidden" name="h_UpdRec_SortOrder" value="">
		</td>
	</tr>
	<tr><td>&nbsp;</td><td colspan="7"><hr></td></tr>
</table>

<div id="id_SearchedRecords"></div>
</div>
<script language="javascript" type="text/javascript">
//
//
with(self.document.forms[0]){
	//
	h_SelectedRecordFrom.value = 1;
	//
	h_LastName_SortOrder.value = "ASC";
	h_FieldOfStudy_SortOrder.value = "ASC";
	h_PrgType_SortOrder.value = "ASC";
	h_PrgFiscalYear_SortOrder.value = "ASC";
	h_PrgStartYear_SortOrder.value = "ASC";
	h_UpdRec_SortOrder.value = "ASC";
}
//
f_Sort("LastName");
f_ReNumber();
f_outputSearchedRecords();
//
var vRecordsNav = f_RecordsNav();
of_innerHTML("id_RecordsNav", "'"+vRecordsNav+"'");
//
//------------------------------------------------------------------------------------
function f_backToSearchCriteria() { with(self.document.forms[0])
{
	of_CallFile("backToSearchCriteria");
}}
</script>