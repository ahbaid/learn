--
-- Author:      Ahbaid Gaffoor
-- Date:        Tuesday 25th February 2003
-- File:        hitratios.sql
--
-- Purpose:     Get Crucial Cache Hit Ratios
--
-- License:     You may reuse this software at will provided you quote and retain this header
--
-- Disclaimer:  No warranty is provided with this software, no liability or guarantees
--              are given in any form
--

set feedback off
set serveroutput on size 400000

declare

   bc_physical_reads number;
   bc_consistent_gets number;
   bc_db_block_gets number;
   bc_hit_ratio number;

   dd_hit_ratio number;   

   lc_hit_ratio number;

   procedure print (s varchar2) is
   begin
      dbms_output.put_line(s);
   end;

   procedure cr is
   begin
      print(chr(10));
   end;

begin

   --
   -- Calculate Buffer Cache Hit Ratio
   --
   -- V$SYSSTAT - physical reads, consistent gets, db block gets
   --
   select sum(decode(name,'physical reads',abs(value),0)) into bc_physical_reads from v$sysstat;
   select sum(decode(name,'consistent gets',abs(value),0)) into bc_consistent_gets from v$sysstat;
   select sum(decode(name,'db block gets',abs(value),0)) into bc_db_block_gets from v$sysstat;

   bc_hit_ratio := round((1 - ( bc_physical_reads / (bc_consistent_gets + bc_db_block_gets) ))*100,2);


   --
   -- Calculate Data Dictionary Cache Hit Ratio
   --
   -- V$ROWCACHE - gets, getmisses
   --
   select round (  ( (sum(gets)-sum(getmisses)) / sum(gets) ) * 100,2) into dd_hit_ratio from v$rowcache;


   --
   -- Calculate Library Cache Hit Ratio
   --
   -- V$LIBRARYCACHE - pins, reloads
   --
   select round ( ( (sum(pins)-sum(reloads)) / sum(pins) ) *100,2) into lc_hit_ratio from v$librarycache ;

   --
   -- Print Results
   --
   cr;
   print(upper(SYS_CONTEXT('USERENV','DB_NAME'))||' Hit Ratios for: '||to_char(sysdate,'Day dth Month YYYY, HH24:MI:SS'));
   print(rpad('=',80,'='));
   print ('Buffer Cache Hit Ratio: '||bc_hit_ratio||'%');
   print ('Data Dictionary / Row Cache Hit Ratio: '||dd_hit_ratio||'%');
   print ('Library Cache Hit Ratio: '||lc_hit_ratio||'%');
   cr;

end;
/
set feedback on
