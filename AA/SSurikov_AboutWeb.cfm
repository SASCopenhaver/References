<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>cfoutput>#client.PageName#</cfoutput></title>

<link rel="stylesheet" href="Style/AboutWeb.css" type="text/css">
<!--- List of GENERIC JavaScript FUNCTIONS ................................... --->
<script src="JS/wddx.js" type="text/javascript"></script>
<script src="JS/of_function_1.js" type="text/javascript"></script>
<script src="JS/of_function_2.js" type="text/javascript"></script>
<script src="JS/of_function_3.js" type="text/javascript"></script>
.....
<script src="JS/of_function_N.js" type="text/javascript"></script>
<!--- JavaScript FUNCTIONS applicable to this page only ....................... --->
<script language="javascript">
function f_Validate(){with(self.document.forms[0]){
vValidationPassed = "YES";
 for (var e=0; e<elements.length; e++)
    {
    //alert(elements[e].type);
         //SELECT:
         if (elements[e].type == "select-one")
         {
           		//some validation     		
				//alert(".....");
                //break;
         }
        //PASSWORD:
         else if (elements[e].type == "password") 
         {
            if(elements[e].value == "")
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
            if (elements[e].name.substr(-2) == "_R" && elements[e].value == "")
            {
                alert("Please fill our this field.")
                eval(elements[e].name+".focus()");
                eval(elements[e].name+".select()");
                vValidationPassed = "NO";
                break;
                
            }
         }
        
         else if (elements[e].type == "radio")
         { 
				//some validation     		
				//alert(".....");
                //break;
            }
          
         }
         
     }
}}


}}//end of with() and f_Validate()
//
function f_Submit(argSubmitString){with (self.document.forms[0])
{
	//action = "_Controller.cfm?<cfoutput>#client.URLTOKEN#</cfoutput>&urlController="+argController;
	action = argSubmitString;
	submit();
}}//end of with() and f_Submit()
//
</script>
<!--- ------------------------------------------------------------------------- --->
</head>

<body>
<form name="form_AboutWebb" id="id_AboutWebb" action=""  method="post">
<!--- ============================================================================= --->
<div id="divID_Header">
....
</div>
<!--- ============================================================================= --->
<div id="divID_Menu">
....
</div>
<!--- ============================================================================= --->
<div id="divID_Content">
<!--- 
Naming:
_R means required
_O means optional
 --->
			<input type="text" id="id_FullName" name="txt_FullName_R" class="forminputs" value="">
			<br />
			<input type="text" id="id_Email" name="txt_Email_R" class="forminputs" value="">
			<br />
			<input type="text" id="id_Phone" name="txt_Phone_R" class="forminputs" value="">
			<br />
			<input type="text" id="id_Fax" name="txt_Fax_O" class="forminputs" value="">
			<br />
			<input type="password" id="id_Password" name="txt_Password_R" class="forminputs" value="">
			<br />
			<input type="button" id="id_Submit" name="cb_Submit" class="commandButton" onClick="f_Validate(); f_Submit();" value="Submit">
			</div>


</form>
</body>
</html>
