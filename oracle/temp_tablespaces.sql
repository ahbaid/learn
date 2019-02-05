select tablespace_name, sum(bytes)/power(2,20) as MB from dba_temp_files group by tablespace_name
/
