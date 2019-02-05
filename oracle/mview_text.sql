clear columns
clear breaks

set verify off

set pages 1000
set lines 120
set long 400000

define in_owner=&&1
define in_mview=&&2

set termout off
column myval new_value theading noprint;
select 'Materialized View: '||'&&in_owner'||'.'||'&&in_mview' as myval from dual;
set termout on

column q0 format A100 word_wrapped heading "&&theading"

select query q0
from dba_mviews 
where owner = upper('&&in_owner') and
      mview_name = upper('&&in_mview');

set verify on
