<!--- inc_Admin_p1.cfm --->
<div class="story">
<table align="center" width="95%" border="0" cellspacing="1" cellpadding="1">
  <tr>
    <td width="35%">
	<!--- ################################################################################################ --->
		<table width="100%"  border="0" cellspacing="2" cellpadding="1">
		<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
			<cfif #client.CallFile# EQ #spr_getNavigation.st_call_file#>
				<cfset local.FileID = #spr_getNavigation.st_id#>
				<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
				<cfif #local.FileID# EQ #spr_getNavigation.st_parent_id#>
					<cfoutput>
					<tr>
						<td width="70px"><!--- #spr_getNavigation.st_call_file# --->
							<cfset local.FileImgName = "#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg">
							<img border=0 
								 src="Img/#local.FileImgName#" 
								 alt="#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-7)#" 
								 name="#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-7)#">
						</td>
						<td valign="top" width="30%">
							<br><a href="##" onClick="of_CallFile(#spr_getNavigation.st_id#);"
											 onMouseOver="JavaScript: of_showHelpTopic('#spr_getNavigation.st_id#');" 
										     onMouseOut="JavaScript:  of_showHelpTopic('0');">#spr_getNavigation.st_nm#</a>
						</td>
						<td>&nbsp;</td>
					</tr>
					</cfoutput>
				</cfif>
				</cfloop>
				<cfbreak>
			</cfif>
		</cfloop>
		</table>
	<!--- ################################################################################################ --->
	</td>
    <td id="id_HelpTopic">&nbsp;</td>
  </tr>
</table>
</div>
<script language="javascript" type="text/javascript">
of_showHelpTopic('0');
</script>
