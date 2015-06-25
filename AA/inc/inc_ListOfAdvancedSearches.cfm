<!--- inc_ListOfAdvancedSearches.cfm --->
<table border="1" cellpadding="2" cellspacing="2">
<cfloop query="spr_getALLCustomSearches" startrow="1" endrow="#spr_getALLCustomSearches.recordCount#">
	<cfif #cust_search_type# EQ "ADV">
		<cfoutput>
		<tr>
			<td>#cust_search_nm#</td>
			<td>#cust_search_frst_nm#</td>
		</tr>
		</cfoutput>
	</cfif>
</cfloop>
</table>