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
<!--- <div class="story">
<table width="100%"  border="1" cellspacing="2" cellpadding="1">
	<tr>
		<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
		<cfif #spr_getNavigation.st_call_file# NEQ #client.CallFile# AND #spr_getNavigation.st_loc# EQ "GL">
		<td><cfoutput>#spr_getNavigation.st_call_file#</cfoutput></td>
		</cfif>
		</cfloop>
	</tr>
</table>
</div>
<cfoutput>#(1 mod 3)#</cfoutput><br>
<cfoutput>#(2 mod 3)#</cfoutput><br>
<cfoutput>#(3 mod 3)#</cfoutput><br>
<cfoutput>#(4 mod 3)#</cfoutput><br>
<cfoutput>#(5 mod 3)#</cfoutput><br>
<cfabort>
 --->
<div class="story">
<table align="center" width="95%" border="0" cellspacing="1" cellpadding="1">
  <tr>
    <td width="35%">
	<!--- ################################################################################################ --->
		<table border="0" cellspacing="2" cellpadding="1">
			<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
				<cfif #spr_getNavigation.st_call_file# NEQ #client.CallFile# AND #spr_getNavigation.st_loc# EQ "GL">
				<cfset local.ParentID = #spr_getNavigation.st_id#>
				<cfset local.FileImgName = "#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg">
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
						<td valign="top">
							<cfoutput>
							<a href="##" onMouseOver="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#2.jpg');
																  of_showHelpTopic('#spr_getNavigation.st_id#');" 
										 onMouseOut="JavaScript: of_imageSwap('#Left(spr_getNavigation.st_call_file, Len(spr_getNavigation.st_call_file)-6)#1.jpg');
										 						 of_showHelpTopic('0'); " 
										 onClick="of_CallFile(#spr_getNavigation.st_id#);">
								<span class="c_fieldName"><cfoutput>#spr_getNavigation.st_nm#</cfoutput></span><br>
							</a>
							</cfoutput><!--- --->
							<!--- ------------------------------------------------------------------------ --->
							<!--- 
							<cfloop query="spr_getNavigation" startrow="1" endrow="#spr_getNavigation.recordCount#">
								<cfif #spr_getNavigation.st_loc# EQ "SG" AND #spr_getNavigation.st_parent_id# EQ #local.ParentID#>
									&nbsp;&nbsp;&nbsp;
									<cfoutput>
									<a href="##" onClick="of_CallFile(#spr_getNavigation.st_id#);" 
									             onMouseOver="JavaScript: of_showHelpTopic('#spr_getNavigation.st_id#');" 
												 onMouseOut="JavaScript:  of_showHelpTopic('0');">
									#spr_getNavigation.st_nm#
									</a><br>
									</cfoutput>
								</cfif>
							</cfloop>
							 --->
							<!--- ------------------------------------------------------------------------ --->
						</td>
						<!--- <td>&nbsp;</td> --->
					</tr>
				</cfif>
			</cfloop>
		</table>
	<!--- ################################################################################################ --->
	</td>
    <td id="id_HelpTopic">&nbsp;</td>
  </tr>
</table>
</div>
<script language="javascript" type="text/javascript">
of_showHelpTopic('0');
</script>