<!--- inc_ListUsr_Active_p1.cfm --->
<script language="javascript" type="text/javascript">
function f_Action(argUsrID){with(self.document.forms[0])
{alert(argUsrID)
	h_GA_UsrID.value = argUsrID;
	//
	h_UsrAddCntryCD.value = eval("h_UsrAddCntryCD"+argUsrID+".value");
	h_UsrAddCntryNM.value = eval("h_UsrAddCntryNM"+argUsrID+".value");
	//
	of_CallFile("UserProfile");
}}
//
</script>

<input type="hidden" name="h_ListType" value="403">
<input type="hidden" name="h_GA_UsrID">

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
		<table  width="100%"  border="1" bordercolor="#FF0000" cellspacing="1" cellpadding="1">
			<tr>
				<td valign="top" id="id_ListUsr"></td>
				<td width="9%" id="id_AccessCtrl"></td>
				
				<!--- <td width="9%"><cfinclude template="inc_AccsCtrl.cfm"></td> --->
				
				
			</tr>
		</table>
</cfif>
</div>
<script language="javascript" type="text/javascript">
//

function f_buildListUsrOutput(){with(self.document.forms[0])
{
	var vFilterCriteria = ddlb_FilterCriteria.value;
	var vListUsrOut = "";
	var vTemp = "";
	var vUsrCommentsNUR = "";
	var vUsrCommentsCHG = "";
	var vUsrComments = "";
	//
	vListUsrOut += "<table width=\"100%\" border=\"0\" cellspacing=\"1\" cellpadding=\"1\">";
		
	for (var l=0; l<orgBfrL.length; l++)
	{//alert(orgBfrL[l].aUSR_FULL_NM)
			//
			var vTempUsrCD = "";
			if ( orgBfrL[l].aUSR_CNTRY_IS_PRMRY == "Y" ){ vTempUsrCD = orgBfrL[l].aUSR_CD; }
			//
			//Row 1
			vListUsrOut += "<tr>";
					//
					vListUsrOut += "<td width=\"20%\" valign=\"top\">";
							vListUsrOut += "<input type=\"hidden\" name=\"h_UsrNm"+orgBfrL[l].aUSR_CD+"\" value=\""+orgBfrL[l].aUSR_FULL_NM+"\">";
							vListUsrOut += "<a href=\"##\" style=\"text-decoration:underline;\"  name=\""+orgBfrL[l].aUSR_LNAME_ALPHA+"\" onClick=\"JavaScript: f_Action("+orgBfrL[l].aUSR_CD+");\" >";
							vListUsrOut += orgBfrL[l].aUSR_FULL_NM;
							vListUsrOut += "</a>";
					vListUsrOut += "</td>";
					//
					vTemp = orgBfrL[l].aUSR_CNTRY_CITY_POST_NM;   if (orgBfrL[l].aUSR_CNTRY_CITY_POST_NM == ""){ vTemp = "none"}
					vListUsrOut += "<td width=\"40%\">";
							vListUsrOut += "<span class=\"c_fieldName\">Country / Post-City of Assignment:</span>&nbsp;";
							vListUsrOut += "<span class=\"c_fieldValue\">"+orgBfrL[l].aUSR_CNTRY_CNTRY_NM+" / "+vTemp+"</span>";
					vListUsrOut += "</td>";
					//
					vListUsrOut += "<td valign=\"top\">";
							vListUsrOut += "<input type=\"hidden\" name=\"h_UsrRole"+orgBfrL[l].aUSR_CD+"\" value=\""+orgBfrL[l].aUSR_CD+"\">";
							vListUsrOut += "<span class=\"c_fieldName\">Role:</span>&nbsp;";
							vListUsrOut += "<span class=\"c_fieldValue\">"+orgBfrL[l].aUSR_ROLE_NM+"</span>";
					vListUsrOut += "</td>";
			vListUsrOut += "</tr>";
			//
			//Row 2
			vListUsrOut += "<tr>";
					//
					vTemp = " /&nbsp;Ext."+orgBfrL[l].aUSR_EXT; if (orgBfrL[l].aUSR_EXT == "no_val"){ vTemp = ""; }
					vListUsrOut += "<td>";
							vListUsrOut += "<span class=\"c_fieldName\">Phone:</span>&nbsp;";
							vListUsrOut += "<span class=\"c_fieldValue\">"+orgBfrL[l].aUSR_PHONE+"&nbsp;  "+vTemp+"</span>";
					vListUsrOut += "</td>";
					//
					vListUsrOut += "<td>";
							vListUsrOut += "<input type=\"hidden\" name=\"h_UsrEMail"+orgBfrL[l].aUSR_CD+"\" value=\""+orgBfrL[l].aUSR_EMAIL+"\">";
							vListUsrOut += "<span class=\"c_fieldName\">E-Mail:</span>&nbsp;";
							vListUsrOut += "<span class=\"c_fieldValue\">"+orgBfrL[l].aUSR_EMAIL+"</span>";
					vListUsrOut += "</td>";
					//
					vListUsrOut += "<td>";
							vListUsrOut += "<span class=\"c_fieldName\">Status:</span>&nbsp;";
							vListUsrOut += "<span class=\"c_fieldValue\">"+orgBfrL[l].aIS_ACT_NM+"</span>";
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
			for (var i=0; i<orgBfrL.length; i++)
			{
				if ( vTempUsrCD == orgBfrL[i].aUSR_CD && orgBfrL[i].aUSR_CNTRY_IS_PRMRY == "N" )
				{
					vAddCntryTemp = orgBfrL[i].aUSR_CNTRY_CNTRY_NM;
					vAddCntry = vAddCntry + vAddCntryTemp + ", ";
					
					vAddCntryTempCD = orgBfrL[i].aUSR_CNTRY_CNTRY_CD;
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
							vTemp = orgBfrL[l].aUSR_CNTRY_OFC_ABBR; if (vTemp == "no_val"){ vTemp = "n/a"; }
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
			//.................................................................................
			
			//Row 5
			vListUsrOut += "<tr><td colspan=\"3\"><hr></td></tr>";
			//
	}//end of loop
	//
	vListUsrOut += "</table>";
	//alert(vListUsrOut)
	of_innerHTML("id_ListUsr",  "'"+vListUsrOut+"'");
	//
}}
//
//---------------------------------------------------------------------------------------------------

function of_imageSwap(argImgSource, argUsrID){ with(self.document.forms[0])
{	//alert(argImgSource+"   "+argImgSource.substr(0, (argImgSource.length-6) )+argUsrID)
	//argImgSource is the name of the image file
	//document.images['imgName' (- this Img name in <img name="" property)  ].src = "Img/" + argImgSource - this is File Name;
	//document.images[argImgSource].src = "Img/" + argImgSource;
	document.images[argImgSource.substr(0, (argImgSource.length-6) )+argUsrID].src = "Img/" + argImgSource;
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

function setAccessCtrl(){with(self.document.forms[0])
{
	
}}


////////////////////////////////////////////////////////////////////////////////
/*
<!---
<table border="0" cellspacing="1" cellpadding="1">
  <!--- RED ....................................................................................................... --->
  <tr>
    <td>
		<a href="##" onMouseOver="JavaScript: of_imageSwap('DotRed_2.jpg', '<cfoutput>#usr_cd#</cfoutput>');" 
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
  <cfif #client.CallPageID# NEQ 402>
			<cfif #client.CallPageID# EQ 401 AND #spr_getListOfUsers.usr_is_act# EQ "W">
				<tr>
					<td><img alt="On Hold" src="Img/DotYel_3.jpg" name="DotYel<cfoutput>#usr_cd#</cfoutput>" border=0 height="15" width="15"/></td>
					<td><font color="#999999">On Hold</font></td>
				</tr>
			<cfelse>
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

			</cfif>
  <cfelse>
  		<tr>
			<td><img alt="On Hold" src="Img/DotYel_3.jpg" name="DotYel<cfoutput>#usr_cd#</cfoutput>" border=0 height="15" width="15"/></td>
			<td><font color="#999999">On Hold</font></td>
		</tr>
  </cfif>
 <!---....................................................................................................... --->
 
  <!--- GREEN ....................................................................................................... --->
	<cfif #client.CallPageID# NEQ 403>
		<tr>
			<td>
				<a href="##" onMouseOver="JavaScript: of_imageSwap('DotGrn_2.jpg', '<cfoutput>#usr_cd#</cfoutput>');" 
							 onMouseOut="JavaScript:  of_imageSwap('DotGrn_1.jpg', '<cfoutput>#usr_cd#</cfoutput>');"
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
	<cfelse>
		<tr>
			<td><img alt="Approve" src="Img/DotGrn_3.jpg" name="DotGrn<cfoutput>#usr_cd#</cfoutput>" border=0 height="15" width="15"/></td>
			<td><font color="#999999">Approve</font></td>
		</tr>
	</cfif>
  <!--- ....................................................................................................... --->
</table>


/////////////////////////////////////////////////////////////////////////////////
--->
*/


//
//------------------------------------------------------------

f_buildListUsrOutput();
//
//setAccessCtrl();
//
//------------------------------------------------------------
</script>

