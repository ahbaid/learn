define in_owner=&&1
define in_table=&&2


column c1 format A80 heading "Foreign Keys"

select OWNER||'-->'||TABLE_NAME||'.'||CONSTRAINT_NAME||'['||STATUS||']' as c1
from dba_constraints 
where CONSTRAINT_TYPE = 'R' and 
R_CONSTRAINT_NAME = (
  select constraint_name from dba_constraints
  where owner = upper('&&in_owner') and
        table_name = upper('&&in_table') and
        constraint_type = 'P'
) and owner = upper('&&in_owner');
