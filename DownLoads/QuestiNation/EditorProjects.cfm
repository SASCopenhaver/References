<script language="JavaScript" src="JS/of_setYears.js"></script>
<script language="JavaScript" src="JS/of_setMonths.js"></script>
<script language="JavaScript" src="JS/of_setDays.js"></script>
<script language="JavaScript" src="JS/arrayMonths.js"></script>

<script language="JavaScript" src="JS/of_set_0_Row_Start_Dates.js"></script>

<cfwddx action="WDDX2CFML" input="#client.sprWDDX_PrjsStat#" output="spr_PrjsStat">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_PrjsStat")> --->
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllPrjs#" output="spr_AllPrjs">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_AllPrjs")> --->

<!---  spr_PrjAccess could bring the following:     
OrgID       PRJACCESSDESCR                          
----------- ----------------------------------------
          0 === Create New Project ===              
        ALL View/Edit All Projects                  
        NA  View/Edit NOT Assigned Projects         
          2 View/Edit Project Assigned To ECA       
          3 View/Edit Project Assigned To IIT       
         -2 View Closed Project Assigned to ECA     
         -3 View Closed Project Assigned to IIT     
                                                --->             

<script language="JavaScript">
var today      = new Date();
var todayYear  = today.getYear();
var todayMonth = today.getMonth()+1;
var todayDate  = today.getDate();
var vTodayMlsec = today.getTime();
//alert(todayYear+"  "+todayMonth+" "+todayDate);
var startYear, startMonth, startDay;//, endYear, endMonth, endDay;

//----------------------------------------------------------------------------//
<cfwddx action="CFML2JS" input="#spr_PrjsStat#" toplevelvariable="tlv_PrjsStat">
var rowsPrjsStat = tlv_PrjsStat.getRowCount();
function holdPrjsStat (aOrgID, aPrjStatus)
    {this.aOrgID = aOrgID; this.aPrjStatus = aPrjStatus}
arrayPrjsStat = new Array;
for (var ps=0; ps<rowsPrjsStat; ps++)//ps - Project Status
{
    arrayPrjsStat[ps] = new holdPrjsStat(tlv_PrjsStat.orgid[ps], 
                                         tlv_PrjsStat.prjstatus[ps])
}
//----------------------------------------------------------------------------//
<cfwddx action="CFML2JS" input="#spr_AllPrjs#" toplevelvariable="tlv_AllPrjs">
var rowsAllPrjs = tlv_AllPrjs.getRowCount();
var vOne;
function holdAllPrjs(aPrjID, aPrjDescr, aPrjSDate, aPrjEDate, aPrjAnswered, aPrjBrfDescr, aOrgID, aAssignedToOrg)
{
    this.aPrjID       = aPrjID;
    this.aPrjDescr    = aPrjDescr;
    this.aPrjSDate    = aPrjSDate;
    this.aPrjEDate    = aPrjEDate;
    this.aPrjAnswered = aPrjAnswered;
    this.aPrjBrfDescr = aPrjBrfDescr;
    this.aOrgID       = aOrgID;
    this.aAssignedToOrg  = aAssignedToOrg;
}
arrayAllPrjs = new Array(holdAllPrjs.length);
var vAllPrjsOrgID;
for (var p=0; p<rowsAllPrjs; p++)
{
   vEndDateMlsec = Date.parse(tlv_AllPrjs.end_date[p]);
   deltaDate = parseInt(vEndDateMlsec, 10) - parseInt(vTodayMlsec, 10);
   if (deltaDate < 0){vOne = -1} else {vOne = 1}
   
   if( isNaN(tlv_AllPrjs.orgid[p]) ) {vAllPrjsOrgID = tlv_AllPrjs.orgid[p]}
   else {vAllPrjsOrgID = tlv_AllPrjs.orgid[p]*vOne}
   
   arrayAllPrjs[p] = new holdAllPrjs(
                              tlv_AllPrjs.ids[p],
                              tlv_AllPrjs.descriptions[p],
                              tlv_AllPrjs.start_date[p],
                              tlv_AllPrjs.end_date[p],
                              tlv_AllPrjs.anybody_answered[p],
                              tlv_AllPrjs.prjbrfdescr[p],
                              vAllPrjsOrgID,
                              tlv_AllPrjs.assignedtoorg[p]
                              );
}
//----------------------------------------------------------------------------//
function of_populatePrjsStatus(){with(self.document.forms[0]){
    for (var ps=0; ps<rowsPrjsStat; ps++)
    {
        optionPS = new Option;
        optionPS.value = arrayPrjsStat[ps].aOrgID;
        optionPS.text  = arrayPrjsStat[ps].aPrjStatus;
						//arrayPrjsStat[ps].aOrgID+"  "+arrayPrjsStat[ps].aPrjStatus;
        s_PrjsStat.options[ps] = optionPS;
    }
    
}}
//----------------------------------------------------------------------------//
function changePrjsStat(argOrgID){with(self.document.forms[0]){
    //**************************************************************************
    if (argOrgID == 0)// Create new project
        {
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", 0, "*** Create New Project ***", 0);
            s_Prjs.options.disabled = true;
            
            txt_ProjDescr.value = "";
            of_set_0_Row_Start_Dates("Y","Y","Y");
            txt_ResearchLength.value = 14;
            of_setYears(todayYear);
            
            txt_ProjDescr.focus();
        }
    //**************************************************************************
    else if (argOrgID == "ALL")//All Projects
        {
            s_Prjs.options.disabled = false;
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", 0, "=== Select Project ===", 0);
            for (var p=0; p<rowsAllPrjs; p++)
            {
                optionP = new Option;
                optionP.value = arrayAllPrjs[p].aPrjID;
                optionP.text  = arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;
								//arrayAllPrjs[p].aPrjID+"  "+arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg+"("+arrayAllPrjs[p].aOrgID+")";
                s_Prjs.options[p+1] = optionP;
            }
            txt_ProjDescr.value = "";
            of_set_0_Row_Start_Dates("Y","Y","Y");
            of_setYears(todayYear);
        }
    //**************************************************************************
    else if (argOrgID == "NA")//Created but Not assigned projects
        {
        //alert(argOrgID)
            s_Prjs.options.disabled = false;
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", 0, "=== Select Project ===", 0);
            var ps = 1;//ps - Project Selected
            for (var p=0; p<rowsAllPrjs; p++)
            {
                if (argOrgID == arrayAllPrjs[p].aOrgID)
                {
                    optionP = new Option;
                    optionP.value = arrayAllPrjs[p].aPrjID;
                    optionP.text  = arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;
									//arrayAllPrjs[p].aPrjID+"  "+arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg+"("+arrayAllPrjs[p].aOrgID+")";
                    s_Prjs.options[ps] = optionP;
                    ps++;
                }
            }
        
            txt_ProjDescr.value = "";
            of_set_0_Row_Start_Dates("Y","Y","Y");
            of_setYears(todayYear);
        
        } 
    //**************************************************************************
    else if (argOrgID > 0)
        {
            //alert(argOrgID)
            
            s_Prjs.options.disabled = false;
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", 0, "=== Select Project ===", 0);
            var ps = 1;//ps - Project Selected
            for (var p=0; p<rowsAllPrjs; p++)
            {
                if (argOrgID == arrayAllPrjs[p].aOrgID)// && arrayAllPrjs[p].aPrjEDate >= )
                {
                //alert(arrayAllPrjs[p].aPrjEDate)
                    optionP = new Option;
                    optionP.value = arrayAllPrjs[p].aPrjID;
                    optionP.text  = arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;
							//arrayAllPrjs[p].aPrjID+"  "+arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg+"("+arrayAllPrjs[p].aOrgID+")";
                    s_Prjs.options[ps] = optionP;
                    ps++;
                }
            }
        
            txt_ProjDescr.value = "";
            of_set_0_Row_Start_Dates("Y","Y","Y");
            of_setYears(todayYear);
        
        } 
    //**************************************************************************
    else if (argOrgID < 0)
        {
            s_Prjs.options.disabled = false;
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", 0, "=== Select Project ===", 0);
            var ps = 1;//ps - Project Selected
            for (var p=0; p<rowsAllPrjs; p++)
            {
                if (argOrgID == arrayAllPrjs[p].aOrgID)// && arrayAllPrjs[p].aPrjEDate)
                {
                    optionP = new Option;
                    optionP.value = arrayAllPrjs[p].aPrjID;
                    optionP.text  = arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;
								//arrayAllPrjs[p].aPrjID+"  "+arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg+"("+arrayAllPrjs[p].aOrgID+")";
                    s_Prjs.options[ps] = optionP;
                    ps++;
                }
            }
        
            txt_ProjDescr.value = "";
            of_set_0_Row_Start_Dates("Y","Y","Y");
            of_setYears(todayYear);
        
        }
}}
//----------------------------------------------------------------------------//
function of_setPrjDetails(argPrjID){with (self.document.forms[0]){
//alert(argPrjID)

if (argPrjID == 0)
{
    txt_ProjDescr.value = "";
    of_set_0_Row_Start_Dates("Y","Y","Y");
    txt_ResearchLength.value = "";
}

else
{
    for (var p=0; p<rowsAllPrjs; p++)
    {
        if (argPrjID == arrayAllPrjs[p].aPrjID)
        {
            txt_ProjDescr.value = arrayAllPrjs[p].aPrjDescr;
            of_set_0_Row_Start_Dates("Y","Y","Y");
            
            startYear  = arrayAllPrjs[p].aPrjSDate.substr(6);
            startMonth = arrayAllPrjs[p].aPrjSDate.substr(0,2);
            startDay   = arrayAllPrjs[p].aPrjSDate.substr(3,2);
            
            //alert(startYear+"  "+startMonth+"  "+startDay)
            
            //******************************************************************
            
            of_setYears(startYear);
            
            for (var y=0; y<s_StartYears.options.length; y++)
            {
                if(startYear == s_StartYears.options[y].value)
                {
                    s_StartYears.options[y].selected = true;
                }
            }
            //******************************************************************
            //var PrjID = s_Prjs.options[s_Prjs.options.selectedIndex].value;
            //alert(PrjID)
            
            of_setMonths(startYear);
            for (var m=0; m<s_StartMonths.options.length; m++)
            {
                if (startMonth == s_StartMonths.options[m].value)
                {
                    s_StartMonths.options[m].selected = true;
                }
            }
            //******************************************************************
            
            of_setDays(startMonth);
            for (var d=0; d<s_StartDays.options.length; d++)
            {
                if (startDay == s_StartDays.options[d].value)
                {
                    s_StartDays.options[d].selected = true;
                }
            }
            //******************************************************************
            var tempResearchLength = (Date.parse(arrayAllPrjs[p].aPrjEDate) - Date.parse(arrayAllPrjs[p].aPrjSDate))/(1000*60*60*24);
            tempResearchLength = Math.round(tempResearchLength);
            txt_ResearchLength.value = tempResearchLength;
            break;
        }
    }
}

}}
//----------------------------------------------------------------------------//
function of_Submit(){with (self.document.forms[0]){
    if (vValidationPassed == "YES")
    {
        s_Prjs.options.disabled = false;
        action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=InsUpdPrjs";
        submit();
    }
}}
//----------------------------------------------------------------------------//
function of_Delete() {with (self.document.forms[0]){
	var vPrjID = s_Prjs.options[s_Prjs.options.selectedIndex].value;
	if (vPrjID == 0)
	{
		alert("Illegal operation.  Request denied.");
	}
	else
	{
		var vPrjName = txt_ProjDescr.value;
		if (confirm("Selected Project:\n '"+vPrjName+"'\n"+
		"will be permanently deleted.\n\nDo you want to continue?") == true)
		{
			//alert("true");
			action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=DeletePrj";
        	submit();
		}
	}

}}
//----------------------------------------------------------------------------//
</script>

<cfloop index="i" from="1" to="1" step="1"><br></cfloop>

<form name="f_Prj" method="post">

<table align="center" width="50%" cellspacing="2" cellpadding="2" border="0">
<tr>
    <td class="Brown9">Project Status:<br>
        <select name="s_PrjsStat" onchange="changePrjsStat(this.options[selectedIndex].value)">
            <option></option>
        </select>
    </td>
</tr>
<tr>
    <td class="Brown9">Project Title:<br>
        <select name="s_Prjs" onchange="of_setPrjDetails(this.options[selectedIndex].value)">
            <option></option>
        </select>
      
     </td>
</tr>
<tr>
    <td class="Brown9">Project Name and Brief Description:<br>
        <input type="Text" name="txt_ProjDescr" value="" size="90"
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
    </td>
</tr>
<tr>
    <td valign="top" class="Brown9" width="65%">
        <em>Research Start Date:</em><br>
        Year:
        <select name="s_StartYears" onchange="of_setMonths(this.options[selectedIndex].value)">
            <option></option>
        </select>
        &nbsp;&nbsp;
        Month:
        <select name="s_StartMonths" onchange="of_setDays(this.options[selectedIndex].value)">
            <option value="0"></option>
        </select>
        &nbsp;&nbsp;
        Day:
        <select name="s_StartDays"><option></option></select>
        &nbsp;&nbsp;
    </td>
</tr>
<tr><td>&nbsp;
    <!--- 
    h_StartYear=<input type="text" name="h_StartYear"  value=""><br>
    h_StartMonth=<input type="text" name="h_StartMonth" value=""><br>
    h_StartDay=<input type="text" name="h_StartDay"   value="">
     --->
    </td>
</tr>
<tr>
    <td valign="top" class="Brown9">
        <em>Project Research Duration</em>&nbsp;&nbsp;
        <input name="txt_ResearchLength" type="Text" value="14" size="3"
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
        &nbsp;&nbsp;
        <em>Days</em>
    </td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
    <td align="right">
        <table cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_Menu.cfm"></td>
            <td> <cfinclude template="cb_SavePrjs.cfm"></td>
            <td> <cfinclude template="cb_Reset.cfm"></td>
			<td> <cfinclude template="cb_DeleteInEditorProjects.cfm"></td>
        </tr>
        </table>
    </td>
</tr>
</table>
</form>

<cfif isDefined("client.strWDDX_InsUpdPrj")>
    <cfwddx action="WDDX2CFML" input="#client.strWDDX_InsUpdPrj#" output="spr_InsUpdPrj">
    <cfset temp = DeleteClientVariable("strWDDX_InsUpdPrj")>
    <script language="JavaScript">
	//
        //----------------------------------------------------------------------
        of_populatePrjsStatus();
        //----------------------------------------------------------------------
        for (var ps=0; ps<self.document.forms[0].s_PrjsStat.options.length; ps++)
        {   with (self.document.forms[0]){
		//alert(<cfoutput>#spr_InsUpdPrj.OrgID#</cfoutput>)
            if("<cfoutput>#spr_InsUpdPrj.OrgID#</cfoutput>" == s_PrjsStat.options[ps].value)
            {
                s_PrjsStat.options[ps].selected = true;
            }
        }}
        //----------------------------------------------------------------------
        changePrjsStat("<cfoutput>#spr_InsUpdPrj.OrgID#</cfoutput>")
        //----------------------------------------------------------------------
        for (var p=0; p<self.document.forms[0].s_Prjs.options.length; p++)
        {   with (self.document.forms[0]){
            if ("<cfoutput>#spr_InsUpdPrj.IDS#</cfoutput>" == s_Prjs.options[p].value)
            {
                s_Prjs.options[p].selected = true;
            }
        }}
        //----------------------------------------------------------------------
        of_setPrjDetails("<cfoutput>#spr_InsUpdPrj.IDS#</cfoutput>");
        //----------------------------------------------------------------------
    </script>
<cfelse>
    <script language="JavaScript">
        of_populatePrjsStatus();
        changePrjsStat(0);
    </script>
</cfif> 