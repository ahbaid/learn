-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/mdays.sql
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
   -- {{{ function days_in_month(in_date date) return number
   function days_in_month(in_date date) return number is
   -- {JAN|MAR|MAY|JUL|AUG|OCT|DEC}:31 | {FEB-LEAP}:29 | {FEB-NOLEAP}:28 | 30
      in_month varchar2(3);
      in_year number := null;
      MONTHS31 constant varchar2(27) := 'JAN|MAR|MAY|JUL|AUG|OCT|DEC';
   begin

      in_month := to_char(in_date,'MON');
      in_year := to_number(to_char(in_date,'YYYY'));

      if (instr(MONTHS31,in_month) > 0) then
         return 31;
      elsif (in_month = 'FEB') then
         if (is_leap_year(in_year)) then
            return 29;
         else
            return 28;
         end if;
      else
         return 30;
      end if;

   end days_in_month;
   -- }}}
begin
   dbms_output.put_line(days_in_month(to_date('&&1','MMYYYY')));
end;
/
set verify on
