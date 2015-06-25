function of_ArrayMonths(argYear)
{
    var mod = argYear%4;
    function ArrayOfMonth(n){this.length = n; return this;}
    monthNames = new ArrayOfMonth(12)
    monthNames[1]  = "31_01-January";
    if (mod == 0)
    {
        monthNames[2]  = "29_02-February";
    }
    else
    {
        monthNames[2]  = "28_02-February";
    }
    monthNames[3]  = "31_03-March";
    monthNames[4]  = "30_04-April";
    monthNames[5]  = "31_05-May";
    monthNames[6]  = "30_06-June";
    monthNames[7]  = "31_07-July";
    monthNames[8]  = "31_08-August";
    monthNames[9]  = "30_09-September";
    monthNames[10] = "31_10-October";
    monthNames[11] = "30_11-November";
    monthNames[12] = "31_12-December";
}

