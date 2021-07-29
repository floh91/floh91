const stripe = require('stripe')('sk_test_WvJOfwZp9WEwNygwuHXgiwLX');
const withAuth = require('../withAuth');

module.exports = function (app, connection) {
    const orderModel = require('../models/OrderModel')(db);
	const beerModel = require('../models/BeerModel')(db);
    
    //sauvegarde une commande
    
        // enregistrement de l'order
        
        
        // enregistrement des orderdetails
        //chaque tour de boucle correspond à un produit
    
            //Pour chaque produit on récupère ses infos dans la bdd en fonction de son id
            
            //on enregistre le prix à l'unité du produit
            
            //sauvegarde de la commande de ce produit (detail) pour notre commande
            
            //prix total : quantité ajoutée au panier * prix à l'unité
            
            //mise à jour de la commande avec son prix total
    
    // gestion du paiement (voir la doc : https://stripe.dev), essayer un peu de trouver une solution dans un premier temps
    
        //getOneOrder
        
        //stripe (indice : paymentIntent)
        
            
    
    // validation du paiement dans un order
    
}