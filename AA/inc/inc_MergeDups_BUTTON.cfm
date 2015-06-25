<!--- inc_MergeDups_BUTTON.cfm --->
<table align="right" width="300px"  border="0" cellspacing="2" cellpadding="2" style="border-bottom:1px solid Gray; ">
		<tr>
			<td align="left" width="80%"><!--- colspan="<cfoutput>#local.NumOfColumns+1#</cfoutput>" --->
				<input	type="button" 
						alt="CB Merge" 
						class="c_formbuttons" 
						name="cb_Merge" 
						value="&nbsp;&nbsp;Merge&nbsp;&nbsp;" 
						onClick="f_Validate();">
			</td>
			<td>&nbsp;&nbsp;</td>
			<td>
				<input type="button" name="cb_BackToPgmCompare" value="Back To Program Comparison" class="c_formbuttons" onClick="JavaScript:history.go(-1);">
			</td>
		</tr>
</table>

						   