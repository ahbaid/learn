clear breaks
clear columns

define in_ordering=&&1


column ctitle format A100 heading "Machine/DB"
select host_name||' / '||instance_name as ctitle from v$instance;

column c0 format A30 heading "File System"

column c1 format 999,999,990 heading "Phy Rds"
column c2 format 999,999,990 heading "Phy Wrts"
column c3 format 999,999,999,990 heading "Phy Blk Rds"
column c4 format 999,999,990 heading "Phy Blk Wrts"

column c5 format 999,999,990 heading "Rd|Time"
column c6 format 999,999,990 heading "Wrt|Time"
column c7 format 999,990 heading "AvgIO|Time"
column c8 format 999,990 heading "LstIO|Time"

column c9 format 99,990 heading "MinIO|Time"
column c10 format 99,990 heading "MaxIO|RTime"
column c11 format 99,999,990 heading "MaxIO|WTime"


set lines 160
set pages 1000

select substr(fn.file_name,1,instr(file_name,'/',1,4)-1) c0,
       sum(fs.phyrds) c1,
       sum(fs.phywrts) c2,
       sum(fs.phyblkrd) c3,
       sum(fs.phyblkwrt) c4,
       sum(fs.readtim) c5,
       sum(fs.writetim) c6,
       sum(fs.avgiotim) c7,
       sum(fs.lstiotim) c8,
       sum(fs.miniotim) c9,
       sum(fs.maxiortm) c10,
       sum(fs.maxiowtm) c11
from dba_data_files fn, v$filestat fs
where fn.file_id = fs.file#
group by substr(fn.file_name,1,instr(file_name,'/',1,4)-1)
order by &&in_ordering
/
