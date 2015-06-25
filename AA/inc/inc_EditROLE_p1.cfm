<!--- inc_EditROLE.cfm --->
<input type="hidden" value="" name="h_app_role_id">
<cfset local.RowColor = "FFFFFF">
<div class="story">
<table border="0" cellpadding="2" cellspacing="3" width="100%">
	<tr class="c_fieldName" align="center">
		<!--- <td bgcolor="#CCCCCC" >Role Code</td> --->
		<td bgcolor="#CCCCCC" >Role Name</td>
		<td bgcolor="#CCCCCC" >Role Description</td>
		<td bgcolor="#CCCCCC" >Authorizing Agent Role</td>
		<td bgcolor="#CCCCCC" >Actions</td>
	</tr>
	<cfloop query="spr_getAppRoles" startrow="1" endrow="#spr_getAppRoles.recordCount#">
	<cfoutput>
	<tr class="c_fieldValue" bgcolor="#local.RowColor#">
		<!--- <td>#app_role_cd#</td> --->
		<td>#app_role_nm#</td>
		<td>#app_role_desc#</td>
		<td>#app_role_super_nm#</td>
		<td align="center"><a href="##" onClick="JavaScript: f_Action('EDIT_ROLE', '#app_role_id#', '#app_role_nm#');">Edit</a> / <a href="##"  onClick="JavaScript: f_Action('DELETE_ROLE', '#app_role_id#', '#app_role_nm#');">Delete</a></td>
	</tr>
	</cfoutput>
	<!--- ------------------------- --->
	<cfif #local.RowColor# EQ "E2E6E7">
		<cfset local.RowColor = "FFFFFF">
	<cfelse>
		<cfset local.RowColor = "E2E6E7">
	</cfif>
	<!--- ------------------------- --->
	</cfloop>
	<tr><td colspan="4"><hr></td></tr>
	<tr class="c_fieldName">
		<td colspan="3">&nbsp;</td>
		<td bgcolor="#CCCCCC"  align="center"><a href="##" onClick="JavaScript: f_Action('ADD_NEW_ROLE', '0', '');">Add New Role</a></td>
	</tr>
	<!--- 
	<tr class="c_fieldName">
		<td colspan="4">&nbsp;</td>
		<td bgcolor="#CCCCCC"  align="center"><a href="##" onClick="JavaScript: f_Action('APP_ACCESS', '0', '');">System  Access</a></td>
	</tr>
	 --->
</table>
</div>
<script language="javascript" type="text/javascript">

function f_Action(argAction, argRoleID, argRoleNm){with(self.document.forms[0]){//
	//alert(argAction)
	switch (argAction)
	{
		//---------------------------------------------------
		case "EDIT_ROLE":
			if ( confirm("Do you want to edit User Role '"+argRoleNm+"'?") )
			{
				h_app_role_id.value = argRoleID;
				of_CallFile(argAction);
				
			}
		break;
		//---------------------------------------------------
		case "DELETE_ROLE":
			if ( confirm("Do you want to delete User Role '"+argRoleNm+"'?") )
			{
				h_app_role_id.value = argRoleID;
				of_CallFile(argAction);
				
			}
		break;
		
		//---------------------------------------------------
		case "ADD_NEW_ROLE":
			if ( confirm("Do you want to create a new User Role?") )
			{
				h_app_role_id.value = argRoleID;
				of_CallFile(argAction);
				
			}
		break;
		//---------------------------------------------------
	}
	
}}
</script>