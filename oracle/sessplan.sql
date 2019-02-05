-- Author:		Ahbaid Gaffoor
-- File:		sessplan.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

-- {{{ Cursor format documentation
set termout off
/*

dbms_xplan.display_cursor FORMAT parameter values
=================================================
BASIC 			: Display only the minimum set of information, i.e. the
          		: operation id, the operation name and its option

TYPICAL 		: This is the default. Display most information
           	        : of the explain plan (operation id, name and option,
          		: #rows, #bytes and optimizer cost). Pruning,
          		: parallel and predicate information are only
          		: displayed when applicable. Excludes only PROJECTION,
          		: ALIAS and REMOTE SQL information (see below).

ALL 			: Maximum user level, like typical with additional
                  	: information (PROJECTION, ALIAS and information about
                  	: REMOTE SQL if the operation is distributed).
			: Query block section
			: Predicate info
			: Column projection info

ADVANCED 		: Same as ALL, plus
			: Include Outline or hints to re-produce plan

OUTLINE 		: Include Outline or hints to re-produce plan
			: Predicate info

LAST 			: See stats for last execution
			: Show stats for last statement, [ (sql_id, cursor_child_no) -> (null,null) ]
			: Query needs to use /*+ gather_plan_statistics */
			: Starts - number of executions for a step
			: E-Rows - estimated rows
			: A-rows - actual rows

MEMSTATS 		: Show PGA stats if the PGA area is used for sorts, hashes etc.

IOSTATS 		: Show buffers and reads
			: Query needs to use /*+ gather_plan_statistics */
			: Buffers and Reads only show up for non-zero values

ALLSTATS      		: IOSTATS MEMSTATS shortcut

PEEKED_BINDS 		: Peek Bind Variables

ROWS 			: if relevant, shows number of rows estimated

BYTES 			: if relevant, shows number of bytes estimated

COST 			: if relevant, shows optimizer cost

PARTITION 		: If relevant, shows partition pruning

PARALLEL 		: If relevant, shows PX information
			: distribution method and table queue information

PREDICATE 		: If relevant, shows the predicate section

PROJECTION 		: If relevant, shows the projection section

ALIAS 			: If relevant, shows the Query Block Name / Object Alias

REMOTE 			: If relevant, shows the information for distributed query

NOTE 			: Note section



Copy the line needed below to define
------------------------------------
define in_cursor_format='ALL'
define in_cursor_format='ADVANCED'
define in_cursor_format='IOSTATS'
define in_cursor_format='MEMSTATS'
define in_cursor_format='PEEKED_BINDS'
define in_cursor_format='ALL'


Need to investigate ASH table usage:
------------------------------------
select * from table(
dbms_xplan.display('stats$sql_plan', null, 'all', 'hash_value=76725 and snap_id=245')
);


*/
set termout on
-- }}}
define in_cursor_format='TYPICAL ROWS PEEKED_BINDS ALLSTATS'


set verify off
set feedback off
set heading off
set serveroutput off

define in_sid=&&1

column sql_id       new_value sess_sqlid noprint;
column child_number new_value sess_child_number noprint;
column plan_table_output format a4000 word_wrapped heading "SQL"

column fulltext format a64 heading "FULL SQL" word_wrapped

set termout off
select sql_id, child_number from v$sql
where hash_value = (select sql_hash_value from v$session where sid=&&in_sid);
set termout on

set heading on
select sql_text as fulltext from v$sqltext where sql_id = '&&sess_sqlid' order by piece;
set heading off

set lines 150 pages 1000
select * from table (dbms_xplan.display_cursor('&&sess_sqlid',&&sess_child_number,'&&in_cursor_format'));

set verify on
set feedback on
set heading on
set serveroutput on

--@@sesslocks &&in_sid
