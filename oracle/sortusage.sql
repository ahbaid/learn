/*

SQL> desc v$sort_segment
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 TABLESPACE_NAME                                                VARCHAR2(31)
 SEGMENT_FILE                                                   NUMBER
 SEGMENT_BLOCK                                                  NUMBER
 EXTENT_SIZE                                                    NUMBER
 CURRENT_USERS                                                  NUMBER
 TOTAL_EXTENTS                                                  NUMBER
 TOTAL_BLOCKS                                                   NUMBER
 USED_EXTENTS                                                   NUMBER
 USED_BLOCKS                                                    NUMBER
 FREE_EXTENTS                                                   NUMBER
 FREE_BLOCKS                                                    NUMBER
 ADDED_EXTENTS                                                  NUMBER
 EXTENT_HITS                                                    NUMBER
 FREED_EXTENTS                                                  NUMBER
 FREE_REQUESTS                                                  NUMBER
 MAX_SIZE                                                       NUMBER
 MAX_BLOCKS                                                     NUMBER
 MAX_USED_SIZE                                                  NUMBER
 MAX_USED_BLOCKS                                                NUMBER
 MAX_SORT_SIZE                                                  NUMBER
 MAX_SORT_BLOCKS                                                NUMBER
 RELATIVE_FNO                                                   NUMBER

*/

clear columns
clear breaks

set pages 1000
set lines 130

column c0 format A15 word_wrapped heading "Tablespace"
column c1 format 999 heading "Users"
column ce format 999,990 heading "Extent|Size"
column c2 format 999,990 heading "Total|Extents"
column c3 format 999,990 heading "Free|Extents"
column c4 format 999,990 heading "Used|Extents"
column c5 format 999,990 heading "Extent|Hits"
column c6 format 999,990 heading "Extents|Freed"
column c7 format 999,990 heading "Free|Requests"

select tablespace_name c0, 
       current_users c1, 
       extent_size ce,
       total_extents c2, 
       free_extents c3, 
       used_extents c4,
       extent_hits c5,
       freed_extents c6,
       free_requests c7
from v$sort_segment
/
