--
-- 2004-09-09/18:09:44 sample of FIRST_LOAD_TIME
--

clear columns
clear breaks

set lines 150
set pages 1000
set verify on

PROMPT ========================================================
PROMPT @sqlpiece <in_sql_pos> <in_order_by> <in_sql_piece>
PROMPT > in_sql_pos : SQL_TEXT cut point
PROMPT > in_order_by : Order by 
PROMPT >               c0 "SQL Piece"" 
PROMPT >               c1 "Full SQL"
PROMPT >               c2 "Executions"
PROMPT >               c3 "Parse|Calls"
PROMPT >               c4 "Version|Count"
PROMPT >               c5 "Loaded|Versions"
PROMPT >               c6 "Users|Opening"
PROMPT >               c7 "First Load|Time"
PROMPT >               c8 "Duration"
PROMPT ========================================================

PROMPT
accept continue prompt "Enter to continue...."
PROMPT

define in_sql_pos=&&1
define in_order_by=&&2
define in_sql_piece='&&3'


column runtime format A20 heading "sqlpiece run:"
select to_char(sysdate,'YYYY-MM-DD/HH24:MI:SS') as runtime from dual;

column c0 format A30 heading "SQL Piece" word_wrapped
column c1 format A30 heading "Full SQL" word_wrapped
column c2 format 999,999 heading "Executions"
column c3 format 999,999 heading "Parse|Calls"
column c4 format 999,999 heading "Version|Count"
column c5 format 999,999 heading "Loaded|Versions"
column c6 format 999,999 heading "Users|Opening"
column c7 format A20 heading "First Load|Time"
column c8 heading "Duration"

select '&&in_sql_piece' c0,
       sql_text c1,
       executions c2,
       parse_calls c3,
       version_count c4,
       loaded_versions c5,
       users_opening c6,
       first_load_time c7,
       sysdate-to_date(first_load_time,'YYYY-MM-DD/HH24:MI:SS') c8
from v$sqlarea
where substr(sql_text,1,&&in_sql_pos) like '&&in_sql_piece%'
order by &&in_order_by
/
