<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!--- ..................................................................... --->
<script language="JavaScript" src="JS/swapImg_cbContinue.js"></script>
<script language="JavaScript" src="JS/swapImg_cbInstruction.js"></script>
<!--- <script language="JavaScript" src="JS/swapImg_cbNotes.js"></script> --->
<script language="JavaScript" src="JS/swapImg_cbLogOut.js"></script>
<script language="JavaScript" src="JS/swapImg_cbSave.js"></script>
<script language="JavaScript" src="JS/swapImg_cbMenu.js"></script>
<script language="JavaScript" src="JS/swapImg_cbReset.js"></script>
<script language="JavaScript" src="JS/swapImg_cbsArrows.js"></script>
<script language="JavaScript" src="JS/swapImg_cbPrjMngr.js"></script>
<script language="JavaScript" src="JS/swapImg_cbDelete.js"></script>
<script language="JavaScript" src="JS/swapImg_cbArchiveFrom.js"></script>
<script language="JavaScript" src="JS/swapImg_cbArchiveTo.js"></script>
<script language="JavaScript" src="JS/swapImg_cbReport.js"></script>
<script language="JavaScript" src="JS/swapImg_cbBack.js"></script>
<script language="JavaScript" src="JS/swapImg_cbEMail.js"></script>
<script language="JavaScript" src="JS/swapImg_cbNewMsg.js"></script>

<script language="JavaScript" src="JS/swapImg_cbPrintMP.js"></script>
<script language="JavaScript" src="JS/swapImg_cbPrintA.js"></script>

<script language="JavaScript" src="JS/of_InitialValue.js"></script>
<script language="JavaScript" src="JS/of_Validate.js"></script>

<script language="JavaScript" src="JS/of_MoveRecords.js"></script>

<script language="JavaScript" src="JS/wddx.js"></script>
<!--- ..................................................................... --->

<cfif isDefined("URL.urlFileToGoTo")>
	<cfset local.FileToGoTo = #URL.urlFileToGoTo#>
</cfif>
<cfif isDefined("URL.urlModuleName")>
	<cfset local.ModuleName = #URL.urlModuleName#>
</cfif>

<cfinclude template="Header.cfm">

<cfinclude template="#local.FileToGoTo#">

<cfinclude template="Copyright.cfm">

</html>
