-- Author:		Ahbaid Gaffoor
-- File:		sysaux.sql
-- Date:		Sep 19th 2008
-- Use:			Use this script to manage all things related to SYSAUX

@@dbname

-- Doc {{{
set termout off
DOC
##################################################################

SQL> desc v$sysaux_occupants
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 OCCUPANT_NAME                                      VARCHAR2(64)
 OCCUPANT_DESC                                      VARCHAR2(64)
 SCHEMA_NAME                                        VARCHAR2(64)
 MOVE_PROCEDURE                                     VARCHAR2(64)
 MOVE_PROCEDURE_DESC                                VARCHAR2(64)
 SPACE_USAGE_KBYTES                                 NUMBER


##################################################################
#
set termout on
-- }}}


set feedback off
set verify off
set lines 200

declare

   cLINELENGTH constant number := 150;

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

-- {{{ function get_awr_retention return number
   function get_awr_retention return number is
   begin
      return dbms_stats.get_stats_history_retention;
   end get_awr_retention;
-- }}}

   -- {{{ procedure sysaux_occupants 
   procedure sysaux_occupants is
   
      cursor csysaux is 
         select occupant_name as ocn,
                occupant_desc as ocd,
                schema_name as schema,
                nvl(move_procedure,'NONE') as mp,
                move_procedure_desc as mpd,
                space_usage_kbytes/1024 as mb
         from v$sysaux_occupants
         order by 2,3;

   begin

       print('OCCUPANTS');
       print(rpad('-',cLINELENGTH,'-'));
       print(rpad('Occupant',46)||'Size'||' Description [Move Procedure]');
       print(rpad('-',cLINELENGTH,'-'));

       for c1var in csysaux 
       loop
          if (c1var.mp = 'NONE') then
             print(rpad(c1var.ocn||' ['||c1var.schema||'] ',40)||
                ' '||to_char(c1var.mb,'999,990')||'M '||c1var.ocd
             );
          else
             print(rpad(c1var.ocn||' ['||c1var.schema||'] ',40)||
                ' '||to_char(c1var.mb,'999,990')||'M '||rpad(c1var.ocd,55)||'[ '||c1var.mp||' ]'
             );
          end if;
       end loop;

       cr;

   end sysaux_occupants;
   -- }}}

   -- {{{ procedure sysaux_wri_segments
   procedure sysaux_wri_segments is
   
      cursor csysaux is 
         select segment_name as sname,
                segment_type as stype,
                sum(bytes)/power(2,20) as mb
         from dba_segments
         where  tablespace_name = 'SYSAUX' and 
                ( 
                  (segment_type='TABLE' and segment_name like 'WRI$_OPTSTAT%') or 
                  (segment_type='INDEX' and segment_name like '%OPT%')
                )
         group by segment_name, segment_type 
         order by segment_type, segment_name, 3;

   begin

       print('SEGMENTS');
       print(rpad('-',cLINELENGTH,'-'));
       print(rpad('Type',31)||rpad('Name',31)||' Size Mb');
       print(rpad('-',cLINELENGTH,'-'));

       for c1var in csysaux 
       loop
          print(rpad(c1var.stype,31)||rpad(c1var.sname,31)||to_char(c1var.mb,'999,990'));
       end loop;
       cr;

   end sysaux_wri_segments;
   -- }}}

-- {{{ procedure sysaux_settings
   procedure sysaux_settings is
   begin
       print('SETTINGS');
      line;
      print(rpad('AWR Retention',20)||' : '||get_awr_retention);
      cr;
   end sysaux_settings;
-- }}}

-- {{{ procedure header
   procedure header is
   begin
      cr;
      line;
      print('SYSAUX Information - &&dbname '||to_char(sysdate,'MM/DD/YYYY HH24:MI:SS'));
      line;
      cr;
   end header;
-- }}}

-- {{{ procedure footer
   procedure footer is
   begin
      print('HELP');
      line;
      print(rpad('Alter Retention',20)||' : '||'exec dbms_stats.alter_stats_history_retention(10);');
      print(rpad('Purge History',20)||' : '||'exec dbms_stats.purge_stats(sysdate-10);');
      print(rpad('SYSAUX Rebuild DDL',20)||' : @$SQL/sysaux_rebuild_ddl.sql');
      cr;
   end footer;
-- }}}

begin

   header;

   sysaux_occupants;
   sysaux_wri_segments;
   sysaux_settings;

   footer;

end;
/


set feedback on
set verify on
