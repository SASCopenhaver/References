<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfset local.PrjID = #URL.urlPrjID#>
<!--- <cfoutput>##</cfoutput> --->
<html>
<head>
<title></title>

<script language="JavaScript" src="JS/wddx.js"></script>

<cfstoredproc procedure="PACK_SELECT_ALL.sp_EMailMsg" datasource="#client.DSN#" returncode="No">
  <cfprocparam type="In" cfsqltype="CF_SQL_VARCHAR" variable="varPrjIDs"  value="#local.PrjID#"  null="No">
  <cfprocparam type="Out" cfsqltype="CF_SQL_REFCURSOR" dbvarname="rc_EMailMsg" maxrows="-1" variable="IgnoreThis">
  <cfprocresult name="spr_EMailMsg" resultset="1">
</cfstoredproc>
<cfset local.NumOfRecords = #spr_EMailMsg.recordcount#>

<script language="JavaScript">

<cfwddx action="CFML2JS" input="#spr_EMailMsg#" toplevelvariable="tlv_EMailMsg">
var rowsEMailMsg = tlv_EMailMsg.getRowCount();
//alert(rowsEMailMsg)
function holdEMailMsg(aMsgID, aPrjID, aMsg, aURL_Addr, aAdminID)
{
    this.aMsgID = aMsgID;
	this.aPrjID = aPrjID;
    this.aMsg   = aMsg;
	this.aURL_Addr = aURL_Addr;
	this.aAdminID  = aAdminID;
}
arrayEMailMsg = new Array();

for (var m=0; m<rowsEMailMsg; m++)
{
 
   arrayEMailMsg[m] = new holdEMailMsg(
                               tlv_EMailMsg.msgid[m]
							  ,tlv_EMailMsg.prjid[m]
                              ,tlv_EMailMsg.msg[m]
							  ,tlv_EMailMsg.url_addr[m]
							  ,tlv_EMailMsg.adminid[m]
							  );

}
//------------------------------------------------------------------------------

function of_CloseWin()
{
	
	window.close();
}
//------------------------------------------------------------------------------

function of_Print()
{
	window.print();
}
//------------------------------------------------------------------------------

function of_Paste(){with (self.document.forms[0]){

var vMsgID = 0;
	for (var e=0; e<elements.length; e++ )
	{
		
		if (elements[e].type == "radio")
		{
			if (elements[e].checked == true)
			{
				vMsgID = elements[e].value;
				//alert(vMsgID)
				
				for (var m=0; m<rowsEMailMsg; m++)
				{
				//alert(rowsEMailMsg)
					if (vMsgID == arrayEMailMsg[m].aMsgID)
					{
					//alert(vMsgID)
						window.opener.f_EMail.txta_EMailMsg.value = "";
						window.opener.f_EMail.txta_EMailMsg.value = arrayEMailMsg[m].aMsg;
						
						window.opener.f_EMail.txt_DefaultURL.value = "";
						window.opener.f_EMail.txt_DefaultURL.value = arrayEMailMsg[m].aURL_Addr;
						
						window.opener.f_EMail.h_MsgID.value = arrayEMailMsg[m].aMsgID;
						//alert(vMsgID)
						break;
					}
					
				}
				
				
			}
		}
	}
	window.opener.f_EMail.rb_EmailType[0].checked = false;
	window.opener.f_EMail.rb_EmailType[1].checked = false;
	of_CloseWin();
}}

//------------------------------------------------------------------------------
</script>
<body>
<form name="f_EMasg" method="post">
<table>
<cfif #local.NumOfRecords# NEQ "0">
<tr>
	<td align="left">
	<input type="Button" value="Print" onclick="of_Print();">
	&nbsp;&nbsp;&nbsp;
	<input type="Button" value="Close" onclick="of_CloseWin();">
	&nbsp;&nbsp;&nbsp;
	<input type="Button" value="Paste" onclick="of_Paste();">
	
	</td>
</tr>
</cfif>
<cfif local.NumOfRecords EQ 0>
<tr>
	<td>
		<cfif #local.PrjID# EQ "0">
			<font class="Teal10">There is no 'Pre-defined' messages.</font>
		<cfelse>
			<font class="Teal10">There is no 'Already sent' messages.</font>
		</cfif>
	</td>
</tr>
<cfelse>
<cfoutput query="spr_EMailMsg">
<tr class="Brown9">
	<td>
		<table border="0">
			<tr>
				<td><input type="Radio" name="rb_Msg#MsgID#" value="#MsgID#"></td>
				<td>
					<font size="-2" color="Teal"><strong>Message Type:</strong></font>&nbsp;
					<cfif #PrjID# EQ "0">
						<font size="-2" color="##A52A2A">Pre-defined;</font>
					<cfelse>
						<font size="-2" color="##A52A2A">Already sent;</font>
					</cfif>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<font size="-2" color="Teal"><strong>Message:</strong></font>&nbsp;
					<font size="-2" color="##A52A2A">#Msg#</font>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<font size="-2" color="Teal"><strong>URL/Address:</strong></font>&nbsp;
					<font size="-2" color="##A52A2A">#URL_Addr#</font>
				</td>
			</tr>
			</table>
		<hr width="70%" color="Teal" size="1">
	</td>
</tr>
</cfoutput>
</cfif>
<tr>
	<td align="left">
	<input type="Button" value="Print" onclick="of_Print();">
	&nbsp;&nbsp;&nbsp;
	<input type="Button" value="Close" onclick="of_CloseWin();">
	<cfif #local.NumOfRecords# NEQ "0">
	&nbsp;&nbsp;&nbsp;
	<input type="Button" value="Paste" onclick="of_Paste();">
	</cfif>
	</td>
</tr>
</table>
</form>
</body>
</html>
