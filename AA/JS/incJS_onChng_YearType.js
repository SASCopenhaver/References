// JavaScript Document
//incJS_onChng_YearType.js
function f_onChng_YearType(argYearType)
{
	switch (argYearType)
	{
		case "-1":
			of_populateSelect( "ddlb_CS_Year", "-1", "=== Select Type ===", 0, "", "", "", "2D" );
		break;

		case "FY":
			of_populateSelect( "ddlb_CS_Year", "-1", "=== Select Fiscal Year ===", rowsFY, "orgBfrFY", "apgm_fy_dt_cd", "apgm_fy_dt", "2D" );
			self.document.forms[0].ddlb_CS_Year.options[0].selected = true;
		break; 

		case "PS":
			of_populateSelect( "ddlb_CS_Year", "-1", "=== Select Program Year ===", rowsPS, "orgBfrPS", "apgm_yr_dt_cd", "apgm_yr_dt", "2D" );
			self.document.forms[0].ddlb_CS_Year.options[0].selected = true;
		break;

		case "FYPS":
			of_populateSelect( "ddlb_CS_Year", "-1", "=== Select Year ===", rowsFYPS, "orgBfrFYPS", "apgm_fyps_yr", "apgm_fyps_yr", "2D" );
			self.document.forms[0].ddlb_CS_Year.options[0].selected = true;
		break;
		
	}
}