set lines 132
comp sum of nfrags totsiz maxsiz avasiz on report
break on report

col tsname  format         a25 justify c heading 'Tablespace'
col nfrags  format     999,990 justify c heading 'Free|Frags'
col mxfrag  format 999,999,990 justify c heading 'Largest|Frag (KB)'
col totsiz  format 9,999,999,990 justify c heading 'Total|(KB)'
col maxsiz  format 999,999,990 justify c heading 'Maximum|(KB)'
col avasiz  format 999,999,990 justify c heading 'Available|(KB)'
col pctusd  format         990 justify c heading 'Pct|Used'

select
  total.tablespace_name                       tsname,
  count(free.bytes)                           nfrags,
  nvl(max(free.bytes)/1024,0)                 mxfrag,
  total.BYTES/1024                            totsiz,
  total.MAXBYTES/1024                         maxsiz,
  nvl(sum(free.bytes)/1024,0)                 avasiz,
  (1-nvl(sum(free.bytes),0)/total.BYTES)*100  pctusd
from
  aps_data_files  total,
  dba_free_space  free
where
  total.tablespace_name = free.tablespace_name(+)
group by
  total.tablespace_name,
  total.BYTES,
  total.MAXBYTES
order by 
  (1-nvl(sum(free.bytes),0)/total.BYTES)*100  
;
