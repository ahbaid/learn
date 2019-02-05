select view_name from dba_views
where view_name like '%PRIV%' or
      view_name like '%ROLE%' or
      view_name like '%RECD%' or
      view_name like '%MADE%'
order by 1
/
