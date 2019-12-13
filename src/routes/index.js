// module.exports = {
//     getHomePage: (req, res) => {
//         let query = "SELECT * FROM client"; 

//         // execute query
//         db.query(query, (err, result) => {
//             if (err) {
//                 res.redirect('/');
//             }
//             res.render('index.ejs', {
//                 title: "List Des Clients"
//                 ,clients: result
//             });
//         });
//     },
// };