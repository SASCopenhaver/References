<script language="JavaScript">
function of_ExpandOrColapse(argObjID, argOpener)
{
	if (argObjID.style.display == 'none')
	{
		// Show text
		argObjID.style.display = '';
		//alert(test.innerHTML)
		argOpener.innerHTML = 'Close';
	}
	else
	{
		// Hide text
		argObjID.style.display = 'none';
		argOpener.innerHTML = 'Open';
	}
}
</script>

<table align="left" cellspacing="2" cellpadding="2" border="0" class="Teal8" width="350">
<tr>
    <td valign="middle">
	<!--- Button --->
	<table>
		<tr>
			<td><font class="Teal8">Click to <strong><span id="idOpener">Open</span></strong> Instructions</font></td>
			<td align="center">
				<a href="javascript: of_ExpandOrColapse(instr, idOpener);"
				   onMouseDown="return imgDownI('imgi');"
			       onMouseOver="return imgOverI('imgi');"
			       onMouseOut="return imgOutI ('imgi');">
				   <img src="Img/cb_Instruction_I.JPG" 
					  name="imgi" 
					  width="30" 
					  height="33" 
					  border="0" 
					  alt="Instruction. Click on picture" 
					  title="Instruction. Click on picture"></a>
			</td>
			
		</tr>
	</table>
	<!--- Button --->
	</td> 
</tr>
<tr id="instr" style="display = 'none';">
    <td>
		This questionnaire is designed to help you to determine the norms that are operating in your 
	organization.  The questionnaire asks you to assess what the reaction of most persons in your
	organization would be if another person said a particular thing or behaved in a particular manner.
	<br>
	For example, the first item reads:
	"If an employee in your organization were to criticize the Organization and the people in it... 
	Most other employees would..."
	To complete this statement, choose one of the following five alternatives:
	<p>

	<strong>A.</strong> Strongly agree with or encourage it.
	<br>
	<strong>B.</strong> Agree with or encourage it.
	<br>
	<strong>C.</strong> Consider it not important.
	<br>
	<strong>D.</strong> Disagree with or discourage it.
	<br>
	<strong>E.</strong> Strongly disagree with or discourage it.
	<p>

		Choose the alternative that you think would be the most common response to the action or behavior stated 
		and select the letter corresponding to that alternative in the drop-down box following each item.
		<br>
		Complete all 42 statements in the manner, being as honest as possible.
	</td>
</tr>
</table>






