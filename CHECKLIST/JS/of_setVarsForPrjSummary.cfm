<!--- of_setVarsForPrjSummary.cfm --->
<script language="JavaScript" type="text/javascript">
function of_setVarsForPrjSummary(){
	for (var fp=0; fp<fBufferPP.length; fp++)
	{
		if (fBufferPP[fp].aPrjCurrentStatus == "ACT")
		{
			if ( fBufferPP[fp].aPrjFiscalYear == vPrevFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vActNE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vActPE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vActE_PrevFiscYear++;
				}
			}
			else if ( fBufferPP[fp].aPrjFiscalYear == vCurrFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vActNE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vActPE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vActE_CurrFiscYear++;
				}	
			}
		}
		
		else if (fBufferPP[fp].aPrjCurrentStatus == "CLO")
		{
			if ( fBufferPP[fp].aPrjFiscalYear == vPrevFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vCloNE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vCloPE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vCloE_PrevFiscYear++;
				}
			}
			else if ( fBufferPP[fp].aPrjFiscalYear == vCurrFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vCloNE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vCloPE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vCloE_CurrFiscYear++;
				}	
			}
		}
		
		else if (fBufferPP[fp].aPrjCurrentStatus == "COM")
		{
			if ( fBufferPP[fp].aPrjFiscalYear == vPrevFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vComNE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vComPE_PrevFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vComE_PrevFiscYear++;
				}
			}
			
			else if ( fBufferPP[fp].aPrjFiscalYear == vCurrFiscalYear )
			{
				if ( fBufferPP[fp].aEvalStatus == "NE" )
				{
					vComNE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "PE" )
				{
					vComPE_CurrFiscYear++;
				}
				else if ( fBufferPP[fp].aEvalStatus == "E" )
				{
					vComE_CurrFiscYear++;
				}	
			}
			
		}
		//
		if ( fBufferPP[fp].aPrjFiscalYear == vPrevFiscalYear )
		{
			vTotalPrjPrevFiscalYear++;
	
		}
		else if ( fBufferPP[fp].aPrjFiscalYear == vCurrFiscalYear )
		{
			vTotalPrjCurrFiscalYear++;
		}
		
		//----------------------------------------------------------------------
	}//end of loop
}// end of function 
</script>