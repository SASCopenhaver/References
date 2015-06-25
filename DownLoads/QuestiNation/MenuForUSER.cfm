<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><title><cfoutput>#local.ModuleName#</cfoutput></title></head>

<body>
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_UserMenu#" output="spr_UserMenu">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_UserPrjs#" output="spr_UserPrjs">

<script language="JavaScript">
//var vValidationPassed;
//------------------------------------------------------------------------------
<cfwddx action="CFML2JS" input="#spr_UserPrjs#" toplevelvariable="tlv_UserPrjs">
var rowsUserPrjs = tlv_UserPrjs.getRowCount();
function holdUserPrjs(aPrjID, aPrjDescr)
{   this.aPrjID       = aPrjID;
    this.aPrjDescr    = aPrjDescr;
}

arrayUserPrjs = new Array(holdUserPrjs.length);
for (var p=0; p<rowsUserPrjs; p++)
{
   arrayUserPrjs[p] = new holdUserPrjs(
                              tlv_UserPrjs.prjid[p],
                              tlv_UserPrjs.prjdescr[p]
                              );
}
//------------------------------------------------------------------------------
function of_setPrjs(){with(self.document.forms[0]){
if ( rowsUserPrjs > 0 )
{
    optionUP = new Option;
    optionUP.value = -1;
    optionUP.text =  "=== Select Project ===";
    s_UserPrjs.options[0] = optionUP;
    
    for (var p=0; p<rowsUserPrjs; p++)
    {
        optionUP = new Option;
        optionUP.value = arrayUserPrjs[p].aPrjID;
        optionUP.text =  arrayUserPrjs[p].aPrjDescr;
        s_UserPrjs.options[p+1] = optionUP;
    }
}
}}
//------------------------------------------------------------------------------
function of_Submit(){with(self.document.forms[0]){
    //alert(vValidationPassed)
    if (vValidationPassed == "YES")
    {
        action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=ProjectRequested";
        submit();
    }
}}
//------------------------------------------------------------------------------
</script>
<cfloop index="i" from="1" to="1" step="1"><br></cfloop>
<form method="post">
<table align="center" width="70%"cellspacing="2" cellpadding="2" border="0">
<!--- ********************************************************************* --->
<cfif #spr_UserPrjs.recordCount# GT 0>
<tr>
    <td valign="top">
        <img src="Img/Quest.JPG" alt="Questions" border="0">
    </td>
    <td valign="top" align="left">
        <select name="s_UserPrjs"><option></option></select>
    </td>
    <td valign="middle" class="Teal10">
        Select Project and click "Continue"
    </td>
</tr>
</cfif>
<!--- ********************************************************************* --->
<cfoutput query="spr_UserMenu">
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
<!--- ********************************************************************* --->
<tr>
    <td>&nbsp;</td><td>&nbsp;</td><td align="right">
    
    <table width="100%" cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <cfif #spr_UserPrjs.recordCount# GT 0>
            <td><cfinclude template="cb_ContinueForUserMenu.cfm"></td>
            </cfif>
        </tr>
        </table>
    </td>
</tr>
<!--- ********************************************************************* --->
</table>
</form>
<cfloop index="i" from="1" to="1" step="1"><br></cfloop>
</body>
</html>
<script language="JavaScript">
    of_setPrjs();
</script>
