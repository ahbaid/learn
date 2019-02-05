set serveroutput on size 400000

define in_threshold=&&1

variable dbspi_error varchar2(100);
variable dbspi_threshold number;
variable dbspi_value number;

declare
      snapshot_objects number;
begin
      :dbspi_threshold := &&in_threshold;
      :dbspi_error := '<no error>';
      select count(*) into  snapshot_objects
      from dba_segments s,
           dba_snapshot_logs l,
           dba_segments s2
      where l.log_owner = s.owner and
            l.log_table = s.segment_name and
            s.bytes <= :dbspi_threshold*power(2,20) and
            s2.owner = l.log_owner and
            s2.segment_name = l.master;
      :dbspi_value := snapshot_objects;
exception
   when others then
      :dbspi_value := -1;
end;
/

select :dbspi_value from dual;
