spool check_component_registry.log

select comp_name, version, status from dba_registry;

spool off
