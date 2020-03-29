import 'package:flutter/material.dart';
import 'package:graphql_app/data/cliente/cliente_data.dart';
import 'package:graphql_app/pages/cliente/listar_clientes.dart';
import 'package:graphql_app/stores/home/home_store.dart';

class HomeAdmScreen extends StatefulWidget {
  @override
  _HomeAdmScreenState createState() => _HomeAdmScreenState();
}

class _HomeAdmScreenState extends State<HomeAdmScreen> {
  DataCliente controller = DataCliente();
  HomeStore store = HomeStore();

  @override
  void initState() {
    store.initOneSignal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GraphQL'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Listar Todos'),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListarClientesScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListarClientesScreen(),
                    ),
                  );
                  // await controller.createUser('flutter', 'flutter', '15');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
