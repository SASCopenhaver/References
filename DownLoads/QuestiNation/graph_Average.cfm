<cfgraph backgroundcolor="##FAF0CF"
				bordercolor="Black" 
				 type="HorizontalBar" 
				 barspacing="2"  title="#PrjName#" titlefont="Arial"
				 fileformat="jpg" 
				 showitemlabel="Yes"
		         scalefrom="-100" scaleto="100" 
				 showvaluelabel="Yes" 
				 valuecolumn="Yes" itemlabelfont="Arial">
			
			<cfgraphdata value="#MngrOPP#" item="OPP" color="##FF9999"></cfgraphdata>
			<cfgraphdata value="#MngrPE#"  item="PE"  color="##FFCC66"></cfgraphdata>
			<cfgraphdata value="#MngrTC#"  item="TC"  color="##CCFF99"></cfgraphdata>
			<cfgraphdata value="#MngrLS#"  item="LS"  color="##99CCFF"></cfgraphdata>
			<cfgraphdata value="#MngrPCE#" item="PCE" color="##CCCCFF"></cfgraphdata>
			<cfgraphdata value="#MngrCAR#" item="CAR" color="##CCFFCC"></cfgraphdata>
			<cfgraphdata value="#MngrCCR#" item="CCR" color="##FF9999"></cfgraphdata>
			<cfgraphdata value="#MngrIC#"  item="IC"  color="##CCCC99"></cfgraphdata>
			<cfgraphdata value="#MngrTD#"  item="TD"  color="##FF99CC"></cfgraphdata>
			<cfgraphdata value="#MngrCO#"  item="CO"  color="##CCCC66"></cfgraphdata>
			
		</cfgraph>