const ClientController = require('../controllers/ClientController').MessageController;

const router = (app) => {
    //Route ==> '/clients'
    app.route('/clients')
        .get(ClientController.getHomePage)

    //Route ==> '/messages/:id'
    app.route('/client/:id')
        .get(ClientController.editClientPage)
        .put(ClientController.editClientId)
        .delete((req, res) => {
            res.send("DELETE ok");
        });

    //Route ==> '/messages/:id'
    app.route('/commande/:id')
        .get(ClientController.getCommandeId)

    //Route par defaut
    app.route('/').
    get(ClientController.getHomePage);
}

module.exports = router;