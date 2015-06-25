<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script language="JavaScript" src="JS/wddx.js"></script>
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllOrgs#" output="spr_AllOrgs">
<!--- <cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllUsers#" output="spr_AllUsers">  --->
 <cfstoredproc procedure="questination.PACK_SELECT_ALL.sp_AllUsers" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllUsers" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllUsers" resultset="1">
</cfstoredproc>

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
//==============================================================================
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
//==============================================================================
<cfwddx action="CFML2JS" input="#spr_AllUsers#" toplevelvariable="tlv_AllUsers">
var rowsAllUsers= tlv_AllUsers.getRowCount();
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
//==============================================================================
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
        optionOrgs.text  = "Administrators";
        s_Orgs.options[rowNum] = optionOrgs;
       
    }
}
//==============================================================================
function changeUsers(argOrgID){with (self.document.forms[0]){
//alert(argOrgID)
s_Users.options.length = 0;
optionUsers = new Option;
//of_InitialValue ("s_Users", -1, "== Select User ==", 0);
optionUsers.value = "-1";
optionUsers.text  = "== Select User ==";
s_Users.options[0] = optionUsers;
if (argOrgID != -1)
{
    var su=1;//su - SELECTED USERS
    for (var u=0; u<rowsAllUsers; u++)
    {
        if (arrayAllUsers[u].aUserOrgID == argOrgID && arrayAllUsers[u].aUserActInact == "A" )
        {
            optionUsers = new Option;
            optionUsers.value = arrayAllUsers[u].aUserID;
            optionUsers.text  = arrayAllUsers[u].aUserLName+", "+arrayAllUsers[u].aUserFName;
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
//==============================================================================
function  authenticateUser(){with (self.document.forms[0]){
if (vValidationPassed == "YES")
{
    for (var su=0; su<arraySUsers.length; su++)
    {
        if (arraySUsers[su].aUserID == s_Users.options[s_Users.options.selectedIndex].value)
        {
            if (arraySUsers[su].aUserPass != txt_Pass.value)
            {
                alert("Sorry, you were not authenticated by the system.\nGiven combination of Organization, Name and Password is illegal.");
                txt_Pass.focus();
                txt_Pass.select();
                break;
            }
            else
            {
                h_UserID.value = arraySUsers[su].aUserID;
                h_UserFName.value = arraySUsers[su].aUserFName;
                h_UserLName.value = arraySUsers[su].aUserLName;
                h_UserPass.value = arraySUsers[su].aUserPass;
                h_UserEmail.value = arraySUsers[su].aUserEmail;
                h_UserActInact.value = arraySUsers[su].aUserActInact;
                h_UserOrgID.value = arraySUsers[su].aUserOrgID;
               
                of_Submit();
            }
        }
    }
}   
}}
//==============================================================================
function of_Submit(){with (self.document.forms[0]){
    action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=UserIsAuthenticated"
    submit();
}}
//==============================================================================
function of_OnKeyDown()
{
	var vKeyCode = window.event.keyCode;
	if (vKeyCode == 13)// 13 means Key "Enter" was clicked
	{
		of_Validate(); 
		authenticateUser();
		return false;
	}
}

//==============================================================================
</script>
<head>
	<title><cfoutput>#local.ModuleName#</cfoutput></title>
</head>
<body>
<cfinclude template="Instructions.cfm">
<hr width="70%" color="#A52A2A" size="1">
<!--- <cfloop index="i" from="1" to="1" step="1"><br></cfloop> --->
<form method="post" onkeydown="javascript: return of_OnKeyDown();">

<input type="Hidden" name="h_UserID"       value="0">
<input type="Hidden" name="h_UserFName"    value="FName">
<input type="Hidden" name="h_UserLName"    value="LName">
<input type="Hidden" name="h_UserPass"     value="Pass">
<input type="Hidden" name="h_UserEmail"    value="Email">
<input type="Hidden" name="h_UserActInact" value="A">
<input type="Hidden" name="h_UserOrgID"    value="0">

<table align="center" width="70%" cellspacing="2" cellpadding="2" border="0">
<tr>
    <td width="40%" class="Brown9">1. Select Organization you belong to:</td>
    <td width="60%"><select name="s_Orgs" onchange="changeUsers(this.options[selectedIndex].value)">
                        <option></option>
                    </select>
    </td>
</tr>
<tr>
    <td class="Brown9">2. Select your name:&nbsp;<font size="+1" color="#FF0000"><strong>&curren;</strong></td>
    <td><select name="s_Users"><option></option></select></td>
</tr>
<tr>
    <td class="Brown9">3. Type in a password:</td>
    <td><input type="Password" name="txt_Pass" value="password" maxlength="10"
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);"
        onfocus="javascript: this.select();">
    </td>
</tr>
<tr>
    <td class="Brown9">4.  And ...</td>
    <td align="left"><cfinclude template="cb_Continue.cfm"></td>
</tr>
<tr>
    <td class="Brown9"><font size="+1" color="#FF0000"><strong>&curren;</strong></font>
		&shy;If your name is not in the list, click on the link:</td>
    <td><cfoutput>
        <a href="AppFlow.cfm?#client.URLTOKEN#&urlCase=Create Personal Profile">
        </cfoutput>
        <font class="Brown9"><em>Create new Participant</em></font>
    </td>
</tr>
</table>
</form>
<cfloop index="i" from="1" to="1" step="1"><br></cfloop>
</body>
<script language="JavaScript">
of_InitialValue ("s_Orgs", -1, "== Select Organization ==", 0);
populateOrgs(1);
of_InitialValue ("s_Users", -1, "== Select User ==", 0);
</script>