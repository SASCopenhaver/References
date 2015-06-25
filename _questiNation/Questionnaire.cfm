<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>

<title>Questionnaire</title></head>
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_Quest#" output="spr_Quest">

<!--- User Answers --->
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_UA#" output="spr_UA">

<!--- If User Has Comments --->
<!--- <cfif #client.IUHCrecordCount# GT 0> --->
	<cfwddx action="WDDX2CFML" input="#client.sprWDDX_IfUserHasComments#" output="spr_IfUserHasComments">
<!--- </cfif> --->

<script language="JavaScript">
var vValidationPassed;
//------------------------------------------------------------------------------

<cfwddx action="CFML2JS" input="#spr_Quest#" toplevelvariable="tlv_Q">
var rowsQ = tlv_Q.getRowCount();
function holdQ ( aqID, aqText, aaType )
{ this.aqID = aqID; this.aqText = aqText; this.aaType; }
arrayQ = new Array();
for (var q=0; q<rowsQ; q++)
{ arrayQ[q] = new holdQ (   tlv_Q.qid[q],
                            tlv_Q.qtext[q],
                            tlv_Q.atype[q]
                         )
}
//------------------------------------------------------------------------------
var vIUHCrecordCount = "<cfoutput>#client.IUHCrecordCount#</cfoutput>";
if (vIUHCrecordCount > 0)
{
	<cfwddx action="CFML2JS" input="#spr_IfUserHasComments#" toplevelvariable="tlv_IUHC">
	//IUHC - IfUserHasComments
	var rowsIUHC = tlv_IUHC.getRowCount();
	//alert(rowsIUHC)
	function holdIUHC (aPrjID, aUserID, aQNum, aIUHC)
	{
		this.aPrjID = aPrjID;
		this.aUserID = aUserID;
		this.aQNum = aQNum;
		this.aIUHC = aIUHC;
	}
	arrayIUHC = new Array();
	for (var c=0; c<rowsIUHC; c++)
	{
		arrayIUHC[c] = new holdIUHC (
										tlv_IUHC.prjid[c],
										tlv_IUHC.userid[c],
										tlv_IUHC.qnum[c],
										tlv_IUHC.ifuserhascomment[c]
									)
	}
}

//------------------------------------------------------------------------------

function of_Submit(){with (self.document.forms[0]){
	
	//var vTotalAnswerString = "";
	var vSQL_Update = "";
	var vSQL_Delete = "";
	var vCountAnswers = 0;//It counts number of answered questions
					  	  //to update column ANSWER_STATUS in table ANSWERS.
					  	  //Possible values:'N' - no answers;
					      //				'P' - partially ansered;
					      //				'C' - completed (all questions answered).
	//**************************************************************************
	
	//e - elements on the page.
	for (var e=0; e<elements.length; e++)
	{
		if (elements[e].name.substring(0,3) == "s_A")
		{
			//This portion is for table ANSWERS:
			vTempString = "_"+elements[e].value;
			vSQL_Update += ", Q"+elements[e].name.substr(3)+" = "+elements[e].value+" ";
			
			//This portion is for table COMMENTS:
			//It is needed if user decided to give a default answer
			//to the question where previously comments were provided.
			if (elements[e].value == "-10")
			{
				vTempString = "OR Q_NUM="+elements[e].name.substr(3)+" ";
				vSQL_Delete += vTempString;
				
				vTempCountAnswers = 1;
				vCountAnswers += vTempCountAnswers;
			}
			
		}
	}//end of for loop Elements
	
	//This portion is for table ANSWERS:
	vSQL_Update = vSQL_Update.substring(2, vSQL_Update.length);//removes the first comma in the string
	
	if (vCountAnswers == 42)
		{vCountAnswers = " , ANSWER_STATUS='N'";}
	else if (vCountAnswers == 0)
		{vCountAnswers = " , ANSWER_STATUS='C'";}
	else 
		{vCountAnswers = " , ANSWER_STATUS='P'";}
	
	vSQL_Update = "UPDATE ANSWERS SET "+vSQL_Update+vCountAnswers;
	h_SQL_Update.value = vSQL_Update;
	
	//This portion is for table COMMENTS:
	vSQL_Delete = vSQL_Delete.substring(3, vSQL_Delete.length);	
	h_SQL_Delete.value = vSQL_Delete;
	
	action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=InsUpdAnswers";
	submit();
	
}}
//------------------------------------------------------------------------------

function of_changeAnswer(argAnswerValue, argQNum)
{
	if (argAnswerValue == -10)
	{
		alert("Giving 'default' answer on question "+argQNum+" and saving it\n"+
			 "you will permanently delete your Comments (if provided)\n"+
			 "related to this question."
			 )
	}
}
//------------------------------------------------------------------------------
</script>
<body>
<form name="f_Q" method="post">
<input name="h_SQL_Update" type="hidden">
<input name="h_SQL_Delete" type="hidden">
<!--- <input name="h_TotalAnswerString" type="hidden"> --->
<table width="70%" border="0" align="center" class="Teal10">
<tr>
    <td colspan="4" align="left" valign="top">
		<cfinclude template="OpenCloseInstruction.cfm">
	</td>
    <td valign="top">
        <!--- ** --->
        <table width="70%" align="center" cellspacing="2" cellpadding="2" border="0">
        <tr valign="top">
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_MenuForUSER.cfm"></td>
            <td><cfinclude template="cb_SaveAnswers.cfm"></td>
        </tr>
        </table>
        <!--- ** --->
    </td>
</tr>
</table>

<table width="70%" border="0" align="center" class="Teal10">
<tr><td colspan="4"><hr color="#008080"></td></tr>
<tr>
	<td colspan="2">
	<strong>If an employee in your organization were to ...</strong>
	</td>
	<td><strong>Most other employees would:</strong></td>
	<td align="right"><strong>Comments</strong></td>
</tr>
<tr>
	<td colspan="4"><hr color="#008080"></td>
</tr>
<cfoutput query="spr_Quest">
<tr>
    <td valign="top" width="5%">
        #qID#.
    </td>
    <td valign="top">
        #qText#
    </td>
    <td align="left" width="10%"  valign="top">
        <cfinclude template="#aType#.cfm">
	</td>
	<td width="10%" align="right">
	   <a href="javascript:  openPopUpComments(#qID#);">
	    	<img src="Img/EmptyComments.jpg" 
				 alt="Comments" 
				 border="0" 
				 id="img_#qID#">
		</a>
    </td>
</tr>
</cfoutput>
</table>

<table width="70%" align="center" cellspacing="2" cellpadding="2" border="0">
<tr><td colspan="4">&nbsp;</td></tr>
<tr>
    <td width="50%">&nbsp;</td>
    <td><cfinclude template="cb_LogOut.cfm"></td>
    <td><cfinclude template="cb_MenuForUSER.cfm"></td>
    <td><cfinclude template="cb_SaveAnswers.cfm"></td>
</tr>
</table>
</form>
<!--- delete client.PrjID, client.QNum, client.QValue --->
</body>
</html>

<script language="JavaScript">
//------------------------------------------------------------------------------
//function openPopUpComments(argQNum, argQDescr)
function openPopUpComments(argQNum)
{
var argQDescr;
//var argQDescr = eval("self.document.forms[0].h_Q"+argQNum+".value");

for (var q=0; q<rowsQ; q++)
{ 
	if (arrayQ[q].aqID == argQNum)
	{
		argQDescr = arrayQ[q].aqText;
		break;
	}
}


    if (eval("self.document.forms[0].s_A"+argQNum+".options.value") == "-10")
	{
		alert("Please answer question #"+argQNum+" first.");
		eval("self.document.forms[0].s_A"+argQNum+".focus()")
	}
	else
	{
	    var vQValue = eval("self.document.forms[0].s_A"+argQNum+".options[self.document.forms[0].s_A"+argQNum+".selectedIndex].value")
        
        var popupPage = "popupComments.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlQNum="+argQNum+"&urlQDescr="+argQDescr+"&urlQValue="+vQValue;
	    
        var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=no,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=550,height=230','yes');
	    if ((document.window != null) && (!popupWin.opener))
        {
			popupWin.opener = document.window;
        }
        
	}

}
//------------------------------------------------------------------------------
if (vIUHCrecordCount > 0)
{

	with (self.document.forms[0]){
		for (var c=0; c<rowsIUHC; c++)
		{
			eval("f_Q.img_"+arrayIUHC[c].aQNum+".src = 'img/FullComments.jpg'")
		}
	}// end of with

}
//------------------------------------------------------------------------------
</script>
