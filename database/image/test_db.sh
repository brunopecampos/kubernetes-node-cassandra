echo "Salary in db 1:"
docker exec -it db1 cqlsh -e 'SELECT raise_percent FROM salary.my_salary' -u benigno -p opus_eh_o_bixo
echo "Salary in db2:"
docker exec -it db2 cqlsh -e 'SELECT raise_percent FROM salary.my_salary' -u benigno -p opus_eh_o_bixo