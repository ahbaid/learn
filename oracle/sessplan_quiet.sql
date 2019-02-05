-- Author:		Ahbaid Gaffoor
-- File:		sessplan.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

define in_cursor_format='TYPICAL ROWS PEEKED_BINDS ALLSTATS'
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

set lines 150 pages 10000
select * from table (dbms_xplan.display_cursor('&&sess_sqlid',&&sess_child_number,'&&in_cursor_format'));
