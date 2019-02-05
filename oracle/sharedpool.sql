-- Author: Ahbaid Gaffoor
-- Date:   Sep 19 2003
-- Use:    Show shared pool usage
--

set serveroutput on size 400000

declare
   cursor c_shpool is
      select value from v$parameter where name = 'shared_pool_size';
   cursor c_shpool_used is
      select bytes from v$sgastat where pool = 'shared pool' and name = 'free memory';
   sharedpool number;
   sharedpool_used number;
   sharedpool_free number;
begin
   open c_shpool;
      fetch c_shpool into sharedpool;
   close c_shpool;
   --
   open c_shpool_used;
      fetch c_shpool_used into sharedpool_used;
   close c_shpool_used;
   --
   sharedpool_free := sharedpool - sharedpool_used;
   --
   dbms_output.put_line('Shared Pool Usage: '||to_char(sysdate,'DD-MON-YYYY HH24:MI:SS'));
   dbms_output.put_line(lpad('-',50,'-'));
   dbms_output.put_line('Allocated: '||to_char(sharedpool/power(2,20),'999,990')||' MBytes');
   dbms_output.put_line('Used:      '||to_char(sharedpool_used/power(2,20),'999,990')||' MBytes');
   dbms_output.put_line('Free:      '||to_char(sharedpool_free/power(2,20),'999,990')||' MBytes');
end;
/
