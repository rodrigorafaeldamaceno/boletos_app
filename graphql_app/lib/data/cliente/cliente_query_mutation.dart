import 'package:flutter/foundation.dart';

class ClienteQueryMutation {
  String criarCliente(
      {@required String nome,
      @required String email,
      @required String password}) {
    return '''
     mutation criarCliente{
      criarCliente(
        nome:"$nome"
        email:"$email"
        password: "$password"
      ){
        nome
        email
      }
    }
    ''';
  }

  String getClientes() {
    return '''
      query getClientes{
        getClientes{
          id
          nome
          email
        }
      }
    ''';
  }

  String getCliente(String id, String email, String password) {
    return '''
      query getCliente{
        getCliente(
          id:"$id"
          email:"$email", password:"$password"){
          id
          nome
          email
        }
      }
    ''';
  }

  String editarCliente({@required int id, String name, String email, int age}) {
    return '''
      mutation editUsers{
        editUsers(id:"$id", name:"$name", email:"$email", age:$age){
          name
        }
      }
    ''';
  }

  String deletarCliente(String id) {
    return '''
      mutation deletarCliente{
        deletarCliente(id:"$id"){
          nome
          email
        }
      }
    ''';
  }
}
