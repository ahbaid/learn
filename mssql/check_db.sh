export SQLCMD=/usr/local/bin/sqlcmd
#export SQLOPTS=" -w 200 -m 1 -W -h-1"
export SQLOPTS=" -w 200 -m 1 -W"
export inDbName=$1
$SQLCMD -S 127.0.0.1\\master,9072 -U "$MDU" -P "$MDK"  -d master $SQLOPTS -i check_db.sql
