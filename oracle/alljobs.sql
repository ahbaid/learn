set lines 200
set pages 5000

column what format a30 word_wrapped 
column interval format A25

select sysdate from dual;

select job, schema_user, what, last_date, interval, next_date, broken, failures
from dba_jobs;
