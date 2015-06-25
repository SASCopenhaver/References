<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><title><cfoutput>#local.ModuleName#</cfoutput></title></head>

<body>
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_Menu#" output="spr_Menu">
<cfloop index="i" from="1" to="1" step="1"><br></cfloop>

<form name="f_Menu" method="post">
<table align="center" width="60%"cellspacing="2" cellpadding="2" border="0">
<cfoutput query="spr_Menu">
<tr valign="top">
	<td width="10%" valign="top">
        <a href="AppFlow.cfm?#client.URLTOKEN#&urlCase=#MENU_ITEM#">
        <img src="#IMG#" title="#MENU_DESCRIPTION#" alt="#MENU_DESCRIPTION#" border="0">
        </a>
    </td>
    <td width="20%" valign="middle">
		<a href="AppFlow.cfm?#client.URLTOKEN#&urlCase=#MENU_ITEM#" class="Brown8">
        <!---#PAGE_TO_BE_CALLED# ---><font size="-1">#MENU_ITEM#</font>
		</a>
	</td>
	<td class="Teal10" valign="middle" width="40%"><br>#MENU_DESCRIPTION#</td>
</tr>
</cfoutput>
<tr>
    <td>&nbsp;</td><td>&nbsp;</td><td><cfinclude template="cb_LogOut.cfm"></td>
</tr>
</table>
</form>

<cfloop index="i" from="1" to="1" step="1"><br></cfloop>



</body>
</html>
