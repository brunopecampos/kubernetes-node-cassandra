user=$(cat /run/secrets/db_user)
pass=$(cat /run/secrets/db_pass)

while ! cqlsh -e 'describe cluster' -u ${user} -p ${pass} ${DB2_NAME} ; do
    echo "Cassandra is not ready"
    sleep 1
done
echo "Cassandra is ready"   
echo "starting node server"
node server.js
