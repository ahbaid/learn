-- Author:              Ahbaid Gaffoor
-- File:                undo_usage
-- Date:                $Date$
-- Revision:            $Id$
-- Source:              $Source$
-- Use:

set lines 200
set pages 1000

set verify off

column c0 format 999999 heading "SID"
column c1 format A60 word_wrapped heading "Statistic"
column c2 format 999,999,999,990 heading "Value"

select st.sid c0, 
       --sn.name c1, 
       sum(st.value) c2
from v$sesstat st, v$statname sn
where sn.statistic# = st.statistic# and
      st.value > 0 and
      sn.name like '%undo%'
group by st.sid
order by 2,1;

set verify on

