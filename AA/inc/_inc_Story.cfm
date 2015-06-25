<!--- _inc_Story.cfm --->
<div class="story"> 
<cfloop query="spr_getStory" startrow="1" endrow="#spr_getStory.recordCount#">
<cfoutput>
<h3>#topic_title#</h3>#topic_txt#<br>
</cfoutput>
</cfloop>
</div>
