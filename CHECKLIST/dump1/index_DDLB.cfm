<cfquery name="q_DoS_POs" datasource="#client.DSN#">
SELECT    "USIA"."SECURITY_USER"."SU_USERID",
          "USIA"."PERSON"."PER_SORT_NAME", 
					"USIA"."PERSON"."PER_PERSON_ID", 
					"USIA"."PERSON"."PER_FIRST_NAME", 
					"USIA"."PERSON"."PER_LAST_NAME", 
					"USIA"."SECURITY_USER"."SU_STATUS" ,
					"USIA"."USIA_ORGANIZATION"."UO_OFFICE_SYMBOL",
					"USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID"

	FROM USIA.PERSON, 
			"USIA"."USIA_ORGANIZATION", 
			"USIA"."PERSON_ORGANIZATION", 
			"USIA"."PER_ORG_ROLE", 
			"USIA"."SECURITY_USER" 

WHERE ( "USIA"."PERSON"."PER_PERSON_ID" = "USIA"."PER_ORG_ROLE"."POR_PERSON_ID" ) AND 
		( "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" = "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID" ) AND 
		( "USIA"."PERSON_ORGANIZATION"."PO_PERSON_ID" = "USIA"."PERSON"."PER_PERSON_ID" ) AND
		( "USIA"."SECURITY_USER"."SU_PERSON_ID"(+) = "USIA"."PERSON"."PER_PERSON_ID" ) AND
		( "USIA"."PERSON_ORGANIZATION"."PO_STATUS" = 'A' ) AND
		( ( "USIA"."PER_ORG_ROLE"."POR_ROLE" = 'PO' ) AND 
	--//	( "USIA"."USIA_ORGANIZATION"."UO_OFFICE_SYMBOL" = 'E/V') AND 
		( "USIA"."SECURITY_USER"."SU_STATUS" = 'A' OR "USIA"."SECURITY_USER"."SU_PERSON_ID" IS NULL ) AND
		( "USIA"."SECURITY_USER"."SU_OFFICE_ID" =
 		  "USIA"."PER_ORG_ROLE"."POR_ORGANIZATION_ID" OR "USIA"."SECURITY_USER"."SU_OFFICE_ID" IS NULL) ) 
ORDER BY "USIA"."USIA_ORGANIZATION"."UO_OFFICE_ID", "USIA"."SECURITY_USER"."SU_USERID"
</cfquery> 

<!--- <cfoutput query="q_DoS_POs">#SU_USERID#<br></cfoutput> --->
<br><br><br><br><br><br><br>
<p>
<select name="s_DoS_POs">
	<cfoutput query="q_DoS_POs">
	<option value="#SU_USERID#">#SU_USERID#&nbsp;-&nbsp;#PER_SORT_NAME#&nbsp;-&nbsp;#PER_PERSON_ID#&nbsp;-&nbsp;#PER_FIRST_NAME#&nbsp;-&nbsp;#PER_LAST_NAME#&nbsp;-&nbsp;#SU_STATUS#&nbsp;-&nbsp;#UO_OFFICE_SYMBOL#&nbsp;-&nbsp;#UO_OFFICE_ID#</option>
	</cfoutput>
</select>
</p>
<input type="Button" value="Submit" onclick="f_StartApp(s_DoS_POs.value)">
 
<!--- <cfset local.UserIDFromPB = "cmoore"> ---><!--- cmoore(SA) bmay(DC) nbell(DC) cgrabaus(BC) tblatt(BC) jbeard(PO) econnoll(BC) tajohnso(BC)--->
<script language="JavaScript">
function startApp(argUserID)
{//	alert(argSelectedDate)
	
	var popupPage = "_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController=SetUpUser&urlUserIDFromPB="+argUserID;
	//var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=no,resizable=yes,top=0,left=0,copyhistory=no,width=810,height=1000','yes');
	var popupWin = window.open(popupPage,'','fullscreen=no,toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,titlebar=yes,resizable=yes,top=0,left=0,copyhistory=no,width=810,height=1000','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
	
}
//
//------------------------------------------------------------------------------
//startApp();
//
//------------------------------------------------------------------------------
//window.opener=self;
//window.close();
//
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
function f_StartApp(argUserID)
{//alert(argUserID)
	startApp(argUserID);
}
</script>
