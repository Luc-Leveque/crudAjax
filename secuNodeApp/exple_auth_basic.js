const auth = require('basic-auth');
const app = require('express')();
var credentials = {
username: 'Mad',
password: 'Ani',
realm: 'Basic Authentication'
};
app.use((req, res, next) => {
let user = auth(req);
console.log(user);
if (user === undefined || user['name'] !== credentials.username
|| user['pass'] !== credentials.password) {
res.statusCode = 401;
res.setHeader('WWW-Authenticate', credentials.realm);
//ou bien res.writeHead(401, { 'WWW-Authenticate': credentials.realm });
res.end('Authorization is needed.');
} else next();
});
app.get("/", function (request, response) {
response.end('Congratulations!!!! You are successfully authenticated by Basic');
});
app.listen(8081);
console.log('Server running at http://127.0.0.1:8081/');