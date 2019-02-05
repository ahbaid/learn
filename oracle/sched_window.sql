-- Author:		Ahbaid Gaffoor
-- File:		sched_window.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:		

set termout off lines 120 pages 1000 feedback off verify off
-- {{{ DBA_SCHEDULER_WINDOWS
/*
SQL> desc DBA_SCHEDULER_WINDOWS
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 WINDOW_NAME                               NOT NULL VARCHAR2(30)
 RESOURCE_PLAN                                      VARCHAR2(30)
 SCHEDULE_OWNER                                     VARCHAR2(4000)
 SCHEDULE_NAME                                      VARCHAR2(4000)
 SCHEDULE_TYPE                                      VARCHAR2(8)
 START_DATE                                         TIMESTAMP(6) WITH TIME ZONE
 REPEAT_INTERVAL                                    VARCHAR2(4000)
 END_DATE                                           TIMESTAMP(6) WITH TIME ZONE
 DURATION                                           INTERVAL DAY(3) TO SECOND(0)
 WINDOW_PRIORITY                                    VARCHAR2(4)
 NEXT_START_DATE                                    TIMESTAMP(6) WITH TIME ZONE
 LAST_START_DATE                                    TIMESTAMP(6) WITH TIME ZONE
 ENABLED                                            VARCHAR2(5)
 ACTIVE                                             VARCHAR2(5)
 MANUAL_OPEN_TIME                                   TIMESTAMP(6) WITH TIME ZONE
 MANUAL_DURATION                                    INTERVAL DAY(3) TO SECOND(0)
 COMMENTS                                           VARCHAR2(240)
*/
-- }}}
set termout on 

define in_window_name=&&1

declare

  cursor csw is
     select 
         WINDOW_NAME, RESOURCE_PLAN, SCHEDULE_OWNER, SCHEDULE_NAME, SCHEDULE_TYPE,
         START_DATE, REPEAT_INTERVAL, END_DATE, DURATION,
         WINDOW_PRIORITY,
         NEXT_START_DATE, LAST_START_DATE,
         ENABLED, ACTIVE,
         MANUAL_OPEN_TIME, MANUAL_DURATION,
         COMMENTS
     from dba_scheduler_windows 
     where lower(window_name) like '%'||lower('&&in_window_name')||'%';

  -- {{{ Print Procedures

  procedure print(s varchar2) is
  begin
     dbms_output.put_line(s);
  end print;

  procedure cr is 
  begin
     print(chr(10));
  end cr;

  procedure line(l number := 60, c varchar2 := '=') is
  begin
     print(rpad(c,l,c));
  end line;

  -- }}}

begin

  for win in csw loop

     cr;
     print('Window: '||win.WINDOW_NAME);
     line;
     print(rpad('RESOURCE_PLAN',31)||': '||win.RESOURCE_PLAN);
     print(rpad('SCHEDULE_OWNER',31)||': '||win.SCHEDULE_OWNER);
     print(rpad('SCHEDULE_NAME',31)||': '||win.SCHEDULE_NAME);
     print(rpad('SCHEDULE_TYPE',31)||': '||win.SCHEDULE_TYPE);
     print(rpad('START_DATE',31)||': '||win.START_DATE);
     print(rpad('REPEAT_INTERVAL',31)||': '||win.REPEAT_INTERVAL);
     print(rpad('END_DATE',31)||': '||win.END_DATE);
     print(rpad('DURATION',31)||': '||win.DURATION);
     print(rpad('WINDOW_PRIORITY',31)||': '||win.WINDOW_PRIORITY);
     print(rpad('NEXT_START_DATE',31)||': '||win.NEXT_START_DATE);
     print(rpad('LAST_START_DATE',31)||': '||win.LAST_START_DATE);
     print(rpad('ENABLED',31)||': '||win.ENABLED);
     print(rpad('ACTIVE',31)||': '||win.ACTIVE);
     print(rpad('MANUAL_OPEN_TIME',31)||': '||win.MANUAL_OPEN_TIME);
     print(rpad('MANUAL_DURATION',31)||': '||win.MANUAL_DURATION);
     print(rpad('COMMENTS',31)||': '||win.COMMENTS);

  end loop;
  cr;

end;
/

set feedback on
