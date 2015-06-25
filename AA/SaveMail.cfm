
<!--- <cffile	action="append" file="C:\MailingLables.doc" output="#spr_getSearchedRecords.mail_label#" addnewline="yes"> --->
<cffile	action="append" 
			file="C:\MailingLables.doc"  mode="644"
			output="<table title='Mailing Lables' border='1' cellspacing='2' cellpadding='2'>" 
			addnewline="yes">
<cfloop query="spr_getSearchedRecords" startrow="1" endrow="#spr_getSearchedRecords.recordCount#">
	<cffile	action="append" file="C:\MailingLables.doc" output="<tr>" addnewline="yes"   mode="644">

		<cffile	action="append" file="C:\MailingLables.doc" output=" <td>#spr_getSearchedRecords.mail_label#</td>" addnewline="yes"   mode="644">
		<cffile	action="append" file="C:\MailingLables.doc" output="<td>#spr_getSearchedRecords.mail_label#</td>" addnewline="yes"   mode="644">

	<cffile	action="append" file="C:\MailingLables.doc" output="</tr>" addnewline="yes"   mode="644">
</cfloop>

<cffile	action="append" 
			file="C:\MailingLables.doc" 
			output="</table>"  
			addnewline="yes"  mode="644">



