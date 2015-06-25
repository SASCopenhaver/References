


<CFQUERY name="GetEname"  dbtype="DYNAMIC"
ConnectString="Driver={MERANT 3.70 ColdFusion OEM 32-BIT Oracle8};SRVR=SCAXIOM;UID=#FORM.UN#;PWD=#FORM.P#">
    select * from usia.security_user
</CFQUERY>
  
<CFOUTPUT query="GetEname">
        #su_userid#<br>
</CFOUTPUT>

