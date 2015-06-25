<!--- 1. FIRST NAME --->
<cfif #client.CS_First_Nm# EQ "">
	<cfset local.First_Nm = "">
<cfelse>
	<cfset local.First_Nm = Replace(client.CS_First_Nm, "'","''","ALL")>
	<cfset local.First_Nm = " and UPPER(almn.almn_frst_nm) like (UPPER('"&local.First_Nm&"%')) ">
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
	<cfset local.Gender = " and almn.almn_sex_ind = '"&local.Gender&"' ">
</cfif>

<!--- 4. COUNTRY FROM --->
<cfif #client.h_CS_From_Cntry# EQ "">
	<cfif #client.CS_From_Cntry# EQ "-1">
		<cfset local.From_Cntry = "">
	<cfelse>
		<cfset local.From_Cntry = client.CS_From_Cntry>
		<cfset local.From_Cntry = " and pgm.pgm_from_cntry_cd  in ('"&Replace(local.From_Cntry, ",", "','", "ALL")&"') ">
	</cfif>
<cfelse>
	<cfset local.From_Cntry = client.h_CS_From_Cntry>
	<cfset local.From_Cntry = " and pgm.pgm_from_cntry_cd  in ('"&Replace(local.From_Cntry, ",", "','", "ALL")&"') ">
	
</cfif>

<!--- 5. COUNTRY TO --->
<cfif #client.h_CS_To_Cntry# EQ "">
	<cfif #client.CS_To_Cntry# EQ "-1">
		<cfset local.To_Cntry = "">
	<cfelse>
		<cfset local.To_Cntry = client.CS_To_Cntry>
		<cfset local.Place_Cntry = client.CS_To_Cntry>
		<cfset local.Place_Cntry =  " and place_visit.place_visit_cntry_cd  in ('"&Replace(local.Place_Cntry, ",", "','", "ALL")&"') ">
	<cfset local.To_Cntry = " and pgm.pgm_to_cntry_cd  in ('"&Replace(local.To_Cntry, ",", "','", "ALL")&"') ">
	</cfif>
<cfelse>
	<cfset local.To_Cntry = client.h_CS_To_Cntry>
	<cfset local.Place_Cntry = client.h_CS_To_Cntry>
	<cfset local.Place_Cntry =  " and place_visit.place_visit_cntry_cd  in ('"&Replace(local.Place_Cntry, ",", "','", "ALL")&"') ">
	<cfset local.To_Cntry = " and pgm.pgm_to_cntry_cd  in ('"&Replace(local.To_Cntry, ",", "','", "ALL")&"') ">
</cfif>

<!--- 6. PROGRAM TYPE --->
<cfif #client.CS_Pgm_Type# EQ "-1">
	<cfset local.CS_Pgm_Type = "">
<cfelse>
	<cfset local.CS_Pgm_Type = client.CS_Pgm_Type>
	
	<cfset local.CS_Pgm_Type =  " select pgm_type_cd "
							   &" from pgm_type "
							   &" where pgm_type_crnt_cd in ('"&Replace(local.CS_Pgm_Type, ",", "','", "ALL")&"') ">
	<cfset local.CS_Pgm_Type = " and pgm.pgm_type_cd  in ("&local.CS_Pgm_Type&") "> 
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
	<cfset local.CS_Citznsp_Cntry_CD = " and almn.almn_ctznsp_cntry_cd = '"&client.CS_Citznsp_Cntry_CD&"' ">
</cfif>

<!--- 9. RESIDENCE COUNTRY --->
<cfif #client.CS_Resdnc_Cntry_CD# EQ "-1">
	<cfset local.CS_Resdnc_Cntry_CD = "">
<cfelse>
	<cfset local.CS_Resdnc_Cntry_CD = " and almn.almn_resdnc_cntry_cd = '"&client.CS_Resdnc_Cntry_CD&"' ">
</cfif>

<!--- 10. FIELD OF STUDY/Project Subject --->
<cfif #client.CS_Field_Stdy_Nm# EQ "">
	<cfset local.Field_Stdy_Nm = "">
<cfelse>
	<!--- <cfset local.Field_Stdy_Nm = " and UPPER(field_stdy.field_stdy_nm) like (UPPER('%"&#client.CS_Field_Stdy_Nm#&"%')) "> --->
	<cfset local.Field_Stdy_Nm = " and ("&
								 " ( UPPER(field_stdy.field_stdy_nm) like (UPPER('%"&client.CS_Field_Stdy_Nm&"%')) ) "&
								 " or "&
								 " (UPPER(pgm.pgm_topic_txt) like (UPPER('%"&client.CS_Field_Stdy_Nm&"%'))) "&
								 " ) ">
</cfif>

<!--- 11. Prominent Category --->
<cfif #client.CS_Prominent_CD# EQ "-1">
	<cfset local.CS_Prominent_CD = "">
<cfelse>
	<cfset local.CS_Prominent_CD = " and almn.almn_prominent_cd = '"&client.CS_Prominent_CD&"' ">
</cfif>

<!--- 10. CITY OF RESIDENCE --->
<cfif #client.CS_Resdnc_City_Nm# EQ "">
	<cfset local.Resdnc_City_Nm = "">
<cfelse>
	<cfset local.Resdnc_City_Nm = Replace(client.CS_Resdnc_City_Nm , "'","''","ALL")>
	<cfset local.Resdnc_City_Nm = " and UPPER(almn.almn_resdnc_city_nm) like (UPPER('%"&local.Resdnc_City_Nm&"%')) ">
	
</cfif>

<!--- 10. HOST INSTITUTION and CITY VISITED --->
<cfset local.PLACE_VISIT = "">
<cfset local.tblJoint = "">
<cfset local.Host_Instn_Nm = "">
<cfset local.Visit_City_Nm = "">
<cfif #client.CS_Host_Instn_Nm# NEQ "" OR #client.CS_Visit_City_Nm# NEQ "">
	<cfset local.PLACE_VISIT = " , PLACE_VISIT  ">
	<cfset local.tblJoint = " and (place_visit.place_visit_pgm_id = pgm.pgm_id  and place_visit.place_visit_almn_id = pgm.pgm_almn_id "&local.Place_Cntry&") " >
	
	<cfif #client.CS_Host_Instn_Nm# NEQ "">
		<cfset local.Host_Instn_Nm = Replace(client.CS_Host_Instn_Nm , "'","''","ALL")>
		<cfset local.Host_Instn_Nm = " and UPPER(place_visit.place_visit_host_instn_nm) like (UPPER('%"&local.Host_Instn_Nm&"%')) ">
	<cfelse>
		<cfset local.Host_Instn_Nm = "">
	</cfif>
	
	<cfif #client.CS_Visit_City_Nm# NEQ "">
		<cfset local.Visit_City_Nm = Replace(client.CS_Visit_City_Nm , "'","''","ALL")>
		<cfset local.Visit_City_Nm = " and (UPPER(place_visit.place_visit_host_instn_nm) like (UPPER('%"&local.Visit_City_Nm&"%')) OR UPPER(place_visit.place_visit_city_nm) like (UPPER('%"&local.Visit_City_Nm&"%')))">
	
	<cfelse>
		<cfset local.Visit_City_Nm = "">
	</cfif>
	
</cfif>

<cfset client.Rpt_Type = "STAT">

<cfset client.SelectCount = " insert into cust_search_rcrd_count SELECT Count(*), "&client.Usr_CD&" ">

<cfset client.InsertStmnt = " insert into random_rpt ">
<cfset client.SelectStmnt = 
 <!--- ---------------------------------------------------------------------- --->
" SELECT "
	&client.Usr_CD&", rownum "
	&", 'STAT', almn.almn_id, Chr(60) || 'tr' || Chr(62) ||"	
	<!--- ....................................... --->
	&local.ALMN_PFX_DSC
	&local.ALMN_FRST_NM
	&local.ALMN_MIDL_NM
	&local.ALMN_LAST_NM
	&local.ALMN_LAST_NM2
	&local.ALMN_SFX_DSC
	<!--- ....................................... --->
	&local.ALMN_SEX_IND
	&local.ALMN_DOB_DT
	&local.ALMN_CTZNSP_CNTRY_CD
	&local.ALMN_CTZNSP_CNTRY_CD2
	<!--- ....................................... --->
	&local.PGM_FROM_CNTRY_CD
	&local.PGM_TO_CNTRY_CD
	&local.PGM_TYPE_CD
	&local.PGM_FIELD_STDY_CD
	<!--- ....................................... --->
	&local.PGM_FY_DT
	&local.PGM_YR_DT
	&local.PGM_START_DT
	&local.PGM_END_DT
	<!--- ....................................... --->
	&local.PLACE_VISIT_HOST_INST_NM
	&local.PLACE_VISIT_CITY_NM
	&local.PGM_AGCY_NM
	&local.PGM_PLCMNT_ORG_NM
	<!--- ....................................... --->
	&local.PGM_NMTNG_ORG_NM
	&local.PGM_SUB_CTGRY_TXT
	&local.PGM_TOPIC_TXT
	&local.PGM_STRTGC_GOAL_TXT
	&local.PGM_SPCL_AWARD_TXT
	<!--- ....................................... --->
	&local.ALMN_CNTCT_IND
	&local.ALMN_DCSD_IND
	&local.ALMN_DSABLD_IND
	&local.INTRST_NM
	&local.PROMINENT_CD
		<!--- ....................................... --->
	&local.JOB_TITLE_TXT
	&local.ALMN_ELP_SPEAK_FSI_LEVEL_NUM
	&local.ALMN_ELP_READ_FSI_LEVEL_NUM
	&local.ALMN_ELP_COMP_FSI_LEVEL_NUM
	&local.USR_COMNT_COMNT_TXT
	<!--- ....................................... --->
	&local.ALMN_BSNS_NM
	&local.ALMN_BSNS_ADRS_TXT
	&local.ALMN_BSNS_CITY_NM
	&local.ALMN_BSNS_STATE_PRVNC_NM
	&local.ALMN_BSNS_POSTL_CD
	&local.ALMN_BSNS_CNTRY_CD
	<!--- ....................................... --->
	&local.ALMN_RESDNC_ADRS_TXT
	&local.ALMN_RESDNC_CITY_NM
	&local.ALMN_RESDNC_STATE_PRVNC_NM
	&local.ALMN_RESDNC_POSTL_CD
	&local.ALMN_RESDNC_CNTRY_CD
	<!--- ....................................... --->
	&"Chr(60) || '/tr' || Chr(62)"
	<!--- &local.col_null# --->
	>
	
<cfset client.FromWhere = 
" from almn,
       pgm,
       field_stdy,
       pgm_type " &local.PLACE_VISIT
&"  where almn.almn_id = pgm.pgm_almn_id
       and field_stdy.field_stdy_cd(+) = pgm.pgm_field_stdy_cd
       and pgm_type.pgm_type_cd = pgm.pgm_type_cd "
	   &local.tblJoint
	&" and pgm.show_pgm_ind = 'Y' "
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
	&local.CS_Prominent_CD
	&local.Resdnc_City_Nm
	&local.Host_Instn_Nm
	&local.Visit_City_Nm
	>
<!--- ---------------------------------------------------------------------- --->
<!--- client.SelectCount --->
<cfset client.SelectCount = client.SelectCount & client.FromWhere>
<cfset client.OrderBy = " ORDER BY almn.almn_last_nm ">  
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

<!--- <cfoutput>#client.RPT_SQLstatement#</cfoutput><cfabort>   --->


