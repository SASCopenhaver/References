<!--- popupNUR_Fax.cfm --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Fax / Print</title>
</head>




<body>
<cfoutput><!---  query="spr_get_NUR_User_FaxInfo" --->
<table title="Fax form" width="100%%"  border="1" cellspacing="2" cellpadding="2">
  <!--- .............................................................. --->
  <tr>
    <td>
		<table  title="Fax form"  width="100%%"  border="1" cellspacing="2" cellpadding="2">
			<tr>
				<td width="50%">#DateFormat(Now(), "mm/dd/yyyy")#</td>
				<td>Alumni Archive user registration fax request</td>
			</tr>
		</table>
	</td>
  </tr>
  <!--- .............................................................. --->
  <tr>
    <td>
		<table title="Fax form" width="100%%"  border="1" cellspacing="2" cellpadding="2">
			<tr>
				<td width="5%">&nbsp;</td>
				<td width="45%">&nbsp;</td>
				<td width="5%">&nbsp;</td>
				<td width="45%">&nbsp;</td>
			</tr>
		</table>
	</td>
  </tr>
  <!--- .............................................................. --->
  <tr>
    <td>&nbsp;</td>
  </tr>
  <!--- .............................................................. --->
  <tr>
    <td>&nbsp;</td>
  </tr>
  <!--- .............................................................. --->



</table>
</cfoutput>
</body>
</html>
<cfset client.Permission = "YES">