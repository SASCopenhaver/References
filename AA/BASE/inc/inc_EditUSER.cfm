<!--- inc_EditUSER.cfm --->
<br>
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getEditUser#" output="spr_getEditUser">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getRoles#" output="spr_getRoles">
<script language="javascript" type="text/javascript">
//-----------------------------------------------------------------------------------------------------------------------------------
// Users:
<cfwddx action="CFML2JS" input="#spr_getEditUser#" toplevelvariable="tlv_U">
var rowsU = tlv_U.getRowCount();
//usr_id, usr_prx, usr_fname, usr_mi, usr_lname, usr_sfx, usr_full_nm, usr_is_act, usr_uname, usr_pass, usr_role 
function arrayU ( ausr_id, ausr_prx, ausr_fname, ausr_mi, ausr_lname, ausr_sfx, ausr_full_nm, ausr_is_act, ausr_uname, ausr_pass, ausr_role )
{
	this.ausr_id = ausr_id;			this.ausr_prx = ausr_prx;		this.ausr_fname = ausr_fname;
	this.ausr_mi = ausr_mi;			this.ausr_lname = ausr_lname;	this.ausr_sfx = ausr_sfx;
	this.ausr_full_nm = ausr_full_nm; this.ausr_is_act = ausr_is_act; this.ausr_uname = ausr_uname;
	this.ausr_pass = ausr_pass;		this.ausr_role = ausr_role;
}
orgBfrU = new Array();
for (var u=0; u<rowsU; u++)
{
	orgBfrU[u] = new arrayU (tlv_U.usr_id[u],	tlv_U.usr_prx[u],	tlv_U.usr_fname[u], 
							 tlv_U.usr_mi[u],  tlv_U.usr_lname[u], tlv_U.usr_sfx[u], 
							 tlv_U.usr_full_nm[u], tlv_U.usr_is_act[u], tlv_U.usr_uname[u], 
							 tlv_U.usr_pass[u], tlv_U.usr_role[u]  );
}
//-----------------------------------------------------------------------------------------------------------------------------------
// Roles:
//r_id , r_nm, r_desc 
<cfwddx action="CFML2JS" input="#spr_getRoles#" toplevelvariable="tlv_R">
var rowsR = tlv_R.getRowCount();
function arrayR (ar_id , ar_nm, ar_desc )
{
	this.ar_id = ar_id; this.ar_nm = ar_nm; this.ar_desc = ar_desc;
}
orgBfrR = new Array();
for ( var r=0; r<rowsR; r++ )
{
	orgBfrR[r] = new arrauR (tlv_R.r_id[r] , tlv_R.r_nm[r], tlv_R.r_desc[r] );
}
</script>
<div class="story">
<cfset local.ddlb_UsersSize = #spr_getEditUser.recordCount#+1>
<table align="center" width="100%"  border="1" cellspacing="1" cellpadding="1">
  <tr align="center" valign="top">
    <td width="30%">
		<select name="ddlb_Users" size="<cfoutput>#local.ddlb_UsersSize#</cfoutput>"></select>
	</td>
    <td width="70%">
		<!--- -------------------------------------------------------------------------------------------------------- --->
		<table width="100%"  border="0" cellspacing="1" cellpadding="1">
			<tr align="right">
				<th scope="row" width="20%">Prefix</th>
				<td align="left">&nbsp;&nbsp;<select name="ddlb_Prefix">
						<option value="-1">=== Select Prefix ===</option>
						<option value="Mr.">Mr.</option>
						<option value="Mr.">Mrs.</option>
						<option value="Mr.">Miss.</option>
						<option value="Mr.">Dr.</option>
					</select>
				</td>
			</tr>
			<tr align="right">
				<th scope="row">First Name</th>
				<td align="left">&nbsp;&nbsp;<input name="txt_FName" value=""></td>
			</tr>
			<tr align="right">
				<th scope="row">Middle Initial</th>
				<td align="left">&nbsp;&nbsp;<input name="txt_MI" value=""></td>
			</tr>
			<tr align="right">
				<th scope="row">Last Name</th>
				<td align="left">&nbsp;&nbsp;<input name="txt_LName" value=""></td>
			</tr>
			<tr align="right">
				<th scope="row">Suffix</th>
				<td align="left">&nbsp;&nbsp;<input name="txt_Sfx" value=""></td>
			</tr>
			<tr align="right">
				<th scope="row">Is Active?</th>
				<td align="left">&nbsp;&nbsp;Yes<input type="radio" name="rb_IsAct">&nbsp;&nbsp;No<input type="radio" name="rb_IsAct"></td>
			</tr>
			
			
			<tr align="right">
				<th scope="row">User Name</th>
				<td>&nbsp;&nbsp;</td>
			</tr>
			<tr align="right">
				<th scope="row">Password</th>
				<td>&nbsp;&nbsp;</td>
			</tr>
			<tr align="right">
				<th scope="row">Role</th>
				<td>&nbsp;&nbsp;</td>
			</tr>
			<tr align="right">
				<th scope="row">&nbsp;</th>
				<td align="center"><a href="#" class="capsule">Update</a></td>
			</tr>
			<tr align="right">
				<th scope="row">&nbsp;</th>
				<td align="center"><a href="#" class="capsule">Delete</a></td>
			</tr>
		</table>

		<!--- -------------------------------------------------------------------------------------------------------- --->
	</td>
  </tr>
</table>
</div>
<br>
<br>
<script language="javascript" type="text/javascript">
of_populateSelect( "ddlb_Users", "-1", "=== Create New User ===", rowsU, "orgBfrU", "ausr_id", "ausr_full_nm", "2D" );
</script>