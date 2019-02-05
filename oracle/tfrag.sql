-- Author:		Ahbaid Gaffoor
-- File:		tfrag.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

spool tfrag

set verify off

define in_owner=&&1
define in_table=&&2

column rblocks new_value row_blocks noprint
column eblocks new_value empty_blocks noprint

declare

   -- {{{ dba_tables cursor
   cursor c1 is select 
       blocks as rblocks, 
       empty_blocks as eblocks,
       chain_cnt as chained,
       num_rows as nrows,
       row_movement as rmove
   from dba_tables
   where owner = upper('&&in_owner') and
         table_name = upper('&&in_table');
   c1var c1%ROWTYPE;
   -- }}}

   -- {{{ dba_segments cursor
   cursor c2 is select 
       blocks as segments_allocated
   from   dba_segments  
   where owner = upper('&&in_owner') and  
         segment_name = upper('&&in_table');
   c2var c2%ROWTYPE;
   -- }}}

   -- {{{ extents cursor
   cursor c3 is select 
       count(*) as extents 
   from dba_extents
   where owner = upper('&&in_owner') and
         segment_name = upper('&&in_table');
   c3var c3%ROWTYPE;
   -- }}}

   nrows number;
   rowblocks number;
   emptyblocks number;
   chainedrows number;
   segments number;
   extents number;
   hwm number;
   bfrag number;
   row_movement varchar2(8);

   -- {{{ print
   procedure print(s varchar2) is
   begin
      dbms_output.put_line(s);
   end print;
   -- }}}

   -- {{{ showstat
   procedure showstat(l varchar2,n number, pct number:= null, dec boolean := false) is
      llen number := 25;
      nlen number := 30;
   begin
      if (dec) then
         if (pct is null) then
            print(rpad(l,llen,' ')||': '||lpad(to_char(n,'999,999,999,999,999,990.99'),nlen,' '));
         else
            print(rpad(l,llen,' ')||': '||lpad(to_char(n,'999,999,999,999,999,990.99'),nlen,' ')||
                  to_char(pct,'990.00')||'%');
         end if;
      else
         if (pct is null) then
            print(rpad(l,llen,' ')||': '||lpad(to_char(n,'999,999,999,999,999,990'),nlen,' '));
         else
            print(rpad(l,llen,' ')||': '||lpad(to_char(n,'999,999,999,999,999,990'),nlen,' ')||
                  to_char(pct,'990.00')||'%');
         end if;
      end if;
   end showstat;
   -- }}}

begin

   open c1;
      fetch c1 into c1var;
      nrows := c1var.nrows;
      rowblocks := c1var.rblocks;
      emptyblocks := c1var.eblocks;
      chainedrows := c1var.chained;
      row_movement := c1var.rmove;
   close c1;

   open c2;
      fetch c2 into c2var;
      segments := c2var.segments_allocated;
   close c2;

   open c3;
      fetch c3 into c3var;
      extents := c3var.extents; 
   close c3;

   hwm := segments - emptyblocks - 1;
   bfrag := (hwm - rowblocks)/(hwm + 0.0001);

   print(chr(10));
   print('Table frgamentation report for '||upper('&&in_owner')||'.'||upper('&&in_table'));
   print(rpad('=',70,'='));
   showstat('Rows',nrows);
   showstat('Allocated blocks',segments);
   showstat('Blocks with rows',rowblocks,pct=>rowblocks/segments*100);
   showstat('Empty blocks',emptyblocks,pct=>emptyblocks/segments*100);
   showstat('Extents',extents);
   showstat('High Water Mark',hwm);
   print(rpad('Row Movement',25)||': '||row_movement);

   if (nvl(nrows,0) > 0) then
      showstat('Chained/Frag rows',chainedrows,pct=>chainedrows/nrows*100);
   end if;

   showstat('Block fragmentation',bfrag,dec=>true);
   print(chr(10));

end;
/


spool off
