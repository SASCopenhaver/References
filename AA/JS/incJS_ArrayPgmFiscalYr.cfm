<!--- incJS_ArrayPgmFiscalYr.cfm --->
<script language="javascript" type="text/javascript">
var vMin_pgm_fy_dt = "<cfoutput>#spr_getPgmFiscalYr.min_pgm_fy_dt#</cfoutput>";
var vMax_pgm_fy_dt = "<cfoutput>#spr_getPgmFiscalYr.max_pgm_fy_dt#</cfoutput>";
var vTemp = vMin_pgm_fy_dt;
//
var rowsFY = (parseInt(vMax_pgm_fy_dt) - parseInt(vMin_pgm_fy_dt))+1;
//
function arrayFY(apgm_fy_dt_cd, apgm_fy_dt)
{
	this.apgm_fy_dt_cd = apgm_fy_dt_cd;
	this.apgm_fy_dt = apgm_fy_dt;
}
//
orgBfrFY = new Array();
//
var fy=0;
for (var fy=0; fy<rowsFY; fy++)
{
	orgBfrFY[fy] = new arrayFY(
							   vTemp
							  ,vTemp
							  )
	vTemp++;
}
//
//----------------------------------------------------------------------------------------------------
function f_arraySortASC(a,b)
{
	a = parseInt(a.apgm_fy_dt_cd);
	b = parseInt(b.apgm_fy_dt_cd);
	//alert(a+"   "+b)
	return ( (a < b) ? 1 : ((a > b) ? -1 : 0) );//DESC order
	//return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );//ASC order
}
//
orgBfrFY.sort(f_arraySortASC);
//
</script>

