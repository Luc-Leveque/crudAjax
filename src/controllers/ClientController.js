
var Promise = require('promise');
var bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
var vicopo =  require('vicopo');

const app = (require('express'))();
const crypt = require('crypto');

//2.
var credentials = {
    userName: 'Mad',
    password: 'Ani',
    realm: 'Digest Authentication'
};

//3.
function cryptoUsingMD5(data) {
    return crypt.createHash('md5').update(data).digest('hex');
}

//4.
var hash = cryptoUsingMD5(credentials.realm);
//5.
function authenticateUser(res) {
    let header = 'Digest realm="' + credentials.realm + '",qop="auth",nonce="' +
    Math.random() + '",opaque="' + hash + '"' ;
    console.log({ 'WWW-Authenticate':header });
    res.writeHead(401, { 'WWW-Authenticate': header });
    res.end('Authorization is needed.');
}

function verifAuthentication(Request) {
    //8. en absence des données d’entification, les réclamer
    if (!request.headers.authorization) {
        authenticateUser(response);
        return;
    }
    //9.
    let authInfo = request.headers.authorization.replace(/^Digest /, '');
    authInfo = parseAuthenticationInfo(authInfo);

    //10. Si le username ne correspond pas, réclamer une authentification
    if (authInfo.username !== credentials.userName) {
        authenticateUser(response);
        return;
    }

    //11. constitué un objet crypter avec les info d’authentification
    digestAuthObject.ha1 = cryptoUsingMD5(authInfo.username + ':' + credentials.realm
    + ':' + credentials.password);

    //12.
    digestAuthObject.ha2 = cryptoUsingMD5(request.method + ':' + authInfo.uri);

    //13.
    var resp = cryptoUsingMD5([
        digestAuthObject.ha1,
        authInfo.nonce,
        authInfo.nc,
        authInfo.cnonce,
        authInfo.qop,
        digestAuthObject.ha2
    ].join(':'));

    digestAuthObject.response = resp;

    //14. comparer les données d’authentification reçus avec
    //celles récupérées après les ceyptage
    if (authInfo.response !== digestAuthObject.response) {
        authenticateUser(response); //Si échec, réclamer une authentification
        return;
    }

    return true;
}

function parseAuthenticationInfo(authData) {
    var authenticationObj = {};
    authData.split(', ').forEach(function (d) {
        d = d.split('=');
        authenticationObj[d[0]] = d[1].replace(/"/g, '');
    });

    console.log(JSON.stringify(authenticationObj));
    return authenticationObj;
}


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

        function insertVille() {
            return new Promise(function(resolve,reject) {
                db.query('INSERT INTO ville SET ?', {nom: req.body.ville , code_postal : '00000'}, function(err, result) {
                    if (err) throw err;
                  
                    resolve(result.insertId);
                  });
            });
        }
        
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

        function updateClient(idVille) {
            let query  = " UPDATE client SET nom= '" + req.body.nom + 
            "', prenom='" + req.body.prenom +
            "',`adresse`='" + req.body.adresse + 
            "',`civilite`='" + req.body.civilite + 
            "',`id_ville`='" + idVille + 
            "'  WHERE  id_client = '" + clientId + "'";
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

        insertVille().then(function(insertId){
            let idVille = insertId;
            updateClient(idVille).then(function(data){
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

    
    deleteClientId: (req, res, next) => {

        let clientId = req.params.id;

        let query = "DELETE FROM client WHERE id_client = '" + clientId + "'" ;
        let query2 = "SELECT * FROM client"; 
        
        function deleteClientByIdClient() {
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


        deleteClientByIdClient().then(function(data){ 
            client().then(function(data2){ 
                res.render('index.ejs', {
                    title: false
                    ,clients: data2,
                    client : false,
                    commandes: false,
                    produits: false,
                });
                next();
            })
        },
            function(data){ 
                res.send(data); 
            }
        );
    },

}
