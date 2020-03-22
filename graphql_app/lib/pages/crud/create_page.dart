import 'package:flutter/material.dart';
import 'package:graphql_app/data/user/user_data.dart';
import 'package:graphql_app/pages/crud/list_all_page.dart';

class CreatePage extends StatelessWidget {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtAge = TextEditingController();

  DataUser controller = DataUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: <Widget>[
              customTextField('Nome', txtName),
              SizedBox(height: 10),
              customTextField(
                'Email',
                txtEmail,
                type: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              customTextField(
                'Idade',
                txtAge,
                type: TextInputType.number,
              ),
              SizedBox(height: 30),
              RaisedButton(
                onPressed: () async {
                  await controller.createUser(
                    txtName.text,
                    txtEmail.text,
                    txtAge.text,
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ListAllPage()),
                  );
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextField(String label, TextEditingController controller,
      {TextInputType type: TextInputType.text}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: type,
    );
  }
}
