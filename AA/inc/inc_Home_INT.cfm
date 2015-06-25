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
			<table width="100%">
				<tr>
					<td colspan="7" class="c_fieldName">NEWS and ANNOUNCEMENTS<!---  <strong>&deg;</strong> ANNOUNCEMENTS and NEWS ---></td>
				</tr>
				<tr height="3px">
					<td bgcolor="#99CC00">&nbsp;</td>
					<td bgcolor="#999900">&nbsp;</td>
					<td bgcolor="#FFCC00">&nbsp;</td>
					<td bgcolor="#CC6600">&nbsp;</td>
					<td bgcolor="#000099">&nbsp;</td>
					<td bgcolor="#990033">&nbsp;</td>
					<td bgcolor="#FF0000">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="7" class="c_fieldName" align="right">ANNOUNCEMENTS and NEWS<!---  <strong>&deg;</strong> NEWS and ANNOUNCEMENTS ---></td>
				</tr>
				<tr>
					<td colspan="7" class="c_fieldName">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="7">
					<p>
					<span class="c_fieldName">Can you imagine?</span><br>
					<span class="c_fieldValue">Randa Nour lately vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</span>
					</p>
					<p>
					<span class="c_fieldName">Clarice and Sergey suggested </span><br>
					<span class="c_fieldValue">We know that no medicine is for everyone. If you use nitrate drugs, often used for chest pain (known as angina), don’t take VIAGRA. Taking these drugs at the same time could cause your blood pressure to drop to an unsafe level. Talk with your doctor first. Make sure you are healthy enough to have sex. If you have chest pain, nausea, or other discomforts during sex, seek medical help right away. Although erections lasting for more than four hours may occur rarely with all ED treatments in this drug class, it is important to seek immediate medical attention. Erections lasting more than six hours can result in long-term loss of potency.</span>
					</p>
					</td>
				</tr>
			</table>
			<!--- .............................................................................. --->
		</td>
		<!--- NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS NEWS  --->
		<!--- NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION  --->
		<td style="border-left-style:groove;" valign="top">
			<table width="100%" border="0" cellspacing="3" cellpadding="0">
				<tr>
					<th align="left" class="c_fieldName">Who are ECA Alumni?</th>
				</tr>
				<tr>
					<td>
						<span class="c_fieldValue">An alumnus(a) is any person who was selected for and has participated in an educational and cultural affairs funded program.  Once the person has participated in the program he or she becomes an alumnus(a).</span>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
			</table>
			<!--- ............................................................................... --->
			<table width="100%" border="0" cellspacing="3" cellpadding="0">
				<tr valign="top">
					<cfset local.vLoopNum = -1>
					<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
						<cfif #spr_getNavigation.st_call_file# NEQ #client.CallFile# AND #spr_getNavigation.st_loc# EQ "GL">
						<cfset local.FileImgName = "#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg">
						<cfset local.vColorTemp = local.vLoopNum +2>
						<cfset local.vLoopNum = local.vLoopNum + 1>
						<cfset local.BGC = "local.BG_Color#local.vColorTemp#">
						
						<cfif local.vColorTemp EQ 1>
							<cfset local.BGC = "##FFCC00">
						<cfelseif local.vColorTemp EQ 2>
							<cfset local.BGC = "##99CC00">
						<cfelseif local.vColorTemp EQ 3>
							<cfset local.BGC = "##CC6600">
						</cfif>
						<td bgcolor="<cfoutput>#local.BGC#</cfoutput>">
							<table width="100%" border="0">
								<cfloop index="i" from="1" to="#local.vLoopNum#"><tr><td>&nbsp;</td></tr></cfloop>
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
								<!--- ############################# --->
								<tr>
									<td>
									
									<cfif #spr_getNavigation.st_id# EQ 102>
										<span class="c_fieldValue">The</span> 
										<a href="##" onMouseOver="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#2.jpg');" 
													 onMouseOut="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg');" 
													 onClick="of_CallFile(<cfoutput>#spr_getNavigation.st_id#</cfoutput>);">
											<span class="c_fieldName" style="text-decoration:underline; "><cfoutput>#spr_getNavigation.st_nm#</cfoutput></span>
										</a>
										<span class="c_fieldValue">portion of the site will allow users to find Alumni and update/edit their individual Alumni records, in a multitude of ways.   From this area, users will be able to perform Basic and Advanced Searches by selecting from a variety of options, save their custom searches, and easily update the Alumni personal and biographical data.  This is where all Editing of Alumni Records will be available.</span>
									<cfelseif #spr_getNavigation.st_id# EQ 103>
										<span class="c_fieldValue">The</span> 
										<a href="##" onMouseOver="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#2.jpg');" 
													 onMouseOut="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg');" 
													 onClick="of_CallFile(<cfoutput>#spr_getNavigation.st_id#</cfoutput>);">
											<span class="c_fieldName" style="text-decoration:underline; "><cfoutput>#spr_getNavigation.st_nm#</cfoutput></span>
										</a>
										<span class="c_fieldValue">section of the site will allow users to run Standard and Custom reports on the Alumni in the Archive.  Standard reports will produce Counts, Statistical data, and Contact Lists on a variety of user defined selections. Also users may create lists of Alumni email addresses for distribution lists.   This section is also where Mailing Labels can be generated from any report combination that is available for mass mailing and contacting Alumni via mail.</span>
									<cfelseif #spr_getNavigation.st_id# EQ 104>
										<span class="c_fieldValue">The</span> 
										<a href="##" onMouseOver="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#2.jpg');" 
													 onMouseOut="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg');" 
													 onClick="of_CallFile(<cfoutput>#spr_getNavigation.st_id#</cfoutput>);">
											<span class="c_fieldName" style="text-decoration:underline; "><cfoutput>#spr_getNavigation.st_nm#</cfoutput></span>
										</a>
										<span class="c_fieldValue">section of the site is available only to those users with Administrative privileges.  Here, user accounts are managed, roles and privileges are assigned, password help is given, and requests for additional privileges are answered.  If this link is not active on the screen, administrative privileges are not available.</span>
									</cfif>
									</span>
									</td>
								</tr>
								<!--- ############################# --->
							</table>
						</td>
						</cfif>
					</cfloop>
				</tr>
			</table>
			<!--- ............................................................................... --->
		</td>
		<!--- NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION NAVIGATION  --->
  </tr>
</table>

</div>
<!--- 
<script language="javascript" type="text/javascript">
of_showHelpTopic('0');
</script>
 --->