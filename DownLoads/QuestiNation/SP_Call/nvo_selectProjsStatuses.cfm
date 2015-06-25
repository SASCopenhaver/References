<!---  spr_PrjAccess could bring the following:        
OrgID       PRJACCESSDESCR                             
----------- ----------------------------------------   
          0 === Create New Project ===                 
        ALL View/Edit All Projects                     
        NA  View/Edit NOT Assigned Projects            
          2 View/Edit Project(s) Assigned To ECA       
          3 View/Edit Project(s) Assigned To IIT       
         -2 View Closed Project(s) Assigned to ECA     
         -3 View Closed Project(s) Assigned to IIT     
                                                   ---> 
<cfstoredproc procedure="PACK_SELECT_ALL.sp_PrjsStat" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_PrjsStat" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_PrjsStat" resultset="1">
</cfstoredproc>
<!--- <cfoutput>#spr_PrjsStat.recordCount#</cfoutput><cfabort> --->
<cfif isDefined("client.sprWDDX_PrjsStat")>
    <cfset temp = DeleteClientVariable("sprWDDX_PrjsStat")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_PrjsStat#" output="client.sprWDDX_PrjsStat">



