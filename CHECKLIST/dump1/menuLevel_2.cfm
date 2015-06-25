<!--- menuLevel_2.cfm --->
<!--- <cfoutput>#client.NumOfBranches#</cfoutput><cfabort> --->

<cfswitch expression=#client.FileToGoTo#>
<cfcase value="Home.cfm">
	<cfoutput>
	|&nbsp;&nbsp;<span class="reqField"><strong>Home</strong></span>&nbsp;&nbsp;
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=DivisionInfo">Division Info</a>&nbsp;&nbsp;
<!--- 	
	<cfif #client.NumOfBranches# EQ "0">
		|&nbsp;&nbsp;<a href="_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=BranchInfo">Branch Info</a>&nbsp;&nbsp;
		|&nbsp;&nbsp;<a href="_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=Evaluation">My Evaluation</a>&nbsp;&nbsp;
	</cfif>
 --->
 	</cfoutput>
</cfcase>
<!--- ********************************************************************* --->
<cfcase value="DivisionInfo.cfm">
	<cfoutput>
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=Home">Home</a>&nbsp;&nbsp;
	|&nbsp;&nbsp;<span class="reqField"><strong>Division Info</strong></span>&nbsp;&nbsp;
<!--- 
	<cfif #client.NumOfBranches# EQ "0">
		|&nbsp;&nbsp;<a href="_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=BranchInfo">Branch Info</a>&nbsp;&nbsp;
		|&nbsp;&nbsp;<a href="_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=Evaluation">My Evaluation</a>&nbsp;&nbsp;
	</cfif>
 --->
 	</cfoutput>
</cfcase>
<!--- ********************************************************************* --->
<cfcase value="BranchInfo.cfm">
	<cfoutput>
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=Home">Home</a>&nbsp;&nbsp;
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=DivisionInfo">Division Info</a>&nbsp;&nbsp;
<!--- 
	<cfif #client.NumOfBranches# EQ "0">
		|&nbsp;&nbsp;<span class="reqField"><strong>Branch Info</strong></span>&nbsp;&nbsp;
		|&nbsp;&nbsp;<a href="_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=Evaluation">My Evaluation</a>&nbsp;&nbsp;
	</cfif>
 --->
 	</cfoutput>
</cfcase>

<cfcase value="Evaluation.cfm">
	<cfoutput>
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=Home">Home</a>&nbsp;&nbsp;
	|&nbsp;&nbsp;<a href="_Controller.cfm?#client.URLTOKEN#&urlController=DivisionInfo">Division Info</a>&nbsp;&nbsp;
<!--- 
	<cfif #client.NumOfBranches# EQ "0">
		|&nbsp;&nbsp;<a href="_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=BranchInfo">Branch Info</a>&nbsp;&nbsp;
		|&nbsp;&nbsp;<span class="reqField"><strong>My Evaluation</strong></span>&nbsp;&nbsp;
	</cfif>
 --->
 	</cfoutput>
</cfcase>
</cfswitch>

<cfif isDefined("client.NumOfBranches")>
	<cfset temp = DeleteClientVariable("NumOfBranches")>
</cfif>
 