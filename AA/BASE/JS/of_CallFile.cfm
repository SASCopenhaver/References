<!--- of_CallFile.cfm --->
<script language="javascript1.4" type="text/javascript">
function of_CallFile(argRequest)
{with(self.document.forms[0])
{
	//alert(argRequest)
	of_Submit("_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController="+argRequest);
	
}}
</script>
