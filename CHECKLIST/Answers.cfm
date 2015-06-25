<select>
	<option value=1>1 - bad problems/affected the overall program negatively</option>
	<option value=2>2 - some problems/less than satisfactory</option>
	<option value=3>3 - satisfactory/met basic requirements</option>
	<option value=4>4 - more than satisfactory/well done/affected the program positively</option>
	<option value=5>5 - exceptional/very positive impact on overall program/could be used as a model</option>
	<option value=6>N - indicates the element was not applicable in this project</option>
	<option value=7>U - indicates unknown, i.e., there was not enough information available on which to base a decision</option>
</select>



<!--- <cfoutput>#evaluate(Insert("spr_UA.Q", "#qID#", 0))#</cfoutput> --->
<!--- 
<select name="s_A<cfoutput>#qID#</cfoutput>" 
		title="Potential Answers"
		onChange="of_changeAnswer(this.options[selectedIndex].value, <cfoutput>#qID#</cfoutput>)"
		>
    <option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "-10">selected</cfif> value="-10">=Select Answer=</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "2">selected</cfif> value="2">A -Strongly agree with or encourage it</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "1">selected</cfif> value="1">B -Agree with encourage it</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "0">selected</cfif> value="0">C -Consider it not important</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "-1">selected</cfif> value="-1">D -Disagree with or discourage it</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "-2">selected</cfif> value="-2">E -Strongly disagree with or discourage it</option>
</select>
 --->
<!--- onChange="of_changeAnswer(this.options[selectedIndex].value)"  --->


