-- Author:		Ahbaid Gaffoor
-- File:		dgdest.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

declare

   -- {{{ cursor cursor c_arch is
   cursor c_arch is
         select d.dest_id did, 
            d.destination dname, 
            max(l.sequence#) dseq,
            d.target as dtype
         from v$archived_log l, v$archive_dest d
         where l.applied='YES'  and 
               d.dest_id = l.dest_id(+) and 
               d.target = 'STANDBY' and 
               d.status='VALID'
         group by d.dest_id, d.destination, d.target
         union
         select d.dest_id did, 
            d.destination dname, 
            max(l.sequence#) dseq,
            d.target as dtype
         from v$archived_log l, v$archive_dest d
         where d.target = 'PRIMARY' and d.status = 'VALID'
         group by d.dest_id, d.destination, d.target;
   -- }}}

   maxarch number := null;
         
   -- {{{ print procs
   procedure print(s varchar2) is
   begin
      dbms_output.put_line(s);
   end;

   procedure cr is
   begin
      print(chr(11));
   end;

   procedure line is
   begin
      print(rpad('=',80,'='));
   end;
   -- }}}

begin

  cr;
  print ('DG Check: '||to_char(sysdate,'HH24:MI:SS MM/DD/YYYY'));
  line;

  for c1 in c_arch loop

     --
     -- Get the current archive from the Primary database
     --
     if ( c1.dtype = 'PRIMARY' ) then
        maxarch := c1.dseq;

        print ('Primary   '||c1.dname||' '||to_char(maxarch));

     --
     -- Handle Standby databases
     --
     else

        if (c1.dseq = maxarch) then
           print ('Standby '||to_char(c1.did)||' '||c1.dname||' : '||to_char(c1.dseq)||' [CURRENT]');
        else
           print ('Standby '||to_char(c1.did)||' '||c1.dname||' : '||to_char(c1.dseq)||' [LAG: '||to_char(maxarch-c1.dseq)||']');
        end if;

     end if;

  end loop; 

  cr;
  

end;
/

