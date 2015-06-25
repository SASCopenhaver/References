<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><title><cfoutput>#local.ModuleName#</cfoutput></title></head>

<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllOrgs#" output="spr_AllOrgs">
<cfset temp = DeleteClientVariable("sprWDDX_AllOrgs")>

<script language="JavaScript">
/*
function of_InitialValue (argObjName, argValue, argText, argPosNum)
{//alert(argObjName, argValue, argText, argPosNum)
    with(self.document.forms[0])
    {
        var controlType = argObjName.substr(0,1);
        if ( controlType == "s")//select box
        {
            eval(argObjName  + ".options["+argPosNum+"].value = "+ argValue);
			//alert(eval(argObjName  + ".options["+argPosNum+"].value = "+ argValue))
            eval(argObjName  + ".options["+argPosNum+"].text = \"" + argText +"\"");
        }//end of if
        else if (controlType == "t")
        {
            alert(controlType);
        }//end of else if
    }//end of with
}//end of function
*/

//------------------------------------------------------------------------------
var vValidationPassed;
<cfwddx action="CFML2JS" input="#spr_AllOrgs#" toplevelvariable="tlv_AllOrgs">
var rowsAllOrgs = tlv_AllOrgs.getRowCount();
function holdAllOrgs (aOrgID, aOrgAbbr, aOrgFullName)
{ this.aOrgID = aOrgID;  
  this.aOrgAbbr = aOrgAbbr;  
  this.aOrgFullName = aOrgFullName; 
}
arrayAllOrgs = new Array();
for (var o=0; o<rowsAllOrgs; o++)
{ arrayAllOrgs[o] = new holdAllOrgs
                        (
                            tlv_AllOrgs.orgid[o],
                            tlv_AllOrgs.orgabbr[o],
                            tlv_AllOrgs.orgfullname[o]
                         )
}
//------------------------------------------------------------------------------
function populateOrgs(rowNum)
{
    with (self.document.forms[0])
    {
        for (var o=0; o<rowsAllOrgs; o++)
        {
            optionOrgs = new Option;
            optionOrgs.value = arrayAllOrgs[o].aOrgID;
            optionOrgs.text  = arrayAllOrgs[o].aOrgAbbr + " - " + arrayAllOrgs[o].aOrgFullName;
            s_Orgs.options[rowNum] = optionOrgs;
            rowNum++;
        }
        
        optionOrgs = new Option;
        optionOrgs.value = 0;
        optionOrgs.text  = "*** Create New Organization ***";
        s_Orgs.options[rowNum] = optionOrgs;
        
        txt_OrgAbbr.disabled = true;
        txt_OrgFullName.disabled = true;
      
    }
}
////////////////////////////////////////////////////////////////////////////////
function of_ChngOrg(argOrgID){with (self.document.forms[0]){

if (argOrgID == -1)
{
    txt_OrgAbbr.value = ""; 
    txt_OrgFullName.value = "";
    txt_OrgAbbr.disabled = true;
    txt_OrgFullName.disabled = true;
}
else if (argOrgID == 0)
{
    txt_OrgAbbr.disabled = false;
    txt_OrgFullName.disabled = false;
    txt_OrgAbbr.value = ""; 
    txt_OrgFullName.value = "";
}
else
{
    txt_OrgAbbr.disabled = false;
    txt_OrgFullName.disabled = false;
    for (var o=0; o<s_Orgs.options.length; o++)
    {
        
        if (argOrgID == arrayAllOrgs[o].aOrgID)
        {
            txt_OrgAbbr.value = arrayAllOrgs[o].aOrgAbbr; 
            txt_OrgFullName.value = arrayAllOrgs[o].aOrgFullName;
            break;
        }
    }
}
}}
////////////////////////////////////////////////////////////////////////////////
function of_Submit(){with (self.document.forms[0]){
    if (vValidationPassed == "YES")
    {
        action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=InsUpdOrgs";
        //alert("Submit")
        submit();
    }
}}
////////////////////////////////////////////////////////////////////////////////
</script>

<body>
<form method="post">
<table align="center" width="50%" cellspacing="2" cellpadding="2" border="0">
<tr>
    <td width="20%" class="Brown9">Organizations:</td>
    <td width="80%">
        <select name="s_Orgs" title="Organizations" onchange="of_ChngOrg(this.options[selectedIndex].value)">
            <option></option>
		</select>
    </td>
</tr>
<tr>
    <td width="50%" class="Brown9">Abbreviation:</td>
    <td>
        <input type="Text" name="txt_OrgAbbr" 
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
    </td>
</tr>
<tr>
    <td width="50%" class="Brown9">Full Name:</td>
    <td><input type="Text" name="txt_OrgFullName" size="50"
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
    </td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td>
    <table width="100%" cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_Menu.cfm"></td>
            <td> <cfinclude template="cb_SaveOrgs.cfm"></td>
        </tr>
        </table>
    </td>
</tr>
</table>
</form>


</body>
</html>
<!--- <script language="JavaScript">
of_InitialValue ("s_Orgs", -1, "== Make Selection ==", 0);
populateOrgs(1);
</script> --->
<cfif isDefined("client.InsUpdOrgID")>
    <cfset local.InsUpdOrgID = #client.InsUpdOrgID#>
    <cfset temp = DeleteClientVariable("InsUpdOrgID")>
    
    <script language="JavaScript">
        of_InitialValue ("s_Orgs", -1, "== Make Selection ==", 0);
        populateOrgs(1);
        for (var o=0; o<self.document.forms[0].s_Orgs.options.length; o++)
        {with(self.document.forms[0]){
            if (s_Orgs.options[o].value == "<cfoutput>#local.InsUpdOrgID#</cfoutput>")
            {
                s_Orgs.options[o].selected = true;
                txt_OrgAbbr.value = arrayAllOrgs[o - 1].aOrgAbbr; 
                txt_OrgFullName.value = arrayAllOrgs[o - 1].aOrgFullName;
                txt_OrgAbbr.disabled = false;
                txt_OrgFullName.disabled = false;
                break;
            }
        }}
    
    </script>
<cfelse>
    <script language="JavaScript">
        //alert("Not Def")
        of_InitialValue ("s_Orgs", -1, "== Make Selection ==", 0);
        populateOrgs(1);
    </script>
</cfif>




