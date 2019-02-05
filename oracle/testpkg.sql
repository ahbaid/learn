set termout off
drop table testpkg_table;
create table testpkg_table (strval varchar2(30));
set termout on
desc testpkg_table

create or replace package test as

    function sdate return date;

    procedure add_data(in_string varchar2);

end test;
/
show errors

create or replace package body test as

    function sdate return date is
    begin
       return sysdate;
    end sdate;

    procedure add_data(in_string varchar2) is
    begin
       insert into testpkg_table values (in_string);
    end add_data;

end test;
/
show errors

alter package test compile;
alter package test compile body;
alter package test compile specification;
