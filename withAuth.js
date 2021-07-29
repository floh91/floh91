const jwt = require('jsonwebtoken');
const secret = 'pitichat';

const withAuth = (req, res, next)=> {
    //récupération du token via les headers
    const token = req.headers['x-access-token'];
    //si pas de token ou token undefined
    if ( token === undefined) {
        res.json({
          status: 404,
          msg: "token not found"
        })
    //sinon on va vérifier le token
    } else {
        //verification du token
        jwt.verify(token, secret, (err, decoded)=>{
            //En cas de token invalide on renvoi une réponse
            if(err) {
                res.json({
                  status: 401,
                  msg: "error, your token is invalid"
                })
            //Sinon on renvoi l'id décodé
            } else {
                req.id = decoded.id;
                next();
            }
        })
    }
}

module.exports = withAuth;