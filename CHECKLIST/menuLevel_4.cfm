<!--- menuLevel_4.cfm --->
<!--- <cfoutput>#strUser.CountPersonalPrjs#</cfoutput><cfabort> --->
<cfswitch expression=#client.FileToGoTo#>
<cfcase value="Home.cfm">
	|&nbsp;&nbsp;<span class="reqField"><strong>Home</strong></span>&nbsp;&nbsp;
	<cfif #strUser.CountPersonalPrjs# NEQ "0">
	|&nbsp;&nbsp;<a href="_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=Evaluation">My Evaluation</a>&nbsp;&nbsp;
	</cfif>
</cfcase>
<!--- ********************************************************************* --->
<cfcase value="Evaluation.cfm">
	<cfif #strUser.CountPersonalPrjs# NEQ "0">
	|&nbsp;&nbsp;<a href="_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=Home">Home</a>&nbsp;&nbsp;
	|&nbsp;&nbsp;<span class="reqField"><strong>My Evaluation</strong></span>&nbsp;&nbsp;
	</cfif>
</cfcase>
</cfswitch>
