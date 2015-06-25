<!--- inc_ChartReport_p1.cfm--->
These two charts are just samples

<p>
<cfchart format="png" scalefrom="30" scaleto="600" show3d="yes">
	
	
	
	<cfchartseries type="pyramid"  serieslabel="Argentina" seriescolor="##00CC33">
		<cfchartdata item="Fulbright Visitors Pgm" value="85">
		<cfchartdata item="Grant Intnl Visitors" value="63">
		<cfchartdata item="Voluntary Visitors" value="366">
		<cfchartdata item="Intnl Visitors" value="366">
	</cfchartseries>
	
	<cfchartseries type="bar" serieslabel="Brazil" seriescolor="##990033">
		<cfchartdata item="Fulbright Visitors Pgm" value="65">
		<cfchartdata item="Grant Intnl Visitors" value="24">
		<cfchartdata item="Voluntary Visitors" value="549">
		<cfchartdata item="Intnl Visitors" value="366">
	</cfchartseries>
	
</cfchart>
<br>
=================================================<br>

<cfchart format="png" show3d="yes">
	<cfchartseries type="pie">
		<cfchartdata item="Argentina" value="253">
		<cfchartdata item="Brazil" value="590">
	
	</cfchartseries>
</cfchart>
</p>