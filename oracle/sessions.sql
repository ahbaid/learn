clear columns
clear breaks

set lines 80
set pages 1000
set feedback off
set verify off


set termout off

column get_repdate noprint new_value report_date;
column get_line noprint new_value report_line;
select to_char(sysdate,'Day ddth Mon, YYYY HH24:MI:SS') get_repdate from dual;
select rpad('=',58,'=') get_line from dual;

column instance_name noprint new_value instance
column host_name noprint new_value host
select instance_name, host_name from v$instance;

column file_name noprint new_value filename
select '$LOGDIR/sessions-&&instance-&&host-'||to_char(sysdate,'MMDDYY-HH24MISS')||'.log' as file_name from dual;

set termout on

--
-- PART 1: Session Count
--

spool &&filename

PROMPT
PROMPT Sessions on &&instance -> &&host : &&report_date 
PROMPT

PROMPT &&report_line
PROMPT Summary
PROMPT &&report_line

column c0 format A20 heading "User" word_wrapped
column c1 format 9,999 heading "Sessions"
column c2 format A10 heading "Type" word_wrapped

break on report skip 1
compute sum of c1 on report 


select nvl(username,'[BACKGROUND]') c0,
       count(*) c1,
       type c2
from v$session 
group by type, username
order by count(*), username;

--
-- PART 2: Breakdown by Program
--

clear columns
clear breaks

PROMPT &&report_line
PROMPT Programs
PROMPT &&report_line

column c0 format A20 heading "User" word_wrapped
column c1 format A30 heading "Program" word_wrapped
column c2 format 9,999 heading "Count"

break on report skip 1
compute sum of c2 on report

select nvl(username,'[BACKGROUND]') c0,
       program  c1,
       count(*) c2
from v$session
group by username, program
order by count(*), username, program;

--
-- PART 3: Breakdown by Machine
--

clear columns
clear breaks

PROMPT &&report_line
PROMPT Machines
PROMPT &&report_line

column c0 format A20 heading "User" word_wrapped
column c1 format A30 heading "Machine" word_wrapped
column c2 format 9,999 heading "Count"

break on report skip 1
compute sum of c2 on report

select nvl(username,'[BACKGROUND]') c0,
       machine c1,
       count(*) c2
from v$session
group by username, machine
order by count(*), username, machine;

set feedback on
set verify on

spool off
--quit
