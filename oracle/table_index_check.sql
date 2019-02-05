define in_user_name=&&1
set lines 150
set pages 1000

column c0 format A30 word_wrapped heading "Table"
column c1 format 999,999.00 heading "MBytes"
column c2 format A30 word_wrapped heading "Index"
column c3 format 999,999.00 heading "MBytes"
column c4 format 99,990.00 heading "% Dev"     
column c5 format A20 heading "Analyzed"
column c6 format A20 heading "TSPC" word_wrapped

select s1.segment_name c0, 
       sum(s1.bytes)/power(2,20) c1, 
       s2.segment_name c2, 
       sum(s2.bytes)/power(2,20) c3,
       100-(sum(s2.bytes)/sum(s1.bytes)*100) c4,
       s2.tablespace_name c6,
       ndx.last_analyzed c5
from dba_segments s1,
     dba_segments s2,
     dba_indexes ndx
where s1.owner = s2.owner and
      s2.owner = ndx.owner and
      ndx.owner = upper('&&in_user_name') and
      s1.segment_name = ndx.table_name and
      s2.segment_name = ndx.index_name 
group by s1.segment_name, s2.segment_name, ndx.last_analyzed, s2.tablespace_name
having sum(s1.bytes) <= sum(s2.bytes) 
order by c3 asc
/
