import 'package:flutter/material.dart';
import 'package:graphql_app/data/user/user_data.dart';
import 'package:graphql_app/pages/crud/create_page.dart';
import 'package:graphql_app/pages/crud/list_all_page.dart';
import 'package:graphql_app/stores/home/home_store.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataUser controller = DataUser();
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
                    MaterialPageRoute(builder: (context) => ListAllPage()),
                  );
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Cadastrar'),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreatePage()),
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
