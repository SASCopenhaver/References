<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllOrgs#" output="spr_AllOrgs">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_AllOrgs")> --->
<!--- 
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllUsers#" output="spr_AllUsers">
<cfset temp = DeleteClientVariable("sprWDDX_AllUsers")> 
--->



<!--- <cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllUsers#" output="spr_AllUsers">  --->
 <cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_AllUsers" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllUsers" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllUsers" resultset="1">
</cfstoredproc>
<!--- <cfset temp = DeleteClientVariable("strWDDXAppUser")> --->
<cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
<!--- <cfoutput>#strAppUser.UserOrgID#</cfoutput><cfabort> --->


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
    }
}
////////////////////////////////////////////////////////////////////////////////
function of_NewDataVSExisting(){with (self.document.forms[0]){
alert("of_NewDataVSExisting "+vValidationPassed)

if ( vValidationPassed == "YES")
{
    for (var u=0; u<rowsAllUsers; u++)
    {
        if (txt_FName.value.toUpperCase() == arrayAllUsers[u].aUserFName.toUpperCase() && txt_LName.value.toUpperCase() == arrayAllUsers[u].aUserLName.toUpperCase())
        {
            alert("Sorry,\n"+
                   "User with this name already exists.\n"+
                   "To avoid ambiguity, please change First or Last name you want to enter.\n"+
                   "Thank you.");
            vValidationPassed = "NO";
            txt_LName.focus();
            break;
        }
        else if ( txt_Pass.value.toUpperCase() == arrayAllUsers[u].aUserPass.toUpperCase())
        {
            alert("Sorry,\n"+
                   "This password already exists.\n"+
                   "To avoid ambiguity, please change your password.\n"+
                   "Thank you.");
            vValidationPassed = "NO";
            txt_Pass.focus();
            break;
        }
        else if ( txt_Email.value.toUpperCase() == arrayAllUsers[u].aUserEmail.toUpperCase())
        {
            alert("Sorry,\n"+
                   "This E-Mail already exists.\n"+
                   "To avoid ambiguity, please provide another E-Mail.\n"+
                   "Thank you.");
            vValidationPassed = "NO";
            txt_Email.focus();
            break;
        }
    }
}

}}
////////////////////////////////////////////////////////////////////////////////
function of_Submit(){with (self.document.forms[0]){
//alert("of_Submit "+vValidationPassed)

    if (vValidationPassed == "YES")
    {
        //h_UserID.value="0";
        h_UserFName.value=txt_FName.value;
        h_UserLName.value=txt_LName.value;
        h_UserPass.value=txt_Pass.value;
        h_UserEmail.value=txt_Email.value;
        h_UserActInact.value="A";
        h_UserOrgID.value=s_Orgs.options[s_Orgs.options.selectedIndex].value;
        action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=Update Personal Profile";
        submit();
    }
}}
////////////////////////////////////////////////////////////////////////////////
</script>

<cfloop index="i" from="1" to="1" step="1"><br></cfloop>

<head>
	<title><cfoutput>#local.ModuleName#</cfoutput></title>
</head>
<body>

<form method="post">
    <input type="Hidden" name="h_UserID"       value="0">
    <input type="Hidden" name="h_UserFName"    value="FName">
    <input type="Hidden" name="h_UserLName"    value="LName">
    <input type="Hidden" name="h_UserPass"     value="Pass">
    <input type="Hidden" name="h_UserEmail"    value="Email">
    <input type="Hidden" name="h_UserActInact" value="A">
    <input type="Hidden" name="h_UserOrgID"    value="0">
<table width="45%" align="center" cellspacing="2" cellpadding="2" border="0">
<tr>
    <td width="20%" class="Brown9">Organizations:</td>
    <td width="80%" align="left">
        <select name="s_Orgs" title="Organizations"><option></option></select>
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
    <td>&nbsp;</td>
    <td>
        <table width="100%" cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_MenuForUSER.cfm"></td>
            <td> <cfinclude template="cb_SaveExistingUser.cfm"></td>
        </tr>
        </table>
    </td>
</tr>
</table>
</form>
<cfloop index="i" from="1" to="1" step="1"><br></cfloop>
</body>
<script language="JavaScript">
////////////////////////////////////////////////////////////////////////////////
of_InitialValue ("s_Orgs", -1, "== Select Organization ==", 0);
populateOrgs(1);
////////////////////////////////////////////////////////////////////////////////
if ("<cfoutput>#strAppUser.UserID#</cfoutput>" != 0){with (self.document.forms[0]){
    for (var o=0; o<s_Orgs.options.length; o++)
    {
        if ("<cfoutput>#strAppUser.UserOrgID#</cfoutput>" == s_Orgs.options[o].value)
        {
            s_Orgs.options[o].selected = true;
            
            txt_FName.value = "<cfoutput>#strAppUser.UserFName#</cfoutput>";
            txt_LName.value = "<cfoutput>#strAppUser.UserLName#</cfoutput>";
            txt_Pass.value  = "<cfoutput>#strAppUser.UserPass#</cfoutput>";
            txt_Email.value = "<cfoutput>#strAppUser.UserEmail#</cfoutput>";
            
            h_UserID.value       = "<cfoutput>#strAppUser.UserID#</cfoutput>";
            h_UserFName.value    = "<cfoutput>#strAppUser.UserFName#</cfoutput>";
            h_UserLName.value    = "<cfoutput>#strAppUser.UserLName#</cfoutput>";
            h_UserPass.value     = "<cfoutput>#strAppUser.UserPass#</cfoutput>";
            h_UserEmail.value    = "<cfoutput>#strAppUser.UserEmail#</cfoutput>";
            h_UserActInact.value = "<cfoutput>#strAppUser.UserActInact#</cfoutput>";
            h_UserOrgID.value    = "<cfoutput>#strAppUser.UserOrgID#</cfoutput>";
        }
    }
}}
////////////////////////////////////////////////////////////////////////////////
</script>