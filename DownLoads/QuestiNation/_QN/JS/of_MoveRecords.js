function of_MoveRecords(argWhatToDo){with (self.document.forms[0]){
    //SelectedFromSource
    //AllFromSource
    //SelectedFromTarget
    //AllFromTarget
    var rowsInSource = s_Source.options.length;
    var rowsInTarget = s_Target.options.length;
    //alert(rowsInSource+"  "+rowsInTarget)
    
    if (argWhatToDo == "SelectedFromSource")
    {
        if (rowsInSource == 1) {alert("Illegal operation.  Request denied.");}
        else {of_SelectedFromSource();}
    }
    //-------------------------------------
    else if (argWhatToDo == "AllFromSource")
    {
        if (rowsInSource == 1) {alert("Illegal operation.  Request denied.");}
        else {of_AllFromSource();}
    }
    //-------------------------------------
    else if (argWhatToDo == "SelectedFromTarget")
    {
        if (rowsInTarget == 1) {alert("Illegal operation.  Request denied.");}
        else {of_SelectedFromTarget();}
    }
    //-------------------------------------
    else if (argWhatToDo == "AllFromTarget")
    {
        if (rowsInTarget == 1) {alert("Illigal operation.  Request denied.");}
        else {of_AllFromTarget();}
    }
    

}}