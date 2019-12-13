const fs = require('fs');
const router = require('router');

module.exports = {
    editClientPage: (req, res) => {
        let clientId = req.params.id;

        let query = "SELECT * FROM client WHERE id_client = '" + clientId + "' ";
        db.query(query, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            res.render('edit-client.ejs', {
                title: "Edit  Client"
                ,client: result[0]
                ,message: ''
            });
        });
    },
    editPlayer: (req, res) => {
        let playerId = req.params.id;
        let first_name = req.body.first_name;
        let last_name = req.body.last_name;
        let position = req.body.position;
        let number = req.body.number;

        let query = "UPDATE `players` SET `first_name` = '" + first_name + "', `last_name` = '" + last_name + "', `position` = '" + position + "', `number` = '" + number + "' WHERE `players`.`id` = '" + playerId + "'";
        db.query(query, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            res.redirect('/');
        });
    },
    deleteClient: (req, res) => {
        // let clientId = req.params.id;
        // let deleteUserQuery = 'DELETE FROM client WHERE id_client = "' + clientId + '"';

        // db.query(deleteUserQuery, (err, result) => {
        //     if (err) {
        //         return res.status(500).send(err);
        //     }
        //     res.render('index.ejs', {
        //         message : 'Ce client a bien été supprimé'
        //     });
        // });
    

        router.deleteClient('/client/:id', (req, res) => {
            deleteOne({ _id: req.params.id })
            .then(() => {
                res.json({ success: true });
            })
            .catch(err => {
                res.status.json({ err: err });
            });
        });
    }
};