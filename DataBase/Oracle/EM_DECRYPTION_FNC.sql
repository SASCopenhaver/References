CREATE OR REPLACE Function EMAPP.EM_DECRYPTION_FNC
   (  pString  in varchar2,
      pKey     in varchar2 default 'Default-Key')
        RETURN  varchar2 IS
   --$Header: /EMARS/Development/Database/Schemas/EMAPP/EMAPP.EM_DECRYPTION_FNC.FNC 2     6/07/05 6:47p Admin $
   --
   -- INPUT:      pString     Character string to be converted
   --             pKey        (Optional) Encryption Key
   -- OUTPUT:     Varchar2    Converted String
   --

   vOutString  varchar2(32767);
   iLenKey     number;
   vKey        varchar2(2000) := pKey;

BEGIN
   if length(vKey)<16 then
     vKey := rpad(vkey,16,'12345');
   elsif length(vKey)>16 then
     vKey := substr(vKey,1,16);
   end if;
   
   vOutString := dbms_obfuscation_toolkit.DES3Decrypt(input_string=>pString,key_string=>vKey);
   vOutString := rtrim(ltrim(vOutString));
   
   return vOutString;

END EM_DECRYPTION_FNC;
/
