<!--- inc_popupCtrlHelp.cfm 
<cfoutput>#local.HelpItemId#</cfoutput>--->
<br>
<cfoutput query="spr_getCtrlHelp">
<span class="c_fieldName">#ctrl_help_title#</span>
<br>
<span class="c_fieldValueBlack">#ctrl_help_text#</span>
</cfoutput>
<p>
	<center><input type="button" value="Close" class="c_formbuttons" onClick="JavaScript: window.close();"></center>
</p>