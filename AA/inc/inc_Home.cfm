<!--- inc_Home.cfm --->
<script language="javascript" type="text/javascript">
//---------------------------------------------------------------------------------------------------
function of_imageSwap(argImgSource){ with(self.document.forms[0])
{	//alert(argImgSource.substr(0, (argImgSource.length-6) ) )
	//argImgSource is the name of the image file
	//document.images['imgName' (- this Img name in <img name="" property)  ].src = "Img/" + argImgSource - this is File Name;
	document.images[argImgSource.substr(0, (argImgSource.length-6) )].src = "Img/" + argImgSource;
}}// enf of function of_imageSwap
//
//---------------------------------------------------------------------------------------------------
</script>
<cfset local.BG_Color1 = "##B5F200">
<cfset local.BG_Color2 = "##00B5F2">
<cfset local.BG_Color3 = "##F200B5">
<cfset local.BG_Color4 = "##F23C00">

<div class="story">

<table align="center" width="95%" border="0" cellspacing="2" cellpadding="2">
  <tr>
		<!--- NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS  --->
		<td width="30%" valign="top">
			<!--- .............................................................................. --->
			<table  border="0" ><!--- width="100%" --->
				<tr>
					<td><h3>NEWS and ANNOUNCEMENTS</h3><!---  <strong>&deg;</strong> ANNOUNCEMENTS and NEWS ---></td>
				</tr><!--- class="c_fieldName" --->
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td bgcolor="#99CC00">&nbsp;</td>
								<td bgcolor="#999900">&nbsp;</td>
								<td bgcolor="#FFCC00">&nbsp;</td>
								<td bgcolor="#CC6600">&nbsp;</td>
								<td bgcolor="#000099">&nbsp;</td>
								<td bgcolor="#990033">&nbsp;</td>
								<td bgcolor="#FF0000">&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="right"><h3>ANNOUNCEMENTS and NEWS</h3><!---  <strong>&deg;</strong> NEWS and ANNOUNCEMENTS ---></td>
				</tr><!--- class="c_fieldName" --->
				<!--- <tr>
					<td colspan="7" class="c_fieldName">&nbsp;</td>
				</tr> --->
				<tr>
					
					<td width="30%">
					<cfloop query="spr_getNews" startrow="1" endrow="#spr_getNews.recordCount#">
					<!--- |||||||||||||||||||||||||||||||||||| --->
					<cfoutput>
						<p>
						<font class="c_fieldName">#topic_title#</font>
						<br>
						<font class="c_fieldValue">#topic_txt#</font>
						<!--- <font class="c_fieldValue">#HTMLCodeFormat(topic_txt)#</font> --->
						</p>
					</cfoutput>
					<!--- ||||||||||||||||||||||||||||||| --->
					</cfloop>
					</td>
					
				</tr>
				
				<!--- <tr><td></td></tr> --->
				 
			</table>
			<!--- .............................................................................. --->
		</td>
		<!--- NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS  --->
		<!--- NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION  --->
		<td  valign="top"><!--- style="border-left-style:groove;" --->
			<table width="100%" border="0" cellspacing="3" cellpadding="0">
				<tr>
					<th align="left" class="c_fieldName">Who are ECA Alumni?</th>
				</tr>
				<tr>
					<td>
						<span class="c_fieldValue">An ECA alumnus(a) is any person who was selected for and has participated in a program fully or partially funded by the State Department Bureau of Educational and Cultural Affairs (ECA).  Once the person has participated in the program he or she becomes an alumnus(a).</span>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
			</table>
			<!--- ............................................................................... --->
			<table width="100%" border="0" cellspacing="3" cellpadding="0">
				<tr valign="top">
					<cfset local.vLoopNum = -1>
					<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
						<cfif #spr_getNavigation.st_call_file# NEQ #client.CallFile# AND #spr_getNavigation.st_loc# EQ "GL" AND #spr_getNavigation.st_id# NEQ 105>
						<cfset local.FileImgName = "#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg">
						<cfset local.vColorTemp = local.vLoopNum +2>
						<cfset local.vLoopNum = local.vLoopNum + 1>
						<cfset local.BGC = "local.BG_Color#local.vColorTemp#">
						
						<cfif local.vColorTemp EQ 1>
							<cfset local.BGC = "##C7DD9C">
						<cfelseif local.vColorTemp EQ 2>
							<cfset local.BGC = "##FFCC00">
						<cfelseif local.vColorTemp EQ 3>
							<cfset local.BGC = "##CD8742">
						</cfif>
						<td width="33%" bgcolor="<cfoutput>#local.BGC#</cfoutput>">
							<table width="100%" border="0">
								<!--- <cfloop index="i" from="1" to="#local.vLoopNum#"><tr><td>&nbsp;</td></tr></cfloop> --->
								<tr><td>&nbsp;</td></tr>
								<tr>
									<td>
										<cfoutput>
										<a href="##" onMouseOver="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#2.jpg');" 
													 onMouseOut="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg');"
													 onClick="of_CallFile(#spr_getNavigation.st_id#);">
													 <img border=0 src="Img/#local.FileImgName#" name="#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-7)#">
										</a>
										</cfoutput>
									</td>
								</tr>
								<tr>
									<td>
										<cfoutput>
										<!--- 
										<a href="##" onMouseOver="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#2.jpg');
																			  of_showHelpTopic('#spr_getNavigation.st_id#');" 
													 onMouseOut="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg');
																			 of_showHelpTopic('0'); " 
													 onClick="of_CallFile(#spr_getNavigation.st_id#);">
											<span class="c_fieldName" style="text-decoration:underline; "><cfoutput>#spr_getNavigation.st_nm#</cfoutput></span><br>
										</a>
										 --->
										<cfif #spr_getNavigation.st_id# EQ 103>
											<a href="##" onClick="JavaScript: alert('Sorry, under construction');">
												<span class="c_fieldName" style="text-decoration:underline; ">#spr_getNavigation.st_nm#</span><br>
											</a>
										<cfelse>
											<a href="##" onMouseOver="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#2.jpg');" 
														 onMouseOut="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg');" 
														 onClick="of_CallFile(#spr_getNavigation.st_id#);">
												<span class="c_fieldName" style="text-decoration:underline; ">#spr_getNavigation.st_nm#</span><br>
											</a>
										</cfif>
										</cfoutput>
									</td>							
								</tr>
								<cfif #spr_getNavigation.st_id# NEQ 106 AND #spr_getNavigation.st_id# NEQ 104 >
									<tr>
										<cfset local.St_ID = spr_getNavigation.st_id><!--- <cfoutput>#spr_getNavigation.st_id#</cfoutput><br> --->
										
										<cfloop query="spr_getCapsuleStory" startrow="1" endrow="#spr_getCapsuleStory.recordCount#">
											<cfif #local.St_ID# EQ #topic_seq_on_page#>
												<cfset local.vTxt = #topic_txt#>
												<cfbreak>
											</cfif>
										</cfloop>
										<td>
										 <span class="c_fieldValueBlack"><cfoutput>#local.vTxt#</cfoutput></span> 
										</td>
									</tr>
								<cfelseif #spr_getNavigation.st_id# EQ 106>
									<tr>
										<td>
											<ul>
												<!--- 
												<li type="disc"><a href="#" onClick="f_openAdvancedSearch(209);">Create Mailing Labels</a></li>
												<li type="disc"><a href="#" onClick="f_openAdvancedSearch(210);">Create Contact List</a></li>
												<li type="disc"><a href="#" onClick="f_openAdvancedSearch(211);">Create Statistical Reports</a></li>
												 --->
												<li type="disc"><a href="#" onClick="of_CallFile(209);">Create Mailing Labels</a></li>
												<li type="disc"><a href="#" onClick="of_CallFile(213);">Create E-mail Distribution List</a></li>
												<li type="disc"><a href="#" onClick="of_CallFile(210);">Create Contact List</a></li>
												<li type="disc"><a href="#" onClick="of_CallFile(211);">Create Custom Reports</a></li>
											</ul>
										</td>
									</tr>
								 
								<cfelseif #spr_getNavigation.st_id# EQ 104>
									
									<cfif client.Usr_Role_CD EQ 1 
										  OR 
										  client.Usr_Role_CD EQ 242 
										  OR 
										  client.Usr_Role_CD EQ 306 
										  OR 
										  client.Usr_Role_CD EQ 304>
										<tr>
											<cfset local.St_ID = spr_getNavigation.st_id>
											
											<cfloop query="spr_getCapsuleStory" startrow="1" endrow="#spr_getCapsuleStory.recordCount#">
												<cfif #local.St_ID# EQ #topic_seq_on_page#>
													<cfset local.vTxt = #topic_txt#>
													<cfbreak>
												</cfif>
											</cfloop>
											<td align="left">
											 <span class="c_fieldValueBlack"><cfoutput>#local.vTxt#</cfoutput></span> 
											</td>
										</tr>
									<cfelse>
										<tr><td align="left">Go here to update your password, request new privileges.</td></tr>
									</cfif>
									
								</cfif>
							</table>
						</td>
						</cfif>
					</cfloop>
				</tr>
			</table>
			<!--- ............................................................................... --->
			<hr>
			<table width="100%"  border="0" cellspacing="1" cellpadding="1" >
			  <cfif #client.Usr_Role_CD# EQ 1 OR
			  		#client.Usr_Role_CD# EQ 304 OR
					#client.Usr_Role_CD# EQ 306 OR
					#client.Usr_Role_CD# EQ 242>
			  		
					  <tr>
						<!--- <td align="right"><a href="Img/ALUMNIARCHIVEGettingStarted_2000_PAO.pdf">Upload "Registering and Authorizing Users" brochure</a></td> --->
						<td align="right"><a href="JavaScript: f_popupUploadBrochure(1);">Download "Registering and Authorizing Users" brochure</a></td>
					  </tr>
			  </cfif>
			  <tr>
				<!--- <td align="right"><a href="Img/ALUMNIARCHIVEGettingStarted_2000r1.pdf">Upload "Getting Started" brochure</a></td> --->
				<td align="right"><a href="JavaScript: f_popupUploadBrochure(2);">Download "Getting Started" brochure</a></td>
			  </tr>
			  
			</table>
			<hr>
			<!--- ............................................................................... --->
		</td>
		<!--- NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION  --->
  </tr>
</table>
<input type="hidden" name="h_PageId" value="">
<input type="hidden" name="h_PageNm" value="">

</div>
<script language="javascript" type="text/javascript">
function f_popupUploadBrochure(argFileId){with(self.document.forms[0])
{
	var vFileName = "";
	  if (argFileId == 1)     { vFileName = "Img/ALUMNIARCHIVEGettingStarted_2000_PAO.pdf"; }
	else /*(argFileId == 2)*/ { vFileName = "Img/ALUMNIARCHIVEGettingStarted_2000r1.pdf"; }
	//
	var popupPage = vFileName;
	var popupWin = window.open(popupPage,'source','fullscreen=no,toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,titlebar=yes,resizable=yes,top=100,left=100,copyhistory=no,width=650,height=200','yes');
	if ((document.window != null) && (!popupWin.opener))
	{
		popupWin.opener = document.window;
	}
	
}}
</script>
