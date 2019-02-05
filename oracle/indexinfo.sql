define in_owner=&&1 
define in_index=&&2

set verify off
set feedback off
set serveroutput on size 200000

declare

   -- {{{ cursor c_index_info
   cursor c_index_info is
   select BLEVEL, 
          LEAF_BLOCKS, 
          DISTINCT_KEYS, 
          AVG_LEAF_BLOCKS_PER_KEY, 
          AVG_DATA_BLOCKS_PER_KEY, 
          CLUSTERING_FACTOR, 
          NUM_ROWS, 
          DEGREE, 
          PARTITIONED
   from dba_indexes
   where owner = upper('&&in_owner') and index_name = upper('&&in_index');
   -- }}}

   -- {{{ cursor c_index_space
   cursor c_index_space is
   select sum(BYTES)/power(2,20) as MBYTES, 
          count(BLOCKS) as BLOCKS, 
          count(EXTENTS) as EXTENTS
   from dba_segments
   where owner = upper('&&in_owner') and segment_name = upper('&&in_index');
   -- }}}

   dbsid varchar2(40) := null;

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

   cr;
   print(upper(dbsid)||' '||to_char(sysdate,'MM/DD/YY HH24:MI:SS')||' -> '||upper('&&in_owner')||'.'||upper('&&in_index'));
   line;

   -- {{{ Index Info
   for info in c_index_info
   loop

      print('BLEVEL                  : '||info.BLEVEL);
      print('LEAF_BLOCKS             : '||info.LEAF_BLOCKS);
      print('DISTINCT_KEYS           : '||info.DISTINCT_KEYS);
      print('AVG_LEAF_BLOCKS_PER_KEY : '||info.AVG_LEAF_BLOCKS_PER_KEY);
      print('AVG_DATA_BLOCKS_PER_KEY : '||info.AVG_DATA_BLOCKS_PER_KEY);
      print('CLUSTERING_FACTOR       : '||info.CLUSTERING_FACTOR);
      print('NUM_ROWS                : '||info.NUM_ROWS);
      print('DEGREE                  : '||info.DEGREE);
      print('PARTITIONED             : '||info.PARTITIONED);

   end loop;
   -- }}}

   -- {{{ Index Space
   for info in c_index_space
   loop

      print('MBYTES                  : '||info.MBYTES);
      print('BLOCKS                  : '||info.BLOCKS);
      print('EXTENTS                 : '||info.EXTENTS);

   end loop;
   -- }}}

   cr;

end;
/

set verify on
set feedback on
