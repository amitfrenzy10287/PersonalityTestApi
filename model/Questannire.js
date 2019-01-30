const mysql = require("mysql");

// Configure database connection here
const db = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "",
	database: "personality_test",
});

//Database connection here
db.connect(function(err){
	if(err){
		console.log(err);
	}else{
		console.log("Connected to database!!!");
	}
});

// Get all list of questions here
exports.getAllQuestions = function(callback){
	let sql = 'select a.question_id,a.question,a.question_type,a.options,a.is_condition,b.condition_text,b.condition_text,b.question_id as conditional_question_id,b.conditional_question,b.options as conditional_option,b.question_type as conditional_question_type,b.category_name as conditional_category,c.category_name from questions a left outer join conditional_questions b ON a.question_id = b.question_id and a.category_id left OUTER JOIN categories c ON a.category_id = c.category_id order by a.question_id ASC';

	db.query(sql, function(err, data){
		if(err){
			callback(err);
		}else{
			callback(null, data);
		}
	});
};

// Get all list of results by user here
exports.getResultsByUsername = (username, callback)=>{
	let sql = 'select * from test_result where username= ?';
	db.query(sql, [username], (err, data)=>{
		if(err){
			callback(err);
		}else{
			callback(null, data);
		}
	});
};

// Save test result submitted
exports.insertTestResult = function( data, callback ) {
	let sql = "INSERT into test_result (`username`, `question_id`, `condition_id`, `question` , `answer`) VALUES ?";
	let reqBody = data.data;
	let dat = Object.keys(reqBody).map((key)=>{
		return ([
			data.username,
			reqBody[key].question_id,
			reqBody[key].condition_id,
			reqBody[key].question,
			reqBody[key].answer,
		])
	});

	db.query(sql,[dat], ( err, data )=>{
		if(err){
			callback(err);
		}else{
			callback(null, data);
		}
	});
}