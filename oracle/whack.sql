create or replace view sys.echelon_session_wait 
as
select * from v$session_wait
where event not like 'enq: TX%';

create or replace synonym dosql.v$session_wait for sys.echelon_session_wait;
