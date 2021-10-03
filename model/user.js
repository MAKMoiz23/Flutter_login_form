const mongoose = require('mongoose');


const userSchema = mongoose.Schema({
    email: String,
    password: String,
})


const fUser = mongoose.model('fUser', userSchema);

module.exports = fUser;