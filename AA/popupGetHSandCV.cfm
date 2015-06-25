<!--- popupGetHSandCV.cfm --->
<script src="JS/wddx.js" type="text/javascript"></script>
<cfset local.CS_CntryToCD = URL.url_CS_CntryToCD>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
		<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_getHSandCV" returncode="no">
			<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_CntryToCD" value="#local.CS_CntryToCD#" null="no">
			<cfprocresult name="spr_getHostInst" resultset="1">
			<cfprocresult name="spr_getCityVisit" resultset="2">
		</cfstoredproc>
		<cfwddx action="cfml2wddx" input="#spr_getHostInst#" output="client.sprWDDX_getHostInst">
		<cfwddx action="cfml2wddx" input="#spr_getCityVisit#" output="client.sprWDDX_getCityVisit">
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<cfoutput>#spr_getHostInst.recordCount#<br>#spr_getCityVisit.recordCount#</cfoutput>
<!--- ----------------------------------------------------------------------------------------------------------------- --->
<script language="javascript" type="text/javascript">
/*<!---  
<cfwddx action="CFML2JS" input="#spr_getHostInst#" toplevelvariable="tlv_HI">
<cfwddx action="CFML2JS" input="#spr_getCityVisit#" toplevelvariable="tlv_CV">
//
var rowsHI = tlv_HI.getRowCount();
var rowsCV = tlv_CV.getRowCount();
//
function arrayHI(aplace_visit_host_instn_nm) {this.aplace_visit_host_instn_nm = aplace_visit_host_instn_nm;}
function arrayCV(aplace_visit_city_nm) {this.aplace_visit_city_nm = aplace_visit_city_nm;}
//
orgBfrHI = new Array();
orgBfrCV = new Array();
//
for (var hi=0; hi<rowsHI; hi++) { orgBfrHI[hi] = new arrayHI(tlv_HI.place_visit_host_instn_nm[hi]); }
for (var cv=0; cv<rowsCV; cv++) { orgBfrCV[cv] = new arrayCV(tlv_CV.place_visit_city_nm[cv]); }
//alert(orgBfrHI.length+"   "+orgBfrCV.length)

//window.opener.of_populateSelect( "ddlbm_CS_Host_Instn_Nm", "-1", "=== Select Host Inst. ===", rowsHI, "orgBfrHI", "aplace_visit_host_instn_nm", "aplace_visit_host_instn_nm", "2D" );
//window.opener.of_populateSelect( "ddlbm_CS_Visit_City_Nm", "-1", "=== Select City Visited ===", rowsCV, "orgBfrCV", "aplace_visit_city_nm", "aplace_visit_city_nm", "2D" );
 --->*/
//
window.opener.f_App.h_CS_Host_Instn_Nm.value = "<cfoutput>#client.sprWDDX_getHostInst#</cfoutput>"; 
window.opener.f_App.h_CS_Visit_City_Nm.value = "<cfoutput>#client.sprWDDX_getCityVisit#</cfoutput>";  
window.opener.f_populateDDLB();
//



//window.close();




</script>
<cfset client.Permission = "YES">