function of_setYears(argYear){with(self.document.forms[0]){
var varYear;
if (argYear < todayYear)
{
    var yearDiff = todayYear - argYear;
    for (var y=1; y<(yearDiff+3); y++)
    {
        varYear = (parseInt(argYear, 10)+(y-1));
        optionStartYears = new Option;
        optionStartYears.value = varYear;
        optionStartYears.text  = varYear;
        s_StartYears.options[y]= optionStartYears;
            
    }
}
else if (argYear == todayYear)
{
    for (var y=1; y<3; y++)
    {//adds lines in option starting from the second line
     //todayYear is a var declared on EditorProjects.cfm
        varYear = todayYear+(y-1);
        //(parseInt(argYear, 10)+(y-1));
        optionStartYears       = new Option;
        optionStartYears.value = varYear;
        optionStartYears.text  = varYear;
        s_StartYears.options[y]= optionStartYears;
    }
}
else if (argYear > todayYear)
{
    var yearDiff = argYear - todayYear;
    for (var y=1; y<(yearDiff+3); y++)
    {
        varYear = todayYear+(y-1);
        optionStartYears       = new Option;
        optionStartYears.value = varYear;
        optionStartYears.text  = varYear;
        s_StartYears.options[y]= optionStartYears;
    }
}
}}//end of with and of_setYears()