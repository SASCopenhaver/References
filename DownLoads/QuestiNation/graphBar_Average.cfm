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
			<cfgraphdata value="#AvrgOPP#" item="Organizational/Personal Pride" color="#AvrgOPP_Color#"></cfgraphdata>
			<cfgraphdata value="#AvrgPE#"  item="Performance/Excelence"  color="#AvrgPE_Color#"></cfgraphdata>
			<cfgraphdata value="#AvrgTC#"  item="Teamwork/Communication"  color="#AvrgTC_Color#"></cfgraphdata>
			<cfgraphdata value="#AvrgLS#"  item="Leadership/Supervision"  color="#AvrgLS_Color#"></cfgraphdata>
			<cfgraphdata value="#AvrgPCE#" item="Profitability/Cost Effectiveness" color="#AvrgPCE_Color#"></cfgraphdata>
			<cfgraphdata value="#AvrgCAR#" item="Colleague/Associate Relations" color="#AvrgCAR_Color#"></cfgraphdata>
			<cfgraphdata value="#AvrgCCR#" item="Customer/Client Relations" color="#AvrgCCR_Color#"></cfgraphdata>
			<cfgraphdata value="#AvrgIC#"  item="Innovativeness/Creativity"  color="#AvrgIC_Color#"></cfgraphdata>
			<cfgraphdata value="#AvrgTD#"  item="Training/Development"  color="#AvrgTD_Color#"></cfgraphdata>
			<cfgraphdata value="#AvrgCO#"  item="Candor/Openness"  color="#AvrgCO_Color#"></cfgraphdata>
			
			
		</cfgraph>