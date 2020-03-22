import 'package:graphql_app/data/user/user_query_mutation.dart';
import 'package:graphql_app/model/user/user_mode.dart';
import 'package:graphql_app/utils/graphql_configuration/graphql_configuration.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DataUser {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  UserQueryMutation querys = UserQueryMutation();

  Future<QueryResult> createUser(String name, String email, String age) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    QueryResult result = await _client.mutate(
      MutationOptions(
        document: querys.createUser(
          name: name,
          email: email,
          age: int.parse(age),
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
        querys.getAllUsers(),
      ),
      pollInterval: 10,
    );
  }
}
