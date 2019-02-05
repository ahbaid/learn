column prop format a100 heading "Property"

define in_property_name=&&1

set verify off
select property_name||': '||property_value as prop from database_properties where property_name like upper('&&in_property_name'||'%');
set verify on
