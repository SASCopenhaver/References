<!--- 
<cfif isDefined("client.strWDDXUser")>
	<cfwddx action="WDDX2CFML" input="#client.strWDDXUser#" output="strUser">
</cfif>

<script language="JavaScript">
alert("Header.cfm   "+"<cfoutput>#strUser.UserFullName#</cfoutput>")
</script>
 --->
 
<table align="center" cellspacing="2" cellpadding="2" border="0">
<tr>
	<td>&nbsp;</td>
	<!--- <td id="tdAppName"><img src="Img/AppLogo.jpg" width="760" height="38" alt="CheckList" border="0" title="CheckList"></td> --->
	
	<td id="tdAppName"><img src="Img/AppLogo.jpg" width="760" height="93" alt="" border="0"  title="CheckList"></td>
	
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
    <td width="760"  bgcolor="#F3E8CC">
		<!--- ------------------------------------------------------------- --->
		<table align="center" cellspacing="2" cellpadding="2" border="0">
		<tr class="trMenu">
		    <td width="253" align="left">
				<!--- <cfif client.FileToGoTo NEQ "LogIn.cfm"> --->
					<cfoutput>#strUser.UserFullName#</cfoutput>
				<!--- </cfif> --->
			</td>
		    <td width="254" align="left">
				<!--- <cfif client.FileToGoTo NEQ "LogIn.cfm"> --->
					<cfoutput>#strUser.UserOfficeName#</cfoutput>
				<!--- </cfif> --->
			</td>
		    <td width="253" align="right"><cfoutput>#DateFormat(Now(), "dddd, mmmm dd, yyyy")#</cfoutput></td>
		</tr>
		</table>
		<!--- ------------------------------------------------------------- --->
	</td>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>&nbsp;</td>
    <td align="left" class="tdMenu" width="760"  bgcolor="#F3E8CC">
	<!--- ----------------------------------------------------------------- --->
		<table align="center" cellspacing="2" cellpadding="2" border="0">
			<tr class="trMenu">
			    <td width="200" align="left"><cfoutput><strong>#client.ModuleName#</strong></cfoutput></td>
			    <!--- <td width="254">&nbsp;</td> --->
			    <td  align="right"><!--- width="253" --->
					<cfswitch expression=#strUser.SecurityUserRole#>
					<cfcase value="SA">
						<cfinclude template="menuLevel_1.cfm">
					</cfcase>
					<!--- ************************************************* --->
					<cfcase value="DC">
						<cfinclude template="menuLevel_2.cfm">
					</cfcase>
					<!--- ************************************************* --->
					<cfcase value="BC">
						<cfinclude template="menuLevel_3.cfm">
					</cfcase>
					<!--- ************************************************* --->
					<cfcase value="PO">
						<cfinclude template="menuLevel_4.cfm">
					</cfcase>
					</cfswitch>
					|&nbsp;&nbsp;<a href="javascript: self.close();">Close</a>&nbsp;
				</td>
			</tr>
		</table>
	<!--- ----------------------------------------------------------------- --->
	</td>
	<td>&nbsp;</td>
</tr>
</table>