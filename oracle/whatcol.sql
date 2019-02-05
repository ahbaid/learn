-- Author:		Ahbaid Gaffoor
-- File:		/local/opt/app/oracle/ahg/sql/whatcol.sql
-- Date:		$Date$
-- Revision:		$Id$
-- Source:		$Source$
-- Use:		

set termout off
/* {{{ desc dba_tab_columns
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 OWNER                                                 NOT NULL VARCHAR2(30)
 TABLE_NAME                                            NOT NULL VARCHAR2(30)
 COLUMN_NAME                                           NOT NULL VARCHAR2(30)
 DATA_TYPE                                                      VARCHAR2(106)
 DATA_TYPE_MOD                                                  VARCHAR2(3)
 DATA_TYPE_OWNER                                                VARCHAR2(30)
 DATA_LENGTH                                           NOT NULL NUMBER
 DATA_PRECISION                                                 NUMBER
 DATA_SCALE                                                     NUMBER
 NULLABLE                                                       VARCHAR2(1)
 COLUMN_ID                                                      NUMBER
 DEFAULT_LENGTH                                                 NUMBER
 DATA_DEFAULT                                                   LONG
 NUM_DISTINCT                                                   NUMBER
 LOW_VALUE                                                      RAW(32)
 HIGH_VALUE                                                     RAW(32)
 DENSITY                                                        NUMBER
 NUM_NULLS                                                      NUMBER
 NUM_BUCKETS                                                    NUMBER
 LAST_ANALYZED                                                  DATE
 SAMPLE_SIZE                                                    NUMBER
 CHARACTER_SET_NAME                                             VARCHAR2(44)
 CHAR_COL_DECL_LENGTH                                           NUMBER
 GLOBAL_STATS                                                   VARCHAR2(3)
 USER_STATS                                                     VARCHAR2(3)
 AVG_COL_LEN                                                    NUMBER
 CHAR_LENGTH                                                    NUMBER
 CHAR_USED                                                      VARCHAR2(1)
 V80_FMT_IMAGE                                                  VARCHAR2(3)
 DATA_UPGRADED                                                  VARCHAR2(3)
 HISTOGRAM                                                      VARCHAR2(15)
}}} */
set termout on

set lines 120
set pages 1000

set verify off

define in_owner=&&1
define in_column=&&2

column table_name format A30 heading "Table"
column column_name format a30 heading "Column"
column dtype format a30 heading "Column"


select table_name, 
       column_name,
       data_type dtype
from dba_tab_columns
where owner = upper('&&in_owner') and 
      column_name = upper('&&in_column');

set verify on
