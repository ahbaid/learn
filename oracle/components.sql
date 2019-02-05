set serveroutput on size 400000
set lines 120
set pages 1000

clear columns
clear breaks


column c0 format A40 word_wrapped heading "Component"
column c1 format A20 word_wrapped heading "Version"
column c2 format A11 heading "Status"

select comp_name c0,
       version c1,
       status c2
from dba_registry;


