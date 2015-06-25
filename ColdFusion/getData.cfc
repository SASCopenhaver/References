<!--- getData.cfc --->
<cfcomponent>
	<cffunction name="asCountries" access="remote" returntype="array">
		<cfargument name="search" type="any" required="no" default="">
        
		<cfset var data="">
        <cfset var result = ArrayNew(1)>
        
        <cfquery datasource="#request.dnsHR#" name="data">
 			SELECT country_name
			  FROM COUNTRIES c
 			 WHERE UPPER(c.country_name) LIKE UPPER('#arguments.search#')       
        </cfquery>
        <cfloop query="data">
        	<cfset ArrayAppend(result, country_name)>
        </cfloop>
		
        <cfreturn result>
	</cffunction>
</cfcomponent>