select sql_text c0
from v$sqlarea
where sql_text like 'SELECT%NVL(SUM(MO_ITM_LN_TND),0)%FROM TR_LTM_TND  WHERE%ID_STR_RT = :b1  AND ID_WS =%'
/
