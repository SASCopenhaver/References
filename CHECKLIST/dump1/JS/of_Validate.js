function of_Validate(){with (self.document.forms[0]){
  //alert(":") 
    vValidationPassed = "YES";
    
    for (var e=0; e<elements.length; e++)
    {
    //alert(elements[e].type);
         //SELECT:
         if (elements[e].type == "select-one")
         {
            if (elements[e].value == -1)
            {
                alert("Illigal operation.\nPlease make a valid selection.");
                eval(elements[e].name+".focus()");
                vValidationPassed = "NO";
                break;
             }
         }
        //PASSWORD:
         else if (elements[e].type == "password") 
         {
            if(elements[e].value == "password" || elements[e].value == "")
            {
                alert("Please type in a proper password.")
                eval(elements[e].name+".focus()");
                eval(elements[e].name+".select()");
                vValidationPassed = "NO";
                break;
            }
         }
         //TEXT:
         else if (elements[e].type == "text")
         {
            if (elements[e].value == "")
            {
                alert("Please fill out all fields.")
                eval(elements[e].name+".focus()");
                eval(elements[e].name+".select()");
                vValidationPassed = "NO";
                break;
                
            }
         }
         /*
         else if (elements[e].type == "radio")
         { 
         //alert(elements[e].name +"  "+ elements[e+1].name)
            if (
                (elements[e].name == elements[e+1].name) 
                && 
                (eval(elements[e].name+".checked == false") && eval(elements[e+].name+".checked == false"))
               )
            {
                alert("Please make an appropriate selection between "+elements[e].id+" and "+elements[e+1].id)
                //eval(elements[e].name+".focus()")
                vValidationPassed = "NO";
                break;
            }
          
         }
         */
     }
}}