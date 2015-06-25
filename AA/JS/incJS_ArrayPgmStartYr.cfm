<!--- incJS_ArrayPgmFiscalYr.cfm --->
<script language="javascript" type="text/javascript">
var vMin_pgm_yr_dt = "<cfoutput>#spr_getPgmStartYr.min_pgm_yr_dt#</cfoutput>";
var vMax_pgm_yr_dt = "<cfoutput>#spr_getPgmStartYr.max_pgm_yr_dt#</cfoutput>";
var vTemp = vMin_pgm_yr_dt;
//
var rowsPS = (parseInt(vMax_pgm_yr_dt) - parseInt(vMin_pgm_yr_dt))+1;
//
function arrayPS(apgm_yr_dt_cd, apgm_yr_dt)
{
	this.apgm_yr_dt_cd = apgm_yr_dt_cd;
	this.apgm_yr_dt    = apgm_yr_dt;
}
//
orgBfrPS = new Array();
//
var ps=0;
for (var ps=0; ps<rowsPS; ps++)
{
	orgBfrPS[ps] = new arrayPS(
							   vTemp
							  ,vTemp
							  )
	vTemp++;
}
//
//----------------------------------------------------------------------------------------------------
function f_arraySortASC(a,b)
{
	a = parseInt(a.apgm_yr_dt_cd);
	b = parseInt(b.apgm_yr_dt_cd);
	//alert(a+"   "+b)
	return ( (a < b) ? 1 : ((a > b) ? -1 : 0) );//DESC order
	//return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );//ASC order
}
//
orgBfrPS.sort(f_arraySortASC);
</script>

