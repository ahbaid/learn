-- Author:		Ahbaid Gaffoor
-- File:		remove_cpu_quantums.sql
-- Use:		

spool remove_cpu_quantums
set echo on timing on


alter system set resource_manager_plan='' scope=both;

declare
    cursor cplans is select WINDOW_NAME from DBA_SCHEDULER_WINDOWS;
begin

    for win in cplans loop
       dbms_output.put_line('Updating Window: '||win.window_name);
       dbms_scheduler.set_attribute(win.window_name,'RESOURCE_PLAN','');
    end loop;

    dbms_scheduler.set_attribute('WEEKNIGHT_WINDOW','RESOURCE_PLAN','');
    dbms_scheduler.set_attribute('WEEKEND_WINDOW','RESOURCE_PLAN','');

    commit;

end;
/

set echo off timing off
spool off
