user=$(ls /k8s/secrets/CASSANDRA_USER)
pass=$(cat /k8s/secrets/CASSANDRA_PASSWORD)
while ! cqlsh -e 'describe cluster' -u ${user} -p ${pass} "database" ; do
    echo "Cassandra is not ready"
    sleep 1
done
echo "Cassandra is ready"   
echo "starting node server"
node server.js
