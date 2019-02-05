-- Author:	Ahbaid Gaffoor
-- Date:	Tuesday 21st September 2004
-- Usage:	@movedb.sql
-- Pre-reqs:	Oracle environment needs to be setup
--
-- Purpose:	Create a shell script to move a cold database 
-- 		from one machine to another

clear columns
clear breaks
set pages 10000
set lines 200

set heading off
set verify off
set feedback off

spool movedb.sh


PROMPT #!/bin/bash 

PROMPT
PROMPT #
PROMPT # Check for environment
PROMPT #
PROMPT if [ -z $ORACLE_SID ]; then
PROMPT    echo 
PROMPT    echo "Please run swdb to set your oracle environment...."
PROMPT    echo 
PROMPT    exit 1;
PROMPT fi

PROMPT
PROMPT #
PROMPT # Check for target machine
PROMPT #
PROMPT if [ $# -eq 0 ]; then
PROMPT    echo
PROMPT    echo "usage movedb.sh <target_machine>"
PROMPT    echo
PROMPT    exit 1;
PROMPT fi 
PROMPT

PROMPT #
PROMPT # Check for running database
PROMPT #
PROMPT PROCESSES=`ps -ef|grep oracle|grep $ORACLE_SID|grep -v grep|wc -l`
PROMPT if [ $PROCESSES -ne 0 ]; then
PROMPT    echo
PROMPT    ps -ef|grep oracle|grep $ORACLE_SID|grep -v grep
PROMPT    echo
PROMPT    echo "Database $ORACLE_SID is up, please shutdown first...."
PROMPT    echo
PROMPT    exit 1;
PROMPT fi 
PROMPT

PROMPT
PROMPT export TARGET_MACHINE=$1
PROMPT export CP=/bin/rcp

PROMPT
PROMPT #
PROMPT # init.ora
PROMPT #
PROMPT $CP $ORACLE_HOME/dbs/init$ORACLE_SID.ora $TARGET_MACHINE:$ORACLE_HOME/dbs
PROMPT

PROMPT
PROMPT #
PROMPT # Datafiles
PROMPT #
column dfile format A100 heading "filename"
select '$CP '||file_name||' $TARGET_MACHINE:'||substr(file_name,1,instr(file_name,'/',1,4)-1) dfile 
from dba_data_files order by file_id;

PROMPT
PROMPT #
PROMPT # Log files
PROMPT #
column lfile format A100 heading "filename"
select '$CP '||member||' $TARGET_MACHINE:'||substr(member,1,instr(member,'/',1,4)-1) lfile 
from v$logfile;

PROMPT
PROMPT #
PROMPT # Tempfiles
PROMPT #
column tfile format A100 heading "filename"
select '$CP '||file_name||' $TARGET_MACHINE:'||substr(file_name,1,instr(file_name,'/',1,4)-1) tfile 
from dba_temp_files order by file_id;

PROMPT
PROMPT #
PROMPT # Controlfiles
PROMPT #
column cfile format A100 heading "filename"
select '$CP '||name||' $TARGET_MACHINE:'||substr(name,1,instr(name,'/',1,4)-1) cfile 
from v$controlfile;

spool off;
host chmod +x movedb.sh
