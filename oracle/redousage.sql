set lines 120

column module format A30 word_wrapped
column osuser format A12 word_wrapped
column redo format 999,999,999,999,990 heading "Redo(MB)"

select module, 
       s.sid as sid, 
       osuser, 
       sql_hash_value, 
       value/decode(nvl(sysdate - logon_time,1),0,1,sysdate - logon_time)/power(2,20) redo
from v$session s, v$sesstat ss, v$statname sn
where s.sid = ss.sid and
      ss.statistic# = sn.statistic#
      and sn.name = 'redo size'
      and s.serial# > 1
      and rownum <= 20
order by redo desc;
