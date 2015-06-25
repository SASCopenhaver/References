<!--- inc_EditUsrAccs_p1.cfm --->
<script language="javascript" type="text/javascript">
function of_imageSwap(argImgSource, argUsrID){ with(self.document.forms[0])
{	//alert(argImgSource+"   "+argImgSource.substr(0, (argImgSource.length-6) )+argUsrID)
	//argImgSource is the name of the image file
	//document.images['imgName' (- this Img name in <img name="" property)  ].src = "Img/" + argImgSource - this is File Name;
	//document.images[argImgSource].src = "Img/" + argImgSource;
	document.images[argImgSource.substr(0, (argImgSource.length-6) )+argUsrID].src = "Img/" + argImgSource;
}}// enf of function of_imageSwap
</script>

<input type="hidden" name="h_showSelection"  value="">
<div class="feature">
<cfoutput>
<input type="hidden" name="h_GA_UsrID" value="#client.GA_UsrID#">
<input type="hidden" name="h_UsrNm#usr_cd#"   value="#spr_getGA_Usr.usr_full_nm#">

<br>
<br>
<br>
<br>

spr_getUP_Usr

usr_cd
           ,usr_pfx
           ,usr_fname
           ,usr_mi
           ,usr_lname
           ,NVL(usr_pfx,'')||' '||
             NVL(usr_fname,'')||' '||
             NVL(usr_mi,'')||' '||
             NVL(usr_lname,'') as usr_full_nm
           ,usr_phone
           ,usr_ext
           ,usr_email
           ,usr_uname
           ,usr_pass
           ,usr_role_cd
           ,usr_is_act
           ,f_getStatNm(usr_is_act) AS usr_status_nm
           ,usr_est_depart_dt
           ,usr_auth_agent_id 
           ,f_getComments(arg_GA_UsrID) as usr_comnt_comnt_txt


	<!--- <img src="Img/UserReg.jpg" alt="User Registration"> --->
<br>
<cfoutput>
	<!--- 
	<input type="hidden" name="h_showSelection"  value="#client.NUR_Usr_AddnlCountries_NM#">
	<input type="hidden" name="h_NUR_Usr_ID" value="#client.NUR_Usr_ID#">
	 --->
	<input type="hidden" name="h_showSelection"  value="##">
	<input type="text" name="h_UP_Usr_ID" value="#spr_getUP_Usr.usr_cd#">
	
<table width="95%" border="0" cellpadding="1" cellspacing="1">
	<!--- NAME --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="15%">PREFIX:</td>
					<td width="20%">FIRST NAME:</td>
					<td width="10%">MIDDLE INITIAL:</td>
					<td width="20%">LAST NAME:</td>
				</tr>
				<tr>
					<td><select name="ddlb_NUR_Usr_Prfx" class="forminputs"></select></td>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_FName" value="#client.NUR_Usr_FName#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_MI" value="#client.NUR_Usr_MI#" size="3"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_LName" value="#client.NUR_Usr_LName#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
	<!--- PHONE and E-MAIL --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="15%">PHONE:</td>
					<td width="20%">EXT:</td>
					<td width="30%">E-MAIL:</td>
				</tr>
				<tr>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_Phone" value="#client.NUR_Usr_Phone#" onKeyUp="f_IsNumber(this.value, this.name);"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_Ext" value="#client.NUR_Usr_Ext#" size="5"  onKeyUp="f_IsNumber(this.value, this.name);"
								onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					
					</td>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_Email" value="#client.NUR_Usr_Email#" size="30"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		
		</td>
	</tr>
	<!--- LOGIN INFORMATION --->
	 <tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="15%">LOGIN NAME:</td>
					<td width="50%">PASSWORD:</td>
				</tr>
				<tr>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_Usr_UserName" value="#client.NUR_Usr_UserName#"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
					<td>
						<input class="forminputs" type="password" name="txt_NUR_Usr_Pass" value="#client.NUR_Usr_Pass#"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!--- ROLES --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="60%">ROLE:</td>
					<td width="" id="id_FieldNm">DATE:</td>
				</tr>
				<tr>
					<td>
						<select name="ddlb_NUR_Usr_AlumniArchiveRole_ID" class="forminputs" onChange="f_onChangeAARole(this.value);"></select>
					</td>
					<td id="id_Cntrl">&nbsp;</td>
				</tr>
			</table>
		
		</td>
	</tr>
	<!--- COUNTRY OF ASSIGNMENT --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="25%">COUNTRY OF ASSIGNMENT:</td>
					<td width="20%">POST/CITY OF ASSIGNMENT:</td>
					<td width="30%">NEW POST/CITY:</td>
				</tr>
				<tr>
					<td>
						<select name="ddlb_NUR_Usr_CountryOfAssignmt_CD" class="forminputs" onChange="f_OnChangeCountry(this.value);"></select>
					</td>
					<td>
						<select name="ddlb_NUR_Usr_CityPostOfAssignmt_NM" class="forminputs"></select>
					</td>
					<td>
						<input class="forminputs" type="text" name="txt_NUR_NewPostCity" value="#client.NUR_Usr_NewCityPostOfAssignmt#" onBlur="f_DeSelectPostCity(this.value);"
							   onChange="javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);">
					</td>
				</tr>
			</table>
		
		</td>
	</tr>
	<!--- ADDITIONAL COUNTRIES / DOS OFFICE CODE --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr class="c_fieldName">
					<td width="25%">ADDITIONAL COUNTRIES:</td>
					<td width="30%" id="id_Title">&nbsp;</td>
					<td>DoS OFFICE CODE:</td>
				</tr>
				<tr>
					<td id="id_AddnlCntry" class="c_fieldValue">&nbsp;</td>
					<td id="id_ListOfAddnlCntry" width="25%" valign="top">&nbsp;</td>
					<td id="id_DosOffice" valign="top">&nbsp;</td>
				</tr>
			</table>

		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<!--- BUTTON --->
	<tr>
		<td>
			<table width="80%" border=0  bgcolor="##EFEFEF">
				<tr>
					<td align="center"><input type="button" value="Continue" class="c_formbuttons" onClick="JavaScript: f_Validate();"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
</cfoutput>
</div>

<!--- 

<br>
<br>
<br>
<br>


	<table align="center" width="95%"  border=0 cellpadding=2 cellspacing=2 >
		<!--- --------------------------------------- --->
		<cfinclude template="inc_GA_UsrBio.cfm">
		<!--- --------------------------------------- --->
		<!--- SPACER --->
		<tr><td><hr></td></tr>
		<!--- ALUMNI ARCHIVE ROLE --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%"><span class="c_fieldName">DOS Alumni Archive Role:</span></td>
						<td><select name="ddlb_GA_Usr_AlumniArchiveRole_ID" class="forminputs" onChange="f_onChangeAARole(this.value);"></select></td>
						<!--- <td>&nbsp;</td>  --->
					</tr>
				</table>
			</td>
		</tr>
		<!--- DEPARTURE DATE --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%"><span class="c_fieldName" id="id_DeptDT_FieldName">&nbsp;</span></td>
						<td><span id="id_DeptDT_FieldControl">&nbsp;</span></td>
					</tr>
				</table>
			</td>
		</tr>
		<!--- COUNTRY OF ASSIGNMENT --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%"><span class="c_fieldName">Country of Assignment:</span></td>
						<td>
							<select name="ddlb_GA_Usr_CountryOfAssignmt_CD" class="forminputs" onChange="f_OnChangeCountry(this.value);"></select>
							<!--- <select name="ddlb_GA_Usr_CountryOfAssignmt_CD" class="forminputs" onChange="f_OnChangeCountry(this.value);"></select> --->
						</td>
						<td><span id="id_DOS_OfficeCode">&nbsp;</span></td>
					</tr>
				</table>
			</td>
		</tr>
		<!--- CITY OF ASSIGNMENT --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%"><span class="c_fieldName">Post/City of Assignment:</span></td>
						<td>
							<select name="ddlb_GA_Usr_CityPostOfAssignmt" class="forminputs"></select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!--- SPACER --->
		<!--- <tr><td><hr></td></tr> --->
		<!--- ADDITIONAL COUNTRIES --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%" valign="top"><span id="id_AddnlCntryFieldName" class="c_fieldName">&nbsp;</span></td>
						<td valign="top"><span id="id_AddnlCntryCtrl">&nbsp;</span></td>
						<td valign="top"><span id="id_AddnlCntrySummary">&nbsp;</span></td>
					</tr>
				</table>
			</td>
		</tr>
		<!--- COMMENTS --->
		<tr>
			<td>
				<table border="0" width="100%">
					<tr>
						<td width="20%" valign="top"><span class="c_fieldName">Comments:</span></td>
						<td valign="top"><textarea name="txta_GA_Usr_Comments" rows="5" cols="45" class="forminputs"><cfoutput>#spr_getGA_Usr.usr_comnt_comnt_txt#</cfoutput></textarea></td>
					</tr>
				</table>
			</td>
		</tr>
		<!--- SPACER --->
		<tr><td><hr></td></tr>
		<!--- --------------------------------------- --->
		<!--- <cfinclude template="inc_GA_StatusAndButtons.cfm"> --->
		<!--- <cfoutput>#usr_cd#</cfoutput> --->
		<tr><td align="right">
		<table border="0" cellspacing="1" cellpadding="1">
		  <!--- RED ....................................................................................................... --->
		  <tr>
			<td>
				<a href="##" onMouseOver="JavaScript: of_imageSwap('DotRed_2.jpg', '#usr_cd#');" 
							 onMouseOut="JavaScript:  of_imageSwap('DotRed_1.jpg', '<cfoutput>#usr_cd#</cfoutput>');"
							 onClick="f_RemoveUsr('<cfoutput>#usr_cd#</cfoutput>');">
				<img alt="Deny" src="Img/DotRed_1.jpg" name="DotRed<cfoutput>#usr_cd#</cfoutput>" border=0 height="15" width="15"/>
				</a>
			</td>
			<td>
				<a href="##" onMouseOver="JavaScript: of_imageSwap('DotRed_2.jpg', '<cfoutput>#usr_cd#</cfoutput>');" 
							 onMouseOut="JavaScript:  of_imageSwap('DotRed_1.jpg', '<cfoutput>#usr_cd#</cfoutput>');"
							 onClick="f_RemoveUsr('<cfoutput>#usr_cd#</cfoutput>');">
				Deny
				</a>
			</td>
		  </tr>
		  <!--- YELLOW ....................................................................................................... --->
		  <tr>
			<td>
				<a href="##" onMouseOver="JavaScript: of_imageSwap('DotYel_2.jpg', '<cfoutput>#usr_cd#</cfoutput>');" 
							 onMouseOut="JavaScript:  of_imageSwap('DotYel_1.jpg', '<cfoutput>#usr_cd#</cfoutput>');"
							 onClick="f_putUsrOnHold('<cfoutput>#usr_cd#</cfoutput>');">
				<img alt="On Hold" src="Img/DotYel_1.jpg" name="DotYel<cfoutput>#usr_cd#</cfoutput>" border=0 height="15" width="15"/>
				</a>
			</td>
			<td>
				<a href="##" onMouseOver="JavaScript: of_imageSwap('DotYel_2.jpg', '<cfoutput>#usr_cd#</cfoutput>');" 
							 onMouseOut="JavaScript:  of_imageSwap('DotYel_1.jpg', '<cfoutput>#usr_cd#</cfoutput>');"
							 onClick="f_putUsrOnHold('<cfoutput>#usr_cd#</cfoutput>');">
				On Hold
				</a>
			</td>
		</tr>
		<!--- GREEN ....................................................................................................... --->
		<tr>
			<td>
				<a href="##" onMouseOver="JavaScript: of_imageSwap('DotGrn_2.jpg', '#usr_cd#');" 
							 onMouseOut="JavaScript:  of_imageSwap('DotGrn_1.jpg', '#usr_cd#');"
							 onClick="f_ApprvUsr('<cfoutput>#usr_cd#</cfoutput>');"><!--- onClick="f_ApprvUsr" --->
				<img alt="Approve" src="Img/DotGrn_1.jpg" name="DotGrn<cfoutput>#usr_cd#</cfoutput>" border=0 height="15" width="15"/>
				</a>
			</td>
			<td>
				<a href="##" onMouseOver="JavaScript: of_imageSwap('DotGrn_2.jpg', '<cfoutput>#usr_cd#</cfoutput>');" 
							 onMouseOut="JavaScript:  of_imageSwap('DotGrn_1.jpg', '<cfoutput>#usr_cd#</cfoutput>');"
							 onClick="f_ApprvUsr('<cfoutput>#usr_cd#</cfoutput>');">
				Approve
				</a>
			</td>
		  </tr>
	     <!--- ....................................................................................................... --->
		</table>

		</td></tr>
		 
		<!--- --------------------------------------- --->
		<!--- SPACER --->
		<!--- <tr><td><hr></td></tr> --->
		<!--- -------------- --->
	</table>
</cfoutput> --->
<br>
<br>
<br>
<br>

<script language="javascript" type="text/javascript">
//PREFIX
of_populateSelect( "ddlb_NUR_Usr_Prfx", "-1", "Select Prefix", rowsPrfx, "orgBfrPrfx", "aitem_cd", "aitem_cd", "2D" );
of_selectedInDDLB ("ddlb_NUR_Usr_Prfx", "<cfoutput>#client.NUR_Usr_Prfx#</cfoutput>");
self.document.forms[0].ddlb_NUR_Usr_Prfx.focus();
//
//
//---------------------------------------------------------------------------------------------------------------------
//
//---------------------------------------------------------------------------------------------------------------------
function f_showSelection(argCtrlName){with(self.document.forms[0])
{
	//alert(eval(argCtrlName+".value"))
	var vSelectedID = "";
	var vSelectedTxt = "";
	var vCountSelected = 0;
	var vOutput = "<table width=\"100%\"  border=0 cellspacing=0 cellpadding=0>";
	
	vOutput += "<tr>";
	vOutput += "<td bgcolor=\"#CCCCCC\">";
	vOutput += "<span class=\"c_fieldName\">Selected Countries</span>";
	vOutput += "</td>";
	vOutput += "</tr>";
	//........................................................................................
	for ( var e=0; e<eval(argCtrlName+".options.length"); e++ )
	{
		if ( eval(argCtrlName+".options["+e+"].selected"))
		{
			vCountSelected++;
		}
		if (vCountSelected >= 2)
		{
			break;
		}
	}
	//
	//if (vCountSelected >= 2)
	//{
		for ( var e=0; e<eval(argCtrlName+".options.length"); e++ )
		{
			if ( eval(argCtrlName+".options["+e+"].selected") )
			{
				vSelectedID = eval(argCtrlName+".options["+e+"].value");
				if ((vSelectedID == -1 || vSelectedID == "*") && vCountSelected > 1)
				{
					eval(argCtrlName+".options["+0+"].selected = false");
					eval(argCtrlName+".options["+1+"].selected = false");
					
				}
				else 
				{
					if (vSelectedID == "*")
					{
						vSelectedTxt += "All Countries;";
					}
					else
					{
						vSelectedTxt += eval(argCtrlName+".options["+e+"].text")+"; ";
					}
				}
			}
		}
		
	//}
	//else
	//{
		
	//}
	////////////////////////////////////////////////////
	//c_fieldValue
	vOutput += "<tr>";
	vOutput += "<td class=\"c_fieldValue\">";
	vOutput += vSelectedTxt;
	vOutput += "</td>";
	vOutput += "</tr>";
	//.........................................
	vOutput += "</table>";
	//
	h_showSelection.value = "";
	if (vSelectedTxt == "")
	{
		h_showSelection.value = "";
		vOutput = "";
	}
	else
	{
		h_showSelection.value = vSelectedTxt;
	}
	//alert(vSSOutput)
	//
	of_innerHTML("id_AddnlCntrySummary", "'"+vOutput+"'");

}}
//
//---------------------------------------------------------------------------------------------------------------------
//
//---------------------------------------------------------------------------------------------------------------------
function f_ShowHideAddnlCntry(argCountryCD){with(self.document.forms[0]){
	if (argCountryCD == "-1" || argCountryCD == "US")
	{
		of_innerHTML("id_AddnlCntryFieldName", "'&nbsp;'");
		of_innerHTML("id_AddnlCntryCtrl", "'&nbsp;'");
		of_innerHTML("id_AddnlCntrySummary", "'&nbsp;'");
	}
	else
	{
		of_innerHTML("id_AddnlCntryFieldName", "'<span class=\"c_fieldName\">Additional Country(ies)</span>'");
		of_innerHTML("id_AddnlCntryCtrl", "'"+" <select name=\"ddlbm_GA_Usr_AddnlCountry\" class=\"forminputs\" multiple size=5 onChange=\"f_showSelection(this.name);\"></select>  "+"'");
		of_populateSelect_ExrtraRow( "=== All Countries ===", "ddlbm_GA_Usr_AddnlCountry", "-1","No additional country" , rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
		of_innerHTML("id_AddnlCntrySummary", "'&nbsp;'");
	}
}}
//
//-------------------------------------------------------------------------------------------------------------------
function f_onChangeAARole(argValue){with(self.document.forms[0])
{//alert(argValue)
	switch (argValue)
	{
		//..............................................................................................
		case "306":
			of_innerHTML("id_DeptDT_FieldName", "'Estimated date of final departure from position'");
			of_innerHTML("id_DeptDT_FieldControl", "'"+"<input class=\"forminputs\" type=\"text\" name=\"txt_h_GA_Depart_Dt\" value=\"<cfoutput>#DateFormat(spr_getGA_Usr.usr_est_depart_dt,'mm/dd/yyyy')#</cfoutput>\">"+"'");// onChange=\"javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);\"
			
		break;
		//..............................................................................................
		case "242":
			of_innerHTML("id_DeptDT_FieldName", "'Estimated date of final departure from post'");
			of_innerHTML("id_DeptDT_FieldControl", "'"+"<input class=\"forminputs\" type=\"text\" name=\"txt_h_GA_Depart_Dt\" value=\"<cfoutput>#DateFormat(spr_getGA_Usr.usr_est_depart_dt,'mm/dd/yyyy')#</cfoutput>\">"+"'");// onChange=\"javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);\"
			
		break;
		//..............................................................................................
		default:
			of_innerHTML("id_DeptDT_FieldName", "'&nbsp;'");
			of_innerHTML("id_DeptDT_FieldControl", "'"+"<input class=\"forminputs\" type=\"hidden\" name=\"txt_h_GA_Depart_Dt\" value=\"<cfoutput>#spr_getGA_Usr.usr_est_depart_dt#</cfoutput>\">"+"'");// onChange=\"javascript:while(''+this.value.charAt(this.value.length-1)==' ')this.value=this.value.substring(0,this.value.length-1);while(''+this.value.charAt(0)==' ')this.value=this.value.substring(1,this.value.length);\"
	}
}}
//
//---------------------------------------------------------------------------------------------------------------------------------------
//
//---------------------------------------------------------------------------------------------------------------------
function f_show_DOS_OfficeCode (argCountryID){with(self.document.forms[0])
{//
	var vOutput = "";
	if ( argCountryID == "US" )
	{
		vOutput = "<select name=\"ddlb_GA_Usr_DOS_OfficeCode_CD\" class=\"forminputs\"></select>";
	}
	else
	{
		vOutput = "&nbsp;"
	}
	//
	of_innerHTML("id_DOS_OfficeCode", "'"+vOutput+"'");
	//
	if ( argCountryID == "US" )
	{
		of_populateSelect( "ddlb_GA_Usr_DOS_OfficeCode_CD", "-1", "=== Select Office Code ===", rowsDO, "orgBufferDO", "ausr_cntry_ofc_abbr", "ausr_cntry_ofc_abbr", "2D" );
		//
		for (var uc=0; uc<orgBfrUC.length; uc++)
		{
			if (orgBfrUC[uc].ausr_cntry_is_prmry == "Y")
			{
				of_selectedInDDLB ("ddlb_GA_Usr_DOS_OfficeCode_CD", orgBfrUC[uc].ausr_cntry_ofc_abbr);
				break;
			}
		}
	}
}}
//
//---------------------------------------------------------------------------------------------------------------------
//
//---------------------------------------------------------------------------------------------------------------------------------------
//ddlb_GA_Usr_CountryOfAssignmt_CD ddlb_GA_Usr_CityPostOfAssignmt

function f_OnChangeCountry(argCountryID){with(self.document.forms[0]){
	//alert(argCountryID)
	switch (argCountryID)
	{
		case "-1":
			of_populateSelect( "ddlb_GA_Usr_CityPostOfAssignmt", "-1", "=== All Posts/Cities ===", 0, "", "", "", "1D" );
			of_selectedInDDLB ("ddlb_GA_Usr_CityPostOfAssignmt", "-1");
			//
			f_ShowHideAddnlCntry(argCountryID);
			//
		break;
		case "US":
			// filter orgBfrCP:
			filterBfrCP =  new Array();
			var fcp = 0;
			for (var cp=0; cp<rowsCP; cp++)
			{
				if (argCountryID == orgBfrCP[cp].acity_cntry_cd)
				{
					filterBfrCP[fcp] = new arrayCP ( orgBfrCP[cp].acity_cntry_cd
													,orgBfrCP[cp].acity_city_nm
												   )
					fcp++;
				}
			}
			of_populateSelect( "ddlb_GA_Usr_CityPostOfAssignmt", "-1", "=== Select City ===", filterBfrCP.length, "filterBfrCP", "acity_city_nm", "acity_city_nm", "2D" );
			//
			f_ShowHideAddnlCntry(argCountryID);
			//
		break;
		default :
			// filter orgBfrCP:
			filterBfrCP =  new Array();
			var fcp = 0;
			for (var cp=0; cp<rowsCP; cp++)
			{
				if (argCountryID == orgBfrCP[cp].acity_cntry_cd)
				{
					filterBfrCP[fcp] = new arrayCP ( orgBfrCP[cp].acity_cntry_cd
													,orgBfrCP[cp].acity_city_nm
												   )
					fcp++;
				}
			}
			of_populateSelect( "ddlb_GA_Usr_CityPostOfAssignmt", "-1", "=== Select City ===", filterBfrCP.length, "filterBfrCP", "acity_city_nm", "acity_city_nm", "2D" );
			//
			f_ShowHideAddnlCntry(argCountryID);
			//
		//break;
	}
	// 
	f_show_DOS_OfficeCode(argCountryID);
	//
}}
//
//---------------------------------------------------------------------------------------------------------------------------------------

//
//---------------------------------------------------------------------------------------------------------------------------------------
//self.document.forms[0].ddlb_GA_Usr_Prfx.focus();
//
of_populateSelect( "ddlb_GA_Usr_Prfx", "-1", "=== Select Prefix ===", rowsPrfx, "orgBfrPrfx", "aitem_cd", "aitem_cd", "2D" );
of_selectedInDDLB ("ddlb_GA_Usr_Prfx", "<cfoutput>#spr_getGA_Usr.usr_pfx#</cfoutput>");
//alert("<cfoutput>#spr_getGA_Usr.usr_pfx#</cfoutput>")
//
of_populateSelect( "ddlb_GA_Usr_AlumniArchiveRole_ID", "-1", "=== Select Role ===", rowsAR, "orgBfrAR", "aapp_role_id", "aapp_role_nm", "2D" );
of_selectedInDDLB ("ddlb_GA_Usr_AlumniArchiveRole_ID", "<cfoutput>#spr_getGA_Usr.usr_role_cd#</cfoutput>"); 
//
f_onChangeAARole("<cfoutput>#spr_getGA_Usr.usr_role_cd#</cfoutput>");
//
//of_populateSelect( "ddlb_GA_Usr_Status", "-1", "=== Select Status ===", rowsUS, "orgBfrUS", "aitem_cd", "aitem_desc", "2D" );
//of_selectedInDDLB ("ddlb_GA_Usr_Status", "<cfoutput>#spr_getGA_Usr.usr_is_act#</cfoutput>"); 
//
of_populateSelect( "ddlb_GA_Usr_CountryOfAssignmt_CD", "-1", "=== Select Countries ===", rowsConCurr, "orgBfrConCurr", "acntry_cntry_cd", "acntry_cntry_nm", "2D" );
//of_populateSelect( "ddlb_GA_Usr_CityPostOfAssignmt", "-1", "=== Select City ===", orgBfrCP.length, "orgBfrCP", "acity_city_nm", "acity_city_nm", "2D" );
for (var uc=0; uc<orgBfrUC.length; uc++)
{
	if (orgBfrUC[uc].ausr_cntry_is_prmry == "Y")
	{
		of_selectedInDDLB ("ddlb_GA_Usr_CountryOfAssignmt_CD", orgBfrUC[uc].ausr_cntry_cntry_cd);
		f_OnChangeCountry(orgBfrUC[uc].ausr_cntry_cntry_cd);
		of_selectedInDDLB ("ddlb_GA_Usr_CityPostOfAssignmt", orgBfrUC[uc].ausr_cntry_city_post_nm);
		break;
	}
}
//
//---------------------------------------------------------------------------------------------------------------------------------------
for (var uc=0; uc<rowsUC; uc++)
{
	if (orgBfrUC[uc].ausr_cntry_is_prmry == "N")
	{
		of_selectedInDDLB("ddlbm_GA_Usr_AddnlCountry", orgBfrUC[uc].ausr_cntry_cntry_cd); 
		f_showSelection("ddlbm_GA_Usr_AddnlCountry");
	}
}
//
//-----------------------------------------------------------------------------------------------------------------------------------
//
</script>
<script language="javascript" type="text/javascript">
//
function f_RemoveUsr(argUsrID)
{
	if ( confirm("Do you want to delete "+eval("self.document.forms[0].h_UsrNm"+argUsrID+".value")+" record from the system?") )
	{
		//self.document.forms[0].h_GA_UsrID.value = argUsrID;
		of_CallFile("RemoveUsr");
	}
}
//
//----------------------------------------------------------------------------------------------------
function f_putUsrOnHold(argUsrID)//{with(self.document.forms[0]), argUsrNm
{
	if ( confirm("Do you want to set 'Inactive' status to "+eval("self.document.forms[0].h_UsrNm"+argUsrID+".value")+"?") )
	{
		//self.document.forms[0].h_GA_UsrID.value = argUsrID;
		of_CallFile("Upd_H");
	}
}
//
//-----------------------------------------------------------------------------------------------------
function f_ApprvUsr(argUsrID)
{//alert(argUsrID)
	if ( confirm("Do you want to allow "+eval("self.document.forms[0].h_UsrNm"+argUsrID+".value")+"to have an access to the system?") )
	{
		//self.document.forms[0].h_GA_UsrID.value = argUsrID;
		of_CallFile("Upd_A");
	}
}
//
//-----------------------------------------------------------------------------------------------------

</script>