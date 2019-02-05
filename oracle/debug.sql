-- Author:		Ahbaid Gaffoor
-- File:		debug.sql
-- Use:			Sets the :debug SQL variable, this is referenced in all scripts
-- 			The :debug variable is decared when a logon script calls setprompt.sql
--			If the script is not called issue: "variable debug number" at the prompt

set termout off feedback off
define debug_opt=&&1

begin
   if (lower('&&debug_opt') = 'on') then
      :debug := 1;
   else 
      :debug := 0;
   end if;
end;
/

set termout on feedback on
--print debug
