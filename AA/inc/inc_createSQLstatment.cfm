<!--- 1. FIRST NAME --->
<cfif #client.CS_First_Nm# EQ "">
	<cfset local.First_Nm = "">
<cfelse>
	<cfset local.First_Nm = Replace(client.CS_First_Nm, "'","''","ALL")>
	<cfset local.First_Nm = " and UPPER(a.almn_frst_nm) like (UPPER('"&local.First_Nm&"%')) ">
</cfif>

<!--- 2. LAST NAME --->
<cfif #client.CS_Last_Nm# EQ "">
	<cfset local.Last_Nm = "">
<cfelse>
	<cfset local.Last_Nm = Replace(client.CS_Last_Nm, "'","''","ALL")>
	<!---<cfset local.Last_Nm = " and UPPER(a.almn_last_nm) like (UPPER('"&local.Last_Nm&"%')) ">--->
	<cfset local.Last_Nm = " and (UPPER(a.almn_last_nm) like (UPPER('"&local.Last_Nm&"%')) or UPPER(a.almn_last_nm2) like (UPPER('"&local.Last_Nm&"%'))) ">

</cfif>

<!--- 3. GENDER --->
<cfif #client.CS_Gender# EQ "-1">
	<cfset local.Gender = "">
<cfelse>
	<cfset local.Gender = Replace(client.CS_Gender , "'","''","ALL")>
	<cfset local.Gender = " and a.almn_sex_ind = '"&local.Gender&"' ">
</cfif>


<!--- 4. COUNTRY FROM --->
<cfif #client.h_CS_From_Cntry# EQ "">
	<cfif #client.CS_From_Cntry# EQ "-1">
		<cfset local.From_Cntry = "">
	<cfelse>
		<cfset local.From_Cntry = Replace(client.CS_From_Cntry , "'","''","ALL")>
		<cfset local.From_Cntry = " and p.pgm_from_cntry_cd  in ('"&Replace(local.From_Cntry, ",", "','", "ALL")&"') ">
	</cfif>
<cfelse>
	<cfset local.From_Cntry = Replace(client.CS_From_Cntry , "'","''","ALL")>
	<cfset local.From_Cntry = " and p.pgm_from_cntry_cd  in ('"&Replace(local.From_Cntry, ",", "','", "ALL")&"') ">
	
</cfif>

<!--- 5. COUNTRY TO --->
<cfif #client.h_CS_To_Cntry# EQ "">
	<cfif #client.CS_To_Cntry# EQ "-1">
		<cfset local.To_Cntry = "">
	<cfelse>
		<cfset local.To_Cntry = client.CS_To_Cntry>
		<cfset local.Place_Cntry = client.CS_To_Cntry>
		<cfset local.Place_Cntry =  " and pv.place_visit_cntry_cd  in ('"&Replace(local.Place_Cntry, ",", "','", "ALL")&"') ">
		<cfset local.To_Cntry = " and p.pgm_to_cntry_cd  in ('"&Replace(local.To_Cntry, ",", "','", "ALL")&"') ">
	</cfif>
<cfelse>
	<cfset local.To_Cntry = client.h_CS_To_Cntry>
	<cfset local.Place_Cntry = client.h_CS_To_Cntry>
	<cfset local.Place_Cntry =  " and pv.place_visit_cntry_cd  in ('"&Replace(local.Place_Cntry, ",", "','", "ALL")&"') ">
	<cfset local.To_Cntry = " and p.pgm_to_cntry_cd  in ('"&Replace(local.To_Cntry, ",", "','", "ALL")&"') ">
</cfif>

<!--- 6. PROGRAM TYPE --->
<cfif #client.CS_Pgm_Type# EQ "-1">
	<cfset local.CS_Pgm_Type = "">
<cfelse>
	<cfset local.CS_Pgm_Type = Replace(client.CS_Pgm_Type , "'","''","ALL")>
	<cfset local.CS_Pgm_Type =  " select pgm_type_cd "
							   &" from pgm_type "
							   &" where pgm_type_crnt_cd in ('"&Replace(local.CS_Pgm_Type, ",", "','", "ALL")&"') ">
	<cfset local.CS_Pgm_Type = " and p.pgm_type_cd  in ("&local.CS_Pgm_Type&") "> 
</cfif><!--- <cfoutput>#local.CS_Pgm_Type#</cfoutput><cfabort> --->

<!--- 7. FISCAL OR PROGRAM START YEAR --->
<cfif #client.CS_Year_Type# EQ "-1">
	<!--- <cfset local.CS_Year_Type = ""> --->
	<cfset local.CS_Year = "">
<cfelse>
	<cfif client.CS_Year_Type EQ "FY">
		<cfset local.CS_Year = " and pgm_fy_dt IN ( "&client.CS_Year&" ) ">
	<cfelseif client.CS_Year_Type EQ "PS">
		<cfset local.CS_Year = " and pgm_yr_dt IN ( "&client.CS_Year&" ) ">
	<cfelseif client.CS_Year_Type EQ "FYPS">
		<cfset local.CS_Year = " and ( pgm_fy_dt IN ( "&client.CS_Year&" ) or pgm_yr_dt IN ( "&client.CS_Year&" ) )   ">
	</cfif>
</cfif>

<!--- 8. CITIZENSHIP COUNTRY --->
<cfif #client.CS_Citznsp_Cntry_CD# EQ "-1">
	<cfset local.CS_Citznsp_Cntry_CD = "">
<cfelse>
	<cfset local.CS_Citznsp_Cntry_CD = Replace(client.CS_Citznsp_Cntry_CD , "'","''","ALL")>
	<cfset local.CS_Citznsp_Cntry_CD = " and a.almn_ctznsp_cntry_cd = '"&local.CS_Citznsp_Cntry_CD&"' ">
</cfif>

<!--- 9. RESIDENCE COUNTRY --->
<cfif #client.CS_Resdnc_Cntry_CD# EQ "-1">
	<cfset local.CS_Resdnc_Cntry_CD = "">
<cfelse>
	<cfset local.CS_Resdnc_Cntry_CD = " and a.almn_resdnc_cntry_cd = '"&client.CS_Resdnc_Cntry_CD&"' ">
</cfif>

<cfset client.SelectCount = " insert into cust_search_rcrd_count SELECT Count(*), "&client.Usr_CD&" ">

<cfset client.InsertStmnt = " insert into cust_search_rcrd ">
<cfset client.SelectStmnt = 
 <!--- ---------------------------------------------------------------------- --->
" SELECT "
	&client.Usr_CD&", rownum , a.almn_id "
	&", a.almn_last_nm "
	<!--- 
	&",decode(almn_pfx_dsc, null,'','-1','',Initcap(almn_pfx_dsc))||' '|| "
	&" decode(almn_frst_nm, null,'',Initcap(almn_frst_nm))||' '|| "
	&" decode(almn_midl_nm, null,'',Initcap(almn_midl_nm))||' '|| "
	&" Initcap(almn_last_nm)||' '|| "
	&" decode(almn_sfx_dsc, null,'',Initcap(almn_sfx_dsc)) "
	 --->
	 
	<!--- ... ---> 
	&", Initcap(almn_last_nm)|| "
	&" decode(almn_frst_nm, null,'',', '||Initcap(almn_frst_nm))||' '|| "
	&" decode(almn_midl_nm, null,'',Initcap(almn_midl_nm))"
	<!--- ... --->
	&", NVL(almn_sex_ind,'-') "
	&", p.pgm_field_stdy_cd "
	&", decode(pgm_field_stdy_cd, null, '-', fs.field_stdy_nm) "
	<!--- ... --->
	&", p.pgm_type_cd " 								
	&", decode(p.pgm_type_cd, null,'-',pt.pgm_type_nm) "	
	&", NVL(TO_CHAR(pgm_fy_dt),'-') " 						
	&", NVL(TO_CHAR(pgm_yr_dt),'-') "  						
	&", a.almn_updt_id "
	&", a.almn_updt_dt"
	&", DECODE(a.almn_updt_id,null,null, "
		&" decode(u.usr_pfx, '-1', '', null,'',Initcap(u.usr_pfx))||' '|| "
		&" decode(u.usr_fname, null,'',Initcap(u.usr_fname))||' '|| "
		&" decode(u.usr_mi, null,'',Initcap(u.usr_mi))||' '|| "
		&" Initcap(u.usr_lname) "
	&" ) "
	&", NVL(Replace(p.pgm_topic_txt,'''','`'), '-') ">
<cfset client.FromWhere = 
" FROM  almn a, pgm p, pgm_type pt, field_stdy fs, usr u "
&" WHERE "
	&" a.almn_id = p.pgm_almn_id "
	&" and p.pgm_type_cd = pt.pgm_type_cd "
	&" and p.pgm_field_stdy_cd = fs.field_stdy_cd(+) "
	&" and a.almn_updt_id = to_char(u.usr_cd(+)) "
	&" and p.show_pgm_ind = 'Y' "
	&" and a.show_almn_ind = 'Y' "
	&local.First_Nm
	&local.Last_Nm
	&local.Gender
	&local.From_Cntry
	&local.To_Cntry
	&local.CS_Pgm_Type
	&local.CS_Year
	&local.CS_Citznsp_Cntry_CD
	&local.CS_Resdnc_Cntry_CD
	>
<!--- ---------------------------------------------------------------------- --->
<!--- client.SelectCount --->
<cfset client.SelectCount = client.SelectCount & client.FromWhere>
<cfset client.OrderBy = " ORDER BY a.almn_last_nm ">  
<cfset client.ASC_DESC = " ASC "> 
<cfset client.basicCS_SQLstatement = client.InsertStmnt
									&
									client.SelectStmnt
									&
									client.FromWhere
									&
									client.OrderBy
									&
									client.ASC_DESC>
<!--- <cfoutput>#client.basicCS_SQLstatement#</cfoutput><cfabort> --->



