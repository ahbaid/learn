set verify off
define fileid=&&1

column c0 format a50 word_wrapped heading "file"

select name c0 from v$datafile where file# = &&fileid;
set verify on
