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
This is function call:
<!--- of_populateSelect_ExrtraRow( "All Program Types", "ddlbm_SU_ProgrType", "-1", "=== Select Program Type ===", rowsPT, "orgBufferPT", "apt_program_type", "apt_description", "2D" ); --->
*/

function of_populateSelect_ExrtraRow( argAll, argControlName, argInitialValue, argInitialText, argRowsInLoop,
							 argArrayName, argValueName, argTextName, argArrayDimention )
{with (self.document.forms[0]){

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
		optionX = new Option;
		optionX.value = "*";
		optionX.text  = argAll;
		eval(argControlName + ".options[1] = optionX" );
		//
		//------------------
		
	}
	
	if (argRowsInLoop != 0)
	{
		//Fill the rest in <option>
		var ii = 2;
		for (var i=0; i<argRowsInLoop; i++)
		{
			optionX = new Option;
			
			//------------------------------------------------------------------
			//-- For 1-Dimentional array ---------------------------------------
			if (argArrayDimention == "1D")
			{//alert(argControlName.substr(0,5))
				eval("optionX.value = "+argArrayName+"["+i+"]");
				eval("optionX.text  = "+argArrayName+"["+i+"]");
				
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
