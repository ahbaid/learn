-- Author:		Ahbaid Gaffoor
-- File:		scn.sql
-- Use:			Get the current SCN

column c0 format 999999999999999999 heading "SCN"
column c1 heading "Time"

select 
   dbms_flashback.GET_SYSTEM_CHANGE_NUMBER as c0, 
   to_char(sysdate,'MM/DD/YYYY HH24:MI:SS') as c1
from dual;
