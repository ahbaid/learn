spool show_controlfiles.log
column name format A50 heading "File";

select status, name from v$controlfile;
spool off
