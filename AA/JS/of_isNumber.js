// JavaScript Document
function of_IsNumber(argValue, argCtrlName){with(self.document.forms[0]){
	var vLastVal = "";
	if (argValue.length > 0)
	{
		if (argValue.length == 1){ vLastVal = argValue; }
		else { vLastVal = argValue.substr((parseInt(argValue.length)-1),1); }
	}
	//alert(vLastVal)
	if ( isNaN(vLastVal) )
	{
		if (argValue.length == 1){ eval(argCtrlName+".value = ''"); alert("Sorry, value in this field should consist of numbers only.");}
		else
		{
			vLastVal = argValue.substr(0, parseInt(argValue.length)-1);
			eval(argCtrlName+".value = "+vLastVal);
			alert("Sorry, value in this field should consist of numbers only.");
		}
	}
}}