column column_name format A30
column column_expression format A30

define in_owner=&&1
define in_index_name=&&2

select column_position, column_name, descend from dba_ind_columns
where index_owner = upper('&&in_owner') and index_name = upper('&&in_index_name')
order by column_position
/

select column_position as "Column Number", column_expression from dba_ind_expressions
where index_owner = upper('&&in_owner') and index_name = upper('&&in_index_name')
order by column_position
/

