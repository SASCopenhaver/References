<!--- ==========================================================================
ABBREVIATIONS USED:                                                             
1. rd or RD -- Research Dates;                                                  
2. For s_PartsSource and s_PartsTarget:                                         
    S - Source;                                                                 
    T - Target;                                                                 
    N - Not for any "move" between s_PartsSource or s_PartsTarget.  Used for the first row only.
3. PA - Participants_Answers                                                    
4. UserST - Participant Source or Target                                        
=========================================================================== --->

<cfwddx action="WDDX2CFML" input="#client.sprWDDX_PrjsStat#"       output="spr_PrjsStat">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_PrjsStat")> --->
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllPrjs#"        output="spr_AllPrjs">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_AllPrjs")> --->
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllOrgs#"        output="spr_AllOrgs">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_AllOrgs")> --->
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllUsers#"       output="spr_AllUsers">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_AllUsers")> --->
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_UsersInAnswers#" output="spr_UsersInAnswers">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_UsersInAnswers")> --->
<cfwddx action="WDDX2CFML" input="#client.sprWDDX_AllPrjMngrs#"    output="spr_AllPrjMngrs">
<!--- <cfset temp = DeleteClientVariable("sprWDDX_AllPrjMngrs")> --->

<cfwddx action="WDDX2CFML" input="#client.strWDDXAppUser#" output="strAppUser">
<script language="JavaScript">
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
var vValidationPassed;

var vTargetLength;
var arrayTargetIDs = new Array;
var arrayTargetMngrIDs = new Array;
var vUsersInTarget;
var vMngrsInTarget;
var vIfMngrsChecked = "NO";

var vOrgIDFromPrjTitle; //OrgID for Source or Target
var vPrjSuper = "";
var today = new Date();
var vTodayMlsec = today.getTime();
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
<cfwddx action="CFML2JS" input="#spr_AllPrjMngrs#" toplevelvariable="tlv_AllPrjMngrs">
var rowsAllPrjMngrs = tlv_AllPrjMngrs.getRowCount();
function holdAllPrjMngrs (aPrjID, aUserID)
    { this.aPrjID = aPrjID; this.aUserID = aUserID; }
arrayAllPrjMngrs = new Array;
arrayFPrjMngrs = new Array;
for (var mn=0; mn<rowsAllPrjMngrs; mn++)
{
    arrayAllPrjMngrs[mn] = new holdAllPrjMngrs ( 
                                tlv_AllPrjMngrs.prj_id[mn],
                                tlv_AllPrjMngrs.user_id[mn]
                                )
}   
//----------------------------------------------------------------------------//
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
//----------------------------------------------------------------------------//
<cfwddx action="CFML2JS" input="#spr_AllOrgs#" toplevelvariable="tlv_AllOrgs">
var rowsAllOrgs = tlv_AllOrgs.getRowCount();
function holdAllOrgs (aOrgID, aOrgAbbr, aOrgFullName)
{ this.aOrgID = aOrgID;  
  this.aOrgAbbr = aOrgAbbr;  
  this.aOrgFullName = aOrgFullName; 
}
arrayAllOrgs = new Array();
for (var o=0; o<rowsAllOrgs; o++)
{ arrayAllOrgs[o] = new holdAllOrgs
                        (
                            tlv_AllOrgs.orgid[o],
                            tlv_AllOrgs.orgabbr[o],
                            tlv_AllOrgs.orgfullname[o]
                         )
}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
<cfwddx action="CFML2JS" input="#spr_AllUsers#" toplevelvariable="tlv_AllUsers">
var rowsAllUsers = tlv_AllUsers.getRowCount();
function holdUsers( aUserID,    aUserFName,    
                    aUserLName, aUserPass,     
                    aUserEmail, aUserActInact, 
                    aUserOrgID, aUserST) 
{
	this.aUserID      = aUserID;     this.aUserFName   = aUserFName;   
    this.aUserLName   = aUserLName;  this.aUserPass    = aUserPass;     
    this.aUserEmail    = aUserEmail; this.aUserActInact= aUserActInact; 
    this.aUserOrgID   = aUserOrgID;  this.aUserST = aUserST;
}
arrayAllUsers = new Array();
arrayFUsers = new Array(); //FUsers - Filtered Users
for (var u=0; u<rowsAllUsers; u++)
{
arrayAllUsers[u] = new holdUsers( tlv_AllUsers.userid[u],    tlv_AllUsers.userfname[u],    
                                  tlv_AllUsers.userlname[u], tlv_AllUsers.userpass[u],     
                                  tlv_AllUsers.useremail[u], tlv_AllUsers.useractinact[u], 
                                  tlv_AllUsers.userorgid[u], "S"
                                 );
}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
<cfwddx action="CFML2JS" input="#spr_UsersInAnswers#" toplevelvariable="tlv_UsersInAnswers">
var rowsUsersInAnswers = tlv_UsersInAnswers.getRowCount();
function holdUsersInAnswers (aUserID, aPrjID, aLoopCounter)
            {this.aUserID = aUserID;
             this.aPrjID = aPrjID;
             this.aLoopCounter = aLoopCounter;   
            }
arrayUsersInAnswers = new Array();
arrayFUsersInAnswers = new Array();//F - filtered
for (var ua=0; ua<rowsUsersInAnswers; ua++)
{ 
    arrayUsersInAnswers[ua] = new holdUsersInAnswers
                   (tlv_UsersInAnswers.userid[ua],
                    tlv_UsersInAnswers.prjid[ua],
                    tlv_UsersInAnswers.loopcounter[ua]
                    )

}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_populatePrjsStatus(){with(self.document.forms[0]){
    for (var ps=0; ps<rowsPrjsStat; ps++)
    {
        //alert(ps)
        optionPS = new Option;
        //optionPS.value = arrayPrjsStat[ps].aOrgID;
        if (arrayPrjsStat[ps].aOrgID == 0)
        {
            optionPS.value = -1;
            optionPS.text  = "=== Select Project Status ===";
							//"-1"+"  "+"=== Select Project Status ===";
        }
        else
        {
            optionPS.value = arrayPrjsStat[ps].aOrgID;
            optionPS.text  = arrayPrjsStat[ps].aPrjStatus;
						//arrayPrjsStat[ps].aOrgID+"  "+arrayPrjsStat[ps].aPrjStatus;
        }
        s_PrjsStat.options[ps] = optionPS;
    }
    
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_populateOrgs(){with (self.document.forms[0]){
        for (var o=0; o<rowsAllOrgs; o++)
        {
            optionOrgs = new Option;
            optionOrgs.value = arrayAllOrgs[o].aOrgID;
            optionOrgs.text  = arrayAllOrgs[o].aOrgAbbr + " - " + arrayAllOrgs[o].aOrgFullName;
            s_Orgs.options[o+1] = optionOrgs;
        }
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//


function of_changePrjsStat(argOrgID){with(self.document.forms[0]){
	
    //**************************************************************************
    if (argOrgID == -1)// Create new project
        {
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", -1, "=== Select Project Title ===", 0);
            s_Prjs.options.disabled = true;
            
            // Organizations:
            s_Orgs.options[0].selected = true;            
            s_Orgs.options.disabled = true;
            
            txt_PrjDescr.value = "";
                       
            //cbx_Mngr.checked = false;
            //cbx_Mngr.disabled = true;
            
            of_setSourceAndTarget(-1);
        }

    //**************************************************************************
    else if (argOrgID == "ALL")//All Projects
        {
            // Project Title:
            s_Prjs.options.disabled = false;
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", -1, "=== Select Project Title===", 0);
            for (var p=0; p<rowsAllPrjs; p++)
            {
                optionP = new Option;
                optionP.value = arrayAllPrjs[p].aPrjID;
                optionP.text  = arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;
						//arrayAllPrjs[p].aPrjID+"  "+arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;//+"(OrgID="+arrayAllPrjs[p].aOrgID+")";
                s_Prjs.options[p+1] = optionP;
            }
            
            // Project Description:           
            txt_PrjDescr.value = "";
            
            // Organizations:
            s_Orgs.options[0].selected = true;
            s_Orgs.options.disabled = true//false;

            //.checked = false;
            //cbx_Mngr.disabled = true;
            of_setSourceAndTarget(-1);
        }
    //**************************************************************************
    else if (argOrgID == "NA")//Created but Not assigned projects
        {
        //alert(argOrgID)
            s_Prjs.options.disabled = false;
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", -1, "=== Select Project Title===", 0);
            var ps = 1;//ps - Project Selected
            for (var p=0; p<rowsAllPrjs; p++)
            {
                if (argOrgID == arrayAllPrjs[p].aOrgID)
                {
                    optionP = new Option;
                    optionP.value = arrayAllPrjs[p].aPrjID;
                    optionP.text  = arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;
								//arrayAllPrjs[p].aPrjID+"  "+arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;//+"("+arrayAllPrjs[p].aOrgID+")";
                    s_Prjs.options[ps] = optionP;
                    ps++;
                }
            }
        
            txt_PrjDescr.value = "";
            s_Orgs.options[0].selected = true;
            s_Orgs.options.disabled = true//false;
            //cbx_Mngr.checked = false;
            //cbx_Mngr.disabled = true;
            of_setSourceAndTarget(-1);
        } 
    //**************************************************************************
    else if (argOrgID > 0)
        {
		//alert(argOrgID);
            s_Prjs.options.disabled = false;
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", -1, "=== Select Project Title===", 0);
            var ps = 1;//ps - Project Selected
            for (var p=0; p<rowsAllPrjs; p++)
            {
                if (argOrgID == arrayAllPrjs[p].aOrgID)
                {
                //alert(arrayAllPrjs[p].aPrjEDate)
                    optionP = new Option;
                    optionP.value = arrayAllPrjs[p].aPrjID;
                    optionP.text  = arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;
								//arrayAllPrjs[p].aPrjID+"  "+arrayAllPrjs[p].aPrjBrfDescr+"  "+arrayAllPrjs[p].aAssignedToOrg;//+"("+arrayAllPrjs[p].aOrgID+")";
                    s_Prjs.options[ps] = optionP;
                    ps++;
                }
            }
        
            txt_PrjDescr.value = "";
            s_Orgs.options[0].selected = true;
            s_Orgs.options.disabled = true//false;
            //cbx_Mngr.checked = false;
            //cbx_Mngr.disabled = true;
            of_setSourceAndTarget(-1);
            
            
        } 
    //**************************************************************************
    else if (argOrgID < -1)
        {
            
            s_Prjs.options.disabled = false;
            s_Prjs.options.length = 1;
            of_InitialValue ("s_Prjs", -1, "=== Select Project Title===", 0);
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
        
            txt_PrjDescr.value = "";
            s_Orgs.options[0].selected = true;
            s_Orgs.options.disabled = true//false;
            //cbx_Mngr.checked = false;
            //cbx_Mngr.disabled = true;
            of_setSourceAndTarget(-1);
        }
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_setPrjDetails(argPrjID){with (self.document.forms[0]){
//alert(argPrjID)
    
    if (argPrjID == -1)
    { 
        txt_PrjDescr.value = ""; 
        s_Orgs.options[0].selected = true;
        s_Orgs.options.disabled = true;
        
        of_setSourceAndTarget(argPrjID);
    }
    
    else
    {
        s_Orgs.options.disabled = false;
        var vOrgID;
        // Project Description
        for (var p=0; p<rowsAllPrjs; p++)
        {
            if (argPrjID == arrayAllPrjs[p].aPrjID) 
            { 
                txt_PrjDescr.value = arrayAllPrjs[p].aPrjDescr;
                
                if( arrayAllPrjs[p].aOrgID < 0 )
                {
                    vOrgID = arrayAllPrjs[p].aOrgID*(-1);
                    //alert(arrayAllPrjs[p].aOrgID);
                }
                else 
                {
                    vOrgID = arrayAllPrjs[p].aOrgID;
                    //alert(arrayAllPrjs[p].aOrgID);
                }
                //vOrgIDFromPrjTitle = arrayAllPrjs[p].aOrgID;
                break; 
            } 
        }
        //alert(vOrgID)
        of_changeOrg(vOrgID);
    }
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

function of_changeOrg(argOrgID){with (self.document.forms[0]){
//alert(argOrgID)
    if (isNaN(argOrgID))//argOrgID = "NA"
    {
        s_Orgs.options[0].selected = true;
    }
    else
    {
        for (var o=0; o<s_Orgs.options.length; o++)
        {
            if(s_Orgs.options[o].value == argOrgID)
            {
                s_Orgs.options[o].selected = true;
                break;
            }
        }
        
    }
    of_setSourceAndTarget(argOrgID);
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_setSourceAndTarget(argOrgID){with (self.document.forms[0]){

    var vPrjID = s_Prjs.options[s_Prjs.options.selectedIndex].value;
    
    for (var p=0; p<rowsAllPrjs; p++)
    {
        if (vPrjID == arrayAllPrjs[p].aPrjID)
        {
            vOrgIDFromPrjTitle = arrayAllPrjs[p].aOrgID;
            break;
        }
    }
    //alert("vOrgIDFromPrjTitle = "+vOrgIDFromPrjTitle) 
    
    if (vOrgIDFromPrjTitle == "NA")// Selected Project is NOT assigned
    {   s_Source.options.length = 1;
        s_Target.options.length = 1;
        of_InitialValue ("s_Source",-1, "=== No Available Participants ===", 0);
        of_InitialValue ("s_Target",-1, "=== No Selected Participants ===",  0);
        s_Source.disabled = true;
        s_Target.disabled = true;
        txt_Source.value = (s_Source.options.length - 1);
        txt_Target.value = (s_Target.options.length - 1);
        
        var vOrgIDFromOrgs = s_Orgs.options[s_Orgs.options.selectedIndex].value;
        if (vOrgIDFromOrgs>0)
        {
            of_FilterUsers(vOrgIDFromOrgs);
            s_Source.disabled = false;
            for (var fu=0; fu<arrayFUsers.length; fu++)
            {   if (arrayFUsers[fu].aUserActInact == "I") {vActInact = "   (inactive)";}
                else {vActInact = "";}
                optionS = new Option;
                optionS.value = arrayFUsers[fu].aUserID;
				optionS.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
							//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
                s_Source.options[fu] = optionS;
            }
            txt_Source.value = s_Source.options.length;
        }
    }
    else 
    {//else if (vOrgIDFromPrjTitle < -1)// Selected Project has End Date lesser then SYSDATE
     //else if (vOrgIDFromPrjTitle > 0)// Selected Project is CURRENT
        if (vOrgIDFromPrjTitle < 0){vOrgIDFromPrjTitle = vOrgIDFromPrjTitle*(-1)};
        
        if (argOrgID == -1)//"=== Select Organization ===" row is selected
        {   s_Source.options.length = 1;
            s_Target.options.length = 1;
            of_InitialValue ("s_Source",-1, "=== No Available Participants ===", 0);
            of_InitialValue ("s_Target",-1, "=== No Selected Participants ===",  0);
            s_Source.disabled = true;
            s_Target.disabled = true;
            
            txt_Source.value = (s_Source.options.length - 1);
            txt_Target.value = (s_Target.options.length - 1);
        }
        else //
        {
            of_FilterUsers(argOrgID);
            
            of_FilterUsersInAnswers(vPrjID);
            
            of_FilterPrjMngrs(vPrjID);
            
            var vMngr = "";
            
            //detrmine records for Source and Target:
            for (var fua=0; fua<arrayFUsersInAnswers.length; fua++)//fua - filtered Users in table Answers
            {
                for (var fu=0; fu<arrayFUsers.length; fu++)//fu - filtered users
                {
                    if(arrayFUsersInAnswers[fua].aUserID == arrayFUsers[fu].aUserID)
                    {
                        arrayFUsers[fu].aUserST = "T";
                        //alert(arrayFUsers[fu].aUserID)
                    }
                }
            }
            
            //show records in Source and Target:
            var s=0;
            var t=0;
            
            s_Source.disabled = false;
            s_Target.disabled = false;
            
            s_Source.options.length = 1;
            s_Target.options.length = 1;
            
            for (var fu=0; fu<arrayFUsers.length; fu++)
            {
                if (arrayFUsers[fu].aUserActInact == "I") {vActInact = "   (inactive)";}
                else {vActInact = "";}
                
                if (arrayFUsers[fu].aUserST == "S")
                {
                    optionS = new Option;
                    optionS.value = arrayFUsers[fu].aUserID;
                    optionS.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
								//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
                    s_Source.options[s] = optionS;
                    s++;
                }
                else if (arrayFUsers[fu].aUserST == "T")
                {
                    for (var fmn=0; fmn<arrayFPrjMngrs.length; fmn++)//fmn - filtered Project Managers
                    {
                        if (arrayFPrjMngrs[fmn].aUserID == arrayFUsers[fu].aUserID)
                        { vMngr = "   ***Manager***"; break; }
                        else
                        { vMngr = "";  }
                    }
                    
                    optionT = new Option;
                    optionT.value = arrayFUsers[fu].aUserID;
                    optionT.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact+vMngr;
								//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact+vMngr;
                    s_Target.options[t] = optionT;
                    //alert(vMngr)
                    t++;
                }
                
            }
            
            s_Orgs.disabled = true;
            
            if (s_Source.options.length == 0)
            {
                of_InitialValue ("s_Source",-1, "=== No Available Participants ===", 0);
                txt_Source.value = (s_Source.options.length - 1);
            }
            else
            {
                txt_Source.value = s_Source.options.length
            }
                        
            if (s_Target.options.length == 0)
            {
                of_InitialValue ("s_Target",-1, "=== No Selected Participants ===",  0);
                txt_Target.value = (s_Target.options.length - 1);
            }
            else
            {
                txt_Target.value = s_Target.options.length;
            }
        }
        
        
    }
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_FilterUsersInAnswers(argPrjID)
{
    arrayFUsersInAnswers.length = 0;//F - filtered
    var fua=0; //fua - filtered Users in table Answers
    for (var ua=0; ua<rowsUsersInAnswers; ua++)
    { 
        if (argPrjID == tlv_UsersInAnswers.prjid[ua])
        {
            arrayFUsersInAnswers[fua] = new holdUsersInAnswers
                       (tlv_UsersInAnswers.userid[ua],
                        tlv_UsersInAnswers.prjid[ua],
                        tlv_UsersInAnswers.loopcounter[ua]
                        )
            fua++;
        }
    }
    
}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_FilterUsers(argOrgID)
{
    arrayFUsers.length = 0;
    var fu = 0; //fu - filtered users
    for (var u=0; u<rowsAllUsers; u++)
    {
        if (argOrgID == arrayAllUsers[u].aUserOrgID)
        {
            arrayFUsers[fu] = new holdUsers( tlv_AllUsers.userid[u], tlv_AllUsers.userfname[u],    
                                  tlv_AllUsers.userlname[u], tlv_AllUsers.userpass[u],     
                                  tlv_AllUsers.useremail[u], tlv_AllUsers.useractinact[u], 
                                  tlv_AllUsers.userorgid[u], "S"
                                 );
           fu++;
        }
    }
}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_FilterPrjMngrs(argPrjID)
{
    arrayFPrjMngrs.length = 0;
    var fmn = 0; //fmn - filtered Project Managers
    for (var mn=0; mn<rowsAllPrjMngrs; mn++)
    {
        if (argPrjID == arrayAllPrjMngrs[mn].aPrjID)
        {
            arrayFPrjMngrs[fmn] = new holdAllPrjMngrs ( 
                                tlv_AllPrjMngrs.prj_id[mn],
                                tlv_AllPrjMngrs.user_id[mn]
                                );
            fmn++;
        }
    }
    //alert(arrayFPrjMngrs.length);
}

//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_MoveRecords(argWhatToDo){with (self.document.forms[0]){
    //argWhatToDo could receive the following values:
	//	"SelectedFromSource"
    //	"AllFromSource"
    //	"SelectedFromTarget"
    //	"AllFromTarget"
    var vValueInSource = s_Source.options[0].value;
    var vValueInTarget = s_Target.options[0].value;
    
    if (argWhatToDo == "SelectedFromSource")
    {
		if (vValueInSource == -1) {alert("Illegal operation.  Request denied.");}
		else 
		{
			var vCounterOfSelectedRows=0;
			
			for (var r=0; r<s_Source.options.length; r++)
			{
				
				if (s_Source.options[r].selected == true)
				{
					vCounterOfSelectedRows = 1;
					break;
				}
			}
			
			if (vCounterOfSelectedRows == 0)
			{alert("Illegal operation.  Request denied.");}
			else
			{of_SelectedFromSource();}
		}
    }
    //-------------------------------------
    else if (argWhatToDo == "AllFromSource")
    {
        if (vValueInSource == -1) {alert("Illegal operation.  Request denied.");}
        else {of_AllFromSource();}
    }
    //-------------------------------------
    else if (argWhatToDo == "SelectedFromTarget")
    {
        //if (vValueInTarget == -1) {alert("Illegal operation.  Request denied.");}
        //else {of_SelectedFromTarget();}
		if (vValueInTarget == -1) {alert("Illegal operation.  Request denied.");}
        else
		{
			var vCounterOfSelectedRows=0;
			
			for (var r=0; r<s_Target.options.length; r++)
			{
				
				if (s_Target.options[r].selected == true)
				{
					vCounterOfSelectedRows = 1;
					break;
				}
			}
			
			if (vCounterOfSelectedRows == 0)
			{alert("Illegal operation.  Request denied.");}
			else
			{of_SelectedFromTarget();}
		}
		
    }
    //-------------------------------------
    else if (argWhatToDo == "AllFromTarget")
    {
        if (vValueInTarget == -1) {alert("Illigal operation.  Request denied.");}
        else {of_AllFromTarget();}
    }
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_AllFromSource(){with (self.document.forms[0]){

    //--------------------------------------------------------------------------
    for (var fu=0; fu<arrayFUsers.length; fu++)
    { 
        arrayFUsers[fu].aUserST = "T"; 
    }
    //--------------------------------------------------------------------------
    s_Source.options.length = 1;
    of_InitialValue ("s_Source",-1, "=== No Available Participants ===", 0);
    s_Source.options[0].selected = false;
    s_Source.disabled = true;
    s_Target.disabled = false;
    //--------------------------------------------------------------------------
    var vPrjID = s_Prjs.options[s_Prjs.options.selectedIndex].value;
    for (var p=0; p<rowsAllPrjs; p++)
    {
        if (vPrjID == arrayAllPrjs[p].aPrjID)
        {
            vOrgIDFromPrjTitle = arrayAllPrjs[p].aOrgID;
            break;
        }
    }
    //--------------------------------------------------------------------------
    if (vOrgIDFromPrjTitle == "NA")
    {
        for (var fu=0; fu<arrayFUsers.length; fu++)
        {
            if (arrayFUsers[fu].aUserActInact == "I") {vActInact = "   (inactive)";}
            else {vActInact = "";}
            
            optionT = new Option;
            optionT.value = arrayFUsers[fu].aUserID;
            optionT.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
					//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
            s_Target.options[fu] = optionT;
        }
    }
    else
    {
        //----------------------------------------------------------------------
        if (vOrgIDFromPrjTitle < 0){vOrgIDFromPrjTitle = vOrgIDFromPrjTitle*(-1)};
        of_FilterPrjMngrs(vPrjID);
        //----------------------------------------------------------------------
        for (var fu=0; fu<arrayFUsers.length; fu++)
        {
            if (arrayFUsers[fu].aUserActInact == "I") {vActInact = "   (inactive)";}
            else {vActInact = "";}
            
            for (var fmn=0; fmn<arrayFPrjMngrs.length; fmn++)//fmn - filtered Project Managers
            {
                if (arrayFPrjMngrs[fmn].aUserID == arrayFUsers[fu].aUserID)
                { vMngr = "   ***Manager***"; break; }
                else
                { vMngr = "";  }
            }
            
            optionT = new Option;
            optionT.value = arrayFUsers[fu].aUserID;
            optionT.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact+vMngr;
					//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact+vMngr;
            s_Target.options[fu] = optionT;
        }
    }
    //--------------------------------------------------------------------------
    txt_Source.value = (s_Source.options.length - 1);
    txt_Target.value = s_Target.options.length;
    
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_SelectedFromSource(){with (self.document.forms[0]){
    for (var s=0; s<s_Source.options.length; s++)//s - Users in Source
    {
        if ( s_Source.options[s].selected )
        {
            for (var fu=0; fu<arrayFUsers.length; fu++)
            {
                if (s_Source.options[s].value == arrayFUsers[fu].aUserID)
                {
                    arrayFUsers[fu].aUserST = "T";
                    break;
                }
            }
        }
    }
    //--------------------------------------------------------------------------
    s_Source.options.length = 1;
    s_Target.options.length = 1;
    s_Source.disabled = false;
    s_Target.disabled = false;
    //--------------------------------------------------------------------------
    var vPrjID = s_Prjs.options[s_Prjs.options.selectedIndex].value;
    for (var p=0; p<rowsAllPrjs; p++)
    {
        if (vPrjID == arrayAllPrjs[p].aPrjID)
        {
            vOrgIDFromPrjTitle = arrayAllPrjs[p].aOrgID;
            break;
        }
    }
    //--------------------------------------------------------------------------
    if (vOrgIDFromPrjTitle == "NA")
    {
        var s=0;
        var t=0;
        for (var fu=0; fu<arrayFUsers.length; fu++)
        {
            if (arrayFUsers[fu].aUserActInact == "I") {vActInact = "   (inactive)";}
            else {vActInact = "";}
            
            if (arrayFUsers[fu].aUserST == "S")
            {
                optionS = new Option;
                optionS.value = arrayFUsers[fu].aUserID;
                optionS.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
							//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
                s_Source.options[s] = optionS;
                s++;
            }
            else if (arrayFUsers[fu].aUserST == "T")
            {
                optionT = new Option;
                optionT.value = arrayFUsers[fu].aUserID;
                optionT.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
							//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
                s_Target.options[t] = optionT;
                t++;
            }
        }
    }
    else
    {
        var s=0;
        var t=0;
        //----------------------------------------------------------------------
        if (vOrgIDFromPrjTitle < 0){vOrgIDFromPrjTitle = vOrgIDFromPrjTitle*(-1)};
        //of_FilterPrjMngrs(vPrjID);
        //----------------------------------------------------------------------
        
        for (var fu=0; fu<arrayFUsers.length; fu++)
        {
            if (arrayFUsers[fu].aUserActInact == "I") {vActInact = "   (inactive)";}
            else {vActInact = "";}
            
            if (arrayFUsers[fu].aUserST == "S")
            {
                optionS = new Option;
                optionS.value = arrayFUsers[fu].aUserID;
                optionS.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
							//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
                s_Source.options[s] = optionS;
                s++;
            }
            else if (arrayFUsers[fu].aUserST == "T")
            {
                for (var fmn=0; fmn<arrayFPrjMngrs.length; fmn++)//fmn - filtered Project Managers
                {
                    if (arrayFPrjMngrs[fmn].aUserID == arrayFUsers[fu].aUserID)
                    { vMngr = "   ***Manager***"; break; }
                    else
                    { vMngr = "";  }
                }
                
                optionT = new Option;
                optionT.value = arrayFUsers[fu].aUserID;
                optionT.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact+vMngr;
						//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact+vMngr;
                s_Target.options[t] = optionT;
                t++;
            }
        }
    }   
    
    //--------------------------------------------------------------------------
    if (s_Target.options.length == arrayFUsers.length)
    {
        of_InitialValue ("s_Source",-1, "=== No Available Participants ===", 0);
        s_Source.options[0].selected = false;
        s_Source.options.disabled = true;
        txt_Source.value = (s_Source.options.length - 1);
    }
    else
    {
        txt_Source.value = s_Source.options.length;
        txt_Target.value = s_Target.options.length;
    }
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

function of_AllFromTarget(){with (self.document.forms[0]){
    //--------------------------------------------------------------------------
    for (var fu=0; fu<arrayFUsers.length; fu++)
    { 
        arrayFUsers[fu].aUserST = "S"; 
    }
    //--------------------------------------------------------------------------
    s_Source.options.length = 1;
    s_Target.options.length = 1;
    of_InitialValue ("s_Target",-1, "=== No Selected Participants ===", 0);
    s_Target.options[0].selected = false;
    s_Source.disabled = false;
    s_Target.disabled = true;
    //--------------------------------------------------------------------------
    for (var fu=0; fu<arrayFUsers.length; fu++)
    {
        if (arrayFUsers[fu].aUserActInact == "I") {vActInact = "   (inactive)";}
        else {vActInact = "";}
        
        optionS = new Option;
        optionS.value = arrayFUsers[fu].aUserID;
        optionS.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
					//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
        s_Source.options[fu] = optionS;
    }
    
    
    
    //-------------------------------------------------------------------------
    txt_Source.value = s_Source.options.length;
    txt_Target.value = (s_Target.options.length - 1);
    
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_SelectedFromTarget(){with (self.document.forms[0]){
    for (var t=0; t<s_Target.options.length; t++)//t - Users in Target
    {
        if ( s_Target.options[t].selected )
        {
            for (var fu=0; fu<arrayFUsers.length; fu++)
            {
                if (s_Target.options[t].value == arrayFUsers[fu].aUserID)
                {
                    arrayFUsers[fu].aUserST = "S";
                    break;
                }
            }
        }
    }
    //--------------------------------------------------------------------------
    s_Source.options.length = 1;
    s_Target.options.length = 1;
    s_Source.disabled = false;
    s_Target.disabled = false;
    //--------------------------------------------------------------------------
    var vPrjID = s_Prjs.options[s_Prjs.options.selectedIndex].value;
    for (var p=0; p<rowsAllPrjs; p++)
    {
        if (vPrjID == arrayAllPrjs[p].aPrjID)
        {
            vOrgIDFromPrjTitle = arrayAllPrjs[p].aOrgID;
            break;
        }
    }
    //--------------------------------------------------------------------------
    if (vOrgIDFromPrjTitle == "NA")
    {
        var s=0;
        var t=0;
        for (var fu=0; fu<arrayFUsers.length; fu++)
        {
            //------------------------------------------------------------------
            if (arrayFUsers[fu].aUserActInact == "I") {vActInact = "   (inactive)";}
            else {vActInact = "";}
            //------------------------------------------------------------------
            if (arrayFUsers[fu].aUserST == "S")
            {
                optionS = new Option;
                optionS.value = arrayFUsers[fu].aUserID;
                optionS.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
						//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
                s_Source.options[s] = optionS;
                s++;
            }
            else if (arrayFUsers[fu].aUserST == "T")
            {
                optionT = new Option;
                optionT.value = arrayFUsers[fu].aUserID;
                optionT.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
						//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
                s_Target.options[t] = optionT;
                t++;
            }
            //------------------------------------------------------------------
        }
    }
    else
    {
    //----------------------------------------------------------------------
    if (vOrgIDFromPrjTitle < 0){vOrgIDFromPrjTitle = vOrgIDFromPrjTitle*(-1)};
    //of_FilterPrjMngrs(vPrjID);
    //----------------------------------------------------------------------
        var s=0;
        var t=0;
        for (var fu=0; fu<arrayFUsers.length; fu++)
        {
            if (arrayFUsers[fu].aUserActInact == "I") {vActInact = "   (inactive)";}
            else {vActInact = "";}
            
            if (arrayFUsers[fu].aUserST == "S")
            {
                optionS = new Option;
                optionS.value = arrayFUsers[fu].aUserID;
                optionS.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
						//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact;
                s_Source.options[s] = optionS;
                s++;
            }
            else if (arrayFUsers[fu].aUserST == "T")
            {
                for (var fmn=0; fmn<arrayFPrjMngrs.length; fmn++)//fmn - filtered Project Managers
                {
                    if (arrayFPrjMngrs[fmn].aUserID == arrayFUsers[fu].aUserID)
                    { vMngr = "   ***Manager***"; break; }
                    else
                    { vMngr = "";  }
                }
                
                optionT = new Option;
                optionT.value = arrayFUsers[fu].aUserID;
                optionT.text = arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact+vMngr;
						//arrayFUsers[fu].aUserID+"  "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+vActInact+vMngr;
                s_Target.options[t] = optionT;
                t++;
            }
        }
    
    
    }
    //--------------------------------------------------------------------------
    
    if (s_Source.options.length == arrayFUsers.length)
    {
        of_InitialValue ("s_Target",-1, "=== No Selected Participants ===", 0);
        s_Target.options[0].selected = false;
        s_Target.options.disabled = true;
        
        txt_Source.value = (s_Source.options.length - 1);
		txt_Target.value = 0;
    }
    else
    {
        txt_Source.value = s_Source.options.length;
		if (s_Target.options.length ==1 && s_Target.options[0].value == -1)
		{
        	//alert("here")
			txt_Target.value = "0";
		}
		else
		{
			txt_Target.value = s_Target.options.length;
		}
    }
    //--------------------------------------------------------------------------

}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_Reset(){with (self.document.forms[0]){
    s_Prjs.options.disabled = true;
    
    s_Source.options.length = 1;
    s_Target.options.length = 1;
    of_InitialValue ("s_Source",-1, "=== No Available Participants ===", 0);
    of_InitialValue ("s_Target",-1, "=== No Selected Participants ===",  0);
    s_Source.options.disabled = true;
    s_Target.options.disabled = true;
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
function of_setPrjMngrs(){with (self.document.forms[0]){

    var vMngrName = "";
    var vMngrNameList = "";
    
    var vMngrID;
    var arrayMngrID = new Array();
    var m=0;
    
    var vTargetLength = s_Target.options.length;
    var arrayTargetIDs = new Array(vTargetLength);
    
    //--------------------------------------------------------------------------
    for (var t=0; t<vTargetLength; t++)
    {
        if (s_Target.options[t].selected)
        {
            for (var fu=0; fu<arrayFUsers.length; fu++)
            {
                if (s_Target.options[t].value == arrayFUsers[fu].aUserID)
                {
                    vMngrName = "- "+arrayFUsers[fu].aUserLName+", "+arrayFUsers[fu].aUserFName+"\n";
                    arrayMngrID[m] = arrayFUsers[fu].aUserID;
                    m++;
                    break;
                }
            }
            //vMngrIDList += vMngrID;
            vMngrNameList += vMngrName;
        }
        
        arrayTargetIDs[t] = s_Target.options[t].value;
    }
    vUsersInTarget = arrayTargetIDs.join("_");
    vMngrsInTarget = arrayMngrID.join("_");
    
    //--------------------------------------------------------------------------
    if (vMngrNameList == "")
    {
        vValidationPassed = "NO";
        alert("No Project Managers were selected");
    }
    else
    {
        if (confirm("The folowing is a list of selected Managers for the Project\n"+
            "'"+txt_PrjDescr.value+"':\n"+vMngrNameList) )
        {
            vValidationPassed = "YES";
            vIfMngrsChecked = "YES";
        }
        else
        {
            for (var t=0; t<vTargetLength; t++)
            {
                s_Target.options[t].selected = false;
            }
            vValidationPassed = "NO";
        }
    }
    //--------------------------------------------------------------------------
}}
//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

function of_Submit(){with (self.document.forms[0]){
    vValidationPassed = "NO";
    
    for (var t=0; t<s_Target.options.length; t++)
    {
        if (s_Target.options[t].selected)
        {
            vValidationPassed = "YES";
            //alert("Selected")
            break;
        }
    }
    //--------------------------------------------------------------------------
    if (vValidationPassed == "YES" && vIfMngrsChecked == "YES")
    {
        
        h_UsersInTarget.value = vUsersInTarget;//.substr(1);
        h_Mngr.value = vMngrsInTarget;
        action = "AppFlow.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlCase=InsUpdAssignedParts";
        s_Orgs.options.disabled = false;
        submit();
        //alert("S   "+h_UsersInTarget.value+":::"+h_Mngr.value)
    }
    else 
    {
        //of_setPrjMngrs();
        alert("Select Project Manager(s) first")
    }
    //--------------------------------------------------------------------------
}}

//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
</script>


<html><head><title>Editor Assign Participants</title></head>
<body>
<cfloop index="i" from="1" to="1" step="1"><br></cfloop>
<form method="post">
<table align="center" cellspacing="2" cellpadding="2" border="0" width="70%">
<tr>
    <td colspan="2" valign="top" nowrap class="Brown9" >Project Status:<br>
        <select name="s_PrjsStat" onchange="of_changePrjsStat(this.options[selectedIndex].value)">
            <option></option>
        </select>
    </td>
</tr>
<tr>
    <td class="Brown9" width="40%">Project Title:<br>
        <select name="s_Prjs" onchange="of_setPrjDetails(this.options[selectedIndex].value)">
            <option></option>
        </select>
    </td>
    <td class="Brown9" width="30%">Project Name and Brief Description:<br>
        <input type="Text" name="txt_PrjDescr" value="" size="30" disabled
        onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
    </td>
</tr>
<tr>
    <td colspan="2" class="Brown9">Organizations:<br>
        <select name="s_Orgs" onchange="of_changeOrg(this.options[selectedIndex].value)">
        <!--- onchange="//of_setSourceAndTarget(this.options[selectedIndex].value)"> --->
            <option></option>
        </select>
    </td>
</tr>
</table>

<table width="70%" align="center" cellspacing="2" cellpadding="2" border="0" >
<tr>
	<td width="30%" valign="top" class="Brown9" align="right">
		Available Participants:<input type="text" name="txt_Source" value="0" size="5" disabled style="background-color: #FAF0CF; font-weight: bolder; border: none;">
	</td>
	<td width="5%">&nbsp;</td>
	<td valign="top" class="Brown9" width="30%">
		Selected Participants:<input type="text" name="txt_Target" value="0" size="5" disabled style="background-color: #FAF0CF; font-weight: bolder;border: none;">
	</td>
</tr>
<tr>
    <td width="30%" valign="top" class="Brown9" align="right">
       <select name="s_Source" size="12" disabled multiple> <!--- onclick="of_clickSource(this.options[selectedIndex].value);"> --->
            <option></option>
        </select>
    </td>
    
    <td width="5%"><cfinclude template="cb_Arrows.cfm"></td> 
    
    <td valign="top" class="Brown9" width="30%">
        <select name="s_Target" size="12" disabled multiple>
            <option></option>
        </select>
    </td>
</tr>
</table>

<table width="70%" align="center" cellspacing="2" cellpadding="2" border="0" >
<tr>
    <td colspan="3" align="right" class="Brown9" valign="middle">
        ***Always select or re-select name(s) who will become Project Manager(s)***
    </td>
    <td align="right" valign="middle">
        <a href="javascript: of_setPrjMngrs();"
		<!--- 
	     onMouseDown="return imgDownPM('imgpm')"
    	 onMouseOver="return imgOverPM('imgpm')"
    	 onMouseOut="return imgOutPM('imgpm')"
		 ---> 
		 >
    	 <img src="Img/cb_PrjsMngr_I.jpg" alt="Manager" name="imgpm" id="imgpm" border="0">
        </a>
    </td>
</tr>
</table>

<table width="70%" align="center" cellspacing="2" cellpadding="2" border="0" >
<tr>
    <td colspan="2" align="right">
        <table cellspacing="2" cellpadding="2" border="0">
        <tr>
            <td><cfinclude template="cb_LogOut.cfm"></td>
            <td><cfinclude template="cb_Menu.cfm"></td>
            <td> <cfinclude template="cb_SaveAssignPart.cfm"></td>
            <td> <cfinclude template="cb_ResetForAssignParts.cfm"></td>
        </tr>
        </table>
    </td>
</tr>
</table>
<!----------------------------------------------------------------------------->
<input type="Hidden" name="h_UsersInTarget">
<input type="Hidden" name="h_Mngr">
</form>
</body>
</html>
<script language="JavaScript" src="JS/of_setFocus.js"></script>

<cfif isDefined("client.PrjsStat")>
	<!--- 
		This part of the script is executed after project had been assigned, 
		data is updated and re-retrived.
	 --->
    <cfset local.PrjsStat = #client.PrjsStat#>
    <cfset local.PrjID = #client.PrjID#>
    <cfset local.OrgID = #client.OrgID#>
    
    <cfset temp = DeleteClientVariable("PrjsStat")>
    <cfset temp = DeleteClientVariable("PrjID")>
    <cfset temp = DeleteClientVariable("OrgID")>
    
    <script language="JavaScript">
        of_populatePrjsStatus();
        of_changePrjsStat(-1);
        
        of_InitialValue ("s_Orgs",  -1, "=== Select Organization ===",  0);
        of_populateOrgs();
        
        of_InitialValue ("s_Source",-1, "=== No Available Participants ===", 0);
        of_InitialValue ("s_Target",-1, "=== No Selected Participants ===",  0);
		
		with(self.document.forms[0])
		{
			//ps - Project Status
			var vPrjStat = "<cfoutput>#local.PrjsStat#</cfoutput>";
			var vPrjID = "<cfoutput>#local.PrjID#</cfoutput>";
			
			for (var ps=0; ps<s_PrjsStat.options.length; ps++)
			{
				if (s_PrjsStat.options[ps].value == vPrjStat)
				{
					s_PrjsStat.options[ps].selected = true;
					break;
				}
			}//end of for loop Project Status
			
			s_Prjs.options.disabled = false;
			of_changePrjsStat(vPrjStat);
			
			//pt - Project Title
			for (var pt=0; pt <s_Prjs.options.length; pt++)
			{
				if (s_Prjs.options[pt].value == vPrjID)
				{
					s_Prjs.options[pt].selected = true;
					break;
				}
			}//end of for loop Project Title
			
			of_setPrjDetails(vPrjID);
			
		}//end of with()
    </script>
	<cfoutput>#local.PrjsStat#</cfoutput>
<cfelse>
    <!--- 
		This part of the script is executed if user had selected "Assign Participants" on menu page.
	 --->
    <script language="JavaScript">
        of_populatePrjsStatus();
        of_changePrjsStat(-1);
        
        of_InitialValue ("s_Orgs",  -1, "=== Select Organization ===",  0);
        of_populateOrgs();
        
        of_InitialValue ("s_Source",-1, "=== No Available Participants ===", 0);
        of_InitialValue ("s_Target",-1, "=== No Selected Participants ===",  0);
    </script>

</cfif>

