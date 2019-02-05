-- Author:		Ahbaid Gaffoor
-- File:		sqlid.sql
-- Use:			Gather Information for a given SQL_ID

set lines 150 pages 10000 verify off feedback off long 400000

-- {{{ V$SQL
/*


desc V$SQL

 Name                                                              Null?    Type
 ----------------------------------------------------------------- -------- --------------------------------------------
 SQL_TEXT                                                                   VARCHAR2(1000)
 SQL_FULLTEXT                                                               CLOB
 SQL_ID                                                                     VARCHAR2(13)
 SHARABLE_MEM                                                               NUMBER
 PERSISTENT_MEM                                                             NUMBER
 RUNTIME_MEM                                                                NUMBER
 SORTS                                                                      NUMBER
 LOADED_VERSIONS                                                            NUMBER
 OPEN_VERSIONS                                                              NUMBER
 USERS_OPENING                                                              NUMBER
 FETCHES                                                                    NUMBER
 EXECUTIONS                                                                 NUMBER
 PX_SERVERS_EXECUTIONS                                                      NUMBER
 END_OF_FETCH_COUNT                                                         NUMBER
 USERS_EXECUTING                                                            NUMBER
 LOADS                                                                      NUMBER
 FIRST_LOAD_TIME                                                            VARCHAR2(57)
 INVALIDATIONS                                                              NUMBER
 PARSE_CALLS                                                                NUMBER
 DISK_READS                                                                 NUMBER
 DIRECT_WRITES                                                              NUMBER
 BUFFER_GETS                                                                NUMBER
 APPLICATION_WAIT_TIME                                                      NUMBER
 CONCURRENCY_WAIT_TIME                                                      NUMBER
 CLUSTER_WAIT_TIME                                                          NUMBER
 USER_IO_WAIT_TIME                                                          NUMBER
 PLSQL_EXEC_TIME                                                            NUMBER
 JAVA_EXEC_TIME                                                             NUMBER
 ROWS_PROCESSED                                                             NUMBER
 COMMAND_TYPE                                                               NUMBER
 OPTIMIZER_MODE                                                             VARCHAR2(10)
 OPTIMIZER_COST                                                             NUMBER
 OPTIMIZER_ENV                                                              RAW(2000)
 OPTIMIZER_ENV_HASH_VALUE                                                   NUMBER
 PARSING_USER_ID                                                            NUMBER
 PARSING_SCHEMA_ID                                                          NUMBER
 PARSING_SCHEMA_NAME                                                        VARCHAR2(30)
 KEPT_VERSIONS                                                              NUMBER
 ADDRESS                                                                    RAW(8)
 TYPE_CHK_HEAP                                                              RAW(8)
 HASH_VALUE                                                                 NUMBER
 OLD_HASH_VALUE                                                             NUMBER
 PLAN_HASH_VALUE                                                            NUMBER
 CHILD_NUMBER                                                               NUMBER
 SERVICE                                                                    VARCHAR2(64)
 SERVICE_HASH                                                               NUMBER
 MODULE                                                                     VARCHAR2(64)
 MODULE_HASH                                                                NUMBER
 ACTION                                                                     VARCHAR2(64)
 ACTION_HASH                                                                NUMBER
 SERIALIZABLE_ABORTS                                                        NUMBER
 OUTLINE_CATEGORY                                                           VARCHAR2(64)
 CPU_TIME                                                                   NUMBER
 ELAPSED_TIME                                                               NUMBER
 OUTLINE_SID                                                                NUMBER
 CHILD_ADDRESS                                                              RAW(8)
 SQLTYPE                                                                    NUMBER
 REMOTE                                                                     VARCHAR2(1)
 OBJECT_STATUS                                                              VARCHAR2(19)
 LITERAL_HASH_VALUE                                                         NUMBER
 LAST_LOAD_TIME                                                             VARCHAR2(57)
 IS_OBSOLETE                                                                VARCHAR2(1)
 IS_BIND_SENSITIVE                                                          VARCHAR2(1)
 IS_BIND_AWARE                                                              VARCHAR2(1)
 IS_SHAREABLE                                                               VARCHAR2(1)
 CHILD_LATCH                                                                NUMBER
 SQL_PROFILE                                                                VARCHAR2(64)
 SQL_PATCH                                                                  VARCHAR2(30)
 SQL_PLAN_BASELINE                                                          VARCHAR2(30)
 PROGRAM_ID                                                                 NUMBER
 PROGRAM_LINE#                                                              NUMBER
 EXACT_MATCHING_SIGNATURE                                                   NUMBER
 FORCE_MATCHING_SIGNATURE                                                   NUMBER
 LAST_ACTIVE_TIME                                                           DATE
 BIND_DATA                                                                  RAW(2000)
 TYPECHECK_MEM                                                              NUMBER
 IO_CELL_OFFLOAD_ELIGIBLE_BYTES                                             NUMBER
 IO_INTERCONNECT_BYTES                                                      NUMBER
 IO_DISK_BYTES                                                              NUMBER

*/
-- }}}

-- {{{ V$SQL_SHARED_CURSOR 11.1 Columns
set termout off
/*
SQL_ID 				VARCHAR2(13) 	SQL identifier
ADDRESS 			RAW(4 | 8) 	Address of the parent cursor
CHILD_ADDRESS 			RAW(4 | 8) 	Address of the child cursor
CHILD_NUMBER 			NUMBER 	Child number
UNBOUND_CURSOR 			VARCHAR2(1) 	(Y|N) The existing child cursor was not fully built (in other words, it was not optimized)
SQL_TYPE_MISMATCH 		VARCHAR2(1) 	(Y|N) The SQL type does not match the existing child cursor
OPTIMIZER_MISMATCH 		VARCHAR2(1) 	(Y|N) The optimizer environment does not match the existing child cursor
OUTLINE_MISMATCH 		VARCHAR2(1) 	(Y|N) The outlines do not match the existing child cursor
STATS_ROW_MISMATCH 		VARCHAR2(1) 	(Y|N) The existing statistics do not match the existing child cursor
LITERAL_MISMATCH 		VARCHAR2(1) 	(Y|N) Non-data literal values do not match the existing child cursor
FORCE_HARD_PARSE 		VARCHAR2(1) 	???
EXPLAIN_PLAN_CURSOR 		VARCHAR2(1) 	(Y|N) The child cursor is an explain plan cursor and should not be shared
BUFFERED_DML_MISMATCH 		VARCHAR2(1) 	(Y|N) Buffered DML does not match the existing child cursor
PDML_ENV_MISMATCH 		VARCHAR2(1) 	(Y|N) PDML environment does not match the existing child cursor
INST_DRTLD_MISMATCH 		VARCHAR2(1) 	(Y|N) Insert direct load does not match the existing child cursor
SLAVE_QC_MISMATCH 		VARCHAR2(1) 	(Y|N) The existing child cursor is a slave cursor and the new one was issued by the coordinator (or, the existing child cursor was issued by the coordinator and the new one is a slave cursor)
TYPECHECK_MISMATCH 		VARCHAR2(1) 	(Y|N) The existing child cursor is not fully optimized
AUTH_CHECK_MISMATCH 		VARCHAR2(1) 	(Y|N) Authorization/translation check failed for the existing child cursor
BIND_MISMATCH 			VARCHAR2(1) 	(Y|N) The bind metadata does not match the existing child cursor
DESCRIBE_MISMATCH 		VARCHAR2(1) 	(Y|N) The typecheck heap is not present during the describe for the child cursor
LANGUAGE_MISMATCH 		VARCHAR2(1) 	(Y|N) The language handle does not match the existing child cursor
TRANSLATION_MISMATCH 		VARCHAR2(1) 	(Y|N) The base objects of the existing child cursor do not match
ROW_LEVEL_SEC_MISMATCH 		VARCHAR2(1) 	(Y|N) The row level security policies do not match
INSUFF_PRIVS 			VARCHAR2(1) 	(Y|N) Insufficient privileges on objects referenced by the existing child cursor
INSUFF_PRIVS_REM 		VARCHAR2(1) 	(Y|N) Insufficient privileges on remote objects referenced by the existing child cursor
REMOTE_TRANS_MISMATCH 		VARCHAR2(1) 	(Y|N) The remote base objects of the existing child cursor do not match
LOGMINER_SESSION_MISMATCH 	VARCHAR2(1) 	(Y|N) LogMiner Session parameters mismatch
INCOMP_LTRL_MISMATCH 		VARCHAR2(1) 	(Y|N) Cursor might have some binds (literals) which may be unsafe/non-data. Value mismatch.
OVERLAP_TIME_MISMATCH 		VARCHAR2(1) 	Mismatch caused by setting session parameter ERROR_ON_OVERLAP_TIME
EDITION_MISMATCH 		VARCHAR2(1) 	???
MV_QUERY_GEN_MISMATCH 		VARCHAR2(1) 	Internal, used to force a hard-parse when analyzing materialized view queries
USER_BIND_PEEK_MISMATCH 	VARCHAR2(1) 	Cursor is not shared because value of one or more user binds is different and this has a potential to change the execution plan
TYPCHK_DEP_MISMATCH 		VARCHAR2(1) 	Cursor has typecheck dependencies
NO_TRIGGER_MISMATCH 		VARCHAR2(1) 	Cursor and child have no trigger mismatch
FLASHBACK_CURSOR 		VARCHAR2(1) 	Cursor non-shareability due to flashback
ANYDATA_TRANSFORMATION 		VARCHAR2(1) 	Is criteria for opaque type transformation and does not match
INCOMPLETE_CURSOR 		VARCHAR2(1) 	Cursor is incomplete: typecheck heap came from call memory
TOP_LEVEL_RPI_CURSOR 		VARCHAR2(1) 	Is top level RPI cursor
DIFFERENT_LONG_LENGTH 		VARCHAR2(1) 	Value of LONG does not match
LOGICAL_STANDBY_APPLY 		VARCHAR2(1) 	Logical standby apply context does not match
DIFF_CALL_DURN 			VARCHAR2(1) 	If Slave SQL cursor/single call
BIND_UACS_DIFF 			VARCHAR2(1) 	One cursor has bind UACs and one does not
PLSQL_CMP_SWITCHS_DIFF 		VARCHAR2(1) 	PL/SQL anonymous block compiled with different PL/SQL compiler switches
CURSOR_PARTS_MISMATCH 		VARCHAR2(1) 	Cursor was compiled with subexecution (cursor parts were executed)
STB_OBJECT_MISMATCH 		VARCHAR2(1) 	STB has come into existence since cursor was compiled
EDITION_FOR_TRIGGERS_MISMATCH 	VARCHAR2(1) 	???
PQ_SLAVE_MISMATCH 		VARCHAR2(1) 	Top-level slave decides not to share cursor
TOP_LEVEL_DDL_MISMATCH 		VARCHAR2(1) 	Is top-level DDL cursor
MULTI_PX_MISMATCH 		VARCHAR2(1) 	Cursor has multiple parallelizers and is slave-compiled
BIND_PEEKED_PQ_MISMATCH 	VARCHAR2(1) 	Cursor based around bind peeked values
MV_REWRITE_MISMATCH 		VARCHAR2(1) 	Cursor needs recompilation because an SCN was used during compile time due to being rewritten by materialized view
ROLL_INVALID_MISMATCH 		VARCHAR2(1) 	Marked for rolling invalidation and invalidation window exceeded
OPTIMIZER_MODE_MISMATCH 	VARCHAR2(1) 	Parameter OPTIMIZER_MODE mismatch (for example, all_rows versus first_rows_1)
PX_MISMATCH 			VARCHAR2(1) 	Mismatch in one parameter affecting the parallelization of a SQL statement. For example, one cursor was compiled with parallel DML enabled while the other was not.
MV_STALEOBJ_MISMATCH 		VARCHAR2(1) 	Cursor cannot be shared because there is a mismatch in the list of materialized views which were stale at the time the cursor was built
FLASHBACK_TABLE_MISMATCH 	VARCHAR2(1) 	Cursor cannot be shared because there is a mismatch with triggers being enabled and/or referential integrity constraints being deferred
LITREP_COMP_MISMATCH 		VARCHAR2(1) 	Mismatch in use of literal replacement
*/
set termout on
-- }}}

define in_sqlid=&&1

-- {{{ Column Definitions

column sql_fulltext format A100 word_wrapped
column is_bind_aware format A15
column is_shareable format A15
column matrix format A58 heading "   [....+....1....+....2....+....3....+....4....+....5...]"

column cnum new_value in_cursor noprint;

-- }}}

-- {{{ V$SQL_SHARED_CURSOR Column Definitions
column UNBOUND_CURSOR			heading "."
column SQL_TYPE_MISMATCH		heading "."
column OPTIMIZER_MISMATCH		heading "."
column OUTLINE_MISMATCH			heading "."
column STATS_ROW_MISMATCH		heading "+"
column LITERAL_MISMATCH			heading "."
column FORCE_HARD_PARSE			heading "."
column EXPLAIN_PLAN_CURSOR		heading "."
column BUFFERED_DML_MISMATCH		heading "."
column PDML_ENV_MISMATCH		heading "1"
column INST_DRTLD_MISMATCH		heading "."
column SLAVE_QC_MISMATCH		heading "."
column TYPECHECK_MISMATCH		heading "."
column AUTH_CHECK_MISMATCH		heading "."
column BIND_MISMATCH			heading "+"
column DESCRIBE_MISMATCH		heading "."
column LANGUAGE_MISMATCH		heading "."
column TRANSLATION_MISMATCH		heading "."
column ROW_LEVEL_SEC_MISMATCH		heading "."
column INSUFF_PRIVS			heading "2"
column INSUFF_PRIVS_REM			heading "."
column REMOTE_TRANS_MISMATCH		heading "."
column LOGMINER_SESSION_MISMATCH	heading "."
column INCOMP_LTRL_MISMATCH		heading "."
column OVERLAP_TIME_MISMATCH		heading "+"
column EDITION_MISMATCH			heading "."
column MV_QUERY_GEN_MISMATCH		heading "."
column USER_BIND_PEEK_MISMATCH		heading "."
column TYPCHK_DEP_MISMATCH		heading "."
column NO_TRIGGER_MISMATCH		heading "3"
column FLASHBACK_CURSOR			heading "."
column ANYDATA_TRANSFORMATION		heading "."
column INCOMPLETE_CURSOR		heading "."
column TOP_LEVEL_RPI_CURSOR		heading "."
column DIFFERENT_LONG_LENGTH		heading "+"
column LOGICAL_STANDBY_APPLY		heading "."
column DIFF_CALL_DURN			heading "."
column BIND_UACS_DIFF			heading "."
column PLSQL_CMP_SWITCHS_DIFF		heading "."
column CURSOR_PARTS_MISMATCH		heading "4"
column STB_OBJECT_MISMATCH		heading "."
column CROSSEDITION_TRIGGER_MISMATCH	heading "."
column PQ_SLAVE_MISMATCH		heading "."
column TOP_LEVEL_DDL_MISMATCH		heading "."
column MULTI_PX_MISMATCH		heading "+"
column BIND_PEEKED_PQ_MISMATCH		heading "."
column MV_REWRITE_MISMATCH		heading "."
column ROLL_INVALID_MISMATCH		heading "."
column OPTIMIZER_MODE_MISMATCH		heading "."
column PX_MISMATCH			heading "5"
column MV_STALEOBJ_MISMATCH		heading "."
column FLASHBACK_TABLE_MISMATCH		heading "."
column LITREP_COMP_MISMATCH		heading "."
-- }}}

-- {{{ V$SQL version information
select 
   sql_id, 
   is_bind_aware,
   is_shareable,
   sum(loaded_versions), 
   sum(open_versions),
   sum(users_opening),
   sum(invalidations)
from v$sql
where sql_id = '&&in_sqlid'
group by sql_id,is_bind_aware,is_shareable;
-- }}}

-- {{{ V$SQL full text and get child_number 0
select sql_fulltext, child_number as cnum  from v$sql where sql_id = '&&in_sqlid' and child_number = 0;
-- }}}

-- {{{ DBMS_XPLAN on cursor for execution plan
select * from table (dbms_xplan.display_cursor(sql_id=>'&&in_sqlid',cursor_child_no=>&&in_cursor));
-- }}}

-- {{{ Matrix description table

declare
   
   type matrix_type is varray(53) of varchar2(2000);
   sqlsharedcursor matrix_type;
   mstring varchar2(53) := rpad('.',53,'.');             -- Default Matrix String of "......"

   i number;
   a number;
   b number;

   -- {{{ Matrix query cursor mxsum
   cursor mxsum(in_sqlid varchar2) is 
      select count(*) as matrix_count, replace('n: ['||
      -- {{{ V$SQL_SHARED_CURSOR matrix columns
         UNBOUND_CURSOR		||
         SQL_TYPE_MISMATCH		||
         OPTIMIZER_MISMATCH		||
         OUTLINE_MISMATCH		||
         STATS_ROW_MISMATCH		||
         LITERAL_MISMATCH		||
         FORCE_HARD_PARSE		||
         EXPLAIN_PLAN_CURSOR		||
         BUFFERED_DML_MISMATCH	||
         PDML_ENV_MISMATCH		||
         INST_DRTLD_MISMATCH		||
         SLAVE_QC_MISMATCH		||
         TYPECHECK_MISMATCH		||
         AUTH_CHECK_MISMATCH		||
         BIND_MISMATCH		||
         DESCRIBE_MISMATCH		||
         LANGUAGE_MISMATCH		||
         TRANSLATION_MISMATCH		||
         ROW_LEVEL_SEC_MISMATCH	||
         INSUFF_PRIVS			||
         INSUFF_PRIVS_REM		||
         REMOTE_TRANS_MISMATCH	||
         LOGMINER_SESSION_MISMATCH	||
         INCOMP_LTRL_MISMATCH		||
         OVERLAP_TIME_MISMATCH	||
         EDITION_MISMATCH		||
         MV_QUERY_GEN_MISMATCH	||
         USER_BIND_PEEK_MISMATCH	||
         TYPCHK_DEP_MISMATCH		||
         NO_TRIGGER_MISMATCH		||
         FLASHBACK_CURSOR		||
         ANYDATA_TRANSFORMATION	||
         INCOMPLETE_CURSOR		||
         TOP_LEVEL_RPI_CURSOR		||
         DIFFERENT_LONG_LENGTH	||
         LOGICAL_STANDBY_APPLY	||
         DIFF_CALL_DURN		||
         BIND_UACS_DIFF		||
         PLSQL_CMP_SWITCHS_DIFF	||
         CURSOR_PARTS_MISMATCH	||
         STB_OBJECT_MISMATCH		||
         CROSSEDITION_TRIGGER_MISMATCH||
         PQ_SLAVE_MISMATCH		||
         TOP_LEVEL_DDL_MISMATCH	||
         MULTI_PX_MISMATCH		||
         BIND_PEEKED_PQ_MISMATCH	||
         MV_REWRITE_MISMATCH		||
         ROLL_INVALID_MISMATCH	||
         OPTIMIZER_MODE_MISMATCH	||
         PX_MISMATCH			||
         MV_STALEOBJ_MISMATCH		||
         FLASHBACK_TABLE_MISMATCH	||
         LITREP_COMP_MISMATCH		||
      -- }}}
      ']','N','.') as matrix 
      from v$sql_shared_cursor 
      where sql_id = in_sqlid
      group by 
         replace('n: ['||
      -- {{{ V$SQL_SHARED_CURSOR matrix columns
         UNBOUND_CURSOR		||
         SQL_TYPE_MISMATCH		||
         OPTIMIZER_MISMATCH		||
         OUTLINE_MISMATCH		||
         STATS_ROW_MISMATCH		||
         LITERAL_MISMATCH		||
         FORCE_HARD_PARSE		||
         EXPLAIN_PLAN_CURSOR		||
         BUFFERED_DML_MISMATCH	||
         PDML_ENV_MISMATCH		||
         INST_DRTLD_MISMATCH		||
         SLAVE_QC_MISMATCH		||
         TYPECHECK_MISMATCH		||
         AUTH_CHECK_MISMATCH		||
         BIND_MISMATCH		||
         DESCRIBE_MISMATCH		||
         LANGUAGE_MISMATCH		||
         TRANSLATION_MISMATCH		||
         ROW_LEVEL_SEC_MISMATCH	||
         INSUFF_PRIVS			||
         INSUFF_PRIVS_REM		||
         REMOTE_TRANS_MISMATCH	||
         LOGMINER_SESSION_MISMATCH	||
         INCOMP_LTRL_MISMATCH		||
         OVERLAP_TIME_MISMATCH	||
         EDITION_MISMATCH		||
         MV_QUERY_GEN_MISMATCH	||
         USER_BIND_PEEK_MISMATCH	||
         TYPCHK_DEP_MISMATCH		||
         NO_TRIGGER_MISMATCH		||
         FLASHBACK_CURSOR		||
         ANYDATA_TRANSFORMATION	||
         INCOMPLETE_CURSOR		||
         TOP_LEVEL_RPI_CURSOR		||
         DIFFERENT_LONG_LENGTH	||
         LOGICAL_STANDBY_APPLY	||
         DIFF_CALL_DURN		||
         BIND_UACS_DIFF		||
         PLSQL_CMP_SWITCHS_DIFF	||
         CURSOR_PARTS_MISMATCH	||
         STB_OBJECT_MISMATCH		||
         CROSSEDITION_TRIGGER_MISMATCH||
         PQ_SLAVE_MISMATCH		||
         TOP_LEVEL_DDL_MISMATCH	||
         MULTI_PX_MISMATCH		||
         BIND_PEEKED_PQ_MISMATCH	||
         MV_REWRITE_MISMATCH		||
         ROLL_INVALID_MISMATCH	||
         OPTIMIZER_MODE_MISMATCH	||
         PX_MISMATCH			||
         MV_STALEOBJ_MISMATCH		||
         FLASHBACK_TABLE_MISMATCH	||
         LITREP_COMP_MISMATCH		||
      -- }}}
      ']','N','.')
      order by 1 asc;
   -- }}}

   -- {{{ print procs
   procedure print(s varchar2) is
   begin
      dbms_output.put_line(s);
   end;

   procedure cr is
   begin
      print(chr(11));
   end;

   procedure line is
   begin
      print(rpad('=',80,'='));
   end;
   -- }}}

   -- {{{ function update_matrix_descriptions(mx1 varchar2, mx2 varchar2(53)) return varchar2
   function update_matrix_descriptions(mx1 varchar2, mx2 varchar2) return varchar2 is
      i number := 1;
      p number;
      tmx varchar2(53);

   begin

      tmx := mx1;

      while (instr(mx2,'Y',1,i) <> 0) loop
         p := instr(mx2,'Y',1,i);
         i := i + 1;

         if (p = 1) then
            tmx := 'Y'||substr(tmx,2);
         elsif (p = 53) then
            tmx := substr(tmx,1,52)||'Y';
         elsif ((p > 1) and (p < 53)) then
            tmx := substr(tmx,1,p-1)||'Y'||substr(tmx,p+1);
         end if;
      end loop;

      return tmx;
     
   end update_matrix_descriptions;
   -- }}}

begin

-- {{{ Initialize sqlsharedcursor array 1..53
   sqlsharedcursor := matrix_type();
   sqlsharedcursor.extend(53);

   sqlsharedcursor (1) := 'UNBOUND_CURSOR            : (Y|N) The existing child cursor was not fully built (in other words, it was not optimized)';
   sqlsharedcursor (2) := 'SQL_TYPE_MISMATCH         : (Y|N) The SQL type does not match the existing child cursor';
   sqlsharedcursor (3) := 'OPTIMIZER_MISMATCH        : (Y|N) The optimizer environment does not match the existing child cursor';
   sqlsharedcursor (4) := 'OUTLINE_MISMATCH          : (Y|N) The outlines do not match the existing child cursor';
   sqlsharedcursor (5) := 'STATS_ROW_MISMATCH        : (Y|N) The existing statistics do not match the existing child cursor';
   sqlsharedcursor (6) := 'LITERAL_MISMATCH          : (Y|N) Non-data literal values do not match the existing child cursor';
   sqlsharedcursor (7) := 'FORCE_HARD_PARSE          : ???';
   sqlsharedcursor (8) := 'EXPLAIN_PLAN_CURSOR       : (Y|N) The child cursor is an explain plan cursor and should not be shared';
   sqlsharedcursor (9) := 'BUFFERED_DML_MISMATCH     : (Y|N) Buffered DML does not match the existing child cursor';
   sqlsharedcursor(10) := 'PDML_ENV_MISMATCH         : (Y|N) PDML environment does not match the existing child cursor';
   sqlsharedcursor(11) := 'INST_DRTLD_MISMATCH       : (Y|N) Insert direct load does not match the existing child cursor';
   sqlsharedcursor(12) := 'SLAVE_QC_MISMATCH         : (Y|N) The existing child cursor is a slave cursor and the new one was issued by the coordinator (or, the existing child cursor was issued by the coordinator and the new one is a slave cursor)';
   sqlsharedcursor(13) := 'TYPECHECK_MISMATCH        : (Y|N) The existing child cursor is not fully optimized';
   sqlsharedcursor(14) := 'AUTH_CHECK_MISMATCH       : (Y|N) Authorization/translation check failed for the existing child cursor';
   sqlsharedcursor(15) := 'BIND_MISMATCH             : (Y|N) The bind metadata does not match the existing child cursor';
   sqlsharedcursor(16) := 'DESCRIBE_MISMATCH         : (Y|N) The typecheck heap is not present during the describe for the child cursor';
   sqlsharedcursor(17) := 'LANGUAGE_MISMATCH         : (Y|N) The language handle does not match the existing child cursor';
   sqlsharedcursor(18) := 'TRANSLATION_MISMATCH      : (Y|N) The base objects of the existing child cursor do not match';
   sqlsharedcursor(19) := 'ROW_LEVEL_SEC_MISMATCH    : (Y|N) The row level security policies do not match';
   sqlsharedcursor(20) := 'INSUFF_PRIVS              : (Y|N) Insufficient privileges on objects referenced by the existing child cursor';
   sqlsharedcursor(21) := 'INSUFF_PRIVS_REM          : (Y|N) Insufficient privileges on remote objects referenced by the existing child cursor';
   sqlsharedcursor(22) := 'REMOTE_TRANS_MISMATCH     : (Y|N) The remote base objects of the existing child cursor do not match';
   sqlsharedcursor(23) := 'LOGMINER_SESSION_MISMATCH : (Y|N) LogMiner Session parameters mismatch';
   sqlsharedcursor(24) := 'INCOMP_LTRL_MISMATCH      : (Y|N) Cursor might have some binds (literals) which may be unsafe/non-data. Value mismatch.';
   sqlsharedcursor(25) := 'OVERLAP_TIME_MISMATCH     : Mismatch caused by setting session parameter ERROR_ON_OVERLAP_TIME';
   sqlsharedcursor(26) := 'EDITION_MISMATCH          : ???';
   sqlsharedcursor(27) := 'MV_QUERY_GEN_MISMATCH     : Internal, used to force a hard-parse when analyzing materialized view queries';
   sqlsharedcursor(28) := 'USER_BIND_PEEK_MISMATCH   : Cursor is not shared because value of one or more user binds is different and this has a potential to change the execution plan';
   sqlsharedcursor(29) := 'TYPCHK_DEP_MISMATCH       : Cursor has typecheck dependencies';
   sqlsharedcursor(30) := 'NO_TRIGGER_MISMATCH       : Cursor and child have no trigger mismatch';
   sqlsharedcursor(31) := 'FLASHBACK_CURSOR          : Cursor non-shareability due to flashback';
   sqlsharedcursor(32) := 'ANYDATA_TRANSFORMATION    : Is criteria for opaque type transformation and does not match';
   sqlsharedcursor(33) := 'INCOMPLETE_CURSOR         : Cursor is incomplete: typecheck heap came from call memory';
   sqlsharedcursor(34) := 'TOP_LEVEL_RPI_CURSOR      : Is top level RPI cursor';
   sqlsharedcursor(35) := 'DIFFERENT_LONG_LENGTH     : Value of LONG does not match';
   sqlsharedcursor(36) := 'LOGICAL_STANDBY_APPLY     : Logical standby apply context does not match';
   sqlsharedcursor(37) := 'DIFF_CALL_DURN            : If Slave SQL cursor/single call';
   sqlsharedcursor(38) := 'BIND_UACS_DIFF            : One cursor has bind UACs and one does not';
   sqlsharedcursor(39) := 'PLSQL_CMP_SWITCHS_DIFF    : PL/SQL anonymous block compiled with different PL/SQL compiler switches';
   sqlsharedcursor(40) := 'CURSOR_PARTS_MISMATCH     : Cursor was compiled with subexecution (cursor parts were executed)';
   sqlsharedcursor(41) := 'STB_OBJECT_MISMATCH        : STB has come into existence since cursor was compiled';
   sqlsharedcursor(42) := 'CROSSEDITION_TRIGGER_MISMATCH : ???';
   sqlsharedcursor(43) := 'PQ_SLAVE_MISMATCH         : Top-level slave decides not to share cursor';
   sqlsharedcursor(44) := 'TOP_LEVEL_DDL_MISMATCH    : Is top-level DDL cursor';
   sqlsharedcursor(45) := 'MULTI_PX_MISMATCH         : Cursor has multiple parallelizers and is slave-compiled';
   sqlsharedcursor(46) := 'BIND_PEEKED_PQ_MISMATC    : Cursor based around bind peeked values';
   sqlsharedcursor(47) := 'MV_REWRITE_MISMATCH       : Cursor needs recompilation because an SCN was used during compile time due to being rewritten by materialized view';
   sqlsharedcursor(48) := 'ROLL_INVALID_MISMATCH     : Marked for rolling invalidation and invalidation window exceeded';
   sqlsharedcursor(49) := 'OPTIMIZER_MODE_MISMATCH   : Parameter OPTIMIZER_MODE mismatch (for example, all_rows versus first_rows_1)';
   sqlsharedcursor(50) := 'PX_MISMATCH               : Mismatch in one parameter affecting the parallelization of a SQL statement. For example, one cursor was compiled with parallel DML enabled while the other was not.';
   sqlsharedcursor(51) := 'MV_STALEOBJ_MISMATCH      : Cursor cannot be shared because there is a mismatch in the list of materialized views which were stale at the time the cursor was built';
   sqlsharedcursor(52) := 'FLASHBACK_TABLE_MISMATCH  : Cursor cannot be shared because there is a mismatch with triggers being enabled and/or referential integrity constraints being deferred';
   sqlsharedcursor(53) := 'LITREP_COMP_MISMATCH      : Mismatch in use of literal replacement';
-- }}}

   -- {{{ Print Matrix and build mstring

   print('MX [....+....1....+....2....+....3....+....4....+....5...]');
   line;

   for cmatrix in mxsum('&&in_sqlid') loop

      print(cmatrix.matrix||' : '||to_char(cmatrix.matrix_count,'99,999'));

      a := instr(cmatrix.matrix,'[')+1;
      b := instr(cmatrix.matrix,']')-1;

      mstring := update_matrix_descriptions(mstring,substr(cmatrix.matrix, a, b-a+1));

   end loop;

   -- }}}

   -- {{{ Print reasons for invalidation

   i := 1;

   if (instr(mstring,'Y',1,i) <> 0) then
      cr;
      print('Invalidation Reasons:');
      print('[....+....1....+....2....+....3....+....4....+....5...]');
      print('['||mstring||']');
      line;
   end if;

   while (instr(mstring,'Y',1,i) <> 0) loop
      print(to_char(instr(mstring,'Y',1,i),'00')||' '||sqlsharedcursor(instr(mstring,'Y',1,i)));
      i := i + 1;
   end loop;

   if (instr(mstring,'Y',1,i) <> 0) then
      cr;
   end if;

   -- }}}

end;
/


-- }}}

prompt
set verify on feedback on
