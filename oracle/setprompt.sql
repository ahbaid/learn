define _editor=vim
set serveroutput on size 400000
set lines 200

set termout off
alter session set nls_date_format = 'DD-MON-YYYY HH24:MI:SS';
column iam new_value myprompt noprint;
select USER||'@'||upper(instance_name)||'['||decode(controlfile_type,'CURRENT','PRI','STANDBY','SBY',controlfile_type)||']'||'-'
       ||(select distinct sid from v$mystat)||'['||version||']:SQL> '  as iam 
from v$instance, v$database;
set sqlprompt "&&myprompt"

variable debug number
exec :debug := 0;

set termout on

@debug off
