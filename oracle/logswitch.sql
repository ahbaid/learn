undefine log_switches
define log_switches=&&1

declare
  i number;
  limit number;
begin

  dbms_application_info.set_client_info('logswitch');

  if (&&log_switches is null) then
     limit := 1;
  else
     limit := &&log_switches;
  end if;


  for i in 1..limit loop
      dbms_output.put_line('Log switch: '||to_char(i));
     dbms_application_info.set_module('Log switch',to_char(i));
     execute immediate 'alter system switch logfile';
     dbms_lock.sleep(5);
  end loop;

end;
/
