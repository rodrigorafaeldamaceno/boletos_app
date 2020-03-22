import 'package:flutter/foundation.dart';

class UserQueryMutation {
  String createUser(
      {@required String name, @required String email, @required int age}) {
    return '''
      mutation {
        createUser(name:"$name", email:"$email", age:$age){
          name
        }
      }
    ''';
  }

  String getAllUsers() {
    return '''
      query getAllUsers {
        users {
          id
          name
          email
          age
        }
      }
    ''';
  }

  String getUser(String id) {
    return '''
      query getUser{
        user(id:"$id"){
          name
          email
        }
      }
    ''';
  }

  String editUser({@required int id, String name, String email, int age}) {
    return '''
      mutation editUsers{
        editUsers(id:"$id", name:"$name", email:"$email", age:$age){
          name
        }
      }
    ''';
  }

  String deleteUser(int id) {
    return '''
      mutation deleteUser{
        deleteUser(id:"$id"){
          name
        }
      }
    ''';
  }
}
