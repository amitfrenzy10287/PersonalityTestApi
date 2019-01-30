const express = require("express");
const bodyparser = require("body-parser");
const jwt = require('jsonwebtoken');

const cors = require('cors');

const quest  = require("./model/Questannire");

const app = express();
app.listen(9000);

app.use(bodyparser.urlencoded({extended : false}));
app.use(bodyparser.json());

app.use(cors());
 
app.get("/api/user/:id", function(req, res){
	try {
		user.getUser(req.params.id, function(err, data){
			if(err){
				throw err
			}else{
				res.send(data);
			}
		})
	}catch (error){
		res.status(500).send(err);
	}
});

//Get token from here 
app.post('/api/login/', (req, res)=>{
	const userData = {
		email_id : 'amit.ramsakal@gmail.com',
		username:'amitupadhyay',
	}
	jwt.sign({user: userData} , 'secretCredentialPersonalityTest',{expiresIn:'30d'}, ( err, token )=>{
		res.json({
		 	token
		});
	});
});

// Final Submit Test Api Route 
app.post("/api/submit_test", verifyToken, (req, res)=>{
		try{ 
			quest.insertTestResult(req.body.data,(err, data)=>{
				if(err){
					throw err;
				}else{
					res.json(data);
				}
			});
		}catch(error){
			res.send(error);
		}
});

//Get all questions Api with access token validy
app.post("/api/get_questions", verifyToken, (req, res)=>{
	jwt.verify(req.token, 'secretCredentialPersonalityTest', (err, authData)=>{
		if(err){
			res.sendStatus(err);
		}else{ 
			quest.getAllQuestions((err, data)=>{
				if(err){
					throw err;
				}else{
					res.json(data);
				}
			});
		}
	});
}); 

//Get all questions Api with access token validy
app.post("/api/get_test_results", (req, res)=>{
	try{
		quest.getResultsByUsername(req.body.data, (err, data)=>{
			if(err){
				throw err;
			}else{
				res.json(data);
			}
		});
	} catch ( error ) { 
		res.status(500).send( error );
	}
}); 

//Format of token
//Authorization: Bearer <access_token>

//Verify token
function verifyToken(req, res, next) {
	//Get the auth header value
	const bearerHeader = req.headers['authorization'];
	//check if bearer is undefined
	if(typeof bearerHeader!== 'undefined'){
		//split at the space
		const bearer = bearerHeader.split(' ');
		//Get token from array
		const bearerToken = bearer[1];
		//Set the token
		req.token = bearerToken;
		next();
	}else{
		res.sendStatus(403);	
	}
}