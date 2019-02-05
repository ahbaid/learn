-- Author:		Ahbaid Gaffoor
-- File:		fsfo_check.sql
-- Date:		$Date$
-- Revision:		$Revision$
-- Use:			Check FSFO status
-- Reference: 		Metlaink DocID 359555.1 (10gR2 FSFO Setup)

set pages 1000 feedback off

declare

  cursor cdb is
     select FORCE_LOGGING, PROTECTION_MODE, PROTECTION_LEVEL, FLASHBACK_ON, DB_UNIQUE_NAME, SWITCHOVER_STATUS,
            FS_FAILOVER_STATUS, FS_FAILOVER_CURRENT_TARGET, FS_FAILOVER_THRESHOLD, 
            FS_FAILOVER_OBSERVER_PRESENT, FS_FAILOVER_OBSERVER_HOST,
            decode(controlfile_type,'CURRENT','PRIMARY DATABASE','STANDBY','STANDBY DATABASE',controlfile_type) as CONTROLFILE_TYPE
     from v$database;

  cursor cdbi is
     select INSTANCE_NUMBER, upper(INSTANCE_NAME) as INSTANCE_NAME, HOST_NAME, VERSION, STARTUP_TIME, STATUS, PARALLEL,
            THREAD#, ARCHIVER, LOG_SWITCH_WAIT, LOGINS, SHUTDOWN_PENDING, DATABASE_STATUS, INSTANCE_ROLE,
            ACTIVE_STATE, BLOCKED
     from v$instance;


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

  -- {{{ v$instance cdbi
  for db in cdbi loop
     cr;
     print(rpad('Fast Start Failover Status ',31)||': '||db.INSTANCE_NAME);
     line(80);
     print(rpad('HOST_NAME',31)||': '||db.HOST_NAME);
     print(rpad('INSTANCE_ROLE',31)||': '||db.INSTANCE_ROLE);
     print(rpad('DATABASE_STATUS',31)||': '||db.DATABASE_STATUS);
  end loop;
  -- }}}
  -- {{{ v$database cdb
  for db in cdb loop
     print(rpad('DB_UNIQUE_NAME',31)||': '||db.DB_UNIQUE_NAME);
     print(rpad('CONTROLFILE_TYPE',31)||': '||db.CONTROLFILE_TYPE);
     print(rpad('SWITCHOVER_STATUS',31)||': '||db.SWITCHOVER_STATUS);
     print(rpad('FORCE_LOGGING',31)||': '||db.FORCE_LOGGING);
     print(rpad('PROTECTION_MODE',31)||': '||db.PROTECTION_MODE);
     print(rpad('PROTECTION_LEVEL',31)||': '||db.PROTECTION_LEVEL);
     print(rpad('FLASHBACK_ON',31)||': '||db.FLASHBACK_ON);
     print(rpad('FS_FAILOVER_STATUS',31)||': '||db.FS_FAILOVER_STATUS);
     print(rpad('FS_FAILOVER_OBSERVER_HOST',31)||': '||db.FS_FAILOVER_OBSERVER_HOST);
     print(rpad('FS_FAILOVER_CURRENT_TARGET',31)||': '||db.FS_FAILOVER_CURRENT_TARGET);
     print(rpad('FS_FAILOVER_THRESHOLD',31)||': '||db.FS_FAILOVER_THRESHOLD);
     print(rpad('FS_FAILOVER_OBSERVER_PRESENT',31)||': '||db.FS_FAILOVER_OBSERVER_PRESENT);
     cr;
  end loop;
  -- }}}

  

end;
/

set feedback on
