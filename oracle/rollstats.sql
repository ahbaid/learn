set pages 100

clear columns
clear breaks
break on report skip 1

compute sum of c2 on report
compute sum of c3 on report

column c0 format 999 heading "USN"
column c1 format A12 word_wrapped heading "Segment"
column c2 format 999,999,990 heading "Gets"
column c3 format 999,999,990 heading "Waits"
column c4 format 0.00 heading "Miss|Ratio"

select a.usn c0, a.name c1, b.gets c2, b.waits c3, b.waits/b.gets c4
from v$rollname a, v$rollstat b
where a.usn = b.usn
/
