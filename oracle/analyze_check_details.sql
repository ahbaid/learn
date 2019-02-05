-- Author:		Ahbaid Gaffoor
-- Date:		Monday 31st Jan 2005
-- File:		analyze_check_details.sql
-- Usage:		Check Analyze status of objects for a given owner and date

set serveroutput on size 400000
set pages 1000
set lines 130
set verify off

define in_owner=&&1
define in_date=&&2

declare

   cursor c_ana is
          select owner, trunc(last_analyzed) last_analyzed, table_name
          from dba_tables
          where owner = upper('&&in_owner') and
                trunc(last_analyzed)<to_date('&&in_date','DD-MON-YYYY');

   cursor c_iana is
          select owner, trunc(last_analyzed) last_analyzed, index_name
          from dba_indexes
          where owner = upper('&&in_owner') and
                trunc(last_analyzed)<to_date('&&in_date','DD-MON-YYYY');


   LINELENGTH constant number := 80;
   LINECHAR constant char(1) := '=';

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
   print('Analyze Job Details for &&in_owner on '||to_date('&&in_date','DD-MON-YYYY')||' - Database '||dbinfo);
   Line;
   CR;

   print('TABLES');
   print('======');

   for canav in c_ana loop
      print(rpad(canav.owner||'.'||canav.table_name,61,' ')||canav.last_analyzed);
   end loop;

   CR;
   print('INDEXES');
   print('=======');

   for cianav in c_iana loop
      print(rpad(cianav.owner||'.'||cianav.index_name,61,' ')||cianav.last_analyzed);
   end loop;

end;
/
