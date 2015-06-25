<cfstoredproc datasource="#request.dsn#" procedure="ALUMNI.PACK_ALUMNI_ARCHIVE.sp_Time_Watch" returncode="no">
	<cfprocparam type="in" cfsqltype="cf_sql_numeric" variable="arg_Usr_ID" value="#client.Usr_CD#" null="no">
	<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_Point" value="#local.Point#" null="no">
	
</cfstoredproc>