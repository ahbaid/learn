set pages 1000
set lines 150
column text format a100 word_wrapped

define owner=&&1
define name=&&2
define line_min=&&3
define line_max=&&4

select line, text from dba_source
where owner = upper('&&owner') and name = upper('&&name') and line between nvl(&&line_min,1) and &&line_max
order by line
/
