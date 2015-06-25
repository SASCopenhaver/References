// of_Submit.js
/*
function of_Submit(argController){with (self.document.forms[0])
{//alert(argController)
	action = "_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController="+argController;
	submit();
}}
*/
function of_Submit(argSubmitString){with (self.document.forms[0])
{//alert("submit   "+argSubmitString)
	//action = "_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController="+argController;
	action = argSubmitString;
	submit();
}}