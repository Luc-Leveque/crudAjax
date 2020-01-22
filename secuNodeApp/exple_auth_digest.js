//1.
const app = (require('express'))();
const crypt = require('crypto');
//2.
var credentials = {
userName: 'Mad',
password: 'Ani',
realm: 'Digest Authentication'
};
//3.
function cryptoUsingMD5(data) {
return crypt.createHash('md5').update(data).digest('hex');
}
//4.
var hash = cryptoUsingMD5(credentials.realm);
//5.
function authenticateUser(res) {
    let header = 'Digest realm="' + credentials.realm + '",qop="auth",nonce="' +
    Math.random() + '",opaque="' + hash + '"' ;
    console.log({ 'WWW-Authenticate':header });
    res.writeHead(401, { 'WWW-Authenticate': header });
    res.end('Authorization is needed.');
}

function parseAuthenticationInfo(authData) {
    var authenticationObj = {};
    authData.split(', ').forEach(function (d) {
        d = d.split('=');
        authenticationObj[d[0]] = d[1].replace(/"/g, '');
    });

    console.log(JSON.stringify(authenticationObj));
    return authenticationObj;

}

//7.
app.get("/", function (request, response) {
    let digestAuthObject = {};

    //8. en absence des données d’entification, les réclamer
    if (!request.headers.authorization) {
        authenticateUser(response);
        return;
    }
    //9.
    let authInfo = request.headers.authorization.replace(/^Digest /, '');
    authInfo = parseAuthenticationInfo(authInfo);

    //10. Si le username ne correspond pas, réclamer une authentification
    if (authInfo.username !== credentials.userName) {
        authenticateUser(response);
        return;
    }

    //11. constitué un objet crypter avec les info d’authentification
    digestAuthObject.ha1 = cryptoUsingMD5(authInfo.username + ':' + credentials.realm
    + ':' + credentials.password);

    //12.
    digestAuthObject.ha2 = cryptoUsingMD5(request.method + ':' + authInfo.uri);

    //13.
    var resp = cryptoUsingMD5([
        digestAuthObject.ha1,
        authInfo.nonce,
        authInfo.nc,
        authInfo.cnonce,
        authInfo.qop,
        digestAuthObject.ha2
    ].join(':'));

    digestAuthObject.response = resp;

    //14. comparer les données d’authentification reçus avec
    //celles récupérées après les ceyptage
    if (authInfo.response !== digestAuthObject.response) {
        authenticateUser(response); //Si échec, réclamer une authentification
        return;
    }

    response.end('Congratulations!!!! You are successfully authenticated by Digest');
});

app.listen(8081);
console.log('Server running at http://127.0.0.1:8081/');