<cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
<cfset local.PrjSuperID = #strAppUser.UserID#>
<!--- <cfoutput>#local.PrjSuperID#<cfabort></cfoutput> --->

<cfset local.PrjStat        = #FORM.s_PrjsStat#>
<cfset local.PrjID          = #FORM.s_Prjs#>
<cfset local.PrjDescr       = #FORM.txt_ProjDescr#>
<cfset local.StartDate      = #FORM.s_StartMonths#&"/"&#FORM.s_StartDays#&"/"&#FORM.s_StartYears#>
<cfset local.StartDate      = dateformat(local.StartDate , "d-mmm-yyyy")>
<cfset local.ResearchLength = #FORM.txt_ResearchLength#>
<!---                                            
<cfoutput>                                       
TEST:<br>                                        
local.PrjStat = #local.PrjStat#<br>              
local.PrjID = #local.PrjID#<br>                  
local.PrjDescr = #local.PrjDescr#<br>            
local.StartDate = #local.StartDate#<br>          
local.ResearchLength = #local.ResearchLength#<br>
</cfoutput><cfabort> --->

<cfstoredproc procedure="PACK_INSUPD.sp_InsUpdPrj" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID"  value="#local.PrjID#"  null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPrjDescr" value="#local.PrjDescr#" null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_DATE"    variable="varStartDate" value="#local.StartDate#" null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varResearchLength"  value="#local.ResearchLength#"  null="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjSuperID" value="#local.PrjSuperID#" null="No">
  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_InsUpdPrj" maxrows="-1" variable="IgnoreThis">
  <cfprocresult name="spr_InsUpdPrj" resultset="1">
</cfstoredproc>
<cfif isDefined("client.strWDDX_InsUpdPrj")>
    <cfset temp = DeleteClientVariable("strWDDX_InsUpdPrj")>
</cfif>
<!--- 
<cfoutput query="spr_InsUpdPrj">
OrgID=#OrgID#<br>
IDS=#IDS#<br>
DESCRIPTIONS=#DESCRIPTIONS#<br>
START_DATE=#START_DATE#<br>
END_DATE=#END_DATE#
</cfoutput><cfabort>
 --->
<cfwddx action="CFML2WDDX" input="#spr_InsUpdPrj#" output="client.strWDDX_InsUpdPrj">