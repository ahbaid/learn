declare

   cursor c1 is select owner, original_name as oname,
                       decode(type,'Table Partition','TABLE','Index Partition','INDEX',type) as type, 
                       count(*) as pcnt 
                from dba_recyclebin
                group by owner, original_name, decode(type,'Table Partition','TABLE','Index Partition','INDEX',type)
                order by 1,3,2;


   ddl varchar2(400);

   i number;

begin

   for c1var in c1 loop

      
      ddl := 'purge '||c1var.type||' '||c1var.owner||'.'||c1var.oname;

      dbms_output.put_line(rpad(c1var.type,35,'-')||'-> '||rpad(c1var.owner||'.'||c1var.oname,60)||'['||c1var.pcnt||']');

      for i in 1..c1var.pcnt loop
         begin
            execute immediate(ddl);
         exception
            when others then null;
         end;
      end loop;

   end loop;

end;
/
