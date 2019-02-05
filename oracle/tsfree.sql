-- Author:		Ahbaid Gaffoor
-- File:		tsfree.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

define in_tablespace=&&1
defin sorder=&&2

clear columns
column fid format 9999 heading "File"
column mb format 999999999990 heading "Max Segment(Mb)"
column fn format A60 heading "Filename"
column dfmb format 999999999990 heading "File Size (Mb)"
column delta format 999999999990 heading "New Size (Mb)"

set lines 150
set pages 1000

select fs.file_id fid, 
       max(fs.bytes/power(2,20)) mb, 
       df.file_name fn, 
       df.bytes/power(2,20) as dfmb,
       df.bytes/power(2,20)- max(fs.bytes/power(2,20)) as delta
from dba_free_space fs, dba_data_files df
where df.file_id = fs.file_id and
 fs.tablespace_name = upper('&&in_tablespace')
group by fs.file_id, df.file_name, df.bytes/power(2,20)
order by &&sorder;
