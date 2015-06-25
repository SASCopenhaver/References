
<cfoutput>
client.Usr_CD = #client.Usr_CD#<br><br>
<!--- inc_MergeDups_NAME.cfm: --->
local.Mrg_ALMN_ID = #client.AP_AlmnID#<br>
<br>
local.ALMN_PFX_DSC = #local.ALMN_PFX_DSC#<br>
local.ALMN_FRST_NM = #local.ALMN_FRST_NM#<br>
local.ALMN_MIDL_NM = #local.ALMN_MIDL_NM#<br>
local.ALMN_LAST_NM = #local.ALMN_LAST_NM#<br>
local.ALMN_LAST_NM2 = #local.ALMN_LAST_NM2#<br>
local.ALMN_SFX_DSC = #local.ALMN_SFX_DSC#<br>
<br>
<!--- inc_MergeDups_Sex_DOB.cfm: --->
local.ALMN_SEX_IND = #local.ALMN_SEX_IND#<br>
local.ALMN_DOB_DT = #local.ALMN_DOB_DT#<br>
<br>
<!--- inc_MergeDups_DCSD_DESBL.cfm: --->
local.ALMN_DCSD_IND = #local.ALMN_DCSD_IND#<br>
local.ALMN_DSABLD_IND = #local.ALMN_DSABLD_IND#<br>
<br>
<!--- inc_MergeDups_CTZNSP.cfm: --->
<!--- CNTRY OF Citizenship --->
local.ALMN_CTZNSP_CNTRY_CD = #local.ALMN_CTZNSP_CNTRY_CD#<br>
<!--- CNTRY OF Citizenship 2 --->
local.ALMN_CTZNSP_CNTRY_CD2 = #local.ALMN_CTZNSP_CNTRY_CD2#<br>
<br>
<!--- inc_MergeDups_RES_ADDR.cfm: --->
local.ALMN_RESDNC_ADRS_TXT = #local.ALMN_RESDNC_ADRS_TXT#<br>
local.ALMN_RESDNC_CITY_NM = #local.ALMN_RESDNC_CITY_NM#<br>
local.ALMN_RESDNC_STATE_PRVNC_NM = #local.ALMN_RESDNC_STATE_PRVNC_NM#<br>
local.ALMN_RESDNC_CNTRY_CD = #local.ALMN_RESDNC_CNTRY_CD#<br>
<br>
<!--- inc_MergeDups_BUS_ADDR.cfm: --->
local.ALMN_BSNS_ADRS_TXT = #local.ALMN_BSNS_ADRS_TXT#<br>
local.ALMN_BSNS_CITY_NM = #local.ALMN_BSNS_CITY_NM#<br>
local.ALMN_BSNS_STATE_PRVNC_NM = #local.ALMN_BSNS_STATE_PRVNC_NM#<br>
local.ALMN_BSNS_CNTRY_CD = #local.ALMN_BSNS_CNTRY_CD#<br>
<br>
<!--- inc_MergeDups_PRFRD_ADDR.cfm: --->
local.ALMN_PREFRD_ADRS_IND = #local.ALMN_PREFRD_ADRS_IND#<br>
<br>
<!--- inc_MergeDups_PHONE.cfm --->
local.ALMN_RESDNC_PHONE_NUM = #local.ALMN_RESDNC_PHONE_NUM#<br>
local.ALMN_BSNS_PHONE_NUM = #local.ALMN_BSNS_PHONE_NUM#<br>
local.ALMN_CELL_NUM = #local.ALMN_CELL_NUM#<br>
local.ALMN_OTHR_PHONE_NUM = #local.ALMN_OTHR_PHONE_NUM#<br>
<br>
<!--- inc_MergeDups_FAX.cfm --->
local.ALMN_FAX_NUM = #local.ALMN_FAX_NUM#<br>
<br>
<!--- inc_MergeDups_PRFRD_PHONE.cfm: --->
local.ALMN_PREFRD_PHONE_NUM_IND = #local.ALMN_PREFRD_PHONE_NUM_IND#<br>
<br>
<!--- inc_MergeDups_EMAIL.cfm: --->
local.ALMN_EMAIL1_TXT = #local.ALMN_EMAIL1_TXT#<br>
local.ALMN_EMAIL2_TXT = #local.ALMN_EMAIL2_TXT#<br>
<br>
<!--- inc_MergeDups_PRFRD_EMAIL.cfm --->
local.ALMN_PREFRD_EMAIL_IND = #local.ALMN_PREFRD_EMAIL_IND#<br>
<br>
<!--- inc_MergeDups_CONTACT.cfm --->
local.ALMN_CNTCT_IND = #local.ALMN_CNTCT_IND#<br>
<br>
<!--- inc_MergeDups_ELP.cfm --->
local.ALMN_ELP_SPEAK_FSI_LEVEL_NUM = #local.ALMN_ELP_SPEAK_FSI_LEVEL_NUM#<br>
local.ALMN_ELP_READ_FSI_LEVEL_NUM = #local.ALMN_ELP_READ_FSI_LEVEL_NUM#<br>
local.ALMN_ELP_COMP_FSI_LEVEL_NUM = #local.ALMN_ELP_COMP_FSI_LEVEL_NUM#<br>
<br>
<!--- inc_MergeDups_COMMENTS.cfm --->
local.ALMN_NOTES_TXT = #local.ALMN_NOTES_TXT#<br>
</cfoutput><cfabort>