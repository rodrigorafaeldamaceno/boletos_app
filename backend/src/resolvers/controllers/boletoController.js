const Boleto = require('../../model/boleto')

module.exports = {
  index(_, { cliente, empresa }) {
    return Boleto.find({ cliente, empresa })
  },
  store(_, { valor, validade, status, codigo, link, cliente, empresa }) {
    return Boleto.create({ valor, validade, status, codigo, link, cliente, empresa })
  }
}