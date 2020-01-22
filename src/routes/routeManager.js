const ClientController = require('../controllers/ClientController').MessageController;

const router = (app) => {

    app.use((req, res, next) => {
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
        res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
        next();
      });

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