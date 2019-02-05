-- Author:		Ahbaid Gaffoor
-- Date:		Monday 31st Jan 2005
-- File:		analyze_check.sql
-- Usage:		Check Analyze status of objects

set serveroutput on size 400000
set pages 1000
set lines 130


declare

   cursor c_ana is
          select owner, trunc(last_analyzed) last_analyzed, count(*) analyzed_count
          from dba_tables
          group by owner, trunc(last_analyzed);

   cursor c_iana is
          select owner, trunc(last_analyzed) last_analyzed, count(*) analyzed_count
          from dba_indexes
          group by owner, trunc(last_analyzed);

   cursor c_qana is
          select a.owner qown, a.queue_table qtab, b.last_analyzed last_analyzed
          from dba_queue_tables a, dba_tables b
          where a.owner = b.owner and a.queue_table = b.table_name and
                b.last_analyzed is not null;


   LINELENGTH constant number := 80;
   LINECHAR constant char(1) := '=';
   Qfound boolean := false;

   procedure print(s varchar2) is 
   begin
      dbms_output.put_line(s);
   end print;

   procedure CR is
   begin
      print(chr(11));
   end CR;

   procedure Line (lchar varchar2 := LINECHAR) is
   begin
      print(rpad(lchar,LINELENGTH,lchar));
   end Line;

   function dbinfo return varchar2 is 
     s varchar2(100);
   begin
     select host_name||'::'||instance_name into s from v$instance;
     return s;
   end dbinfo;


begin

   CR;
   Line;
   print('Analyze Job Check on '||sysdate||' - Database '||dbinfo);
   Line;
   CR;

   print('TABLES');
   print('======');

   for canav in c_ana loop
       if ( canav.last_analyzed is null) then
          print(rpad(canav.owner,31,' ')||rpad(canav.analyzed_count,10,' ')||' unanalyzed');
       else
          print(rpad(canav.owner,31,' ')||rpad(canav.analyzed_count,10,' ')||' last analyzed '||canav.last_analyzed);
       end if;
   end loop;
  

   CR;
   print('Queue tables which have been analyzed');
   print('=====================================');
   
   for cqanav in c_qana loop
      print(cqanav.qown||'.'||cqanav.qtab||' last analyzed: '||cqanav.last_analyzed);
      Qfound := true;
   end loop;

   if Qfound then
      CR;
      print('Please have staistics deleted from the queues listed.');
   else
      print('No queues found with statistics.....');
   end if;

   CR;
   print('INDEXES');
   print('=======');

   for cianav in c_iana loop
       if ( cianav.last_analyzed is null) then
          print(rpad(cianav.owner,31,' ')||rpad(cianav.analyzed_count,10,' ')||' unanalyzed');
       else
          print(rpad(cianav.owner,31,' ')||rpad(cianav.analyzed_count,10,' ')||' last analyzed '||cianav.last_analyzed);
       end if;
   end loop;
   
   CR;
   Line;
   CR;

end;
/
