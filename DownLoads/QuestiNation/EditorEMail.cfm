<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html><head><title><cfoutput>#local.ModuleName#</cfoutput></title>
<!---
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllPrjsForEMail#" output="spr_AllPrjsForEMail">
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllUsersForEMail#" output="spr_AllUsersForEMail"> 
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_PartsStatForEMail#"output="spr_PartsStatForEMail">
--->
<cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">

<!--- <cfwddx action="WDDX2CFML" input="#client.sprWDDX_EmailMsg#" output="spr_EmailMsg"> --->

<cfstoredproc procedure="PACK_SELECT_ALL.sp_AllPrjsForEMail" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllPrjsForEMail" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllPrjsForEMail" resultset="1">
</cfstoredproc>
<cfstoredproc procedure="PACK_SELECT_ALL.sp_AllUsersForEMail" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_AllUsersForEMail" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_AllUsersForEMail" resultset="1">
</cfstoredproc>
<cfstoredproc procedure="PACK_SELECT_ALL.sp_selectPartsStatForEMail" datasource="#client.DSN#" returncode="No">
    <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_PartsStatForEMail" maxrows="-1" variable="IgnoreThis">
	<cfprocresult name="spr_PartsStatForEMail" resultset="1">
</cfstoredproc>

<script language="JavaScript">
//----------------------------------------------------------------------------//
var vValidForEMail;
//----------------------------------------------------------------------------//
<cfwddx action="CFML2JS" input="#spr_AllPrjsForEMail#" toplevelvariable="tlv_AllPrjsForEMail">

var rowsAllPrjsForEMail = tlv_AllPrjsForEMail.getRowCount();
//alert(rowsAllPrjsForEMail)
function holdAllPrjsForEMail(aPrjID, aPrjDescr, aOrgID)
{
    this.aPrjID    = aPrjID;
    this.aPrjDescr = aPrjDescr;
	this.aOrgID	   = aOrgID;
}
arrayAllPrjsForEMail = new Array();
for (var p=0; p<rowsAllPrjsForEMail; p++)
{
   arrayAllPrjsForEMail[p] = new holdAllPrjsForEMail(
                              tlv_AllPrjsForEMail.prjid[p],
                              tlv_AllPrjsForEMail.prjname[p],
							  tlv_AllPrjsForEMail.orgid[p]
							  );
}
//----------------------------------------------------------------------------//

<cfwddx action="CFML2JS" input="#spr_AllUsersForEMail#" toplevelvariable="tlv_AllUsersForEMail">
var rowsAllUsersForEMail = tlv_AllUsersForEMail.getRowCount();
function holdUsers( aUserID,    aUserFName,    
                    aUserLName, aUserEmail,
                    aUserOrgID) 
{
	this.aUserID      = aUserID;     this.aUserFName   = aUserFName;   
    this.aUserLName   = aUserLName;  this.aUserEmail    = aUserEmail; 
	this.aUserOrgID   = aUserOrgID;  
}
arrayAllUsersForEMail = new Array();
for (var u=0; u<rowsAllUsersForEMail; u++)
{
arrayAllUsersForEMail[u] = new holdUsers( 
								tlv_AllUsersForEMail.userid[u],    tlv_AllUsersForEMail.userfname[u],    
                                tlv_AllUsersForEMail.userlname[u], tlv_AllUsersForEMail.useremail[u], 
								tlv_AllUsersForEMail.userorgid[u]
                                );
}
//----------------------------------------------------------------------------//

<cfwddx action="CFML2JS" input="#spr_PartsStatForEMail#" toplevelvariable="tlv_PartsStatForEMail">

var rowsPartsStatForEMail = tlv_PartsStatForEMail.getRowCount();

function holdPartsStatForEMail(aPartID, aPrjID, aAnswrStat)
{
    this.aPartID    = aPartID;
    this.aPrjID     = aPrjID;
	this.aAnswrStat = aAnswrStat;
}
arrayPartsStatForEMail = new Array(holdAllPrjsForEMail.length);
for (var p=0; p<rowsPartsStatForEMail; p++)
{
   arrayPartsStatForEMail[p] = new holdPartsStatForEMail(
                              tlv_PartsStatForEMail.partid[p],
                              tlv_PartsStatForEMail.prjid[p],
							  tlv_PartsStatForEMail.answrstat[p]
							  );
}

//----------------------------------------------------------------------------//
function of_ChangePrj(argPrjID){with (self.document.forms[0]){
s_Parts.options.length = 0;
var i=0;
if (argPrjID != -1)	
{
	for (var p=0; p<rowsPartsStatForEMail; p++)
	{
		if (argPrjID == arrayPartsStatForEMail[p].aPrjID)
		{
			for (var u=0; u<rowsAllUsersForEMail; u++)
			{
				if (arrayPartsStatForEMail[p].aPartID == arrayAllUsersForEMail[u].aUserID)
				{
					optionParts = new Option;
					optionParts.value = arrayAllUsersForEMail[u].aUserID;
					optionParts.text  = arrayAllUsersForEMail[u].aUserLName+", "+arrayAllUsersForEMail[u].aUserFName+"    "+arrayPartsStatForEMail[p].aAnswrStat;
					s_Parts.options[i] = optionParts;
					i++;
				}
			}
		}
	}
}
else if (argPrjID == -1)
{
	rb_EmailType[0].checked = false;
	rb_EmailType[1].checked = false;
	optionParts = new Option;
	optionParts.value = -1;
	optionParts.text  = "== Select Project==";
	s_Parts.options[0] = optionParts;
}
}}

//----------------------------------------------------------------------------//

function of_InsUpdDelEmail(argProcess){with (self.document.forms[0]){
if (argProcess == "S" || argProcess == "D")
{
	if (rb_EmailType[1].checked == true)
	{
		alert("Illigal operation.  Request denied."+
			  "\nYou cannot save 'Already sent' message."+
			  "\nTo create and save a new Pre-defined message, click on button 'NewMsg'.");
	}
	
	else
	{
		if (txta_EMailMsg.value.length == 0 || txt_DefaultURL.value.length == 0)
		{
			alert("Illigal operation.  Request denied."+
				  "\nFields 'E-Mail message' and 'URL/Address' should contain information.");
			if (txta_EMailMsg.value.length == 0)
			{
				txta_EMailMsg.focus();
			}
			else
			{
				txt_DefaultURL.focus();
			}
		}
		else
		{
			rb_EmailType[0].checked = true;
			
			action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=InsUpdEmail&urlProcess="+argProcess;
			submit();
		}
	}
	
	
}

else if (argProcess == "N")
{
	reset(); 
	of_ChangePrj(-1);
	txta_EMailMsg.focus();
}
}}
//----------------------------------------------------------------------------//

function of_ValidForEMail(){with (self.document.forms[0]){
var vCounter=0;
vValidForEMail = 'YES';

	if (s_Parts.options[0].value == -1)
	{
		vValidForEMail = 'NO';
		alert("Illigal operation.  Request denied."+
			"\nProject is not selected.");
	}
	
	else if (txta_EMailMsg.value.length == 0 || txt_DefaultURL.value.length == 0)
	{
		vValidForEMail = 'NO';
		alert("Illigal operation.  Request denied."+
			  "\nFields 'E-Mail message' and 'URL/Address' should contain information.");
		if (txta_EMailMsg.value.length == 0)
		{
			txta_EMailMsg.focus();
		}
		else
		{
			txt_DefaultURL.focus();
		}
	}
	else if (s_Parts.options[0].value != -1)
	{
		
		for (var p=0; p<s_Parts.options.length; p++)
		{
			if (s_Parts.options[p].selected == true)
			{	
				vCounter += 1;
			}
		}
		if (vCounter == 0)
		{
			vValidForEMail = 'NO';
			alert("Illigal operation.  Request denied."+
			  "\nYou have to select Participants.");
		}
	}
}}
//------------------------------------------------------------------------------
function of_SendEMail(){with (self.document.forms[0]){
	if (vValidForEMail == 'YES')
	{
		var vPartEmail = "";
		var vPartName = "";
		var vEmailList = "";
		var vPartsNameList = "";
		var vPartID = "";
		var vPartNameForConfirm = "";
		var vPartNameListForConfirm = "";
	
		for (var p=0; p<s_Parts.options.length; p++)
		{
			if (s_Parts.options[p].selected)
			{
				vPartID = s_Parts.options[p].value;
				for (var u=0; u<rowsAllUsersForEMail; u++)
				{
					if (arrayAllUsersForEMail[u].aUserID == vPartID)
					{
						vPartEmail = arrayAllUsersForEMail[u].aUserEmail+"; ";
						vPartName = arrayAllUsersForEMail[u].aUserLName+", "+arrayAllUsersForEMail[u].aUserFName+"\n";
						vPartNameForConfirm = arrayAllUsersForEMail[u].aUserLName+", "+arrayAllUsersForEMail[u].aUserFName+"   "+arrayAllUsersForEMail[u].aUserEmail+"\n;";
						//alert(vPartNameForConfirm)
						break;
					}
				}
				
				vEmailList += vPartEmail;
				vPartsNameList += vPartName;
				vPartNameListForConfirm += vPartNameForConfirm;
				
			}
		}
		
		if (confirm("E-Mail will be sent to the folowing people:\n"+vPartsNameList))
	    {
			h_To.value = vEmailList;
			h_From.value = "<cfoutput>#strAppUser.UserEmail#</cfoutput>";
			h_PrjName.value = s_Prjs.options[s_Prjs.options.selectedIndex].text;
			h_PartsNameList.value = vPartsNameList;
			h_PartNameListForConfirm.value = vPartNameListForConfirm;
			
			rb_EmailType[1].checked = true;
			action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=SendEMail";
	        submit();
	    }
	}
}}
//----------------------------------------------------------------------------//

function of_OpenEMails(){with (self.document.forms[0]){

for (var e=0; e<elements.length; e++)
{
	if (elements[e].type == "radio")
	{
		if (elements[e].checked == true)
		{
			vMsgID = elements[e].value;
			
			if (vMsgID == "Already sent")
			{
				vPrjID = s_Prjs.options[s_Prjs.options.selectedIndex].value;
				if (vPrjID == -1)
				{
					elements[e].checked = false;
					alert("Illigal operation.  Request denied."+
						  "\nProject must be selected.");
				}
				else
				{
				//alert(vPrjID)
					var popupPage = "popupCustomEMails.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlPrjID="+vPrjID;
	
					var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=600,height=400','yes');
					if ((document.window != null) && (!popupWin.opener))
				    {
						popupWin.opener = document.window;
				    }
				}
			}
			else if (vMsgID == "Pre-defined")
			{
				vPrjID = 0;
				
				var popupPage = "popupCustomEMails.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlPrjID="+vPrjID;
	
				var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=600,height=400','yes');
				if ((document.window != null) && (!popupWin.opener))
			    {
					popupWin.opener = document.window;
			    }
			}
		}
	}
}
}}
//----------------------------------------------------------------------------//
</script>

</head>
<body>
<form name="f_EMail" method="post">

<input type="Hidden" name="h_To">
<input type="Hidden" name="h_From">
<input type="Hidden" name="h_PrjName">
<input type="Hidden" name="h_PartsNameList">
<input type="Hidden" name="h_PartNameListForConfirm">

<table align="center" width="80%" cellspacing="2" cellpadding="2" border="0">
<tr>
<!--- \/\/ Portion for Projects and Participants \/\/ --->
	<td width="50%">
	<table border="0">
	<!--- \/ Portion for Projects \/ --->
	<tr><td class="Brown9">List of all <strong>ASSIGNED CURRENT ACTIVE</strong> Projects</td></tr>
	<tr>
		<td>
			<select name="s_Prjs" size="5" onchange="of_ChangePrj(this.options[selectedIndex].value)">
				<option value="-1" selected>=== Select Project ===</option>
				<cfoutput query="spr_AllPrjsForEMail">
				<option value="#PrjID#">#PrjName#</option>
				</cfoutput>	
			</select>
		</td>
	</tr>
	<!--- /\ Portion for Projects /\ --->
	<!--- \/ Portion for Participants \/ --->
	<tr><td>&nbsp;</td></tr>
	<tr><td class="Brown9">List of users assigned to the Project</td></tr>
	<tr>
		<td>
			<select name="s_Parts" multiple size="8">
				<option></option>
			</select>
			
		</td>
	</tr>
	<!--- /\ Portion for Participants /\ --->
	</table>
	</td>
<!--- /\/\ Portion for Projects and Participants /\/\ --->
<!--- \/\/ Portion for E-Mail controls \/\/ --->
	<td width="50%">
		<table border="0">
		<tr>
			<td class="Brown9">
				E-Mail:&nbsp;
				<input type="Radio" name="rb_EmailType" value="Pre-defined"  onClick="of_OpenEMails();" >
				<font color="#A52A2A">Pre-defined</font>
				&nbsp;&nbsp;&nbsp;
				<input type="Radio" name="rb_EmailType" value="Already sent" onClick="of_OpenEMails();">
				<font color="#A52A2A">Already sent</font>
			</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td class="Brown9">
<input type="Hidden" name="h_MsgID" value="0">
				E-Mail message:<br>
<textarea name="txta_EMailMsg" rows="8" cols="40" onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
</textarea>
			</td>
		</tr>
		<tr>
			<td class="Brown9">
				<table width="100%" border="0">
				<tr>
					<td width="50%" class="Brown9" colspan="3">
						URL/Address:<input size="40" type="Text" name="txt_DefaultURL" onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
				<tr>
					<td class="Brown8" align="left" colspan="3">
						To 'save' and 'delete' Pre-defined messages and URL address:
					</td>
					
				</tr>
				<tr align="center">
					<td align="right" valign="middle">
						<cfinclude template="cb_SaveEMail.cfm">
					</td>
					<td align="right" valign="middle">
						<cfinclude template="cb_DeleteEMail.cfm">
					</td>
					<td align="right" valign="middle">
						<cfinclude template="cb_NewMsg.cfm">
					</td>
				</tr>
				<tr>
					<td align="left" colspan="3">
						<hr color="#A52A2A" size="1">
					</td>
					
				</tr>
				</table>
			</td>
		</tr>
		</table>
	</td>
<!--- \/\/ Portion for E-Mail controls \/\/ --->
</tr>
</table>

<!--- ************** Buttons ********************************************** --->
<table align="center" width="70%" cellspacing="2" cellpadding="2" border="0">
<tr>
    <td align="right">
        <table cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_Menu.cfm"></td>
			<td><cfinclude template="cb_ResetEMail.cfm"></td>
			<td><cfinclude template="cb_EMail.cfm"></td>
        </tr>
        </table>
    </td>
</tr>
</table>
<!--- ************** Buttons ********************************************** --->

</form>
</body>
</html>
<script language="JavaScript">
of_ChangePrj(-1);
//of_chngEMailType("Pre-defined");
</script>