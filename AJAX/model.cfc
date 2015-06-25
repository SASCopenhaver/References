<!---
<cfcomponent>
	<cffunction name="cfc_getSelectedObjList" access="remote" output="false" returntype="any">
		<cftry>
			<cfstoredproc procedure="PACK_DATADICTIONARY.sp_getSelectedObjList" datasource="#datasource#" returncode="true" >
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="TABLE">
				<cfprocresult name="spr_getSelectedObjList" resultset="1">
			</cfstoredproc>
			<cfdump var="#spr_getSelectedObjList#" >
			<cfreturn spr_getSelectedObjList>		
			
			<cfcatch type="any">
            	<cfset errorMessage = "something happened">
        	</cfcatch>  
        				
		</cftry>
		
	</cffunction>

</cfcomponent>
--->
<cfcomponent displayname="comp_JobCorpsAllot">
   
        <cffunction name="f_GetJobCorpsAllot" access="remote" returntype="any" returnformat="plain" output="false"  
                    hint="Function returns Jonb Corps Allotments amount within period (CurrentPY - 5) years, CurrentPY, and (CurrentPY + 2) years">
                
                <cfargument type="string" name="argFirstYearInPeriod" hint="e.g. 2008">
                <cfargument type="string" name="argLastYearInPeriod" hint="e.g. 2015">
                
                <cfstoredproc procedure="HR.ALLOTMENT_AMOUNT_PKG_2.sp_selectAllotment"
                              datasource="HR" returncode="false" >
                    <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" variable="argFirstYearInPeriod" value="#arguments.argFirstYearInPeriod#" >
                    <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" variable="argLastYearInPeriod" value="#arguments.argLastYearInPeriod#" >
                    <!---<cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" variable="argFirstYearInPeriod" value="2012" >
                    <cfprocparam type="in" cfsqltype="CF_SQL_VARCHAR" variable="argLastYearInPeriod" value="2016" >--->
        
                    <cfprocresult name="spr_selectAllotment" resultset="1">
                    
                </cfstoredproc>
           
                <!---
                <cfwddx action="cfml2wddx" input="#spr_selectAllotment#" output="client.sprWDDX_selectAllotment">
				<cfreturn client.sprWDDX_selectAllotment />
                Provides output: <cfdump var="#spr_selectAllotment#" />
				--->
                <!---<cfdump var="#spr_selectAllotment#" /><cfabort>--->
                <cfset  client.spr_selectAllotmentJSON = SerializeJSON(spr_selectAllotment)>
				<cfreturn client.spr_selectAllotmentJSON>
        </cffunction> 
    

        <cffunction name="f_getAllotment" access="remote" returntype="any" returnformat="plain" output="false" hint="AJAX call for JSON">
                <cfstoredproc procedure="HR.ALLOTMENT_AMOUNT_PKG_2.sp_getAllotment" datasource="HR" returncode="false" >
                    <cfprocresult name="spr_getAllotment" resultset="1">
                </cfstoredproc>
                <cfset  client.spr_getAllotmentJSON = SerializeJSON(spr_getAllotment)>
                <!---<cfdump var="#spr_getAllotment#"><cfabort>
                <cfset  client.spr_getAllotmentJSON = #spr_getAllotment#>--->
				<cfreturn client.spr_getAllotmentJSON>
        </cffunction> 
   	
</cfcomponent>


<!---

				<cfcase value="sp_authenticateUSR"><!--- <cfoutput>#client.user_uname# #client.user_pass#</cfoutput><cfabort> --->
						<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_user_uname" value="#client.user_uname#"  null="no">
						<cfprocparam type="in" cfsqltype="cf_sql_varchar" variable="arg_user_pass"  value="#client.user_pass#"   null="no">
						<!--- .............................................. --->
						<cfprocresult name="spr_authenticateUSR" resultset="1">
						<cfprocresult name="spr_relatedSites" resultset="2">
						<cfprocresult name="spr_StrMaxLength" resultset="3">
				</cfcase>
				
				
<cffunction name="getProfileData" 
            access="public" 
            output="false" 
            returntype="string">0

    <cfargument name="cusip" type="string" required="true">
    <cfargument name="report_date" type="date" required="true">
    <cfset var errorMessage = "everything is good">

    <cftry>
        <cfstoredproc datasource="#dsn#" procedure="prc_asset_profile_retrieve">
            <cfprocparam type="in" cfsqltype="cf_sql_varchar" value="#cusip#" dbvarname="@cusip">
            <cfprocparam type="in" cfsqltype="cf_sql_varchar" value="#report_date#" dbvarname="@reportDate">
            <cfprocresult name="profile_head" resultset="1">
            <cfprocresult name="attribution" resultset="2">
            <cfprocresult name="characteristics" resultset="3">
            <cfprocresult name="exposure" resultset="4">
            <cfprocresult name="weights" resultset="5">
            <cfprocresult name="holdings" resultset="6">
        </cfstoredproc>

        <cfset var profileArray = []>
        <cfset #ArrayAppend(profileArray,profile_head)#>

        <cfcatch type="any">
            <cfset errorMessage = "something happened">
        </cfcatch>          
    </cftry>

    <cfreturn profileArray>
</cffunction>
--->