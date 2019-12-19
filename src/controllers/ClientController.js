
var Promise = require('promise');

exports.MessageController = {

    getHomePage: (req, res) => {
        let query = "SELECT * FROM client"; 
        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('index.ejs', {
                title: "List Des Clients"
                ,clients: result,
                client : false,
                commandes : false,
                produits: false,

            });
        });
    },

    editClientId: (req, res, next) => {

        let clientId = req.params.id;


        
        let query2 = "SELECT * FROM client"; 

        let query  = " UPDATE client SET nom= '" + req.body.nom + 
        "', prenom='" + req.body.prenom +
        "',`adresse`='" + req.body.adresse + 
        "',`civilite`='" + req.body.civilite + 
        "'  WHERE  id_client = '" + clientId + "'";

        function client() {
            return new Promise(function(resolve,reject) {
                db.query(query2, (err, result) => {
                    if (err) {
                        reject(err)
                    } else {
                        resolve(result);
                    }
                });
            });
        }

        function updateClient() {
            return new Promise(function(resolve,reject) {
                db.query(query, (err, result) => {
                    if (err) {
                        reject(err)
                    } else {
                        resolve(result);
                    }
                });
            });
        }

        updateClient().then(function(data){
            client().then(function(data2){

                res.render('index.ejs', {
                    title: "List Des Clients"
                    ,clients: data2,
                    client : false,
                    commandes : false,
                    produits: false,
                });
               next();
            })
        });

    },

    editClientPage: (req, res, next) => {

        let clientId = req.params.id;
        
        
        let query2 = "SELECT  id_client, prenom, adresse, civilite, client.nom as nomClient, ville.nom as nomVille , client.id_ville as clientIdVille FROM  client , ville WHERE  ((client.id_ville IS NOT NULL AND client.id_ville = ville.id_ville) OR (client.id_ville is NULL)) AND id_client =  '" + clientId + "' LIMIT 1 ";
        let query3 = "SELECT  numero , date_commande, id_client, id_commande FROM commande where id_client =  '" + clientId + "'";

        function clientById() {
            return new Promise(function(resolve,reject) {
                db.query(query2, (err, result) => {
                    if (err) {
                        reject(err)
                    } else {
                        resolve(result);
                    }
                });
            });
        }

        function getCommandeByIdClient() {
            return new Promise(function(resolve,reject) {
                db.query(query3, (err, result) => {
                    if (err) {
                        reject(err)
                    } else {
                        resolve(result);
                    }
                });
            });
        }

        clientById().then(function(data2){
            getCommandeByIdClient().then(function(data3){ 
                res.render('partials/client.ejs', {
                    title: false
                    ,clients: false,
                    client : data2[0],
                    commandes: data3,
                    produits: false,
                });
                next();
            })
        });
    },

    getCommandeId: (req, res, next) => {

        let commandeId = req.params.id;


        let query =  "Select p.id_produit, p.libelle, cp.quantite, cp.prix_unitaire, cp.taux_remise "
                   + "From commande_produit cp , produit p "
                   + "Where cp.id_produit = p.id_produit "
                   + "And cp.id_commande = '" + commandeId + "'" ;
        

        function getCommandeByIdCommande() {
            return new Promise(function(resolve,reject) {
                db.query(query, (err, result) => {
                    if (err) {
                        reject(err)
                    } else {
                        resolve(result);
                    }
                });
            });
        }


        getCommandeByIdCommande().then(function(data){ 
            res.render('partials/commande.ejs', {
                title: false
                ,clients: false,
                client : false,
                commandes: false,
                produits: data,
            });
            next();
        });
    },
}
