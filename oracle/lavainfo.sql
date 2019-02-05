-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/lavainfo.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

spool lavainfo

clear columns
clear breaks

column service_id format a20 word_wrapped
column storage_system_id format a20 word_wrapped
column storage_parameter format a20 word_wrapped
column storage_value format a40 word_wrapped

set lines 120
set pages 100

select service_id, 
       storage_system_id, 
       storage_parameter, 
       storage_value 
from STORAGE_ACCOUNT_INFO
order by storage_system_id, service_id;

spool off
