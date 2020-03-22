import 'package:flutter/material.dart';

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
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 4,
          ),
          child: ExpansionTile(
            title: Text(
              "Ultimos boletos",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
