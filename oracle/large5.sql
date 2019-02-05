column owner format A15
column segment_type format A20
column segment_name format A30

select owner, segment_type, segment_name, sum(bytes)/power(2,20) MBytes
from dba_segments
where  owner = 'ERMDBA'
--owner <> 'SYS' and owner <> 'SYSTEM' and substr(owner,1,2) <> 'P_' and 
--rownum < 6
group by owner, segment_type, segment_name
order by 4 asc;
