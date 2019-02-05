declare

    file_path varchar2(50) := '/tmp';
    file_name varchar2(20) := 'oracle_test.log';
    file_mode varchar2(1) := 'W';
    file_handle utl_file.file_type;

    strbuffer varchar2(100) := 'Some sample text';

begin

    file_handle := utl_file.fopen(file_path,file_name,file_mode);
    utl_file.put_line(file_handle,strbuffer);
    utl_file.fclose(file_handle);

exception
   when others then
      begin
         dbms_output.put_line('Errors');
         utl_file.fclose_all;
      end;
end;
/
