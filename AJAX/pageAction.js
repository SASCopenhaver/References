//=======================================================================
var cfcLink = "http://localhost:8500/ULFBERHT_JSON/MODEL/model.cfc";

var arrayData = {
					method: "f_getAllotment"
				};
$(document).ready(function(){
	var jqXHR = $.ajax({
						 url: 	cfcLink
						,type:	"GET"
						,dataType:"json"
						,data:	arrayData
				 })
				 .success (function(response){
				 		// works until ',dataType:"json" 'is set: $('#div_JSON').html(response);
						//f_Draw( f_convertColdFusionJSON(response) );
					 	f_convertColdFusionJSON(response) 
						
				 })
				 .error (function(jqXHR, textStatus, errorThrown){
				 		alert("Error: "+textStatus+": "+errorThrown);
				 });
});	
//----------------------------------------------------------------------
function f_convertColdFusionJSON(arg_aryCF) //arg_aryCF - argument in a form of array created by ColdFusion
{
	for (var d=0; d<arg_aryCF.DATA.length; d++) //d applies to DATA
	{//alert(arg_aryCF.COLUMNS[c]);
		for(var c=0; c<arg_aryCF.COLUMNS.length; c++) //c aplies to COLUMNS 
		{
			alert(arg_aryCF.COLUMNS[c]+"   "+ arg_aryCF.DATA[c][d] )	
		}
	}
	
}
/*
function f_convertColdFusionJSON(arg_aryCF) //arg_aryCF - argument in a form of array created by ColdFusion
{
    var s = arg_aryCF || {};
    if( !s.COLUMNS && !s.DATA )
    {
        console.error("convertColdFusionJSON() >>  was not passed a coldfusion serialized object");
        return [];
    }
    //Create returned object
    var obj = [];
    //Loops through serialObj and matches the columns
    for(var i=0; i < s.DATA.length; i++)
    {
        var temp = {};
        for(var j=0; j < s.COLUMNS.length; j++)
        {
            temp[s.COLUMNS[j]] = s.DATA[i][j];
        }
 
        // save the new row with column names
        obj.push(temp);
    }
 
    // Return the objects
    return obj;
}
*/
//------------------------------------------------------------------------
function f_Draw(arg_WorkableArray)
{
	d3.json(arg_WorkableArray, function(data){
		var v_Canvas = d3.select("body")
							.append("svg")
							.attr("width",500)
							.attr("height",500);
		
		v_Canvas.selectAll("rect")
					.data(data)
					.enter()
						.append("rect")
						.attr("width", function(d){return d.PROGRAM_YEAR;})
						.attr("height", 50)
						.attr("y", function(d,i){return i*5;})

			v_Canvas.selectAll("text")
						.data(data)
						.enter()
							.append("text")
							.attr("fill", "white")
							.attr("y", function(d,i){return i*50+24;})
							.text(function(d){return d.name;})

		
	});
	
}
//------------------------------------------------------------------------

/*
function f_draw(arg_jsonString)
{	"use strict";
	//$('#div_JSON').html(arg_jsonString);
	var s = arg_jsonString||{} ;
	
 	var obj = [];
    //Loops through serialObj and matches the columns
    for(var i=0; i < s.DATA.length; i++)
    {
        var temp = {};
        for(var j=0; j < s.COLUMNS.length; j++)
        {
            temp[s.COLUMNS[j]] = s.DATA[i][j];
        }
 
        // save the new row with column names
        obj.push(temp);
    }
 
    // Return the objects
    //return obj;
	alert(obj)
*/
	
	
	
	
	//
	//if( !s.COLUMNS && !s.DATA )
    //{
     //   console.error("convertColdFusionJSON() >>  was not passed a coldfusion serialized object");
    //    return [];
    //}
	//
	
	//var aryObj = [];
	
	
	/*	
	d3.json(arg_jsonString, function(data){
		var v_Canvas = d3.select("body")
							.append("svg")
							.attr("width",500)
							.attr("height",500);
		
		v_Canvas.selectAll("rect")
					.data(data)
					.enter()
						.append("rect")
						.attr("width", function(d){return d.PROGRAM_YEAR;})
						.attr("height", 50)
						.attr("y", function(d,i){return i*5;})

			v_Canvas.selectAll("text")
						.data(data)
						.enter()
							.append("text")
							.attr("fill", "white")
							.attr("y", function(d,i){return i*50+24;})
							.text(function(d){return d.name;})

		
	});
*/
/*
	
		d3.json("name_age.json", function(data){ 
			var v_Canvas = d3.select("body")
								.append("svg")
								.attr("width",  500)
								.attr("height", 500);
								
			v_Canvas.selectAll("rect")
						.data(data)
						.enter()
							.append("rect")
							.attr("width", function(d){return d.age*10; })
							.attr("height", 45)
							.attr("y", function(d,i){return i*50;})
							.attr("fill", "red");
							
			v_Canvas.selectAll("text")
						.data(data)
						.enter()
							.append("text")
							.attr("fill", "white")
							.attr("y", function(d,i){return i*50+24;})
							.text(function(d){return d.name;})
		});
*/	
	
										
//}
//======================================================================		
