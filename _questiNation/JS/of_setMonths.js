function of_setMonths(argYear)//this function populates options in s_StartMonths
{with(self.document.forms[0]){
    
    of_ArrayMonths(argYear);//file arrayMonths.js
    
    for (var m=1; m<13; m++)
    {
        optionStartMonths = new Option;
        optionStartMonths.value = monthNames[m].substr(3,2);
        optionStartMonths.text  = monthNames[m].substr(3);
        s_StartMonths.options[m]= optionStartMonths;
    }
    
    if (s_Prjs.options[s_Prjs.options.selectedIndex].value == 0 && 
        s_StartYears.options[s_StartYears.options.selectedIndex].value == todayYear)
    {
        for (var m=0; m<s_StartMonths.options.length; m++)
        {
            //alert(s_StartMonths.options.length+" Y "+parseInt(s_StartMonths.options[m].value, 10) +" Y "+todayMonth)
            if (parseInt(s_StartMonths.options[m].value, 10) == todayMonth)
            {
                s_StartMonths.options[m].selected = true;
                of_setDays(todayMonth);
                break;
            }
        }
    }
    else 
    {
        s_StartMonths.options[0].selected = true;
        of_set_0_Row_Start_Dates("N","N","Y");
        //s_StartDays.options[0].selected = true;
    }
        
}}    
  