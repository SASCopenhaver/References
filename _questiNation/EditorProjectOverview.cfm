<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html><head><title><cfoutput>#local.ModuleName#</cfoutput></title>

<cfwddx action="WDDX2CFML" input="#client.sprWDDX_ActPrjsForOverview#" output="spr_ActPrjsForOverview">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_ActPrjsForOverview")> --->

<cfwddx action="WDDX2CFML" input="#client.sprWDDX_InactPrjsForOverview#" output="spr_InactPrjsForOverview">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_InactPrjsForOverview")> --->

<script language="JavaScript">
/*
function of_InitialValue (argObjName, argValue, argText, argPosNum)
{//alert(argObjName, argValue, argText, argPosNum)
    with(self.document.forms[0])
    {
        var controlType = argObjName.substr(0,1);
        if ( controlType == "s")//select box
        {
            eval(argObjName  + ".options["+argPosNum+"].value = "+ argValue);
			//alert(eval(argObjName  + ".options["+argPosNum+"].value = "+ argValue))
            eval(argObjName  + ".options["+argPosNum+"].text = \"" + argText +"\"");
        }//end of if
        else if (controlType == "t")
        {
            alert(controlType);
        }//end of else if
    }//end of with
}//end of function
*/
//------------------------------------------------------------------------------

//Active Projects:
<cfwddx action="CFML2JS" input="#spr_ActPrjsForOverview#" toplevelvariable="tlv_APrjs">
var rowsAPrjs = tlv_APrjs.getRowCount();
//alert(rowsAPrjs)
function holdAPrjs (aPrjID, aPrjName, aOrgID, aOrgName, aPrjSDate, aPrjEDate,
					aPrjDuration, aPrjCreator, aPrjMngr, aPrjNumPart, aPrjNA,
					aPrjNAP, aPrjPA, aPrjPAP, aPrjCA, aPrjCAP)
{

	this.aPrjID	= aPrjID;	  this.aPrjName = aPrjName;	 this.aOrgID = aOrgID;
	this.aOrgName = aOrgName; this.aPrjSDate =aPrjSDate; this.aPrjEDate = aPrjEDate;
	this.aPrjDuration=aPrjDuration; this.aPrjCreator = aPrjCreator;
	this.aPrjMngr = aPrjMngr; this.aPrjNumPart = aPrjNumPart; 
	this.aPrjNA = aPrjNA;	  this.aPrjNAP = aPrjNAP;    this.aPrjPA = aPrjPA;
	this.aPrjPAP = aPrjPAP;   this.aPrjCA = aPrjCA;      this.aPrjCAP = aPrjCAP;

}
arrayAPrjs = new Array();
for (var a=0; a<rowsAPrjs; a++)
{
	arrayAPrjs[a] = new holdAPrjs(
								 tlv_APrjs.prjid[a],	   tlv_APrjs.prjname[a],
								 tlv_APrjs.orgid[a],	   tlv_APrjs.orgname[a],
								 tlv_APrjs.prjsdate[a],	   tlv_APrjs.prjedate[a],
								 tlv_APrjs.prjduration[a], tlv_APrjs.prjcreator[a],
								 tlv_APrjs.prjmngr[a],	   tlv_APrjs.prjnumpart[a],
								 tlv_APrjs.prjna[a],	   tlv_APrjs.prjnap[a],
								 tlv_APrjs.prjpa[a],	   tlv_APrjs.prjpap[a],
								 tlv_APrjs.prjca[a],	   tlv_APrjs.prjcap[a]
								 )
}

//------------------------------------------------------------------------------

//Inactive (archaived) Projects:
<cfwddx action="CFML2JS" input="#spr_InactPrjsForOverview#" toplevelvariable="tlv_IPrjs">
var rowsIPrjs = tlv_IPrjs.getRowCount();
function holdIPrjs (aPrjID, aPrjName, aOrgID, aOrgName, aPrjSDate, aPrjEDate,
					aPrjDuration, aPrjCreator, aPrjMngr, aPrjNumPart, aPrjNA,
					aPrjNAP, aPrjPA, aPrjPAP, aPrjCA, aPrjCAP)
{
	this.aPrjID	= aPrjID;	  this.aPrjName = aPrjName;	 this.aOrgID = aOrgID;
	this.aOrgName =aOrgName;  this.aPrjSDate =aPrjSDate; this.aPrjEDate = aPrjEDate;
	this.aPrjDuration=aPrjDuration; this.aPrjCreator = aPrjCreator;
	this.aPrjMngr = aPrjMngr; this.aPrjNumPart = aPrjNumPart; 
	this.aPrjNA = aPrjNA;     this.aPrjNAP = aPrjNAP;    this.aPrjPA = aPrjPA;
	this.aPrjPAP = aPrjPAP;   this.aPrjCA = aPrjCA;      this.aPrjCAP = aPrjCAP;
}
arrayIPrjs = new Array();
for (var a=0; a<rowsIPrjs; a++)
{
	arrayIPrjs[a] = new holdIPrjs(
								 tlv_IPrjs.prjid[a],	   tlv_IPrjs.prjname[a],
								 tlv_IPrjs.orgid[a],	   tlv_IPrjs.orgname[a],
								 tlv_IPrjs.prjsdate[a],	   tlv_IPrjs.prjedate[a],
								 tlv_IPrjs.prjduration[a], tlv_IPrjs.prjcreator[a],
								 tlv_IPrjs.prjmngr[a],	   tlv_IPrjs.prjnumpart[a],
								 tlv_IPrjs.prjna[a],	   tlv_IPrjs.prjnap[a],
								 tlv_IPrjs.prjpa[a],	   tlv_IPrjs.prjpap[a],
								 tlv_IPrjs.prjca[a],	   tlv_IPrjs.prjcap[a]
								 )
}

//------------------------------------------------------------------------------

function of_populateAPrjs(argRowNum){with (self.document.forms[0]){
	for (var a=0; a<rowsAPrjs; a++)
	{
		optionAPrjs = new Option;
		optionAPrjs.value = arrayAPrjs[a].aPrjID;
		optionAPrjs.text = arrayAPrjs[a].aPrjID+"  "+arrayAPrjs[a].aPrjName;
		s_APrjs.options[argRowNum] = optionAPrjs;
		argRowNum++;
	}
}}
//------------------------------------------------------------------------------

function of_populateIPrjs(argRowNum){with (self.document.forms[0]){
	for (var a=0; a<rowsIPrjs; a++)
	{
		optionIPrjs = new Option;
		optionIPrjs.value = arrayIPrjs[a].aPrjID;
		optionIPrjs.text = arrayIPrjs[a].aPrjID+"  "+arrayIPrjs[a].aPrjName;
		s_IPrjs.options[argRowNum] = optionIPrjs;
		argRowNum++;
	}
}}
//------------------------------------------------------------------------------

function of_chngAPrj(argAPrjID){with (self.document.forms[0]){
	if (argAPrjID == -1)
	{
		h_PrjID.value = -1;
		//h_APrjID.value = -1;
		txt_APrjName.value = "n/a";
		txt_APrjName.size = 3;
		txt_APrjCreator.value = "n/a";
		txt_APrjCreator.size = 3;
		txt_APrjSDate.value = "n/a";
		txt_APrjSDate.size = 3;
		txt_APrjEDate.value = "n/a";
		txt_APrjEDate.size = 3;
		txt_APrjDuration.value = "n/a";
		txt_APrjDuration.size = 3;
		txt_APrjMngr.value = "n/a";
		txt_APrjMngr.size = 3;
		txt_APrjNumPart.value = "n/a";
		txt_APrjNumPart.size = 3;
		txt_APrjNA.value = "n/a";
		txt_APrjNA.size = 3;
		txt_APrjNAP.value = "n/a";
		txt_APrjNAP.size = 3;
		txt_APrjPA.value = "n/a";
		txt_APrjPA.size = 3;
		txt_APrjPAP.value = "n/a";
		txt_APrjPAP.size = 3;
		txt_APrjCA.value = "n/a";
		txt_APrjCA.size = 3;
		txt_APrjCAP.value = "n/a";
		txt_APrjCAP.size = 3;
	}
	else
	{
		for (var a=0; a<rowsAPrjs; a++)
		{
			if (argAPrjID == arrayAPrjs[a].aPrjID)
			{
				h_PrjID.value = arrayAPrjs[a].aPrjID;
				//h_APrjID.value = arrayAPrjs[a].aPrjID;
				txt_APrjName.value = arrayAPrjs[a].aPrjName;
				txt_APrjName.size = arrayAPrjs[a].aPrjName.length;
				txt_APrjCreator.value = arrayAPrjs[a].aPrjCreator;
				txt_APrjCreator.size = arrayAPrjs[a].aPrjCreator.length;
				txt_APrjSDate.value = arrayAPrjs[a].aPrjSDate;
				txt_APrjSDate.size = arrayAPrjs[a].aPrjSDate.length;
				txt_APrjEDate.value = arrayAPrjs[a].aPrjEDate;
				txt_APrjEDate.size = arrayAPrjs[a].aPrjEDate.length;
				txt_APrjDuration.value = arrayAPrjs[a].aPrjDuration;
				txt_APrjDuration.size = arrayAPrjs[a].aPrjDuration.length;
				txt_APrjMngr.value = arrayAPrjs[a].aPrjMngr;
				txt_APrjMngr.size = arrayAPrjs[a].aPrjMngr.length+5;
				txt_APrjNumPart.value = arrayAPrjs[a].aPrjNumPart;
				txt_APrjNumPart.size = arrayAPrjs[a].aPrjNumPart.length;
				txt_APrjNA.value = arrayAPrjs[a].aPrjNA;
				txt_APrjNA.size = arrayAPrjs[a].aPrjNA.length;
				txt_APrjNAP.value = arrayAPrjs[a].aPrjNAP;
				txt_APrjNAP.size = arrayAPrjs[a].aPrjNAP.length;
				txt_APrjPA.value = arrayAPrjs[a].aPrjPA;
				txt_APrjPA.size = arrayAPrjs[a].aPrjPA.length;
				txt_APrjPAP.value = arrayAPrjs[a].aPrjPAP;
				txt_APrjPAP.size = arrayAPrjs[a].aPrjPAP.length;
				txt_APrjCA.value = arrayAPrjs[a].aPrjCA;
				txt_APrjCA.size = arrayAPrjs[a].aPrjCA.length;
				txt_APrjCAP.value = arrayAPrjs[a].aPrjCAP;
				txt_APrjCAP.size = arrayAPrjs[a].aPrjCAP.length;
			}//end of "if" within loop
		}//end of for loop
	}//end of "else"
}}//end of of_chngAPrj
//------------------------------------------------------------------------------

function of_chngIPrj(argIPrjID){with (self.document.forms[0]){
	if (argIPrjID == -1)
	{
		h_PrjID.value = -1;
		//h_IPrjID.value = -1;
		txt_IPrjName.value = "n/a";
		txt_IPrjName.size = 3;
		txt_IPrjCreator.value = "n/a";
		txt_IPrjCreator.size = 3;
		txt_IPrjSDate.value = "n/a";
		txt_IPrjSDate.size = 3;
		txt_IPrjEDate.value = "n/a";
		txt_IPrjEDate.size = 3;
		txt_IPrjDuration.value = "n/a";
		txt_IPrjDuration.size = 3;
		txt_IPrjMngr.value = "n/a";
		txt_IPrjMngr.size = 3;
		txt_IPrjNumPart.value = "n/a";
		txt_IPrjNumPart.size = 3;
		txt_IPrjNA.value = "n/a";
		txt_IPrjNA.size = 3;
		txt_IPrjNAP.value = "n/a";
		txt_IPrjNAP.size = 3;
		txt_IPrjPA.value = "n/a";
		txt_IPrjPA.size = 3;
		txt_IPrjPAP.value = "n/a";
		txt_IPrjPAP.size = 3;
		txt_IPrjCA.value = "n/a";
		txt_IPrjCA.size = 3;
		txt_IPrjCAP.value = "n/a";
		txt_IPrjCAP.size = 3;
	}
	else
	{
		for (var a=0; a<rowsIPrjs; a++)
		{
			if (argIPrjID == arrayIPrjs[a].aPrjID)
			{
				h_PrjID.value = arrayIPrjs[a].aPrjID;
				//h_IPrjID.value = arrayIPrjs[a].aPrjID;
				txt_IPrjName.value = arrayIPrjs[a].aPrjName;
				txt_IPrjName.size = arrayIPrjs[a].aPrjName.length;
				txt_IPrjCreator.value = arrayIPrjs[a].aPrjCreator;
				txt_IPrjCreator.size = arrayIPrjs[a].aPrjCreator.length;
				txt_IPrjSDate.value = arrayIPrjs[a].aPrjSDate;
				txt_IPrjSDate.size = arrayIPrjs[a].aPrjSDate.length;
				txt_IPrjEDate.value = arrayIPrjs[a].aPrjEDate;
				txt_IPrjEDate.size = arrayIPrjs[a].aPrjEDate.length;
				txt_IPrjDuration.value = arrayIPrjs[a].aPrjDuration;
				txt_IPrjDuration.size = arrayIPrjs[a].aPrjDuration.length;
				txt_IPrjMngr.value = arrayIPrjs[a].aPrjMngr;
				txt_IPrjMngr.size = arrayIPrjs[a].aPrjMngr.length+5;
				txt_IPrjNumPart.value = arrayIPrjs[a].aPrjNumPart;
				txt_IPrjNumPart.size = arrayIPrjs[a].aPrjNumPart.length;
				txt_IPrjNA.value = arrayIPrjs[a].aPrjNA;
				txt_IPrjNA.size = arrayIPrjs[a].aPrjNA.length;
				txt_IPrjNAP.value = arrayIPrjs[a].aPrjNAP;
				txt_IPrjNAP.size = arrayIPrjs[a].aPrjNAP.length;
				txt_IPrjPA.value = arrayIPrjs[a].aPrjPA;
				txt_IPrjPA.size = arrayIPrjs[a].aPrjPA.length;
				txt_IPrjPAP.value = arrayIPrjs[a].aPrjPAP;
				txt_IPrjPAP.size = arrayIPrjs[a].aPrjPAP.length;
				txt_IPrjCA.value = arrayIPrjs[a].aPrjCA;
				txt_IPrjCA.size = arrayIPrjs[a].aPrjCA.length;
				txt_IPrjCAP.value = arrayIPrjs[a].aPrjCAP;
				txt_IPrjCAP.size = arrayIPrjs[a].aPrjCAP.length;
			}//end of "if" within loop
		}//end of for loop
	}//end of "else"
}}//end of of_chngAPrj
//------------------------------------------------------------------------------
/*
function of_Focus(argObjName){with (self.document.forms[0]){

	var vPrjID = 0;
	for (var r=0; r<eval(argObjName+".options.length"); r++)
	{
		//alert(argObjName+"  "+vPrjID)
		if ( eval(argObjName+".options["+r+"].selected") == true )
		{
			vPrjID = eval(argObjName+".options["+r+"].value");
			alert( eval(argObjName+".options["+r+"].value") );
			break;
		}
	}
	
	
}}
*/

function of_Focus(argControlName){with (self.document.forms[0]){
	if (argControlName == "s_APrjs")
	{
		for (var r=0; r<s_IPrjs.options.length; r++)
		{
			if (s_IPrjs.options[r].selected == true)
			{
				s_IPrjs.options.length = 0;
				s_IPrjs.options.length = 1;
				if (rowsIPrjs == 0)
				{
					of_InitialValue ("s_IPrjs", -1, "== No Archived Projects ==", 0);
				}
				else
				{
					of_InitialValue ("s_IPrjs", -1, "== Make Selection ==", 0);
				}
				of_populateIPrjs(1);
			}
			
		}
	}
	else if (argControlName == "s_IPrjs")
	{
		for (var r=0; r<s_APrjs.options.length; r++)
		{
			if (s_APrjs.options[r].selected == true)
			{
				s_APrjs.options.length = 0;
				s_APrjs.options.length = 1;
				if (rowsAPrjs == 0)
				{
					of_InitialValue ("s_APrjs", -1, "== No Current Projects ==", 0);
				}
				else
				{
					of_InitialValue ("s_APrjs", -1, "== Make Selection ==", 0);
				}
				of_populateAPrjs(1);
			}
		}
	}
}}
//------------------------------------------------------------------------------

function of_ArchiveTo(){with (self.document.forms[0]){
	var vCounter=0;
	var vPrjName="";
	for (var p=0; p<s_APrjs.options.length; p++)
	{
		if (s_APrjs.options[p].selected == true)
		{
			vCounter = 1;
			vPrjName = s_APrjs.options[p].text;
			break;
		}
	}
	
	if (vCounter == 0 || h_PrjID.value == -1)
	{
		alert("Illegal operation. Request denied.");
	}
	else
	{
		if (confirm("Do you really want to make Project "+vPrjName+" 'Archived'?"))
		{
			action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=InsUpdArchive";
			submit();
		}
	}
}}
//------------------------------------------------------------------------------

function of_ArchiveFrom(){with (self.document.forms[0]){
	var vCounter=0;
	var vPrjName="";
	for (var p=0; p<s_IPrjs.options.length; p++)
	{
		if (s_IPrjs.options[p].selected == true)
		{
			vCounter = 1;
			vPrjName = s_IPrjs.options[p].text;
			break;
		}
	}
	
	if (vCounter == 0 || h_PrjID.value == -1)
	{
		alert("Illegal operation. Request denied.");
	}
	else
	{
		if (confirm("Do you really want to make Project "+vPrjName+" 'Current'?"))
		{
			action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=InsUpdArchive";
			submit();
		}
	}
}}
//------------------------------------------------------------------------------
</script>
</head>
<body>
<form name="f_EPO" method="post"> <!--- EPO - Editor Project Overview --->
<input type="Hidden" name="h_PrjID">
<!--- ************** Current Projects ************************************* --->
<table align="center" width="70%" cellspacing="2" cellpadding="2" border="0">
<th bgcolor="#F7E49D">
	<font color="Teal" size="-1">
		List of Current Projects&nbsp;&nbsp;
		(Total:&nbsp;<cfoutput>#spr_ActPrjsForOverview.recordCount#</cfoutput>)
	</font>
</th>
<th bgcolor="#F7E49D"><font color="Teal" size="-1">Project Details</font></th>
<tr>
	<td width="30%">
		<select name="s_APrjs" size="5"
				onfocus="of_Focus(this.name)"
				onchange="of_chngAPrj(this.options[selectedIndex].value)" 
				>
			<option></option>
		</select>
		<br>
		<cfinclude template="cb_ArchiveTo.cfm">
	</td>
	<td width="70%" class="Brown8">
	<table class="Brown8">
		<tr>
			<td>
				Project&nbsp;
				<input type="text" size="100" name="txt_APrjName" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
			</td>
		</tr>
		<tr>
			<td>
				Created by&nbsp;
				<input type="Text" name="txt_APrjCreator" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				.
				<!--- 
				Project Managers:&nbsp; --->
				<input type="hidden" name="txt_APrjMngr" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
			    
			</td>
		</tr>
		<tr>
			<td>
				Project Start Date:&nbsp;
				<input type="Text" name="txt_APrjSDate" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				,&nbsp;End Date&nbsp;
				<input type="Text" name="txt_APrjEDate" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				,&nbsp;total of&nbsp;
				<input type="Text" name="txt_APrjDuration" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				days.
			</td>
		</tr>
		<tr>
			<td>
				<input type="Text" name="txt_APrjNumPart" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				Particapants were assigned.
			</td>
		</tr>
		<tr>
			<td>
				<input type="Text" name="txt_APrjNA" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				DID NOT answer&nbsp;which is&nbsp;
				<input type="Text" name="txt_APrjNAP" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				;
			</td>
		</tr>
		<tr>
			<td>
				<input type="Text" name="txt_APrjPA" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				PARTIALLY answered, which is&nbsp;
				<input type="Text" name="txt_APrjPAP" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				;
			</td>
		</tr>
		<tr>
			<td>
				<input type="Text" name="txt_APrjCA" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				COMPLETED survey,which is&nbsp;
				<input type="Text" name="txt_APrjCAP" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				.
			</td>
		</tr>
		</table> 	
	</td>
</tr>
</table>
<!--- ************** Current Projects ************************************* --->
<br>
<!--- ************** Archived Projects ************************************ --->
<table align="center" width="70%" cellspacing="2" cellpadding="2" border="0">
<th bgcolor="Teal">
	<font color="#F7E49D" size="-1">
		List of Archived Projects&nbsp;&nbsp;
		(Total:&nbsp;<cfoutput>#spr_InactPrjsForOverview.recordCount#</cfoutput>)
	</font>
</th>
<th bgcolor="Teal"><font color="#F7E49D" size="-1">Project Details</font></th>
<tr>
	<td width="30%">
		<select name="s_IPrjs" size="5" 
				onfocus="of_Focus(this.name)"
				onchange="of_chngIPrj(this.options[selectedIndex].value)"
				>
			<option></option>
		</select>
		<br>
		<cfinclude template="cb_ArchiveFrom.cfm">
	</td>
	<td width="70%" class="Brown8">
		<table class="Brown8">
		<tr>
			<td>
				Project&nbsp;<input type="Text" name="txt_IPrjName" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				
		<tr>
			<td>
				Created by&nbsp;
				<input type="Text" name="txt_IPrjCreator" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				.
				<!--- Project Managers:&nbsp; --->
				<input type="hidden" name="txt_IPrjMngr" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
			</td>
		</tr>
		<tr>
			<td>
				Project Start Date:&nbsp;
				<input type="Text" name="txt_IPrjSDate" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				,&nbsp;End Date&nbsp;
				<input type="Text" name="txt_IPrjEDate" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				,&nbsp;total of&nbsp;
				<input type="Text" name="txt_IPrjDuration" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				days.
			</td>
		</tr>
		<tr>
			<td>
				<input type="Text" name="txt_IPrjNumPart" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				Particapants were assigned.
			</td>
		</tr>
		<tr>
			<td>
				<input type="Text" name="txt_IPrjNA" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				DID NOT answer&nbsp;which is&nbsp;
				<input type="Text" name="txt_IPrjNAP" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				;
			</td>
		</tr>
		<tr>
			<td>
				<input type="Text" name="txt_IPrjPA" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				PARTIALLY answered, which is&nbsp;
				<input type="Text" name="txt_IPrjPAP" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				;
			</td>
		</tr>
		<tr>
			<td>
				<input type="Text" name="txt_IPrjCA" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				COMPLETED survey,which is&nbsp;
				<input type="Text" name="txt_IPrjCAP" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none; font-size: xx-small;">
				.
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
<!--- ************** Archived Projects ************************************ --->
<!--- ************** Buttons ********************************************** --->
<table align="center" width="70%" cellspacing="2" cellpadding="2" border="0">
<tr>
    <td align="right">
        <table cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_Menu.cfm"></td>
        </tr>
        </table>
    </td>
</tr>
</table>
<!--- ************** Buttons ********************************************** --->
</form>
</body>
<script language="JavaScript">
//------------------------------------------------------------------------------
if (rowsAPrjs == 0)
{with(self.document.forms[0])
	{
		of_InitialValue ("s_APrjs", -1, "== No Active Projects ==", 0);
	}//end of with
}
else
{
	of_InitialValue ("s_APrjs", -1, "== Make Selection ==", 0);
	of_populateAPrjs(1);
}

//------------------------------------------------------------------------------
if (rowsIPrjs == 0)
{with(self.document.forms[0])
	{
		of_InitialValue ("s_IPrjs", -1, "== No Archived Projects ==", 0);
	}//end of with
}
else
{
	of_InitialValue ("s_IPrjs", -1, "== Make Selection ==", 0);
	of_populateIPrjs(1);
}
//------------------------------------------------------------------------------
of_chngAPrj("-1");
of_chngIPrj("-1");
//self.document.forms[0].s_APrjs.options[0].selected = true;
//------------------------------------------------------------------------------
</script>

</html>
