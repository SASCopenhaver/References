CREATE OR REPLACE PACKAGE EM_USER_SECURITY IS

  -- Author  : SERGEY
  -- Created : 1/24/2013 6:42:30 AM
  -- Purpose : 
  
  -- Public type declarations
  --type <TypeName> is <Datatype>;
  
  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;
--=======================================================================================
PROCEDURE sp_getsetInitialSettings;



  -- Public function and procedure declarations
  --function <FunctionName>(<Parameter> <Datatype>) return <Datatype>;

END EM_USER_SECURITY;
/
CREATE OR REPLACE PACKAGE BODY EM_USER_SECURITY IS

  -- Private type declarations
--  type <TypeName> is <Datatype>;
  
  -- Private constant declarations
--  <ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
--  <VariableName> <Datatype>;

  -- Function and procedure implementations
 -- function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
 --   <LocalVariable> <Datatype>;
  --begin
  --  <Statement>;
   -- return(<Result>);
  --end;
--=======================================================================================
PROCEDURE sp_getsetInitialSettings IS
    
    v_Server    VARCHAR2(50)  DEFAULT 'http://'||owa_util.get_cgi_env('SERVER_NAME'); -- ex: 'http://emarss15.eng.usps.gov'
    -- DEVELOPMENT: 'http://emarss15.eng.usps.gov'
    -- STAGING:     'http://emarss13.eng.usps.gov'
    -- PRODUCTION:  'http://emarssu6.eng.usps.gov'
    v_Port         VARCHAR2(50)  DEFAULT ':'||owa_util.get_cgi_env('SERVER_PORT')||'/'; -- ex: ':80/'
    v_Script       VARCHAR2(50)  DEFAULT 'emars-script/'; -- Subdirectory where JavaScript files are located 
    ----
    --v_PageFileName       VARCHAR2(50) DEFAULT 'NM_PM_COMPLETION33.js'; -- File name needed for this screen
    v_JSGenericFunctions VARCHAR2(50) DEFAULT 'JS_GENERIC.js';         -- File name with generic JavaScript functions
    ----
    v_SCR       VARCHAR2(200);  -- "scr" property of the <script> tag
    v_ScriptTag VARCHAR2(200); -- The entire string of the tag <script>
    ----       
BEGIN 

htp.p('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
       <HTML xmlns="http://www.w3.org/1999/xhtml">
       <HEAD>
       <META http-equiv="Content-Type" content="text/html; charset=utf-8" />
       <TITLE>Non-eCBM PM Completion</TITLE>
      ');
      -- 1. Generic functions: 
      v_SCR :=  v_Server||v_Port||v_Script||v_JSGenericFunctions;
      v_ScriptTag := '<script language="javascript" src="'||v_SCR||'"></script>';
      
      htp.p(v_ScriptTag);-- <-- Generic <SCRIPT> outputs here
      
      -- 2. Page specific functions: IMPORTANT - property "defer" is a must in the following <script>
      --v_SCR :=  v_Server||v_Port||v_Script||v_PageFileName;
      --v_ScriptTag := '<script language="javascript" defer="defer" src="'||v_SCR||'"></script>';
      
      --htp.p(v_ScriptTag);-- <-- Page specific <SCRIPT> outputs here
      
htp.p('</HEAD>');
htp.p('
<STYLE type="text/css">
    .PageTytle {
       background-color: #DCDCDC;
       font-size: 32;
       color:navy;
       font-weight: bold;
       font-family: arial;
       text-align: center;
       border-style: outset;
    }
    
    .Select_Options {
       font-family:''Courier New'', Courier, monospace;
       font-size:12px;
    }
    
    .tblBG_Color1 {
       background-color: #CCCCCC;
    }
    
    .Ctrl_Title_12_Bold {
       font-family:Verdana, Geneva, sans-serif;
       font-size:12px;
       font-weight:bold;
    }

    .Ctrl_Title_10_Norm {
       font-family:Verdana, Geneva, sans-serif;
       font-size:10px;
    }

    .Ctrl_Title_10_Bold {
       font-family:Verdana, Geneva, sans-serif;
       font-size:10px;
       font-weight:bold;
    }

    .Ctrl_Title_14 {
       font-family:Verdana, Geneva, sans-serif;
       font-size:14px;
       font-weight:bold;
    }
    
    .Data_10_Navy_Bold {
       font-family:Verdana, Geneva, sans-serif;
       font-size:10px;
       font-weight:bold;   
       color:navy;
    }
</STYLE>
');
htp.p('<BODY>');
htp.p('<FORM>');
htp.p('<div id="div_Page" name="div_Page">div_Pag</div>');-- "Main" <div> object where the entire page will be placed, see "NM_PM_COMPLETION33.js" for details
htp.p('</FORM>');
htp.p('</BODY>');
htp.p('</HTML>');




END sp_getsetInitialSettings;
--=======================================================================================
  -- Initialization
  --<Statement>;
END EM_USER_SECURITY;
/
