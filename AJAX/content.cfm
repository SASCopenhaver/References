<!---<cfinvoke component="ULFBERHT_JSON.MODEL.model" method="f_GetJobCorpsAllot"  returnvariable="spr_getSelectedObjList" >
	<cfinvokeargument name="argFirstYearInPeriod" value="2012">
	<cfinvokeargument name="argLastYearInPeriod" value="2016">
</cfinvoke>
<cfdump var="#client.spr_selectAllotmentJSON#" >--->
<!---<cfabort>--->

<!---/*
<script>
var handle;
function init() {
	 handle = ColdFusion.Chart.getChartHandle();
}

// Add commas:
var myString = '40006666000';
myString = myString.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
//alert(myString);

myString = myString.replace(/\,/g,'');
//alert(myString)


</script>

*/--->


<div id="divContent">

<!---<cfinclude template="aside.cfm" >--->
<!---<cfinclude template="section.cfm" >--->

<nav id="idPageNav">Page Navigation</nav>

<div id="div_Chart">
<!---
<cfchart id="main" chartheight="500" chartwidth="500" title="Test Chart" format="Flash" scalefrom="50" scaleto="150" >
	<cfchartseries type="bar" serieslabel="Sales">
        <cfchartdata item="Apples" value="120">
        <cfchartdata item="Bananas" value="84">
        <cfchartdata item="Cherries" value="72">
        <cfchartdata item="Donuts" value="109">
    </cfchartseries>
</cfchart>
--->
</div>
<br />div_JSON starts<br />
<div id="div_JSON"></div>
<br /><br />div_JSON ends<br />
<div id="div_JSON2"></div>
</div>

