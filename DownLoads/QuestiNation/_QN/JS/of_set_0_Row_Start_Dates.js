function of_set_0_Row_Start_Dates(aStartYear, aStartMonth, aStartDay//,
                                   /*EndYear, aEndMonth, aEndDay*/)
{
with (self.document.forms[0])
{

    //1. Start Year
    if (aStartYear=="Y")
    {
        s_StartYears.options.length = 0;
        optionStartYears       = new Option;
        optionStartYears.value = -1;
        optionStartYears.text  = "==Select Year==";
								//optionStartYears.value+"==Select Year==";
        s_StartYears.options[0]= optionStartYears;
    }
    
    //2.Start Month
    if (aStartMonth == "Y")
    {
        s_StartMonths.options.length = 0;
        optionStartMonths       = new Option;
        optionStartMonths.value = -1;
        optionStartMonths.text  = "==Select Month==";
								//optionStartMonths.value+"==Select Month==";
        s_StartMonths.options[0]= optionStartMonths;
    }
    
    //3.Start Day
    if (aStartDay == "Y")
    {
        s_StartDays.options.length = 0;
        optionStartDays       = new Option;
        optionStartDays.value = -1;
        optionStartDays.text  = "==Select Day==";
								//optionStartDays.value+"==Select Day==";
        s_StartDays.options[0]= optionStartDays;
    }
}
}