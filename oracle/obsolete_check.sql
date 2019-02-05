clear columns
clear breaks
set feedback on
set verify off
set lines 200
set pages 300

prompt
prompt db_name - Dsatabase Name
prompt db_catalog_user - RMAN Catalog User
prompt db_password - RMAN Catalog User password
prompt db_catalog - RMAN Catalog
prompt
prompt USAGE: @backup_check <db_name> <db_catalog_user> <db_password> <db_catalog>
prompt
host cat ~oracle/drm_scripts/cron/Skip_Compress.Dat | grep -v ^# | more
prompt
accept continue prompt "Press enter to continue...."

define db_name=&&1
define db_catalog_user=&&2
define db_password=&&3
define db_catalog=&&4

connect &&db_catalog_user/&&db_password@&&db_catalog

column c0 format A15 heading "DB Name"
column c1 format A20 heading "MM/YYYY"
column c2 format A60 heading "Handle" word_wrapped
column c3 format 999,999 heading "Pieces"

set feedback off
column bkspool noprint new_value pieces_file
select 'backup_purge_pieces_'||upper('&&db_name')||'.lst' as bkspool from dual;
column rmancmd noprint new_value rman_cmd_file
select 'backup_purge_'||upper('&&db_name')||'.cmd' as rmancmd from dual;
set feedback on

spool  &&pieces_file

PROMPT
PROMPT Backup Pieces to be removed
PROMPT

select a.name c0,
       to_char(completion_time,'MM/YYYY') c1,
       b.handle c2,
       count(*) c3
from rc_database a,
     rc_backup_piece b
where a.name = upper('&&db_name') and
      a.db_key = b.db_key and
      status = 'A' and
      completion_time < sysdate - 22 
group by a.name, to_char(completion_time,'MM/YYYY'), b.handle;
      
prompt 
prompt RMAN command file to cleanup is &&rman_cmd_file
prompt

spool off

set heading off
set feedback off
set pages 300
set lines 200

spool &&rman_cmd_file

prompt connect target /
prompt connect catalog &&db_catalog_user/&&db_password@&&db_catalog
select 'allocate channel for maintenance type "sbt_tape";' from dual;

select 'change backuppiece '''||handle||''' delete;'
from rc_backup_piece
where device_type = 'SBT_TAPE' and 
      status = 'A' and 
      upper(handle) like upper('&&db_name')||'%' and
      completion_time < sysdate - 22
order by handle;

select 'exit;' from dual;
spool off;

exit;
