#while ! nc -z localhost 9042; do
#    sleep 1
#done
#echo "filling database with initial data."
#cqlsh -f db_initial_data.cql localhost

docker exec db1 cqlsh -f db_initial_data.cql localhost
