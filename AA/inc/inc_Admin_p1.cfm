<!--- inc_Admin_p1.cfm --->
<div class="story">
<cfset local.vLoopNum = -1>
<table title="Navigation Controls" border="0" cellspacing="2" cellpadding="1">
<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
	<cfif #client.CallFile# EQ #spr_getNavigation.st_call_file#>
		<cfset local.FileID = spr_getNavigation.st_id>
		<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
		<cfif #local.FileID# EQ #spr_getNavigation.st_parent_id#>
		<!--- .... --->
		
		<cfset local.vColorTemp = local.vLoopNum +2>
		<cfset local.vLoopNum = local.vLoopNum + 1>
				
		<cfif local.vColorTemp EQ 1>
			<cfset local.BGC = "##EDAB6B">
		<cfelseif local.vColorTemp EQ 2>
			<cfset local.BGC = "##D6B18C">
		<cfelseif local.vColorTemp EQ 3>
			<cfset local.BGC = "##E1BD9C">
		<cfelseif local.vColorTemp EQ 4>
			<cfset local.BGC = "##F1DBC7">
		<cfelseif local.vColorTemp EQ 5>
			<cfset local.BGC = "##F4E7DB">
		</cfif>	
		<!--- .... --->
			
			<tr bgcolor="<cfoutput>#local.BGC#</cfoutput>">
				<cfoutput>
				<td bgcolor="##FFFFFF" bordercolor="#local.BGC#"><!--- #spr_getNavigation.st_call_file# --->
					<cfset local.FileImgName = "#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg">
					<img border=0 
						 src="Img/#local.FileImgName#" 
						 alt="#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-7)#" 
						 name="#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-7)#">
				</td>
				<td valign="top" width="180px">
					<br><a href="##" onClick="of_CallFile(#spr_getNavigation.st_id#);" style="font-weight:bold; ">#spr_getNavigation.st_nm#</a>
				</td>
				</cfoutput>
				<cfset local.St_ID = spr_getNavigation.st_id>
				<cfloop query="spr_getCapsuleStory" startrow="1" endrow="#spr_getCapsuleStory.recordCount#">
					<cfif #local.St_ID# EQ #topic_seq_on_page#>
						<cfset local.vTxt = topic_txt>
						<cfbreak>
					</cfif>
				</cfloop>
				<td>
					<cfset local.vTxt = REReplace(local.vTxt, "Note:","<br><br><strong>Note:")>
					<cfset local.vTxt = local.vTxt&"</strong>">
					<span class="c_fieldValueBlack"><cfoutput>#local.vTxt#</cfoutput></span> 
				</td>
				
			</tr>
		</cfif>
		</cfloop>
		<cfbreak>
	</cfif>
</cfloop>
</table>
</div>
