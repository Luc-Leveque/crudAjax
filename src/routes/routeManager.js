const ClientController = require('../controllers/ClientController').MessageController;

const router = (app) => {
    //Route ==> '/clients'
    app.route('/clients')
        .get(ClientController.getHomePage)


    app.route('/client/:id')
        .get(ClientController.editClientPage)
        .put(ClientController.editClientId)
        .delete(ClientController.deleteClientId);

    app.route('/commande/:id')
        .get(ClientController.getCommandeId)

    //Route par defaut
    app.route('/').
    get(ClientController.getHomePage);
}

module.exports = router;