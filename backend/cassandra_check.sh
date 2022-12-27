user=$(cat /k8s/secrets/CASSANDRA_USER)
pass=$(cat /k8s/secrets/CASSANDRA_PASSWORD)
while ! cqlsh -e 'describe cluster' -u ${user} -p ${pass} "database" ; do
    echo "Couldn't connect to Cassandra."
    sleep 1
done
echo "Sucessfully connected to Cassandra."   
echo "starting node server."
node server.js
