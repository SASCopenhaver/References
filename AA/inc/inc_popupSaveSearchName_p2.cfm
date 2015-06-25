<!--- inc_popupSaveSearchName_p2.cfm --->
<table width="100%"  border="0" cellspacing="2" cellpadding="2" bgcolor="#EDF7D8">
	<tr>
		<td class="c_fieldName">Custom Search had been saved.</td>
	</tr>
	<tr>
		<td>
			<input type="button" name="cb_SearchAndSave" value="Close and Continue" class="c_formbuttons" onClick="JavaScript: f_CloseAndContinue();">
		</td>
	</tr>
</table>

<script type="text/javascript" language="javascript">
function f_CloseAndContinue(){with(self.document.forms[0])	
}	
	
	window.opener.f_App.h_AnyChanges.value = "NO";
	//window.opener.of_CallFile("doCustomSearch");
	window.opener.of_Submit("_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController="+"doCustomSearch");
	window.close();
}}
</script>