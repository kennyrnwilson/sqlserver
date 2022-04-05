echo "sleeping to allow db to start up"
sleep 30

# echo "sleeping to allow select to start"
# sleep 30

echo 'Creating ScratchDb on Server'
/opt/mssql-tools/bin/sqlcmd  -S sql-server-instance -U 'SA' -P  'DatabasePassw0rd' -i ./scripts/create-scratchdb-db.sql