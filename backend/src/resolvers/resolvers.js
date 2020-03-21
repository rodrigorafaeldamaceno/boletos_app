//define as resolvers ou 'rotas' da aplicação
const clientes = require('./controllers/clienteController')
const boletos = require('./controllers/boletoController')
const empresas = require('./controllers/empresaController')



module.exports = {
  Query: {
    getClientes: clientes.index,
    getCliente: clientes.show,

    getEmpresas: empresas.index,

    //boletos: boletos.getBoletos
  },
  Mutation: {
    criarCliente: clientes.store,
    editarCliente: clientes.update,
    deletarCliente: clientes.destroy,

    criarEmpresa: empresas.store

    //criarBoleto: boletos.criarBoleto
  }

}

/*
  valor: Number,
  validade: String,
  status: String,
  codigo: String,
  link: String,
  cliente: {
    type: moongose.Schema.Types.ObjectId, ref: 'Cliente'
  },
  empresa: {
    type: moongose.Schema.Types.ObjectId, ref: 'Empresa'
  },
  */


