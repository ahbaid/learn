-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/pqstats.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

column c0 format 9999 heading "Dfo"
column c1 format 999  heading "TQ"
column c2 format a12  heading "Server Type"
column c3 format 999,999,999,999,990 heading "Rows"
column c4 format 999,999,999,990 heading "MBytes"
column c5 format 999,999,990 heading "Waits"
column c6 format 9999 heading "Instance"
column c7 format a12  heading "PQ Slave"

select dfo_number c0, 
       tq_id c1, 
       server_type c2, 
       num_rows c3, 
       bytes/power(2,20) c4, 
       waits c5, 
       instance c6, 
       process c7
from v$pq_tqstat
order by 1,2,3,7,8;
