<cfloop index="v" list="#GetClientVariablesList()#" delimiters=",">
	<cfset vDelClientVars = DeleteClientVariable("#v#")>
</cfloop>