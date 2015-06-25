<!--- inc_MergeDuplicates_p1.cfm --->
<div class="feature">
<table width="50%"  border="0" cellspacing="2" cellpadding="2" align="center">
  <tr align="left">
    	<th scope="col" colspan="3" class="c_fieldName" height="30px" valign="middle">CRITERIA TO FIND ALUMNI DUPLICATES</th>
  </tr>
  <tr>
    	<td width="3%">&nbsp;</td>
   		<td align="right" width="30%" class="c_fieldName">First Name:</td>
    	<td>
				<input class="forminputs" type="text" name="txt_Usr_FName" value="" size="50"
					   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
		</td>
  </tr>
  <tr>
   		<td width="3%">&nbsp;</td>
    	<td align="right" width="30%" class="c_fieldName">Middle Name or Initial:</td>
    	<td>
				<input class="forminputs" type="text" name="txt_Usr_MI" value="" size="5"
					   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
		</td>
  </tr>
  <tr>
    	<td width="3%">&nbsp;</td>
    	<td align="right" width="30%" class="c_fieldName">Last Name:</td>
    	<td>
				<input class="forminputs" type="text" name="txt_Usr_LName" value="" size="50"
					   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
		</td>
  </tr>
  <tr>
    	<td width="3%">&nbsp;</td>
    	<td align="right" width="30%" class="c_fieldName">Country From:</td>
    	<td>
			<select name="ddlbm_CS_From_Cntry" class="forminputs" size="5" 
							multiple 
							onChange="JavaScript: of_ruleInMultSelectCntrl(this.name); f_showSelection();" 
							onBlur="f_AnyChanges('YES');"> 
						<option value="-1">=== All Countries ===</option>
						<cfloop query="spr_getCntryFrom" startrow="1" endrow="#spr_getCntryFrom.recordCount#">
						<cfoutput>
						<option value="#spr_getCntryFrom.pgm_from_cntry_cd#">#spr_getCntryFrom.cntry_name#</option>
						</cfoutput>
						</cfloop>
					</select>
		</td>
  </tr>
</table>




</div>
