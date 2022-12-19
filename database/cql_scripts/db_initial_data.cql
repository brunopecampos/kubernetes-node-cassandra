CREATE KEYSPACE IF NOT EXISTS salary WITH REPLICATION = {'class' : 'SimpleStrategy','replication_factor' : 1};

CREATE TABLE IF NOT EXISTS salary.my_salary (item_id TEXT, raise_percent DECIMAL, PRIMARY KEY (item_id));

INSERT INTO salary.my_salary (item_id, raise_percent) VALUES ('sal',0.50) IF NOT EXISTS;