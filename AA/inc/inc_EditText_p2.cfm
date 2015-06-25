<!--- inc_EditText_p2.cfm --->
<div class="feature">
<!--- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --->
<table align="center" width="90%"  border="1" bordercolordark="#941021" cellspacing="2" cellpadding="2">
	<tr bgcolor="#CCCCCC">
		<td align="center" class="c_fieldName" width="50%">Title / Text</td>
		<td align="center" class="c_fieldName" width="10%">Sequence<br>on page</td>
		<td align="center" class="c_fieldName" width="10%">Active</td>
		<td align="center" class="c_fieldName" width="10%">Expiration<br>date</td>
		<td align="center" class="c_fieldName" width="10%">Actions</td>
	</tr>
	<tr>
		<td valign="top" id="id_TitleTxt" width="50%"></td>
		<td align="center" valign="top" id="id_SeqOnPage" width="10%"></td>
		<td align="center" valign="top" id="id_IsActive" width="10%"></td>
		<td align="center" valign="top" id="id_ExprDT" width="10%"></td>
		<td align="center" valign="top" id="id_Action" width="10%"></td>
	</tr>
<cfloop query="spr_getTopicsToEdit" startrow="1" endrow="#spr_getTopicsToEdit.recordCount#">
	<tr>
		<cfoutput>
		<td valign="top">
			<br>
			<p>
			<input name="txt_topic_title_#topic_id#" value="#topic_title#"class="forminputs" size="80">
			</p>
			<textarea name="txta_topic_txt_#topic_id#" rows="8" cols="80" class="forminputs">#topic_txt#</textarea>
		</td>
		<td align="center" valign="top">
			<br>
			<input name="txt_topic_seq_on_page_#topic_id#" value="#topic_seq_on_page#"class="forminputs" size="2" ><!--- onBlur="JavaScript: f_CheckSequence();" --->
		</td>
		<td align="center" valign="top">
			<br>
			<cfset local.ActiveSelected = "">
			<cfset local.InactiveSelected = "">
			<cfif #topic_is_active# EQ "A">
				<cfset local.ActiveSelected = "selected">
				<cfset local.InactiveSelected = "">
			<cfelse>
				<cfset local.ActiveSelected = "">
				<cfset local.InactiveSelected = "selected">
			</cfif>
			<select name="ddlb_topic_is_active_#topic_id#" class="forminputs">
				<option value="-1" #local.ActiveSelected#>== Select ==</option>
				<option value="A" #local.ActiveSelected#>Active</option>
				<option value="I" #local.InactiveSelected#>Inactive</option>
			</select>
		</td>
		<td align="center" valign="top">
			<br>
			<input name="txt_topic_exprtn_dt_#topic_id#" value="#DateFormat(topic_exprtn_dt, 'mm/dd/yyyy')#" class="forminputs" size="12">
			<br>
			<span class="c_fieldValue">Format: mm/dd/yyyy</span>
		</td>
		<td align="center" valign="top">
			<br>
			<a href="##" class="c_fieldValue" onClick="f_Action('TOPIC_UPDATE', '#topic_id#', '#topic_title#');">Update</a>
			/
			<a href="##" class="c_fieldValue" onClick="f_Action('TOPIC_DELETE', '#topic_id#', '#topic_title#');">Delete</a>
		</td>
		</cfoutput>
	</tr>
</cfloop>
	<tr>
		<td colspan="5" align="right" valign="middle" id="id_AddCancelTopic">
			<a href="##" class="c_fieldValue" onClick="f_Add();"><strong>Add Topic</strong></a>
			&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>
<!--- ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --->
</div>
<cfoutput>
<input type="hidden" name="h_topic_id" value="">
<input type="hidden" name="h_topic_security_tree_id" value="#client.TE_PageID#">
<input type="hidden" name="h_topic_navigation_cd" value="#client.TE_TxtType#">
<input type="hidden" name="h_topic_title" value="">
<input type="hidden" name="h_topic_txt" value="">
<input type="hidden" name="h_topic_seq_on_page" value="">
<input type="hidden" name="h_topic_is_active" value="">
<input type="hidden" name="h_topic_exprtn_dt" value="">
<input type="hidden" name="h_Elmt_ID_Val" value="">
<input type="hidden" name="h_NumOfLoops" value="">
</cfoutput>
<script language="javascript" type="text/javascript">
//
//--------------------------------------------------------------------------------------------------------------

var vValidationPassed = "YES";
var vElmt_ID_Val = "";
//
//--------------------------------------------------------------------------------------------------------------
function f_CheckSequence(){with(self.document.forms[0])
{
	var vPresenceOfValuesPass = "YES";
	var vDelta = 0;
	var vPresenceOfDuplicatesPass = "YES";
		
	// 1. Checking presence of values: -------------------------------------------------------------------------
	for (var e=0; e<elements.length; e++ )
	{
		if ( elements[e].type == "text" &&  elements[e].name.substr(0,22) == "txt_topic_seq_on_page_" )
		{
			if(elements[e].value == "")
			{
				vPresenceOfValuesPass = "NO";
				alert("Sorry, cannot process your request.\nColumn 'Sequence on page' does not have value.");
				elements[e].focus();
				break;
			}
		}
	}
	//
	// 2. Checking presence of duplicate values: ------------------------------------------------------------------------
	for (var e=0; e<elements.length; e++ )
	{
		if ( elements[e].type == "text" &&  elements[e].name.substr(0,22) == "txt_topic_seq_on_page_" )
		{
			for (var ee=0; ee<elements.length; ee++ )
			{
				if ( elements[ee].type == "text" &&  elements[ee].name.substr(0,22) == "txt_topic_seq_on_page_"  && elements[ee].name != elements[e].name)
				{
					vDelta = parseInt(elements[e].value) - parseInt(elements[ee].value);
					if ( vDelta == 0)
					{
						vPresenceOfDuplicatesPass = "NO";
						//alert("Sorry, cannot process your request.\nAt least one value in column 'Sequence on page' is repeted twice.");
						break;
					}
				}// end of if ( elements[ee].type == "text"
			}// end of for (var ee=0; ee<elements.length; ee++ )
			if (vPresenceOfDuplicatesPass == "NO")
			{
				alert("Sorry, cannot process your request.\nAt least one value in column 'Sequence on page' is repeated twice.");
				break;
			}
		}// end of if ( elements[e].type == "text"
	}//end of for (var e=0; e<elements.length; e++ )
	//
	//
	if (vPresenceOfValuesPass == "NO" || vPresenceOfDuplicatesPass == "NO" ){vValidationPassed = "NO"}
}}
//
//-------------------------------------------------------------------------------------------------------------

function f_collectValsSeqOnPage(){with(self.document.forms[0])
{
	var vNumOfLoops = 0;
	vElmt_ID_Val = "";
	//
	for (var e=0; e<elements.length; e++ )
	{
		if ( elements[e].type == "text" &&  elements[e].name.substr(0,22) == "txt_topic_seq_on_page_" )
		{
			vElmt_ID_Val += elements[e].name.substr(22)+","+elements[e].value+";";
			vNumOfLoops ++;
		}
	}//end of for (var e=0; e<elements.length; e++ )
	//
	h_Elmt_ID_Val.value = vElmt_ID_Val;
	h_NumOfLoops.value = vNumOfLoops;
}}
//
//--------------------------------------------------------------------------------------------------------------

function f_Cancel(){with(self.document.forms[0])
{
	f_Action('TOPIC_CANCEL', '0', '');
}}
//
//--------------------------------------------------------------------------------------------------------------

function f_Add(){with(self.document.forms[0])
{	
	f_Action('TOPIC_ADD', '0', '');
}}
//
//--------------------------------------------------------------------------------------------------------------

function f_Save(){with(self.document.forms[0])
{
	vValidationPassed = "YES";
	//
	if ( txt_topic_title_0.value == "" && vValidationPassed == "YES" )
	{
		vValidationPassed = "NO";
		alert("Sorry, cannot process your request.\nField 'Title' must have a value.")
	}
	//
	if ( txta_topic_txt_0.value == "" && vValidationPassed == "YES" )
	{
		vValidationPassed = "NO";
		alert("Sorry, cannot process your request.\nField 'Text' must have a value.")
	}
	//
	if (vValidationPassed == "YES") 
	{
		f_Action('TOPIC_INSERT', '0', '') 
	};
}}
//
//--------------------------------------------------------------------------------------------------------------
function f_Action(argAction, argTopicID, argTopicTitle){with(self.document.forms[0])
{
	switch (argAction)
	{
		//---------------------------------------------------
		
		case "TOPIC_INSERT":
			//
			h_topic_id.value = argTopicID;
			h_topic_title.value = eval("txt_topic_title_"+argTopicID+".value");
			h_topic_txt.value = eval("txta_topic_txt_"+argTopicID+".value");
			h_topic_seq_on_page.value = eval("txt_topic_seq_on_page_"+argTopicID+".value");
			h_topic_is_active.value = eval("ddlb_topic_is_active_"+argTopicID+".value");
			h_topic_exprtn_dt.value = eval("txt_topic_exprtn_dt_"+argTopicID+".value");
			//
			f_CheckSequence();
			//alert("1   "+vValidationPassed)
			//
			if ( vValidationPassed == "YES" ) { f_collectValsSeqOnPage(); }
			//alert("2   "+vValidationPassed)
			//
			if ( h_topic_exprtn_dt.value != "" && vValidationPassed == "YES")
			{
				vValidationPassed = f_ValidateDate("txt_topic_exprtn_dt_"+argTopicID);
			}
			//alert("3   "+vValidationPassed)
			//alert(vValidationPassed)
		break;
		//---------------------------------------------------
		
		case "TOPIC_UPDATE":
			if ( confirm("Do you want to update topic '"+argTopicTitle+"'?") )
			{
				h_topic_id.value = argTopicID;
				h_topic_title.value = eval("txt_topic_title_"+argTopicID+".value");
				h_topic_txt.value = eval("txta_topic_txt_"+argTopicID+".value");
				h_topic_seq_on_page.value = eval("txt_topic_seq_on_page_"+argTopicID+".value");
				h_topic_is_active.value = eval("ddlb_topic_is_active_"+argTopicID+".value");
				h_topic_exprtn_dt.value = eval("txt_topic_exprtn_dt_"+argTopicID+".value");
				//
				f_CheckSequence();
				//
				if ( vValidationPassed == "YES" ) { f_collectValsSeqOnPage(); }
				//
				if ( h_topic_exprtn_dt.value != "" && vValidationPassed == "YES" )
				{
					vValidationPassed = f_ValidateDate("txt_topic_exprtn_dt_"+argTopicID);
				}
				//
			}
		break;
		//---------------------------------------------------
		
		case "TOPIC_DELETE":
			if ( confirm("Do you want to delete topic '"+argTopicTitle+"'?") )
			{
				h_topic_id.value = argTopicID;
				//
				f_CheckSequence();
				//
				if ( vValidationPassed == "YES" ) { f_collectValsSeqOnPage(); }
				//
			}
		break;
		//---------------------------------------------------
		
		case "TOPIC_ADD":
			if ( confirm("Do you want to add topic?") )
			{
				var vOutput = "";
					vOutput += "<br><p>";
					vOutput += "<input name=\"txt_topic_title_0\" value=\"\" class=\"forminputs\" size=\"80\">";
					vOutput += "</p>";
					vOutput += "<textarea name=\"txta_topic_txt_0\" rows=\"8\" cols=\"60\" class=\"\"></textarea>";
					of_innerHTML("id_TitleTxt", "'"+vOutput+"'");
					//
					vOutput = "";
					vOutput += "<br>";
					vOutput += "<input name=\"txt_topic_seq_on_page_0\" value=\"\"class=\"forminputs\" size=\"5\">";
					of_innerHTML("id_SeqOnPage", "'"+vOutput+"'");
					//
					vOutput = "";
					vOutput += "<br>";
					vOutput += "<select name=\"ddlb_topic_is_active_0\" class=\"forminputs\">";
					vOutput += "<option value=\"-1\">== Select ==</option>";
					vOutput += "<option value=\"A\" selected=\"selected\">Active</option>";
					vOutput += "<option value=\"I\">Inactive</option>";
					vOutput += "</select>";
					of_innerHTML("id_IsActive", "'"+vOutput+"'");
					//
					vOutput = "";
					vOutput += "<br>";
					vOutput += "<input name=\"txt_topic_exprtn_dt_0\" value=\"\" class=\"forminputs\" size=\"12\">";
					vOutput += "<br>";
					vOutput += "<span class=\"c_fieldValue\">Format: mm/dd/yyyy</span>";
					of_innerHTML("id_ExprDT", "'"+vOutput+"'");
					//
					vOutput = "";
					vOutput += "<br>";
					vOutput += "<a href=\"##\" class=\"c_fieldValue\" onClick=\"f_Save();\">Save Topic</a>";
					of_innerHTML("id_Action", "'"+vOutput+"'");
					//
					//
					vOutput = "";//onClick=\"f_Action(\'TOPIC_CANCEL\', \'0\', \'\');\"
					vOutput += "<a href=\"##\" class=\"c_fieldValue\" onClick=\"f_Cancel();\" ><strong>Cancel Topic</strong></a>";
					vOutput += "&nbsp;&nbsp;&nbsp;";
					of_innerHTML("id_AddCancelTopic", "'"+vOutput+"'");
					//
					
			}
		break;
		//---------------------------------------------------
		
		case "TOPIC_CANCEL":
			
			vOutput = "";
			of_innerHTML("id_TitleTxt", "'"+vOutput+"'");
			of_innerHTML("id_SeqOnPage", "'"+vOutput+"'");
			of_innerHTML("id_IsActive", "'"+vOutput+"'");
			of_innerHTML("id_ExprDT", "'"+vOutput+"'");
			of_innerHTML("id_Action", "'"+vOutput+"'");
			of_innerHTML("id_AddCancelTopic", "'"+vOutput+"'");
			//
			vOutput += "<a href=\"##\" class=\"c_fieldValue\" onClick=\"f_Add();\"><strong>Add Topic</strong></a>";
			vOutput += "&nbsp;&nbsp;&nbsp;";
			of_innerHTML("id_AddCancelTopic", "'"+vOutput+"'");
		break;
	}
	//
	
	if ( (argAction == "TOPIC_INSERT" || argAction == "TOPIC_UPDATE" || argAction == "TOPIC_DELETE") && vValidationPassed == "YES" )
	{
		//alert("of_CallFile")
		of_CallFile(argAction);
	}
}}
//
//------------------------------------------------------------------------------------------------------------------------------
//
//--------------------------------------------------------------------------------------------------------------



function f_ValidateDate(argCtrlName){with(self.document.forms[0])
{
	var vRtn = "NO";
	var vCtrlVal = eval(argCtrlName+".value");//alert(vCtrlVal)
	
	if (isDate(vCtrlVal)==false)
	{
		eval(argCtrlName+".focus()");
	}
	else { vRtn = "YES"; }
    
	return vRtn;
}}


var dtCh= "/";
var minYear=1900;
var maxYear=2100;

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date")
		return false
	}
return true
}





</script>