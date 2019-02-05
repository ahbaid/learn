set serveroutput on

declare

 freemem number;
 sharedpoolsize number;

begin

   select bytes into freemem from v$sgastat 
   where pool = 'shared pool' and name = 'free memory';

   select value into sharedpoolsize from v$parameter
   where name = 'shared_pool_size';

   dbms_output.enable;
   dbms_output.put_line('Shared Pool Free Memory');
   dbms_output.put_line('=======================');
   dbms_output.put_line('Shared Pool Size: '||to_char(sharedpoolsize));
   dbms_output.put_line('Free Shared Pool Memory: '||to_char(freemem));
   dbms_output.put_line('Used Shared Pool Memory: '||to_char(sharedpoolsize-freemem));
   dbms_output.put_line('Percentage free: '||to_char(round(freemem/sharedpoolsize*100,2)));

end;
/
