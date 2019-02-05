-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/undospace.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

@@db_block_size
clear columns
clear breaks

set lines 200

column c0 format 999999 heading "SID"
column c1 format A12 heading "Schema"
column c2 format 999,999,999,990 heading "Space Mb"
column c3 format A50 heading "Host"
column c4 format A70 heading "Component"

break on report
compute sum of c2 on report;

select 
   s.sid as c0, 
   s.schemaname as c1,
   t.ubablk*to_number('&&db_block_size')/power(2,20) as c2,
   s.machine as c3,
   nvl(client_info,nvl(module,action)) as c4
from v$session s, v$transaction t
where s.taddr = t.addr
order by 3 asc;
