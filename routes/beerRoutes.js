const fs = require('fs');
const withAuth = require('../withAuth');

module.exports = (app, db)=>{
    
    //import de beerModel
	const beerModel = require('../models/BeerModel')(db)
	// route permettant de récupérer toutes les bières
	app.get('/api/v1/beer/all', async (req, res, next)=>{
		//récuperation de la réponse renvoyée par beerModel.getAllBeers() et stockage dans une variable beers
	    let beers = await beerModel.getAllBeers();
	    console.log('beers', beers);
	    
	    //si code d'erreur
	    if(beers.code) {
	    	//on retourne une reponse d'erreur formatée en json
	        res.json({status: 500, msg:'il y a eu un problème !', result: beers});
	    }
	    
	    //Si tout c'est bien passé, on retourne nos bières au format json
	    res.json({status: 200, result: beers});
	})
	
	// route permettant de récupérer une bière en fonction de son id
	/* app.get('/api/v1/beer/:id', (req, res) => {
		const id = req.params.id
		const beer = 
		res.status(200).json()
	})

	// route permettant d'enregister une bières
	app.post('/api/v1/beer/', (req, res) => {
		.push(req.body)
		res.status(200).json()
	})

	// route permettant d'enregister la photo d'une bière
	app.post('/api/v1/beer/:id', (req, res) => {

	})

	// route permettant de modifier une bière
	app.put('/api/v1/beer/:id', (req, res) => {

	})
	
	// route permettant de supprimer une bière
	app.delete('/api/v1/beer/:id', (req, res) => {
		const id = parseInt(req.params.id)

	}) */
	
}