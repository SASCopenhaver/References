<cfgraph type="HorizontalBar"
  
		 showvaluelabel="Yes"
		 valuelabelfont="Times"
		 valuelabelsize="10" 
		 valuelocation="overBar"
		 scalefrom="-100" 
		 scaleto="100" 
		 
		 showitemlabel="Yes"
		 itemlabelfont="Arial" 
		 itemlabelsize="10" 
		 itemlabelorientation="HORIZONTAL"
		 
		 title="#PrjName#"
		 titlefont="Arial"

		 fileformat="jpg"
		 barspacing="3" 
		 graphheight="360" 
		 graphwidth="700"
		 
		 backgroundcolor="##FAF0CF"
		 bordercolor="Black" 
		 borderwidth="0" 
		 depth="0"
		 >
			<cfgraphdata value="#MngrOPP#" item="Organizational/Personal Pride (m)" color="#MngrOPP_Color#"></cfgraphdata>
			<cfgraphdata value="#PartOPP#" item="(p)"          color="#PartOPP_Color#"></cfgraphdata>
			
			<cfgraphdata value="#MngrPE#"  item="Performance/Excelence (m)"  color="#MngrPE_Color#"></cfgraphdata>
			<cfgraphdata value="#PartPE#"  item="(p)" 	  color="#PartPE_Color#"></cfgraphdata>
			
			<cfgraphdata value="#MngrTC#"  item="Teamwork/Communication (m)"  color="#MngrTC_Color#"></cfgraphdata>
			<cfgraphdata value="#PartTC#" item="(p)"   			  color="#PartTC_Color#"></cfgraphdata>
			
			<cfgraphdata value="#MngrLS#"  item="Leadership/Supervision (m)"  color="#MngrLS_Color#"></cfgraphdata>
			<cfgraphdata value="#PartLS#" item="(p)"   			  color="#PartLS_Color#"></cfgraphdata>
			
			<cfgraphdata value="#MngrPCE#" item="Profitability/Cost Effectiveness (m)" color="#MngrPCE_Color#"></cfgraphdata>
			<cfgraphdata value="#PartPCE#" item="(p)"  			  color="#PartPCE_Color#"></cfgraphdata>
			
			<cfgraphdata value="#MngrCAR#" item="Colleague/Associate Relations (m)" color="#MngrCAR_Color#"></cfgraphdata>
			<cfgraphdata value="#PartCAR#" item="(p)"  			  color="#PartCAR_Color#"></cfgraphdata>
			
			<cfgraphdata value="#MngrCCR#" item="Customer/Client Relations (m)" color="#MngrCCR_Color#"></cfgraphdata>
			<cfgraphdata value="#PartCCR#" item="(p)"  			  color="#PartCCR_Color#"></cfgraphdata>
			
			<cfgraphdata value="#MngrIC#"  item="Innovativeness/Creativity (m)"  color="#MngrIC_Color#"></cfgraphdata>
			<cfgraphdata value="#PartIC#" item="(p)"   			  color="#PartIC_Color#"></cfgraphdata>
			
			<cfgraphdata value="#MngrTD#"  item="Training/Development (m)"  color="#MngrTD_Color#"></cfgraphdata>
			<cfgraphdata value="#PartTD#" item="(p)"   			  color="#PartTD_Color#"></cfgraphdata>
			
			<cfgraphdata value="#MngrCO#"  item="Candor/Openness (m)"  color="#MngrCO_Color#"></cfgraphdata>
			<cfgraphdata value="#PartCO#" item="(p)" 			       color="#PartCO_Color#"></cfgraphdata>
			
			<!--- 
			<cfgraphdata value="#MngrOPP#" item="M OPP" color="##FF9999"></cfgraphdata>
			<cfgraphdata value="#PartOPP#" item="P OPP" color="##CC6666"></cfgraphdata>
			
			<cfgraphdata value="#MngrPE#"  item="M PE"  color="##FFCC66"></cfgraphdata>
			<cfgraphdata value="#PartPE#"  item="P PE"  color="##CC9900"></cfgraphdata>
			
			<cfgraphdata value="#MngrTC#"  item="M TC"  color="##CCFF99"></cfgraphdata>
			<cfgraphdata value="#PartTC#"  item="P TC"  color="##99CC33"></cfgraphdata>
			
			<cfgraphdata value="#MngrLS#"  item="M LS"  color="##99CCFF"></cfgraphdata>
			<cfgraphdata value="#PartLS#"  item="P LS"  color="##3399CC"></cfgraphdata>
			
			<cfgraphdata value="#MngrPCE#" item="M PCE" color="##CCCCFF"></cfgraphdata>
			<cfgraphdata value="#PartPCE#" item="P PCE" color="##9999CC"></cfgraphdata>
			
			<cfgraphdata value="#MngrCAR#" item="M CAR" color="##CCFFCC"></cfgraphdata>
			<cfgraphdata value="#PartCAR#" item="P CAR" color="##99CC99"></cfgraphdata>
			
			<cfgraphdata value="#MngrCCR#" item="M CCR" color="##FF9999"></cfgraphdata>
			<cfgraphdata value="#PartCCR#" item="P CCR" color="##FF6666"></cfgraphdata>
			
			<cfgraphdata value="#MngrIC#"  item="M IC"  color="##CCCC99"></cfgraphdata>
			<cfgraphdata value="#PartIC#"  item="P IC"  color="##66CC33"></cfgraphdata>
			
			<cfgraphdata value="#MngrTD#"  item="M TD"  color="##FF99CC"></cfgraphdata>
			<cfgraphdata value="#PartTD#"  item="P TD"  color="##CC6699"></cfgraphdata>
			
			<cfgraphdata value="#MngrCO#"  item="M CO"  color="##CCCC66"></cfgraphdata>
			<cfgraphdata value="#PartCO#"  item="P CO"  color="##99CC33"></cfgraphdata>
			 --->
		</cfgraph>