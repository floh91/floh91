
module.exports = (_db)=>{
    db = _db;
    return BeerModel;
}

class BeerModel {
    //récupération des bières
    static getAllBeers() {
        return db.query('SELECT * FROM beers')
            .then((response)=>{
                return response;
            })
            .catch((err)=>{
                return err;
            })
    }
    
    // récupération d'une bières en fonction de son id
    static getBeer(id) {
        return db.query('SELECT * FROM beers WHERE id=?', [id])
            .then((res) => {
                return res
            })
            .catch((err) => {
                return (err)
            })
    }

    // sauvegarde d'une bière
    static saveBeer() {
        return db.query('INSERT INTO beers (id, name, description, price, photo, quantity, creationTimestamp) VALUES(?, name, description, price, photo, quantity, creationTimestamp) ')
        .then((res) => {
            return res
        })
        .catch((err) => {
            return (err)
        })
    }
    
    // modification d'une bière
    static updateBeer(id) {
        return db.query('UPDATE beers SET name=?, description=?, price=?, quantity=? WHERE id=?', [id])
        .then((res) => {
            return res
        })
        .catch((err) => {
            return (err)
        })
    }
    
    // suppression d'une bière
    static deleteBeer(id) {
        return db.query('DELETE FROM beers WHERE id=?', [id])
        .then((res) => {
            return res
        })
        .catch((err) => {
            return (err)
        })
    }
}