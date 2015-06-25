<!--- 
<script language="JavaScript">
function of_OnKeyDown()
{
	alert(window.event.keyCode)
}

</script>
 --->
<table align="center" cellspacing="2" cellpadding="2"><!---  border="1"  --->
<tr>
    <td width="30%">
		<table cellspacing="2" cellpadding="2"  ><!--- border="1" --->
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="errorMsg">
					<cfif isDefined("client.Temp")>
						<cfoutput>#client.Temp#</cfoutput>
						<cfset temp = DeleteClientVariable("Temp")>
					<cfelse>
						&nbsp;
					</cfif>
				</td>
			</tr>
			<tr>
			    <td><input class="textBox" type="Text" name="UserID" value="usia" onfocus="this.value='';" title="Type-in User Name"></td>
			</tr><!--- Your Login Name ... --->
			<tr>
			    <td><input class="textBox" type="Password" name="UserPass" value="usia" onfocus="this.value='';" title="Type-in Password"></td>
			</tr><!--- password --->
			<tr>
			    <td align="right"><input type="Button" class="" name="cb_Go" value="GO" title="Proceed" onclick="of_Submit('Authentication');"></td>
			</tr><!--- of_Validate();  --->
		</table>
	</td>
    
	<td width="10%">&nbsp;</td>
    
	<td width="60%">
	<br>
	<div class="illustration1">
	<img src="Img/PicOfHand.jpg" width="141" height="128" alt="" border="0">
	<!--- <img src="Img/181.jpg" width="141" height="128" alt="" border="0"> --->
	
	</div>
	<span class="textTitle">The Program Agency Evaluation Checklist</span>
	<br>
	<span class="textPlain">
	 contains a set of criteria on which to gauge the performance of a program agency on any given project.  It is designed to be filled out by the ECA/PE/V program officer after a project has concluded.  The checklist asks the program officer to evaluate how well each element was handled in that particular project by filling in one of seven ratings.  The data collected from these individual ratings is not intended as a "report card" on each and every project but rather as a data collection tool to be used with input from other projects in the aggregate to spot trends in the performance of individual program agencies, taking note of problem areas, but also of strong points in the organization's overall performance.
	<!--- Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. --->
	</span>
	</td>
</tr>
</table>

