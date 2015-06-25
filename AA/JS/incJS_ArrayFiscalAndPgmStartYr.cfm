<!--- incJS_ArrayFiscalAndPgmStartYr.cfm --->
<script language="javascript">
var vMin_fy_pgm_start_yr = 0;
var vMax_fy_pgm_start_yr = 0;
var vTemp = 0;
var rowsFYPS = 0;
//
vMin_fy_pgm_start_yr = parseInt(vMin_pgm_fy_dt) - parseInt(vMin_pgm_yr_dt);
  if ( vMin_fy_pgm_start_yr <= 0) 
     { vMin_fy_pgm_start_yr = vMin_pgm_fy_dt; }
else { vMin_fy_pgm_start_yr = vMin_pgm_yr_dt; }

//
vMax_fy_pgm_start_yr = parseInt(vMax_pgm_fy_dt) - parseInt(vMax_pgm_yr_dt);
  if ( vMax_fy_pgm_start_yr <= 0) 
     { vMax_fy_pgm_start_yr = vMax_pgm_yr_dt; }
else { vMax_fy_pgm_start_yr = vMax_pgm_fy_dt; }
//
//-----------------------------------------------------------------------------------------------------------------------

vTemp = vMin_fy_pgm_start_yr;
var rowsFYPS = (parseInt(vMax_fy_pgm_start_yr) - parseInt(vMin_fy_pgm_start_yr))+1;
//
//----------------------------------------------------------------------------------------------------------------------

function arrayFYPS(apgm_fyps_yr, apgm_fyps_yr)
{
	this.apgm_fyps_yr = apgm_fyps_yr;
	this.apgm_fyps_yr = apgm_fyps_yr;
}
//
//-----------------------------------------------------------------------------------------------------------------------

orgBfrFYPS = new Array();
var fyps = 0;
for ( fyps=0; fyps<rowsFYPS; fyps++ )
{
	orgBfrFYPS[fyps] = new arrayFYPS(
							   		  vTemp
							  		 ,vTemp
							  		)
	vTemp++;
}
//
//----------------------------------------------------------------------------------------------------------------------

function f_arraySortASC(a,b)
{
	a = parseInt(a.apgm_fyps_yr);
	b = parseInt(b.apgm_fyps_yr);
	//alert(a+"   "+b)
	return ( (a < b) ? 1 : ((a > b) ? -1 : 0) );//DESC order
	//return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );//ASC order
}
//
orgBfrFYPS.sort(f_arraySortASC);
</script>
