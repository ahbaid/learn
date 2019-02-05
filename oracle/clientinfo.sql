undefine in_client_info
define in_client_info=&&1

set heading off
set feedback off
set verify off

column clientinfo heading "Client Info"

select 'SID: '||sid||chr(10)||
'Client: '||client_info||chr(10)||
'Module: '||module||chr(10)||
'Action: '||action as clientinfo
from v$session where client_info = '&&in_client_info';

set heading on
set feedback on
set verify on
