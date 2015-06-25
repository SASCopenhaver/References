<!--- inc_EditText.cfm --->
<div class="feature">
<!--- ############################################################################################################# --->
<table width="50%" align="center" border="0" cellspacing="1" cellpadding="1">
	<tr>
			<td width="3%" align="center"><input type="checkbox" onClick="f_onClick(this.name); " name="cbx_101" value="HOME" checked="checked"></td>	
			<td>&nbsp;<span class="c_fieldName">HOME</span></td>	
	</tr>
	<tr>
			<td colspan="2" align="center">
				<span class="c_fieldName">Text type:&nbsp;</span>
				<select class="forminputs" name="ddlb_TextType">
					<option value="-1">=== Select Topic Type ===</option>
					<option value="NW" selected="selected">News</option>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" name="cb_Continue" value="Continue" class="c_formbuttons" onClick="JavaScript: f_Validate();">
			</td>
	</tr>
</table>

<input type="hidden" name="h_PageID">
<input type="hidden" name="h_PageNm">

<script language="javascript" type="text/javascript">
//
//of_populateSelect( "ddlb_TextType", "-1", "=== Select Topic Type ===", 0, "", "", "", "1D" );
//

function  f_populateDDLB(argPageID){with(self.document.forms[0])
{
	if (eval("cbx_"+argPageID+".checked"))
	{
		fBfrTT = new Array();// filtered buffer
		var f = 0;
		//********************************************************************************
		if (argPageID == 1001)
		{
			for (var t =0; t<rowsTT; t++)
			{
				if (orgBfrTT[t].aitem_cd == "CS")//NW - News
				{
					fBfrTT[f] = new arrayTT(
											orgBfrTT[t].aitem,
											orgBfrTT[t].aitem_cd,
											orgBfrTT[t].aitem_desc
					  					   )
					f++;
				}
			}
			//
			of_populateSelect( "ddlb_TextType", "-1", "=== Select Text Type ===", fBfrTT.length, "fBfrTT", "aitem_cd", "aitem_desc", "2D" );
			of_selectedInDDLB ("ddlb_TextType", "-1");
		}//end of if for 1001
		//********************************************************************************
		else if (argPageID == 101 )
		{
			for (var t =0; t<rowsTT; t++)
			{
				if (orgBfrTT[t].aitem_cd == "NW" || orgBfrTT[t].aitem_cd == "CS")
				{
					fBfrTT[f] = new arrayTT(
											orgBfrTT[t].aitem,
											orgBfrTT[t].aitem_cd,
											orgBfrTT[t].aitem_desc
					  					   )
					f++;
				}
			}
			//
			of_populateSelect( "ddlb_TextType", "-1", "=== Select Text Type ===", fBfrTT.length, "fBfrTT", "aitem_cd", "aitem_desc", "2D" );
			of_selectedInDDLB ("ddlb_TextType", "-1");
		}
		
	}
	else
	{
		of_populateSelect( "ddlb_TextType", "-1", "===== Select Page =====", 0, "", "", "", "1D" );
	}
	
}}
//

function  f_onClick(argCtrlName) {with(self.document.forms[0])
{//alert(argCtrlName)
	for (var e=0; e<elements.length; e++)
    {
		if ( elements[e].type == "checkbox")
		{
			if (elements[e].checked )
			{
				for (var e=0; e<elements.length; e++)
    			{
					elements[e].checked = false;
				}
				eval(argCtrlName+".checked=true");
				break;
			}
		}
	}
}}
//
//---------------------------------------------------------
function f_Validate(){with(self.document.forms[0])
{
	var vChecked = "NO";
	for (var e=0; e<elements.length; e++)
    {
		if ( elements[e].type == "checkbox")
		{
			if ( elements[e].checked )
			{
				vChecked = "YES";
				h_PageID.value = elements[e].name.substr(4, elements[e].name.length);
				h_PageNm.value = elements[e].value;
				break;
			}
		}
	}
	//
	if (ddlb_TextType.value != "-1")
	{
		switch (vChecked)
		{
			case "YES":
				of_CallFile("getTextEditor");
			break;
			//
			case "NO":
				alert("Sorry, cannot continue.  Check menu item first.");
			break;
		}
	}
	else
	{
		alert("Sorry, cannot continue.  Text Type must be selected.");
	}	
}}
//
</script>