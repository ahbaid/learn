-- Author:		Ahbaid Gaffoor
-- File:		filespread.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

set pages 100

undefine in_match_fs
define in_match_fs=&&1

column d format A15 heading "FileSystem"
column c format 999 heading "Files"
column MB format 999,999,990 heading "MBytes"

select tablespace_name, substr(file_name,1,9) as d, count(*) as c, sum(bytes)/power(2,20) as MB  from dba_data_files
where tablespace_name like upper('&&in_match_fs%')
group by tablespace_name, substr(file_name,1,9)
order by 1,2,3;
