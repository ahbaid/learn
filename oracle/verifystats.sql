define in_owner=&&1
define in_tname=&&2

declare
   nrows number;
   nblocks number;
   avgrowlen number;
begin

   dbms_stats.get_table_stats(
      ownname => '&&in_owner',
      tabname => '&&in_tname',
      numrows => nrows,
      numblks => nblocks,
      avgrlen => avgrowlen
   );

   dbms_output.put_line(upper('&&in_owner'||'.'||'&&in_tname'));
   dbms_output.put_line('========================================================================');
   dbms_output.put_line('Number of rows     : '||to_char(nrows));
   dbms_output.put_line('Number of blocks   : '||to_char(nblocks));
   dbms_output.put_line('Average row length : '||to_char(avgrowlen));

end;
/
