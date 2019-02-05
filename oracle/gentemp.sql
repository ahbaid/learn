set head off
set feed off
set echo off 
set lines 200
set serveroutput on size 1000000

spool run-createtemp.sql 

declare

  cursor c1 is

      select unique TABLESPACE_NAME as tn from dba_temp_files order by 1;

   -- {{{ procedure gentemp(in_tablespace varchar2) 
   procedure gentemp(in_tablespace varchar2) is
      cnt number ;
      cursor fl(in_tspc varchar2) is 
   	select f.name
           , create_bytes/(1024*1024) megs
   	, trunc((t.blocksize * t.dflincr)/(1024*1024)) umegs 
   	from v$tempfile f, sys.ts$ t
           where f.ts# = t.ts#
   	and t.name=upper(in_tspc)
   	order by file#
   	;
   begin
      cnt := 0;
      for flrec in fl(in_tablespace) loop	
   	if cnt = 0 then
   	   dbms_output.put_line (chr(10));
   	   dbms_output.put_line('create temporary tablespace '||in_tablespace||' tempfile '''||flrec.name ||''' SIZE ' || flrec.megs || 'M' );
   	   dbms_output.put_line (' extent management local uniform size ' || flrec.umegs || 'M ;');
   	   dbms_output.put_line (chr(10));
   	   cnt :=1;
   	else 
   	   dbms_output.put_line('alter tablespace '||in_tablespace||' add tempfile '''||flrec.name ||''' SIZE ' || flrec.megs || 'M ;');
   	end if; 
      end loop;
      dbms_output.put_line (chr(10));
   end gentemp;
   -- }}}

begin

  for t in c1 loop

     gentemp(upper(t.tn));

  end loop;

end;
/

spool off
