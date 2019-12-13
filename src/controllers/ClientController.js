
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
                quote: "AJAX is great!",
                client : false

            });
        });
    },

    editClientId: (req, res, next) => {

        let clientId = req.params.id;

        console.log(req.body);
        
        let query2 = "SELECT * FROM client"; 
        let query  = "SELECT * FROM client WHERE id_client = '" + clientId + "' ";

        function client() {
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

        function updateClient() {
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

        updateClient().then(function(data){
            client().then(function(data2){
               console.log(data)
               console.log(data2)
               next();
            })
        });

    },

    editClientPage: (req, res, next) => {

        let clientId = req.params.id;
        
        let query = "SELECT * FROM client"; 
        let query2 = "SELECT * FROM client WHERE id_client = '" + clientId + "' ";

        function client() {
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

        client().then(function(data){
            clientById().then(function(data2){
                res.render('index.ejs', {
                    title: "List Des Clients"
                    ,clients: data,
                    quote: "AJAX is great!",
                    client : data2[0]
                });
                next();
            })
        });
    },

    postClient: (req, res) => {

        let query = "SELECT * FROM client"; 
        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('index.ejs',{
                title: 'An Ajax Example',
                clients: result,
                quote: req.body.quote,
                client : false
            });
        });
    }
}
