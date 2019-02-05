define in_index_owner=&&1
define in_index_name=&&2

set verify off
set feedback off
set serveroutput on size 200000

declare

   -- {{{ cursor c_info(cowner varchar2, cindex varchar2) 
   cursor c_info(cowner varchar2, cindex varchar2) is
      select  
	degree, 
	blevel, 
	leaf_blocks, 
	distinct_keys, 
	avg_leaf_blocks_per_key, 
	avg_data_blocks_per_key, 
	clustering_factor, 
	status, 
	num_rows
      from dba_indexes
      where owner = upper(cowner) and index_name = upper(cindex);
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

begin

   select lower(instance_name) into dbsid from v$instance;

   for info in c_info('&&in_index_owner', '&&in_index_name')
   loop

      cr;
      print('Index Info for: '||upper('&&in_index_owner')||'.'||upper('&&in_index_name')||' on '||upper(dbsid)||' at '||to_char(sysdate,'HH24:MI:SS MM/DD/YYYY'));
      line;
      print('STATUS                  : '||info.status);
      print('DEGREE                  : '||info.degree);
      print('LEAF_BLOCKS             : '||info.leaf_blocks);
      print('DISTINCT_KEYS           : '||info.distinct_keys);
      print('AVG_LEAF_BLOCKS_PER_KEY : '||info.avg_leaf_blocks_per_key);
      print('AVG_DATA_BLOCKS_PER_KEY : '||info.avg_data_blocks_per_key);
      print('CLUSTERING_FACTOR       : '||info.clustering_factor);
      print('NUM_ROWS                : '||info.num_rows);
      line;
      cr;

   end loop;

end;
/

set verify on
set feedback on
