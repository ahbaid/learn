set pages 100
set lines 200

column realname format A30 word_wrapped
column description format A30 word_wrapped
column label format A30 word_wrapped

select realname, description, label, user_role
from opc_op.opc_user_data
/

