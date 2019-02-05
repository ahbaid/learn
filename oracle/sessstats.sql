-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/sessstats.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

set lines 200
set pages 1000

set verify off

define in_sid=&&1
define in_match=&&2

column c0 format A60 word_wrapped heading "Statistic"
column c1 format 999,999,999,990 heading "Value"

select sn.name c0, st.value c1
from v$sesstat st, v$statname sn
where sn.statistic# = st.statistic# and
      st.sid = &&in_sid and sn.name like '%&&in_match%';

set verify on
