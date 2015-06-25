<!--- _inc_Story_Capsule.cfm --->
<!--- 
<cfset local.vRecordCount = spr_getCapsuleStory.recordCount>
<cfset local.vDivision = local.vRecordCount/3>
<cfif #local.vDivision# LTE 1>
	<cfset local.vLoops = "1"> 
<cfelse>
	<cfset local.vMod =  local.vRecordCount mod 3>
	<cfif local.vMod EQ 0>
		<cfset local.vLoops = local.vDivision> 
	<cfelse>
		<cfset local.vDotPos = Find(".",local.vDivision)-1>
		<cfset local.vLoops = Left(local.vDivision,local.vDotPos)+1> 
	</cfif>
</cfif>
local.vLoops= <cfoutput>#local.vLoops#</cfoutput>
--->
<div class="story">
<table title="Story" align="center" width="80%" border="0" cellpadding="2" cellspacing="2">
	<cfoutput query="spr_getCapsuleStory">
	<cfset local.vMod = CurrentRow mod 3>
	<cfif local.vMod EQ 1>
		<cfset local.vColor = "##FF4352">
	<cfelseif local.vMod EQ 2>
		<cfset local.vColor = "##658C00">
	<cfelseif local.vMod EQ 0>
		<cfset local.vColor = "##D69E2F">
	</cfif>
	<tr>
		<td width="10%">&nbsp;</td>	
		<td>
			<h3 style="color:#local.vColor#;">#topic_title#</h3>
		</td>
	</tr>
	<tr>
		<td width="10%">&nbsp;</td>	
		<td class="storyLeft">
			#topic_txt#
			<br><br>
		</td>
	</tr>
	</cfoutput>
</table>
</div>
