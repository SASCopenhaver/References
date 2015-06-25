function of_setDays(argMonth)//this function populates options in s_StartDays
{with(self.document.forms[0]){

//alert(s_StartMonths.options[s_StartMonths.options.selectedIndex].value)

if ( s_StartMonths.options[s_StartMonths.options.selectedIndex].value != -1 )
{
    var vMonth = parseInt(argMonth,10);
    var daysInMonth = parseInt(monthNames[vMonth].substr(0,2),10);
    of_set_0_Row_Start_Dates("N","N","Y");
    var dToShow; 
    
    for (var d=1; d<(daysInMonth+1); d++)
    {
        if (d<10){dToShow="0"+d} else {dToShow=d};
        optionStartDays = new Option;
        optionStartDays.value = dToShow;
        optionStartDays.text  = dToShow;
        s_StartDays.options[d]= optionStartDays;
    }
    
    //alert(todayDate+" Y "+parseInt(todayDate, 10))
    
    if (s_Prjs.options[s_Prjs.options.selectedIndex].value == 0 && 
        s_StartYears.options[s_StartYears.options.selectedIndex].value == todayYear &&
        s_StartMonths.options[s_StartMonths.options.selectedIndex].value == todayMonth
        )
    {
        for (var d=0; d<s_StartDays.options.length; d++)
        {
           if (s_StartDays.options[d].value == todayDate )
           {
                s_StartDays.options[d].selected = true;
                break;
           }
        }
    }
    else {s_StartDays.options[0].selected = true;}
    
}   
else if ( s_StartMonths.options[s_StartMonths.options.selectedIndex].value == -1 )
{
    of_set_0_Row_Start_Dates("N","N","Y");
}
    
}}


/*
    //Condition for the current month and current year
    if (s_StartYears.options[s_StartYears.options.selectedIndex].value==todayYear && argMonth == todayMonth)
    {
        var vMonth = parseInt(argMonth,10);
        var daysInMonth = parseInt(monthNames[vMonth].substr(0,2),10);
        of_set_0_Row_Start_Dates("N","N","Y");
        var dd=1;
        var dToShow; 
        for (var d=todayDate; d<(daysInMonth+1); d++)
        {
            optionStartDays = new Option;
            if (d<10){dToShow="0"+d} else {dToShow=d};
            optionStartDays.value = dToShow;
            optionStartDays.text  = dToShow;
            s_StartDays.options[dd]= optionStartDays;
            dd++;
        }
    }
    else
    {
        if (argMonth == 0){of_set_0_Row_Start_Dates("N","N","Y");}
        else 
        {   
            var vMonth = parseInt(argMonth,10);
            var daysInMonth = parseInt(monthNames[vMonth].substr(0,2),10);
            var dToShow; 
                        
            of_set_0_Row_Start_Dates("N","N","Y");
            
            for (var d=1; d<(daysInMonth+1); d++)
            {
                if (d<10){dToShow="0"+d} else {dToShow=d};
                optionStartDays = new Option;
                optionStartDays.value = dToShow;
                optionStartDays.text  = dToShow;
                s_StartDays.options[d]= optionStartDays;
            }
        }
    }
}}
*/