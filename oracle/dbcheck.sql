set lines 100

column c0 format A18 heading "Time"
column c1 format A10 heading "DB"
column c2 format A15 heading "Host"
column c3 format A10 heading "Version"
column c4 format A10 heading "Status"
column c5 format A10 heading "Logins"
column c6 format A15 heading "DB Status"
column c7 format A10 heading "Mode"

select to_char(sysdate,'MM/DD/YY HH24:MI:SS') c0,
       instance_name c1, 
       host_name c2, 
       version c3, 
       status c4, 
       logins c5, 
--       database_status c6,
       decode(controlfile_type,'CURRENT','Primary',controlfile_type) c7
from v$instance, v$database;
