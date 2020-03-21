const Empresa = require('../../model/empresa')

module.exports = {
  index(_, ) {
    return Empresa.find()
  },
  store(_, { nome, email, cnpj, telefone }) {
    return Empresa.create({ nome, email, cnpj, telefone })
  }
}