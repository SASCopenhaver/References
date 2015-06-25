<!--- _inc_Feature.cfm --->
<cfif #spr_getFeature.recordCount# NEQ 0>
<div class="feature"> 
  <img alt="People" src="Img/Picture2.jpg" alt="Log In"><!---  width="140" height="100" --->
  <cfoutput>
  <h3>#spr_getFeature.t_pagecell_topic_title#</h3> 
  <p>#spr_getFeature.t_pagecell_topic#</p> 
  </cfoutput>
</div> 
</cfif>