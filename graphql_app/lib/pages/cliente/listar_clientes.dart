import 'package:flutter/material.dart';
import 'package:graphql_app/data/cliente/cliente_data.dart';
import 'package:graphql_app/model/cliente/cliente_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ListarClientesScreen extends StatelessWidget {
  DataCliente controller = DataCliente();
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

            List<Cliente> users = [];
            result.data['users'].forEach((value) {
              users.add(Cliente.fromJson(value));
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

  Widget cardUser(Cliente cliente) {
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
              'User: ${cliente.nome}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Email: ${cliente.email}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
