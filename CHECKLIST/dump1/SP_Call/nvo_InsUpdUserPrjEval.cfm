<!--- NPA Officer --->
<cfif isDefined("FORM.s_NPA_Officer")>
	<cfset local.NPA_OfficerID = #FORM.s_NPA_Officer#>
<cfelse>
	<cfset local.NPA_OfficerID = 0>
</cfif>

<!--- Strategic Goal --->
<cfif isDefined("FORM.s_StrGoals")>
	<cfset local.StratGoalID = #FORM.s_StrGoals#>
<cfelse>
	<cfset local.StratGoalID = 0>
</cfif>

<!--- PersonID --->
<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">

<!--- PrjID --->
<cfset client.PrjID = #FORM.s_PrjNum#>

<!--- Answers --->
<cfset local.Answers = #FORM.h_DataModifiedAnswers#>

<!--- Evaluation Status --->
<cfset client.EvalStatus = ListContains(#local.Answers#, "-1")>
<cfif #client.EvalStatus# EQ "0">
	<cfset client.EvalStatus = "E">
<cfelse>
	<cfset client.EvalStatus = "0">
	<cfloop index="ListElement" list=#local.Answers#>
		<cfset client.EvalStatus = #client.EvalStatus# + #ListElement#>
	</cfloop>
	<cfif #client.EvalStatus# EQ "-27">
		<cfset client.EvalStatus = "NE">
	<cfelse>
		<cfset client.EvalStatus = "PE">
	</cfif>
</cfif>

<!--- Comments --->
<cfset local.Eval_Comments = #Trim(FORM.txta_Comments)#>
<!--- <cfset local.Eval_Comments = #Replace(local.Eval_Comments, "'","'","ALL")#> --->

<!--- 
<cfoutput>
local.NPA_Officer = #local.NPA_Officer#<br>
local.StratGoalID = #local.StratGoalID#<br>
strUser.PersonID = #strUser.PersonID#<br>
client.PrjID = #client.PrjID#<br>
local.Answers = #local.Answers#<br>
client.EvalStatus = #client.EvalStatus#<br>
local.Eval_Comments = #local.Eval_Comments#
</cfoutput><cfabort>
 --->


<cfstoredproc procedure="PACK_EVAL.sp_InsUpdUserPrjEval" datasource="#client.DSN#" returncode="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="argNPA_OfficerID" value="#local.NPA_OfficerID#" null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="argStratGoalID"   value="#local.StratGoalID#" null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="argPersonID"      value="#strUser.PersonID#"  null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="argPrjID"         value="#client.PrjID#"       null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="argAnswers"       value="#local.Answers#"     null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="argEvalStatus"    value="#client.EvalStatus#"  null="No">
	<cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="argComments"      value="#local.Eval_Comments#" null="No">
</cfstoredproc>
