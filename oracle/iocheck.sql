clear columns
clear breaks

set lines 200

column c0 format 99999 heading "File ID"
column c1 format a60 word_wrapped heading "Name"
column c2 format 999,999,999,990 heading "Physical Reads"
column c3 format 999,999,999,990 heading "Physical Writes"
column c4 format 999,999,999,990 heading "Physical Block Reads"
column c5 format 999,999,999,990 heading "Physical Block Writes"

select * from (
select df.file# c0, 
       df.name c1, 
       fs.phyrds c2, 
       fs.phywrts c3, 
       fs.phyblkrd c4, 
       fs.phyblkwrt c5
from v$datafile df, v$filestat fs
where df.file# = fs.file# 
order by 3,4 desc
) where rownum < 10;
