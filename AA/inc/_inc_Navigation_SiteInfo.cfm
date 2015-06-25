<!--- _inc_Navigation_SiteInfo.cfm --->
<div id="siteInfo">
<table title="Site Info">
	<tr>
		<td><img alt="World map" src="Img/worldmap_Small.gif"></td>
		<td><script language="javascript" type="text/javascript">
				var vOutputSI = "";
				if (orgBfrSI.length != 0)
				{
					for (var si=0; si<vOutputAD.length; si++)
					{
						vOutputSI += "<a href=\"#\">"+orgBfrSI[si].ast_nm+"</a> | ";
					}
					document.write(vOutputSI);
				}
			</script>
			&copy;<cfoutput>#Year(Now())#&nbsp;#Application.orgName#&nbsp;&nbsp;Version&nbsp;&##8211;&nbsp;#Application.appVer#</cfoutput>
<!--- 			
1.             BASELINE MAJOR Release Version #.

1.0.        Baseline + plus major update (ex:new screens, new pages)

1.0.0       Baseline, major updates, major Functionality changes (new links, new pulldowns)

1.0.0.0       Baseline, major updates, major functionality changes + MINOR behind the scene code changes
 --->
			<br>
			Please send comments and questions to: <a href="mailto:AlumniArchive@state.gov"><strong>AlumniArchive@state.gov</strong></a>
			<br>
			<cfif  client.CallPageID EQ "1001">
				<a href="http://intranet.state.gov/index.cfm?fa=privacy">Privacy Statement</a>
			</cfif>
		</td>
		
	</tr>
</table>
</div>
 