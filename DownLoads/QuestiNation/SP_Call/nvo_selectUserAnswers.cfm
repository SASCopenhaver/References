
<!--- <cfset local.PrjID = #FORM.s_UserPrjs#> --->

<!--- <cfoutput>TEST:<br>local.PrjID = #local.PrjID#<br>#strAppUser.UserID#<br>
#strAppUser.UserFName#<br>#strAppUser.UserLName#<br>#strAppUser.UserPass#<br>
#strAppUser.UserEmail#<br>#strAppUser.UserActInact#<br>#strAppUser.UserOrgID#
</cfoutput><cfabort> --->

<cfstoredproc procedure="PACK_SELECT_ALL.sp_UserAnswers" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varUserID" value="#strAppUser.UserID#"   null="No">
    <cfprocparam type="In" cfsqltype="CF_SQL_NUMERIC" variable="varPrjID"  value="#client.PrjID#"         null="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_UserAnswers" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_UA" resultset="1"><!--- UA = User Answers --->
    
</cfstoredproc>
<!---                      
<cfset strUA = StructNew()>
<cfset strUA.UserID = #spr_UA.PARTICIPANT_ID#>
<cfset strUA.PrjID  = #spr_UA.REASERCH_ID#>
<cfset strUA.Q1  = #spr_UA.Q1#>
<cfset strUA.Q2  = #spr_UA.Q2#>
<cfset strUA.Q3  = #spr_UA.Q3#>
<cfset strUA.Q4  = #spr_UA.Q4#>
<cfset strUA.Q5  = #spr_UA.Q5#>
<cfset strUA.Q6  = #spr_UA.Q6#>
<cfset strUA.Q7  = #spr_UA.Q7#>
<cfset strUA.Q8  = #spr_UA.Q8#>
<cfset strUA.Q9  = #spr_UA.Q9#>
<cfset strUA.Q10 = #spr_UA.Q10#>
<cfset strUA.Q11 = #spr_UA.Q11#>
<cfset strUA.Q12 = #spr_UA.Q12#>
<cfset strUA.Q13 = #spr_UA.Q13#>
<cfset strUA.Q14 = #spr_UA.Q14#>
<cfset strUA.Q15 = #spr_UA.Q15#>
<cfset strUA.Q16 = #spr_UA.Q16#>
<cfset strUA.Q17 = #spr_UA.Q17#>
<cfset strUA.Q18 = #spr_UA.Q18#>
<cfset strUA.Q19 = #spr_UA.Q19#>
<cfset strUA.Q20 = #spr_UA.Q20#>
<cfset strUA.Q21 = #spr_UA.Q21#>
<cfset strUA.Q22 = #spr_UA.Q22#>
<cfset strUA.Q23 = #spr_UA.Q23#>
<cfset strUA.Q24 = #spr_UA.Q24#>
<cfset strUA.Q25 = #spr_UA.Q25#>
<cfset strUA.Q26 = #spr_UA.Q26#>
<cfset strUA.Q27 = #spr_UA.Q27#>
<cfset strUA.Q28 = #spr_UA.Q28#>
<cfset strUA.Q29 = #spr_UA.Q29#>
<cfset strUA.Q30 = #spr_UA.Q30#>
<cfset strUA.Q31 = #spr_UA.Q31#>
<cfset strUA.Q32 = #spr_UA.Q32#>
<cfset strUA.Q33 = #spr_UA.Q33#>
<cfset strUA.Q34 = #spr_UA.Q34#>
<cfset strUA.Q35 = #spr_UA.Q35#>
<cfset strUA.Q36 = #spr_UA.Q36#>
<cfset strUA.Q37 = #spr_UA.Q37#>
<cfset strUA.Q38 = #spr_UA.Q38#>
<cfset strUA.Q39 = #spr_UA.Q39#>
<cfset strUA.Q40 = #spr_UA.Q40#>
<cfset strUA.Q41 = #spr_UA.Q41#>
<cfset strUA.Q42 = #spr_UA.Q42#>
                            --->


<cfif isDefined("client.sprWDDX_UA")>
    <cfset temp = DeleteClientVariable("sprWDDX_UA")>
</cfif>

<cfwddx action="CFML2WDDX" input="#spr_UA#" output="client.sprWDDX_UA">
<!--- 
<cfwddx action="WDDX2CFML" input="#client.strWDDX_UA#" output="strUA">
<cfoutput>#strUA.PrjID#<br>#strUA.Q42#</cfoutput><cfabort>
 --->