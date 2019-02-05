select sysdate from dual;
exec dbms_system.set_sql_trace_in_session(&&1,&&2,TRUE);
