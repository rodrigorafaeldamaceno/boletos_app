const Cliente = require('../../model/cliente')

module.exports = {
  index(_) {
    return Cliente.find()
  },
  show(_, { id, email }) {
    if (id)
      return Cliente.findById(id)

    if (email)
      return Cliente.findOne({ email })
  },
  store(_, { nome, email }) {
    return Cliente.create({ nome, email })
  },
  update(_, { id, nome, email }) {
    return Cliente.findByIdAndUpdate(id, { nome, email })
  },
  destroy(_, { id }) {

    return Cliente.findByIdAndRemove(id)
  },
}