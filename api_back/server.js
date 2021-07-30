const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mysql = require('promise-mysql');
const cors = require('cors');
app.use(cors());
const fileUpload = require('express-fileupload');
app.use(fileUpload({
    createParentPath: true
}));
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(express.static(__dirname + '/public'));

//Exemple d'import de module au sein d'un projet
const myModule = require('./testModule');
myModule();

// Import de toutes mes routes
const beerRoutes = require('./routes/beerRoutes');

// connexion BDD
mysql.createConnection({
	host: "localhost",
	database: "beer4you",
	user: "root",
	password: "",
	port: 3307
}).then((db) => {
    console.log('Connecté à la database');
    setInterval(async function () {
		let res = await db.query('SELECT 1');
	}, 10000);
	
	
	app.get('/', (req, res, next)=>{
		res.json({status: 200, results: "Welcome to api"})
	});
	// appel des routes
	beerRoutes(app, db);
})

const PORT = 8000;
app.listen(PORT, ()=>{
	console.log('Listening port '+PORT+' all is ok');
})