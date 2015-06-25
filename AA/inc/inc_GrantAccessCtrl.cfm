<cfoutput>
<table border="1" cellspacing="3" cellpadding="3">
	<tr>
		<td>
			<a href="##" onClick="JavaScript: f_RemoveUsr(#usr_cd#);"><span class="c_fieldNameRed">Remove</span></a>
			<input type="hidden" name="h_UsrNm#usr_cd#" value="#usr_full_nm#">
		</td>
		<td>
			<cfif #usr_is_act# EQ "N" OR #usr_is_act# EQ "I">
				<!--- <span class="c_fieldNameYellow">On Hold</span> --->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<cfelse>
				<a href="##" onClick="f_putUsrOnHold(#usr_cd#)"><span class="c_fieldNameYellow">On Hold</span></a>
			</cfif>
		</td>
		<td>
			<cfif #usr_is_act# NEQ "A">
				<a href="##" onClick="f_ApprvUsr(#usr_cd#)"><span class="c_fieldNameGreen">Approve</span></a>
			<cfelse>
				<!--- <span class="c_fieldNameGreen">Approve</span> --->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</cfif>
		</td>
	</tr>
</table>
</cfoutput>


<script language="javascript" type="text/javascript">
function f_RemoveUsr(argUsrID)
{
	if ( confirm("Do you want to delete "+eval("self.document.forms[0].h_UsrNm"+argUsrID+".value")+" record from the system?") )
	{
		self.document.forms[0].h_GA_UsrID.value = argUsrID;
		of_CallFile("RemoveUsr");
	}
	
}
//
//----------------------------------------------------------------------------------------------------
function f_putUsrOnHold(argUsrID)//{with(self.document.forms[0]), argUsrNm
{
	if ( confirm("Do you want to set 'Inactive' status to "+eval("self.document.forms[0].h_UsrNm"+argUsrID+".value")+"?") )
	{//	alert("Line 90")
		self.document.forms[0].h_GA_UsrID.value = argUsrID;
		of_CallFile("putUsrOnHold");
	}
}
//
//-----------------------------------------------------------------------------------------------------
function f_ApprvUsr(argUsrID)
{
	if ( confirm("Do you want to allow "+eval("self.document.forms[0].h_UsrNm"+argUsrID+".value")+"to have an access to the system?") )
	{//	alert("Line 90")
		self.document.forms[0].h_GA_UsrID.value = argUsrID;
		of_CallFile("ApprvUsr");
	}
}
//
//-----------------------------------------------------------------------------------------------------
</script>
