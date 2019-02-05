-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/oradebug.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

define in_sid=&&1
column spid new_value orapid noprint;

--
-- Get the Oracle server process id
--
set termout off
select spid from v$process p, v$session s
where p.addr = s.paddr and s.sid = &&in_sid;
set termout on

prompt
prompt Oracle SID &&in_sid has host process id &&orapid
prompt

/*
 level 1  - Base set, bind variables by name
 level 4  - Level 1 plus bind variable values
 level 8  - Level 1 plus wait info
 level 12 - Level 1, 4 and 8
*/

undefine in_trace_event
undefine in_trace_level
undefine in_trace_switch

-- oradebug event &&in_trace_event trace name context forever, level 12
-- oradebug event &&in_trace_event trace name context off
