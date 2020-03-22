import 'package:flutter/material.dart';
import 'package:graphql_app/data/user/user_data.dart';
import 'package:graphql_app/model/user/user_mode.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ListAllPage extends StatelessWidget {
  DataUser controller = DataUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar'),
        centerTitle: true,
      ),
      body: Container(
        child: Query(
          options: controller.getAllUsers(),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<User> users = [];
            result.data['users'].forEach((value) {
              users.add(User.fromJson(value));
            });

            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '${users.length} registros encontrados',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return cardUser(users[index]);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget cardUser(User user) {
    return Container(
      color: Colors.blue,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.only(left: 4),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'User: ${user.name}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Email: ${user.email}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Idade: ${user.age}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
