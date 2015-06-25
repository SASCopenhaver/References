<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllOrgs#" output="spr_AllOrgs">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_AllOrgs")> --->
<!---
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllUsers#" output="spr_AllUsers">
 <cfset temp = DeleteClientVariable("sprWDDX_AllUsers")> 
--->
<cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_AllUsers" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllUsers" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllUsers" resultset="1">
</cfstoredproc>



<html><head><title><cfoutput>#local.ModuleName#</cfoutput></title></head>

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
////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////
<cfwddx action="CFML2JS" input="#spr_AllUsers#" toplevelvariable="tlv_AllUsers">
var rowsAllUsers = tlv_AllUsers.getRowCount();
function holdUsers( aUserID, 
                    aUserFName,    aUserLName, 
                    aUserPass,     aUserEmail, 
                    aUserActInact, aUserOrgID)
{
	this.aUserID      = aUserID;       
    this.aUserFName   = aUserFName;    this.aUserLName   = aUserLName;
    this.aUserPass    = aUserPass;     this.aUserEmail    = aUserEmail;
    this.aUserActInact= aUserActInact; this.aUserOrgID   = aUserOrgID;
}
arrayAllUsers = new Array();
arraySUsers = new Array(); //SUsers - Selected Users
for (var u=0; u<rowsAllUsers; u++)
{
arrayAllUsers[u] = new holdUsers( tlv_AllUsers.userid[u],
					           tlv_AllUsers.userfname[u],    tlv_AllUsers.userlname[u],
                               tlv_AllUsers.userpass[u],     tlv_AllUsers.useremail[u],
                               tlv_AllUsers.useractinact[u], tlv_AllUsers.userorgid[u]
                               );
}
////////////////////////////////////////////////////////////////////////////////
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
        optionOrgs.text  = "=== Administrators ===";
        s_Orgs.options[rowNum] = optionOrgs;
    }
}
////////////////////////////////////////////////////////////////////////////////
function changeUsers(argOrgID){with (self.document.forms[0]){

//The following builds the first row in s_Users
s_Users.options.length = 0;
optionUsers = new Option;
if (argOrgID == -1)
{
    optionUsers.text  = "== Select Organization First ==";
    optionUsers.value = -1;
}
else if (argOrgID == 0) 
{
    optionUsers.text  = "*** Create New Administrator ***";
    optionUsers.value = 0;
}
else 
{
    optionUsers.text  = "*** Create New User ***";
    optionUsers.value = 0;
}
s_Users.options[0] = optionUsers;
//The above builds the first row in s_Users

txt_FName.value = "";
txt_LName.value = "";
txt_Pass.value  = "";
txt_Email.value = "";
rb_ActInact[0].checked = true;
rb_ActInact[1].checked = false;
h_InsUpdID.value = 0;
h_InsUpdFName.value    = "";
h_InsUpdLName.value    = "";
h_InsUpdPass.value     = "";
h_InsUpdEmail.value    = "";
h_InsUpdActInact.value = "A";
h_InsUpdOrgID.value    = s_Orgs.options[s_Orgs.options.selectedIndex].value;

if (argOrgID != -1)
{
    var ActInact;
    var su=1;//su - SELECTED USERS
    for (var u=0; u<rowsAllUsers; u++)
    {
        if (arrayAllUsers[u].aUserOrgID == argOrgID)
        {
            if (arrayAllUsers[u].aUserActInact == "I") {ActInact = "   (inactive)";}
            else {ActInact = "";}
            
            optionUsers = new Option;
            optionUsers.value = arrayAllUsers[u].aUserID;
            optionUsers.text  = arrayAllUsers[u].aUserID+"  "+arrayAllUsers[u].aUserLName+", "+arrayAllUsers[u].aUserFName+ActInact;
            s_Users.options[su] = optionUsers;
            
            arraySUsers[su-1] = new holdUsers( tlv_AllUsers.userid[u],
					           tlv_AllUsers.userfname[u],    tlv_AllUsers.userlname[u],
                               tlv_AllUsers.userpass[u],     tlv_AllUsers.useremail[u],
                               tlv_AllUsers.useractinact[u], tlv_AllUsers.userorgid[u]
                               );
            
            su++;
        }
    }
    
}
}}
////////////////////////////////////////////////////////////////////////////////
function setUserDetails(argUserID){with (self.document.forms[0]){
//alert(argUserID)
if (argUserID == 0)
{
    txt_FName.value = "";
    txt_LName.value = "";
    txt_Pass.value  = "";
    txt_Email.value = "";
    rb_ActInact[0].checked = true;
    rb_ActInact[1].checked = false;
    
    h_InsUpdID.value       = 0;
    h_InsUpdFName.value    = "";
    h_InsUpdLName.value    = "";
    h_InsUpdPass.value     = "";
    h_InsUpdEmail.value    = "";
    h_InsUpdActInact.value = "A";
    h_InsUpdOrgID.value    = s_Orgs.options[s_Orgs.options.selectedIndex].value;
}
else
{
    for (var su=0; su<arraySUsers.length; su++)
    {
        if (argUserID == arraySUsers[su].aUserID)
        {
            txt_FName.value = arraySUsers[su].aUserFName;
            txt_LName.value = arraySUsers[su].aUserLName;
            txt_Pass.value  = arraySUsers[su].aUserPass;
            txt_Email.value = arraySUsers[su].aUserEmail;
            if (arraySUsers[su].aUserActInact == "A")
            {
                rb_ActInact[0].checked = true;
                rb_ActInact[1].checked = false;
            }
            else// if (arraySUsers[su].aUserActInact == "I")
            {
                rb_ActInact[0].checked = false;
                rb_ActInact[1].checked = true;
            }
            
            h_InsUpdID.value       = arraySUsers[su].aUserID;
            h_InsUpdFName.value    = arraySUsers[su].aUserFName;
            h_InsUpdLName.value    = arraySUsers[su].aUserLName;
            h_InsUpdPass.value     = arraySUsers[su].aUserPass;
            h_InsUpdEmail.value    = arraySUsers[su].aUserEmail;
            h_InsUpdActInact.value = arraySUsers[su].aUserActInact;
            h_InsUpdOrgID.value    = arraySUsers[su].aUserOrgID;
            break;
            
        }
    }
}
}}
////////////////////////////////////////////////////////////////////////////////
function checkRadioButtons(){with (self.document.forms[0]){
if (vValidationPassed == "YES")
{
    if (rb_ActInact[0].checked == false && rb_ActInact[1].checked == false)
    {
        alert("Make an appropriate selection between "+rb_ActInact[0].id+" and "+rb_ActInact[1].id);
        vValidationPassed == "NO"
    }
}
}}
////////////////////////////////////////////////////////////////////////////////
function of_Submit(){with (self.document.forms[0]){
 if (vValidationPassed == "YES")
    {
       
        h_InsUpdID.value       = s_Users.options[s_Users.options.selectedIndex].value;

        h_InsUpdFName.value    = txt_FName.value;
        h_InsUpdLName.value    = txt_LName.value;
        h_InsUpdPass.value     = txt_Pass.value;
        h_InsUpdEmail.value    = txt_Email.value;
        
        if (rb_ActInact[0].checked == true)
        {
            h_InsUpdActInact.value = "A";
        }
        else 
        {
            h_InsUpdActInact.value = "I";
        }
        
        h_InsUpdOrgID.value    = s_Orgs.options[s_Orgs.options.selectedIndex].value;
     
        action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=InsUpdUserProfile";
        submit();
        
    }
}}
////////////////////////////////////////////////////////////////////////////////
</script>


<form method="post">
    <input type="Hidden" name="h_InsUpdID"       value="0">
    <input type="Hidden" name="h_InsUpdFName"    value="FName">
    <input type="Hidden" name="h_InsUpdLName"    value="LName">
    <input type="Hidden" name="h_InsUpdPass"     value="Pass">
    <input type="Hidden" name="h_InsUpdEmail"    value="Email">
    <input type="Hidden" name="h_InsUpdActInact" value="A">
    <input type="Hidden" name="h_InsUpdOrgID"    value="0">
<table width="45%" align="center" cellspacing="2" cellpadding="2" border="0">
<tr>
    <td width="20%" class="Brown9">Organizations:</td>
    <td width="80%" align="left">
        <select name="s_Orgs" title="Organizations" onchange="changeUsers(this.options[selectedIndex].value)">
        <option></option></select>
    </td>
</tr>
<tr>
    <td width="20%" class="Brown9">Users:</td>
    <td width="80%" align="left">
        <select size="5" name="s_Users" title="Users" onchange="setUserDetails(this.options[selectedIndex].value)"><option></option></select>
    </td>
</tr>
<tr>
    <td class="Brown9">First Name:</td>
    <td  align="left">
        <input type="Text" name="txt_FName" size="30" onfocus="javascript: this.select();" 
        onblur="javascript: this.selected = false;"
        value=""
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
    </td>
</tr>
<tr>
    <td class="Brown9">Last Name:</td>
    <td  align="left">
        <input type="Text" name="txt_LName" size="30"  onfocus="javascript: this.select();" onblur="javascript: this.selected = false;"
        value="" 
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
    </td>
</tr>
<tr>
    <td class="Brown9">Password:</td>
    <td  align="left">
        <input type="Text" name="txt_Pass" size="30" maxlength="10"  onfocus="javascript: this.select();" onblur="javascript: this.selected = false;"
        value="" 
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
    </td>
</tr>
<tr>
    <td class="Brown9">E-Mail:</td>
    <td  align="left">
        <input type="Text" name="txt_Email" size="30" onfocus="javascript: this.select();" onblur="javascript: this.selected = false;"
        value="" 
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
    </td>
</tr>
<tr>
    <td>&nbsp;</td></td>
    <td  align="left">
    <table align="left" cellspacing="2" cellpadding="2" border="0">
    <tr>
        <td class="Teal9"><strong>Active</strong></td>
        <td><input type="Radio" name="rb_ActInact" value="A" id="Active"></td>
        <td class="Red9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Inactive</strong></td>
        <td><input type="Radio" name="rb_ActInact" value="I" id="Inactive"></td>
    </tr>
    </table>
    </td>
</tr>
<tr>
    <td>&nbsp;</td>
    <td>
        <table width="100%" cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_Menu.cfm"></td>
            <td> <cfinclude template="cb_SaveUserByAPPADMIN.cfm"></td>
        </tr>
        </table>
    </td>
</tr>
</table>
</form>
<cfloop index="i" from="1" to="1" step="1"><br></cfloop>

</body>

<cfif isDefined("client.InsUpdUserID")>
    <cfset local.InsUpdUserID = #client.InsUpdUserID#>
    <cfset temp = DeleteClientVariable("InsUpdUserID")>
    <cfwddx action="WDDX2CFML" input="#client.strWDDXInsUpdUser#" output="strInsUpdUser">
    <cfset temp = DeleteClientVariable("strWDDXInsUpdUser")>
    
    <script language="JavaScript">
        //----------------------------------------------------------------------
        //Populating s_Orgs
        of_InitialValue ("s_Orgs", -1, "== Select Organization ==", 0);
        populateOrgs(1);
        //Selecting OrgID that was inserted or updated
        for (var o=0; o<self.document.forms[0].s_Orgs.options.length; o++)
        {with (self.document.forms[0]){
            if ("<cfoutput>#strInsUpdUser.UserOrgID#</cfoutput>" == s_Orgs.options[o].value)
            {
                s_Orgs.options[o].selected = true;
                break;
            }
        }}
        
        //----------------------------------------------------------------------
        //Populating s_Users
        changeUsers("<cfoutput>#strInsUpdUser.UserOrgID#</cfoutput>");
        //Selecting UserID that was inserted or updated
        for (var su=0; su<arraySUsers.length; su++)
        {with (self.document.forms[0]){
            if ("<cfoutput>#strInsUpdUser.UserID#</cfoutput>" == arraySUsers[su].aUserID)
            {
                s_Users.options[su+1].selected = true;
            }
        }}
        
        setUserDetails("<cfoutput>#local.InsUpdUserID#</cfoutput>");
    </script>
<cfelse>
    <script language="JavaScript">
        of_InitialValue ("s_Orgs", -1, "== Select Organization ==", 0);
        populateOrgs(1);
        of_InitialValue ("s_Users", 0, "== Select Organization First ==", 0);
    </script>
</cfif>

<!--- 
<cfwddx action="CFML2WDDX" input="#strAppUser#" output="client.strWDDXAppUser">
 --->