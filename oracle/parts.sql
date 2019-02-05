-- Author:		Ahbaid Gaffoor
-- File:		parts.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

define in_owner=&&1
define in_table_name=&&2

set pages 100
set lines 200
set long 400000

column c0 format a30 heading "Partition"
column c1 format 999,999,999,999,990 heading "MBytes"

set verify off

select ds.partition_name c0, 
       sum(ds.bytes)/power(2,20) c1
from dba_segments ds
where segment_name = upper('&&in_table_name') and
      owner = upper('&&in_owner') and
      segment_type = 'TABLE PARTITION'
group by ds.partition_name
order by 1;

set verify on
