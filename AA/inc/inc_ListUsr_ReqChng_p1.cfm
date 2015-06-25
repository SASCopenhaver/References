<!--- inc_ListUsr_ReqChng_p1.cfm --->
<script language="javascript" type="text/javascript">
function f_Action(argUsrID){with(self.document.forms[0])
{
	h_GA_UsrID.value = argUsrID;
	//
	h_UsrAddCntryCD.value = eval("h_UsrAddCntryCD"+argUsrID+".value");
	h_UsrAddCntryNM.value = eval("h_UsrAddCntryNM"+argUsrID+".value");
	//
	of_CallFile("UserProfile");
}}
//
</script>
<input type="hidden" name="h_ListType" value="402">
<input type="hidden" name="h_GA_UsrID" value="">

<input type="hidden" name="h_UsrAddCntryCD" value="">
<input type="hidden" name="h_UsrAddCntryNM" value="">

<input type="hidden" name="h_GA_UsrFullNm">
<input type="hidden" name="h_GA_UsrEMail">
<input type="hidden" name="h_GA_UsrRole">


<div class="story">
<cfwddx action="wddx2cfml" input="#client.sprWDDX_getAlphaSearch#" output="spr_getAlphaSearch">
<cfif #spr_getListOfUsers.recordCount# EQ 0>
	<h3>Sorry, there are no users in this category.</h3>
<cfelse>
		<!--- ------------------------------- --->
		<cfinclude template="inc_FilterUsrRecords.cfm">
		<!--- ------------------------------- --->
		<cfif #spr_getListOfUsers.recordCount# GT 5>
			<cfinclude template="inc_AlphaSearch.cfm">
		</cfif>
		<!--- ------------------------------- --->
		<table  width="100%"  border="0" bordercolor="Navy" cellspacing="1" cellpadding="1">
			<tr>
				<td valign="top" id="id_ListUsr"></td>
				<!--- <td width="9%" id="id_AccessCtrl"></td> --->
				<!--- <td width="9%"><cfinclude template="inc_AccsCtrl.cfm"></td> --->
			</tr>
		</table>
</cfif>
</div>
<script language="javascript" type="text/javascript">
//

function f_buildListUsrOutput(){with(self.document.forms[0])
{//fltrBfrL
	var vFilterCriteria = ddlb_FilterCriteria.value;
	var vListUsrOut = "";
	var vTemp = "";
	var vUsrCommentsNUR = "";
	var vUsrCommentsCHG = "";
	var vUsrComments = "";
	//
	//vListUsrOut += "<table width=\"100%\" border=\"1\" cellspacing=\"1\" cellpadding=\"1\">";
		
	for (var l=0; l<fltrBfrL.length; l++)
	{//alert(fltrBfrL[l].aUSR_FULL_NM)
			//
			var vTempUsrCD = "";
			if ( fltrBfrL[l].aUSR_CNTRY_IS_PRMRY == "Y" ){ vTempUsrCD = fltrBfrL[l].aUSR_CD; }
			//
				vListUsrOut += "<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\">";
						vListUsrOut += "<tr>";
							vListUsrOut += "<td>";
								//ListUsrOut += "1";
								/////////////////////////////////////////////////////////////////////////////////////
								vListUsrOut += "<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\">";
											//Row 1
											vListUsrOut += "<tr>";
													//
													vListUsrOut += "<td width=\"20%\" valign=\"top\">";
															vListUsrOut += "<input type=\"hidden\" name=\"h_UsrNm"+fltrBfrL[l].aUSR_CD+"\" value=\""+fltrBfrL[l].aUSR_FULL_NM+"\">";
															vListUsrOut += "<a href=\"##\" style=\"text-decoration:underline;\"  name=\""+fltrBfrL[l].aUSR_LNAME_ALPHA+"\" onClick=\"JavaScript: f_Action("+fltrBfrL[l].aUSR_CD+");\" >";
															vListUsrOut += fltrBfrL[l].aUSR_FULL_NM;
															vListUsrOut += "</a>";
													vListUsrOut += "</td>";
													//
													vTemp = fltrBfrL[l].aUSR_CNTRY_CITY_POST_NM;   if (fltrBfrL[l].aUSR_CNTRY_CITY_POST_NM == ""){ vTemp = "none"}
													vListUsrOut += "<td width=\"40%\">";
															vListUsrOut += "<span class=\"c_fieldName\">Country / Post-City of Assignment:</span>&nbsp;";
															vListUsrOut += "<span class=\"c_fieldValue\">"+fltrBfrL[l].aUSR_CNTRY_CNTRY_NM+" / "+vTemp+"</span>";
													vListUsrOut += "</td>";
													//
													vListUsrOut += "<td valign=\"top\">";
															vListUsrOut += "<input type=\"hidden\" name=\"h_UsrRole"+fltrBfrL[l].aUSR_CD+"\" value=\""+fltrBfrL[l].aUSR_CD+"\">";
															vListUsrOut += "<span class=\"c_fieldName\">Role:</span>&nbsp;";
															vListUsrOut += "<span class=\"c_fieldValue\">"+fltrBfrL[l].aUSR_ROLE_NM+"</span>";
													vListUsrOut += "</td>";
													//
											vListUsrOut += "</tr>";
											//
											//Row 2
											vListUsrOut += "<tr>";
													//
													vTemp = " /&nbsp;Ext."+fltrBfrL[l].aUSR_EXT; if (fltrBfrL[l].aUSR_EXT == "no_val"){ vTemp = ""; }
													vListUsrOut += "<td>";
															vListUsrOut += "<span class=\"c_fieldName\">Phone:</span>&nbsp;";
															vListUsrOut += "<span class=\"c_fieldValue\">"+fltrBfrL[l].aUSR_PHONE+"&nbsp;  "+vTemp+"</span>";
													vListUsrOut += "</td>";
													//
													vListUsrOut += "<td>";
															vListUsrOut += "<input type=\"hidden\" name=\"h_UsrEMail"+fltrBfrL[l].aUSR_CD+"\" value=\""+fltrBfrL[l].aUSR_EMAIL+"\">";
															vListUsrOut += "<span class=\"c_fieldName\">E-Mail:</span>&nbsp;";
															vListUsrOut += "<span class=\"c_fieldValue\">"+fltrBfrL[l].aUSR_EMAIL+"</span>";
													vListUsrOut += "</td>";
													//
													vListUsrOut += "<td>";
															vListUsrOut += "<span class=\"c_fieldName\">Status:</span>&nbsp;";
															vListUsrOut += "<span class=\"c_fieldValue\">"+fltrBfrL[l].aIS_ACT_NM+"</span>";
													vListUsrOut += "</td>";
													//
											vListUsrOut += "</tr>";
											//.................................................................................
											//Between dotted line, we have to prepare variable to be shown in the third row
											var vAddCntryTemp = "";
											var vAddCntry = "";
											var vAddCntryTempCD = "";
											var vAddCntryCD = "";
											//
											for (var i=0; i<fltrBfrL.length; i++)
											{
												if ( vTempUsrCD == fltrBfrL[i].aUSR_CD && fltrBfrL[i].aUSR_CNTRY_IS_PRMRY == "N" )
												{
													vAddCntryTemp = fltrBfrL[i].aUSR_CNTRY_CNTRY_NM;
													vAddCntry = vAddCntry + vAddCntryTemp + ", ";
													
													vAddCntryTempCD = fltrBfrL[i].aUSR_CNTRY_CNTRY_CD;
													vAddCntryCD = vAddCntryCD + vAddCntryTempCD + ", ";
												}
											}
											
											//
												 if ( vAddCntry == "" ) { vAddCntry = "No additional countries."; }
											else if ( vAddCntry == "*") { vAddCntry = "All countries."; }
											else { vAddCntry = vAddCntry.substr( 0, (parseInt(vAddCntry.length) - 2) ) }
											//.................................................................................
											//Row 3
											vListUsrOut += "<tr>";
													//
													vListUsrOut += "<td colspan=2>";
															//vListUsrOut += vAddCntryCD;
															vListUsrOut += "<span class=\"c_fieldName\">Additional Countries:</span>&nbsp;";
															vListUsrOut += "<span class=\"c_fieldValue\">"+vAddCntry+"</span>";
															
															vListUsrOut += "<input type=\"hidden\" name=\"h_UsrAddCntryCD"+vTempUsrCD+"\" value=\""+vAddCntryCD+"\">";
															vListUsrOut += "<input type=\"hidden\" name=\"h_UsrAddCntryNM"+vTempUsrCD+"\" value=\""+vAddCntry+"\">";
															
													vListUsrOut += "</td>";
													//
													vListUsrOut += "<td>";
															vTemp = fltrBfrL[l].aUSR_CNTRY_OFC_ABBR; if (vTemp == "no_val"){ vTemp = "n/a"; }
															vListUsrOut += "<span class=\"c_fieldName\">Office Code:</span>&nbsp;";
															vListUsrOut += "<span class=\"c_fieldValue\">"+vTemp+"</span>";
													vListUsrOut += "</td>";
													//
											vListUsrOut += "</tr>";
											//.................................................................................
											//The following is a prep for Row 4
											vUsrCommentsNUR = "";
											vUsrCommentsCHG = "";
											vUsrComments = "";
											//
											for (var c=0; c<rowsComm; c++)
											{
												if (orgBfrComm[c].aUSR_COMNT_USR_ID == vTempUsrCD)
												{
													//alert(orgBfrL[l].aUSR_FULL_NM+"   "+orgBfrComm[c].aUSR_COMNT_COMNT_TXT+"   "+orgBfrComm[c].aUSR_COMNT_REQCHG_TXT)
													if ( orgBfrComm[c].aUSR_COMNT_COMNT_TXT  != "no_val" ){ vUsrCommentsNUR = orgBfrComm[c].aUSR_COMNT_COMNT_TXT }
													//
													if ( orgBfrComm[c].aUSR_COMNT_REQCHG_TXT != "no_val" ){ vUsrCommentsCHG = orgBfrComm[c].aUSR_COMNT_REQCHG_TXT }
													//
													break;
												}
											}
											vUsrComments = vUsrCommentsNUR + vUsrCommentsCHG;
											if (vUsrComments == "" ){vUsrComments = "No Comments";}
											//if (vUsrCommentsNUR != ""){vUsrCommentsNUR = vUsrCommentsNUR;}
											//if (vUsrCommentsCHG != ""){vUsrCommentsCHG = vUsrCommentsCHG;}
											
											//.................................................................................
											// Row 4
											vListUsrOut += "<tr>";
													//
													vListUsrOut += "<td colspan=\"4\">";
															vListUsrOut += "<span class=\"c_fieldName\">Comments:</span>&nbsp;";
															vListUsrOut += "<span class=\"c_fieldValue\">"+vUsrComments+"</span>";
													vListUsrOut += "</td>";
													//
											vListUsrOut += "</tr>";
								vListUsrOut += "</table>";
								//.................................................................................
								/////////////////////////////////////////////////////////////////////////////////////
							vListUsrOut += "</td>";
							
							//========================================================================================
							vListUsrOut += "<td width=\"9%\">";
								//vListUsrOut += "2";
								vListUsrOut += "<table border=\"0\" cellspacing=\"1\" cellpadding=\"1\">";
									 	  // RED ......................................................................................................
										  vListUsrOut += "<tr>";
												vListUsrOut += "<td>";
													
													vListUsrOut += "<a href=\"##\" onMouseOver=\"JavaScript: of_imageSwap(2, "+fltrBfrL[l].aUSR_CD+");\""; 
													vListUsrOut += "onMouseOut=\"JavaScript:  of_imageSwap(1, "+fltrBfrL[l].aUSR_CD+");\"";
													vListUsrOut += "onClick=\"f_RemoveUsr("+fltrBfrL[l].aUSR_CD+");\"";
													vListUsrOut += ">";
													vListUsrOut += "<img alt=\"Deny\" src=\"Img/DotRed_1.jpg\" name=\"DotRed"+fltrBfrL[l].aUSR_CD+"\" border=\"0\" height=\"15\" width=\"15\"/>";
													vListUsrOut += "</a>";
												vListUsrOut += "</td>";
												vListUsrOut += "<td>";
													vListUsrOut += "<a href=\"##\" onMouseOver=\"JavaScript: of_imageSwap(2, "+fltrBfrL[l].aUSR_CD+");\" ";
													vListUsrOut += "onMouseOut=\"JavaScript:  of_imageSwap(1, "+fltrBfrL[l].aUSR_CD+");\"";
													vListUsrOut += "onClick=\"f_RemoveUsr("+fltrBfrL[l].aUSR_CD+");\""
													vListUsrOut += ">";
													vListUsrOut += "Deny"
													vListUsrOut += "</a>";
												vListUsrOut += "</td>";
										  vListUsrOut += "</tr>";
										  // RED ......................................................................................................
										  // YELLOW ......................................................................................................
											
											if ("<cfoutput>#client.CallPageID#</cfoutput>" == "402")
											{
													vListUsrOut += "<tr>";
														vListUsrOut += "<td><img alt=\"On Hold\" src=\"Img/DotYel_3.jpg\" name=\"DotYel"+fltrBfrL[l].aUSR_CD+"\" border=\"0\" height=\"15\" width=\"15\"/></td>";
														vListUsrOut += "<td><font color=\"#999999\">On Hold</font></td>";
													vListUsrOut += "</tr>";
											}
											else if ("<cfoutput>#client.CallPageID#</cfoutput>" != "402")
											{
												if ( "<cfoutput>#client.CallPageID#</cfoutput>" == "401" && fltrBfrL[l].aUSR_IS_ACT == "W")
												{
													vListUsrOut += "<tr>";
														vListUsrOut += "<td><img alt=\"On Hold\" src=\"Img/DotYel_3.jpg\" name=\"DotYel"+fltrBfrL[l].aUSR_CD+"\" border=\"0\" height=\"15\" width=\"15\"/></td>";
														vListUsrOut += "<td><font color=\"#999999\">On Hold</font></td>";
													vListUsrOut += "<tr>";
												}
												else 
												{
													vListUsrOut += "<tr>";
														vListUsrOut += "<td>";
															vListUsrOut += "<a href=\"##\" onMouseOver=\"JavaScript: of_imageSwap(4, "+fltrBfrL[l].aUSR_CD+");\"";
															vListUsrOut += "onMouseOut=\"JavaScript:  of_imageSwap(3, "+fltrBfrL[l].aUSR_CD+");\"";
															vListUsrOut += "onClick=\"f_putUsrOnHold("+fltrBfrL[l].aUSR_CD+");\">";
															vListUsrOut += "<img alt=\"On Hold\" src=\"Img/DotYel_1.jpg\" name=\"DotYel"+fltrBfrL[l].aUSR_CD+"\" border=\"0\" height=\"15\" width=\"15\"/>";
															vListUsrOut += "</a>";
														vListUsrOut += "</td>";
														
														vListUsrOut += "<td>";
															vListUsrOut += "<a href=\"##\" onMouseOver=\"JavaScript: of_imageSwap(4, "+fltrBfrL[l].aUSR_CD+");\" ";
															vListUsrOut += "onMouseOut=\"JavaScript:  of_imageSwap(3, "+fltrBfrL[l].aUSR_CD+");\"";
															vListUsrOut += "onClick=\"f_putUsrOnHold("+fltrBfrL[l].aUSR_CD+");\">";
															vListUsrOut += "On Hold";
															vListUsrOut += "</a>";
														vListUsrOut += "</td>";
													vListUsrOut += "</tr>";
												}
											}
											
									  	  // YELLOW .....................................................................................................
										  // GREEN ......................................................................................................
										  if ("<cfoutput>#client.CallPageID#</cfoutput>" == "403")
										  {
										  		vListUsrOut += "<tr>";
													vListUsrOut += "<td><img alt=\"Approve\" src=\"Img/DotGrn_3.jpg\" name=\"DotGrn "+fltrBfrL[l].aUSR_CD+"\" border=\"0\" height=\"15\" width=\"15\"/></td>";
													vListUsrOut += "<td><font color=\"#999999\">Approve</font></td>";
												vListUsrOut += "</tr>";
										  }
										  else
										  {
										  		vListUsrOut += "<tr>";
													vListUsrOut += "<td>";
														vListUsrOut += "<a href=\"##\" onMouseOver=\"JavaScript: of_imageSwap(6, "+fltrBfrL[l].aUSR_CD+");\" ";
														vListUsrOut += " onMouseOut=\"JavaScript:  of_imageSwap(5, "+fltrBfrL[l].aUSR_CD+");\"";
														vListUsrOut += " onClick=\"f_ApprvUsr("+fltrBfrL[l].aUSR_CD+");\">";
														vListUsrOut += "<img alt=\"Approve\" src=\"Img/DotGrn_1.jpg\" name=\"DotGrn"+fltrBfrL[l].aUSR_CD+"\" border=\"0\" height=\"15\" width=\"15\"/>";
														vListUsrOut += "</a>";
													vListUsrOut += "</td>";
													
													vListUsrOut += "<td>";
														vListUsrOut += "<a href=\"##\" onMouseOver=\"JavaScript: of_imageSwap(6, "+fltrBfrL[l].aUSR_CD+");\" ";
														vListUsrOut += "onMouseOut=\"JavaScript:  of_imageSwap(5, "+fltrBfrL[l].aUSR_CD+");\"";
														vListUsrOut += "onClick=\"f_ApprvUsr("+fltrBfrL[l].aUSR_CD+");\">";
														vListUsrOut += "Approve";
														vListUsrOut += "</a>";
													vListUsrOut += "</td>";
												vListUsrOut += "</tr>";
										  }
										 
										  // GREEN ......................................................................................................
										  
								vListUsrOut += "</table>";
							vListUsrOut += "</td>";
							//========================================================================================
							
						vListUsrOut += "</tr>";
						//
						vListUsrOut += "<tr><td colspan=\"2\"><hr></td></tr>";
						//
				vListUsrOut += "</table>";
						
			//
	}//end of loop
	//vListUsrOut += "</table>";
	//alert(vListUsrOut)
	of_innerHTML("id_ListUsr",  "'"+vListUsrOut+"'");
	//
}}
//
//---------------------------------------------------------------------------------------------------

function of_imageSwap(argImgSource, argUsrID){ with(self.document.forms[0])
{	
	var vImgSource = "";
	switch (argImgSource)
	{
		case 1:
			vImgSource = "DotRed_1.jpg";
		break;
		//
		case 2:
			vImgSource = "DotRed_2.jpg";
		break;
		//
		case 3:
			vImgSource = "DotYel_1.jpg";
		break;
		//
		case 4:
			vImgSource = "DotYel_2.jpg";
		break;
		//
		case 5:
			vImgSource = "DotGrn_1.jpg";
		break;
		//
		case 6:
			vImgSource = "DotGrn_2.jpg";
		break;
	}

	//alert(argImgSource+"   "+argImgSource.substr(0, (argImgSource.length-6) )+argUsrID)
	//argImgSource is the name of the image file
	//document.images['imgName' (- this Img name in <img name="" property)  ].src = "Img/" + argImgSource - this is File Name;
	//document.images[argImgSource].src = "Img/" + argImgSource;
	document.images[vImgSource.substr(0, (vImgSource.length-6) )+argUsrID].src = "Img/" + vImgSource;
}}// enf of function of_imageSwap

//
//----------------------------------------------------------------------------------------------------
function f_RemoveUsr(argUsrID){with(self.document.forms[0])
{
	if ( confirm("Do you want to delete "+eval("self.document.forms[0].h_UsrNm"+argUsrID+".value")+" record from the system?") )
	{
		h_GA_UsrID.value = argUsrID;
		h_GA_UsrFullNm.value = eval("self.document.forms[0].h_UsrNm"+argUsrID+".value");
		h_GA_UsrEMail.value  = eval("self.document.forms[0].h_UsrEMail"+argUsrID+".value");
		h_GA_UsrRole.value   = eval("self.document.forms[0].h_UsrRole"+argUsrID+".value");
		//
		of_CallFile("RemoveUsr");
	}
	
}}
//
//----------------------------------------------------------------------------------------------------
function f_putUsrOnHold(argUsrID){with(self.document.forms[0])
{
	if ( confirm("Do you want to set 'On Hold' status to "+eval("self.document.forms[0].h_UsrNm"+argUsrID+".value")+"?") )
	{
		h_GA_UsrID.value = argUsrID;
		h_GA_UsrFullNm.value = eval("self.document.forms[0].h_UsrNm"+argUsrID+".value");
		h_GA_UsrEMail.value  = eval("self.document.forms[0].h_UsrEMail"+argUsrID+".value");
		h_GA_UsrRole.value   = eval("self.document.forms[0].h_UsrRole"+argUsrID+".value");
		//
		of_CallFile("putUsrOnHold");
	}
}}
//
//-----------------------------------------------------------------------------------------------------
function f_ApprvUsr(argUsrID){with(self.document.forms[0])
{
	if ( confirm("Do you want to allow "+eval("self.document.forms[0].h_UsrNm"+argUsrID+".value")+" to have an access to the system?") )
	{
		h_GA_UsrID.value = argUsrID;
		h_GA_UsrFullNm.value = eval("self.document.forms[0].h_UsrNm"+argUsrID+".value");
		h_GA_UsrEMail.value  = eval("self.document.forms[0].h_UsrEMail"+argUsrID+".value");
		h_GA_UsrRole.value   = eval("self.document.forms[0].h_UsrRole"+argUsrID+".value");
		
		//alert(h_GA_UsrID.value+"  "+h_GA_UsrFullNm.value+"  "+h_GA_UsrEMail.value+"  "+h_GA_UsrRole.value)
		of_CallFile("ApprvUsr");
	}
}}
//
//-----------------------------------------------------------------------------------------------------

function f_prepBfrListUsrOutput(argFilterCriteria){with(self.document.forms[0])
{//this function prepares filtered buffer for further output.  it is filtered based on the value in argFilterCriteria
//Actual output happends in function f_buildListUsrOutput
	//alert(orgBfrL.length)
	fltrBfrL = new Array();
	var f = 0;
	
	switch (argFilterCriteria)
	{
		//
		case "-1", "ALL": 
			for (var l=0; l<rowsL; l++)
			{
				fltrBfrL[f] = new arrayL(
										  orgBfrL[l].aUSR_CD, orgBfrL[l].aUSR_LNAME_ALPHA, orgBfrL[l].aUSR_FULL_NM, orgBfrL[l].aUSR_PHONE, orgBfrL[l].aUSR_EXT, orgBfrL[l].aUSR_EMAIL, 
										  orgBfrL[l].aUSR_ROLE_CD, orgBfrL[l].aUSR_ROLE_NM, orgBfrL[l].aUSR_IS_ACT, orgBfrL[l].aIS_ACT_NM, orgBfrL[l].aUSR_CNTRY_CNTRY_CD, 
										  orgBfrL[l].aUSR_CNTRY_CNTRY_NM, orgBfrL[l].aUSR_CNTRY_CITY_POST_NM, orgBfrL[l].aUSR_CNTRY_IS_PRMRY, orgBfrL[l].aUSR_CNTRY_OFC_ABBR
							  			 )
				f++;
			}
		break;
		//
		case "CNTRY":
			for (var l=0; l<rowsL; l++)
			{
				if (ddlb_Cntry.options[ddlb_Cntry.options.selectedIndex].value == orgBfrL[l].aUSR_CNTRY_CNTRY_CD)
				{
					fltrBfrL[f] = new arrayL(
											 orgBfrL[l].aUSR_CD, orgBfrL[l].aUSR_LNAME_ALPHA, orgBfrL[l].aUSR_FULL_NM, orgBfrL[l].aUSR_PHONE, orgBfrL[l].aUSR_EXT, orgBfrL[l].aUSR_EMAIL, 
										  	 orgBfrL[l].aUSR_ROLE_CD, orgBfrL[l].aUSR_ROLE_NM, orgBfrL[l].aUSR_IS_ACT, orgBfrL[l].aIS_ACT_NM, orgBfrL[l].aUSR_CNTRY_CNTRY_CD, 
										     orgBfrL[l].aUSR_CNTRY_CNTRY_NM, orgBfrL[l].aUSR_CNTRY_CITY_POST_NM, orgBfrL[l].aUSR_CNTRY_IS_PRMRY, orgBfrL[l].aUSR_CNTRY_OFC_ABBR
							  			     )
								f++;
				}
			}
		break;
		//
		case "OFFICE_CD":
			for (var l=0; l<rowsL; l++)
			{
				
				if (ddlb_Office.options[ddlb_Office.options.selectedIndex].value == orgBfrL[l].aUSR_CNTRY_OFC_ABBR)
				{//alert(ddlb_Office.options[ddlb_Office.options.selectedIndex].value +"   "+orgBfrL[l].aUSR_CNTRY_OFC_ABBR)
					fltrBfrL[f] = new arrayL(
											  orgBfrL[l].aUSR_CD, orgBfrL[l].aUSR_LNAME_ALPHA, orgBfrL[l].aUSR_FULL_NM, orgBfrL[l].aUSR_PHONE, orgBfrL[l].aUSR_EXT, orgBfrL[l].aUSR_EMAIL, 
										  	  orgBfrL[l].aUSR_ROLE_CD, orgBfrL[l].aUSR_ROLE_NM, orgBfrL[l].aUSR_IS_ACT, orgBfrL[l].aIS_ACT_NM, orgBfrL[l].aUSR_CNTRY_CNTRY_CD, 
										      orgBfrL[l].aUSR_CNTRY_CNTRY_NM, orgBfrL[l].aUSR_CNTRY_CITY_POST_NM, orgBfrL[l].aUSR_CNTRY_IS_PRMRY, orgBfrL[l].aUSR_CNTRY_OFC_ABBR
							  			     )
								f++;
				}
			}
		break;
		//
		case "POST":
			for (var l=0; l<rowsL; l++)
			{
				if (ddlb_Post.options[ddlb_Post.options.selectedIndex].value == orgBfrL[l].aUSR_CNTRY_CITY_POST_NM)
				{
					fltrBfrL[f] = new arrayL(
											  orgBfrL[l].aUSR_CD, orgBfrL[l].aUSR_LNAME_ALPHA, orgBfrL[l].aUSR_FULL_NM, orgBfrL[l].aUSR_PHONE, orgBfrL[l].aUSR_EXT, orgBfrL[l].aUSR_EMAIL, 
										  	  orgBfrL[l].aUSR_ROLE_CD, orgBfrL[l].aUSR_ROLE_NM, orgBfrL[l].aUSR_IS_ACT, orgBfrL[l].aIS_ACT_NM, orgBfrL[l].aUSR_CNTRY_CNTRY_CD, 
										      orgBfrL[l].aUSR_CNTRY_CNTRY_NM, orgBfrL[l].aUSR_CNTRY_CITY_POST_NM, orgBfrL[l].aUSR_CNTRY_IS_PRMRY, orgBfrL[l].aUSR_CNTRY_OFC_ABBR
							  			     )
								f++;
				}
			}
		break;
		//
		case "ROLE":
			for (var l=0; l<rowsL; l++)
			{
				
				if (ddlb_Role.options[ddlb_Role.options.selectedIndex].value == orgBfrL[l].aUSR_ROLE_CD)
				{
					fltrBfrL[f] = new arrayL(
											  orgBfrL[l].aUSR_CD, orgBfrL[l].aUSR_LNAME_ALPHA, orgBfrL[l].aUSR_FULL_NM, orgBfrL[l].aUSR_PHONE, orgBfrL[l].aUSR_EXT, orgBfrL[l].aUSR_EMAIL, 
										  	  orgBfrL[l].aUSR_ROLE_CD, orgBfrL[l].aUSR_ROLE_NM, orgBfrL[l].aUSR_IS_ACT, orgBfrL[l].aIS_ACT_NM, orgBfrL[l].aUSR_CNTRY_CNTRY_CD, 
										      orgBfrL[l].aUSR_CNTRY_CNTRY_NM, orgBfrL[l].aUSR_CNTRY_CITY_POST_NM, orgBfrL[l].aUSR_CNTRY_IS_PRMRY, orgBfrL[l].aUSR_CNTRY_OFC_ABBR
							  			     )
								f++;
				}
			}
		break;
		//
		
	}
	
}}
//
//-----------------------------------------------------------------------------------------------------
</script>

