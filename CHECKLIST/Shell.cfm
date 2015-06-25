<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml11-transitional.dtd">
<html>
<head><title>CheckList - The digital Edition</title>

<script language="JavaScript">
	function of_Submit(argController){with (self.document.forms[0])
	{//alert(argController)
			action = "_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController="+argController;
			submit();
	}}
	//------------------------------------------------------------------
</script>

</head>
<body>

<cfif isDefined("client.strWDDXUser")>
	<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">
</cfif>

<form name="f_AppForm"  method="post">
<!--- <cfoutput>#strUser.UserFullName#</cfoutput><cfabort> --->
<cfinclude template="Header.cfm">

<table align="center" cellspacing="2" cellpadding="2"  border="0" >
<tr>
    <td>&nbsp;</td>
    <td id="tdContent"><cfinclude template="#client.FileToGoTo#"></td>
    <td>&nbsp;</td>
</tr>
</table>
</form>

<cfwddx action="CFML2WDDX" input="#strUser#" output="client.strWDDXUser">

<!--- <cfinclude template="Footer.cfm"> 
<script language="JavaScript">
	alert("Shell.cfm 2  "+"<cfoutput>#strUser.UserFullName#</cfoutput>")
</script>--->
</body>
</html>
