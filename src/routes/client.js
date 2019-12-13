// const fs = require('fs');

// module.exports = {
//     editClientPage: (req, res) => {
//         let clientId = req.params.id;

//         let query = "SELECT * FROM client WHERE id_client = '" + clientId + "' ";
//         db.query(query, (err, result) => {
//             if (err) {
//                 return res.status(500).send(err);
//             }
//             res.render('edit-client.ejs', {
//                 title: "Edit  Client"
//                 ,client: result[0]
//                 ,message: ''
//             });
//         });
//     },
//     editClient: (req, res) => {

//         console.log(req.body)

//         let clientId = req.params.id;
//         let prenom = req.body.prenom;
//         let nom = req.body.nom;
//         let adresse = req.body.adresse;


//         let query = "UPDATE `client` SET `prenom` = '" + prenom + "', `nom` = '" + nom + "', `adresse` = '" + adresse + "' WHERE `id_client` = '" + clientId + "'";
//         db.query(query, (err, result) => {
//             if (err) {
//                 return res.status(500).send(err);
//             }
//             res.redirect('/');
//         });
//     },

//     deletePlayer: (req, res) => {
//         let playerId = req.params.id;
//         let getImageQuery = 'SELECT image from `players` WHERE id = "' + playerId + '"';
//         let deleteUserQuery = 'DELETE FROM players WHERE id = "' + playerId + '"';

//         db.query(getImageQuery, (err, result) => {
//             if (err) {
//                 return res.status(500).send(err);
//             }

//             let image = result[0].image;

//             fs.unlink(`public/assets/img/${image}`, (err) => {
//                 if (err) {
//                     return res.status(500).send(err);
//                 }
//                 db.query(deleteUserQuery, (err, result) => {
//                     if (err) {
//                         return res.status(500).send(err);
//                     }
//                     res.redirect('/');
//                 });
//             });
//         });
//     }
// };