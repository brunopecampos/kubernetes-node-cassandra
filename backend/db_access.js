// ”cassandra-driver” is in the node_modules folder. Redirect if necessary.
let cassandra = require("cassandra-driver");

let fs = require("fs");
const readFile = (filePath) => {
  return fs.readFileSync(filePath);
};
cassUser = readFile("/run/secrets/db_user");
cassPass = readFile("/run/secrets/db_pass");

// Replace 'Username' and 'Password' with the username and password from your cluster settings
let authProvider = new cassandra.auth.PlainTextAuthProvider(cassUser, cassPass);
// Replace the PublicIPs with the IP addresses of your clusters
console.log(process.env.DB_CONTAINER_NAME);
let contactPoints = [process.env.DB1_NAME, process.env.DB2_NAME];
// Replace DataCenter with the name of your data center, for example: 'AWS_VPC_US_EAST_1'
let localDataCenter = "datacenter1";

let client = new cassandra.Client({
  contactPoints: contactPoints,
  authProvider: authProvider,
  localDataCenter: localDataCenter,
  keyspace: "salary",
});

// Define and execute the queries

// Exit the program after all queries are complete

const increseSalary = async (newSalary) => {
  let query =
    "UPDATE salary.my_salary SET raise_percent=" +
    newSalary +
    " WHERE item_id in ('sal')";
  console.log("query: " + query);
  let res = "";
  let q1 = await client
    .execute(query)
    .then((result) => {
      resStr = result;
      return resStr;
    })
    .catch((err) => {
      console.log("ERROR incresing salary:", err);
      return "ERROR increasing salary\n";
    });
  res = res + q1;
  return res;
};

const getSalary = async () => {
  let query = "SELECT raise_percent FROM salary.my_salary";
  console.log("query: " + query);
  let res = "";
  let q1 = await client
    .execute(query)
    .then((result) => {
      resStr = result.rows[0].raise_percent;
      return resStr;
    })
    .catch((err) => {
      console.log("ERROR consulting salary:", err);
      return "ERROR consulting salary\n";
    });
  res = res + q1;
  return res;
};

//getSalary();

module.exports = {
  getSalary: getSalary,
  increseSalary: increseSalary,
};
