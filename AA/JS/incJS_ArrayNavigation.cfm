<!--- incJS_ArrayNavigation.cfm --->
<script type="text/javascript" language="javascript1.4">
//----------------------------------------------------------------------------------------------------
function f_arraySortASC(a,b)
{
	a = parseInt(a.ast_seq);
	b = parseInt(b.ast_seq);
	//alert(a+"   "+b)
	//return ( (a < b) ? 1 : ((a > b) ? -1 : 0) );//DESC order
	return ( (a < b) ? -1 : ((a > b) ? 1 : 0) );//ASC order
}
//
//----------------------------------------------------------------------------------------------------
<cfwddx action="CFML2JS" input="#spr_getNavigation#" toplevelvariable="tlv_N">
var rowsN = tlv_N.getRowCount();
function arrayN(ast_id, ast_nm, ast_loc, ast_parent_id, ast_is_act, ast_seq, ast_call_file)
{
	this.ast_id = ast_id;
	this.ast_nm = ast_nm;
	this.ast_loc = ast_loc;
	this.ast_parent_id = ast_parent_id;
	this.ast_is_act = ast_is_act;
	this.ast_seq = ast_seq;
	this.ast_call_file = ast_call_file;
}
//
//--------------------------------------------------------------------------------------------------
orgBfrN  = new Array();//All "eligible" navigation items
var n = 0;
//
orgBfrGL = new Array();//GL	Global Menu (ID = 101-999)
var gl = 0;
//
orgBfrSG = new Array();//SG	Sub-Global Menu (ID=201-299)
var sg = 0;
//
orgBfrUT = new Array();//UT	Utility Menu (ID=301-399)
var ut = 0;
//
orgBfrSL = new Array();//SL	Section Links (ID=401-499)
var sl = 0;
//
orgBfrRL = new Array();//RL	Related Links (ID=501-599)
var rl = 0;
//
//orgBfrBC = new Array();//BC	Breadcrumb (ID=601-699)
//var bc = 0; 
orgBfrSI = new Array();//SI	Site Information (in Footer ID=701-799)
var si = 0;
//
orgBfrAD = new Array();//AD	Advertisement Section (ID=801-899 )
var ad =0;
//
//------------------------------------------------------------------------------------------------
for (var n=0; n<rowsN; n++)
{
	orgBfrN[n] = new arrayN (tlv_N.st_id[n], tlv_N.st_nm[n], tlv_N.st_loc[n], tlv_N.st_parent_id[n], tlv_N.st_is_act[n], tlv_N.st_seq[n], tlv_N.st_call_file[n]  );
	//
	switch (tlv_N.st_loc[n])
	{
		case "GL":
			orgBfrGL[gl] = new arrayN( tlv_N.st_id[n], tlv_N.st_nm[n], tlv_N.st_loc[n], tlv_N.st_parent_id[n], tlv_N.st_is_act[n], tlv_N.st_seq[n], tlv_N.st_call_file[n] )
			gl++;
		break;
		//
		case "SG":
			orgBfrSG[sg] = new arrayN( tlv_N.st_id[n], tlv_N.st_nm[n], tlv_N.st_loc[n], tlv_N.st_parent_id[n], tlv_N.st_is_act[n], tlv_N.st_seq[n], tlv_N.st_call_file[n] )
			sg++;
		break;
		//
		case "UT":
			orgBfrUT[ut] = new arrayN( tlv_N.st_id[n], tlv_N.st_nm[n], tlv_N.st_loc[n], tlv_N.st_parent_id[n], tlv_N.st_is_act[n], tlv_N.st_seq[n], tlv_N.st_call_file[n] )
			//alert(orgBfrUT[ut].ast_seq)
			ut++;
		break;
		//
		case "SL":
			orgBfrSL[sl] = new arrayN( tlv_N.st_id[n], tlv_N.st_nm[n], tlv_N.st_loc[n], tlv_N.st_parent_id[n], tlv_N.st_is_act[n], tlv_N.st_seq[n], tlv_N.st_call_file[n] )
			sl++;
		break;
		//
		case "RL":
			orgBfrRL[rl] = new arrayN( tlv_N.st_id[n], tlv_N.st_nm[n], tlv_N.st_loc[n], tlv_N.st_parent_id[n], tlv_N.st_is_act[n], tlv_N.st_seq[n], tlv_N.st_call_file[n] )
			rl++;
		break;
			//
			//case "BC":
			//	orgBfrBC[bc] = new arrayN( orgBfrN[n].ast_id, orgBfrN[n].ast_nm, orgBfrN[n].ast_loc, orgBfrN[n].ast_parent_id, orgBfrN[n].ast_is_act, orgBfrN[n].ast_seq, orgBfrN[n].ast_call_file )
			//	bc++;
			//break;
			//
		case "SI":
			orgBfrSI[si] = new arrayN( tlv_N.st_id[n], tlv_N.st_nm[n], tlv_N.st_loc[n], tlv_N.st_parent_id[n], tlv_N.st_is_act[n], tlv_N.st_seq[n], tlv_N.st_call_file[n] )
			si++;
		break;
		//
		case "AD":
			orgBfrAD[ad] = new arrayN( tlv_N.st_id[n], tlv_N.st_nm[n], tlv_N.st_loc[n], tlv_N.st_parent_id[n], tlv_N.st_is_act[n], tlv_N.st_seq[n], tlv_N.st_call_file[n]  )
			ad++;
		break;
		//
	
	}
}
//alert("aa"+orgBfrSL.length)
/*
for (var ut=0; ut<orgBfrGL.length; ut++)
{
	alert(orgBfrGL[ut].ast_seq)
}
*/
//
//------------------------------------------------------------------------------------------------------------------------------------------------------------
orgBfrN.sort(f_arraySortASC);
orgBfrGL.sort(f_arraySortASC);
orgBfrSG.sort(f_arraySortASC);
orgBfrUT.sort(f_arraySortASC);
orgBfrSL.sort(f_arraySortASC);
orgBfrRL.sort(f_arraySortASC);
	//orgBfrBC.sort(f_arraySortASC);
orgBfrSI.sort(f_arraySortASC);
orgBfrAD.sort(f_arraySortASC);
</script>
