const Cliente = require('../../model/cliente')

module.exports = {
  index(_) {
    return Cliente.find()
  },
  show(_, { id }) {
    return Cliente.findById(id)
  },
  store(_, { nome, email }) {
    return Cliente.create({ nome, email })
  },
  update(_, { id, nome, email }) {
    Cliente.findByIdAndUpdate(id, { nome, email })
  },
  destroy(_, { id }) {
    Cliente.findByIdAndRemove(id)
  },
}