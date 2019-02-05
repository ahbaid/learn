-- Author:		Ahbaid Gaffoor
-- File:		md5.sql
-- Use:			Returns an MD5 hash of a given string
-- Requires:		Explicit grant to DBMS_CRYPTO

define in_string=&&1

--create or replace function md5(in_string varchar2) return varchar2 as 
declare

   in_string varchar2(4000) := '&&in_string';

   --
   -- This character set must be used for raw conversions via. utl_i18n
   --
   UTL_I18N_RAW_CHARACTER_SET constant varchar2(8) := 'AL32UTF8';

   raw_hash RAW(2000);

begin

   raw_hash := dbms_crypto.hash(
                  --
                  -- Convert in_string to raw
                  --
                  src => utl_i18n.string_to_raw(
                            data => in_string,
                            dst_charset => UTL_I18N_RAW_CHARACTER_SET
                         ),
                  --
                  -- Set hash type to MD5
                  --
                  typ => dbms_crypto.hash_md5
               );

   dbms_output.put_line('Hash of ['||in_string||'] is: '||raw_hash);

end md5;
/
show errors
