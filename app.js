const express = require('express');
const bodyParser = require('body-parser');
const router = require('./src/routes/routeManager');

const mysql = require('mysql');

const app = express();
const PORT = 5000;


app.post(function(req, res, next){
    next();
});

// create connection to database
// the mysql.createConnection function takes in a configuration object which contains host, user, password and the database name.
const db = mysql.createConnection ({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'Ynov_WS_APIRest'
});

// connect to database
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to database');
});
global.db = db;

//MIDDLEWARE
app.use(express.json());

//ROUTES
router(app);

//Demarrage du serveur
app.listen(PORT);
