<!--- inc_AdministerUSER_p1.cfm --->
<cfset local.CountN = spr_getListOfUsers_StatN.countN>
<cfset local.CountH = spr_getListOfUsers_StatH.countH>
<cfset local.CountA = spr_getListOfUsers_StatA.countA>
<cfset local.CountI = spr_getListOfUsers_StatI.countI>
<div class="story"> 
<cfloop query="spr_getStory" startrow="1" endrow="#spr_getStory.recordCount#">
<cfoutput>
<h3><br>#topic_title#&nbsp;
<cfif #topic_title# EQ "Approve Users">
	(#local.CountN#&nbsp;users)
<cfelseif #topic_title# EQ "Approve Changes in Users">
	(#local.CountH#&nbsp;users)
<cfelseif #topic_title# EQ "See Your Active Users">
	(#local.CountA#&nbsp;users)
<cfelseif #topic_title# EQ "Pre-Registered Users">
	(#local.CountI#&nbsp;users)
</cfif>
</h3>
#topic_txt#<br>
</cfoutput>
</cfloop>
</div>

