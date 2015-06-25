<!--- inc_SavedCustomSearch_p1.cfm --->
<cfset local.CountBSC = 0>
<cfset local.CountADV = 0>
<cfloop query="spr_getALLCustomSearches" startrow="1" endrow="#spr_getALLCustomSearches.recordCount#">
	<cfif #cust_search_type# EQ "BSC">
		<cfset local.CountBSC = local.CountBSC+1>
	<cfelseif #cust_search_type# EQ "ADV">
		<cfset local.CountADV = local.CountADV+1>
	</cfif>
</cfloop>
<table width="100%"  border="0" cellspacing="2" cellpadding="2">
<!--- BASIC SEARCHES --->
	<tr>
		<td style="border-bottom-style:groove;"  class="c_fieldName" bgcolor="#EDF7D8">
			<cfoutput>#local.CountBSC#</cfoutput> BASIC CUSTOM SEARCHES CREATED
		</td>
	</tr>
	<tr>
		<td>
			<cfif #local.CountBSC# EQ 0>
					&nbsp;
			<cfelse>
				<cfinclude template="inc_ListOfBasicSearches.cfm">
			</cfif>
		</td>
	</tr>
	<!--- ADVENCED SEARCHES --->
	<tr>
		<td style="border-top-style:groove;" class="c_fieldName" bgcolor="#EDF7D8">
			<cfoutput>#local.CountADV#</cfoutput> ADVANCED CUSTOM SEARCHES CREATED
		</td>
	</tr>
	<tr>
		<td>
			<cfif #local.CountADV# EQ 0>
					&nbsp;
			<cfelse>
				<cfinclude template="inc_ListOfAdvancedSearches.cfm">
			</cfif>
		</td>
	</tr>
</table>

