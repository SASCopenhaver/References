function of_populatePrjsStatus(){with(self.document.forms[0]){
    for (var ps=0; ps<rowsPrjsStat; ps++)
    {
        optionPS = new Option;
        optionPS.value = arrayPrjsStat[ps].aOrgID;
        optionPS.text  = arrayPrjsStat[ps].aPrjStatus;
						//arrayPrjsStat[ps].aOrgID+"  "+arrayPrjsStat[ps].aPrjStatus;
        s_PrjsStat.options[ps] = optionPS;
    }
    
}}
