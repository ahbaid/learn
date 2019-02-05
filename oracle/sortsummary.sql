define in_percentage_threshold=&&1

column s format A20 word_wrapped heading "Schema"
column m format A40 word_wrapped heading "Machine"
column p format 990.00 heading "Pct|Used"

select 
s.sid, s.schemaname s, s.machine m, tmp_name, sum(u.blocks)/f.tmp_size*100 p
--nvl(max(sum(u.blocks)/f.tmp_size*100),0) p
from v$sort_usage u,
     (select tablespace_name tmp_name,sum(blocks) tmp_size
      from dba_temp_files
      group by tablespace_name) f,
      v$session s
where u.tablespace=f.tmp_name and s.saddr = u.session_addr
group by s.sid, s.schemaname, s.machine, f.tmp_size, tmp_name
having nvl(sum(u.blocks)/f.tmp_size*100,0) > &&in_percentage_threshold
/
