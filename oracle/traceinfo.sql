-- Author:              Ahbaid Gaffoor
-- File:                traceinfo.sql
-- Date:                Tuesday 29th January 2008

define in_sql_sid=&&1 

set verify off
set feedback off
set serveroutput on size 200000


declare

   -- {{{ cursor c_info(sql_sid number) 
   cursor c_info(sql_sid number) is 
      select b.schemaname       schema, 
             b.osuser           osuser,
             b.process          osprocess,
             b.machine          machine,
             b.terminal         terminal,
             to_char(b.sid)     sid,
             to_char(b.serial#) serial,
             b.program          program,
             b.logon_time       logon,
             c.spid             unixpid,
             b.status           status,
	     nvl(d.susage,0)    sort_mbytes,
	     b.sql_trace 	tracing,
	     b.sql_trace_waits  waits,
	     b.sql_trace_binds  binds
      from v$session b, 
           v$process c,
	   (select sum(blocks)/power(2,20)*(select value from v$parameter where name = 'db_block_size')  susage, 
                   session_addr from v$sort_usage 
            group by session_addr) d
      where b.paddr = c.addr and
            b.sid = sql_sid  and
            d.session_addr(+) = b.saddr;
   -- }}}

   info c_info%ROWTYPE;

   first_row boolean := true;

   dbsid varchar2(40) := null;

   trace_file varchar2(50) := null;
   tracing varchar2(20) := null;
   waits varchar2(20) := null;
   binds varchar2(20) := null;
   serial number := null;

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

   -- {{{ procedure print_longops(in_sid number)
   procedure print_longops(in_sid number) is

      cursor l_info(sql_sid number) is
         select start_time		start_time,
   	     last_update_time	last_update_time,
   	     time_remaining	time_remaining,
   	     elapsed_seconds	elapsed_seconds,
   	     sofar		sofar,
   	     totalwork		totalwork,
   	     units		units
         from v$session_longops lo
         where lo.sid = sql_sid;

      lops l_info%ROWTYPE;

   begin
      
      open l_info(in_sid);
      fetch l_info into lops;

         cr;
         print('Long Ops Info:');
         print('==============');
         print('Start Time: '||to_char(lops.start_time,'HH24:MI:SS MM/DD/YYYY'));
         print('Last Update: '||to_char(lops.last_update_time,'HH24:MI:SS MM/DD/YYYY'));
         print('Estimated time left: '||to_char(lops.time_remaining));
         print('So Far: '||to_char(lops.sofar));
         print('Total Work: '||to_char(lops.totalwork));
         print('Units: '||lops.units);
         cr;

      close l_info;

   end;
   -- }}}
   
   -- {{{ procedure print_session_statistics(in_sid number) 
   procedure print_session_statistics(in_sid number) is

      cursor c_stats(ora_sid number) is
         select e.name             statistic,
                d.value            statval
         from v$sesstat d,
              v$statname e
         where d.sid = ora_sid and
               e.statistic# = d.statistic# and
               e.name in (
               'CPU used by this session',
               'session uga memory',
               'session pga memory',
               'parse time cpu',
               'parse count (total)',
               'parse count (hard)',
               'execute count',
               'sorts (memory)',
               'sorts (disk)',
               'opened cursors cumulative',
               'opened cursors current'
               );


       procedure print_stat(in_stat varchar2,in_value varchar2) is
       begin
          print(rpad(in_stat||' ',50,'.')||' '||in_value);
       end;

   begin

      for sidstat in c_stats(in_sid) 
      loop
         print_stat(sidstat.statistic,sidstat.statval);
      end loop;

   end;
   -- }}}

begin

   select lower(instance_name) into dbsid from v$instance;

   open c_info(&&in_sql_sid);
      fetch c_info into info;

      if (c_info%FOUND) then
         serial := info.serial;
         trace_file := dbsid||'_ora_'||info.unixpid||'.trc';
         tracing := info.tracing;
         waits := info.waits;
         binds := info.binds;
      end if;

   close c_info;

   cr;
   if (trace_file is null) then
      print('No session with sid '||&&in_sql_sid||' found.');
   else
      print('[sid,serial] : ['||'&&in_sql_sid'||','||to_char(serial)||']');
      print('File         : '||trace_file);
      print('Tracing      : '||tracing);
      print('Waits        : '||waits);
      print('Binds        : '||binds);
   end if;
   cr;

end;
/

set verify on
set feedback on
