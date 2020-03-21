const mongoose = require('../database/database')

const BoletoSchema = new mongoose.Schema({
  valor: Number,
  validade: String,
  status: String,
  codigo: String,
  link: String,
  cliente: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Cliente'
  },
  empresa: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Empresa'
  },
})

module.exports = mongoose.model('Boleto', BoletoSchema)