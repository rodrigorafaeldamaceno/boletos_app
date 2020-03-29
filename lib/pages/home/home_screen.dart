import 'package:flutter/material.dart';
import 'package:graphql_app/pages/boletos/card_boleto_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rodrigo Rafael"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          
          child: CardBoletosHome(),
        ),
      ),
    );
  }
}
