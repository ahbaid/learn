define in_block=&&1

select name, kind      
from ext_to_obj_view    
where file#  = file#     
     and lowb  <= &&in_block
     and highb >= &&in_block
;
