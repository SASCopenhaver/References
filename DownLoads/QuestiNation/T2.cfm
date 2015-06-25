<!--- <cfoutput>#Insert("spr_UA.Q", "#qID#", 0)#</cfoutput> --->
<select name="s_A<cfoutput>#qID#</cfoutput>" 
		title="Potential Answers"
		onChange="of_changeAnswer(this.options[selectedIndex].value, <cfoutput>#qID#</cfoutput>)"
		>
    <option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "-10">selected</cfif> value="-10">=Select Answer=</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "-2">selected</cfif> value="-2">A -Strongly agree with or encourage it</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "-1">selected</cfif> value="-1">B -Agree with encourage it</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "0">selected</cfif> value="0">C -Consider it not important</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "1">selected</cfif> value="1">D -Disagree with or discourage it</option>
	<option <cfif evaluate("#Insert("spr_UA.Q", "#qID#", 0)#") EQ "2">selected</cfif> value="2">E -Strongly disagree with or discourage it</option>
</select>
<!--- onChange="of_changeAnswer(this.options[selectedIndex].value)" --->