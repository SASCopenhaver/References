<cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
<!---
<cfoutput>
#client.PrjID#<br>
#strAppUser.UserID#<br>
#client.QNum#<br>
#FORM.txta_Comments#<br>
#client.QValue#
</cfoutput><cfabort>
 --->

<cfstoredproc procedure="questination.PACK_INSUPD.sp_InsUpdUserComments" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID"  value="#client.PrjID#"         null="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varUserID" value="#strAppUser.UserID#"   null="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varQNum"   value="#client.QNum#"   null="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varQValue" value="#client.QValue#"   null="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varComm"   value="#FORM.txta_Comments#"   null="No">
    
</cfstoredproc>

<cfquery name="q_InsUpdAnswer" datasource="#client.DSN#" ><!--- dbtype="ODBC" --->
    UPDATE ANSWERS
        SET Q#client.QNum# = #client.QValue#
        WHERE PARTICIPANT_ID = #strAppUser.UserID# AND REASERCH_ID = #client.PrjID#
</cfquery>
