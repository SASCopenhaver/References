<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">
<!--- <cfoutput>#strUser.PersonID#</cfoutput><cfabort> ---> 

<cfstoredproc procedure="PACK_EVAL.sp_getBranchProfile" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC"  variable="argPersonID" value="#strUser.PersonID#"  null="No">

	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getBranchProfile"   maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_FiscalYears"  maxrows="-1" variable="IgnoreThis">
		
	<cfprocresult name="spr_getBranchProfile" resultset="1">
	<cfprocresult name="spr_FiscalYears"  resultset="2">
</cfstoredproc>


<!--- <cfoutput>#spr_getBranchProfile.recordCount#</cfoutput><cfabort> --->

<cfwddx action="CFML2WDDX" input="#spr_getBranchProfile#" output="client.sprWDDX_getBranchProfile">
<cfwddx action="CFML2WDDX" input="#spr_FiscalYears#"   output="client.sprWDDX_FiscalYears">

