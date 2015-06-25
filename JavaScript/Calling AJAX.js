//<!---<cfinclude template="../MODEL/model.cfc" >--->

var cfcLink = 'http://localhost:8500/ULFBERHT_JSON/MODEL/model.cfc';

var arrayData = {
     method:     'f_GetJobCorpsAllot'
       ,argFirstYearInPeriod: '2013'
       ,argLastYearInPeriod: '2015'
    };
$(document).ready(function(){

 var jqXHR = $.ajax({
       url:  cfcLink
      ,type: "POST"
      ,data: arrayData
     })
     .success (function(response){
       $('#div_JSON').html(response);
     })
     .error (function(jqXHR, textStatus, errorThrown){
       alert("Error: "+textStatus+": "+errorThrown);
     });
 
 $('#id_One').css('background-color','Red');
 $('#id_One[height=400]');
 
 
 
});
