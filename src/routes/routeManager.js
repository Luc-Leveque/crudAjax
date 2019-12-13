const ClientController = require('../controllers/ClientController').MessageController;


const router = (app) => {
    //Route ==> '/clients'
    app.route('/clients')
        .get(ClientController.getHomePage)
        .post(ClientController.postClient);

    //Route ==> '/messages/:id'
    app.route('/client/:id')
        .get(ClientController.editClientPage)
        .put((req, res) => {
            res.send("PUT ok");
        })
        .delete((req, res) => {
            res.send("DELETE ok");
        });

    //Route par defaut
    app.route('/').
    get(ClientController.getHomePage);
}

module.exports = router;