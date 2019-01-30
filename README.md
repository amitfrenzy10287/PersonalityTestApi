# PersonalityTestApi
Personality Test Api

# For backend server side 
1) Create a database named personality_test in MySql
2) Import MySql file personality_test.sql to database
3) Run Mysql server so that Api should have access to Database tables 
4) Default configuration for database connectivity is written in Model/Questionnaire.js File
5) Change the database configuration for eg:

// Configure database connection here
const db = mysql.createConnection({
  host: "localhost", // change hostname of MySQL server here
  user: "root", // change username of MySQL server here
  password: "", // change password of MySQL server here
  database: "personality_test", // change database name of MySQL server here if required
});

1) Run "npm install" in the extracted folder
2) Run "nodemon" to run the api on server host 9000
