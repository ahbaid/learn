-- Author:		Ahbaid Gaffoor
-- File:		alter_sched_window_duration.sql
-- Date:		Thursday 28th May 2009
-- Use:		

define in_window_name=&&1
define in_minutes=&&2

@sched_window &&in_window_name

begin

   BEGIN
      dbms_output.put_line('Disabling window....');
      DBMS_SCHEDULER.DISABLE(name=>upper('&&in_window_name'), force=>TRUE);
   END;
   
   BEGIN
      dbms_output.put_line('Altering window....');
      DBMS_SCHEDULER.SET_ATTRIBUTE(
         name=>upper('&&in_window_name'),
         attribute=>'DURATION',
         value=>numtodsinterval(&&in_minutes, 'minute')
      );
   END;
   
   BEGIN
      dbms_output.put_line('Enabling window....');
      DBMS_SCHEDULER.ENABLE(name=>upper('&&in_window_name'));
   END; 

end;
/

@sched_window &&in_window_name
