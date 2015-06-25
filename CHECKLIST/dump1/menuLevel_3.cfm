<!--- menuLevel_3.cfm --->
<cfswitch expression=#client.FileToGoTo#>
<cfcase value="Home.cfm">
	<cfoutput>
	|&nbsp;&nbsp;<span class="reqField"><strong>Home</strong></span>&nbsp;&nbsp;
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=BranchInfo">Branch Info</a>&nbsp;&nbsp;
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=Evaluation">My Evaluation</a>&nbsp;&nbsp;
	</cfoutput>
</cfcase>
<!--- ********************************************************************* --->
<cfcase value="BranchInfo.cfm">
	<cfoutput>
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=Home">Home</a>&nbsp;&nbsp;
	|&nbsp;&nbsp;<span class="reqField"><strong>Branch Info</strong></span>&nbsp;&nbsp;
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=Evaluation">My Evaluation</a>&nbsp;&nbsp;
	</cfoutput>
</cfcase>

<cfcase value="Evaluation.cfm">
	<cfoutput>
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=Home">Home</a>&nbsp;&nbsp;
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=BranchInfo">Branch Info</a>&nbsp;&nbsp;
	|&nbsp;&nbsp;<span class="reqField"><strong>My Evaluation</strong></span>&nbsp;&nbsp;
	</cfoutput>
</cfcase>
</cfswitch>