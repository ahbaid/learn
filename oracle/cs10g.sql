-- Author:		Ahbaid Gaffoor
-- File:		cursor_summary.sql
-- Use:			Gather Information for cursor use

set lines 150 pages 10000 verify off feedback off long 400000

define in_count=&&1


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

-- {{{ V$SQL_SHARED_CURSOR 10.2.0.4 Columns
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
SEC_DEPTH_MISMATCH 		VARCHAR2(1) 	???
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
SQL_REDIRECT_MISMATCH 		VARCHAR2(1) 	???
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
ROW_SHIP_MISMATCH 		VARCHAR2(1) 	???
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


column matrix format A58 heading "   [....+....1....+....2....+....3....+....4....+....5...]"
column cursor_count heading "Cursors"


-- {{{ Get Matrix Summary for sqlid

select sql_id, count(*) as cursor_count, replace('m: ['||
-- Get Matrix for child_number = 0
-- {{{ V$SQL_SHARED_CURSOR matrix columns
   UNBOUND_CURSOR		||
   SQL_TYPE_MISMATCH		||
   OPTIMIZER_MISMATCH		||
   OUTLINE_MISMATCH		||
   STATS_ROW_MISMATCH		||
   LITERAL_MISMATCH		||
   SEC_DEPTH_MISMATCH 		||
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
   SQL_REDIRECT_MISMATCH 	||
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
   ROW_SHIP_MISMATCH 		||
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
']','N','.') as matrix from v$sql_shared_cursor
group by 
   sql_id,
   replace('m: ['||
-- {{{ V$SQL_SHARED_CURSOR matrix columns
   UNBOUND_CURSOR		||
   SQL_TYPE_MISMATCH		||
   OPTIMIZER_MISMATCH		||
   OUTLINE_MISMATCH		||
   STATS_ROW_MISMATCH		||
   LITERAL_MISMATCH		||
   SEC_DEPTH_MISMATCH 		||
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
   SQL_REDIRECT_MISMATCH 	||
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
   ROW_SHIP_MISMATCH 		||
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
having count(*) > &&in_count
order by 2 asc;

-- }}}

-- {{{ Matrix description table

declare
   type matrix_type is varray(53) of varchar2(2000);
   sqlsharedcursor matrix_type;
   i number;
begin

   sqlsharedcursor := matrix_type();
   sqlsharedcursor.extend(53);

-- {{{ Initialize sqlsharedcursor array 1..53
   sqlsharedcursor (1) := 'UNBOUND_CURSOR            : (Y|N) The existing child cursor was not fully built (in other words, it was not optimized)';
   sqlsharedcursor (2) := 'SQL_TYPE_MISMATCH         : (Y|N) The SQL type does not match the existing child cursor';
   sqlsharedcursor (3) := 'OPTIMIZER_MISMATCH        : (Y|N) The optimizer environment does not match the existing child cursor';
   sqlsharedcursor (4) := 'OUTLINE_MISMATCH          : (Y|N) The outlines do not match the existing child cursor';
   sqlsharedcursor (5) := 'STATS_ROW_MISMATCH        : (Y|N) The existing statistics do not match the existing child cursor';
   sqlsharedcursor (6) := 'LITERAL_MISMATCH          : (Y|N) Non-data literal values do not match the existing child cursor';
   sqlsharedcursor (7) := 'SEC_DEPTH_MISMATCH        : ???';
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
   sqlsharedcursor(26) := 'SQL_REDIRECT_MISMATCH     : ???';
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
   sqlsharedcursor(41) := 'STB_OBJECT_MISMATCH       : STB has come into existence since cursor was compiled';
   sqlsharedcursor(42) := 'ROW_SHIP_MISMATCH         : ???';
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

   dbms_output.put_line(chr(10));
   for i in 1..53 loop
      dbms_output.put_line(to_char(i,'00')||' '||sqlsharedcursor(i));
   end loop;
   dbms_output.put_line(chr(10));

end;
/


-- }}}

prompt
set verify on feedback on
