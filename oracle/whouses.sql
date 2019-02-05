-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/whouses.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

define in_tablespace=&&1

column mb format 999,999,999,990 heading "MBytes"

select owner, sum(bytes)/power(2,20) mb 
from dba_segments
where tablespace_name = upper('&&in_tablespace')
group by owner
order by 2,1;
