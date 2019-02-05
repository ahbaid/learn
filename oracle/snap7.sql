declare
  a number;
begin
  a := statspack.snap(7);
  dbms_output.put_line('Snap ['||to_char(a)||'] taken at '||to_char(sysdate,'MM/DD/YYYY HH24:MI:SS'));
end;
/
