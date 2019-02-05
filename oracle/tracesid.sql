-- Author:		Ahbaid Gaffoor
-- File:		tracesid.sql
-- Date:		Tuesday 29th January 2008

define in_sql_sid=&&1 
define in_event=&&2
define in_level=&&3

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
             sql_trace          tracing,
             b.program          program,
             b.logon_time       logon,
             c.spid             unixpid,
             b.status           status,
	     nvl(d.susage,0)    sort_mbytes
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
   serial number;
   tracing varchar2(8) := null;

   e_invalid_sid exception;
   e_invalid_event exception;
   e_invalid_level exception;

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

   -- {{{ procedure print_events
   procedure print_events is
   begin
      cr;
      print('List of supported trace events:');
      line;
      print('10046 - Extended trace');
      print('10053 - Plan trace');
      cr;
   end;
   -- }}}
   -- {{{ procedure print_levels
   procedure print_levels is
   begin
      cr;
      print('List of supported trace levels:');
      line;
      print('0 - Disable tracing');
      print('1 - Basic: parse,exec,fetch,commit,rollback [sql_trace=true]');
      print('4 - 1 + Bind Variables');
      print('8 - 1 + Wait Statistics');
      print('12 - 1 + Bind Variables + Wait Statistics');
      cr;
   end;
   -- }}}
   -- {{{ function supported_event(in_event varchar2) return boolean 
   function supported_event(in_event varchar2) return boolean is
   begin
      if (instr('10046,10053',rtrim(ltrim(in_event)))<>0) then
         return true;
      else
         return false;
      end if;
   end;
   -- }}}
   -- {{{ function supported_level(in_level varchar2) return boolean 
   function supported_level(in_level varchar2) return boolean is
   begin
      if (instr('00,01,04,08,12','0'||rtrim(ltrim(in_level)))<>0) then
         return true;
      else
         return false;
      end if;
   end;
   -- }}}

begin

   select lower(instance_name) into dbsid from v$instance;

   -- {{{ Check for session and Get file info
   open c_info(&&in_sql_sid);
      fetch c_info into info;

      if (c_info%FOUND) then
         trace_file := dbsid||'_ora_'||info.unixpid||'.trc';
         serial := to_number(info.serial);
         tracing := info.tracing;
      end if;

   close c_info;
   -- }}}
   -- {{{ Validate SID
   if (trace_file is null) then
      raise e_invalid_sid;
   end if;
   -- }}}
   -- {{{ Validate Event
   if (not supported_event('&&in_event')) then
      raise e_invalid_event;
   end if;
   -- }}}
   -- {{{ Validate Level
   if (not supported_level('&&in_level')) then
      raise e_invalid_level;
   end if;
   -- }}}

   begin

      cr;

      if (tracing = 'ENABLED') then
         print('NOTE: Tracing was already enabled for this session');
      end if;

         dbms_system.set_ev(si=>to_number('&&in_sql_sid'), 
                            se=>serial, 
                            ev=>to_number('&&in_event'),
                            le=>to_number('&&in_level'),
                            nm=>''
                           );
/* DEBUG
print('si: &&in_sql_sid');
print('se: '||to_char(serial));
print('ev: &&in_event');
print('le: &&in_level');
*/

      print('[&&in_sql_sid,'||to_char(serial)||'] trace file is: '||trace_file);
      cr;

   end;

exception
   -- {{{ e_invalid_sid
   when e_invalid_sid then begin
           cr;
           print('No session with sid '||&&in_sql_sid||' found.');
           cr;
        end;
   -- }}}
   -- {{{ e_invalid_event
   when e_invalid_event then print_events;
   -- }}}
   -- {{{ e_invalid_level
   when e_invalid_level then print_levels;
   -- }}}
end;
/

set verify on
set feedback on
