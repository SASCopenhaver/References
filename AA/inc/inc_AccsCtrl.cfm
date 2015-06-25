<!--- inc_AccsCtrl.cfm --->
<script language="javascript" type="text/javascript">
function of_imageSwap(argImgSource, argUsrID){ with(self.document.forms[0])
{	//alert(argImgSource+"   "+argImgSource.substr(0, (argImgSource.length-6) )+argUsrID)
	//argImgSource is the name of the image file
	//document.images['imgName' (- this Img name in <img name="" property)  ].src = "Img/" + argImgSource - this is File Name;
	//document.images[argImgSource].src = "Img/" + argImgSource;
	document.images[argImgSource.substr(0, (argImgSource.length-6) )+argUsrID].src = "Img/" + argImgSource;
}}// enf of function of_imageSwap
</script>
<!--- <cfoutput>#client.CallPageID#</cfoutput> --->
<table title="Access Controls" border="1" bordercolor="Black" cellspacing="1" cellpadding="1">
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



<script language="javascript" type="text/javascript">
//
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
</script>
