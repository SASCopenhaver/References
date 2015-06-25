function of_InitialValue (argObjName, argValue, argText, argPosNum)
{
    with(self.document.forms[0])
    {
        var controlType = argObjName.substr(0,1);
        if ( controlType == "s")//select box
        {
            eval(argObjName  + ".options["+argPosNum+"].value = "+ argValue);
			//alert(eval(argObjName  + ".options["+argPosNum+"].value = "+ argValue))
            eval(argObjName  + ".options["+argPosNum+"].text = \"" + argText +"\"");
        }//end of if
        else if (controlType == "t")
        {
            alert(controlType);
        }//end of else if
    }//end of with
}//end of function