-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/leapyear.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

set verify off
declare
   -- {{{ function is_leap_year(in_year number) return boolean
   function is_leap_year(in_year number) return boolean is
   begin

      if (
          ( (mod(in_year,4)=0) and (mod(in_year,100)<>0) ) or
          ( (mod(in_year,4)=0) and (mod(in_year,100)=0) and (mod(in_year,400)=0))
         )
      then
         return true;
      else
         return false;
      end if;

   end is_leap_year;
   -- }}}
begin
   if (is_leap_year(&&1)) then
      dbms_output.put_line('&&1 is a leap year');
   else
      dbms_output.put_line('&&1 is NOT a leap year');
   end if;
end;
/
set verify on
