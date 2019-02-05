select service_id, column_number, name from search_ptd_item_fields
where ptd='electronics' and (name like '%feature%' or name like '%indexable%')
order by 1,3,2
/
