SELECT a.username, a.SID, a.row_wait_obj#, a.ROW_WAIT_FILE#, 
               a.ROW_WAIT_BLOCK#, a.ROW_WAIT_ROW#, b.TYPE 
          FROM sys.V_$SESSION a, sys.V_$LOCK b 
         WHERE a.username IS NOT NULL 
           AND a.row_wait_obj# <> -1 
           AND a.SID = b.SID 
           AND b.TYPE IN ('TX','TM') 
;
