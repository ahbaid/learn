# Queries

## List of Indexes
~~~~
| eventcount summarize=false index=* | dedup index | fields index
~~~~

## Include Internal Indexes
~~~~
| eventcount summarize=false index=* index=_* | dedup index | fields index
~~~~
