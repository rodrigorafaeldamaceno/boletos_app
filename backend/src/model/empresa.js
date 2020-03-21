const mongoose = require('../database/database')

const EmpresaSchema = new mongoose.Schema({
  nome: String,
  email: String,
  cnpj: String,
  telefone: String
})

module.exports = mongoose.model('Empresa', EmpresaSchema)