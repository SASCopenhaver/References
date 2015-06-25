<cfquery name="getCountries" datasource="ajax_example">
    select * from Countries
    order by CountryName asc
</cfquery>

<cfquery name="getRegions" datasource="ajax_example">
	select * from Regions where CountryCode = '#url.countryCode#'
</cfquery>

<!---<script src="selectRegions.js"></script>--->
<script language="javascript" type="text/javascript">
var oXmlHttp
function showRegions(str)
{
	var url="/ajax/get_regions.cfm?&countryCode=" + str
	oXmlHttp=GetHttpObject(stateChanged) <!--- The GetHttpObject function creates an XMLHttpRequest object --->
	oXmlHttp.open("GET", url , true)
	oXmlHttp.send(null)
}
//
function stateChanged()
{
	if (oXmlHttp.readyState==4 || oXmlHttp.readyState=="complete")
	{
		document.getElementById("regionList").innerHTML=oXmlHttp.responseText
	}
}
//
function GetHttpObject(handler)
{
	try
	{
		var oRequester = new XMLHttpRequest();
		oRequester.onload=handler
		oRequester.onerror=handler
		return oRequester
	}
	catch (error)
	{
		try
		{
			var oRequester = new ActiveXObject("Microsoft.XMLHTTP");
			oRequester.onreadystatechange=handler
			return oRequester
		}
		
		catch (error)
		{
			return false;
		}
	}
}
</script>
<form>
    <div>
        <span>
        	<b>Select a country:</b>
        </span>
        
        <span>
            <select name="Country" onChange="showRegions(this.value)">
				<cfoutput query="getCountries">
                	<option value="#CountryCode#">#CountryName#</option>
                </cfoutput>
            </select>
        </span>
    </div>
    
    <div id="regionList">
    
    </div>
</form>