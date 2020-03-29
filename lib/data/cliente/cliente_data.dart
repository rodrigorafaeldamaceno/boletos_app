import 'package:graphql_app/data/cliente/cliente_query_mutation.dart';
import 'package:graphql_app/utils/graphql_configuration/graphql_configuration.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DataCliente {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  ClienteQueryMutation querys = ClienteQueryMutation();

  Future<QueryResult> criarCliente(String nome, String email, String password) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.mutate(
      MutationOptions(
        document: querys.criarCliente(
          nome: nome,
          email: email,
          password: password,
        ),
        update: (Cache cache, QueryResult result) {
          return cache;
        },
        // or do something with the result.data on completion
        onCompleted: (dynamic resultData) {
          print(resultData);
        },
      ),
    );

    return result;
  }

  BaseOptions getAllUsers() {
    // GraphQLClient _client = graphQLConfiguration.clientToQuery();
    // QueryResult result = await _client.query(
    //   QueryOptions(
    //     documentNode: gql(
    //       querys.getAllUsers(),
    //     ),
    //     pollInterval: 10,
    //   ),
    // );
    // List<User> users = [];
    // result.data['users'].forEach((value) {
    //   users.add(User.fromJson(value));
    // });

    // print('Numero de usuarios: ${users.length}');

    // users.forEach((user) {
    //   print(user.id);
    // });

    return QueryOptions(
      documentNode: gql(
        querys.getClientes(),
      ),
      pollInterval: 10,
    );
  }
}
