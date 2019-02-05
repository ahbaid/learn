set verify off
set lines 1000
set pages 100

define in_statement_id=&&1
define in_explain_level='TYPICAL'

select * from table(dbms_xplan.display('PLAN_TABLE','&&in_statement_id','&&in_explain_level'));

set verify on
set lines 100
