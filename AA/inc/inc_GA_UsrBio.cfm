<cfoutput>
		<!--- NAME --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%"><span class="c_fieldName">Name:</span></td>
						<td>
							<select name="ddlb_GA_Usr_Prfx" class="forminputs"></select>
							&nbsp;&nbsp;
							<input class="forminputs" type="text" name="txt_GA_Usr_FName" value="#spr_getGA_Usr.usr_fname#"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
							&nbsp;&nbsp;
							<input class="forminputs" type="text" name="txt_GA_Usr_MI" value="#spr_getGA_Usr.usr_mi#" size="5"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
							&nbsp;&nbsp;
							<input class="forminputs" type="text" name="txt_GA_Usr_LName" value="#spr_getGA_Usr.usr_lname#"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!--- PHONE / EXTANTION --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%"><span class="c_fieldName">Phone / Ext:</span></td>
						<td>
							<input class="forminputs" type="text" name="txt_GA_Usr_Phone" value="#spr_getGA_Usr.usr_phone#" onKeyUp="f_IsNumber(this.value, this.name);"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
							&nbsp;&nbsp;
							<input class="forminputs" type="text" name="txt_GA_Usr_Ext" value="#spr_getGA_Usr.usr_ext#" size="5"  onKeyUp="f_IsNumber(this.value, this.name);"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!--- EMAIL --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%"><span class="c_fieldName">E-Mail:</span></td>
						<td>
							<input class="forminputs" type="text" name="txt_GA_Usr_Email" size="30" value="#spr_getGA_Usr.usr_email#" onKeyUp="f_IsNumber(this.value, this.name);"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
							
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!--- USER NAME / PASSWORD --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%"><span class="c_fieldName">LogIn Name / Password:</span></td>
						<td>
							<input class="forminputs" type="text" name="txt_GA_Usr_UserName" value="#spr_getGA_Usr.usr_uname#" onKeyUp="f_IsNumber(this.value, this.name);"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
							&nbsp;&nbsp;
							<input class="forminputs" type="password" name="txt_GA_Usr_Pass" value="#spr_getGA_Usr.usr_pass#" onKeyUp="f_IsNumber(this.value, this.name);"
								   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!--- STATUS --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%"><span class="c_fieldName">Status:</span></td>
						<td>
							<strong><span class="c_fieldValue">#spr_getGA_Usr.usr_status_nm#</span></strong>
						</td>
					</tr>
				</table>
			</td>
		</tr>
</cfoutput>