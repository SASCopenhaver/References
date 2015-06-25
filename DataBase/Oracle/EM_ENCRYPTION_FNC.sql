CREATE OR REPLACE Function EMAPP.EM_ENCRYPTION_FNC
   (  pString  in varchar2,
      pKey     in varchar2 default 'Default-Key')
        RETURN  varchar2 IS
   --$Header: /EMARS/Development/Database/Schemas/EMAPP/EMAPP.EM_ENCRYPTION_FNC.FNC 2     6/07/05 6:47p Admin $
   --
   -- INPUT:      pString     Character string to be converted
   --             pKey        (Optional) Encryption Key
   -- OUTPUT:     Varchar2    Converted String
   -- 

   vInString   varchar2(32767):=pString;
   vOutString  varchar2(32767);
   iLenKey     number;
   vKey        varchar2(2000) := pKey;

BEGIN
  
   vInString := rtrim(ltrim(vInString));
   if length(vKey)<16 then
     vKey := rpad(vkey,16,'12345');
   elsif length(vKey)>16 then
     vKey := substr(vKey,1,16);
   end if;
   if mod(length(vInString),8)!=0 then
      vInString := rpad(vInString,length(vInString)+(8-mod(length(vInString),8)),' ');
   end if;
   
   vOutString := dbms_obfuscation_toolkit.DES3Encrypt(input_string=>vInString,key_string=>vKey);
      
   return vOutString;

END EM_ENCRYPTION_FNC;
/
