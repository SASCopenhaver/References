create or replace package PACK_ALUMNI_ARCHIVE authid definer is

  -- Author  : SSURIKOV
  -- Created : 1/4/2005 2:15:00 PM
  -- Purpose : ALUMNI_ARCHIVE

  -- Public type declarations
  type refc_Base is REF CURSOR;
  ---================================================================================
  procedure sp_getNavigation(argUsr_Role_ID   IN NUMBER,
                             rc_getNavigation OUT refc_Base);
  ---================================================================================
  procedure sp_getAllNavigationItems(rc_getAllNavigationItems OUT refc_Base,
                                     rc_getUserRole_NavigItem OUT refc_Base);
  ---================================================================================
  procedure sp_getTopicTypes(rc_getTopicTypes OUT refc_Base);
  ---================================================================================
  procedure sp_AuthenticateUser(arg_Usr_UName IN VARCHAR2,
                                arg_Usr_Pass  IN VARCHAR2,
                                rc_Usr        OUT refc_Base);
  ---================================================================================
  procedure sp_getSecretQuestions(rc_SQ OUT refc_Base);
  ---================================================================================
  procedure sp_getTopics(argCallPageID       IN NUMBER,
                         rc_getAdvertisement OUT refc_Base,
                         rc_getFeature       OUT refc_Base,
                         rc_getStory         OUT refc_Base,
                         rc_getCapsuleStory  OUT refc_Base,
                         rc_getNews          OUT refc_Base);

  ---================================================================================
  procedure sp_getPrefix(rc_getPrefix OUT refc_Base);
  ---================================================================================
  ---================================================================================
  procedure sp_getAppRoles(rc_getAppRoles OUT refc_Base);
  ---================================================================================
  procedure sp_getCountryCityPost(rc_getCountry           OUT refc_Base,
                                  rc_getCityPost          OUT refc_Base,
                                  rc_getAdditionalCountry OUT refc_Base);
  ---================================================================================
  procedure sp_InsUpdRole(arg_app_role_id          IN NUMBER,
                          arg_app_role_nm          IN VARCHAR2,
                          arg_app_role_desc        IN VARCHAR2,
                          arg_app_role_super_id    IN NUMBER,
                          arg_ValsFromRadioButtons IN VARCHAR2,
                          arg_num_of_loops         IN NUMBER,
                          rc_getAppRoleID          OUT refc_Base);
  ---================================================================================
  procedure sp_DeleteRole(arg_app_role_id IN NUMBER);
  ---================================================================================
  procedure sp_InsUpdNewuserRegistration(arg_NUR_Usr_ID        IN NUMBER,
                                         arg_NUR_Usr_Prfx      IN VARCHAR2,
                                         arg_NUR_Usr_FName     IN VARCHAR2,
                                         arg_NUR_Usr_MI        IN VARCHAR2,
                                         arg_NUR_Usr_LName     IN VARCHAR2,
                                         arg_NUR_Usr_Phone     IN VARCHAR2,
                                         arg_NUR_Usr_Ext       IN VARCHAR2,
                                         arg_NUR_Usr_Email     IN VARCHAR2,
                                         arg_NUR_Usr_UserName  IN VARCHAR2,
                                         arg_NUR_Usr_Pass      IN VARCHAR2,
                                         arg_NUR_Usr_AARole_ID IN NUMBER,
                                         --------------------------------
                                         arg_NUR_Usr_SecQ   IN VARCHAR2,
                                         arg_NUR_Usr_Answer IN VARCHAR2,
                                         ----------------------------------
                                         arg_NUR_Usr_Depart_Dt IN VARCHAR2,
                                         arg_NUR_AuthAgent_ID  IN NUMBER
                                         --------------------------------
                                        ,
                                         arg_NUR_Usr_CntryOfAssignmt_CD IN VARCHAR2,
                                         arg_NUR_DOS_OfficeCode_CD      IN VARCHAR2,
                                         arg_NUR_Usr_CityPostOfAss_NM   IN VARCHAR2
                                         --------------------------------
                                        ,
                                         arg_NUR_Usr_AddnlCountry_CD IN VARCHAR2,
                                         arg_NUR_NumOfLoops          IN NUMBER,
                                         arg_NUR_Usr_Comments        IN VARCHAR2
                                         --------------------------------
                                        ,
                                         rc_getUserID OUT refc_Base);

  ---================================================================================
  procedure sp_get_DOS_OfficeCode(rc_get_DOS_OfficeCode OUT refc_Base);
  ---================================================================================
  procedure sp_get_USR_Pass(arg_PASS_Email  IN VARCHAR2,
                            arg_PASS_SecQ   IN VARCHAR2,
                            arg_PASS_Answer IN VARCHAR2,
                            rc_get_USR_Pass OUT refc_Base);
  ---================================================================================
  procedure get_NUR_UserIDAndStatus(arg_NUR_Usr_Email IN VARCHAR2
                                    --
                                   ,
                                    rc_NUR_UserIDAndStatus OUT refc_Base);
  ---================================================================================
  procedure sp_get_NUR_Usr_PreReg(arg_NUR_Usr_ID    IN NUMBER,
                                  arg_NUR_Usr_IsAct IN VARCHAR2,
                                  rc_NUR_Usr_PreReg OUT refc_Base,
                                  rc_NUR_PAO_Posts  OUT refc_Base);

  ---================================================================================
 procedure sp_getAuthAgent(arg_NUR_Usr_CntryOfAssignmt_CD IN VARCHAR2,
                            arg_NUR_Usr_CityPostOfAss_NM   IN VARCHAR2,
                            arg_NUR_Usr_NewCityPostOfAss   IN VARCHAR2,
                            arg_NUR_DOS_OfficeCode_CD      IN VARCHAR2
                            ---
                           ,
                            rc_getAuthAgent OUT refc_Base,
                            rc_getInactiveAuthAgent OUT refc_Base);
  ---================================================================================

  procedure sp_getListOfUsers(arg_Usr_CD           IN NUMBER -- This is CD(or ID) of the one who's running application
                             ,
                              arg_RequestedUsrType IN VARCHAR2 -- could be A,I,H,N
                             ,
                              rc_ListOfUsers       OUT refc_Base,
                              rc_getUsrComment     OUT refc_Base,
                              rc_getAlphaSearch    OUT refc_Base--,
                              --rc_getDistinctCntryList OUT refc_Base
                              );

  ---================================================================================
  procedure sp_getCustomSearches(arg_Usr_CD         IN NUMBER,
                                 arg_SC_Search_Type IN VARCHAR2,
                                 rc_CustomSearches  OUT refc_Base);
  ---================================================================================
  procedure sp_getAlnmProfile(arg_AP_AlmnID     IN NUMBER,
                              rc_getAlnmProfile OUT refc_Base -- 1. --
                             ,
                              rc_getPgm         OUT refc_Base -- 2. --
                             ,
                              rc_Job            OUT refc_Base -- 3. --
                              );
  ---================================================================================
  procedure sp_getInterests(rc_getInterests OUT refc_Base);
  ---================================================================================
  procedure sp_getGA_Usr(arg_GA_UsrID      IN NUMBER,
                         rc_getGA_Usr      OUT refc_Base,
                         rc_gerGA_UsrCntry OUT refc_Base);
  ---================================================================================
  procedure sp_getSelfData(arg_Usr_CD        IN NUMBER,
                           rc_getSelfData    OUT refc_Base,
                           rc_getAddlCntries OUT refc_Base);
  ---================================================================================
  procedure sp_getUsrStatus(rc_getUsrStatus OUT refc_Base);
  ---================================================================================
  procedure sp_RemoveUsr(arg_GA_UsrID IN NUMBER);
  ---================================================================================
  procedure sp_putUsrOnHold(arg_GA_UsrID IN NUMBER);
  ---================================================================================
  procedure sp_ApprvUsr(arg_GA_UsrID IN NUMBER);
  ---================================================================================
  procedure sp_getCountUsrsByStatus(arg_Usr_CD              IN NUMBER,
                                    rc_getListOfUsers_StatN OUT refc_Base,
                                    rc_getListOfUsers_StatH OUT refc_Base,
                                    rc_getListOfUsers_StatA OUT refc_Base,
                                    rc_getListOfUsers_StatI OUT refc_Base);
  ---================================================================================
  procedure sp_UpdUserData(arg_UP_UsrID       IN NUMBER,
                           arg_UP_UsrPrfx     IN VARCHAR2,
                           arg_UP_UsrFName    IN VARCHAR2,
                           arg_UP_UsrMI       IN VARCHAR2,
                           arg_UP_UsrLName    IN VARCHAR2,
                           arg_UP_UsrPhone    IN VARCHAR2,
                           arg_UP_UsrExt      IN VARCHAR2,
                           arg_UP_UsrEmail    IN VARCHAR2,
                           arg_UP_UsrName     IN VARCHAR2,
                           arg_UP_UsrPass     IN VARCHAR2,
                           arg_UP_UsrRoleID   IN NUMBER,
                           arg_UP_UsrIsAct    IN VARCHAR2,
                           arg_UP_UsrDepartDT IN VARCHAR2
                           ---
                          ,
                           arg_UP_UsrCntryOfAssgnCD IN VARCHAR2,
                           arg_UP_UsrCityPostNM     IN VARCHAR2);
  ---================================================================================
  procedure sp_getCountries(arg_Usr_CD      in NUMBER,
                            rc_getCntryFrom OUT refc_Base,
                            rc_getCntryTo   OUT refc_Base);

  ---================================================================================
  procedure sp_getPrograms(rc_getPrograms OUT refc_Base);
  ---================================================================================
  procedure sp_getPgmFiscalYr(rc_getPgmFiscalYr OUT refc_Base);
  ---================================================================================
  procedure sp_getPgmStartYr(rc_getPgmStartYr OUT refc_Base);
  ---================================================================================
  procedure sp_InsUpdCustomSearch(arg_CS_Search_ID in NUMBER,
                                  arg_Usr_CD       in NUMBER,
                                  arg_CS_Search_Nm in varchar2,
                                  arg_CS_First_Nm  in varchar2,
                                  arg_CS_Last_Nm   in varchar2,
                                  arg_CS_Gender    in varchar2,
                                  --
                                  arg_CS_From_Cntry in varchar2,
                                  arg_CS_To_Cntry   in varchar2,
                                  --
                                  arg_CS_Pgm_Type in varchar2,
                                  --
                                  arg_CS_Year_Type in varchar2,
                                  arg_CS_Year      in varchar2,
                                  --
                                  arg_CS_Citznsp_Cntry_CD in varchar2,
                                  arg_CS_Resdnc_Cntry_CD  in varchar2,
                                  --
                                  arg_SC_Search_Type in varchar2,
                                  rc_CustomSearchID  OUT refc_Base);
  ---================================================================================
  procedure sp_InsUpdAdvCustomSearch(arg_CS_Search_ID in NUMBER,
                                     arg_Usr_CD       in NUMBER,
                                     arg_CS_Search_Nm in varchar2,
                                     arg_CS_First_Nm  in varchar2,
                                     arg_CS_Last_Nm   in varchar2,
                                     arg_CS_Gender    in varchar2,
                                     --
                                     arg_CS_From_Cntry in varchar2,
                                     arg_CS_To_Cntry   in varchar2,
                                     --
                                     arg_CS_Pgm_Type in varchar2,
                                     --
                                     arg_CS_Year_Type in varchar2,
                                     arg_CS_Year      in varchar2,
                                     --
                                     arg_CS_Field_Stdy_Nm    in varchar2,
                                     arg_CS_Citznsp_Cntry_CD in varchar2,
                                     arg_CS_Resdnc_Cntry_CD  in varchar2,
                                     --
                                     arg_CS_Resdnc_City_Nm in varchar2,
                                     arg_CS_Host_Instn_Nm  in varchar2,
                                     arg_CS_Visit_City_Nm  in varchar2,
                                     arg_SC_Search_Type    IN VARCHAR2,
                                     rc_CustomSearchID     OUT refc_Base);
  ---================================================================================
  procedure sp_getCustomSearch(arg_CS_Search_ID   in number,
                               rc_getCustomSearch OUT refc_Base);
  ---================================================================================
  procedure sp_deleteCustomSearch(arg_CS_Search_ID IN NUMBER);
  ---================================================================================
  procedure sp_execSQL_SelectCount(arg_execSQL_SelectCount IN VARCHAR2,
                                   arg_Usr_CD              IN number,
                                   rc_execSQL_SelectCount  OUT refc_Base);
  ---================================================================================
  procedure sp_execSQL(arg_execSQL IN VARCHAR2, arg_Usr_CD IN NUMBER);
  ---================================================================================
  procedure sp_execSQL_RPT(arg_execSQL IN VARCHAR2, arg_Usr_CD IN NUMBER);
  ---================================================================================
  procedure sp_execSQL_StatRPT(arg_execSQL IN VARCHAR2,
                               arg_Usr_CD  IN NUMBER);

  ---================================================================================
  procedure sp_countSearchedRecords(arg_Usr_CD              IN NUMBER,
                                    rc_countSearchedRecords OUT refc_Base);
  ---================================================================================
  procedure sp_getSearchedRecords(arg_Usr_CD            IN NUMBER,
                                  rc_getSearchedRecords OUT refc_Base);
  ---================================================================================
  procedure sp_getRprtRecords(arg_Usr_CD               IN NUMBER,
                              arg_Rpt_Type             IN VARCHAR2,
                              arg_File_Type            IN VARCHAR2,
                              rc_getRptSearchedRecords OUT refc_Base);
  ---================================================================================
  procedure sp_deleteSearchedRecords(arg_Usr_CD IN NUMBER);
  ---================================================================================

  procedure sp_UpdateAlmnRecord(arg_AP_AlmnID   IN NUMBER,
                                arg_AP_Pfx      in varchar2,
                                arg_AP_Frst_Nm  in varchar2,
                                arg_AP_Midl_Nm  in varchar2,
                                arg_AP_Last_Nm  in varchar2,
                                arg_AP_Last_Nm2 in varchar2,
                                arg_AP_Sfx      in varchar2,
                                ----
                                arg_AP_Sex in varchar2,
                                arg_AP_DOB in varchar2,
                                ---
                                arg_AP_Ctznsp_Cd  in varchar2,
                                arg_AP_Ctznsp_Cd2 in varchar2,
                                ----
                                arg_AP_Cntct_Ind in varchar2,
                                arg_AP_Dcsd      in varchar2,
                                arg_AP_Dsabld    in varchar2,
                                ---
                                arg_AP_Resdnc_Adrs_Txt       in varchar2,
                                arg_AP_Resdnc_City_Nm        in varchar2,
                                arg_AP_Resdnc_State_Prvnc_Nm in varchar2,
                                arg_AP_Resdnc_Postl_CD       in varchar2,
                                arg_AP_Resdnc_Cntry_Cd       in varchar2,
                                ---
                                arg_AP_legal_state_cd      in varchar2,
                                arg_AP_cngrtsnl_dstrct_num in NUMBER,
                                ---
                                arg_AP_Bsns_Nm             in varchar2,
                                arg_AP_Bsns_Adrs_Txt       in varchar2,
                                arg_AP_Bsns_City_Nm        in varchar2,
                                arg_AP_Bsns_State_Prvnc_Nm in varchar2,
                                arg_AP_Bsns_Postl_CD       in varchar2,
                                arg_AP_Bsns_Cntry_Cd       in varchar2,
                                ----
                                arg_AP_Prfrd_Adrs_ind in varchar2,
                                ----
                                arg_AP_Resdnc_Phone_Num    in varchar2,
                                arg_AP_Bsns_Phone_Num      in varchar2,
                                arg_AP_Cell_Num            in varchar2,
                                arg_AP_Othr_Phone_Num      in varchar2,
                                arg_AP_Prfrd_Phone_Num_Ind in varchar2,
                                arg_AP_Fax_Num             in varchar2,
                                ---
                                arg_AP_Email1_txt          in varchar2,
                                arg_AP_Email2_txt          in varchar2,
                                arg_AP_Prfrd_Email_Num_Ind in varchar2,
                                ---
                                arg_AP_Intrst in number,
                                ---
                                arg_AP_speak_level IN NUMBER,
                                arg_AP_read_level  IN NUMBER,
                                arg_AP_comp_level  IN NUMBER,
                                ---
                                arg_AP_Notes_Txt in varchar2,
                                ---
                                arg_Usr_CD IN NUMBER,
                                ---
                                arg_AP_New_title_txt IN varchar2,
                                arg_NumOfLoops       in number,
                                arg_AP_New_instn_nm  IN varchar2,
                                arg_AP_checked_cbx   IN varchar2

                                );
  ---================================================================================
  procedure sp_getHelpTopics(arg_TopicTitleID IN NUMBER,
                             rc_getHelpTopics OUT refc_Base);
  ---================================================================================
  procedure sp_getCtrlHelp(arg_HelpItemID IN NUMBER,
                           rc_getCtrlHelp OUT refc_Base);
  ---================================================================================
  procedure sp_getHSandCV(arg_CntryToCD   IN VARCHAR2,
                          rc_getHostInst  OUT refc_Base,
                          rc_getCityVisit OUT refc_Base);
  ---================================================================================

  ---================================================================================
  procedure sp_UpdUserProfileByAuthAgent(arg_UP_Usr_ID                IN NUMBER,
                                         arg_UP_Usr_Prfx              in varchar2,
                                         arg_UP_Usr_FName             in varchar2,
                                         arg_UP_Usr_MI                in varchar2,
                                         arg_UP_Usr_LName             in varchar2,
                                         arg_UP_Usr_Phone             in varchar2,
                                         arg_UP_Usr_Ext               in varchar2,
                                         arg_UP_Usr_Email             in varchar2,
                                         arg_UP_Usr_UserName          in varchar2,
                                         arg_UP_Usr_Pass              in varchar2,
                                         arg_UP_Usr_Status_CD         in varchar2,
                                         arg_UP_Usr_AArchiveRole_ID   IN NUMBER,
                                         arg_UP_Usr_Est_Depart        IN varchar2,
                                         arg_UP_Usr_CntryOfAss_CD     in varchar2,
                                         arg_UP_Usr_CityPostOfAss_NM  in varchar2,
                                         arg_UP_NewPostCity           in varchar2,
                                         arg_UP_Usr_AddnlCountry      in varchar2,
                                         arg_UP_Usr_DOS_OfficeCode_CD in varchar2,
                                         arg_UP_NumOfLoops            in number);
  ---================================================================================
  procedure sp_SelfUpdUsrProfile(arg_UP_Usr_ID       IN NUMBER,
                                 arg_UP_Usr_Prfx     in varchar2,
                                 arg_UP_Usr_FName    in varchar2,
                                 arg_UP_Usr_MI       in varchar2,
                                 arg_UP_Usr_LName    in varchar2,
                                 arg_UP_Usr_Phone    in varchar2,
                                 arg_UP_Usr_Ext      in varchar2,
                                 arg_UP_Usr_Email    in varchar2,
                                 arg_UP_Usr_UserName in varchar2,
                                 arg_UP_Usr_Pass     in varchar2,
                                 arg_UP_Comments     in varchar2,
                                 arg_UP_ValReqChgs   in varchar2);
  ---================================================================================
  procedure sp_Time_Watch(arg_Usr_ID in NUMBER, arg_Point IN varchar2);
  ---================================================================================
  procedure sp_getTopicsToEdit( arg_TEPageID  IN NUMBER
                               ,arg_TETxtType IN VARCHAR2
                               ,rc_getTopicsToEdit OUT refc_Base);
  ---================================================================================
  procedure sp_TOPIC_DELETE(arg_TopicID IN NUMBER);
  ---================================================================================
  procedure sp_TOPIC_UPDATE(arg_TopicID IN NUMBER,
                            arg_topic_title IN VARCHAR2,
                            arg_topic_txt IN VARCHAR2,
                            arg_topic_seq_on_page IN NUMBER,
                            arg_topic_is_active IN VARCHAR2,
                            arg_topic_exprtn_dt IN VARCHAR2,
                            arg_Elmt_ID_Val IN VARCHAR2,
                            arg_NumOfLoops IN NUMBER);
  ---================================================================================
  procedure sp_TOPIC_INSERT(arg_TopicID IN NUMBER,
                            arg_topic_security_tree_id IN NUMBER,
                            arg_topic_navigation_cd IN VARCHAR2,
                            arg_topic_title IN VARCHAR2,
                            arg_topic_txt IN VARCHAR2,
                            arg_topic_seq_on_page IN NUMBER,
                            arg_topic_is_active IN VARCHAR2,
                            arg_topic_exprtn_dt IN VARCHAR2 );
  ---================================================================================
  procedure sp_getFilterCriteria (rc_sp_getFilterCriteria OUT refc_Base);
  ---================================================================================
  procedure sp_checkDups (arg_AlmnID IN NUMBER,
                          rc_checkDups OUT refc_Base);
  ---================================================================================
  procedure sp_getRecordsToMerge(arg_Usr_CD IN NUMBER,
                                 arg_ListOfIDsToMerge IN VARCHAR2,
                                 arg_NumOfLoops IN NUMBER,
                                 rc_getRecordsToMerge OUT refc_Base);
  ---================================================================================
  procedure sp_moveOrgAlmnRecds (arg_AlmnID IN NUMBER);
  ---================================================================================
  procedure sp_createMergedRecd (
                                arg_Usr_CD IN NUMBER,
                                arg_AlmnID IN NUMBER,
                                arg_MRG_ALMN_ID IN NUMBER,
                                arg_ALMN_PFX_DSC IN VARCHAR2,
                                arg_ALMN_FRST_NM  IN VARCHAR2,
                                arg_ALMN_MIDL_NM  IN VARCHAR2,
                                arg_ALMN_LAST_NM  IN VARCHAR2,
                                arg_ALMN_LAST_NM2  IN VARCHAR2,
                                arg_ALMN_SFX_DSC  IN VARCHAR2,
                                --
                                arg_ALMN_SEX_IND  IN VARCHAR2,
                                arg_ALMN_DOB_DT  IN VARCHAR2,
                                --
                                arg_ALMN_DCSD_IND  IN VARCHAR2,
                                arg_ALMN_DSABLD_IND  IN VARCHAR2,
                                --
                                 arg_ALMN_CTZNSP_CNTRY_CD IN VARCHAR2,
                                --
                                 arg_ALMN_CTZNSP_CNTRY_CD2 IN VARCHAR2,
                                --
                                 arg_ALMN_RESDNC_ADRS_TXT IN VARCHAR2,
                                 arg_ALMN_RESDNC_CITY_NM IN VARCHAR2,
                                 arg_ALMN_RESDNC_STATE_PRVNC_NM IN VARCHAR2,
                                 arg_ALMN_RESDNC_CNTRY_CD IN VARCHAR2,
                                --
                                 arg_ALMN_BSNS_ADRS_TXT IN VARCHAR2,
                                 arg_ALMN_BSNS_CITY_NM IN VARCHAR2,
                                 arg_ALMN_BSNS_STATE_PRVNC_NM IN VARCHAR2,
                                 arg_ALMN_BSNS_CNTRY_CD IN VARCHAR2,
                                --
                                 arg_ALMN_PREFRD_ADRS_IND IN VARCHAR2,
                                --
                                 arg_ALMN_RESDNC_PHONE_NUM IN VARCHAR2,
                                 arg_ALMN_BSNS_PHONE_NUM IN VARCHAR2,
                                 arg_ALMN_CELL_NUM IN VARCHAR2,
                                 arg_ALMN_OTHR_PHONE_NUM IN VARCHAR2,
                                --
                                 arg_ALMN_FAX_NUM IN VARCHAR2,
                                --
                                 arg_ALMN_PREFRD_PHONE_NUM_IND IN VARCHAR2,
                                --
                                 arg_ALMN_EMAIL1_TXT IN VARCHAR2,
                                 arg_ALMN_EMAIL2_TXT IN VARCHAR2,
                                --
                                 arg_ALMN_PREFRD_EMAIL_IND IN VARCHAR2,
                                --
                                 arg_ALMN_CNTCT_IND IN VARCHAR2 ,
                                 --
                                 arg_ALMN_ELP_SPEAK_FSI_NUM IN NUMBER,
                                 arg_ALMN_ELP_READ_FSI_NUM IN NUMBER,
                                 arg_ALMN_ELP_COMP_FSI_NUM IN NUMBER,
                                 --
                                 arg_ALMN_NOTES_TXT IN VARCHAR2
                                 );

  ---================================================================================
  procedure sp_getPgmRecds (arg_AlmnID IN NUMBER,
                            rc_getPgmRecds OUT refc_Base,
                            rc_getAlmnName OUT refc_Base);
  ---================================================================================
  ---================================================================================
  ---================================================================================
  ---================================================================================


  ---  FUNCTIONS
  ---================================================================================
  function f_getRegionCD(arg_Country_CD IN VARCHAR2) return VARCHAR2;
  ---================================================================================
  function f_getRoleNM(arg_role_cd IN NUMBER) return VARCHAR2;
  ---================================================================================
  function f_getRegnNM(arg_RegnCD IN VARCHAR2) return VARCHAR2;
  --=================================================================================
  function f_getCntryNM(arg_CntryCD IN VARCHAR2) return VARCHAR2;
  --=================================================================================
  function f_getStatNm(arg_Usr_Is_Act IN VARCHAR2) return VARCHAR2;
  --=================================================================================
  function f_getComments(arg_GA_UsrID IN NUMBER, arg_Comm_Type IN VARCHAR2)
    return VARCHAR2;
  --=================================================================================
  function f_getHostInst(arg_pgm_id  IN NUMBER,
                         arg_almn_id IN NUMBER,
                         arg_host    IN VARCHAR2,
                         arg_cntry   IN VARCHAR2) return VARCHAR2;
  --=================================================================================
  function f_getHostInst(arg_pgm_id IN NUMBER, arg_almn_id IN NUMBER)
    return VARCHAR2;
  --=================================================================================
  function f_getCityVisited(arg_pgm_id  IN NUMBER,
                            arg_almn_id IN NUMBER,
                            arg_city    IN VARCHAR2,
                            arg_cntry   IN VARCHAR2) return VARCHAR2;
  --=================================================================================
  function f_getCityVisited(arg_pgm_id IN NUMBER, arg_almn_id IN NUMBER)
    return VARCHAR2;
  --=================================================================================
  function f_getJobs(arg_almn_id IN NUMBER) return VARCHAR2;
  --=================================================================================
  function f_getInterests(arg_almn_id IN NUMBER) return VARCHAR2;
  --=================================================================================
  function f_gerPgmName(arg_pgm_id IN NUMBER) return VARCHAR2;
  --=================================================================================
  function f_getFieldStdyNM(arg_pgm_field_stdy_cd IN NUMBER) return VARCHAR2;
  --=================================================================================
  --=================================================================================
  --=================================================================================

  /*
  function f_getVal(arg_ValType IN VARCHAR2,
                    arg_AlmnID IN NUMBER) return VARCHAR2;
  */
  --=================================================================================
  pragma RESTRICT_REFERENCES(f_getRegionCD, WNDS, WNPS, RNPS);
  pragma RESTRICT_REFERENCES(f_getRoleNM, WNDS, WNPS, RNPS);
  pragma RESTRICT_REFERENCES(f_getRegnNM, WNDS, WNPS, RNPS);
  pragma RESTRICT_REFERENCES(f_getCntryNM, WNDS, WNPS, RNPS);
  pragma RESTRICT_REFERENCES(f_getStatNm, WNDS, WNPS, RNPS);
  pragma RESTRICT_REFERENCES(f_getComments, WNDS, WNPS, RNPS);

end PACK_ALUMNI_ARCHIVE;
/
create or replace package body PACK_ALUMNI_ARCHIVE is

  ---================================================================================
  procedure sp_getNavigation(argUsr_Role_ID   IN NUMBER,
                             rc_getNavigation OUT refc_Base) is
  Begin
    OPEN rc_getNavigation FOR
      select st_id,
             st_nm,
             st_loc,
             st_parent_id,
             st_is_act,
             st_seq,
             st_call_file
        from security_tree st, security_tree_roles str
       where st.st_id = str.str_st_id
         and str.str_r_id = argUsr_Role_ID
         and st.st_is_act = 'A'
       order by st_seq;

  End sp_getNavigation;
  ---================================================================================
  procedure sp_getAllNavigationItems(rc_getAllNavigationItems OUT refc_Base,
                                     rc_getUserRole_NavigItem OUT refc_Base) is
  Begin
    OPEN rc_getAllNavigationItems FOR
      select st_id,
             st_nm,
             st_loc,
             st_parent_id,
             st_is_act,
             st_seq,
             st_call_file
        from security_tree s
       where s.st_id < 1000
       order by st_seq;
    ---
    OPEN rc_getUserRole_NavigItem FOR
      select str_st_id, str_r_id
        from security_tree_roles
       where str_st_id < 1000;

  End sp_getAllNavigationItems;
  ---================================================================================
  procedure sp_getTopicTypes(rc_getTopicTypes OUT refc_Base) is
  Begin
    OPEN rc_getTopicTypes FOR
      select item, item_cd, item_desc
        from code_lk ck
       where ck.item = 'TOPIC_TYPE'
       order by ck.item_desc;
  End sp_getTopicTypes;
  ---================================================================================
  procedure sp_getInterests(rc_getInterests OUT refc_Base) is
  Begin
    OPEN rc_getInterests FOR
      select intrst_cd, intrst_type_cd, intrst_nm
        from intrst
       order by intrst_nm;

  End sp_getInterests;
  ---================================================================================
  procedure sp_AuthenticateUser(arg_Usr_UName IN VARCHAR2,
                                arg_Usr_Pass  IN VARCHAR2,
                                rc_Usr        OUT refc_Base) is
  Begin
    OPEN rc_Usr FOR
      select usr_cd,
             decode(usr_pfx, '-1', '', null, '', usr_pfx) AS usr_pfx,
             usr_fname,
             NVL(usr_mi, '') AS usr_mi,
             usr_lname,
             NVL(usr_phone, '') AS usr_phone,
             NVL(usr_ext, '') AS usr_ext,
             NVL(usr_email, '') AS usr_email,
             usr_uname,
             usr_pass,
             usr_role_cd,
             usr_is_act,
             NVL(usr_est_depart_dt, '') AS usr_est_depart_dt,
             usr_auth_agent_id
        from usr u
       where UPPER(u.usr_uname) = UPPER(arg_Usr_UName)
         and UPPER(u.usr_pass) = UPPER(arg_Usr_Pass)
         and u.usr_is_act in ('A', 'H');
  End sp_AuthenticateUser;
  ---================================================================================
  procedure sp_getSecretQuestions(rc_SQ OUT refc_Base) is
  Begin
    OPEN rc_SQ FOR
      select c.item_cd, c.item_desc
        from code_lk c
       where c.item = 'SECR_QUEST';
  End sp_getSecretQuestions;
  ---================================================================================

  ---================================================================================
  procedure sp_getTopics(argCallPageID       IN NUMBER,
                         rc_getAdvertisement OUT refc_Base, -- 1
                         rc_getFeature       OUT refc_Base, -- 2
                         rc_getStory         OUT refc_Base, -- 3
                         rc_getCapsuleStory  OUT refc_Base, -- 4
                         rc_getNews          OUT refc_Base
                         ) is
  Begin
    -- 1:
    OPEN rc_getAdvertisement FOR
      select topic_id,
             topic_security_tree_id,
             topic_navigation_cd,
             topic_title,
             topic_txt,
             topic_seq_on_page,
             topic_is_active,
             topic_exprtn_dt
        from topic t
       where t.topic_security_tree_id = argCallPageID
         and t.topic_navigation_cd = 'AD'
         and t.topic_is_active = 'A'
       order by t.topic_seq_on_page;

    -- 2:
    OPEN rc_getFeature FOR
      select topic_id,
             topic_security_tree_id,
             topic_navigation_cd,
             topic_title,
             topic_txt,
             topic_seq_on_page,
             topic_is_active,
             topic_exprtn_dt
        from topic t
       where t.topic_security_tree_id = argCallPageID
         and t.topic_navigation_cd = 'FT'
         and t.topic_is_active = 'A'
       order by t.topic_seq_on_page;

    -- 3:
    OPEN rc_getStory FOR
      select topic_id,
             topic_security_tree_id,
             topic_navigation_cd,
             topic_title,
             topic_txt,
             topic_seq_on_page,
             topic_is_active,
             topic_exprtn_dt
        from topic t
       where t.topic_security_tree_id = argCallPageID
         and t.topic_navigation_cd = 'ST'
         and t.topic_is_active = 'A'
       order by t.topic_seq_on_page;

    -- 4:
    OPEN rc_getCapsuleStory FOR
      select topic_id,
             topic_security_tree_id,
             topic_navigation_cd,
             topic_title,
             topic_txt,
             topic_seq_on_page,
             topic_is_active,
             topic_exprtn_dt
        from topic t
       where t.topic_security_tree_id = argCallPageID
         and t.topic_navigation_cd = 'CS'
         and t.topic_is_active = 'A'
       order by t.topic_seq_on_page;

     -- 5:
     OPEN rc_getNews FOR
     select topic_id,
             topic_security_tree_id,
             topic_navigation_cd,
             topic_title,
             topic_txt,
             topic_seq_on_page,
             topic_is_active,
             topic_exprtn_dt
        from topic t
       where t.topic_security_tree_id = argCallPageID
         and t.topic_navigation_cd = 'NW'
         and t.topic_is_active = 'A'
       order by t.topic_seq_on_page;

  End sp_getTopics;
  ---================================================================================
  procedure sp_getPrefix(rc_getPrefix OUT refc_Base) is
  Begin
    OPEN rc_getPrefix FOR
      select c.item as item_type, item_cd, item_desc
        from code_lk c
       where item = 'PREFIX'
       order by 2;
  End sp_getPrefix;
  ---================================================================================
  procedure sp_getAppRoles(rc_getAppRoles OUT refc_Base) is
  Begin
    OPEN rc_getAppRoles FOR
      select ar1.app_role_id,
             ar1.app_role_nm,
             ar1.app_role_desc,
             ar1.app_role_super_id,
             ar2.app_role_nm as app_role_super_nm,
             ar1.app_role_all_cntry_access
        from app_role ar1, app_role ar2
       where ar1.app_role_id != 0 --not in (0, 1, 304, 307)
         and ar1.app_role_super_id = ar2.app_role_id
       order by ar1.app_role_seq_on_page;

  End sp_getAppRoles;
  ---================================================================================
  procedure sp_getCountryCityPost(rc_getCountry           OUT refc_Base -- 1
                                 ,
                                  rc_getCityPost          OUT refc_Base ---2
                                 ,
                                  rc_getAdditionalCountry OUT refc_Base) -- 3
   is
  Begin
    -- 1
    OPEN rc_getCountry FOR
      select distinct cntry_regn_cd,
                      cntry_cntry_cd,
                      Replace(c.cntry_cntry_nm, '''', '`') AS cntry_cntry_nm
        from cntry c, city ct
       where c.cntry_cntry_cd = ct.city_cntry_cd
       order by cntry_cntry_nm;

    -- 2
    OPEN rc_getCityPost FOR
      select city_cntry_cd,
             Replace(city_city_nm, '''', '`') AS city_city_nm
        from city
       order by 1, 2;

    -- 3
    OPEN rc_getAdditionalCountry FOR
      select distinct cntry_regn_cd,
                      cntry_cntry_cd,
                      Replace(c.cntry_cntry_nm, '''', '`') AS cntry_cntry_nm
        from cntry c
       order by cntry_cntry_nm;

  End sp_getCountryCityPost;
  ---================================================================================
  procedure sp_InsUpdRole(arg_app_role_id          IN NUMBER,
                          arg_app_role_nm          IN VARCHAR2,
                          arg_app_role_desc        IN VARCHAR2,
                          arg_app_role_super_id    IN NUMBER,
                          arg_ValsFromRadioButtons IN VARCHAR2,
                          arg_num_of_loops         IN NUMBER,
                          rc_getAppRoleID          OUT refc_Base) is
    vStrTemp      VARCHAR2(1000); -- keeps substringed value of vStrOrg after pair (ST_ID and leytter Y) is removed
    vST_ID        NUMBER;
    vPosOfSemiCol NUMBER;
  Begin
    --------------------------------------------------------------------------------
    if arg_app_role_id = 0 then
      insert into app_role
        (app_role_id, app_role_nm, app_role_desc, app_role_super_id)
      values
        (app_role_seq.nextval,
         arg_app_role_nm,
         arg_app_role_desc,
         arg_app_role_super_id);
      commit;
      ---
      OPEN rc_getAppRoleID FOR
        select Max(app_role_id) as app_role_id from app_role;

    else
      update app_role
         set app_role_nm       = Trim(arg_app_role_nm),
             app_role_desc     = Trim(arg_app_role_desc),
             app_role_super_id = arg_app_role_super_id
       where app_role_id = arg_app_role_id;
      commit;
      ---
      OPEN rc_getAppRoleID FOR
        select app_role_id
          from app_role
         where app_role_id = arg_app_role_id;
    end if;
    -------------------------------------------------------------

    if arg_num_of_loops != 0 then
      -- 1
      select arg_ValsFromRadioButtons into vStrTemp from dual;
      -- 2
      delete security_tree_roles str
       where str.str_r_id = arg_app_role_id
         and str.str_st_id < 1000;
      commit;
      -- 3
      FOR i IN 1 .. arg_num_of_loops LOOP
        -- 3.1
        select Instr(vStrTemp, ';', 1, 1) into vPosOfSemiCol from dual;
        -- 3.2
        select Substr(vStrTemp, 1, (vPosOfSemiCol - 1))
          into vST_ID
          from dual;
        -- 3.3
        insert into security_tree_roles
          (str_st_id, str_r_id)
        values
          (vST_ID, arg_app_role_id);
        -- 3.4
        select Substr(vStrTemp, (vPosOfSemiCol + 1))
          into vStrTemp
          from dual;

      END LOOP;
      commit;
    else
      delete security_tree_roles str
       where str.str_r_id = arg_app_role_id
         and str.str_st_id < 1000;
      commit;
    end if;

    --dbms_output.put_line(vStr);

    -------------------------------------------------------------
  End sp_InsUpdRole;
  ---================================================================================
  procedure sp_DeleteRole(arg_app_role_id IN NUMBER) is
  Begin
    delete app_role where app_role_id = arg_app_role_id;
    commit;
  End sp_DeleteRole;
  ---================================================================================

  procedure sp_InsUpdNewuserRegistration(arg_NUR_Usr_ID    IN NUMBER,
                                         arg_NUR_Usr_Prfx  IN VARCHAR2,
                                         arg_NUR_Usr_FName IN VARCHAR2,
                                         arg_NUR_Usr_MI    IN VARCHAR2,
                                         arg_NUR_Usr_LName IN VARCHAR2,
                                         --------------------------------
                                         arg_NUR_Usr_Phone     IN VARCHAR2,
                                         arg_NUR_Usr_Ext       IN VARCHAR2,
                                         arg_NUR_Usr_Email     IN VARCHAR2,
                                         arg_NUR_Usr_UserName  IN VARCHAR2,
                                         arg_NUR_Usr_Pass      IN VARCHAR2,
                                         arg_NUR_Usr_AARole_ID IN NUMBER,
                                         --------------------------------
                                         arg_NUR_Usr_SecQ   IN VARCHAR2,
                                         arg_NUR_Usr_Answer IN VARCHAR2,
                                         ----------------------------------
                                         arg_NUR_Usr_Depart_Dt IN VARCHAR2,
                                         arg_NUR_AuthAgent_ID  IN NUMBER
                                         --------------------------------
                                        ,
                                         arg_NUR_Usr_CntryOfAssignmt_CD IN VARCHAR2,
                                         arg_NUR_DOS_OfficeCode_CD      IN VARCHAR2,
                                         arg_NUR_Usr_CityPostOfAss_NM   IN VARCHAR2
                                         --------------------------------
                                        ,
                                         arg_NUR_Usr_AddnlCountry_CD IN VARCHAR2,
                                         arg_NUR_NumOfLoops          IN NUMBER,
                                         arg_NUR_Usr_Comments        IN VARCHAR2
                                         --------------------------------
                                        ,
                                         rc_getUserID OUT refc_Base) is
    ---
    vUsrID          number;
    vPosOfDelimiter number;
    vStrToCut       VARCHAR2(1000);
    vStrToIns       varchar2(2);
    ---
  Begin
    --------------------------------------------------------------------------------------------
    if arg_NUR_Usr_ID = 0 then
      --- 1.1
      select usr_seq.nextval into vUsrID from dual;
      --- 2.1
      insert into usr
        (usr_cd,
         usr_pfx,
         usr_fname,
         usr_mi,
         usr_lname,
         usr_phone,
         usr_ext,
         usr_email,
         ---
         usr_uname,
         usr_pass,
         usr_role_cd,
         usr_is_act,
         usr_est_depart_dt,
         usr_auth_agent_id,
         ---
         usr_scrty_quest,
         usr_scrty_answr,
         usr_pass_crtd_dt)
      values
        (vUsrID,
         arg_NUR_Usr_Prfx,
         DECODE(arg_NUR_Usr_FName, '', null, arg_NUR_Usr_FName),
         DECODE(arg_NUR_Usr_MI, '', null, arg_NUR_Usr_MI),
         DECODE(arg_NUR_Usr_LName, '', null, arg_NUR_Usr_LName),
         DECODE(arg_NUR_Usr_Phone, '', null, arg_NUR_Usr_Phone),
         DECODE(arg_NUR_Usr_Ext, '', null, arg_NUR_Usr_Ext),
         DECODE(arg_NUR_Usr_Email, '', null, arg_NUR_Usr_Email),
         ---
         arg_NUR_Usr_UserName,
         arg_NUR_Usr_Pass,
         arg_NUR_Usr_AARole_ID,
         'N',
         DECODE(arg_NUR_Usr_Depart_Dt,
                '',
                null,
                TO_DATE(arg_NUR_Usr_Depart_Dt, 'DD-MON-YYYY')),
         arg_NUR_AuthAgent_ID,
         ---
         arg_NUR_Usr_SecQ,
         arg_NUR_Usr_Answer,
         sysdate);
    else
      --- 1.2
      select arg_NUR_Usr_ID into vUsrID from dual;
      --- 2.2
      update usr
         set usr_pfx           = arg_NUR_Usr_Prfx,
             usr_fname         = DECODE(arg_NUR_Usr_FName,
                                        '',
                                        null,
                                        arg_NUR_Usr_FName),
             usr_mi            = DECODE(arg_NUR_Usr_MI,
                                        '',
                                        null,
                                        arg_NUR_Usr_MI),
             usr_lname         = DECODE(arg_NUR_Usr_LName,
                                        '',
                                        null,
                                        arg_NUR_Usr_LName),
             usr_phone         = DECODE(arg_NUR_Usr_Phone,
                                        '',
                                        null,
                                        arg_NUR_Usr_Phone),
             usr_ext           = DECODE(arg_NUR_Usr_Ext,
                                        '',
                                        null,
                                        arg_NUR_Usr_Ext),
             usr_email         = DECODE(arg_NUR_Usr_Email,
                                        '',
                                        null,
                                        arg_NUR_Usr_Email),
             usr_uname         = arg_NUR_Usr_UserName,
             usr_pass          = arg_NUR_Usr_Pass,
             usr_role_cd       = arg_NUR_Usr_AARole_ID,
             usr_is_act        = 'N',
             usr_est_depart_dt = DECODE(arg_NUR_Usr_Depart_Dt,
                                        '',
                                        null,
                                        TO_DATE(arg_NUR_Usr_Depart_Dt,
                                                'DD-MON-YYYY')),
             usr_auth_agent_id = arg_NUR_AuthAgent_ID,
             ---
             usr_scrty_quest  = arg_NUR_Usr_SecQ,
             usr_scrty_answr  = arg_NUR_Usr_Answer,
             usr_pass_crtd_dt = sysdate
       where usr_cd = vUsrID;
    end if;
    ---
    commit;
    --------------------------------------------------------------------------------------------------
    --- 3.1
    delete usr_cntry uc where uc.usr_cntry_usr_id = vUsrID;
    ---
    commit;
    --- 3.2
    insert into usr_cntry
      (usr_cntry_usr_id,
       usr_cntry_regn_cd,
       usr_cntry_cntry_cd,
       usr_cntry_city_post_nm,
       usr_cntry_is_prmry,
       usr_cntry_ofc_abbr)
    values
      (vUsrID,
       f_getRegionCD(arg_NUR_Usr_CntryOfAssignmt_CD),
       arg_NUR_Usr_CntryOfAssignmt_CD,
       DECODE(arg_NUR_Usr_CityPostOfAss_NM,
              '-1',
              NULL,
              arg_NUR_Usr_CityPostOfAss_NM),
       'Y',
       DECODE(arg_NUR_DOS_OfficeCode_CD,
              '-1',
              null,
              arg_NUR_DOS_OfficeCode_CD));
    ---
    commit;
    ---
    --- 3.3 Additional countries:
    -- "-1" No dditional Country in this case DO NOT CREATE any record
    -- "*" Means All Countries, create 1 record with value "*"
    -- "XX" Code for some country , create 1 record with value "XX"
    -- "XX,YY" Codes for two countries, create 2 records with values "XX" and "YY"
    if arg_NUR_Usr_AddnlCountry_CD != '-1' then
      if arg_NUR_NumOfLoops = 0 then
        -- Means one country selected
        insert into usr_cntry
          (usr_cntry_usr_id,
           usr_cntry_regn_cd,
           usr_cntry_cntry_cd,
           usr_cntry_city_post_nm,
           usr_cntry_is_prmry,
           usr_cntry_ofc_abbr)
        values
          (vUsrID,
           DECODE(arg_NUR_Usr_AddnlCountry_CD,
                  '*',
                  'US',
                  f_getRegionCD(arg_NUR_Usr_AddnlCountry_CD)),
           arg_NUR_Usr_AddnlCountry_CD,
           null,
           'N',
           DECODE(arg_NUR_DOS_OfficeCode_CD,
                  '-1',
                  null,
                  arg_NUR_DOS_OfficeCode_CD));
        ---
        commit;
        ----
      else
        -- means more then One country selected

        select arg_NUR_Usr_AddnlCountry_CD into vStrToCut from dual;
        ---
        FOR i IN 1 .. arg_NUR_NumOfLoops LOOP
          ---
          select Instr(vStrToCut, ',', 1, 1)
            into vPosOfDelimiter
            from dual;
          ---
          select Substr(vStrToCut, 1, (vPosOfDelimiter - 1))
            into vStrToIns
            from dual;
          ---
          insert into usr_cntry
            (usr_cntry_usr_id,
             usr_cntry_regn_cd,
             usr_cntry_cntry_cd,
             usr_cntry_city_post_nm,
             usr_cntry_is_prmry,
             usr_cntry_ofc_abbr)
          values
            (vUsrID,
             f_getRegionCD(vStrToIns),
             vStrToIns,
             null,
             'N',
             DECODE(arg_NUR_DOS_OfficeCode_CD,
                    '-1',
                    null,
                    arg_NUR_DOS_OfficeCode_CD));
          ---
          select Substr(vStrToCut, (vPosOfDelimiter + 1))
            into vStrToCut
            from dual;
          ---

        END LOOP;
        insert into usr_cntry
          (usr_cntry_usr_id,
           usr_cntry_regn_cd,
           usr_cntry_cntry_cd,
           usr_cntry_city_post_nm,
           usr_cntry_is_prmry,
           usr_cntry_ofc_abbr)
        values
          (vUsrID,
           f_getRegionCD(vStrToIns),
           vStrToIns,
           null,
           'N',
           DECODE(arg_NUR_DOS_OfficeCode_CD,
                  '-1',
                  null,
                  arg_NUR_DOS_OfficeCode_CD));
        ----------------
        commit;
        ---
      end if;
    end if;

    --------------------------------------------------------------------------------------------
    delete usr_comnt uc
     where uc.usr_comnt_usr_id = vUsrID
       and uc.usr_comnt_comnt_type = 'NUR';
    ---
    commit;
    ---
    insert into usr_comnt
      (usr_comnt_usr_id, usr_comnt_comnt_type, usr_comnt_comnt_txt)
    values
      (vUsrID, 'NUR', arg_NUR_Usr_Comments);
    ---
    commit;
    ---
    --------------------------------------------------------------------------------------------
    OPEN rc_getUserID FOR
      select usr_cd from usr u where u.usr_cd = vUsrID;
    --------------------------------------------------------------------------------------------

  End sp_InsUpdNewuserRegistration;
  ---================================================================================
  procedure sp_get_DOS_OfficeCode(rc_get_DOS_OfficeCode OUT refc_Base) is
  Begin
    OPEN rc_get_DOS_OfficeCode FOR
    /* select distinct usr_cntry_ofc_abbr
                from usr_cntry
               where usr_cntry_ofc_abbr is not null
               order by 1;*/

      select distinct clk.item_cd usr_cntry_ofc_abbr
        from code_lk clk
       where clk.item = 'OFFICE_CD'
       order by 1;

  End sp_get_DOS_OfficeCode;
  ---================================================================================
  procedure sp_get_USR_Pass(arg_PASS_Email  IN VARCHAR2,
                            arg_PASS_SecQ   IN VARCHAR2,
                            arg_PASS_Answer IN VARCHAR2,
                            rc_get_USR_Pass OUT refc_Base) is
  Begin
    OPEN rc_get_USR_Pass FOR
      select DECODE(usr_pfx, '-1', '', null, '', usr_pfx) as usr_pfx,
             DECODE(usr_fname, null, '', usr_fname) as usr_fname,
             DECODE(usr_mi, null, '', usr_mi) as usr_mi,
             usr_lname,
             usr_email,
             usr_pass
        from usr
       where UPPER(usr_email) = UPPER(arg_PASS_Email)
         and usr_scrty_quest = arg_PASS_SecQ
         and UPPER(usr_scrty_answr) = UPPER(arg_PASS_Answer)
         and usr.usr_is_act = 'A';
  End sp_get_USR_Pass;
  ---================================================================================
  procedure get_NUR_UserIDAndStatus(arg_NUR_Usr_Email      IN VARCHAR2,
                                    rc_NUR_UserIDAndStatus OUT refc_Base) is
  Begin
    ---
    OPEN rc_NUR_UserIDAndStatus FOR
      select usr_cd, usr_is_act
        from usr
       where Lower(usr_email) = Lower(arg_NUR_Usr_Email);
    ---
  End get_NUR_UserIDAndStatus;
  ---================================================================================
  procedure sp_get_NUR_Usr_PreReg(arg_NUR_Usr_ID    IN NUMBER,
                                  arg_NUR_Usr_IsAct IN VARCHAR2,
                                  rc_NUR_Usr_PreReg OUT refc_Base,
                                  rc_NUR_PAO_Posts  OUT refc_Base) is

    vUsrRole usr.usr_role_cd%Type;
    vCount   NUMBER;
  Begin


    select count(*) into vCount from usr u where u.usr_cd = arg_NUR_Usr_ID;

    If vCount > 0 Then
      select u.usr_role_cd
        into vUsrRole
        from usr u
       where u.usr_cd = arg_NUR_Usr_ID;
    End If;
    -- if PAO, it is possible to have multiple posts:
    /* If vUsrRole = 242 Then*/
    /*The following cursor is not in use in the application, but without it NUR for the preregistered users is not working.
    DO NOT REMOVE UNDER ANY CIRCUSTANCES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  */

    OPEN rc_NUR_PAO_Posts FOR
      select usr_cntry_usr_id as usr_cd,
             NVL(usr_cntry_cntry_cd, '-1') as usr_cntry_cntry_cd,
             NVL(usr_cntry_city_post_nm, '-1') as usr_cntry_city_post_nm
        from usr_cntry
       where usr_cntry_usr_id = arg_NUR_Usr_ID
         and usr_cntry_cntry_cd =
             (Select uc.usr_cntry_cntry_cd
                From usr_cntry uc
               Where uc.usr_cntry_usr_id = arg_NUR_Usr_ID
                 and uc.usr_cntry_is_prmry = 'Y');

    /* End If;*/

    OPEN rc_NUR_Usr_PreReg FOR
      select usr_cd,
             NVL(u.usr_pfx, '-1') AS usr_pfx,
             NVL(u.usr_fname, '') AS usr_fname,
             NVL(u.usr_mi, '') AS usr_mi,
             usr_lname,
             NVL(usr_phone, '') AS usr_phone,
             NVL(u.usr_ext, '') AS usr_ext,
             NVL(usr_email, '') AS usr_email,
             NVL(u.usr_uname, '') AS usr_uname,
             NVL(u.usr_pass, '') AS usr_pass,
             NVL(TO_CHAR(u.usr_role_cd), '-1') AS usr_role_cd,
             usr_is_act,
             NVL(TO_CHAR(usr_est_depart_dt, 'mm/dd/yyyy'), '') AS usr_est_depart_dt,
             NVL(uc.usr_cntry_cntry_cd, '-1') as usr_cntry_cntry_cd,
             NVL(uc.usr_cntry_city_post_nm, '-1') as usr_cntry_city_post_nm

        from usr u, usr_cntry uc
       where u.usr_cd = arg_NUR_Usr_ID
         and u.usr_is_act = arg_NUR_Usr_IsAct
         and u.usr_cd = uc.usr_cntry_usr_id
         and uc.usr_cntry_is_prmry = 'Y';

  End sp_get_NUR_Usr_PreReg;
  ---================================================================================

	procedure sp_getAuthAgent(arg_NUR_Usr_CntryOfAssignmt_CD IN VARCHAR2,
                            arg_NUR_Usr_CityPostOfAss_NM   IN VARCHAR2,
                            arg_NUR_Usr_NewCityPostOfAss   IN VARCHAR2,
                            arg_NUR_DOS_OfficeCode_CD      IN VARCHAR2,
                            rc_getAuthAgent                OUT refc_Base,
                            rc_getInactiveAuthAgent        OUT refc_Base) 
  is
    vAuthAgentRoleID NUMBER;
    vInactAuthAgentRoleID NUMBER; --'0' -active auth agent exists; '-1' - neither active nor inactive auth agent exists; 'ID' - no active auth agent exists, only inactive one
    vCityOfAss       VARCHAR2(100);
    vCounter         NUMBER;
  Begin
    ---------------------------------------------------------------------------------------------
    vCityOfAss := Trim(arg_NUR_Usr_CityPostOfAss_NM);
    ---------------------------------------------------------------------------------------------
    -- 1. Create a record for the city that is not in table CITY
    if Trim(arg_NUR_Usr_NewCityPostOfAss) != '' then
      insert into city
        (city_cntry_cd, city_city_nm, city_is_cpl)
      values
        (arg_NUR_Usr_CntryOfAssignmt_CD,
         Trim(arg_NUR_Usr_NewCityPostOfAss),
         'N');
      --
      commit;
      --
      vCityOfAss := arg_NUR_Usr_NewCityPostOfAss;
    end if;
    ---------------------------------------------------------------------------------------------
    -- 2. Getting info of Authorizing Agent if country of assignment is NOT USA
    if arg_NUR_Usr_CntryOfAssignmt_CD != 'US' then
      -- 2.1 Determine if City/Post of Assignment has a PAO?
      select Count(*)
        into vCounter
        from usr_cntry uc, usr u
       where uc.usr_cntry_usr_id = u.usr_cd
         and usr_cntry_cntry_cd = arg_NUR_Usr_CntryOfAssignmt_CD
         and usr_cntry_city_post_nm = vCityOfAss
         and u.usr_role_cd = 242;
      ---------------
      if vCounter = 0 then
        -- Take Authorizing Agent(PAO) from capital and determine if he is ACTIVE

        select Count(*)
          into vCounter
          from city c, usr_cntry uc, usr u
         where c.city_cntry_cd = arg_NUR_Usr_CntryOfAssignmt_CD
           and c.city_is_cpl = 'Y'
           and c.city_cntry_cd = uc.usr_cntry_cntry_cd
           and c.city_city_nm = uc.usr_cntry_city_post_nm
           and uc.usr_cntry_usr_id = u.usr_cd
           and u.usr_role_cd = 242
           and u.usr_is_act = 'A';
        --
        if vCounter = 0 then
          -- Authorizing Agent is Data Manager
          select Count(*) into vCounter from usr u where u.usr_role_cd = 1;

          If vCounter = 1 Then
            select u.usr_cd
              into vAuthAgentRoleID
              from usr u
             where u.usr_role_cd = 1;
          ElsIf vCounter > 1 Then
            select u.usr_cd
              into vAuthAgentRoleID
              from usr u
             where u.usr_role_cd = 1
               and u.usr_cd =
                   (select min(u.usr_cd) from usr u where u.usr_role_cd = 1);
          ElsIf vCounter = 0 Then
            select u.usr_cd
              into vAuthAgentRoleID
              from usr u
             where u.usr_role_cd = 304;
          End If;
        else
          -- Authorizing Agent is Active PAO from the Capital
          select u.usr_cd
            into vAuthAgentRoleID
            from city c, usr_cntry uc, usr u
           where c.city_cntry_cd = arg_NUR_Usr_CntryOfAssignmt_CD
             and c.city_is_cpl = 'Y'
             and c.city_cntry_cd = uc.usr_cntry_cntry_cd
             and c.city_city_nm = uc.usr_cntry_city_post_nm
             and uc.usr_cntry_usr_id = u.usr_cd
             and u.usr_role_cd = 242
             and u.usr_is_act = 'A';

        end if;
        ---
      else
        -- Authorizing agent is found for the City of Assignment

        select Count(*)
          into vCounter -- check if found auth Agent is Active
          from usr_cntry uc, usr u
         where uc.usr_cntry_usr_id = u.usr_cd
           and usr_cntry_cntry_cd = arg_NUR_Usr_CntryOfAssignmt_CD
           and usr_cntry_city_post_nm = vCityOfAss
           and u.usr_role_cd = 242
           and u.usr_is_act = 'A';

        if vCounter = 0 then
          --- Authorizing Agent is Data Manager
          select u.usr_cd
            into vAuthAgentRoleID
            from usr u
           where u.usr_role_cd = 1;
           -- check for inactive PAO
           select Count(*)
              into vCounter -- check if auth Agent is inActive
              from usr_cntry uc, usr u
             where uc.usr_cntry_usr_id = u.usr_cd
               and usr_cntry_cntry_cd = arg_NUR_Usr_CntryOfAssignmt_CD
               and usr_cntry_city_post_nm = vCityOfAss
               and u.usr_role_cd = 242
               and u.usr_is_act = 'I';
           
           if vCounter = 0 then
              --no active or inactive PAO exists in the user tables. Return '-1' to notify Admin about it.
               select -1  into vInactAuthAgentRoleID from dual;
           else
               select u.usr_cd
                into vInactAuthAgentRoleID
                from usr_cntry uc, usr u
               where uc.usr_cntry_usr_id = u.usr_cd
                 and usr_cntry_cntry_cd = arg_NUR_Usr_CntryOfAssignmt_CD
                 and usr_cntry_city_post_nm = vCityOfAss
                 and u.usr_role_cd = 242
                 and u.usr_is_act = 'I';
           
           end if;
        else
          -- Authorizing Agent is Active PAO from the City of Assignment
          select u.usr_cd
            into vAuthAgentRoleID
            from usr_cntry uc, usr u
           where uc.usr_cntry_usr_id = u.usr_cd
             and usr_cntry_cntry_cd = arg_NUR_Usr_CntryOfAssignmt_CD
             and usr_cntry_city_post_nm = vCityOfAss
             and u.usr_role_cd = 242
             and u.usr_is_act = 'A';
         --no active PAO exists in the user tables. Return '0'.
         select 0  into vInactAuthAgentRoleID from dual;
        end if;

      end if;
    else
      -- 2.1 Determine if user's office has an active Director?
      select Count(*)
        into vCounter
        from usr_cntry uc, usr u
       where uc.usr_cntry_usr_id = u.usr_cd
         and uc.usr_cntry_ofc_abbr = arg_NUR_DOS_OfficeCode_CD
         and uc.usr_cntry_cntry_cd = 'US'
         and u.usr_role_cd = 306
         and u.usr_is_act = 'A';
      ---------------
      if vCounter = 0 then
        -- Authorizing Agent is Data Manager
        select u.usr_cd
          into vAuthAgentRoleID
          from usr u
         where u.usr_role_cd = 1;
       -- check for inactive Director
           select Count(*)
              into vCounter -- check if auth Agent is inActive
              from usr_cntry uc, usr u
             where uc.usr_cntry_usr_id = u.usr_cd
               and usr_cntry_cntry_cd = arg_NUR_Usr_CntryOfAssignmt_CD
               and usr_cntry_city_post_nm = vCityOfAss
               and u.usr_role_cd = 306
               and u.usr_is_act = 'I';
           
           if vCounter = 0 then
              --no active or inactive Director exists in the user tables. Return '-1' to notify Admin about it.
               select -1  into vInactAuthAgentRoleID from dual;
           else
               select u.usr_cd
                into vInactAuthAgentRoleID
                from usr_cntry uc, usr u
               where uc.usr_cntry_usr_id = u.usr_cd
                 and usr_cntry_cntry_cd = arg_NUR_Usr_CntryOfAssignmt_CD
                 and usr_cntry_city_post_nm = vCityOfAss
                 and u.usr_role_cd = 306
                 and u.usr_is_act = 'I';
           
           end if;
      else
        -- Authorizing Agent is user's Office Director
        select u.usr_cd
          into vAuthAgentRoleID
          from usr_cntry uc, usr u
         where uc.usr_cntry_usr_id = u.usr_cd
           and uc.usr_cntry_ofc_abbr = arg_NUR_DOS_OfficeCode_CD
           and uc.usr_cntry_cntry_cd = 'US'
           and u.usr_role_cd = 306
           and u.usr_is_act = 'A';
       --no active Director exists in the user tables. Return '0'.
         select 0  into vInactAuthAgentRoleID from dual;

      end if;
      ---
    end if;
    ---------------------------------------------------------------------------------------------
    OPEN rc_getAuthAgent FOR
      select usr_cd,
             decode(usr_pfx, '-1', '', null, '', usr_pfx) || ' ' ||
             NVL(usr_fname, '') || ' ' || NVL(usr_mi, '') || ' ' ||
             NVL(usr_lname, '') as usr_full_nm,
             usr_phone,
             usr_ext,
             usr_email,
             ar.app_role_nm
        from usr u, app_role ar
       where u.usr_cd = vAuthAgentRoleID
         and u.usr_role_cd = ar.app_role_id;
    ---------------------------------------------------------------------------------------------
   
    
    IF vInactAuthAgentRoleID > 0 THEN
       OPEN rc_getInactiveAuthAgent FOR
        select usr_cd,
                 decode(usr_pfx, '-1', '', null, '', usr_pfx) || ' ' ||
                 NVL(usr_fname, '') || ' ' || NVL(usr_mi, '') || ' ' ||
                 NVL(usr_lname, '') as usr_full_nm,
                 usr_phone,
                 usr_ext,
                 usr_email,
                 ar.app_role_nm
            from usr u, app_role ar
           where u.usr_cd = vInactAuthAgentRoleID
             and u.usr_role_cd = ar.app_role_id;     
    ELSE
        OPEN rc_getInactiveAuthAgent FOR
        select vInactAuthAgentRoleID as usr_cd,
                 'no data' as usr_full_nm,
                 'no data' as usr_phone,
                 'no data' as usr_ext,
                 'no data' as usr_email,
                 'no data' as app_role_nm
            from dual;
    END IF;
    ---------------------------------------------------------------------------------------------
  End sp_getAuthAgent;

  ---================================================================================

  procedure sp_getListOfUsers(arg_Usr_CD           IN NUMBER -- This is CD(or ID) of the one who's running application
                             ,
                              arg_RequestedUsrType IN VARCHAR2 -- could be A,I,H,N
                             ,
                              rc_ListOfUsers       OUT refc_Base
                              --,rc_getUsrCntry OUT refc_Base
                             ,
                              rc_getUsrComment  OUT refc_Base,
                              rc_getAlphaSearch OUT refc_Base--,
                              --rc_getDistinctCntryList OUT refc_Base
                              )

    --Rule:
    --RoleID     Posibility to see
    -----------------------------
    --1,304      Everybody
    -----------------------------
    --242        Only Post related people
    -----------------------------
    --306        Only Department related people
    ------------------------------------------
    --307,300,301,302,303  Only themselves
    --241,245
    -----------------------------
    --Statuses A,I,N, H for details see CODE_LK under "USRSTAT"

   is
    vUsrRoleCD NUMBER;
    --vUsrCntryCD  usr_cntry.usr_cntry_cntry_cd%TYPE;
    --vUsrCityPost usr_cntry.usr_cntry_city_post_nm%TYPE;
    v_status1 VARCHAR2(10);
    v_status2 VARCHAR2(10);

  Begin
    select usr_role_cd
      into vUsrRoleCD
      from usr u
     where u.usr_cd = arg_Usr_CD;
    -------------------------------------------------------------------------
    If arg_RequestedUsrType = 'N' Then

      v_status1 := 'N';
      v_status2 := 'W';

    Else
      v_status1 := arg_RequestedUsrType;
      v_status2 := arg_RequestedUsrType;
    End If;
    if vUsrRoleCD = 1 or vUsrRoleCD = 304 then
      -- all records

      OPEN rc_ListOfUsers FOR
        select usr_cd,
               SubStr(usr_lname, 1, 1) as usr_lname_alpha,
               decode(usr_pfx, null, '', '-1', '', usr_pfx) || ' ' ||
               NVL(usr_fname, '') || ' ' || NVL(usr_mi, '') || ' ' ||
               NVL(Replace(usr_lname,'''','`'), '') as usr_full_nm,
               usr_phone,
               NVL(usr_ext, 'no_val') AS usr_ext,
               NVL(Replace(usr_email,'''','`'),'no_val') AS usr_email,
               usr_role_cd,
               f_getRoleNM(usr_role_cd) as usr_role_nm,
               usr_is_act,
               f_getStatNm(usr_is_act) as is_act_nm,
               uc.usr_cntry_cntry_cd,
               Replace(
               DECODE(usr_cntry_cntry_cd,
                      '*',
                      'All Countries',
                      f_getCntryNM(usr_cntry_cntry_cd)), '''', '`'
                      ) AS usr_cntry_cntry_nm,
               uc.usr_cntry_city_post_nm,
               uc.usr_cntry_is_prmry,
               NVL(uc.usr_cntry_ofc_abbr,'no_val') AS usr_cntry_ofc_abbr
          from usr u, usr_cntry uc
         where u.usr_is_act in (v_status1, v_status2)
           and u.usr_cd = uc.usr_cntry_usr_id
         order by u.usr_lname, usr_cd;
      ---

      OPEN rc_getUsrComment FOR
        select uc.usr_comnt_usr_id,
              NVL( Replace(f_getComments(u.usr_cd, 'NUR'),'''','`'),'no_val')  as usr_comnt_comnt_txt,
              NVL( Replace(f_getComments(u.usr_cd, 'CHG'),'''','`'),'no_val')  as usr_comnt_reqchg_txt
          from usr_comnt uc, usr u
         where uc.usr_comnt_usr_id = u.usr_cd
           and u.usr_is_act in (v_status1, v_status2);

      ---
      OPEN rc_getAlphaSearch FOR
        select distinct substr(usr_lname, 1, 1) as alpha_val
          from usr u
         where u.usr_is_act in (v_status1, v_status2);

    -------------------------------------------------------------------------
      --start
    elsif vUsrRoleCD = 242 or vUsrRoleCD = 306 then

      OPEN rc_ListOfUsers FOR
        select usr_cd,
               SubStr(usr_lname, 1, 1) as usr_lname_alpha,
               decode(usr_pfx, null, '', '-1', '', usr_pfx) || ' ' ||
               NVL(usr_fname, '') || ' ' || NVL(usr_mi, '') || ' ' ||
               NVL(Replace(usr_lname,'''','`'), '') as usr_full_nm,
               usr_phone,
               NVL(usr_ext, 'no_val') AS usr_ext,
               NVL(Replace(usr_email,'''','`'),'no_val') AS usr_email,
               usr_role_cd,
               f_getRoleNM(usr_role_cd) as usr_role_nm,
               usr_is_act,
               f_getStatNm(usr_is_act) as is_act_nm,
               uc.usr_cntry_cntry_cd,
                   Replace(
               DECODE(usr_cntry_cntry_cd,
                      '*',
                      'All Countries',
                      f_getCntryNM(usr_cntry_cntry_cd)), '''', '`'
                      ) AS usr_cntry_cntry_nm,
               uc.usr_cntry_city_post_nm,
               uc.usr_cntry_is_prmry,
               NVL(uc.usr_cntry_ofc_abbr,'no_val') AS usr_cntry_ofc_abbr
          from usr u, usr_cntry uc
         where u.usr_is_act in (v_status1, v_status2)
           and u.usr_cd = uc.usr_cntry_usr_id
           and u.usr_auth_agent_id = arg_Usr_CD
         order by u.usr_lname, usr_cd;
      ---
      OPEN rc_getUsrComment FOR
        select uc.usr_comnt_usr_id,
               NVL( Replace(f_getComments(u.usr_cd, 'NUR'),'''','`'), 'no_val')  as usr_comnt_comnt_txt,
               NVL( Replace(f_getComments(u.usr_cd, 'CHG'),'''','`'), 'no_val')  as usr_comnt_reqchg_txt
          from usr_comnt uc, usr u
         where uc.usr_comnt_usr_id = u.usr_cd
           and u.usr_is_act in (v_status1, v_status2)
           and u.usr_auth_agent_id = arg_Usr_CD;
      ---
      OPEN rc_getAlphaSearch FOR
        select distinct substr(usr_lname, 1, 1) as alpha_val
          from usr u
         where u.usr_is_act in (v_status1, v_status2)
           and u.usr_auth_agent_id = arg_Usr_CD; --end
      -------------------------------------------------------------------------
    end if;

  End sp_getListOfUsers;
  ---================================================================================
  procedure sp_getGA_Usr(arg_GA_UsrID      IN NUMBER,
                         rc_getGA_Usr      OUT refc_Base,
                         rc_gerGA_UsrCntry OUT refc_Base) is
  Begin
    OPEN rc_getGA_Usr FOR
      select u.usr_cd,
             NVL(u.usr_pfx, '-1') AS usr_pfx,
             u.usr_fname,
             NVL(u.usr_mi, '') AS usr_mi,
             u.usr_lname,
             decode(u.usr_pfx, null, '', '-1', '', u.usr_pfx) || ' ' ||
             NVL(u.usr_fname, '') || ' ' || NVL(u.usr_mi, '') || ' ' ||
             NVL(u.usr_lname, '') as usr_full_nm,
             u.usr_phone,
             NVL(u.usr_ext, '') as usr_ext,
             u.usr_email,
             u.usr_uname,
             u.usr_pass,
             u.usr_role_cd,
             u.usr_is_act,
             f_getStatNm(u.usr_is_act) AS usr_status_nm,
             u.usr_est_depart_dt,
             u.usr_auth_agent_id,
             decode(u2.usr_pfx, '-1', '', null, '', u2.usr_pfx) || ' ' ||
             NVL(u2.usr_fname, '') || ' ' || NVL(u2.usr_mi, '') || ' ' ||
             NVL(u2.usr_lname, '') as usr_auth_agent_full_nm,
             f_getComments(arg_GA_UsrID, 'NUR') as usr_comnt_comnt_txt,
             f_getComments(arg_GA_UsrID, 'CHG') as usr_comnt_reqchg_txt
        from usr u, usr u2
       where u.usr_cd = arg_GA_UsrID
         and u2.usr_cd = u.usr_auth_agent_id;
    ---
    OPEN rc_gerGA_UsrCntry FOR
      select usr_cntry_usr_id,
             NVL(usr_cntry_regn_cd, '') AS usr_cntry_regn_cd,
             usr_cntry_cntry_cd,
             NVL(usr_cntry_city_post_nm, '') AS usr_cntry_city_post_nm,
             usr_cntry_is_prmry,
             NVL(usr_cntry_ofc_abbr, '') AS usr_cntry_ofc_abbr
        from usr_cntry uc
       where uc.usr_cntry_usr_id = arg_GA_UsrID
       order by usr_cntry_is_prmry desc;

  End sp_getGA_Usr;
  ---================================================================================
  procedure sp_getSelfData(arg_Usr_CD        IN NUMBER,
                           rc_getSelfData    OUT refc_Base,
                           rc_getAddlCntries OUT refc_Base) is
  Begin
    --- 1.
    OPEN rc_getSelfData FOR
      select u.usr_cd,
             NVL(u.usr_pfx, '-1') AS usr_pfx,
             NVL(u.usr_fname, '') as usr_fname,
             NVL(u.usr_mi, '') AS usr_mi,
             u.usr_lname,
             decode(u.usr_pfx, null, '', '-1', '', u.usr_pfx) || ' ' ||
             NVL(u.usr_fname, '') || ' ' || NVL(u.usr_mi, '') || ' ' ||
             NVL(u.usr_lname, '') as usr_full_nm,
             u.usr_phone,
             NVL(u.usr_ext, '') as usr_ext,
             u.usr_email,
             u.usr_uname,
             u.usr_pass,
             u.usr_role_cd,
             f_getRoleNM(u.usr_role_cd) as usr_role_nm,
             u.usr_is_act,
             f_getStatNm(u.usr_is_act) AS usr_status_nm,
             u.usr_est_depart_dt,
             -----
             u.usr_auth_agent_id,
             u2.usr_email as usr_auth_agent_email,
             --
             decode(u2.usr_pfx, '-1', '', null, '', u2.usr_pfx) || ' ' ||
             NVL(u2.usr_fname, '') || ' ' || NVL(u2.usr_mi, '') || ' ' ||
             NVL(u2.usr_lname, '') as usr_auth_agent_full_nm,
             -----
             f_getComments(arg_Usr_CD, 'NUR') as usr_comnt_comnt_txt,
             f_getComments(arg_Usr_CD, 'CHG') as usr_comnt_reqchg_txt
        from usr u, usr u2
       where u.usr_cd = arg_Usr_CD
         and u2.usr_cd = u.usr_auth_agent_id;

    --- 2.
    OPEN rc_getAddlCntries FOR
      select usr_cntry_usr_id,
             NVL(usr_cntry_regn_cd, '') AS usr_cntry_regn_cd,
             usr_cntry_cntry_cd,
             f_getCntryNM(usr_cntry_cntry_cd) as usr_cntry_cntry_nm,
             NVL(usr_cntry_city_post_nm, '') AS usr_cntry_city_post_nm,
             usr_cntry_is_prmry,
             NVL(usr_cntry_ofc_abbr, '') AS usr_cntry_ofc_abbr
        from usr_cntry uc
       where uc.usr_cntry_usr_id = arg_Usr_CD
       order by usr_cntry_is_prmry desc;

  End sp_getSelfData;
  ---================================================================================
  procedure sp_getUsrStatus(rc_getUsrStatus OUT refc_Base) is
  Begin
    OPEN rc_getUsrStatus FOR
      select c.item_cd, c.item_desc
        from code_lk c
       where c.item = 'USRSTAT'
       order by 1;
  End sp_getUsrStatus;
  ---================================================================================
  procedure sp_RemoveUsr(arg_GA_UsrID IN NUMBER) is
  Begin

    ---
    delete usr_cntry uc where uc.usr_cntry_usr_id = arg_GA_UsrID;
    ---
    delete usr_comnt u where u.usr_comnt_usr_id = arg_GA_UsrID;
    ---
    delete usr u where u.usr_cd = arg_GA_UsrID;
    ---
    commit;
    ---
  End sp_RemoveUsr;
  ---================================================================================
  procedure sp_putUsrOnHold(arg_GA_UsrID IN NUMBER) is
    vCounter NUMBER;
    v_status CHAR(1);
  Begin

    select u.usr_is_act
      into v_status
      from usr u
     where usr_cd = arg_GA_UsrID;

    If v_status = 'N' Then
      update usr set usr_is_act = 'W' where usr_cd = arg_GA_UsrID;
    Else
      update usr set usr_is_act = 'H' where usr_cd = arg_GA_UsrID;
      ---
      select Count(*)
        into vCounter
        from usr_comnt uc
       where uc.usr_comnt_usr_id = arg_GA_UsrID
         and uc.usr_comnt_comnt_type = 'CHG';
      if vCounter = 0 then
        insert into usr_comnt
          (usr_comnt_usr_id, usr_comnt_comnt_type, usr_comnt_comnt_txt)
        values
          (arg_GA_UsrID, 'CHG', 'Placed on hold by authorizing agent.');
      else
        update usr_comnt
           set usr_comnt_comnt_txt = 'Placed on hold by authorizing agent.'
         where usr_comnt_usr_id = arg_GA_UsrID
           and usr_comnt_comnt_type = 'CHG';
      end if;
      ---
    End If;
    ---
    commit;
    ---
  End sp_putUsrOnHold;
  ---================================================================================
  procedure sp_ApprvUsr(arg_GA_UsrID IN NUMBER) is

    vAuthAgentRoleID NUMBER;
    -- Country and city of PAO
    CURSOR c_PAO_CNTRY_POST is
      select uc.usr_cntry_cntry_cd,
             uc.usr_cntry_city_post_nm,
             c.city_is_cpl
        from usr_cntry uc, city c
       where uc.usr_cntry_city_post_nm = c.city_city_nm
         and uc.usr_cntry_cntry_cd = c.city_cntry_cd
         and uc.usr_cntry_usr_id = arg_GA_UsrID;
    --Office of DOS Office Director
    CURSOR c_DOS_Office_Dir is
      select uc3.usr_cntry_ofc_abbr
        from usr_cntry uc3
       where uc3.usr_cntry_usr_id = arg_GA_UsrID;
  Begin
    update usr set usr_is_act = 'A' where usr_cd = arg_GA_UsrID;
    ---
    commit;

    delete usr_comnt
     where usr_comnt_usr_id = arg_GA_UsrID
       and usr_comnt_comnt_type = 'CHG';
    ---
    --Check the role of the updated user:
    -- If PAO:
    --    If PAO NOT from the capitol of the country,
    --       then all FSNs in that post should be assigned to him
    --    If PAO IS from the capitol,
    --       then in addition to all FSNs from his post,
    --       FSNs from the posts that do not have PAO should be assigned to him
    -- If DOS Office Director:
    --    All Office empoloyees whould be assigned to him.
    select u.usr_role_cd
      into vAuthAgentRoleID
      from usr u
     where u.usr_cd = arg_GA_UsrID;
    -- If PAO:
    IF vAuthAgentRoleID = 242 THEN
      FOR v_PAO_CNTRY_POST IN c_PAO_CNTRY_POST LOOP
        IF v_PAO_CNTRY_POST.City_Is_Cpl = 'N' THEN
          UPDATE usr u
             SET u.usr_auth_agent_id = arg_GA_UsrID
           WHERE u.usr_cd != arg_GA_UsrID
             and u.usr_cd in
                 (select uc.usr_cntry_usr_id
                    from usr_cntry uc
                   where uc.usr_cntry_cntry_cd =
                         v_PAO_CNTRY_POST.Usr_Cntry_Cntry_Cd
                     and uc.usr_cntry_city_post_nm =
                         v_PAO_CNTRY_POST.Usr_Cntry_City_Post_Nm);
        ELSIF v_PAO_CNTRY_POST.City_Is_Cpl = 'Y' THEN
          UPDATE usr u
             SET u.usr_auth_agent_id = arg_GA_UsrID
           WHERE u.usr_cd != arg_GA_UsrID
             and u.usr_role_cd != 242
             and u.usr_cd in
                 (select uc.usr_cntry_usr_id
                    from usr_cntry uc
                   where uc.usr_cntry_cntry_cd =
                         v_PAO_CNTRY_POST.Usr_Cntry_Cntry_Cd
                     and ((uc.usr_cntry_city_post_nm =
                         v_PAO_CNTRY_POST.Usr_Cntry_City_Post_Nm) or
                         (uc.usr_cntry_city_post_nm is null) or
                         (uc.usr_cntry_city_post_nm not in
                         (select usr_cntry_city_post_nm
                              from usr u1, usr_cntry uc1
                             where u1.usr_cd = uc1.usr_cntry_usr_id
                               and u1.usr_role_cd = 242
                               and uc1.usr_cntry_cntry_cd =
                                   v_PAO_CNTRY_POST.Usr_Cntry_Cntry_Cd))));

        END IF;
      END LOOP;
      --------
      commit;
      -- If DOS Office Director:
    ELSIF vAuthAgentRoleID = 306 THEN
      FOR v_DOS_Office_Dir IN c_DOS_Office_Dir LOOP
        UPDATE usr u
           SET u.usr_auth_agent_id = arg_GA_UsrID
         WHERE u.usr_cd != arg_GA_UsrID
           and u.usr_role_cd != 306
           and u.usr_cd in
               (select uc.usr_cntry_usr_id
                  from usr_cntry uc
                 where uc.usr_cntry_cntry_cd = 'US'
                   and uc.usr_cntry_ofc_abbr =
                       v_DOS_Office_Dir.usr_cntry_ofc_abbr);
      END LOOP;
      --------
      commit;
    END IF;

  End sp_ApprvUsr;
  ---================================================================================
  procedure sp_getCountUsrsByStatus(arg_Usr_CD              IN NUMBER,
                                    rc_getListOfUsers_StatN OUT refc_Base,
                                    rc_getListOfUsers_StatH OUT refc_Base,
                                    rc_getListOfUsers_StatA OUT refc_Base,
                                    rc_getListOfUsers_StatI OUT refc_Base) is

    vUsrRoleCD NUMBER;
  Begin

    select usr_role_cd
      into vUsrRoleCD
      from usr u
     where u.usr_cd = arg_Usr_CD;

    If vUsrRoleCD = 1 or vUsrRoleCD = 304 Then
      OPEN rc_getListOfUsers_StatN FOR
        select count(u.usr_cd) as countN
          from usr u
         where u.usr_is_act in ('N', 'W');
      --
      OPEN rc_getListOfUsers_StatH FOR
        select count(u.usr_cd) as countH
          from usr u
         where u.usr_is_act = 'H';
      --
      OPEN rc_getListOfUsers_StatA FOR
        select count(u.usr_cd) as countA
          from usr u
         where u.usr_is_act = 'A';
      --
      OPEN rc_getListOfUsers_StatI FOR
        select count(u.usr_cd) as countI
          from usr u
         where u.usr_is_act = 'I';
      --
    Else
      --
      OPEN rc_getListOfUsers_StatN FOR
        select count(u.usr_cd) as countN
          from usr u
         where u.usr_is_act in ('N', 'W')
           and u.usr_auth_agent_id = arg_Usr_CD;
      --
      OPEN rc_getListOfUsers_StatH FOR
        select count(u.usr_cd) as countH
          from usr u
         where u.usr_is_act = 'H'
           and u.usr_auth_agent_id = arg_Usr_CD;
      --
      OPEN rc_getListOfUsers_StatA FOR
        select count(u.usr_cd) as countA
          from usr u
         where u.usr_is_act = 'A'
           and u.usr_auth_agent_id = arg_Usr_CD;
      --
      OPEN rc_getListOfUsers_StatI FOR
        select count(u.usr_cd) as countI
          from usr u
         where u.usr_is_act = 'I'
           and u.usr_auth_agent_id = arg_Usr_CD;
      --
    End If;
  End sp_getCountUsrsByStatus;
  ---================================================================================
  procedure sp_UpdUserData(arg_UP_UsrID             IN NUMBER,
                           arg_UP_UsrPrfx           IN VARCHAR2,
                           arg_UP_UsrFName          IN VARCHAR2,
                           arg_UP_UsrMI             IN VARCHAR2,
                           arg_UP_UsrLName          IN VARCHAR2,
                           arg_UP_UsrPhone          IN VARCHAR2,
                           arg_UP_UsrExt            IN VARCHAR2,
                           arg_UP_UsrEmail          IN VARCHAR2,
                           arg_UP_UsrName           IN VARCHAR2,
                           arg_UP_UsrPass           IN VARCHAR2,
                           arg_UP_UsrRoleID         IN NUMBER,
                           arg_UP_UsrIsAct          IN VARCHAR2,
                           arg_UP_UsrDepartDT       IN VARCHAR2,
                           arg_UP_UsrCntryOfAssgnCD IN VARCHAR2,
                           arg_UP_UsrCityPostNM     IN VARCHAR2

                           ) is

  Begin
    ----------------------------------------------------------------------------
    update usr u
       set u.usr_pfx         = DECODE(arg_UP_UsrPrfx,
                                      '-1',
                                      NULL,
                                      arg_UP_UsrPrfx),
           usr_fname         = DECODE(arg_UP_UsrFName,
                                      '',
                                      NULL,
                                      UPPER(arg_UP_UsrFName)),
           usr_mi            = DECODE(arg_UP_UsrMI,
                                      '',
                                      NULL,
                                      UPPER(arg_UP_UsrMI)),
           usr_lname         = UPPER(arg_UP_UsrLName),
           usr_phone         = arg_UP_UsrPhone,
           usr_ext           = DECODE(arg_UP_UsrExt, '', NULL, arg_UP_UsrExt),
           usr_email         = arg_UP_UsrEmail,
           usr_uname         = arg_UP_UsrName,
           usr_pass          = arg_UP_UsrPass,
           usr_role_cd       = arg_UP_UsrRoleID,
           usr_is_act        = arg_UP_UsrIsAct,
           usr_est_depart_dt = DECODE(arg_UP_UsrDepartDT,
                                      '',
                                      NULL,
                                      TO_DATE(arg_UP_UsrDepartDT,
                                              'DD-MON-YYYY'))
     where u.usr_cd = arg_UP_UsrID;
    ---
    commit;
    ----------------------------------------------------------------------------

  End sp_UpdUserData;
  ---================================================================================
  procedure sp_getCustomSearches(arg_Usr_CD         IN NUMBER,
                                 arg_SC_Search_Type IN VARCHAR2,
                                 rc_CustomSearches  OUT refc_Base) is
  Begin
    OPEN rc_CustomSearches FOR
      select cust_search_id,
             cust_search_usr_cd,
             cust_search_nm,
             cust_search_gender_cd,
             NVL(cust_search_frst_nm, 'nullishere') AS cust_search_frst_nm,
             NVL(cust_search_last_nm, 'nullishere') AS cust_search_last_nm,
             cust_search_from_cntry_cd,
             cust_search_to_cntry_cd,
             cust_search_pgm_type_cd,
             cust_search_yr_type,
             cust_search_yr,
             --
             NVL(cust_search_field_stdy_nm, 'nullishere') as cust_search_field_stdy_nm,
             NVL(cust_search_ctznsp_cntry_cd, '-1') as cust_search_ctznsp_cntry_cd,
             NVL(cust_search_resdnc_cntry_cd, '-1') as cust_search_resdnc_cntry_cd,
             NVL(cust_search_resdnc_city_nm, 'nullishere') as cust_search_resdnc_city_nm,
             NVL(cust_search_host_inst_nm, 'nullishere') as cust_search_host_inst_nm,
             NVL(cust_search_city_visit_nm, 'nullishere') as cust_search_city_visit_nm
        from cust_search cs
       where cs.cust_search_search_type = arg_SC_Search_Type
         and cs.cust_search_usr_cd = arg_Usr_CD

      ;

  End sp_getCustomSearches;
  ---================================================================================
  procedure sp_getCountries(arg_Usr_CD      in NUMBER,
                            rc_getCntryFrom OUT refc_Base,
                            rc_getCntryTo   OUT refc_Base) is
    vUsrRoleID NUMBER;
  Begin
    -- 1. Based on Usr CD, determine User's role:
    select u.usr_role_cd
      into vUsrRoleID
      from usr u
     where u.usr_cd = arg_Usr_CD;

    --- 2.
    -- Users with ID=245 are FSN - Foreign Service National.
    -- Only they should have limitation to their own countries
    -- and additional countries if approved by PAO.  All other roles should have
    -- access to all countries available in database.
    ---!!!!!!!!!!!!!!!!!!!!!!!!!
    if (vUsrRoleID = 245) then
      --- 2.1 Country From
      OPEN rc_getCntryFrom FOR
        select 1 as row_num,
               NVL(cntry_regn_cd, 'Region Req') as cntry_regn_cd,
               cntry_cntry_cd as pgm_from_cntry_cd,
               cntry_cntry_nm as cntry_name
          from cntry c
         where c.cntry_cntry_cd = 'US'
        --
        union
        --
        select 2 as row_num,
               NVL(cntry_regn_cd, 'Region Req') as cntry_regn_cd,
               cntry_cntry_cd as pgm_from_cntry_cd,
               Replace(cntry_cntry_nm, '''', '`') as cntry_name
          from cntry, usr_cntry
         where usr_cntry_cntry_cd = cntry_cntry_cd
           and usr_cntry_usr_id = arg_Usr_CD
           and cntry_cntry_cd != 'US'
        --
         order by row_num, cntry_name;
      --- 2.2 Country To
      OPEN rc_getCntryTo FOR
        select 1 as row_num,
               NVL(cntry_regn_cd, 'Region Req') as cntry_regn_cd,
               cntry_cntry_cd as pgm_to_cntry_cd,
               cntry_cntry_nm as cntry_name
          from cntry c
         where c.cntry_cntry_cd = 'US'
        --
        union
        --
        select 2 as row_num,
               NVL(cntry_regn_cd, 'Region Req') as cntry_regn_cd,
               cntry_cntry_cd as pgm_to_cntry_cd,
               Replace(cntry_cntry_nm, '''', '`') as cntry_name
          from cntry, usr_cntry
         where usr_cntry_cntry_cd = cntry_cntry_cd
           and usr_cntry_usr_id = arg_Usr_CD
           and cntry_cntry_cd != 'US'
        --
         order by row_num, cntry_name;
    else
      --- 2.3 Country From ----------------------------
      OPEN rc_getCntryFrom FOR
        select 1 as row_num,
               NVL(cntry_regn_cd, 'Region Req') as cntry_regn_cd,
               cntry_cntry_cd as pgm_from_cntry_cd,
               cntry_cntry_nm as cntry_name
          from cntry c
         where c.cntry_cntry_cd = 'US'
        --
        union
        --
        select 2 as row_num,
               NVL(cntry_regn_cd, 'Region Req') as cntry_regn_cd,
               cntry_cntry_cd as pgm_from_cntry_cd,
               Replace(cntry_cntry_nm, '''', '`') as cntry_name
          from cntry
         where cntry_cntry_cd != 'US'
        --
         order by row_num, cntry_name;
      --- 2.4 Country To ------------------------------
      OPEN rc_getCntryTo FOR
        select 1 as row_num,
               NVL(cntry_regn_cd, 'Region Req') as cntry_regn_cd,
               cntry_cntry_cd as pgm_to_cntry_cd,
               cntry_cntry_nm as cntry_name
          from cntry c
         where c.cntry_cntry_cd = 'US'
        --
        union
        --
        select 2 as row_num,
               NVL(cntry_regn_cd, 'Region Req') as cntry_regn_cd,
               cntry_cntry_cd as pgm_to_cntry_cd,
               Replace(cntry_cntry_nm, '''', '`') as cntry_name
          from cntry
         where cntry_cntry_cd != 'US'
        --
         order by row_num, cntry_name;
    end if;

  End sp_getCountries;

  ---================================================================================
  procedure sp_getPrograms(rc_getPrograms OUT refc_Base) is
  Begin
    OPEN rc_getPrograms FOR
      select pgm_type_cd, Replace(pgm_type_nm, '''', '`') as pgm_type_nm
        from pgm_type
       where pgm_type_cd = pgm_type_crnt_cd
         and pgm_type_cd not in (1, 99)
       order by 2;
    /*
    select distinct p.pgm_type_cd, pt.pgm_type_nm
    from pgm p, pgm_type pt
    where p.pgm_type_cd = pt.pgm_type_cd
    order by 2;
    */
  End sp_getPrograms;
  ---================================================================================
  procedure sp_getPgmFiscalYr(rc_getPgmFiscalYr OUT refc_Base) is
  Begin
    OPEN rc_getPgmFiscalYr FOR
      select Min(pgm_fy_dt) as min_pgm_fy_dt,
             Max(pgm_fy_dt) as max_pgm_fy_dt
        from pgm
       where pgm.show_pgm_ind = 'Y';

  End sp_getPgmFiscalYr;
  ---================================================================================
  procedure sp_getPgmStartYr(rc_getPgmStartYr OUT refc_Base) is
  Begin
    OPEN rc_getPgmStartYr FOR
      select Min(pgm_yr_dt) as min_pgm_yr_dt,
             Max(pgm_yr_dt) as max_pgm_yr_dt
        from pgm p
       where p.show_pgm_ind = 'Y';

  End sp_getPgmStartYr;
  ---================================================================================
  procedure sp_InsUpdCustomSearch(arg_CS_Search_ID in NUMBER,
                                  arg_Usr_CD       in NUMBER,
                                  arg_CS_Search_Nm in varchar2,
                                  arg_CS_First_Nm  in varchar2,
                                  arg_CS_Last_Nm   in varchar2,
                                  arg_CS_Gender    in varchar2,
                                  --
                                  arg_CS_From_Cntry in varchar2,
                                  arg_CS_To_Cntry   in varchar2,
                                  --
                                  arg_CS_Pgm_Type in varchar2,
                                  --
                                  arg_CS_Year_Type in varchar2,
                                  arg_CS_Year      in varchar2,
                                  --
                                  arg_CS_Citznsp_Cntry_CD in varchar2,
                                  arg_CS_Resdnc_Cntry_CD  in varchar2,
                                  --
                                  arg_SC_Search_Type IN VARCHAR2,
                                  rc_CustomSearchID  OUT refc_Base) is
    vSearchID NUMBER;
  Begin
    --  1. --------------------------------------------------------
    if arg_CS_Search_ID = 0 then
      select cust_search_seq.nextval into vSearchID from dual;
    else
      vSearchID := arg_CS_Search_ID;
    end if;
    --  2. --------------------------------------------------------
    if arg_CS_Search_ID = 0 then
      ---
      insert into cust_search
        (cust_search_id,
         cust_search_usr_cd,
         cust_search_nm,
         cust_search_frst_nm,
         cust_search_last_nm,
         cust_search_gender_cd,
         cust_search_from_cntry_cd,
         cust_search_to_cntry_cd,
         cust_search_pgm_type_cd,
         cust_search_yr_type,
         cust_search_yr,
         --
         cust_search_ctznsp_cntry_cd,
         cust_search_resdnc_cntry_cd,
         cust_search_search_type)
      values
        (vSearchID,
         arg_Usr_CD,
         arg_CS_Search_Nm,
         DECODE(arg_CS_First_Nm, '', null, arg_CS_First_Nm),
         DECODE(arg_CS_Last_Nm, '', null, arg_CS_Last_Nm),
         arg_CS_Gender,
         arg_CS_From_Cntry,
         arg_CS_To_Cntry,
         arg_CS_Pgm_Type,
         arg_CS_Year_Type,
         arg_CS_Year,
         --
         arg_CS_Citznsp_Cntry_CD,
         arg_CS_Resdnc_Cntry_CD,
         arg_SC_Search_Type);
      ---
    else
      ---
      update cust_search
         set cust_search_frst_nm         = DECODE(arg_CS_First_Nm,
                                                  '',
                                                  null,
                                                  arg_CS_First_Nm),
             cust_search_last_nm         = DECODE(arg_CS_Last_Nm,
                                                  '',
                                                  null,
                                                  arg_CS_Last_Nm),
             cust_search_gender_cd       = arg_CS_Gender,
             cust_search_from_cntry_cd   = arg_CS_From_Cntry,
             cust_search_to_cntry_cd     = arg_CS_To_Cntry,
             cust_search_pgm_type_cd     = arg_CS_Pgm_Type,
             cust_search_yr_type         = arg_CS_Year_Type,
             cust_search_yr              = arg_CS_Year,
             cust_search_ctznsp_cntry_cd = arg_CS_Citznsp_Cntry_CD,
             cust_search_resdnc_cntry_cd = arg_CS_Resdnc_Cntry_CD

       where cust_search_id = vSearchID
         and cust_search_usr_cd = arg_Usr_CD
         and cust_search_search_type = arg_SC_Search_Type;
      ---
    end if;
    ---
    commit;
    ---
    --  3. --------------------------------------
    OPEN rc_CustomSearchID FOR
      select vSearchID as cust_search_id from dual;
    ----------------------------------------------
  End sp_InsUpdCustomSearch;
  ---================================================================================
  procedure sp_InsUpdAdvCustomSearch(arg_CS_Search_ID in NUMBER,
                                     arg_Usr_CD       in NUMBER,
                                     arg_CS_Search_Nm in varchar2,
                                     arg_CS_First_Nm  in varchar2,
                                     arg_CS_Last_Nm   in varchar2,
                                     arg_CS_Gender    in varchar2,
                                     --
                                     arg_CS_From_Cntry in varchar2,
                                     arg_CS_To_Cntry   in varchar2,
                                     --
                                     arg_CS_Pgm_Type in varchar2,
                                     --
                                     arg_CS_Year_Type in varchar2,
                                     arg_CS_Year      in varchar2,
                                     --
                                     arg_CS_Field_Stdy_Nm    in varchar2,
                                     arg_CS_Citznsp_Cntry_CD in varchar2,
                                     arg_CS_Resdnc_Cntry_CD  in varchar2,
                                     --
                                     arg_CS_Resdnc_City_Nm in varchar2,
                                     arg_CS_Host_Instn_Nm  in varchar2,
                                     arg_CS_Visit_City_Nm  in varchar2,
                                     arg_SC_Search_Type    IN VARCHAR2,
                                     rc_CustomSearchID     OUT refc_Base) is
    vSearchID NUMBER;
  Begin
    --  1. --------------------------------------------------------
    if arg_CS_Search_ID = 0 then
      select cust_search_seq.nextval into vSearchID from dual;
    else
      vSearchID := arg_CS_Search_ID;
    end if;
    --  2. --------------------------------------------------------
    if arg_CS_Search_ID = 0 then
      ---
      insert into cust_search
        (cust_search_id,
         cust_search_usr_cd,
         cust_search_nm,
         cust_search_frst_nm,
         cust_search_last_nm,
         cust_search_gender_cd,
         cust_search_from_cntry_cd,
         cust_search_to_cntry_cd,
         cust_search_pgm_type_cd,
         cust_search_yr_type,
         cust_search_yr,
         --
         cust_search_field_stdy_nm,
         cust_search_ctznsp_cntry_cd,
         cust_search_resdnc_cntry_cd,
         cust_search_resdnc_city_nm,
         cust_search_host_inst_nm,
         cust_search_city_visit_nm,
         cust_search_search_type)
      values
        (vSearchID,
         arg_Usr_CD,
         arg_CS_Search_Nm,
         DECODE(arg_CS_First_Nm, '', null, arg_CS_First_Nm),
         DECODE(arg_CS_Last_Nm, '', null, arg_CS_Last_Nm),
         arg_CS_Gender,
         arg_CS_From_Cntry,
         arg_CS_To_Cntry,
         arg_CS_Pgm_Type,
         arg_CS_Year_Type,
         arg_CS_Year,
         --
         arg_CS_Field_Stdy_Nm,
         arg_CS_Citznsp_Cntry_CD,
         arg_CS_Resdnc_Cntry_CD,
         arg_CS_Resdnc_City_Nm,
         arg_CS_Host_Instn_Nm,
         arg_CS_Visit_City_Nm,
         arg_SC_Search_Type);
      ---
    else
      ---
      update cust_search
         set cust_search_frst_nm         = DECODE(arg_CS_First_Nm,
                                                  '',
                                                  null,
                                                  arg_CS_First_Nm),
             cust_search_last_nm         = DECODE(arg_CS_Last_Nm,
                                                  '',
                                                  null,
                                                  arg_CS_Last_Nm),
             cust_search_gender_cd       = arg_CS_Gender,
             cust_search_from_cntry_cd   = arg_CS_From_Cntry,
             cust_search_to_cntry_cd     = arg_CS_To_Cntry,
             cust_search_pgm_type_cd     = arg_CS_Pgm_Type,
             cust_search_yr_type         = arg_CS_Year_Type,
             cust_search_yr              = arg_CS_Year,
             cust_search_field_stdy_nm   = arg_CS_Field_Stdy_Nm,
             cust_search_ctznsp_cntry_cd = arg_CS_Citznsp_Cntry_CD,
             cust_search_resdnc_cntry_cd = arg_CS_Resdnc_Cntry_CD,
             cust_search_resdnc_city_nm  = arg_CS_Resdnc_City_Nm,
             cust_search_host_inst_nm    = arg_CS_Host_Instn_Nm,
             cust_search_city_visit_nm   = arg_CS_Visit_City_Nm

       where cust_search_id = vSearchID
         and cust_search_usr_cd = arg_Usr_CD
         and cust_search_search_type = arg_SC_Search_Type;
      ---
    end if;
    ---
    commit;
    ---
    --  3. --------------------------------------
    OPEN rc_CustomSearchID FOR
      select vSearchID as cust_search_id from dual;
    ----------------------------------------------
  End sp_InsUpdAdvCustomSearch;
  ---================================================================================
  procedure sp_getCustomSearch(arg_CS_Search_ID   in number,
                               rc_getCustomSearch OUT refc_Base) is
  Begin
    OPEN rc_getCustomSearch FOR
      select cust_search_id,
             cust_search_usr_cd,
             cust_search_nm,
             NVL(cust_search_frst_nm, '') as cust_search_frst_nm,
             NVL(cust_search_last_nm, '') as cust_search_last_nm,
             NVL(cust_search_gender_cd, '-1') as cust_search_gender_cd,
             NVL(cust_search_from_cntry_cd, '-1') as cust_search_from_cntry_cd,
             NVL(cust_search_to_cntry_cd, '-1') as cust_search_to_cntry_cd,
             NVL(cust_search_pgm_type_cd, '-1') as cust_search_pgm_type_cd,
             NVL(cust_search_yr_type, '-1') as cust_search_yr_type,
             NVL(cust_search_yr, '-1') as cust_search_yr,
             NVL(cust_search_field_stdy_nm, '') as cust_search_field_stdy_nm,
             NVL(cust_search_ctznsp_cntry_cd, '-1') as cust_search_ctznsp_cntry_cd,
             NVL(cust_search_resdnc_cntry_cd, '-1') as cust_search_resdnc_cntry_cd,
             NVL(cust_search_resdnc_city_nm, '') as cust_search_resdnc_city_nm,
             NVL(cust_search_host_inst_nm, '') as cust_search_host_inst_nm,
             NVL(cust_search_city_visit_nm, '') as cust_search_city_visit_nm
        from cust_search cs
       where cs.cust_search_id = arg_CS_Search_ID;

  End sp_getCustomSearch;
  ---================================================================================
  procedure sp_deleteCustomSearch(arg_CS_Search_ID IN NUMBER) is
  Begin
    delete cust_search where cust_search_id = arg_CS_Search_ID;
    ---
    commit;
    ---
  End sp_deleteCustomSearch;
  ---================================================================================

  procedure sp_execSQL_SelectCount(arg_execSQL_SelectCount IN VARCHAR2,
                                   arg_Usr_CD              IN number,
                                   rc_execSQL_SelectCount  OUT refc_Base) is
  Begin
    ---
    delete cust_search_rcrd_count where csrc_usr_cd = arg_Usr_CD;
    ---
    commit;
    --
    --dbms_output.put_line();
    ----------------------------------
    EXECUTE IMMEDIATE arg_execSQL_SelectCount;
    --dbms_output.put_line();
    --
    commit;
    ---
    OPEN rc_execSQL_SelectCount FOR
      select csrc_counter
        from cust_search_rcrd_count
       where csrc_usr_cd = arg_Usr_CD;
  End sp_execSQL_SelectCount;
  ---===============================================================================
  procedure sp_execSQL(arg_execSQL IN VARCHAR2, arg_Usr_CD IN NUMBER) is
  Begin
    delete cust_search_rcrd where csr_usr_cd = arg_Usr_CD;
    --
    commit;
    --
    --dbms_output.put_line(var_Name);
    ----------------------------------
    EXECUTE IMMEDIATE arg_execSQL;
    --dbms_output.put_line(vs_Answers);
    --
    commit;
    --
  End sp_execSQL;
  ---===============================================================================
  procedure sp_execSQL_RPT(arg_execSQL IN VARCHAR2, arg_Usr_CD IN NUMBER) is
  Begin

    delete adhoc_rpt where ahr_usr_cd = arg_Usr_CD;
    --
    commit;
    --
    --dbms_output.put_line(var_Name);
    ----------------------------------
    EXECUTE IMMEDIATE arg_execSQL;
    --dbms_output.put_line(vs_Answers);
    --
    commit;
    --
  End sp_execSQL_RPT;
  ---===============================================================================
  procedure sp_execSQL_StatRPT(arg_execSQL IN VARCHAR2,
                               arg_Usr_CD  IN NUMBER) is
  Begin

    delete random_rpt where rrpt_usr_cd = arg_Usr_CD;
    --
    commit;
    --
    --dbms_output.put_line(var_Name);
    ----------------------------------
    EXECUTE IMMEDIATE arg_execSQL;
    --dbms_output.put_line(vs_Answers);
    --
    commit;
    --
  End sp_execSQL_StatRPT;

  ---================================================================================
  procedure sp_countSearchedRecords(arg_Usr_CD              IN NUMBER,
                                    rc_countSearchedRecords OUT refc_Base) is
  Begin
    OPEN rc_countSearchedRecords FOR
      select Count(*) AS countSearchedRecords
        from cust_search_rcrd c
       where c.csr_usr_cd = arg_Usr_CD;

  End sp_countSearchedRecords;
  ---================================================================================
  procedure sp_getSearchedRecords(arg_Usr_CD            IN NUMBER,
                                  rc_getSearchedRecords OUT refc_Base) is
  Begin
    OPEN rc_getSearchedRecords FOR
      select csr_usr_cd,
             csr_rcrd_num,
             csr_almn_id,
             Replace(csr_almn_last_nm, '''', '`') AS csr_almn_last_nm,
             Replace(csr_almn_full_nm, '''', '`') AS csr_almn_full_nm,
             csr_gender,
             csr_pgm_field_stdy_cd,
             csr_pgm_topic_txt,
             Replace(csr_field_stdy_nm, '''', '`') AS csr_field_stdy_nm,
             csr_pgm_type_cd,
             csr_pgm_type_nm,
             csr_pgm_fy_dt,
             csr_pgm_yr_dt,
             NVL(csr_almn_updt_id, 0) as csr_almn_updt_id,
             Decode(csr_almn_updt_dt, null, 'No', csr_almn_updt_dt) as csr_almn_updt_dt,
             csr_updt_usr_nm
        from cust_search_rcrd csr
       where csr.csr_usr_cd = arg_Usr_CD;

  End sp_getSearchedRecords;
  --=================================================================================
  procedure sp_getRprtRecords(arg_Usr_CD               IN NUMBER,
                              arg_Rpt_Type             IN VARCHAR2,
                              arg_File_Type            IN VARCHAR2,
                              rc_getRptSearchedRecords OUT refc_Base) is
  Begin

    if arg_Rpt_Type = 'MAIL' then

      open rc_getRptSearchedRecords for

        select ahr_field1 as mail_data
          from adhoc_rpt ar
         where ar.ahr_type = arg_Rpt_Type
           and ar.ahr_usr_cd = arg_Usr_CD;

      set transaction use rollback segment LARGE_RBS;
      delete adhoc_rpt where ahr_usr_cd = arg_Usr_CD;
    end if;

    if arg_Rpt_Type = 'CONT' then

      open rc_getRptSearchedRecords for

        select ahr_field1 as cont_data
          from adhoc_rpt ar
         where ar.ahr_type = arg_Rpt_Type
           and ar.ahr_usr_cd = arg_Usr_CD;
      set transaction use rollback segment LARGE_RBS;
      delete adhoc_rpt where ahr_usr_cd = arg_Usr_CD;
    end if;

    if arg_Rpt_Type = 'DIST' then

      open rc_getRptSearchedRecords for

        select ahr_field1 as dist_data
          from adhoc_rpt ar
         where ar.ahr_type = arg_Rpt_Type
           and ar.ahr_usr_cd = arg_Usr_CD;
      set transaction use rollback segment LARGE_RBS;
      delete adhoc_rpt where ahr_usr_cd = arg_Usr_CD;
    end if;

    if arg_Rpt_Type = 'STAT' then
      open rc_getRptSearchedRecords for
        select rrpt_field1 as fie1d1
          from random_rpt rr
         where rr.rrpt_type = arg_Rpt_Type
           and rr.rrpt_usr_cd = arg_Usr_CD;
      set transaction use rollback segment LARGE_RBS;
      delete random_rpt where rrpt_usr_cd = arg_Usr_CD;
    end if;
    commit;
  End sp_getRprtRecords;
  --=================================================================================
  procedure sp_deleteSearchedRecords(arg_Usr_CD IN NUMBER) IS
  Begin

    delete cust_search_rcrd_count where csrc_usr_cd = arg_Usr_CD;
    delete cust_search_rcrd where csr_usr_cd = arg_Usr_CD;
    --
    commit;
    --
  End sp_deleteSearchedRecords;
  --=================================================================================
  procedure sp_getAlnmProfile(arg_AP_AlmnID     IN NUMBER,
                              rc_getAlnmProfile OUT refc_Base -- 1. --
                             ,
                              rc_getPgm         OUT refc_Base -- 2. --
                             ,
                              rc_Job            OUT refc_Base -- 3. --
                              ) is
  Begin
    -- 1. -------------------------------------------------------------------------------------
    OPEN rc_getAlnmProfile FOR
      select almn_id,
             NVL(almn_pfx_dsc, '-1') AS almn_pfx_dsc,
             NVL(almn_frst_nm, '') AS almn_frst_nm,
             NVL(almn_midl_nm, '') AS almn_midl_nm,
             almn_last_nm,
             NVL(almn_last_nm2, '') AS almn_last_nm2,
             NVL(almn_sfx_dsc, '') AS almn_sfx_dsc,
             ----------------------------------------
             NVL(almn_sex_ind, '-1') AS almn_sex_ind,
             NVL(TO_CHAR(almn_dob_dt, 'mm/dd/yyyy'), '') AS almn_dob_dt,
             ----------------------------------------
             NVL(almn_ctznsp_cntry_cd, '-1') AS almn_ctznsp_cntry_cd,
             NVL(almn_ctznsp_cntry_cd2, '-1') AS almn_ctznsp_cntry_cd2,
             ----------------------------------------
             NVL(almn_cntct_ind, 'Y') AS almn_cntct_ind,
             NVL(almn_dcsd_ind, 'N') AS almn_dcsd_ind,
             NVL(almn_dsabld_ind, 'N') AS almn_dsabld_ind,
             ---------------------------------------------------------
             NVL(almn_resdnc_adrs_txt, '') AS almn_resdnc_adrs_txt,
             NVL(almn_resdnc_city_nm, '') AS almn_resdnc_city_nm,
             NVL(almn_resdnc_state_prvnc_nm, '') AS almn_resdnc_state_prvnc_nm,
             NVL(almn_resdnc_cntry_cd, '-1') AS almn_resdnc_cntry_cd,
             ----------------------------------------------------------
             NVL(almn_bsns_nm, '') AS almn_bsns_nm,
             NVL(almn_bsns_adrs_txt, '') AS almn_bsns_adrs_txt,
             NVL(almn_bsns_city_nm, '') AS almn_bsns_city_nm,
             NVL(almn_bsns_state_prvnc_nm, '') AS almn_bsns_state_prvnc_nm,
             NVL(almn_bsns_cntry_cd, '-1') AS almn_bsns_cntry_cd,
             NVL(almn_bsns_postl_cd, '') AS almn_bsns_postl_cd,
             ----------------------------------------------------------
             NVL(almn_prefrd_adrs_ind, '-1') AS almn_prefrd_adrs_ind,
             ----------------------------------------------------------
             NVL(almn_resdnc_phone_num, '') AS almn_resdnc_phone_num,
             NVL(almn_bsns_phone_num, '') AS almn_bsns_phone_num,
             NVL(almn_cell_num, '') AS almn_cell_num,
             NVL(almn_othr_phone_num, '') AS almn_othr_phone_num,
             NVL(almn_resdnc_postl_cd, '') AS almn_resdnc_postl_cd,
             ----------------------------------------------------------
             NVL(almn_prefrd_phone_num_ind, '-1') AS almn_prefrd_phone_num_ind,
             ----------------------------------------------------------
             NVL(almn_fax_num, '') AS almn_fax_num,
             ----------------------------------------------------------
             NVL(almn_email1_txt, '') AS almn_email1_txt,
             NVL(almn_email2_txt, '') AS almn_email2_txt,
             ----------------------------------------------------------
             NVL(almn_prefrd_email_ind, '-1') AS almn_prefrd_email_ind,
             ----------------------------------------------------------
             NVL(ai.almn_intrst_cd, -1) AS almn_intrst_cd,
             ----------------------------------------------------------
             NVL(almn_elp_speak_fsi_level_num, '-1') AS almn_elp_speak_fsi_level_num,
             NVL(almn_elp_read_fsi_level_num, '-1') AS almn_elp_read_fsi_level_num,
             NVL(almn_elp_comp_fsi_level_num, '-1') AS almn_elp_comp_fsi_level_num,
             ----------------------------------------------------------
             NVL(almn_notes_txt, '') AS almn_notes_txt
      ----------------------------------------------------------
        from almn a, almn_intrst ai
       where a.almn_id = arg_AP_AlmnID
         and a.almn_id = ai.almn_intrst_almn_id(+);

    -- 2. ----------------------------------------------------------------------
    OPEN rc_getPgm FOR
      select distinct pgm_id,
                      f_getCntryNM(p.pgm_from_cntry_cd) as pgm_from_cntry_nm,
                      f_getCntryNM(p.pgm_to_cntry_cd) as pgm_to_cntry_nm,
                      DECODE(p.pgm_type_cd, NULL, '-', pt.pgm_type_nm) as pgm_type_nm,
                      NVL(to_char(pgm_fy_dt), '-') AS pgm_fy_dt,
                      NVL(to_char(pgm_yr_dt), '-') AS pgm_yr_dt,
                      DECODE(p.pgm_field_stdy_cd,
                             NULL,
                             '-',
                             fs.field_stdy_nm) AS field_stdy_nm,
                      NVL(pgm_strtgc_goal_txt, '-') AS pgm_strtgc_goal_txt,
                      NVL(pv.place_visit_host_instn_nm, 'No Data') AS place_visit_host_instn_nm
        from pgm p, pgm_type pt, field_stdy fs, place_visit pv
       where p.pgm_almn_id = arg_AP_AlmnID
         and p.pgm_type_cd = pt.pgm_type_cd
         and p.pgm_field_stdy_cd = fs.field_stdy_cd(+)
         and p.pgm_id = pv.place_visit_pgm_id(+)
         and p.pgm_almn_id = pv.place_visit_almn_id(+);
    -- 3.--------------------------------------------------------------------
    OPEN rc_Job FOR
      select distinct job_num,
                      NVL(j.job_title_txt, '') as job_title_txt,
                      NVL(j.job_instn_nm, '') as job_instn_nm,
                      NVL(j.job_crnt_ind, 'N') as job_crnt_ind
        from job j
       where j.job_almn_id = arg_AP_AlmnID
       order by j.job_num;

  End sp_getAlnmProfile;
  ---================================================================================
  procedure sp_UpdateAlmnRecord(arg_AP_AlmnID   IN NUMBER,
                                arg_AP_Pfx      in varchar2,
                                arg_AP_Frst_Nm  in varchar2,
                                arg_AP_Midl_Nm  in varchar2,
                                arg_AP_Last_Nm  in varchar2,
                                arg_AP_Last_Nm2 in varchar2,
                                arg_AP_Sfx      in varchar2,
                                ----
                                arg_AP_Sex in varchar2,
                                arg_AP_DOB in varchar2,
                                ---
                                arg_AP_Ctznsp_Cd  in varchar2,
                                arg_AP_Ctznsp_Cd2 in varchar2,
                                ----
                                arg_AP_Cntct_Ind in varchar2,
                                arg_AP_Dcsd      in varchar2,
                                arg_AP_Dsabld    in varchar2,
                                ---
                                arg_AP_Resdnc_Adrs_Txt       in varchar2,
                                arg_AP_Resdnc_City_Nm        in varchar2,
                                arg_AP_Resdnc_State_Prvnc_Nm in varchar2,
                                arg_AP_Resdnc_Postl_CD       in varchar2,
                                arg_AP_Resdnc_Cntry_Cd       in varchar2,
                                ---
                                arg_AP_legal_state_cd      in varchar2,
                                arg_AP_cngrtsnl_dstrct_num in NUMBER,
                                ---
                                arg_AP_Bsns_Nm             in varchar2,
                                arg_AP_Bsns_Adrs_Txt       in varchar2,
                                arg_AP_Bsns_City_Nm        in varchar2,
                                arg_AP_Bsns_State_Prvnc_Nm in varchar2,
                                arg_AP_Bsns_Postl_CD       in varchar2,
                                arg_AP_Bsns_Cntry_Cd       in varchar2,
                                ----
                                arg_AP_Prfrd_Adrs_ind in varchar2,
                                ----
                                ----
                                arg_AP_Resdnc_Phone_Num    in varchar2,
                                arg_AP_Bsns_Phone_Num      in varchar2,
                                arg_AP_Cell_Num            in varchar2,
                                arg_AP_Othr_Phone_Num      in varchar2,
                                arg_AP_Prfrd_Phone_Num_Ind in varchar2,
                                arg_AP_Fax_Num             in varchar2,
                                ---
                                arg_AP_Email1_txt          in varchar2,
                                arg_AP_Email2_txt          in varchar2,
                                arg_AP_Prfrd_Email_Num_Ind in varchar2,
                                ---
                                arg_AP_Intrst in number,
                                ---
                                arg_AP_speak_level IN NUMBER,
                                arg_AP_read_level  IN NUMBER,
                                arg_AP_comp_level  IN NUMBER,
                                ---
                                arg_AP_Notes_Txt in varchar2,
                                ---
                                arg_Usr_CD           IN NUMBER,
                                arg_AP_New_title_txt varchar2,
                                arg_NumOfLoops       in number,
                                arg_AP_New_instn_nm  varchar2,
                                arg_AP_checked_cbx   varchar2

                                ) is
    vInterestCounter NUMBER;
    v_Counter        NUMBER;
    vTempNum         NUMBER;
    vTempStr         VARCHAR2(1000);
    vStr             VARCHAR2(1000);
    vAP_DOB          DATE;

  Begin
    --- DOB preparation:
    select to_date(DECODE(arg_AP_DOB, '', null, arg_AP_DOB), 'mm/dd/yyyy')
      into vAP_DOB
      from dual;
    --- 1. General Information:
    update almn
       set almn_pfx_dsc  = arg_AP_Pfx,
           almn_last_nm  = DECODE(arg_AP_Last_Nm,
                                  '',
                                  null,
                                  UPPER(arg_AP_Last_Nm)),
           almn_last_nm2 = DECODE(arg_AP_Last_Nm2,
                                  '',
                                  null,
                                  UPPER(arg_AP_Last_Nm2)),
           almn_frst_nm  = DECODE(arg_AP_Frst_Nm,
                                  '',
                                  null,
                                  UPPER(arg_AP_Frst_Nm)),
           almn_midl_nm  = DECODE(arg_AP_Midl_Nm,
                                  '',
                                  null,
                                  UPPER(arg_AP_Midl_Nm)),
           almn_sfx_dsc  = DECODE(arg_AP_Sfx, '', null, UPPER(arg_AP_Sfx)),
           ---
           almn_sex_ind = DECODE(arg_AP_Sex, '-1', null, arg_AP_Sex),
           almn_dob_dt  = vAP_DOB,
           ---

           almn_cntct_ind  = arg_AP_Cntct_Ind,
           almn_dcsd_ind   = arg_AP_Dcsd,
           almn_dsabld_ind = arg_AP_Dsabld,
           ---
           almn_ctznsp_cntry_cd  = DECODE(arg_AP_Ctznsp_Cd,
                                          '-1',
                                          null,
                                          arg_AP_Ctznsp_Cd),
           almn_ctznsp_cntry_cd2 = DECODE(arg_AP_Ctznsp_Cd2,
                                          '-1',
                                          null,
                                          arg_AP_Ctznsp_Cd2),
           ---
           almn_resdnc_adrs_txt       = DECODE(arg_AP_Resdnc_Adrs_Txt,
                                               '',
                                               null,
                                               arg_AP_Resdnc_Adrs_Txt),
           almn_resdnc_city_nm        = DECODE(arg_AP_Resdnc_City_Nm,
                                               '',
                                               null,
                                               arg_AP_Resdnc_City_Nm),
           almn_resdnc_state_prvnc_nm = DECODE(arg_AP_Resdnc_State_Prvnc_Nm,
                                               '',
                                               null,
                                               arg_AP_Resdnc_State_Prvnc_Nm),
           --
           almn_resdnc_postl_cd = DECODE(arg_AP_Resdnc_Postl_CD,
                                         '',
                                         null,
                                         arg_AP_Resdnc_Postl_CD),
           --
           almn_resdnc_cntry_cd = DECODE(arg_AP_Resdnc_Cntry_Cd,
                                         '-1',
                                         null,
                                         arg_AP_Resdnc_Cntry_Cd),
           ---
           almn_legal_state_cd      = arg_AP_legal_state_cd,
           almn_cngrtsnl_dstrct_num = arg_AP_cngrtsnl_dstrct_num,
           ---

           --
           almn_bsns_nm = DECODE(arg_AP_Bsns_Nm, '', null, arg_AP_Bsns_Nm),
           --
           almn_bsns_adrs_txt       = DECODE(arg_AP_Bsns_Adrs_Txt,
                                             '',
                                             null,
                                             arg_AP_Bsns_Adrs_Txt),
           almn_bsns_city_nm        = DECODE(arg_AP_Bsns_City_Nm,
                                             '',
                                             null,
                                             arg_AP_Bsns_City_Nm),
           almn_bsns_state_prvnc_nm = DECODE(arg_AP_Bsns_State_Prvnc_Nm,
                                             '',
                                             null,
                                             arg_AP_Bsns_State_Prvnc_Nm),
           almn_bsns_postl_cd       = DECODE(arg_AP_Bsns_Postl_CD,
                                             '',
                                             null,
                                             arg_AP_Bsns_Postl_CD),
           almn_bsns_cntry_cd       = DECODE(arg_AP_Bsns_Cntry_Cd,
                                             '-1',
                                             null,
                                             arg_AP_Bsns_Cntry_Cd),
           ---
           almn_prefrd_adrs_ind = DECODE(arg_AP_Prfrd_Adrs_ind,
                                         '-1',
                                         null,
                                         arg_AP_Prfrd_Adrs_ind),
           ---
           almn_resdnc_phone_num     = DECODE(arg_AP_Resdnc_Phone_Num,
                                              '',
                                              null,
                                              arg_AP_Resdnc_Phone_Num),
           almn_bsns_phone_num       = DECODE(arg_AP_Bsns_Phone_Num,
                                              '',
                                              null,
                                              arg_AP_Bsns_Phone_Num),
           almn_cell_num             = DECODE(arg_AP_Cell_Num,
                                              '',
                                              null,
                                              arg_AP_Cell_Num),
           almn_othr_phone_num       = DECODE(arg_AP_Othr_Phone_Num,
                                              '',
                                              null,
                                              arg_AP_Othr_Phone_Num),
           almn_prefrd_phone_num_ind = arg_AP_Prfrd_Phone_Num_Ind,
           almn_fax_num              = DECODE(arg_AP_Fax_Num,
                                              '',
                                              null,
                                              arg_AP_Fax_Num),
           ---
           almn_email1_txt       = DECODE(arg_AP_Email1_txt,
                                          '',
                                          null,
                                          arg_AP_Email1_txt),
           almn_email2_txt       = DECODE(arg_AP_Email2_txt,
                                          '',
                                          null,
                                          arg_AP_Email2_txt),
           almn_prefrd_email_ind = DECODE(arg_AP_Prfrd_Email_Num_Ind,
                                          '-1',
                                          null,
                                          arg_AP_Prfrd_Email_Num_Ind),
           ---
           almn_elp_speak_fsi_level_num = DECODE(arg_AP_speak_level,
                                                 '-1',
                                                 null,
                                                 arg_AP_speak_level),
           almn_elp_read_fsi_level_num  = DECODE(arg_AP_read_level,
                                                 '-1',
                                                 null,
                                                 arg_AP_read_level),
           almn_elp_comp_fsi_level_num  = DECODE(arg_AP_comp_level,
                                                 '-1',
                                                 null,
                                                 arg_AP_comp_level),
           ---
           almn_notes_txt = DECODE(arg_AP_Notes_Txt,
                                   '',
                                   null,
                                   arg_AP_Notes_Txt),
           ---
           almn_updt_id = arg_Usr_CD,
           almn_updt_dt = sysdate

     where almn_id = arg_AP_AlmnID;
    ---
    commit;
    ---

    --- 2. Interest:
    -- 2.a.
    select Count(*)
      into vInterestCounter
      from almn_intrst ai
     where ai.almn_intrst_almn_id = arg_AP_AlmnID;

    -- 2.b.
    If arg_AP_Intrst > 0 Then
      if vInterestCounter = 0 then
        insert into almn_intrst
          (almn_intrst_almn_id,
           almn_intrst_cd,
           almn_intrst_crtd_dt,
           almn_intrst_crtd_id,
           almn_intrst_updt_dt,
           almn_intrst_updt_id)
        values
          (arg_AP_AlmnID, arg_AP_Intrst, sysdate, arg_Usr_CD, NULL, NULL);
        ---
        commit;
        ---
      else
        update almn_intrst
           set almn_intrst_cd      = arg_AP_Intrst,
               almn_intrst_updt_dt = sysdate,
               almn_intrst_updt_id = arg_Usr_CD
         where almn_intrst_almn_id = arg_AP_AlmnID;
        ---
        commit;
        ---
      end if;
    Else
      if vInterestCounter > 0 then
        delete almn_intrst where almn_intrst_almn_id = arg_AP_AlmnID;
        commit;
      end if;
    End If;
    --- 3

    if (Length(arg_AP_New_title_txt) > 0 or Length(arg_AP_New_instn_nm) > 0) then
      ---
      select DECODE(Max(j.job_num), null, 1, Max(j.job_num) + 1)
        into vTempNum
        from job j
       where j.job_almn_id = arg_AP_AlmnID;
      ---
      insert into job
        (job_almn_id,
         job_num,
         job_pgm_id,
         job_title_txt,
         job_crnt_ind,
         job_instn_nm,
         job_crtd_dt,
         job_crtd_id,
         job_updt_dt,
         job_updt_id,
         original_almn_id,
         pgm_src_nm)
      values
        (arg_AP_AlmnID,
         vTempNum, --v_job_num,
         NULL, --v_job_pgm_id,
         DECODE(arg_AP_New_title_txt, '', NULL, arg_AP_New_title_txt), --v_job_title_txt,
         NULL, --v_job_crnt_ind,
         DECODE(arg_AP_New_instn_nm, '', null, arg_AP_New_instn_nm), --v_job_instn_nm,
         sysdate, --v_job_crtd_dt,
         arg_Usr_CD, --v_job_crtd_id,
         NULL, --v_job_updt_dt,
         NULL, --v_job_updt_id,
         NULL, --v_original_almn_id,
         NULL --v_pgm_src_nm
         );
      ---
      commit;
      ---
    end if;
    ----

    vStr := arg_AP_checked_cbx;
    ---
    FOR v_Counter IN 1 .. arg_NumOfLoops LOOP
      --
      vTempStr := Substr(vStr, 1, (Instr(vStr, ';', 2, 1) - 1));
      vTempNum := TO_NUMBER(SUBSTR(vTempStr,
                                   1,
                                   (INSTR(vTempStr, '_', 2, 1) - 1)));
      vTempStr := SUBSTR(vTempStr, INSTR(vTempStr, '_', 2, 1) + 1);
      ---
      update job
         set job_crnt_ind = vTempStr
       where job_almn_id = arg_AP_AlmnID
         and job_num = vTempNum;

      vStr := Substr(vStr, (Instr(vStr, ';', 2, 1) + 1));

    END LOOP;
    ---
    commit;
    ---

  End sp_UpdateAlmnRecord;
  ---================================================================================
  procedure sp_getHelpTopics(arg_TopicTitleID IN NUMBER,
                             rc_getHelpTopics OUT refc_Base) is
  Begin
    OPEN rc_getHelpTopics FOR
      select topic_security_tree_id AS topic_st_id,
             st.st_nm AS st_nm,
             NVL(Replace(topic_txt, '''', '`'), ' ') AS topic_txt
        from topic t, security_tree st
       where t.topic_navigation_cd = 'HT'
         and t.topic_title = TO_CHAR(arg_TopicTitleID)
         and t.topic_is_active = 'A'
         and t.topic_exprtn_dt is NULL
         and TO_NUMBER(t.topic_security_tree_id) = st.st_id;
  End sp_getHelpTopics;
  ---================================================================================
  procedure sp_getCtrlHelp(arg_HelpItemID IN NUMBER,
                           rc_getCtrlHelp OUT refc_Base) is
  Begin
    OPEN rc_getCtrlHelp FOR
      select ctrl_help_title, ctrl_help_text
        from ctrl_help ch
       where ch.ctrl_help_id = arg_HelpItemID;
  End sp_getCtrlHelp;
  ---================================================================================
  procedure sp_getHSandCV(arg_CntryToCD   IN VARCHAR2,
                          rc_getHostInst  OUT refc_Base,
                          rc_getCityVisit OUT refc_Base) is
  Begin
    ----
    OPEN rc_getHostInst FOR
      select distinct Replace(Replace(pv.place_visit_host_instn_nm,
                                      '''',
                                      '`'),
                              '"',
                              '``') as place_visit_host_instn_nm
        from place_visit pv
       where pv.place_visit_cntry_cd = arg_CntryToCD
         and pv.place_visit_host_instn_nm is not null
       order by place_visit_host_instn_nm;
    ----
    OPEN rc_getCityVisit FOR
      select distinct Replace(Replace(pv.place_visit_city_nm, '''', '`'),
                              '"',
                              '``') as place_visit_city_nm
        from place_visit pv
       where pv.place_visit_cntry_cd = arg_CntryToCD
         and pv.place_visit_city_nm is not null
       order by place_visit_city_nm;
    ----
  End sp_getHSandCV;
  ---================================================================================
  procedure sp_UpdUserProfileByAuthAgent(arg_UP_Usr_ID                IN NUMBER,
                                         arg_UP_Usr_Prfx              in varchar2,
                                         arg_UP_Usr_FName             in varchar2,
                                         arg_UP_Usr_MI                in varchar2,
                                         arg_UP_Usr_LName             in varchar2,
                                         arg_UP_Usr_Phone             in varchar2,
                                         arg_UP_Usr_Ext               in varchar2,
                                         arg_UP_Usr_Email             in varchar2,
                                         arg_UP_Usr_UserName          in varchar2,
                                         arg_UP_Usr_Pass              in varchar2,
                                         arg_UP_Usr_Status_CD         in varchar2,
                                         arg_UP_Usr_AArchiveRole_ID   IN NUMBER,
                                         arg_UP_Usr_Est_Depart        IN varchar2,
                                         arg_UP_Usr_CntryOfAss_CD     in varchar2,
                                         arg_UP_Usr_CityPostOfAss_NM  in varchar2,
                                         arg_UP_NewPostCity           in varchar2,
                                         arg_UP_Usr_AddnlCountry      in varchar2,
                                         arg_UP_Usr_DOS_OfficeCode_CD in varchar2,
                                         arg_UP_NumOfLoops            in number)

   is
    vPosOfDelimiter number;
    vStrToCut       VARCHAR2(1000);
    vStrToIns       varchar2(2);
    vCityOfAss      VARCHAR2(100);
    vCounter        number;
  Begin

    ---- 0.
    -- 0.1. Create a record for the city that is not in table CITY

    If arg_UP_NewPostCity = 'NOCITY' Then

      vCityOfAss := arg_UP_Usr_CityPostOfAss_NM;

    Else

      vCityOfAss := Initcap(arg_UP_NewPostCity);
      select count(*)
        into vCounter
        from city
       where city_city_nm = vCityOfAss;

      If vCounter = 0 Then

        insert into city
          (city_cntry_cd, city_city_nm, city_is_cpl)
        values
          (arg_UP_Usr_CntryOfAss_CD, vCityOfAss, 'N');
        --
        commit;

      End If;

    End If;
    ---------------------------------------------------------------------------------------------

    --- 1. Upd table USR
    update usr
       set usr_pfx           = arg_UP_Usr_Prfx,
           usr_fname         = arg_UP_Usr_FName,
           usr_mi            = arg_UP_Usr_MI,
           usr_lname         = arg_UP_Usr_LName,
           usr_phone         = arg_UP_Usr_Phone,
           usr_ext           = arg_UP_Usr_Ext,
           usr_email         = arg_UP_Usr_Email,
           usr_uname         = arg_UP_Usr_UserName,
           usr_pass          = arg_UP_Usr_Pass,
           usr_role_cd       = arg_UP_Usr_AArchiveRole_ID,
           usr_est_depart_dt = TO_DATE(arg_UP_Usr_Est_Depart, 'mm/dd/yyyy')
     where usr_cd = arg_UP_Usr_ID;
    ---
    if arg_UP_Usr_Status_CD = 'A' then
      delete usr_comnt uc
       where uc.usr_comnt_usr_id = arg_UP_Usr_ID
         and uc.usr_comnt_comnt_type = 'CHG';
    end if;

    --- 2. Upd table USR_CNTRY
    ---- 2.1
    delete usr_cntry uc where uc.usr_cntry_usr_id = arg_UP_Usr_ID;
    ---
    commit;

    ---- 2.2
    insert into usr_cntry
      (usr_cntry_usr_id,
       usr_cntry_regn_cd,
       usr_cntry_cntry_cd,
       usr_cntry_city_post_nm,
       usr_cntry_is_prmry,
       usr_cntry_ofc_abbr)
    values
      (arg_UP_Usr_ID,
       f_getRegionCD(arg_UP_Usr_CntryOfAss_CD),
       arg_UP_Usr_CntryOfAss_CD,
       DECODE(vCityOfAss, '-1', NULL, vCityOfAss),
       'Y',
       DECODE(arg_UP_Usr_DOS_OfficeCode_CD,
              '-1',
              null,
              arg_UP_Usr_DOS_OfficeCode_CD));
    ---
    commit;
    ---

    ---- 2.3
    -- "-1" No dditional Country in this case DO NOT CREATE any record
    -- "XX" Code for some country , create 1 record with value "XX"
    -- "XX,YY" Codes for two countries, create 2 records with values "XX" and "YY"

    if arg_UP_Usr_AddnlCountry != '-1' then
      if arg_UP_NumOfLoops = 0 then
        -- Means one country selected
        insert into usr_cntry
          (usr_cntry_usr_id,
           usr_cntry_regn_cd,
           usr_cntry_cntry_cd,
           usr_cntry_city_post_nm,
           usr_cntry_is_prmry,
           usr_cntry_ofc_abbr)
        values
          (arg_UP_Usr_ID,
           DECODE(arg_UP_Usr_AddnlCountry,
                  '*',
                  'US',
                  f_getRegionCD(arg_UP_Usr_AddnlCountry)),
           arg_UP_Usr_AddnlCountry,
           null,
           'N',
           DECODE(arg_UP_Usr_DOS_OfficeCode_CD,
                  '-1',
                  null,
                  arg_UP_Usr_DOS_OfficeCode_CD));
      else
        -- means more then One country selected

        select arg_UP_Usr_AddnlCountry into vStrToCut from dual;
        ---
        FOR i IN 1 .. arg_UP_NumOfLoops LOOP
          ---
          select Instr(vStrToCut, ',', 1, 1)
            into vPosOfDelimiter
            from dual;
          ---
          If vPosOfDelimiter > 0 Then
            select Substr(vStrToCut, 1, (vPosOfDelimiter - 1))
              into vStrToIns
              from dual;
          Else
            vStrToIns := vStrToCut;
          End If;
          ---
          insert into usr_cntry
            (usr_cntry_usr_id,
             usr_cntry_regn_cd,
             usr_cntry_cntry_cd,
             usr_cntry_city_post_nm,
             usr_cntry_is_prmry,
             usr_cntry_ofc_abbr)
          values
            (arg_UP_Usr_ID,
             f_getRegionCD(vStrToIns),
             vStrToIns,
             null,
             'N',
             DECODE(arg_UP_Usr_DOS_OfficeCode_CD,
                    '-1',
                    null,
                    arg_UP_Usr_DOS_OfficeCode_CD));
          ---
          select Substr(vStrToCut, (vPosOfDelimiter + 1))
            into vStrToCut
            from dual;
          ---

        END LOOP;

        commit;
        ---
      end if;
    end if;

  End sp_UpdUserProfileByAuthAgent;
  ---================================================================================
  procedure sp_SelfUpdUsrProfile(arg_UP_Usr_ID       IN NUMBER,
                                 arg_UP_Usr_Prfx     in varchar2,
                                 arg_UP_Usr_FName    in varchar2,
                                 arg_UP_Usr_MI       in varchar2,
                                 arg_UP_Usr_LName    in varchar2,
                                 arg_UP_Usr_Phone    in varchar2,
                                 arg_UP_Usr_Ext      in varchar2,
                                 arg_UP_Usr_Email    in varchar2,
                                 arg_UP_Usr_UserName in varchar2,
                                 arg_UP_Usr_Pass     in varchar2,
                                 -----------------------------------
                                 arg_UP_Comments   in varchar2,
                                 arg_UP_ValReqChgs in varchar2) is
    vCounter NUMBER;
  Begin
    --- 1. Upd table USR
    update usr
       set usr_pfx   = arg_UP_Usr_Prfx,
           usr_fname = arg_UP_Usr_FName,
           usr_mi    = arg_UP_Usr_MI,
           usr_lname = arg_UP_Usr_LName,
           usr_phone = arg_UP_Usr_Phone,
           usr_ext   = arg_UP_Usr_Ext,
           usr_email = arg_UP_Usr_Email,
           usr_uname = arg_UP_Usr_UserName,
           usr_pass  = arg_UP_Usr_Pass
     where usr_cd = arg_UP_Usr_ID;
    ---
    commit;
    ---

    if arg_UP_Comments != '' then
      -----
      select Count(*)
        into vCounter
        from usr_comnt
       where usr_comnt_usr_id = arg_UP_Usr_ID
         and usr_comnt_comnt_type = 'NUR';
      -----
      if vCounter = 0 then

        insert into usr_comnt
          (usr_comnt_usr_id, usr_comnt_comnt_type, usr_comnt_comnt_txt)
        values
          (arg_UP_Usr_ID, 'NUR', arg_UP_Comments);

      else

        update usr_comnt
           set usr_comnt_comnt_txt = arg_UP_Comments
         where usr_comnt_usr_id = arg_UP_Usr_ID
           and usr_comnt_comnt_type = 'NUR';

      end if;
      ---
      commit;
      ---

    end if;

    ----
    If Length(arg_UP_ValReqChgs) > 1 Then

      -- 1
      delete usr_comnt
       where usr_comnt_usr_id = arg_UP_Usr_ID
         and usr_comnt_comnt_type = 'CHG';
      -- 2
      insert into usr_comnt
        (usr_comnt_usr_id, usr_comnt_comnt_type, usr_comnt_comnt_txt)
      values
        (arg_UP_Usr_ID, 'CHG', arg_UP_ValReqChgs);
      -- 3
      update usr set usr_is_act = 'H' where usr_cd = arg_UP_Usr_ID;
      ----
      commit;
      ----

    End If;

  End sp_SelfUpdUsrProfile;
  ---================================================================================
  procedure sp_Time_Watch(arg_Usr_ID in NUMBER, arg_Point IN varchar2) is
  Begin
    insert into time_watch
      (usr_id, point_desc, start_time)
    values
      (arg_Usr_ID, arg_Point, sysdate);
    commit;

  End sp_Time_Watch;

  ---================================================================================
  procedure sp_getTopicsToEdit( arg_TEPageID  IN NUMBER
                               ,arg_TETxtType IN VARCHAR2
                               ,rc_getTopicsToEdit OUT refc_Base)
  is
  Begin
       OPEN rc_getTopicsToEdit FOR
       select t.topic_id,
              --t.topic_security_tree_id,
              t.topic_navigation_cd,
              t.topic_title,
              t.topic_txt,
              t.topic_seq_on_page,
              t.topic_is_active,
              t.topic_exprtn_dt
       from topic t
       where t.topic_security_tree_id = arg_TEPageID
             and
             t.topic_navigation_cd = arg_TETxtType
       order by t.topic_seq_on_page;

  End sp_getTopicsToEdit;
  ---================================================================================
  procedure sp_TOPIC_DELETE(arg_TopicID IN NUMBER)
  is
  Begin

     delete topic
      where topic_id = arg_TopicID;
     commit;

  End sp_TOPIC_DELETE;
  ---================================================================================
  procedure sp_TOPIC_UPDATE(arg_TopicID IN NUMBER,
                            arg_topic_title IN VARCHAR2,
                            arg_topic_txt IN VARCHAR2,
                            arg_topic_seq_on_page IN NUMBER,
                            arg_topic_is_active IN VARCHAR2,
                            arg_topic_exprtn_dt IN VARCHAR2 ,
                            arg_Elmt_ID_Val IN VARCHAR2,-- format of arg_Elmt_ID_Val: 1,11;2,12;3,13;
                            arg_NumOfLoops IN NUMBER)
  is
  vPosOfComma NUMBER;
  vPosOfSemiCol NUMBER;
  vStrToIns_TOPIC_ID VARCHAR2(100);
  vStrToIns_SEQ_ON_PAGE VARCHAR2(100);
  vStrToCut VARCHAR2(1000);

  Begin
       update topic
          set topic_title = arg_topic_title,
              topic_txt = arg_topic_txt,
              topic_seq_on_page = arg_topic_seq_on_page,
              topic_is_active = arg_topic_is_active,
              topic_exprtn_dt = DECODE(arg_topic_exprtn_dt, '', null, TO_DATE(arg_topic_exprtn_dt, 'mm/dd/yyyy') )
          where topic_id = arg_TopicID;
        ---
        commit;
        ---
        select arg_Elmt_ID_Val
        into vStrToCut
        from dual;
        ---
        FOR i IN 1 .. arg_NumOfLoops LOOP
               --- '1,11;2,12;3,13;' ---
               -- 1. Determine comma position:
               select Instr(vStrToCut, ',', 1, 1)
                into vPosOfComma
                from dual;

               -- 2. Get TOPIC_ID:
               --If vPosOfComma > 0 Then
                select Substr(vStrToCut, 1, (vPosOfComma - 1))
                  into vStrToIns_TOPIC_ID
                  from dual;
               --End If;

               -- 3. Remove just determined TOPIC_ID from the string
               select Substr(vStrToCut, (vPosOfComma + 1))
                into vStrToCut
                from dual;

               -- 4. Determine semi-column position:
               select Instr(vStrToCut, ';', 1, 1)
                into vPosOfSemiCol
                from dual;

               -- 5.Get  TOPIC_SEQ_ON_PAGE:
               select Substr(vStrToCut, 1, (vPosOfSemiCol - 1))
                  into vStrToIns_SEQ_ON_PAGE
                  from dual;

               -- 6. Update record in tbl TOPIC:
               update topic
                  set topic_seq_on_page = TO_NUMBER(vStrToIns_SEQ_ON_PAGE)
                where topic_id = TO_NUMBER(vStrToIns_TOPIC_ID);
               ---
               commit;
               ---

               -- 7. Remove just determined TOPIC_SEQ_ON_PAGE from the string
               if i <= arg_NumOfLoops then
                  select Substr(vStrToCut, (vPosOfSemiCol + 1))
                  into vStrToCut
                  from dual;
               end if;

        END LOOP;

  End sp_TOPIC_UPDATE;
  ---================================================================================
  procedure sp_TOPIC_INSERT(arg_TopicID IN NUMBER,
                            arg_topic_security_tree_id IN NUMBER,
                            arg_topic_navigation_cd IN VARCHAR2,
                            arg_topic_title IN VARCHAR2,
                            arg_topic_txt IN VARCHAR2,
                            arg_topic_seq_on_page IN NUMBER,
                            arg_topic_is_active IN VARCHAR2,
                            arg_topic_exprtn_dt IN VARCHAR2 )
  is
  Begin
       -- 1.
       insert into topic
         (topic_id,
          topic_security_tree_id,
          topic_navigation_cd,
          topic_title,
          topic_txt,
          topic_seq_on_page,
          topic_is_active,
          topic_exprtn_dt)
       values
         (topic_seq.nextVal,
          arg_topic_security_tree_id,
          arg_topic_navigation_cd,
          arg_topic_title,
          arg_topic_txt,
          arg_topic_seq_on_page,
          Trim(arg_topic_is_active),
          DECODE(arg_topic_exprtn_dt, 'no_val', NULL, TO_DATE(arg_topic_exprtn_dt,'mm/dd/yyyy'))
          );
       -- 3.
       commit;
       ---
  End sp_TOPIC_INSERT;
  ---================================================================================

  procedure sp_getFilterCriteria (rc_sp_getFilterCriteria OUT refc_Base)
  is
  Begin
       OPEN rc_sp_getFilterCriteria FOR
       select item, item_cd, item_desc
       from code_lk
       where item = 'FILTER_CRITERIA'
       order by 2;

  End sp_getFilterCriteria;
    ---================================================================================
  procedure sp_checkDups (arg_AlmnID IN NUMBER,
                          rc_checkDups OUT refc_Base)
  is
  --vCounter NUMBER;
  Begin
       OPEN rc_checkDups FOR
       select Count(*) as dupsCounter
              -- a2.almn_id, a2.almn_last_nm, a2.almn_frst_nm, a2.almn_midl_nm, p.PGM_TYPE_CD, p.PGM_YR_DT, p.PGM_FY_DT
       from almn a1, almn a2, pgm p
       where ---
             a2.almn_id = p.pgm_almn_id
             and
             a1.almn_id = arg_AlmnID
             and
             (p.show_pgm_ind = 'Y' and a2.show_almn_ind = 'Y')
             ---
             and
             a2.almn_frst_nm = a1.almn_frst_nm
             and
             (
                SUBSTR(a2.almn_midl_nm,1,1) = SUBSTR(a1.almn_midl_nm,1,1)
                or
                a2.almn_midl_nm is null
             )
             and
             a2.almn_last_nm = a1.almn_last_nm
             and
             p.pgm_from_cntry_cd IN (select distinct p2.pgm_from_cntry_cd  from pgm p2 where p2.pgm_almn_id = arg_AlmnID);


  End sp_checkDups;
    ---================================================================================
  procedure sp_getRecordsToMerge(arg_Usr_CD IN NUMBER,
                                 arg_ListOfIDsToMerge IN VARCHAR2,
                                 arg_NumOfLoops IN NUMBER,
                                 rc_getRecordsToMerge OUT refc_Base)

  is
  --vListOfIDsToMerge VARCHAR2(100);
  vPosOfDelimiter NUMBER;
  vStrToIns VARCHAR2(100);
  vStrToCut VARCHAR2(1000);
  Begin
       --1:String is sent in the following format: '123,456,789,', following removes comma from the last position.
       select Substr(arg_ListOfIDsToMerge, 1, (Length(arg_ListOfIDsToMerge)-1) )
              into vStrToCut
       from dual;
       ---
       delete converter c where c.converter_id = arg_Usr_CD;
       commit;
       ---
       --2:
       FOR i IN 1 .. arg_NumOfLoops LOOP
           ---
          select Instr(vStrToCut, ',', 1, 1)
            into vPosOfDelimiter
            from dual;
          ---
          If vPosOfDelimiter > 0 Then
            select Substr(vStrToCut, 1, (vPosOfDelimiter - 1))
              into vStrToIns
              from dual;
          Else
            vStrToIns := vStrToCut;
          End If;
          ---
          insert into converter
            (converter_id, converter_val)
          values
            (arg_Usr_CD, TO_NUMBER(vStrToIns));
          commit;
          ---
          select Substr(vStrToCut, (vPosOfDelimiter + 1))
            into vStrToCut
            from dual;
          ---
       END LOOP;

       -- 3:
       OPEN rc_getRecordsToMerge FOR
       select ---
            a2.almn_id,
            NVL(a2.almn_pfx_dsc, '&nbsp;') as almn_pfx_dsc,
            NVL(a2.almn_last_nm, '&nbsp;') as almn_last_nm,
            NVL(a2.almn_last_nm2,'&nbsp;') as almn_last_nm2,
            NVL(a2.almn_frst_nm, '&nbsp;') as almn_frst_nm,
            NVL(a2.almn_midl_nm, '&nbsp;') as almn_midl_nm,
            decode(a2.almn_sfx_dsc, null, '&nbsp;',a2.almn_sfx_dsc) as almn_sfx_dsc,
            --NVL(a2.almn_sfx_dsc, '&nbsp;') as almn_sfx_dsc,
            ---
            NVL(a2.almn_sex_ind, '&nbsp;') as almn_sex_ind,
            NVL(TO_CHAR(a2.almn_dob_dt,'mm-dd-yyyy'),'&nbsp;') as almn_dob_dt,
            ---
            NVL(a2.almn_dcsd_ind,  '&nbsp;') as almn_dcsd_ind,
            NVL(a2.almn_dsabld_ind,'&nbsp;') as almn_dsabld_ind,
            ---
            NVL(a2.almn_ctznsp_cntry_cd,'&nbsp;') as almn_ctznsp_cntry_cd,
            DECODE (a2.almn_ctznsp_cntry_cd, null, '&nbsp;', f_getCntryNM(a2.almn_ctznsp_cntry_cd) ) as almn_ctznsp_cntry_nm,
            NVL(a2.almn_ctznsp_cntry_cd2,'&nbsp;') as almn_ctznsp_cntry_cd2,
            DECODE (a2.almn_ctznsp_cntry_cd2, null, '&nbsp;', f_getCntryNM(a2.almn_ctznsp_cntry_cd2) ) as almn_ctznsp_cntry_nm2,
            ---
            NVL(a2.almn_resdnc_adrs_txt,'&nbsp;') as almn_resdnc_adrs_txt,
            NVL(a2.almn_resdnc_city_nm,'&nbsp;') as almn_resdnc_city_nm,
            NVL(a2.almn_resdnc_state_prvnc_nm,'&nbsp;') as almn_resdnc_state_prvnc_nm,
            NVL(a2.almn_resdnc_cntry_cd,'&nbsp;') as almn_resdnc_cntry_cd,
            DECODE (a2.almn_resdnc_cntry_cd, null, '&nbsp;', f_getCntryNM(a2.almn_resdnc_cntry_cd) ) as almn_resdnc_cntry_nm,
            ---
            --a2.almn_legal_state_cd,
            --a2.almn_cngrtsnl_dstrct_num,
            ---
            NVL(a2.almn_bsns_adrs_txt,'&nbsp;') as almn_bsns_adrs_txt,
            NVL(a2.almn_bsns_city_nm,'&nbsp;') as almn_bsns_city_nm,
            NVL(a2.almn_bsns_state_prvnc_nm,'&nbsp;') as almn_bsns_state_prvnc_nm ,
            NVL(a2.almn_bsns_cntry_cd,'&nbsp;') as almn_bsns_cntry_cd,
            DECODE (a2.almn_bsns_cntry_cd, null, '&nbsp;', f_getCntryNM(a2.almn_resdnc_cntry_cd) ) as almn_bsns_cntry_nm,
            ---
            DECODE(a2.almn_prefrd_adrs_ind,'-1','&nbsp;',a2.almn_prefrd_adrs_ind) as almn_prefrd_adrs_ind,
            ---
            NVL(a2.almn_resdnc_phone_num,'&nbsp;') as almn_resdnc_phone_num,
            NVL(a2.almn_bsns_phone_num,'&nbsp;') as almn_bsns_phone_num,
            NVL(a2.almn_cell_num,'&nbsp;') as almn_cell_num,
            NVL(a2.almn_othr_phone_num,'&nbsp;') as almn_othr_phone_num,
            NVL(a2.almn_fax_num,'&nbsp;') as  almn_fax_num,
            ---
            DECODE(a2.almn_prefrd_phone_num_ind,null,'&nbsp;',a2.almn_prefrd_phone_num_ind) as almn_prefrd_phone_num_ind,
            --
            NVL(a2.almn_email1_txt,'&nbsp;') as almn_email1_txt,
            NVL(a2.almn_email2_txt,'&nbsp;') as almn_email2_txt,
            ---
            NVL(a2.almn_prefrd_email_ind,'&nbsp;') as almn_prefrd_email_ind,
            ---,
            NVL(a2.almn_cntct_ind,'&nbsp;') as almn_cntct_ind,
            ---
            NVL(TO_CHAR(a2.almn_elp_speak_fsi_level_num),'&nbsp;') as almn_elp_speak_fsi_level_num,
            NVL(TO_CHAR(a2.almn_elp_read_fsi_level_num), '&nbsp;') as almn_elp_read_fsi_level_num,
            NVL(TO_CHAR(a2.almn_elp_comp_fsi_level_num), '&nbsp;') as almn_elp_comp_fsi_level_num,
            ---
            NVL(a2.almn_notes_txt, '&nbsp;') as almn_notes_txt,
            ---
            --a2.almn_crtd_dt,
            --a2.almn_crtd_id,
            --a2.almn_updt_id,
            --a2.almn_updt_dt,
            ---
            ---original_almn_id,
            a2.pgm_src_nm as pgm_src_nm
            ---show_almn_ind,
            ---
            --a2.almn_bsns_nm,
            --a2.almn_bsns_postl_cd,
            --a2.almn_resdnc_postl_cd
            ---
     from almn a2 --almn a1, almn a2, pgm p
     where  a2.almn_id in (select converter_val from converter where converter_id = arg_Usr_CD);
     ---
     delete converter c where c.converter_id = arg_Usr_CD;
     commit;
     ---


  End sp_getRecordsToMerge;
  ---================================================================================
  procedure sp_moveOrgAlmnRecds (arg_AlmnID IN NUMBER)
  is
  Begin
       insert into almn_merged am
        select a2.*
        from almn a2
        where a2.almn_id IN (
                              select a2.almn_id
                              from almn a1, almn a2, pgm p
                              where a2.almn_id = p.pgm_almn_id
                                    and
                                    a1.almn_id = arg_AlmnID
                                    and
                                    (p.show_pgm_ind = 'Y' and a2.show_almn_ind = 'Y')
                                    ---
                                    and
                                    a2.almn_frst_nm = a1.almn_frst_nm
                                    and
                                    (
                                        SUBSTR(a2.almn_midl_nm,1,1) = SUBSTR(a1.almn_midl_nm,1,1)
                                        or
                                        a2.almn_midl_nm is null
                                    )
                                    and
                                    a2.almn_last_nm = a1.almn_last_nm
                                    and
                                    p.pgm_from_cntry_cd IN (select distinct p2.pgm_from_cntry_cd  from pgm p2 where p2.pgm_almn_id = arg_AlmnID)
                                    
                            );
       ---
       commit;
       ---
  End sp_moveOrgAlmnRecds;
  ---================================================================================
  procedure sp_createMergedRecd (
                                arg_Usr_CD IN NUMBER,
                                --
                                arg_AlmnID IN NUMBER,
                                arg_MRG_ALMN_ID IN NUMBER,
                                arg_ALMN_PFX_DSC IN VARCHAR2,
                                arg_ALMN_FRST_NM  IN VARCHAR2,
                                arg_ALMN_MIDL_NM  IN VARCHAR2,
                                arg_ALMN_LAST_NM  IN VARCHAR2,
                                arg_ALMN_LAST_NM2  IN VARCHAR2,
                                arg_ALMN_SFX_DSC  IN VARCHAR2,

                                --- inc_MergeDups_Sex_DOB.cfm:
                                arg_ALMN_SEX_IND  IN VARCHAR2,
                                arg_ALMN_DOB_DT  IN VARCHAR2,

                                --- inc_MergeDups_DCSD_DESBL.cfm:
                                arg_ALMN_DCSD_IND  IN VARCHAR2,
                                arg_ALMN_DSABLD_IND  IN VARCHAR2,

                                --- inc_MergeDups_CTZNSP.cfm:
                                --- CNTRY OF Citizenship
                                arg_ALMN_CTZNSP_CNTRY_CD IN VARCHAR2,
                                --- CNTRY OF Citizenship 2
                                arg_ALMN_CTZNSP_CNTRY_CD2 IN VARCHAR2,

                                --- inc_MergeDups_RES_ADDR.cfm:
                                arg_ALMN_RESDNC_ADRS_TXT IN VARCHAR2,
                                arg_ALMN_RESDNC_CITY_NM IN VARCHAR2,
                                arg_ALMN_RESDNC_STATE_PRVNC_NM IN VARCHAR2,
                                arg_ALMN_RESDNC_CNTRY_CD IN VARCHAR2,

                                --- inc_MergeDups_BUS_ADDR.cfm:
                                arg_ALMN_BSNS_ADRS_TXT IN VARCHAR2,
                                arg_ALMN_BSNS_CITY_NM IN VARCHAR2,
                                arg_ALMN_BSNS_STATE_PRVNC_NM IN VARCHAR2,
                                arg_ALMN_BSNS_CNTRY_CD IN VARCHAR2,

                                --- inc_MergeDups_PRFRD_ADDR.cfm:
                                arg_ALMN_PREFRD_ADRS_IND IN VARCHAR2,

                                --- inc_MergeDups_PHONE.cfm
                                arg_ALMN_RESDNC_PHONE_NUM IN VARCHAR2,
                                arg_ALMN_BSNS_PHONE_NUM IN VARCHAR2,
                                arg_ALMN_CELL_NUM IN VARCHAR2,
                                arg_ALMN_OTHR_PHONE_NUM IN VARCHAR2,

                                --- inc_MergeDups_FAX.cfm
                                arg_ALMN_FAX_NUM IN VARCHAR2,

                                --- inc_MergeDups_PRFRD_PHONE.cfm:
                                arg_ALMN_PREFRD_PHONE_NUM_IND IN VARCHAR2,

                                --- inc_MergeDups_EMAIL.cfm:
                                arg_ALMN_EMAIL1_TXT IN VARCHAR2,
                                arg_ALMN_EMAIL2_TXT IN VARCHAR2,

                                --- inc_MergeDups_PRFRD_EMAIL.cfm
                                arg_ALMN_PREFRD_EMAIL_IND IN VARCHAR2,

                                --- inc_MergeDups_CONTACT.cfm
                                arg_ALMN_CNTCT_IND IN VARCHAR2 ,

                                --- inc_MergeDups_ELP.cfm
                                arg_ALMN_ELP_SPEAK_FSI_NUM IN NUMBER,
                                arg_ALMN_ELP_READ_FSI_NUM IN NUMBER,
                                arg_ALMN_ELP_COMP_FSI_NUM IN NUMBER,

                                --- inc_MergeDups_COMMENTS.cfm
                                arg_ALMN_NOTES_TXT IN VARCHAR2
                                )
  is
  vListOfMergedRecds VARCHAR2(1000);
  Begin
  --- 1. ------------------------------------------------
  select a2.almn_id into vListOfMergedRecds
  from almn a1, almn a2, pgm p
       where ---
             a2.almn_id = p.pgm_almn_id
             and
             a1.almn_id = arg_AlmnID
             and
             (p.show_pgm_ind = 'Y' and a2.show_almn_ind = 'Y')
             ---
             and
             a2.almn_frst_nm = a1.almn_frst_nm
             and
             (
                SUBSTR(a2.almn_midl_nm,1,1) = SUBSTR(a1.almn_midl_nm,1,1)
                or
                a2.almn_midl_nm is null
             )
             and
             a2.almn_last_nm = a1.almn_last_nm
             and
             p.pgm_from_cntry_cd IN (select distinct p2.pgm_from_cntry_cd  from pgm p2 where p2.pgm_almn_id = arg_AlmnID);
  --- 2. -----------------------------------------------
  insert into almn
    (almn_id, almn_pfx_dsc, almn_last_nm, almn_last_nm2, almn_frst_nm, almn_midl_nm, almn_sfx_dsc,
     almn_sex_ind, almn_dob_dt, almn_dcsd_ind, almn_dsabld_ind, almn_ctznsp_cntry_cd, almn_ctznsp_cntry_cd2,
     almn_resdnc_adrs_txt, almn_resdnc_city_nm, almn_resdnc_state_prvnc_nm, almn_resdnc_cntry_cd,
     /*almn_legal_state_cd,*/ /*almn_cngrtsnl_dstrct_num,*/ almn_bsns_adrs_txt, almn_bsns_city_nm, almn_bsns_state_prvnc_nm,
     almn_bsns_cntry_cd, almn_prefrd_adrs_ind, almn_resdnc_phone_num, almn_bsns_phone_num, almn_cell_num, almn_othr_phone_num,
     almn_prefrd_phone_num_ind, almn_fax_num, almn_email1_txt, almn_email2_txt, almn_prefrd_email_ind,
     almn_cntct_ind,
     almn_elp_speak_fsi_level_num,
     almn_elp_read_fsi_level_num,
     almn_elp_comp_fsi_level_num,
     almn_notes_txt, almn_crtd_dt,
     almn_crtd_id, almn_updt_id, almn_updt_dt, original_almn_id, pgm_src_nm, show_almn_ind, almn_bsns_nm, almn_bsns_postl_cd, almn_resdnc_postl_cd)
  values
    (almn_seq.nextval,--v_almn_id,
     arg_ALMN_PFX_DSC, --v_almn_pfx_dsc,
     DECODE(Trim(arg_ALMN_LAST_NM),'', null, Trim(arg_ALMN_LAST_NM)) , --v_almn_last_nm,
     DECODE(Trim(arg_ALMN_LAST_NM2),'',null, Trim(arg_ALMN_LAST_NM2)) , --v_almn_last_nm2,
     DECODE(Trim(arg_ALMN_FRST_NM),'', null, Trim(arg_ALMN_FRST_NM)) , --v_almn_frst_nm,
     DECODE(Trim(arg_ALMN_MIDL_NM),'', null, Trim(arg_ALMN_MIDL_NM)) , --v_almn_midl_nm,
     DECODE(Trim(arg_ALMN_SFX_DSC),'', null, Trim(arg_ALMN_SFX_DSC)) ,

     --- inc_MergeDups_Sex_DOB.cfm:
     arg_ALMN_SEX_IND,
     DECODE(Trim(arg_ALMN_DOB_DT),'',null, TO_DATE(Trim(arg_ALMN_DOB_DT),'mm/dd/yyyy'))  ,-- v_almn_dob_dt,

     --- inc_MergeDups_DCSD_DESBL.cfm:
     DECODE(arg_ALMN_DCSD_IND,'-1','N',arg_ALMN_DCSD_IND),     -- v_almn_dcsd_ind,
     DECODE(arg_ALMN_DSABLD_IND,'-1','N', arg_ALMN_DSABLD_IND),-- v_almn_dsabld_ind,

     --- inc_MergeDups_CTZNSP.cfm:
     --- CNTRY OF Citizenship
     DECODE(arg_ALMN_CTZNSP_CNTRY_CD,'-1',null,arg_ALMN_CTZNSP_CNTRY_CD),-- v_almn_ctznsp_cntry_cd,
     --- CNTRY OF Citizenship 2
     DECODE(arg_ALMN_CTZNSP_CNTRY_CD2,'-1',null,arg_ALMN_CTZNSP_CNTRY_CD2),-- v_almn_ctznsp_cntry_cd2,

     --- inc_MergeDups_RES_ADDR.cfm:
     DECODE(Trim(arg_ALMN_RESDNC_ADRS_TXT),'',null,Trim(arg_ALMN_RESDNC_ADRS_TXT)), -- v_almn_resdnc_adrs_txt,
     DECODE(Trim(arg_ALMN_RESDNC_CITY_NM),'',null,Trim(arg_ALMN_RESDNC_CITY_NM)) ,-- v_almn_resdnc_city_nm,
     DECODE(Trim(arg_ALMN_RESDNC_STATE_PRVNC_NM),'',null,Trim(arg_ALMN_RESDNC_STATE_PRVNC_NM)) ,-- v_almn_resdnc_state_prvnc_nm,
     DECODE(arg_ALMN_RESDNC_CNTRY_CD,'-1',null,arg_ALMN_RESDNC_CNTRY_CD) ,-- v_almn_resdnc_cntry_cd,

      -- v_almn_legal_state_cd,
      -- v_almn_cngrtsnl_dstrct_num,

      --- inc_MergeDups_BUS_ADDR.cfm:
      DECODE(Trim(arg_ALMN_BSNS_ADRS_TXT),'',null,Trim(arg_ALMN_BSNS_ADRS_TXT)),-- v_almn_bsns_adrs_txt,
      DECODE(Trim(arg_ALMN_BSNS_CITY_NM),'',null,Trim(arg_ALMN_BSNS_CITY_NM))  ,-- v_almn_bsns_city_nm,
      DECODE(Trim(arg_ALMN_BSNS_STATE_PRVNC_NM),'',null,Trim(arg_ALMN_BSNS_STATE_PRVNC_NM)),-- v_almn_bsns_state_prvnc_nm,
      DECODE(arg_ALMN_BSNS_CNTRY_CD,'-1',null,arg_ALMN_BSNS_CNTRY_CD),-- v_almn_bsns_cntry_cd,

      --- inc_MergeDups_PRFRD_ADDR.cfm:
      arg_ALMN_PREFRD_ADRS_IND,-- v_almn_prefrd_adrs_ind,

      --- inc_MergeDups_PHONE.cfm
      DECODE(Trim(arg_ALMN_RESDNC_PHONE_NUM),'',null,Trim(arg_ALMN_RESDNC_PHONE_NUM)),-- v_almn_resdnc_phone_num,
      DECODE(Trim(arg_ALMN_BSNS_PHONE_NUM),'',null,Trim(arg_ALMN_BSNS_PHONE_NUM)),-- v_almn_bsns_phone_num,
      DECODE(Trim(arg_ALMN_CELL_NUM),'',null,Trim(arg_ALMN_CELL_NUM)),-- v_almn_cell_num,
      DECODE(Trim(arg_ALMN_OTHR_PHONE_NUM),'',null,Trim(arg_ALMN_OTHR_PHONE_NUM)),-- v_almn_othr_phone_num,

      --- inc_MergeDups_FAX.cfm
      DECODE(Trim(arg_ALMN_FAX_NUM),'',null,Trim(arg_ALMN_FAX_NUM)),-- v_almn_fax_num,

      --- inc_MergeDups_PRFRD_PHONE.cfm:
      arg_ALMN_PREFRD_PHONE_NUM_IND ,-- v_almn_prefrd_phone_num_ind,

      --- inc_MergeDups_EMAIL.cfm:
      arg_ALMN_EMAIL1_TXT,-- v_almn_email1_txt,
      arg_ALMN_EMAIL2_TXT,-- v_almn_email2_txt,

      --- inc_MergeDups_PRFRD_EMAIL.cfm
      arg_ALMN_PREFRD_EMAIL_IND,-- v_almn_prefrd_email_ind,

      --- inc_MergeDups_CONTACT.cfm
      arg_ALMN_CNTCT_IND,-- v_almn_cntct_ind,

      --- inc_MergeDups_ELP.cfm
      arg_ALMN_ELP_SPEAK_FSI_NUM,-- v_almn_elp_speak_fsi_level_num,
      arg_ALMN_ELP_READ_FSI_NUM,-- v_almn_elp_read_fsi_level_num,
      arg_ALMN_ELP_COMP_FSI_NUM,-- v_almn_elp_comp_fsi_level_num,

      --- inc_MergeDups_COMMENTS.cfm
      arg_ALMN_NOTES_TXT,-- v_almn_notes_txt,
     ---
      sysdate,-- v_almn_crtd_dt,
      arg_Usr_CD,-- v_almn_crtd_id,
      null,-- v_almn_updt_id,
      null,-- v_almn_updt_dt,
      0,-- v_original_almn_id,
      'MERGED ('||vListOfMergedRecds||')',-- v_pgm_src_nm,
      'Y',-- v_show_almn_ind,
      null,-- v_almn_bsns_nm,
      null,-- v_almn_bsns_postl_cd,
      null-- v_almn_resdnc_postl_cd

     );
     ---
     commit;
     ---
  End sp_createMergedRecd;
  ---================================================================================
  procedure sp_getPgmRecds (arg_AlmnID IN NUMBER,
                            rc_getPgmRecds OUT refc_Base,
                            rc_getAlmnName OUT refc_Base)
  is
  Begin
       --1:
       OPEN rc_getPgmRecds FOR
       select a2.almn_id                                                                           as almn_id,
              p.pgm_id                                                                             as pgm_id,
              p.pgm_type_cd                                                                        as pgm_type_cd,
              DECODE(p.pgm_type_cd,null,'no data', f_gerPgmName(p.pgm_type_cd))                    as pgm_nm,
              DECODE(p.pgm_fy_dt,'','no data', null,'no data', p.pgm_fy_dt)                        as pgm_fy_dt,
              DECODE(p.pgm_yr_dt,'','no data', null,'no data', p.pgm_yr_dt)                        as pgm_yr_dt,
              NVL(p.pgm_from_cntry_cd,'no data')                                                   as pgm_from_cntry_cd,
              DECODE(p.pgm_from_cntry_cd,null,'no data', f_getCntryNM(p.pgm_from_cntry_cd))        as pgm_from_cntry_nm,
              NVL(p.pgm_to_cntry_cd,'no data')                                                     as pgm_to_cntry_cd,
              DECODE(p.pgm_to_cntry_cd,null,'no data', f_getCntryNM(p.pgm_to_cntry_cd))            as pgm_to_cntry_nm,
              NVL(TO_CHAR(p.pgm_field_stdy_cd),'no data')                                          as pgm_field_stdy_cd,
              DECODE(p.pgm_field_stdy_cd,null,'no data', f_getFieldStdyNM(p.pgm_field_stdy_cd))    as pgm_field_stdy_nm,
              NVL(p.pgm_src_nm, 'no data')                                                         as pgm_src_nm

       from almn a1, almn a2, pgm p
       where ---
             a2.almn_id = p.pgm_almn_id
             and
             a1.almn_id = arg_AlmnID
             and
             (p.show_pgm_ind = 'Y' and a2.show_almn_ind = 'Y')
             ---
             and
             a2.almn_frst_nm = a1.almn_frst_nm
             and
             (
                SUBSTR(a2.almn_midl_nm,1,1) = SUBSTR(a1.almn_midl_nm,1,1)
                or
                a2.almn_midl_nm is null
             )
             and
             a2.almn_last_nm = a1.almn_last_nm
             and
             p.pgm_from_cntry_cd IN (select distinct p2.pgm_from_cntry_cd  from pgm p2 where p2.pgm_almn_id = arg_AlmnID);

       --2:
       OPEN rc_getAlmnName FOR
       select a2.almn_id as almn_id,
              NVL(a2.almn_pfx_dsc, '&nbsp;') as almn_pfx_dsc,
              NVL(a2.almn_last_nm, '&nbsp;') as almn_last_nm,
              NVL(a2.almn_last_nm2,'&nbsp;') as almn_last_nm2,
              NVL(a2.almn_frst_nm, '&nbsp;') as almn_frst_nm,
              NVL(a2.almn_midl_nm, '&nbsp;') as almn_midl_nm,
              decode(a2.almn_sfx_dsc, null, '&nbsp;',a2.almn_sfx_dsc) as almn_sfx_dsc
         from almn a2
         where a2.almn_id = arg_AlmnID;

  End sp_getPgmRecds;
  ---================================================================================
  ---================================================================================
  ---================================================================================



  ---================================================================================
  ---  FUNCTIONS
  ---================================================================================

  function f_getRegionCD(arg_Country_CD IN VARCHAR2) return VARCHAR2 is
    v_RtnVal VARCHAR2(3);
  Begin
    select cntry_regn_cd
      into v_RtnVal
      from cntry c
     where c.cntry_cntry_cd = arg_Country_CD;
    ---
    return(v_RtnVal);
    ---
  End f_getRegionCD;
  ---================================================================================
  function f_getRoleNM(arg_role_cd IN NUMBER) return VARCHAR2 is
    v_RtnVal VARCHAR2(500);
  Begin
    select app_role_nm
      into v_RtnVal
      from app_role
     where app_role_id = arg_role_cd;
    ---
    return v_RtnVal;
    ---

  End f_getRoleNM;
  ---================================================================================
  function f_getRegnNM(arg_RegnCD IN VARCHAR2) return VARCHAR2 is
    v_RtnVal VARCHAR2(100);
  Begin
    select r.regn_nm
      into v_RtnVal
      from regn r
     where r.regn_cd = arg_RegnCD;
    ---
    return v_RtnVal;
    ---

  End f_getRegnNM;
  ---================================================================================
  function f_getCntryNM(arg_CntryCD IN VARCHAR2) return VARCHAR2 is
    v_RtnVal VARCHAR2(100);
  Begin
    select c.cntry_cntry_nm
      into v_RtnVal
      from cntry c
     where c.cntry_cntry_cd = arg_CntryCD;
    ---
    return v_RtnVal;
    ---
  End f_getCntryNM;
  ---================================================================================
  function f_getStatNm(arg_Usr_Is_Act IN VARCHAR2) return VARCHAR2 is
    v_RtnVal VARCHAR2(50);
  Begin
    select c.item_desc
      into v_RtnVal
      from code_lk c
     where c.item = 'USRSTAT'
       and c.item_cd = arg_Usr_Is_Act;
    ---
    return v_RtnVal;
    ---
  End f_getStatNm;
  --=================================================================================
  function f_getComments(arg_GA_UsrID IN NUMBER, arg_Comm_Type IN VARCHAR2)
    return VARCHAR2 is
    v_RtnVal usr_comnt.usr_comnt_comnt_txt%TYPE;
    v_count  NUMBER;
  Begin

    select count(*)
      into v_count
      from usr_comnt u
     where u.usr_comnt_usr_id = arg_GA_UsrID
       and u.usr_comnt_comnt_type = arg_Comm_Type;

    If v_count > 0 Then
      select NVL(usr_comnt_comnt_txt, '')
        into v_RtnVal
        from usr_comnt u
       where u.usr_comnt_usr_id = arg_GA_UsrID
         and u.usr_comnt_comnt_type = arg_Comm_Type;
      ---
    Else
      v_RtnVal := '';
    End If;
    return v_RtnVal;
    ---
  End f_getComments;
  --=================================================================================
  function f_getCityVisited(arg_pgm_id  IN NUMBER,
                            arg_almn_id IN NUMBER,
                            arg_city    IN VARCHAR2,
                            arg_cntry   IN VARCHAR2) return VARCHAR2 is
    v_RtnVal VARCHAR2(500);

    CURSOR c_city is
      select place_visit_city_nm ||
             decode(place_visit_state_prvnc_nm,
                    null,
                    '',
                    ', ' || place_visit_state_prvnc_nm) as city_visited,
             '1' as orderby
        from place_visit
       where place_visit_pgm_id = arg_pgm_id
         and place_visit_almn_id = arg_almn_id
         and place_visit_cntry_cd in (arg_cntry)
         and UPPER(place_visit_city_nm) like UPPER('%' || arg_city || '%')
      UNION
      select place_visit_city_nm ||
             decode(place_visit_state_prvnc_nm,
                    null,
                    '',
                    ', ' || place_visit_state_prvnc_nm) as city_visited,
             '2' as orderby
        from place_visit
       where place_visit_pgm_id = arg_pgm_id
         and place_visit_almn_id = arg_almn_id
         and place_visit_cntry_cd in (arg_cntry)
         and place_visit_city_nm is not null
         and UPPER(place_visit_city_nm) not like
             UPPER('%' || arg_city || '%')
       order by orderby;

  Begin
    v_RtnVal := ' ';
    for v_city in c_city loop
      If v_RtnVal = ' ' Then
        v_RtnVal := v_city.city_visited;
      Else
        v_RtnVal := v_RtnVal || '; ' || v_city.city_visited;
      End If;
    end loop;

    return v_RtnVal;
    ---
  End f_getCityVisited;
  --=================================================================================
  function f_getCityVisited(arg_pgm_id IN NUMBER, arg_almn_id IN NUMBER)
    return VARCHAR2 IS
    v_RtnVal VARCHAR2(500);

    CURSOR c_city is
      select place_visit_city_nm ||
             decode(place_visit_state_prvnc_nm,
                    null,
                    '',
                    ', ' || place_visit_state_prvnc_nm) as city_visited
        from place_visit
       where place_visit_pgm_id = arg_pgm_id
         and place_visit_almn_id = arg_almn_id
         and place_visit_city_nm is not null;

  Begin
    v_RtnVal := ' ';
    for v_city in c_city loop
      If v_RtnVal = ' ' Then
        v_RtnVal := v_city.city_visited;
      Else
        v_RtnVal := v_RtnVal || '; ' || v_city.city_visited;
      End If;
    end loop;

    return v_RtnVal;
    ---
  End f_getCityVisited;

  --=================================================================================
  function f_getHostInst(arg_pgm_id  IN NUMBER,
                         arg_almn_id IN NUMBER,
                         arg_host    IN VARCHAR2,
                         arg_cntry   IN VARCHAR2) return VARCHAR2 is
    v_RtnVal VARCHAR2(500);
    CURSOR c_host is
      select place_visit_host_instn_nm, '1' as orderby
        from place_visit
       where place_visit_pgm_id = arg_pgm_id
         and place_visit_almn_id = arg_almn_id
         and place_visit_cntry_cd in (arg_cntry)
         and UPPER(place_visit_host_instn_nm) like
             UPPER('%' || arg_host || '%')
      UNION
      select place_visit_host_instn_nm, '2' as orderby
        from place_visit
       where place_visit_pgm_id = arg_pgm_id
         and place_visit_almn_id = arg_almn_id
         and place_visit_cntry_cd in (arg_cntry)
         and place_visit_host_instn_nm is not null
         and UPPER(place_visit_host_instn_nm) not like
             UPPER('%' || arg_host || '%')
       order by orderby;

  Begin
    v_RtnVal := ' ';
    for v_host in c_host loop
      If v_RtnVal = ' ' Then
        v_RtnVal := v_host.place_visit_host_instn_nm;
      Else
        v_RtnVal := v_RtnVal || '; ' || v_host.place_visit_host_instn_nm;
      End If;
    end loop;

    return v_RtnVal;
    ---
  End f_getHostInst;
  --=================================================================================
  function f_getHostInst(arg_pgm_id IN NUMBER, arg_almn_id IN NUMBER)
    return VARCHAR2 IS
    v_RtnVal VARCHAR2(500);
    CURSOR c_host is
      select place_visit_host_instn_nm
        from place_visit
       where place_visit_pgm_id = arg_pgm_id
         and place_visit_almn_id = arg_almn_id
         and place_visit_host_instn_nm is not null;

  Begin
    v_RtnVal := ' ';
    for v_host in c_host loop
      If v_RtnVal = ' ' Then
        v_RtnVal := v_host.place_visit_host_instn_nm;
      Else
        v_RtnVal := v_RtnVal || '; ' || v_host.place_visit_host_instn_nm;
      End If;
    end loop;

    return v_RtnVal;
    ---
  End f_getHostInst;

  --=================================================================================
  function f_getJobs(arg_almn_id IN NUMBER) return VARCHAR2 is
    v_RtnVal VARCHAR2(4000);
    CURSOR c_job is
      select job_crnt_ind,
             decode(job_crnt_ind,
                    'Y',
                    'Current:' || job_title_txt ||
                    decode(job_instn_nm, null, '', ', ' || job_instn_nm),
                    job_title_txt ||
                    decode(job_instn_nm, null, '', ', ' || job_instn_nm)) as job_instn
        from job
       where job_almn_id = arg_almn_id
       order by job_crnt_ind desc;

  Begin
    v_RtnVal := ' ';
    for v_job in c_job loop
      If v_RtnVal = ' ' Then
        v_RtnVal := v_job.job_instn;
      Else
        v_RtnVal := v_RtnVal || '; ' || v_job.job_instn;
      End If;
    end loop;

    return v_RtnVal;
    ---
  End f_getJobs;
  --=================================================================================
  function f_getInterests(arg_almn_id IN NUMBER) return VARCHAR2 is
    v_RtnVal VARCHAR2(4000);
    CURSOR c_Interest is
      select intrst_nm
        from almn_intrst, intrst
       where intrst.intrst_cd = almn_intrst.almn_intrst_cd
             and
             almn_intrst.almn_intrst_almn_id = arg_almn_id;
  Begin
    v_RtnVal := ' ';
    for v_Interest in c_Interest loop
      If v_RtnVal = ' ' Then
        v_RtnVal := v_Interest.intrst_nm;
      Else
        v_RtnVal := v_RtnVal || '; ' || v_Interest.intrst_nm;
      End If;
    end loop;

    return v_RtnVal;
    ---
  End f_getInterests;
  ---================================================================================
  /*
  function f_getVal(arg_ValType IN VARCHAR2,
                    arg_AlmnID IN NUMBER) return VARCHAR2
  is
  vRtnVal VARCHAR2
  Begin
       if arg_ValType = 'pfx' then
          select DECODE(almn_pfx_dsc, '', 'no_val', null,'no_val',almn_pfx_dsc) into vRtnVal
          from almn
          where almn_id = arg_AlmnID;


       elsif arg_ValType = 'fname' then
       elsif arg_ValType = 'lname' then

       end if;
       return vRtnVal;
  End f_getPfx;

  */
  ---================================================================================
  function f_gerPgmName(arg_pgm_id IN NUMBER) return VARCHAR2
  is
    v_RtnVal VARCHAR2(100);
  Begin
      select pt.pgm_type_nm into v_RtnVal
      from pgm_type pt
      where pt.pgm_type_cd = arg_pgm_id;
    ---
    return v_RtnVal;
    ---
  End f_gerPgmName;
  ---================================================================================
  function f_getFieldStdyNM(arg_pgm_field_stdy_cd IN NUMBER) return VARCHAR2
  is
    v_RtnVal VARCHAR2(100);
  Begin
      select fs.field_stdy_nm into v_RtnVal
      from field_stdy fs
      where fs.field_stdy_cd = arg_pgm_field_stdy_cd;
      ---
      return v_RtnVal;
      ---
  End f_getFieldStdyNM;
  ---================================================================================
  ---================================================================================
  ---================================================================================
  ---================================================================================
  ---================================================================================
  ---================================================================================
end PACK_ALUMNI_ARCHIVE;
/
