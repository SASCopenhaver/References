<!--- inc_createSelectBSC.cfm --->
<!--- 
client.CS_Search_ID = #FORM.h_CS_Search_ID#<br>
client.CS_Search_Nm = #client.CS_Search_Nm#<br>

client.CS_First_Nm = #client.CS_First_Nm#<br>
client.CS_Last_Nm = #client.CS_Last_Nm#<br>
client.CS_Gender = #client.CS_Gender#<br>
client.CS_From_Cntry = #client.CS_From_Cntry#<br>
client.CS_To_Cntry = #client.CS_To_Cntry#<br>
client.CS_Pgm_Type = #client.CS_Pgm_Type#<br>
client.CS_Year_Type = #client.CS_Year_Type#<br>
client.CS_Year = #client.CS_Year#<br>

 ---><!--- 1. FIRST NAME --->
<cfif #client.CS_First_Nm# EQ "">
	<cfset local.First_Nm = "">
<cfelse>
	<cfset local.First_Nm = " and UPPER(a.almn_frst_nm) like (UPPER('"&#client.CS_First_Nm#&"%')) ">
</cfif>
<!--- 2. LAST NAME --->
<cfif #client.CS_Last_Nm# EQ "">
	<cfset local.Last_Nm = "">
<cfelse>
	<cfset local.Last_Nm = " and UPPER(a.almn_last_nm) like (UPPER('"&#client.CS_Last_Nm#&"%')) ">
</cfif>
<!--- 3. GENDER --->
<cfif #client.CS_Gender# EQ "-1">
	<cfset local.Gender = "">
<cfelse>
	<cfset local.Gender = " and a.almn_sex_ind = '"&#client.CS_Gender#&"' ">
</cfif>
<!--- 4. COUNTRY FROM --->
<cfif #client.CS_From_Cntry# EQ "-1">
	<cfset local.From_Cntry = "">
<cfelse>
	<cfset local.From_Cntry = #client.CS_From_Cntry#>
	<cfset local.From_Cntry = " and p.pgm_from_cntry_cd  in ('"&#Replace(local.From_Cntry, ",", "','", "ALL")#&"') ">
</cfif>
<!--- 5. COUNTRY TO --->
<cfif #client.CS_To_Cntry# EQ "-1">
	<cfset local.To_Cntry = "">
<cfelse>
	<cfset local.To_Cntry = #client.CS_To_Cntry#>
	<cfset local.To_Cntry = " and p.pgm_to_cntry_cd  in ('"&#Replace(local.To_Cntry, ",", "','", "ALL")#&"') ">
</cfif>
<!--- 6. PROGRAM TYPE --->
<cfif #client.CS_Pgm_Type# EQ "-1">
	<cfset local.CS_Pgm_Type = "">
<cfelse>
	<cfset local.CS_Pgm_Type = #client.CS_Pgm_Type#>
	<cfset local.CS_Pgm_Type = " and p.pgm_type_cd  in ('"&#Replace(local.CS_Pgm_Type, ",", "','", "ALL")#&"') ">
</cfif>
<!--- 7. FISCAL OR PROGRAM START YEAR --->
<cfif #client.CS_Year_Type# EQ "-1">
	<cfset local.CS_Year_Type = "">
	<cfset local.CS_Year = "">
<cfelse>
	<cfif local.CS_Year_Type = "FY">
		<cfset local.CS_Year = #client.CS_Year#>
		<cfset local.CS_Year_Type = " and pgm_fy_dt = "&#local.CS_Year#>
	<cfelseif local.CS_Year_Type = "PS">
		<cfset local.CS_Year = #client.CS_Year#>
		<cfset local.CS_Year_Type = " and pgm_yr_dt = "&#local.CS_Year#>
	</cfif>
</cfif>







//////////////////////////////////////////////////////////////////////////////////////////////////////////
<cfcase value="SEARCH">
		<cfset client.SU_SearchID  = #FORM.h_SU_SearchID#>
		<cfset client.SU_SearchName  = #FORM.txt_SU_SearchName#>
		<cfset client.SU_FirstName = #Trim(FORM.txt_SU_FirstName)#>
		<cfset client.SU_LastName =  #Trim(FORM.txt_SU_LastName)#>
		<cfset client.SU_Sex = #FORM.ddlb_SU_Sex#>
		<cfset client.SU_CountryOfResidence = #FORM.ddlbm_SU_CountryOfResidence#>
		<cfset client.SU_CityOfResidence = #Trim(FORM.txt_SU_CityOfResidence)#>
		<cfset client.SU_Citizenship = #FORM.ddlbm_SU_Citizenship#>
		<cfset client.SU_Interests = #FORM.ddlbm_SU_Interests#>
		<cfset client.SU_FieldOfStudy = #FORM.txt_SU_FieldOfStudy#>
		<cfset client.SU_FY_Fr = #FORM.ddlb_SU_FY_Fr#>
		<cfset client.SU_FY_To = #FORM.ddlb_SU_FY_To#>
		<cfset client.SU_ProgrType = #FORM.ddlbm_SU_ProgrType#>
		<cfset client.SU_GrantCountry = #FORM.ddlbm_SU_GrantCountry#>
		<cfset client.SU_StratGoal = #FORM.ddlbm_SU_StratGoal#>
		<cfset client.SU_HostInst = #FORM.txt_SU_HostInst#>
		<cfset client.SU_CityVisited = #FORM.txt_SU_CityVisited#>
		<cfset client.SU_PrgrStart_Fr = #FORM.ddlb_SU_PrgrStart_Fr#>
		<cfset client.SU_PrgrStart_To = #FORM.ddlb_SU_PrgrStart_To#>
		
		
		
		<cfset client.SEARCH_TotalRecords = 0><!--- This is just variable declaration actual value for this 
													variable is received in _controlData.cfm under SEARCH --->
		<!--- //////////////////////////////////////////////////////////////////////////////////////////// --->
		<!--- ------------------------------------------------------------------------------------------- --->
		<!--- ------------------------------------------------------------------------------------------- --->
		<!--- 1. Analyze Search Criteria --->
		<!--- First Name --->
		<cfif #client.SU_FirstName# EQ ""><cfset local.FName = "">
		<cfelse><cfset local.FName = " and UPPER(a.almn_frst_nm) like (UPPER('"&#client.SU_FirstName#&"%')) "></cfif>
		<!--- -------------------- --->
		<!--- Last Name  --->
		<cfif #client.SU_LastName# EQ ""><cfset local.LName = "">
		<cfelse><cfset local.LName = " and UPPER(a.almn_last_nm) like (UPPER('"&#client.SU_LastName#&"%')) "></cfif>
		<!--- ---------- --->
		<!--- Alumni Gender  --->
		<cfif #client.SU_Sex# EQ "-1"><cfset local.Sex = "">
		<cfelse><cfset local.Sex = " and a.almn_sex_ind = '"&#client.SU_Sex#&"' "></cfif>
		<!--- -------------------- --->
		<!--- Country of Residence --->
		<cfif #client.SU_CountryOfResidence# EQ "-1"><cfset local.CountryOfResidence = "">
		<cfelse>
			<cfset local.CountryOfResidence = #client.SU_CountryOfResidence#>
			<cfset local.CountryOfResidence = " and a.almn_resdnc_cntry_cd in ('"&#Replace(local.CountryOfResidence, ",", "','", "ALL")#&"') ">
		</cfif>
		<!--- -------------------- --->
		<!--- City of Residence --->
		<cfif #client.SU_CityOfResidence# EQ ""><cfset local.CityOfResidence = "">
		<cfelse>
			<cfset local.CityOfResidence = " and UPPER(a.almn_resdnc_city_nm) like UPPER('"&#client.SU_CityOfResidence#&"%')"> 
		</cfif>
		<!--- ----------------- --->
		<!--- Citizenship Country --->
		<cfif #client.SU_Citizenship# EQ "-1"><cfset local.Citizenship = "">
		<cfelse>
			<cfset local.Citizenship = #client.SU_Citizenship#>
			<cfset local.Citizenship = " and a.almn_ctznsp_cntry_cd in ('"&#Replace(local.Citizenship, ",", "','", "ALL")#&"') ">
		</cfif>
		<!--- ----------------- --->
		<!--- INTEREST --->
		<cfif #client.SU_Interests# EQ "-1">
			<cfset local.tALMN_INTRST = "">
			<cfset local.Interests = "">
		<cfelse>
			<cfset local.tALMN_INTRST = " , ALMN_INTRST ai ">
			<cfset local.Interests = " and a.almn_id = ai.almn_intrst_almn_id(+) "&
							  		 " and ai.almn_intrst_cd in ("&#client.SU_Interests#&") ">
		</cfif>
		<!--- ----------------- --->
		<!--- FIELD OF STUDY --->
		<cfif #client.SU_FieldOfStudy# EQ "">
			<cfset local.FieldOfStudy = "">
		<cfelse>
			<cfset local.FieldOfStudy = " and p.pgm_field_stdy_cd = fs.field_stdy_cd(+) "&
										" and UPPER(fs.field_stdy_nm) like (UPPER('%"&#client.SU_FieldOfStudy#&"%')) ">
		</cfif>
		<!--- ----------------- --->
		<!--- Program Type --->
		<cfif #client.SU_ProgrType# EQ "-1">
			<cfset local.ProgrType = "">
		<cfelse>
			<cfset local.ProgrType = " and pt.pgm_type_cd in ("&#client.SU_ProgrType#&") ">
		</cfif>
		<!--- ----------------- --->
		<!--- Grant Country --->
		<cfif client.SU_GrantCountry EQ "-1">
			<cfset local.GrantCountry = "">
		<cfelse>
			<cfset local.GrantCountry = " and p.pgm_grants_cntry_cd in ('"&#Replace(client.SU_GrantCountry, ",", "','","ALL")#&"') ">
		</cfif>
		<!--- ----------------- --->
		<!--- Stratigic Goals --->
		<cfif client.SU_StratGoal EQ "-1">
			<!--- <cfset local.tUSIA_STRATEGIC_GOAL = ""> --->
			<cfset local.StratGoal = "">
		<cfelse>
			<!--- <cfset local.tUSIA_STRATEGIC_GOAL = " USIA_STRATEGIC_GOAL usg "> --->
			<cfset local.StratGoal = " and usg. in ('"&#Replace(client.SU_StratGoal, ",", "','","ALL")#&"') ">
			
		</cfif>
	    <!--- ----------------- --->
		<!--- Host Institution --->
		<cfif #client.SU_HostInst# EQ "">
			<cfset local.HostInst = "">
		<cfelse>
			<cfset local.HostInst = " and UPPER(p.pgm_host_instn_nm) like (UPPER('%"&#client.SU_HostInst#&"%')) ">
		</cfif>
		 <!--- ----------------- --->
		 
		 
		 <!--- City Visited ---> 
		 <cfif #client.SU_CityVisited# EQ "">
		 	<cfset local.tCITY_VISIT = "">
		 	<cfset local.CityVisited = "">
		 <cfelse>
		 	<cfset local.tCITY_VISIT = " , CITY_VISIT cv ">
		 	<cfset local.CityVisited = " and p.pgm_id = cv.city_visit_pgm_id (+) "&
									   " and UPPER(cv.city_visit_nm) like (UPPER('%"&#client.SU_CityVisited#&"%')) ">
		 </cfif>
		 <!--- ----------------- --->
		 <!--- Fiscal Year --->
		<cfif #client.SU_FY_Fr# NEQ "-1" AND #client.SU_FY_To# NEQ "-1">
			<cfset local.FiscalYear = " and (p.pgm_grants_fy_dt >= "&client.SU_FY_Fr&" and p.pgm_grants_fy_dt <= "&client.SU_FY_To&") ">
		<cfelseif #client.SU_FY_Fr# NEQ "-1" AND #client.SU_FY_To# EQ "-1">
			<cfset local.FiscalYear = " and (p.pgm_grants_fy_dt = "&client.SU_FY_Fr&" ) ">
		<cfelseif #client.SU_FY_Fr# EQ "-1" AND #client.SU_FY_To# EQ "-1">
			<cfset local.FiscalYear = "">
		<cfelseif #client.SU_FY_Fr# EQ "-1" AND #client.SU_FY_To# NEQ "-1">
			<cfset local.FiscalYear = "">
		</cfif>
		<!--- ----------------- --->
		<!--- Program Start Year --->
		 <cfif #client.SU_PrgrStart_Fr# NEQ "-1" AND #client.SU_PrgrStart_To# NEQ "-1">
			<cfset local.PgrStartYear = " and ( p.pgm_start_dt between to_date('1/1/"&#client.SU_PrgrStart_Fr#&"', 'mm/dd/yy') "&
                             			" and to_date('12/31/"&#client.SU_PrgrStart_To#&"', 'mm/dd/yy') ) ">
		<cfelseif #client.SU_PrgrStart_Fr# NEQ "-1" AND #client.SU_FY_To# EQ "-1">
			<cfset local.PgrStartYear = " and ( p.pgm_start_dt between to_date('1/1/"&#client.SU_PrgrStart_Fr#&"', 'mm/dd/yy') "&
                             			" and to_date('12/31/"&#client.SU_PrgrStart_Fr#&"', 'mm/dd/yy') ) ">
		<cfelseif #client.SU_PrgrStart_Fr# EQ "-1" AND #client.SU_PrgrStart_To# EQ "-1">
			<cfset local.PgrStartYear = "">
		<cfelseif #client.SU_PrgrStart_Fr# EQ "-1" AND #client.SU_PrgrStart_To# NEQ "-1">
			<cfset local.PgrStartYear = "">
		</cfif>
		<!--- ----------------- --->
		
		<!--- ------------------------------------------------------------------------------------------- --->
		<!--- ------------------------------------------------------------------------------------------- --->
		
		
		<cfset client.SEARCH_StrActualRecords = "insert into temp_searched_records "
												<!--- --------------------------------------------------- --->
												&" select "&#client.UserID#&", rownum, a.almn_id"
												<!--- NAME start --->
												&", DECODE(a.almn_pfx_dsc,NULL,'','No data','',InitCap(a.almn_pfx_dsc))"
												&"||' '||"
												&"DECODE(a.almn_frst_nm,NULL,'','No data','',InitCap(a.almn_frst_nm))"
												&"||' '||"
												&"DECODE(a.almn_midl_nm,NULL,'','No data','',Initcap(a.almn_midl_nm))"
												&"||' '||"
												&"DECODE(a.almn_last_nm,NULL,'','No data','',InitCap(a.almn_last_nm))"
												&"||' '||"
												&"DECODE(a.almn_sfx_dsc,NULL,'','No data','',InitCap(a.almn_sfx_dsc)) as TSR_NAME"
												<!--- NAME end ---> 
												&" ,DECODE(a.almn_sex_ind, NULL,'',UPPER(a.almn_sex_ind)) as TSR_SEX "
												&" ,DECODE(p.pgm_field_stdy_cd,NULL,'',fs.field_stdy_nm) as TSR_FIELD_STDY "
												&" ,NVL(TO_CHAR(p.pgm_grants_fy_dt),'') as TSR_FY "
												&" ,DECODE(p.pgm_type_cd,NULL,'',pt.pgm_type_nm) as TSR_PGM_TYPE "
												
												&" ,DECODE(p.pgm_grants_cntry_cd,NULL,'',p.pgm_grants_cntry_cd) as TSR_GRANT_CNTRY "
												&" ,DECODE(p.pgm_start_dt,NULL,'',TO_CHAR(p.pgm_start_dt,'YYYY')) as TSR_PGM_START_DT " 
												&" ,DECODE(TO_CHAR(p.pgm_updt_dt),NULL,'N','Y') as UPDT_DT "
												<!--- --------------------------------------------------- --->
												&" FROM ALMN a , PGM p "
														&", FIELD_STDY fs "
														&", PGM_TYPE pt  "
														&local.tALMN_INTRST
														&local.tCITY_VISIT
														<!--- &local.tUSIA_STRATEGIC_GOAL --->
												<!--- --------------------------------------------------- --->
												&" WHERE "
														&" a.almn_id = p.pgm_almn_id "
														<!--- Start Field of Study --->
														&" and p.pgm_field_stdy_cd = fs.field_stdy_cd(+) "
														<!--- End Field of Study --->
														<!--- Start Program Type --->
														&" and p.pgm_type_cd = pt.pgm_type_cd(+) "
														<!--- End Program Type --->
														&local.FName
														&local.LName
														&local.Sex
														&local.CountryOfResidence
														&local.CityOfResidence
														&local.Citizenship
														&local.Interests
														&local.FieldOfStudy
														&local.ProgrType
														&local.GrantCountry
														&local.HostInst
														&local.StratGoal
														&local.CityVisited
														&local.FiscalYear
														&local.PgrStartYear
														>
		
		<cfset client.OrderBy = " ORDER BY a.almn_last_nm ">
		<cfset client.ASC_DESC = " ASC ">
		<cfset client.SEARCH_StrActualRecordsOrderBy = client.SEARCH_StrActualRecords&client.OrderBy&client.ASC_DESC>
		
		<!--- <cfoutput>#client.SEARCH_StrActualRecords#</cfoutput><cfabort> --->
	</cfcase>