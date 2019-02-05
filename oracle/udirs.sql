select unique substr(file_name,1,instr(file_name,'/',1,2)-1) from dba_data_files
order by 1
/
