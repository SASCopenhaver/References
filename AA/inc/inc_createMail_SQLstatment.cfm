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
		<cfset local.From_Cntry = client.CS_From_Cntry>
		<cfset local.From_Cntry = " and p.pgm_from_cntry_cd  in ('"&Replace(local.From_Cntry, ",", "','", "ALL")&"') ">
	</cfif>
<cfelse>
	<cfset local.From_Cntry = client.h_CS_From_Cntry>
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
	<cfset local.CS_Pgm_Type = client.CS_Pgm_Type>
	
	<cfset local.CS_Pgm_Type =  " select pgm_type_cd "
							   &" from pgm_type "
							   &" where pgm_type_crnt_cd in ('"&Replace(local.CS_Pgm_Type, ",", "','", "ALL")&"') ">
	<cfset local.CS_Pgm_Type = " and p.pgm_type_cd  in ("&local.CS_Pgm_Type&") "> 
</cfif>

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

<!--- 9. CITIZENSHIP COUNTRY --->
<cfif #client.CS_Citznsp_Cntry_CD# EQ "-1">
	<cfset local.CS_Citznsp_Cntry_CD = "">
<cfelse>
	<cfset local.CS_Citznsp_Cntry_CD = " and a.almn_ctznsp_cntry_cd = '"&client.CS_Citznsp_Cntry_CD&"' ">
</cfif>

<!--- 9. RESIDENCE COUNTRY --->
<cfif #client.CS_Resdnc_Cntry_CD# EQ "-1">
	<cfset local.CS_Resdnc_Cntry_CD = "">
<cfelse>
	<cfset local.CS_Resdnc_Cntry_CD = " and a.almn_resdnc_cntry_cd = '"&client.CS_Resdnc_Cntry_CD&"' ">
</cfif>

<!--- 10. FIELD OF STUDY/Project Subject --->
<cfif #client.CS_Field_Stdy_Nm# EQ "">
	<cfset local.Field_Stdy_Nm = "">
<cfelse>
	<cfset local.Gender = Replace(client.CS_Field_Stdy_Nm , "'","''","ALL")>
	<cfset local.Field_Stdy_Nm = " and ("&
								 " ( UPPER(fs.field_stdy_nm) like (UPPER('%"&local.Field_Stdy_Nm&"%')) ) "&
								 " or "&
								 " (UPPER(p.pgm_topic_txt) like (UPPER('%"&local.Field_Stdy_Nm&"%'))) "&
								 " ) ">
</cfif>

<!--- 11. CITY OF RESIDENCE --->
<cfif #client.CS_Resdnc_City_Nm# EQ "">
	<cfset local.Resdnc_City_Nm = "">
<cfelse>
	<cfset local.Resdnc_City_Nm = Replace(client.CS_Resdnc_City_Nm , "'","''","ALL")>
	<cfset local.Resdnc_City_Nm = " and UPPER(a.almn_resdnc_city_nm) like (UPPER('%"&local.Resdnc_City_Nm&"%')) ">
</cfif>

<!--- 11. HOST INSTITUTION and CITY VISITED --->
<cfset local.PLACE_VISIT = "">
<cfset local.tblJoint = "">
<cfset local.Host_Instn_Nm = "">
<cfset local.Visit_City_Nm = "">
<cfif #client.CS_Host_Instn_Nm# NEQ "" OR #client.CS_Visit_City_Nm# NEQ "">
	<cfset local.PLACE_VISIT = " , PLACE_VISIT pv ">
	<cfset local.tblJoint = " and (pv.place_visit_pgm_id = p.pgm_id  and pv.place_visit_almn_id = p.pgm_almn_id "&local.Place_Cntry&") " >
	
	<cfif #client.CS_Host_Instn_Nm# NEQ "">
		<cfset local.Host_Instn_Nm = Replace(client.CS_Host_Instn_Nm , "'","''","ALL")>
		<cfset local.Host_Instn_Nm = " and UPPER(pv.place_visit_host_instn_nm) like (UPPER('%"&local.Host_Instn_Nm&"%')) ">
	<cfelse>
		<cfset local.Host_Instn_Nm = "">
	</cfif>
	
	<cfif #client.CS_Visit_City_Nm# NEQ "">
		<cfset local.Visit_City_Nm = Replace(client.CS_Visit_City_Nm , "'","''","ALL")>
		<cfset local.Visit_City_Nm = " and (UPPER(pv.place_visit_host_instn_nm) like (UPPER('%"&local.Visit_City_Nm&"%')) OR UPPER(pv.place_visit_city_nm) like (UPPER('%"&local.Visit_City_Nm&"%')))">
	
	<cfelse>
		<cfset local.Visit_City_Nm = "">
	</cfif>
	
</cfif>

<cfset client.Rpt_Type = "MAIL">
<!--- ---------------------------------------------------------------------- --->
<cfset client.SelectCount = " insert into cust_search_rcrd_count SELECT Count(*), "&client.Usr_CD&" ">
 <!--- ---------------------------------------------------------------------- --->
<cfset client.InsertStmnt = " insert into adhoc_rpt ">
 <!--- ---------------------------------------------------------------------- --->
<cfset client.SelectStmnt = 
" SELECT "
	&client.Usr_CD&", rownum, "&" '"&client.Rpt_Type&"', a.almn_id,Chr(60) || 'tr' || Chr(62) ||  "
	&"  Chr(60) || 'td' || Chr(62) || Initcap(decode(nvl(a.almn_pfx_dsc,''),'-1','','','',a.almn_pfx_dsc||' '))|| Chr(60) || '/td' || Chr(62)||"
	&"  Chr(60) || 'td' || Chr(62) || Initcap(decode(nvl(a.almn_frst_nm,''),'','',a.almn_frst_nm||' '))|| Chr(60) || '/td' || Chr(62)||"
	&"  Chr(60) || 'td' || Chr(62) || Initcap(decode(nvl(a.almn_midl_nm,''),'','',a.almn_midl_nm||' '))|| Chr(60) || '/td' || Chr(62)||"
	&"  Chr(60) || 'td' || Chr(62) || Initcap(a.almn_last_nm)"
	&"||Initcap(decode(nvl(a.almn_last_nm2,''),'','',' '||a.almn_last_nm2))|| Chr(60) || '/td' || Chr(62)||"
	&"  Chr(60) || 'td' || Chr(62) || Initcap(decode(nvl(a.almn_sfx_dsc,''),'','',' '||a.almn_sfx_dsc))|| Chr(60) || '/td' || Chr(62)||"
	&"  Chr(60) || 'td' || Chr(62) || decode(a.almn_prefrd_adrs_ind, 'H', '' ,'B', a.almn_bsns_nm, decode(a.almn_resdnc_adrs_txt, null, a.almn_bsns_nm ,'',a.almn_bsns_nm ,'' ))|| Chr(60) || '/td' || Chr(62)|| "
    &"  Chr(60) || 'td' || Chr(62) || decode(a.almn_prefrd_adrs_ind, 'H',Replace(nvl(a.almn_resdnc_adrs_txt,''),Chr(13),' '),"
	&"'B',Replace(nvl(a.almn_bsns_adrs_txt,''),Chr(13),' '),"
	&" decode(a.almn_resdnc_adrs_txt,null,Replace(nvl(a.almn_bsns_adrs_txt,''),Chr(13),' '),'',Replace(nvl(a.almn_bsns_adrs_txt,''),Chr(13),' '),Replace(nvl(a.almn_resdnc_adrs_txt,''),Chr(13),' ')))|| Chr(60) || '/td' || Chr(62)|| "
	&"  Chr(60) || 'td' || Chr(62) || decode(a.almn_prefrd_adrs_ind, 'H', a.almn_resdnc_city_nm ,'B', a.almn_bsns_city_nm, decode(a.almn_resdnc_adrs_txt, null, a.almn_bsns_city_nm ,'',a.almn_bsns_city_nm ,a.almn_resdnc_city_nm ))|| Chr(60) || '/td' || Chr(62)|| "
    &"  Chr(60) || 'td' || Chr(62) || decode(a.almn_prefrd_adrs_ind, 'H', a.almn_resdnc_state_prvnc_nm ,'B',a.almn_bsns_state_prvnc_nm, decode(a.almn_resdnc_adrs_txt, null, a.almn_bsns_state_prvnc_nm ,'',a.almn_bsns_state_prvnc_nm ,a.almn_resdnc_state_prvnc_nm ))|| Chr(60) || '/td' || Chr(62)|| "
    &"  Chr(60) || 'td' || Chr(62) || decode(a.almn_prefrd_adrs_ind, 'H', a.almn_resdnc_postl_cd ,'B', a.almn_bsns_postl_cd, decode(a.almn_resdnc_adrs_txt, null, a.almn_bsns_postl_cd ,'',a.almn_bsns_postl_cd ,a.almn_resdnc_postl_cd ))|| Chr(60) || '/td' || Chr(62)|| "
    &"  Chr(60) || 'td' || Chr(62) || decode(a.almn_prefrd_adrs_ind, 'H', a.almn_resdnc_cntry_cd ,'B', a.almn_bsns_cntry_cd, decode(a.almn_resdnc_adrs_txt, null, a.almn_bsns_cntry_cd ,'',a.almn_bsns_cntry_cd ,a.almn_resdnc_cntry_cd ))|| Chr(60) || '/td' || Chr(62)|| "
	&"Chr(60) || '/tr' || Chr(62)  "
   >
	
<cfset client.FromWhere = 
" FROM  almn a, pgm p, pgm_type pt, field_stdy fs, usr u " &local.PLACE_VISIT
&" WHERE "
	&" a.almn_id = p.pgm_almn_id "
	&" and p.pgm_type_cd = pt.pgm_type_cd "
	&" and p.pgm_field_stdy_cd = fs.field_stdy_cd(+) "
	&" and a.almn_updt_id = to_char(u.usr_cd(+)) "
	&" and ((a.almn_resdnc_adrs_txt is not null) or (a.almn_bsns_adrs_txt is not null) or (Trim(a.almn_resdnc_adrs_txt) != '') or (Trim(a.almn_bsns_adrs_txt) != '')) "
	&local.tblJoint
	&" and p.show_pgm_ind = 'Y' "
	&local.First_Nm
	&local.Last_Nm
	&local.Gender
	&local.From_Cntry
	&local.To_Cntry
	&local.CS_Pgm_Type
	&local.CS_Year
	&local.CS_Citznsp_Cntry_CD
	&local.CS_Resdnc_Cntry_CD
	&local.Field_Stdy_Nm
	&local.Resdnc_City_Nm
	&local.Host_Instn_Nm
	&local.Visit_City_Nm
	>
<!--- ---------------------------------------------------------------------- --->
<!--- client.SelectCount --->
<cfset client.SelectCount = client.SelectCount & client.FromWhere>
<cfset client.OrderBy = " ORDER BY a.almn_last_nm ">  
<cfset client.ASC_DESC = " ASC "> 
<cfset client.RPT_SQLstatement = client.InsertStmnt
									&
									client.SelectStmnt
									&
									client.FromWhere
									&
									client.OrderBy
									&
									client.ASC_DESC>
<!--- ---------------------------------------------------------------------- --->



