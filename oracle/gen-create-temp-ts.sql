set head off
set feed off
set echo off 
set lines 200
set serveroutput on size 1000000

spool run-create-dba-temp-tablespace.sql 
declare
   cnt number ;
   cursor fl is 
	select f.name
        , create_bytes/(1024*1024) megs
	, trunc((t.blocksize * t.dflincr)/(1024*1024)) umegs 
	from v$tempfile f, sys.ts$ t
        where f.ts# = t.ts#
	and t.name='DBA_TEMP'
	order by file#
	;
begin
      cnt := 0;
      for flrec in fl loop	
	if cnt = 0 then
	   dbms_output.put_line (' REM ');
	   dbms_output.put_line('CREATE TEMPORARY TABLESPACE DBA_TEMP TEMPFILE ');
	   dbms_output.put_line(' ''' || flrec.name || ''' SIZE ' || flrec.megs || 'M' );
	   dbms_output.put_line (' extent management local uniform size ' || flrec.umegs || 'M ;');
	   cnt :=1;
	else 
	   dbms_output.put_line('ALTER TABLESPACE dba_temp ADD TEMPFILE ');
	   dbms_output.put_line(' ''' || flrec.name || ''' SIZE ' || flrec.megs || 'M ;');
	end if; 
      end loop;
end;
/
spool off

spool  run-create-temp-tablespace.sql 
declare
   cnt number ;
   cursor fl is
        select f.name
        , create_bytes/(1024*1024) megs
        , trunc((t.blocksize * t.dflincr)/(1024*1024)) umegs
        from v$tempfile f, sys.ts$ t
        where f.ts# = t.ts#
        and t.name='TEMP'
        order by file#
        ;
begin
      cnt := 0;
      for flrec in fl loop
        if cnt = 0 then
           dbms_output.put_line (' REM ');
           dbms_output.put_line('CREATE TEMPORARY TABLESPACE TEMP TEMPFILE ');
           dbms_output.put_line(' ''' || flrec.name || ''' SIZE ' || flrec.megs || 'M' );
           dbms_output.put_line (' extent management local uniform size ' || flrec.umegs || 'M ;');
           cnt :=1;
        else
           dbms_output.put_line('ALTER TABLESPACE temp  ADD TEMPFILE ');
           dbms_output.put_line(' ''' || flrec.name || ''' SIZE ' || flrec.megs || 'M ;');
        end if;
      end loop;
end;
/
spool off



