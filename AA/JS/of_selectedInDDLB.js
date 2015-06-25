// JavaScript Document
function of_selectedInDDLB (argDDLB_Name, argSelectedValue) {with(self.document.forms[0])
{//alert(argDDLB_Name +"    "+argSelectedValue)
	for (var i=0; i<eval(argDDLB_Name+".length"); i++)
	{
		//eval(argDDLB_Name+".options["+i+"].value")
		if (eval(argDDLB_Name+".options["+i+"].value") == argSelectedValue)
		{
			//alert(argSelectedValue)
			eval(argDDLB_Name+".options["+i+"].selected = true");
			break;
		}
		
	}
}}
