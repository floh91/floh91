const bcrypt = require('bcrypt');
const saltRounds = 10;
const jwt = require('jsonwebtoken');
const secret = "pitichat";
const withAuth = require('../withAuth');

module.exports = (app, db)=>{
    
	const userModel = require('../models/UserModel')(db)
	

	// enregistrement d'un membre
	app.post('api/v1/user/:id', (req, res) => {
		.push(req.body)
		res.status(200).json()
	})
	
	// gestion de la connexion des membres
	
		// on teste les mot de passe (utilisation de bcrypt)
		
			//si OK
			
				//on crée ensuite un token contenant l'email et l'id (avec jwt)
				//on renvoi une réponse en format json contenant un status 200, token et l'id utilisateur
			
			//sinon on renvoi une erreur 'wrong password' par exemple

	//modification des utilisateurs
	
	
}