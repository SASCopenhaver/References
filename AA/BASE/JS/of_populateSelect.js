/*	FUNCTION DESCRIPTION:
/   This function assumes that the very first value in drop down will be an "instruction",
/	such as "Select Country", "Select Year" etc.
Exemple:
of_populateSelect('s_Year_F'		//argControlName
		                 ,-1				//argInitialValue
						 ,'**Year**'		//argInitialText
						 ,arrayYear.length	//argRowsInLoop
						 ,'arrayYear'		//argArrayName
						 ,''				//argValueName
						 ,''				//argTextName
						 ,'1D'				//1 or 2 Dimentional array
						 );


*/

function of_populateSelect(  argControlName, argInitialValue, argInitialText, argRowsInLoop,
							 argArrayName, argValueName, argTextName, argArrayDimention )
{with (self.document.forms[0]){
//alert("of_populateSelect")
	eval("self.document.forms[0]."+argControlName+".options.length = 0");
	//alert( argControlName+"   "+ eval("self.document.forms[0]."+argControlName+".options.length"))
	
	//Fill the first "line" in <option>
	if (argInitialValue != '')
	{
		optionX = new Option;
		optionX.value = argInitialValue;
		optionX.text  = argInitialText;
		eval(argControlName + ".options[0] = optionX" );
		//
		
		//
		//------------------
		
	}
	
	if (argRowsInLoop != 0)
	{
		//Fill the rest in <option>
		var ii = 1;
		for (var i=0; i<argRowsInLoop; i++)
		{
			optionX = new Option;
			
			//------------------------------------------------------------------
			//-- For 1-Dimentional array ---------------------------------------
			if (argArrayDimention == "1D")
			{//alert(argControlName.substr(0,5))
				if (argControlName.substr(0,6) == "s_Mnth")
				{//alert(eval("optionX.value = "+argArrayName+"["+i+"].substr(3,3)"))
					if (ii==12){break;}
					eval("optionX.value = "+argArrayName+"["+ii+"].substr(3,3)");
					eval("optionX.text  = "+argArrayName+"["+ii+"].substr(3,3)");
					
				}
				else
				{
					eval("optionX.value = "+argArrayName+"["+i+"]");
					eval("optionX.text  = "+argArrayName+"["+i+"]");
				}
			}
			//------------------------------------------------------------------
			
			//-- For 2-Dementional array ---------------------------------------
			else if (argArrayDimention == "2D")
			{
				eval("optionX.value = "+argArrayName+"["+i+"]."+argValueName);
				eval("optionX.text  = "+argArrayName+"["+i+"]."+argTextName);
			}
			//------------------------------------------------------------------
			eval(argControlName+".options["+ii+"] = optionX");
			//alert(eval(argControlName+".options["+ii+"] = optionX");
			ii++;
		}
	}
}}
