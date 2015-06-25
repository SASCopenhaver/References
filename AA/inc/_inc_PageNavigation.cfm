<!--- _inc_PageNavigation.cfm --->
<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
	<cfif #spr_getNavigation.st_loc# EQ "SL" AND #client.CallPageID#  EQ #spr_getNavigation.st_parent_id#>
	      <!--- OR 
		  #spr_getNavigation.st_loc# EQ "RL"
		  OR
		  #spr_getNavigation.st_loc# EQ "AD" 
		  >--->
		
			<div id="pageNav">
				<cfinclude template="_inc_Navigation_Sections.cfm">
				<!--- <cfinclude template="_inc_Navigation_RelatedLinks.cfm"> --->
				<!--- <cfinclude template="_inc_Navigation_Advertisement.cfm"> --->
			</div>
			
			<div id="content178">
		<cfbreak>
	<cfelse>
		<div id="content0">
	</cfif>
</cfloop>



