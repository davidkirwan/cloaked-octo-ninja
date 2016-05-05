/* ##########################################
#  Working with the crypto library in Node
#  to generate a hash of a password
*/

var crypto = require('crypto');

var salt = "the salt";
var password = "my passw0rd";
var salt_plus_password = salt + password;

// Generate the password hash
// https://masteringmean.com/lessons/46-Encryption-and-password-hashing-with-Nodejs
var secret_key = "4463662bbaab92a27c80d01c3";
var hash = crypto.createHmac("sha1", secret_key).update(salt_plus_password).digest('hex');
console.log(hash);
