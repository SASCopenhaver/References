<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">

<cfstoredproc procedure="PHONEBOOK.PACK_CheckList.sp_getBranchProfile" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="In"  cfsqltype="CF_SQL_VARCHAR"   variable="argUserID" value="#strUser.UserID#"  null="No">

	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getBranchProfile"   maxrows="-1" variable="IgnoreThis">
	<cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_getBranchPOStat"   maxrows="-1" variable="IgnoreThis">

	<cfprocresult name="spr_getBranchProfile" resultset="1">
	<cfprocresult name="spr_getBranchPOStat" resultset="2">
	
</cfstoredproc>


<cfwddx action="CFML2WDDX" input="#spr_getBranchProfile#" output="client.sprWDDX_getBranchProfile">
<cfwddx action="CFML2WDDX" input="#spr_getBranchPOStat#" output="client.sprWDDX_getBranchPOStat">

<cfwddx action="CFML2WDDX" input="#strUser#" output="client.strWDDXUser">