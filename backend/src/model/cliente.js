const mongoose = require('../database/database')

const ClienteSchema = new mongoose.Schema({
  nome: String,
  email: String,
})

module.exports = mongoose.model('Cliente', ClienteSchema)