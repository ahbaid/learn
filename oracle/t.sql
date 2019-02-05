select tablespace_name, file_name, sum(bytes)/power(2,20) from dba_temp_files
group by file_name, tablespace_name
/
