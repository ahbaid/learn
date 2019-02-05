define in_sql_sid=&&1 

set verify off
set feedback off
set serveroutput on size 200000

declare

   cursor c_info(sql_sid number) is 
      select a.sql_text         psql,
             b.schemaname       schema, 
             b.osuser           osuser,
             b.machine          machine,
             b.terminal         terminal,
             to_char(b.sid)     sid,
             to_char(b.serial#) serial,
             b.program          program,
             b.logon_time       logon,
             c.spid             unixpid
      from v$sqltext a, 
           v$session b, 
           v$process c
      where a.address(+) = b.sql_address and 
            a.hash_value(+) = b.sql_hash_value and 
            b.paddr = c.addr and
            b.sid = sql_sid
      order by a.piece;

   first_row boolean := true;

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
               'sorts (disk)'
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

begin


   for info in c_info(&&in_sql_sid)
   loop

      if first_row then

         cr;
         line;
         print('SID, SERIAL#  : '||info.sid||','||info.serial);
         print('SCHEMA        : '||info.schema);
         print('OSUSER        : '||info.osuser);
         print('UNIXPID       : '||info.unixpid);
         print('MACHINE       : '||info.machine);
         print('TERMINAL      : '||info.terminal);
         print('PROGRAM       : '||info.program);
         print('LOGON         : '||to_char(info.logon,'Day MM/DD/YYYY HH24:MI:SS'));
         --cr;
         --print('KILLCMD       : ALTER SYSTEM KILL SESSION '''||info.sid||','||info.serial||''';');
         --cr;

         --print_session_statistics(info.sid);

         cr;
         first_row := false;

      end if;

      print(info.psql);
      

   end loop;

   line;
   cr;

end;
/

set verify on
set feedback on
